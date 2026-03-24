import 'package:flutter/services.dart';
import 'package:ttlock_premise_flutter/pigeon/messages.g.dart' as pigeon;

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
      pigeon.accessoryStartScanRemoteKeypad();

  /// 仅多功能无线键盘支持加指纹；订阅前会先 [setEventKeypadMac]（固定为多功能）。
  /// [keypadMac] 不能为空字符串。
  Stream<pigeon.AddFingerprintEvent> accessoryAddKeypadFingerprint(String keypadMac) {
    if (keypadMac.isEmpty) {
      throw ArgumentError.value(keypadMac, 'keypadMac', 'must not be empty');
    }
    return Stream<void>.fromFuture(
      runRemoteAccessoryApi(() => _host.setEventKeypadMac(keypadMac, true)),
    ).asyncExpand((_) => pigeon.accessoryAddKeypadFingerprint());
  }

  /// 仅多功能无线键盘支持加 IC 卡；订阅前会先 [setEventKeypadMac]（固定为多功能）。
  /// [keypadMac] 不能为空字符串。
  Stream<pigeon.AddCardEvent> accessoryAddKeypadCard(String keypadMac) {
    if (keypadMac.isEmpty) {
      throw ArgumentError.value(keypadMac, 'keypadMac', 'must not be empty');
    }
    return Stream<void>.fromFuture(
      runRemoteAccessoryApi(() => _host.setEventKeypadMac(keypadMac, true)),
    ).asyncExpand((_) => pigeon.accessoryAddKeypadCard());
  }

  /// 在订阅其它配件流前设置键盘 MAC 及是否为多功能键盘（普通无线键盘 / 多功能键盘）。
  /// [accessoryAddKeypadFingerprint] / [accessoryAddKeypadCard] 已内置多功能，一般无需单独调用。
  // Future<void> setEventKeypadMac(String mac, bool isMultifunctional) =>
  //     runRemoteAccessoryApi(() => _host.setEventKeypadMac(mac, isMultifunctional));

  // /// 多功能键盘：等价于 `setEventKeypadMac(mac, true)`。
  // Future<void> setEventMultifunctionalKeypadMac(String mac) =>
  //     setEventKeypadMac(mac, true);

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
