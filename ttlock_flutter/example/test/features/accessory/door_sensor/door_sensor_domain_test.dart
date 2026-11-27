import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/repository/door_sensor_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

import '../../../helpers/mock_tt_lock_api.dart';

class _MockRepo extends Mock implements DoorSensorRepository {}

class _FakeRepo extends DoorSensorRepository {
  _FakeRepo(this._mock);
  final _MockRepo _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, DoorSensorEntity> query(int lockId) =>
      _mock.query(lockId);

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    String? name,
    required int electricQuantity,
    required String firmwareInfo,
    required String number,
  }) => _mock.add(
    lockId,
    mac,
    name: name,
    electricQuantity: electricQuantity,
    firmwareInfo: firmwareInfo,
    number: number,
  );

  @override
  TaskEither<AppException, Unit> delete(int doorSensorId) =>
      _mock.delete(doorSensorId);

  @override
  TaskEither<AppException, Unit> rename(int doorSensorId, String name) =>
      _mock.rename(doorSensorId, name);

  @override
  TaskEither<AppException, PageState<DoorSensorRecordEntity>> listRecord(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _mock.listRecord(lockId, pageNo: pageNo, pageSize: pageSize);
}

void main() {
  late _MockRepo repo;
  late MockTTLockApi lockApi;
  late MockTTDoorSensorApi doorSensorApi;
  late ProviderContainer container;
  late DoorSensorDomain domain;

  setUpAll(() {
    registerTtLockFallbacks();
    registerAccessoryFallbacks();
  });

  tearDown(resetTtLockTestHooks);

  setUp(() {
    repo = _MockRepo();
    lockApi = MockTTLockApi();
    doorSensorApi = MockTTDoorSensorApi();
    installMockAccessoryApis(lockApi: lockApi, doorSensorApi: doorSensorApi);
    container = ProviderContainer(
      overrides: [
        doorSensorRepositoryProvider.overrideWith(() => _FakeRepo(repo)),
      ],
    );
    addTearDown(container.dispose);
    domain = container.read(doorSensorDomainProvider.notifier);
  });

  test('queryBound returns None when doorSensorId==0', () async {
    when(() => repo.query(1)).thenAnswer(
      (_) => TaskEither.right(const DoorSensorEntity(doorSensorId: 0)),
    );
    final r = await domain.queryBound(1).run();
    expect(r.isRight(), isTrue);
    expect(r.getOrElse((_) => throw TestFailure('left')).isNone(), isTrue);
  });

  test('queryBound returns Some when bound', () async {
    when(() => repo.query(1)).thenAnswer(
      (_) => TaskEither.right(
        const DoorSensorEntity(
          doorSensorId: 9,
          mac: 'AA',
          number: 'N1',
          name: '门磁',
        ),
      ),
    );
    final r = await domain.queryBound(1).run();
    final opt = r.getOrElse((_) => throw TestFailure('left'));
    expect(opt.isSome(), isTrue);
    expect(opt.toNullable()!.doorSensorId, 9);
  });

  test('add 走 BLE init → 云 add，即使 query 返回已绑也不拦截（可搜即未绑，不做 bound 校验）', () async {
    // 门磁能被搜到信号时必然未绑定 => addViaBleThenCloud 有意不做「已绑即拒绝」。
    when(() => repo.query(1)).thenAnswer(
      (_) => TaskEither.right(
        const DoorSensorEntity(doorSensorId: 9, mac: 'AA', number: 'N'),
      ),
    );
    when(
      () => doorSensorApi.initDoorSensor(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).thenAnswer((_) async => testSystemModel(electricQuantity: 80));
    when(
      () => lockApi.addDoorSensor(any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async {});
    when(
      () => repo.add(
        any(),
        any(),
        name: any(named: 'name'),
        electricQuantity: any(named: 'electricQuantity'),
        firmwareInfo: any(named: 'firmwareInfo'),
        number: any(named: 'number'),
      ),
    ).thenAnswer((_) => TaskEither.right(9));
    final r = await domain
        .addViaBleThenCloud(
          lock: const LockEntity(lockId: 1, lockData: 'ld'),
          mac: 'BB',
          number: 'N2',
        )
        .run();
    expect(r.isRight(), isTrue);
    expect(r.getOrElse((_) => throw TestFailure('left')), 9);
    verify(
      () => doorSensorApi.initDoorSensor(
        any(),
        any(),
        timeout: any(named: 'timeout'),
      ),
    ).called(1);
  });

  test('listRecord forwards to repo', () async {
    when(() => repo.listRecord(7, pageNo: 2, pageSize: 20)).thenAnswer(
      (_) => TaskEither.right(
        const PageState(
          data: [DoorSensorRecordEntity(recordId: 1, recordType: 30)],
          currentPage: 2,
          pageSize: 20,
          total: 1,
        ),
      ),
    );
    final r = await domain.listRecord(7, pageNo: 2).run();
    expect(r.isRight(), isTrue);
    expect(
      r.getOrElse((_) => throw TestFailure('left')).data.single.recordId,
      1,
    );
    verify(() => repo.listRecord(7, pageNo: 2, pageSize: 20)).called(1);
  });

  test('delete does not call cloud when BLE fails', () async {
    when(
      () => lockApi.deleteDoorSensor(any(), timeout: any(named: 'timeout')),
    ).thenThrow(AppException.firmware(message: 'ble fail'));
    final r = await domain
        .delete(
          lock: const LockEntity(lockId: 1, lockData: 'ld'),
          sensor: const DoorSensorEntity(doorSensorId: 9, mac: 'AA'),
        )
        .run();
    expect(r.isLeft(), isTrue);
    verifyNever(() => repo.delete(any()));
  });
}
