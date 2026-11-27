import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/repository/door_sensor_repository.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/repository/door_sensor_repository_interface.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/util/ttlock_extensions.dart';

part 'door_sensor_domain.g.dart';

bool isDoorSensorBound(DoorSensorEntity e) =>
    e.doorSensorId > 0 && (e.mac.isNotEmpty || e.number.isNotEmpty);

@Riverpod(keepAlive: true)
class DoorSensorDomain extends _$DoorSensorDomain {
  late final DoorSensorRepositoryInterface _repo;

  @override
  void build() {
    _repo = ref.watch(doorSensorRepositoryProvider.notifier);
  }

  /// 已绑定 → Some；未绑定 → None；网络/errcode≠0 → Left。
  TaskEither<AppException, Option<DoorSensorEntity>> queryBound(int lockId) =>
      _repo
          .query(lockId)
          .map(
            (e) => isDoorSensorBound(e) ? Option.of(e) : const Option.none(),
          );

  /// BLE：`initDoorSensor` → `addDoorSensor` → 云 add。
  /// 门磁能被搜到信号时必然未绑定，故不做「已绑即拒绝」的 bound 校验（见 add 流程）。
  TaskEither<AppException, int> addViaBleThenCloud({
    required LockEntity lock,
    required String mac,
    required String number,
    String? name,
  }) => TaskEither.tryCatch(() async {
    if (lock.lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    final init = await runBle(
      () => TTLock.doorSensor.initDoorSensor(mac, lock.lockData),
    );
    await runBle(() => TTLock.lock.addDoorSensor(mac, lock.lockData));
    return _runOrThrow(
      _repo.add(
        lock.lockId,
        mac,
        name: (name == null || name.trim().isEmpty)
            ? (lock.lockAlias.isNotEmpty ? lock.lockAlias : number)
            : name.trim(),
        electricQuantity: init.electricQuantity ?? 0,
        firmwareInfo: init.firmwareInfoJson,
        number: number,
      ),
    );
  }, ExceptionUtils.extractAppException);

  TaskEither<AppException, Unit> rename(int doorSensorId, String name) =>
      _repo.rename(doorSensorId, name);

  TaskEither<AppException, PageState<DoorSensorRecordEntity>> listRecord(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _repo.listRecord(lockId, pageNo: pageNo, pageSize: pageSize);

  /// BLE `deleteDoorSensor` 成功后才云删。
  TaskEither<AppException, Unit> delete({
    required LockEntity lock,
    required DoorSensorEntity sensor,
  }) => TaskEither.tryCatch(() async {
    if (lock.lockData.isEmpty) {
      throw AppException.business(code: -21, message: 'ble_unreachable');
    }
    await runBle(() => TTLock.lock.deleteDoorSensor(lock.lockData));
    await _runOrThrow(_repo.delete(sensor.doorSensorId));
    return unit;
  }, ExceptionUtils.extractAppException);

  Future<T> _runOrThrow<T>(TaskEither<AppException, T> task) async {
    final r = await task.run();
    return r.fold((l) => throw l, (r) => r);
  }
}
