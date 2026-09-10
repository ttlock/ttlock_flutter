import 'package:flutter/services.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    as pigeon;

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
      Stream<void>.fromFuture(runBleGate(TTBleOperation.scanDevice))
          .asyncExpand((_) => mapRemoteAccessoryStreamErrors(
              pigeon.accessoryWaterMeterStartScan()));

  Future<void> waterMeterSetClientParam(
          String url, String clientId, String accessToken,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.waterMeterSetClientParam(url, clientId, accessToken),
          timeout: timeout,
          method: 'waterMeterSetClientParam');

  Future<void> waterMeterConnect(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterConnect(mac),
          timeout: timeout, method: 'waterMeterConnect');

  Future<void> waterMeterDisconnect(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterDisconnect(mac),
          timeout: timeout, method: 'waterMeterDisconnect');

  Future<pigeon.TTWaterMeterInitResult> waterMeterInit(
          pigeon.TTWaterMeterInitParam params,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterInit(params),
          timeout: timeout, method: 'waterMeterInit');

  Future<void> waterMeterDelete(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterDelete(mac),
          timeout: timeout, method: 'waterMeterDelete');

  Future<void> waterMeterSetPowerOnOff(String mac, bool isOn,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetPowerOnOff(mac, isOn),
          timeout: timeout, method: 'waterMeterSetPowerOnOff');

  Future<void> waterMeterSetRemainderM3(String mac, double remainderM3,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.waterMeterSetRemainderM3(mac, remainderM3),
          timeout: timeout,
          method: 'waterMeterSetRemainderM3');

  Future<void> waterMeterClearRemainderM3(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterClearRemainderM3(mac),
          timeout: timeout, method: 'waterMeterClearRemainderM3');

  Future<void> waterMeterReadData(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterReadData(mac),
          timeout: timeout, method: 'waterMeterReadData');

  Future<void> waterMeterSetPayMode(
          String mac, pigeon.TTMeterPayMode payMode, double price,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.waterMeterSetPayMode(mac, payMode, price),
          timeout: timeout,
          method: 'waterMeterSetPayMode');

  Future<void> waterMeterCharge(String mac, double amount, double m3,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterCharge(mac, amount, m3),
          timeout: timeout, method: 'waterMeterCharge');

  Future<void> waterMeterSetTotalUsage(String mac, double totalM3,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterSetTotalUsage(mac, totalM3),
          timeout: timeout, method: 'waterMeterSetTotalUsage');

  Future<String> waterMeterGetFeatureValue(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterGetFeatureValue(mac),
          timeout: timeout, method: 'waterMeterGetFeatureValue');

  Future<pigeon.WaterMeterDeviceInfo> waterMeterGetDeviceInfo(String mac,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterGetDeviceInfo(mac),
          timeout: timeout, method: 'waterMeterGetDeviceInfo');

  Future<bool> waterMeterIsSupportFunction(
          String featureValue, pigeon.TTWaterMeterFeature function,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.waterMeterIsSupportFunction(featureValue, function),
          timeout: timeout,
          method: 'waterMeterIsSupportFunction');

  Future<void> waterMeterConfigApn(String mac, String apn,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterConfigApn(mac, apn),
          timeout: timeout, method: 'waterMeterConfigApn');

  Future<void> waterMeterConfigServer(String mac, String ip, String port,
          {Duration? timeout}) =>
      runRemoteAccessoryApi(
          () => _host.waterMeterConfigServer(mac, ip, port),
          timeout: timeout,
          method: 'waterMeterConfigServer');

  Future<void> waterMeterReset(String mac, {Duration? timeout}) =>
      runRemoteAccessoryApi(() => _host.waterMeterReset(mac),
          timeout: timeout, method: 'waterMeterReset');
}
