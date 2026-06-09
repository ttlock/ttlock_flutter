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

  Future<pigeon.TTWaterMeterInitResult> waterMeterInit(pigeon.TTWaterMeterInitParam params) =>
      runRemoteAccessoryApi(() => _host.waterMeterInit(params));

  Future<void> waterMeterDelete(String mac) =>
      runRemoteAccessoryApi(() => _host.waterMeterDelete(mac));

  Future<void> waterMeterSetPowerOnOff(String mac, bool isOn) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetPowerOnOff(mac, isOn));

  Future<void> waterMeterSetRemainderM3(String mac, double remainderM3) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetRemainderM3(mac, remainderM3));

  Future<void> waterMeterClearRemainderM3(String mac) =>
      runRemoteAccessoryApi(() => _host.waterMeterClearRemainderM3(mac));

  Future<void> waterMeterReadData(String mac) =>
      runRemoteAccessoryApi(() => _host.waterMeterReadData(mac));

  Future<void> waterMeterSetPayMode(String mac, pigeon.TTMeterPayMode payMode, double price) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetPayMode(mac, payMode, price));

  Future<void> waterMeterCharge(String mac, double amount, double m3) =>
      runRemoteAccessoryApi(() => _host.waterMeterCharge(mac, amount, m3));

  Future<void> waterMeterSetTotalUsage(String mac, double totalM3) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetTotalUsage(mac, totalM3));

  Future<String> waterMeterGetFeatureValue(String mac) =>
      runRemoteAccessoryApi(() => _host.waterMeterGetFeatureValue(mac));

  Future<pigeon.WaterMeterDeviceInfo> waterMeterGetDeviceInfo(String mac) =>
      runRemoteAccessoryApi(() => _host.waterMeterGetDeviceInfo(mac));

  Future<bool> waterMeterIsSupportFunction(String featureValue, pigeon.TTWaterMeterFeature function) =>
      runRemoteAccessoryApi(() => _host.waterMeterIsSupportFunction(featureValue, function));

  Future<void> waterMeterConfigApn(String mac, String apn) =>
      runRemoteAccessoryApi(() => _host.waterMeterConfigApn(mac, apn));

  Future<void> waterMeterConfigMeterServer(String mac, String ip, String port) =>
      runRemoteAccessoryApi(() => _host.waterMeterConfigMeterServer(mac, ip, port));

  Future<void> waterMeterReset(String mac) =>
      runRemoteAccessoryApi(() => _host.waterMeterReset(mac));
}
