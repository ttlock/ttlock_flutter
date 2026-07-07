import 'package:flutter/services.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart' as pigeon;

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
      mapRemoteAccessoryStreamErrors(pigeon.accessoryStartScanDoorSensor());

  Stream<pigeon.TTStandaloneDoorSensorScanModel> accessoryStandaloneDoorSensorStartScan() =>
      mapStandaloneDoorSensorStreamErrors(pigeon.accessoryStandaloneDoorSensorStartScan());

  Future<pigeon.TTLockSystemModel> initDoorSensor(String mac, String lockData) =>
      runRemoteAccessoryApi(() => _host.initDoorSensor(mac, lockData));

  Future<pigeon.TTStandaloneDoorSensorInfo> standaloneDoorSensorInit(
    pigeon.TTStandaloneDoorSensorInitParams params,
  ) =>
      runStandaloneDoorSensorApi(() => _host.standaloneDoorSensorInit(params));

  Future<String> standaloneDoorSensorReadFeatureValue(String mac) =>
      runStandaloneDoorSensorApi(() => _host.standaloneDoorSensorReadFeatureValue(mac));

  Future<bool> standaloneDoorSensorIsSupportFunction(
    String featureValue,
    pigeon.TTStandaloneDoorSensorFeature function,
  ) =>
      runStandaloneDoorSensorApi(
        () => _host.standaloneDoorSensorIsSupportFunction(featureValue, function),
      );
}
