import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_envelope.dart';
import 'package:ttlock_flutter_demo/core/data/openapi/open_api_page_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/data_source/door_sensor_data_source.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/model/standalone_door_sensor_dto.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/repository/door_sensor_repository.dart';

/// Real subclass fake of [DoorSensorDataSource] so the overridden
/// `doorSensorDataSourceProvider` mounts cleanly (a raw `Mock implements`
/// Notifier would have the framework read `this.ref`/`build()` during mount,
/// which an unstubbed mocktail mock does not satisfy). Only the 5 data-source
/// methods the repo calls are controllable; it records the params it receives
/// so the repo's pass-through can be asserted.
class _FakeDataSource extends DoorSensorDataSource {
  @override
  void build() {}

  int? listPageNo;
  int? listPageSize;
  String? listSearchStr;
  TaskEither<AppException, OpenApiPageDto<StandaloneDoorSensorDto>> listResult =
      TaskEither.right(const OpenApiPageDto<StandaloneDoorSensorDto>());
  @override
  TaskEither<AppException, OpenApiPageDto<StandaloneDoorSensorDto>>
  standaloneList({int pageNo = 1, int pageSize = 20, String? searchStr}) {
    listPageNo = pageNo;
    listPageSize = pageSize;
    listSearchStr = searchStr;
    return listResult;
  }

  int? getAlertFlagId;
  TaskEither<AppException, StandaloneDoorSensorAlertFlagDto>
  getAlertFlagResult = TaskEither.right(
    const StandaloneDoorSensorAlertFlagDto(),
  );
  @override
  TaskEither<AppException, StandaloneDoorSensorAlertFlagDto>
  standaloneGetAlertFlag({required int doorSensorId}) {
    getAlertFlagId = doorSensorId;
    return getAlertFlagResult;
  }

  int? configNetworkId;
  String? configNetworkDoorSensorData;
  String? configNetworkWifiName;
  TaskEither<AppException, OpenApiEnvelope> writeResult = TaskEither.right(
    const OpenApiEnvelope(),
  );
  @override
  TaskEither<AppException, OpenApiEnvelope> standaloneConfigNetwork({
    required int doorSensorId,
    required String doorSensorData,
    required String wifiName,
  }) {
    configNetworkId = doorSensorId;
    configNetworkDoorSensorData = doorSensorData;
    configNetworkWifiName = wifiName;
    return writeResult;
  }

  int? addUserDoorSensorId;
  String? addUserAccount;
  String? addUserUsername;
  @override
  TaskEither<AppException, OpenApiEnvelope> standaloneAddDoorSensorUser({
    required int doorSensorId,
    required String account,
    required String username,
  }) {
    addUserDoorSensorId = doorSensorId;
    addUserAccount = account;
    addUserUsername = username;
    return writeResult;
  }

  int? deleteUserDoorSensorId;
  int? deleteUserId;
  @override
  TaskEither<AppException, OpenApiEnvelope> standaloneDeleteDoorSensorUser({
    required int doorSensorId,
    required int id,
  }) {
    deleteUserDoorSensorId = doorSensorId;
    deleteUserId = id;
    return writeResult;
  }

  int? listUserDoorSensorId;
  String? listUserSearchStr;
  TaskEither<AppException, List<StandaloneDoorSensorUserDto>> listUserResult =
      TaskEither.right(const []);
  @override
  TaskEither<AppException, List<StandaloneDoorSensorUserDto>>
  standaloneListDoorSensorUser({required int doorSensorId, String? searchStr}) {
    listUserDoorSensorId = doorSensorId;
    listUserSearchStr = searchStr;
    return listUserResult;
  }
}

void main() {
  late _FakeDataSource dataSource;
  late StandaloneDoorSensorRepository repo;
  late ProviderContainer container;

  setUp(() {
    dataSource = _FakeDataSource();
    container = ProviderContainer(
      overrides: [doorSensorDataSourceProvider.overrideWith(() => dataSource)],
    );
    addTearDown(container.dispose);
    repo = container.read(standaloneDoorSensorRepositoryProvider.notifier);
  });

  test('getAlertFlag maps dto to entity and forwards doorSensorId', () async {
    dataSource.getAlertFlagResult = TaskEither.right(
      const StandaloneDoorSensorAlertFlagDto(
        notCloseAlertFlag: 1,
        notCloseAlertSecondNum: 30,
        longTimeNotOpenAlertFlag: 0,
        longTimeNotOpenDayNum: 0,
      ),
    );
    final r = await repo.getAlertFlag(3).run();
    final e = r.getOrElse((_) => throw TestFailure('left'));
    expect(dataSource.getAlertFlagId, 3);
    expect(e.notCloseAlertFlag, 1);
    expect(e.notCloseAlertSecondNum, 30);
    expect(e.longTimeNotOpenAlertFlag, 0);
    expect(e.longTimeNotOpenDayNum, 0);
  });

  test('configNetwork maps to unit and forwards doorSensorData + wifiName',
      () async {
    final r = await repo
        .configNetwork(3, doorSensorData: 'DATA', wifiName: 'H')
        .run();
    expect(dataSource.configNetworkId, 3);
    expect(dataSource.configNetworkDoorSensorData, 'DATA');
    expect(dataSource.configNetworkWifiName, 'H');
    expect(r.isRight(), isTrue);
  });

  test('addDoorSensorUser maps to unit and forwards account + username',
      () async {
    final r = await repo
        .addDoorSensorUser(3, account: 'a@email.com', username: 'u')
        .run();
    expect(dataSource.addUserDoorSensorId, 3);
    expect(dataSource.addUserAccount, 'a@email.com');
    expect(dataSource.addUserUsername, 'u');
    expect(r.isRight(), isTrue);
  });

  test('deleteDoorSensorUser maps to unit and forwards id', () async {
    final r = await repo.deleteDoorSensorUser(3, 7).run();
    expect(dataSource.deleteUserDoorSensorId, 3);
    expect(dataSource.deleteUserId, 7);
    expect(r.isRight(), isTrue);
  });

  test('listDoorSensorUser maps list to entities', () async {
    dataSource.listUserResult = TaskEither.right(const [
      StandaloneDoorSensorUserDto(id: 1, username: 'u1'),
    ]);
    final r = await repo.listDoorSensorUser(3).run();
    expect(dataSource.listUserDoorSensorId, 3);
    expect(dataSource.listUserSearchStr, isNull);
    expect(r.getOrElse((_) => throw TestFailure('left')).single.username, 'u1');
  });

  test('list maps page dto to PageState and forwards params', () async {
    dataSource.listResult = TaskEither.right(
      const OpenApiPageDto(
        list: [StandaloneDoorSensorDto(doorSensorId: 1, name: '门磁')],
        pageNo: 2,
        pageSize: 10,
        pages: 5,
        total: 42,
      ),
    );
    final r = await repo.list(pageNo: 2, pageSize: 10).run();
    expect(dataSource.listPageNo, 2);
    expect(dataSource.listPageSize, 10);
    expect(dataSource.listSearchStr, isNull);
    final page = r.getOrElse((_) => throw TestFailure('left'));
    expect(page.data.single.doorSensorId, 1);
    expect(page.currentPage, 2);
    expect(page.pageSize, 10);
    expect(page.total, 42);
  });
}
