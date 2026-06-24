import 'package:flutter/services.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart' as pigeon;

import 'event_stream_params.dart';
import 'pigeon_errors.dart';

/// 无线键盘 / 多功能键盘。
class TTRemoteKeypadApi {
  TTRemoteKeypadApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : _host = pigeon.TTAccessoryHostApi(
          binaryMessenger: binaryMessenger,
          messageChannelSuffix: messageChannelSuffix,
        );

  final pigeon.TTAccessoryHostApi _host;

  pigeon.TTAccessoryHostApi get host => _host;

  Stream<pigeon.TTRemoteAccessoryScanModel> accessoryStartScanRemoteKeypad() =>
      mapRemoteAccessoryStreamErrors(pigeon.accessoryStartScanRemoteKeypad());

  /// 订阅前调用 [setAccessoryAddKeypadFingerprintParam]。
  Stream<pigeon.AddFingerprintEvent> accessoryAddKeypadFingerprint({
    required String keypadMac,
    required String lockData,
    bool isMultifunctional = true,
    List<pigeon.TTCycleModel>? cycleList,
    int? startDate,
    int? endDate,
  }) {
    if (keypadMac.isEmpty) {
      throw ArgumentError.value(keypadMac, 'keypadMac', 'must not be empty');
    }
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    final param = buildKeypadCredentialParam(
      keypadMac: keypadMac,
      lockData: lockData,
      isMultifunctional: isMultifunctional,
      cycleList: cycleList,
      startDate: startDate,
      endDate: endDate,
    );
    return Stream<void>.fromFuture(
      runRemoteAccessoryApi(() => _host.setAccessoryAddKeypadFingerprintParam(param)),
    ).asyncExpand((_) => mapKeypadCredentialStreamErrors(pigeon.accessoryAddKeypadFingerprint()));
  }

  /// 订阅前调用 [setAccessoryAddKeypadCardParam]。
  Stream<pigeon.AddCardEvent> accessoryAddKeypadCard({
    required String keypadMac,
    required String lockData,
    bool isMultifunctional = true,
    List<pigeon.TTCycleModel>? cycleList,
    int? startDate,
    int? endDate,
  }) {
    if (keypadMac.isEmpty) {
      throw ArgumentError.value(keypadMac, 'keypadMac', 'must not be empty');
    }
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    final param = buildKeypadCredentialParam(
      keypadMac: keypadMac,
      lockData: lockData,
      isMultifunctional: isMultifunctional,
      cycleList: cycleList,
      startDate: startDate,
      endDate: endDate,
    );
    return Stream<void>.fromFuture(
      runRemoteAccessoryApi(() => _host.setAccessoryAddKeypadCardParam(param)),
    ).asyncExpand((_) => mapKeypadCredentialStreamErrors(pigeon.accessoryAddKeypadCard()));
  }

  Future<pigeon.RemoteKeypadInitResult> initRemoteKeypad(String mac, String lockMac) =>
      runRemoteAccessoryApi(() => _host.initRemoteKeypad(mac, lockMac));

  Future<pigeon.MultifunctionalKeypadInitResult> initMultifunctionalKeypad(
    String mac,
    String lockData,
  ) =>
      runMultifunctionalKeypadInit(
        () => _host.initMultifunctionalKeypad(mac, lockData),
      );

  Future<void> deleteStoredLock(String mac, int slotNumber) =>
      runMultifunctionalKeypadApi(() => _host.deleteStoredLock(mac, slotNumber));
}
