import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/presentation/provider/door_sensor_records_notifier.dart';

typedef _Call = ({int lockId, int pageNo, int pageSize});

class _FakeDomain extends DoorSensorDomain {
  _FakeDomain(this._onList);
  final TaskEither<AppException, PageState<DoorSensorRecordEntity>> Function(
    _Call,
  )
  _onList;

  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<DoorSensorRecordEntity>> listRecord(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _onList((lockId: lockId, pageNo: pageNo, pageSize: pageSize));
}

const _r1 = DoorSensorRecordEntity(recordId: 1, recordType: 30, success: true);
const _r2 = DoorSensorRecordEntity(recordId: 2, recordType: 31, success: true);

void main() {
  late List<_Call> calls;
  late ProviderContainer container;

  ProviderContainer make(
    TaskEither<AppException, PageState<DoorSensorRecordEntity>> Function(_Call)
    onList,
  ) {
    calls = [];
    final c = ProviderContainer(
      overrides: [
        doorSensorDomainProvider.overrideWith(
          () => _FakeDomain((call) {
            calls.add(call);
            return onList(call);
          }),
        ),
      ],
    );
    addTearDown(c.dispose);
    container = c;
    c.listen(doorSensorRecordsProvider(9), (_, _) {});
    return c;
  }

  test('build 拉第 1 页', () async {
    make(
      (call) => TaskEither.right(
        PageState(data: const [_r1], currentPage: 1, pageSize: 20, total: 1),
      ),
    );
    final state = await container.read(doorSensorRecordsProvider(9).future);
    expect(state.pageState.data.single.recordId, 1);
    expect(calls.single.pageNo, 1);
    expect(calls.single.lockId, 9);
  });

  test('loadMore 累加', () async {
    make((call) {
      final list = call.pageNo == 1 ? const [_r1] : const [_r2];
      return TaskEither.right(
        PageState(data: list, currentPage: call.pageNo, pageSize: 20, total: 2),
      );
    });
    final n = container.read(doorSensorRecordsProvider(9).notifier);
    await container.read(doorSensorRecordsProvider(9).future);
    await n.loadMore();
    final page = container.read(doorSensorRecordsProvider(9)).value!.pageState;
    expect(page.data.map((e) => e.recordId).toList(), [1, 2]);
    expect(page.hasMore, isFalse);
  });

  test('失败 → AsyncError', () async {
    make((_) => TaskEither.left(AppException.unknown(message: 'boom')));
    container.read(doorSensorRecordsProvider(9));
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(container.read(doorSensorRecordsProvider(9)).hasError, isTrue);
  });
}
