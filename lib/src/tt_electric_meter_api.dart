import 'package:flutter/services.dart';
import 'package:ttlock_premise_flutter/pigeon/messages.g.dart' as pigeon;

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
      pigeon.accessoryElectricMeterStartScan();

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

  Future<pigeon.TTElectricMeterInitResult> electricMeterInit(Map<String, Object?> params) =>
      runRemoteAccessoryApi(() => _host.electricMeterInit(params));

  Future<void> electricMeterDelete(String electricMeterId) =>
      runRemoteAccessoryApi(() => _host.electricMeterDelete(electricMeterId));

  Future<void> electricMeterSetPowerOnOff(String electricMeterId, bool isOn) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetPowerOnOff(electricMeterId, isOn));

  Future<void> electricMeterSetRemainderKwh(String electricMeterId, double remainderKwh) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetRemainderKwh(electricMeterId, remainderKwh));

  Future<void> electricMeterClearRemainderKwh(String electricMeterId) =>
      runRemoteAccessoryApi(() => _host.electricMeterClearRemainderKwh(electricMeterId));

  Future<Map<String, Object?>> electricMeterReadData(String electricMeterId) =>
      runRemoteAccessoryApi(() => _host.electricMeterReadData(electricMeterId));

  Future<void> electricMeterSetPayMode(String electricMeterId, int payMode) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetPayMode(electricMeterId, payMode));

  Future<void> electricMeterCharge(String electricMeterId, double amount) =>
      runRemoteAccessoryApi(() => _host.electricMeterCharge(electricMeterId, amount));

  Future<void> electricMeterSetMaxPower(String electricMeterId, double maxPower) =>
      runRemoteAccessoryApi(() => _host.electricMeterSetMaxPower(electricMeterId, maxPower));

  Future<String> electricMeterGetFeatureValue(String electricMeterId) =>
      runRemoteAccessoryApi(() => _host.electricMeterGetFeatureValue(electricMeterId));

  Future<bool> electricMeterIsSupportFunction(String featureValue, int function) =>
      runRemoteAccessoryApi(() => _host.electricMeterIsSupportFunction(featureValue, function));
}
