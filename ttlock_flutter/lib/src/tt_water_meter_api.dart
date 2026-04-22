import 'package:flutter/services.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart' as pigeon;

import 'pigeon_errors.dart';

/// 水表 Pigeon API（错误映射为 [TTRemoteAccessoryException]，与原生侧 `waterMeterErrorRevert` 一致）。
class TTWaterMeterApi {
  TTWaterMeterApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : _host = pigeon.TTAccessoryHostApi(
          binaryMessenger: binaryMessenger,
          messageChannelSuffix: messageChannelSuffix,
        );

  final pigeon.TTAccessoryHostApi _host;

  pigeon.TTAccessoryHostApi get host => _host;

  Stream<pigeon.TTMeterScanModel> accessoryWaterMeterStartScan() =>
      pigeon.accessoryWaterMeterStartScan();

  Future<void> waterMeterConfigServer(
    String url,
    String clientId,
    String accessToken,
  ) =>
      runRemoteAccessoryApi(() => _host.waterMeterConfigServer(url, clientId, accessToken));

  Future<void> waterMeterConnect(String mac) =>
      runRemoteAccessoryApi(() => _host.waterMeterConnect(mac));

  Future<void> waterMeterDisconnect(String mac) =>
      runRemoteAccessoryApi(() => _host.waterMeterDisconnect(mac));

  Future<pigeon.TTWaterMeterInitResult> waterMeterInit(Map<String, Object?> params) =>
      runRemoteAccessoryApi(() => _host.waterMeterInit(params));

  Future<void> waterMeterDelete(String waterMeterId) =>
      runRemoteAccessoryApi(() => _host.waterMeterDelete(waterMeterId));

  Future<void> waterMeterSetPowerOnOff(String waterMeterId, bool isOn) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetPowerOnOff(waterMeterId, isOn));

  Future<void> waterMeterSetRemainderM3(String waterMeterId, double remainderM3) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetRemainderM3(waterMeterId, remainderM3));

  Future<void> waterMeterClearRemainderM3(String waterMeterId) =>
      runRemoteAccessoryApi(() => _host.waterMeterClearRemainderM3(waterMeterId));

  Future<Map<String, Object?>> waterMeterReadData(String waterMeterId) =>
      runRemoteAccessoryApi(() => _host.waterMeterReadData(waterMeterId));

  Future<void> waterMeterSetPayMode(String waterMeterId, int payMode) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetPayMode(waterMeterId, payMode));

  Future<void> waterMeterCharge(String waterMeterId, double amount) =>
      runRemoteAccessoryApi(() => _host.waterMeterCharge(waterMeterId, amount));

  Future<void> waterMeterSetTotalUsage(String waterMeterId, double totalM3) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetTotalUsage(waterMeterId, totalM3));

  Future<String> waterMeterGetFeatureValue(String waterMeterId) =>
      runRemoteAccessoryApi(() => _host.waterMeterGetFeatureValue(waterMeterId));

  Future<pigeon.WaterMeterDeviceInfo> waterMeterGetDeviceInfo(String waterMeterId) =>
      runRemoteAccessoryApi(() => _host.waterMeterGetDeviceInfo(waterMeterId));

  Future<bool> waterMeterIsSupportFunction(String featureValue, int function) =>
      runRemoteAccessoryApi(() => _host.waterMeterIsSupportFunction(featureValue, function));

  Future<void> waterMeterConfigApn(String apn) =>
      runRemoteAccessoryApi(() => _host.waterMeterConfigApn(apn));

  Future<void> waterMeterConfigMeterServer(String ip, String port) =>
      runRemoteAccessoryApi(() => _host.waterMeterConfigMeterServer(ip, port));

  Future<void> waterMeterReset(String waterMeterId) =>
      runRemoteAccessoryApi(() => _host.waterMeterReset(waterMeterId));
}
