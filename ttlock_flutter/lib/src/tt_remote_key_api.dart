import 'package:flutter/services.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    as pigeon;

import 'pigeon_errors.dart';

/// 无线钥匙等配件（远程钥匙扫描与存储）。
class TTRemoteKeyApi {
  TTRemoteKeyApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : _host = pigeon.TTAccessoryHostApi(
          binaryMessenger: binaryMessenger,
          messageChannelSuffix: messageChannelSuffix,
        );

  final pigeon.TTAccessoryHostApi _host;

  pigeon.TTAccessoryHostApi get host => _host;

  Stream<pigeon.TTRemoteAccessoryScanModel> accessoryStartScanRemoteKey() =>
      Stream<void>.fromFuture(runBleGate(TTBleOperation.scanDevice))
          .asyncExpand((_) => mapRemoteAccessoryStreamErrors(
              pigeon.accessoryStartScanRemoteKey()));

  /// 初始化遥控器。
  ///
  /// [mac] 逻辑 MAC（广播解析地址）。
  /// [connectAddress] R2 用于 BLE 连接的地址；为空则原生侧回退使用 [mac]。
  Future<pigeon.TTLockSystemModel> initRemoteKey(
    String mac,
    String lockData, {
    String? connectAddress,
    Duration? timeout,
  }) =>
      runRemoteAccessoryApi(
        () => _host.initRemoteKey(mac, lockData, connectAddress),
        timeout: timeout,
        method: 'initRemoteKey',
      );
}
