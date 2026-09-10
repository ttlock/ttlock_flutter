import 'package:flutter/services.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    as pigeon;

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
      Stream<void>.fromFuture(runBleGate(TTBleOperation.scanDevice))
          .asyncExpand((_) => mapRemoteAccessoryStreamErrors(
              pigeon.accessoryElectricMeterStartScan()));

  Future<void> electricMeterSetClientParam(
          String url, String clientId, String accessToken,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.electricMeterSetClientParam(url, clientId, accessToken),
          timeout: timeout,
          method: 'electricMeterSetClientParam');

  Future<void> electricMeterConnect(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterConnect(mac),
          timeout: timeout, method: 'electricMeterConnect');

  Future<void> electricMeterDisconnect(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterDisconnect(mac),
          timeout: timeout, method: 'electricMeterDisconnect');

  Future<pigeon.TTElectricMeterInitResult> electricMeterInit(
          pigeon.TTElectricMeterInitParam params,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterInit(params),
          timeout: timeout, method: 'electricMeterInit');

  Future<void> electricMeterDelete(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterDelete(mac),
          timeout: timeout, method: 'electricMeterDelete');

  Future<void> electricMeterSetPowerOnOff(String mac, bool isOn,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetPowerOnOff(mac, isOn),
          timeout: timeout, method: 'electricMeterSetPowerOnOff');

  Future<void> electricMeterSetRemainderKwh(String mac, double remainderKwh,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.electricMeterSetRemainderKwh(mac, remainderKwh),
          timeout: timeout,
          method: 'electricMeterSetRemainderKwh');

  Future<void> electricMeterClearRemainderKwh(String mac,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterClearRemainderKwh(mac),
          timeout: timeout, method: 'electricMeterClearRemainderKwh');

  Future<void> electricMeterReadData(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterReadData(mac),
          timeout: timeout, method: 'electricMeterReadData');

  Future<void> electricMeterSetPayMode(
          String mac, pigeon.TTMeterPayMode payMode, double price,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.electricMeterSetPayMode(mac, payMode, price),
          timeout: timeout,
          method: 'electricMeterSetPayMode');

  Future<void> electricMeterCharge(String mac, double amount, double kwh,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterCharge(mac, amount, kwh),
          timeout: timeout, method: 'electricMeterCharge');

  Future<void> electricMeterSetMaxPower(String mac, double maxPower,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetMaxPower(mac, maxPower),
          timeout: timeout, method: 'electricMeterSetMaxPower');

  Future<String> electricMeterGetFeatureValue(String mac,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterGetFeatureValue(mac),
          timeout: timeout, method: 'electricMeterGetFeatureValue');

  Future<bool> electricMeterIsSupportFunction(
          String featureValue, pigeon.TTElectricMeterFeature function,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.electricMeterIsSupportFunction(featureValue, function),
          timeout: timeout,
          method: 'electricMeterIsSupportFunction');

  Future<pigeon.ElectricMeterDeviceInfo> electricMeterGetDeviceInfo(String mac,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterGetDeviceInfo(mac),
          timeout: timeout, method: 'electricMeterGetDeviceInfo');

  Future<void> electricMeterConfigApn(String mac, String apn,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterConfigApn(mac, apn),
          timeout: timeout, method: 'electricMeterConfigApn');

  Future<void> electricMeterConfigServer(
          String mac, String ip, String port, {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.electricMeterConfigServer(mac, ip, port),
          timeout: timeout,
          method: 'electricMeterConfigServer');

  Future<void> electricMeterReset(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.electricMeterReset(mac),
          timeout: timeout, method: 'electricMeterReset');
}
