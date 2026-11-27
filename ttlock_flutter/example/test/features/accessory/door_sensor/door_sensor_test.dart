import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/data_source/door_sensor_api.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/data_source/door_sensor_data_source.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/model/door_sensor_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/model/standalone_door_sensor_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/repository/door_sensor_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';

class _MockDoorSensorApi extends Mock implements DoorSensorApi {}

void main() {
  test('DoorSensorDto fromJson 解析 query 字段', () {
    final dto = parseDoorSensorDto({
      'doorSensorId': 2323,
      'name': '大门门磁',
      'electricQuantity': 85,
      'version': '1.0.0.210903',
      'mac': '63:42:BB:C2:61:A9',
      'number': 'DS2_a961c2',
      'doorNotClosedWarngingTime': 66,
    });
    final entity = dto.toEntity();
    expect(entity.doorSensorId, 2323);
    expect(entity.name, '大门门磁');
    expect(entity.doorNotClosedWarningTime, 66);
  });

  test('StandaloneDoorSensorDto fromJson(独立门磁字段)', () {
    final e = StandaloneDoorSensorDto.fromJson({
      'doorSensorId': 1,
      'mac': 'AA:BB',
      'name': '门磁',
      'doorSensorState': 1,
      'userType': 'ADMIN',
    }).toEntity();
    expect(e.doorSensorState, DoorSensorState.open);
    expect(e.userType, StandaloneUserType.admin);
  });

  test('DoorSensorState / StandaloneUserType fromValue 容错', () {
    expect(DoorSensorState.fromValue(null), DoorSensorState.unknown);
    expect(DoorSensorState.fromValue(0), DoorSensorState.closed);
    expect(StandaloneUserType.fromValue('USER'), StandaloneUserType.user);
    expect(StandaloneUserType.fromValue(null), StandaloneUserType.admin);
  });

  test('DoorSensorRepository.query 经 mock Api 返回 Entity', () async {
    final api = _MockDoorSensorApi();
    when(() => api.query(lockId: 163377)).thenAnswer(
      (_) async => {
        'doorSensorId': 2323,
        'name': '大门门磁',
        'electricQuantity': 85,
        'version': '1.0.0.210903',
        'mac': '63:42:BB:C2:61:A9',
        'number': 'DS2_a961c2',
        'doorNotClosedWarningTime': 66,
      },
    );
    final container = ProviderContainer(
      overrides: [doorSensorApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(doorSensorRepositoryProvider.notifier);
    final r = await repo.query(163377).run();
    expect(r, isA<Right<AppException, DoorSensorEntity>>());
    expect(r.getOrElse((_) => throw TestFailure('left')).doorSensorId, 2323);
  });

  test('StandaloneDoorSensorRepository.list 经 mock Api 返回 PageState', () async {
    final api = _MockDoorSensorApi();
    when(
      () => api.standaloneList(pageNo: 2, pageSize: 10, searchStr: null),
    ).thenAnswer(
      (_) async => {
        'list': [
          {
            'doorSensorId': 67,
            'mac': '8C:1F:64:12:5D:2E',
            'name': '门磁',
            'doorSensorState': 1,
            'userType': 'ADMIN',
          },
        ],
        'pageNo': 2,
        'pageSize': 10,
        'pages': 5,
        'total': 42,
      },
    );
    final container = ProviderContainer(
      overrides: [doorSensorApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(
      standaloneDoorSensorRepositoryProvider.notifier,
    );
    final r = await repo.list(pageNo: 2, pageSize: 10).run();
    expect(
      r,
      isA<Right<AppException, PageState<StandaloneDoorSensorEntity>>>(),
    );
    final page = r.getOrElse((_) => throw TestFailure('left'));
    expect(page.data.single.doorSensorId, 67);
    expect(page.currentPage, 2);
    expect(page.pageSize, 10);
    expect(page.total, 42);
  });

  test('DoorSensorRepository.add 返回 doorSensorId', () async {
    final api = _MockDoorSensorApi();
    when(
      () => api.add(
        lockId: 163377,
        mac: 'C9:27:AB:43:22:80',
        name: any(named: 'name'),
        electricQuantity: 85,
        firmwareInfo: any(named: 'firmwareInfo'),
        number: 'DS2_a961c2',
      ),
    ).thenAnswer((_) async => {'doorSensorId': 2323});
    final container = ProviderContainer(
      overrides: [doorSensorApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final repo = container.read(doorSensorRepositoryProvider.notifier);
    final r = await repo
        .add(
          163377,
          'C9:27:AB:43:22:80',
          electricQuantity: 85,
          firmwareInfo: '{"modelNum":"SN405_LR"}',
          number: 'DS2_a961c2',
        )
        .run();
    expect(r.getOrElse((_) => 0), 2323);
  });

  test('读接口 errcode!=0 映射为 AppException', () async {
    final api = _MockDoorSensorApi();
    when(() => api.query(lockId: 1)).thenAnswer(
      (_) async => {'errcode': 10007, 'errmsg': '失败', 'description': ''},
    );
    final container = ProviderContainer(
      overrides: [doorSensorApiProvider.overrideWithValue(api)],
    );
    addTearDown(container.dispose);
    final ds = container.read(doorSensorDataSourceProvider.notifier);
    final result = await ds.query(lockId: 1).run();
    expect(result.isLeft(), isTrue);
    result.fold((e) {
      expect(e, isA<AppBusinessException>());
      expect((e as AppBusinessException).code, 10007);
    }, (_) => fail('expected Left'));
  });
}
