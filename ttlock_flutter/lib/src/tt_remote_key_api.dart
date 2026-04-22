import 'package:flutter/services.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart' as pigeon;

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
      pigeon.accessoryStartScanRemoteKey();

  Future<pigeon.TTLockSystemModel> initRemoteKey(String mac, String lockData) =>
      runRemoteAccessoryApi(() => _host.initRemoteKey(mac, lockData));

  Future<List<String>> getStoredLocks(String mac) =>
      runRemoteAccessoryApi(() => _host.getStoredLocks(mac));

  Future<void> deleteStoredLock(String mac, int slotNumber) =>
      runRemoteAccessoryApi(() => _host.deleteStoredLock(mac, slotNumber));
}
