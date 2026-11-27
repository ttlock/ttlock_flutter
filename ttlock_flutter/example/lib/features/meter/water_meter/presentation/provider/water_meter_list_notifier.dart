import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_list_state.dart';

part 'water_meter_list_notifier.g.dart';

@Riverpod()
class WaterMeterListNotifier extends _$WaterMeterListNotifier {
  bool _loadingMore = false;

  @override
  Future<WaterMeterListState> build() async {
    final page = await _loadPage(1);
    return WaterMeterListState(pageState: page);
  }

  Future<PageState<WaterMeterEntity>> _loadPage(int pageNo) async {
    final r = await ref
        .read(waterMeterDomainProvider.notifier)
        .list(pageNo: pageNo)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final page = await _loadPage(1);
    state = AsyncValue.data(WaterMeterListState(pageState: page));
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.pageState.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = current.pageState.currentPage + 1;
      final page = await _loadPage(next);
      final cur = current.pageState;
      state = AsyncValue.data(
        WaterMeterListState(
          pageState: PageState(
            data: [...cur.data, ...page.data],
            currentPage: next,
            pageSize: cur.pageSize,
            total: page.total,
          ),
        ),
      );
    } finally {
      _loadingMore = false;
    }
  }
}
