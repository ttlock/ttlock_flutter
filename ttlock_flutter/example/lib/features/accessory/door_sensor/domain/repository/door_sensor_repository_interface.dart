import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';

abstract class DoorSensorRepositoryInterface {
  TaskEither<AppException, List<DoorSensorEntity>> listByLock(int lockId);

  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    String? name,
    required int electricQuantity,
    required String firmwareInfo,
    required String number,
  });

  TaskEither<AppException, Unit> delete(int doorSensorId);

  TaskEither<AppException, DoorSensorEntity> query(int lockId);

  /// 仅改名（`/v3/doorSensor/update` 的 name）；禁止传告警字段。
  TaskEither<AppException, Unit> rename(int doorSensorId, String name);

  TaskEither<AppException, PageState<DoorSensorRecordEntity>> listRecord(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  });
}

abstract class StandaloneDoorSensorRepositoryInterface {
  TaskEither<AppException, PageState<StandaloneDoorSensorEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  });

  TaskEither<AppException, int> add({
    required String name,
    required String doorSensorData,
    required String wifiName,
  });

  TaskEither<AppException, Unit> delete(int doorSensorId);

  TaskEither<AppException, Unit> update(int doorSensorId, String name);

  TaskEither<AppException, Unit> configAlertFlag(
    int doorSensorId, {
    required int notCloseAlertFlag,
    int? notCloseAlertSecondNum,
    required int longTimeNotOpenAlertFlag,
    int? longTimeNotOpenDayNum,
  });

  TaskEither<AppException, List<StandaloneDoorSensorRecordEntity>> listRecord(
    int doorSensorId, {
    int pageNo = 1,
    int pageSize = 20,
  });

  TaskEither<AppException, StandaloneDoorSensorAlertFlagEntity> getAlertFlag(
    int doorSensorId,
  );

  /// 配网成功后上传：`doorSensorData` 来自 BLE init，不含 wifiPassword。
  TaskEither<AppException, Unit> configNetwork(
    int doorSensorId, {
    required String doorSensorData,
    required String wifiName,
  });

  TaskEither<AppException, Unit> addDoorSensorUser(
    int doorSensorId, {
    required String account,
    required String username,
  });

  TaskEither<AppException, Unit> deleteDoorSensorUser(int doorSensorId, int id);

  TaskEither<AppException, List<StandaloneDoorSensorUserEntity>>
  listDoorSensorUser(int doorSensorId, {String? searchStr});
}
