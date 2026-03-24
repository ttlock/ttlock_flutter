import 'package:flutter/services.dart';
import 'package:ttlock_premise_flutter/pigeon/messages.g.dart' as pigeon;

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
      pigeon.accessoryStartScanDoorSensor();

  Stream<pigeon.TTStandaloneDoorSensorScanModel> accessoryStandaloneDoorSensorStartScan() =>
      pigeon.accessoryStandaloneDoorSensorStartScan();

  Future<pigeon.TTLockSystemModel> initDoorSensor(String mac, String lockData) =>
      runRemoteAccessoryApi(() => _host.initDoorSensor(mac, lockData));

  Future<pigeon.TTStandaloneDoorSensorInfo> standaloneDoorSensorInit(
    String mac,
    Map<String, Object?> info,
  ) =>
      runRemoteAccessoryApi(() => _host.standaloneDoorSensorInit(mac, info));

  Future<String> standaloneDoorSensorReadFeatureValue(String mac) =>
      runRemoteAccessoryApi(() => _host.standaloneDoorSensorReadFeatureValue(mac));

  Future<bool> standaloneDoorSensorIsSupportFunction(
    String featureValue,
    int function,
  ) =>
      runRemoteAccessoryApi(
        () => _host.standaloneDoorSensorIsSupportFunction(featureValue, function),
      );
}
