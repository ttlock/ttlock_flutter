import 'package:flutter/services.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    as pigeon;

import 'pigeon_errors.dart';

/// 门磁：挂锁门磁初始化、独立门磁及扫描流。
class TTDoorSensorApi {
  TTDoorSensorApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : _host = pigeon.TTAccessoryHostApi(
          binaryMessenger: binaryMessenger,
          messageChannelSuffix: messageChannelSuffix,
        );

  final pigeon.TTAccessoryHostApi _host;

  pigeon.TTAccessoryHostApi get host => _host;

  Stream<pigeon.TTRemoteAccessoryScanModel> accessoryStartScanDoorSensor() =>
      Stream<void>.fromFuture(runBleGate(TTBleOperation.scanDevice))
          .asyncExpand((_) => mapRemoteAccessoryStreamErrors(
              pigeon.accessoryStartScanDoorSensor()));

  Stream<pigeon.TTStandaloneDoorSensorScanModel>
      accessoryStandaloneDoorSensorStartScan() =>
          Stream<void>.fromFuture(runBleGate(TTBleOperation.scanDevice))
              .asyncExpand((_) => mapStandaloneDoorSensorStreamErrors(
                  pigeon.accessoryStandaloneDoorSensorStartScan()));

  Future<pigeon.TTLockSystemModel> initDoorSensor(String mac, String lockData,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.initDoorSensor(mac, lockData),
          timeout: timeout, method: 'initDoorSensor');

  Future<pigeon.TTStandaloneDoorSensorInfo> standaloneDoorSensorInit(
          pigeon.TTStandaloneDoorSensorInitParams params,
          {Duration? timeout}) =>
      runStandaloneDoorSensorApi(() => _host.standaloneDoorSensorInit(params),
          timeout: timeout, method: 'standaloneDoorSensorInit');

  Future<String> standaloneDoorSensorReadFeatureValue(String mac,
          {Duration? timeout}) =>
      runStandaloneDoorSensorApi(
          () => _host.standaloneDoorSensorReadFeatureValue(mac),
          timeout: timeout,
          method: 'standaloneDoorSensorReadFeatureValue');

  Future<bool> standaloneDoorSensorIsSupportFunction(
          String featureValue, pigeon.TTStandaloneDoorSensorFeature function,
          {Duration? timeout}) =>
      runStandaloneDoorSensorApi(
          () => _host.standaloneDoorSensorIsSupportFunction(
              featureValue, function),
          timeout: timeout,
          method: 'standaloneDoorSensorIsSupportFunction');
}
