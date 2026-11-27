import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/standalone_door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/standalone_door_sensor_records_state.dart';

part 'standalone_door_sensor_records_notifier.g.dart';

@Riverpod()
class StandaloneDoorSensorRecordsNotifier
    extends _$StandaloneDoorSensorRecordsNotifier {
  static const _pageSize = 20;

  int _doorSensorId = 0;
  bool _loadingMore = false;

  StandaloneDoorSensorDomain get _domain =>
      ref.read(standaloneDoorSensorDomainProvider.notifier);

  @override
  Future<StandaloneDoorSensorRecordsState> build(int doorSensorId) async {
    _doorSensorId = doorSensorId;
    return StandaloneDoorSensorRecordsState(
      pageState: await _loadPage(doorSensorId, 1, const []),
    );
  }

  PageState<StandaloneDoorSensorRecordEntity> _pageStateFromPageList({
    required List<StandaloneDoorSensorRecordEntity> pageList,
    required List<StandaloneDoorSensorRecordEntity> merged,
    required int currentPage,
  }) {
    final total = pageList.length == _pageSize
        ? merged.length + 1
        : merged.length;
    return PageState(
      data: merged,
      currentPage: currentPage,
      pageSize: _pageSize,
      total: total,
    );
  }

  Future<PageState<StandaloneDoorSensorRecordEntity>> _loadPage(
    int doorSensorId,
    int pageNo,
    List<StandaloneDoorSensorRecordEntity> previous,
  ) async {
    final r = await _domain
        .listRecord(doorSensorId, pageNo: pageNo, pageSize: _pageSize)
        .run();
    return r.fold((err) => throw err, (pageList) {
      final merged = [...previous, ...pageList];
      return _pageStateFromPageList(
        pageList: pageList,
        merged: merged,
        currentPage: pageNo,
      );
    });
  }

  Future<void> refresh() async {
    final page = await _loadPage(_doorSensorId, 1, const []);
    state = AsyncValue.data(StandaloneDoorSensorRecordsState(pageState: page));
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.pageState.hasMore || _loadingMore) return;
    _loadingMore = true;
    try {
      final next = current.pageState.currentPage + 1;
      final page = await _loadPage(_doorSensorId, next, current.pageState.data);
      state = AsyncValue.data(
        StandaloneDoorSensorRecordsState(pageState: page),
      );
    } finally {
      _loadingMore = false;
    }
  }
}
