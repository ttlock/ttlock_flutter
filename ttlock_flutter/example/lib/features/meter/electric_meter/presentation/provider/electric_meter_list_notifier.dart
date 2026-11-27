import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_list_state.dart';

part 'electric_meter_list_notifier.g.dart';

@Riverpod()
class ElectricMeterListNotifier extends _$ElectricMeterListNotifier {
  bool _loadingMore = false;

  @override
  Future<ElectricMeterListState> build() async {
    final page = await _loadPage(1);
    return ElectricMeterListState(pageState: page);
  }

  Future<PageState<ElectricMeterEntity>> _loadPage(int pageNo) async {
    final r = await ref
        .read(electricMeterDomainProvider.notifier)
        .list(pageNo: pageNo)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final page = await _loadPage(1);
    state = AsyncValue.data(ElectricMeterListState(pageState: page));
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
        ElectricMeterListState(
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
