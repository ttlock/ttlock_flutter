import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_operation_record_filter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_operation_records_state.dart';

part 'water_meter_operation_records_notifier.g.dart';

/// 操作记录页：筛选 chips + 分页列表（spec §6.4）。
@Riverpod()
class WaterMeterOperationRecordsNotifier
    extends _$WaterMeterOperationRecordsNotifier {
  static const _pageSize = 20;

  int _meterId = 0;
  bool _loadingMore = false;

  WaterMeterDomain get _domain => ref.read(waterMeterDomainProvider.notifier);

  @override
  Future<WaterMeterOperationRecordsState> build(int meterId) async {
    _meterId = meterId;
    return WaterMeterOperationRecordsState(
      pageState: await _loadPage(meterId, 1, null),
    );
  }

  Future<PageState<MeterOperationRecordEntity>> _loadPage(
    int meterId,
    int pageNo,
    MeterOperationRecordFilter? filter,
  ) async {
    final r = await _domain
        .listOperationRecords(
          meterId,
          pageNo: pageNo,
          pageSize: _pageSize,
          recordType: filter?.value,
        )
        .run();
    return r.fold((err) => throw err, (page) {
      return PageState(
        data: page.list,
        currentPage: page.pageNo,
        pageSize: page.pageSize,
        total: page.total,
      );
    });
  }

  Future<void> refresh() async {
    final filter = state.value?.filter;
    final page = await _loadPage(_meterId, 1, filter);
    state = AsyncValue.data(
      WaterMeterOperationRecordsState(pageState: page, filter: filter),
    );
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.pageState.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = current.pageState.currentPage + 1;
      final page = await _loadPage(_meterId, next, current.filter);
      final cur = current.pageState;
      state = AsyncValue.data(
        WaterMeterOperationRecordsState(
          pageState: PageState(
            data: [...cur.data, ...page.data],
            currentPage: next,
            pageSize: cur.pageSize,
            total: page.total,
          ),
          filter: current.filter,
        ),
      );
    } finally {
      _loadingMore = false;
    }
  }

  /// 切换筛选重查第一页：无页面级指示，借用全局 loading。
  Future<void> setFilter(MeterOperationRecordFilter? filter) async {
    final page = await withGlobalLoading(
      () => _loadPage(_meterId, 1, filter),
      status: ref.read(l10nProvider).loading,
    );
    state = AsyncValue.data(
      WaterMeterOperationRecordsState(pageState: page, filter: filter),
    );
  }
}
