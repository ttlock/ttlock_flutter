import 'package:flutter/services.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart' as pigeon;

import 'pigeon_errors.dart';

/// 电表 Pigeon API（错误映射为 [TTRemoteAccessoryException]，与原生侧 `electricMeterErrorRevert` 一致）。
class TTElectricMeterApi {
  TTElectricMeterApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : _host = pigeon.TTAccessoryHostApi(
          binaryMessenger: binaryMessenger,
          messageChannelSuffix: messageChannelSuffix,
        );

  final pigeon.TTAccessoryHostApi _host;

  pigeon.TTAccessoryHostApi get host => _host;

  Stream<pigeon.TTMeterScanModel> accessoryElectricMeterStartScan() =>
      mapRemoteAccessoryStreamErrors(pigeon.accessoryElectricMeterStartScan());

  Future<void> electricMeterConfigServer(
    String url,
    String clientId,
    String accessToken,
  ) =>
      runRemoteAccessoryApi(() => _host.electricMeterConfigServer(url, clientId, accessToken));

  Future<void> electricMeterConnect(String mac) =>
      runRemoteAccessoryApi(() => _host.electricMeterConnect(mac));

  Future<void> electricMeterDisconnect(String mac) =>
      runRemoteAccessoryApi(() => _host.electricMeterDisconnect(mac));

  Future<pigeon.TTElectricMeterInitResult> electricMeterInit(pigeon.TTElectricMeterInitParam params) =>
      runRemoteAccessoryApi(() => _host.electricMeterInit(params));

  Future<void> electricMeterDelete(String mac) =>
      runRemoteAccessoryApi(() => _host.electricMeterDelete(mac));

  Future<void> electricMeterSetPowerOnOff(String mac, bool isOn) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetPowerOnOff(mac, isOn));

  Future<void> electricMeterSetRemainderKwh(String mac, double remainderKwh) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetRemainderKwh(mac, remainderKwh));

  Future<void> electricMeterClearRemainderKwh(String mac) =>
      runRemoteAccessoryApi(() => _host.electricMeterClearRemainderKwh(mac));

  Future<void> electricMeterReadData(String mac) =>
      runRemoteAccessoryApi(() => _host.electricMeterReadData(mac));

  Future<void> electricMeterSetPayMode(String mac, pigeon.TTMeterPayMode payMode, double price) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetPayMode(mac, payMode, price));

  Future<void> electricMeterCharge(String mac, double amount, double kwh) =>
      runRemoteAccessoryApi(() => _host.electricMeterCharge(mac, amount, kwh));

  Future<void> electricMeterSetMaxPower(String mac, double maxPower) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetMaxPower(mac, maxPower));

  Future<String> electricMeterGetFeatureValue(String mac) =>
      runRemoteAccessoryApi(() => _host.electricMeterGetFeatureValue(mac));

  Future<bool> electricMeterIsSupportFunction(String featureValue, pigeon.TTElectricMeterFeature function) =>
      runRemoteAccessoryApi(() => _host.electricMeterIsSupportFunction(featureValue, function));

  Future<pigeon.ElectricMeterDeviceInfo> electricMeterGetDeviceInfo(String mac) =>
      runRemoteAccessoryApi(() => _host.electricMeterGetDeviceInfo(mac));

  Future<void> electricMeterConfigApn(String mac, String apn) =>
      runRemoteAccessoryApi(() => _host.electricMeterConfigApn(mac, apn));

  Future<void> electricMeterConfigMeterServer(String mac, String ip, String port) =>
      runRemoteAccessoryApi(() => _host.electricMeterConfigMeterServer(mac, ip, port));

  Future<void> electricMeterReset(String mac) =>
      runRemoteAccessoryApi(() => _host.electricMeterReset(mac));
}
