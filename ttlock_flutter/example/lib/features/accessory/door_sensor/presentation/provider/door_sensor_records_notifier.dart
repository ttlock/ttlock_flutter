import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/door_sensor_records_state.dart';

part 'door_sensor_records_notifier.g.dart';

@Riverpod()
class DoorSensorRecordsNotifier extends _$DoorSensorRecordsNotifier {
  static const _pageSize = 20;

  int _lockId = 0;
  bool _loadingMore = false;

  DoorSensorDomain get _domain => ref.read(doorSensorDomainProvider.notifier);

  @override
  Future<DoorSensorRecordsState> build(int lockId) async {
    _lockId = lockId;
    return DoorSensorRecordsState(pageState: await _loadPage(lockId, 1));
  }

  Future<PageState<DoorSensorRecordEntity>> _loadPage(
    int lockId,
    int pageNo,
  ) async {
    final r = await _domain
        .listRecord(lockId, pageNo: pageNo, pageSize: _pageSize)
        .run();
    return r.fold((err) => throw err, (page) => page);
  }

  Future<void> refresh() async {
    final page = await _loadPage(_lockId, 1);
    state = AsyncValue.data(DoorSensorRecordsState(pageState: page));
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.pageState.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = current.pageState.currentPage + 1;
      final page = await _loadPage(_lockId, next);
      final cur = current.pageState;
      state = AsyncValue.data(
        DoorSensorRecordsState(
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
