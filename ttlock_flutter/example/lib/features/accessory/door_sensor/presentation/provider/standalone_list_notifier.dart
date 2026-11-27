import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_list_state.dart';

part 'standalone_list_notifier.g.dart';

@Riverpod()
class StandaloneDoorSensorListNotifier
    extends _$StandaloneDoorSensorListNotifier {
  bool _loadingMore = false;

  @override
  Future<StandaloneDoorSensorListState> build() async {
    final page = await _loadPage(1);
    return StandaloneDoorSensorListState(pageState: page);
  }

  Future<PageState<StandaloneDoorSensorEntity>> _loadPage(int pageNo) async {
    final r = await ref
        .read(standaloneDoorSensorDomainProvider.notifier)
        .list(pageNo: pageNo)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final page = await _loadPage(1);
    state = AsyncValue.data(StandaloneDoorSensorListState(pageState: page));
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
        StandaloneDoorSensorListState(
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
