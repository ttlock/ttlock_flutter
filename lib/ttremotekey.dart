import 'package:ttlock_premise_flutter/src/ttlock_channel.dart';
import 'package:ttlock_premise_flutter/src/ttremotekey_commands.dart';
import 'package:ttlock_premise_flutter/ttlock.dart';

class TTRemoteKey {
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLockChannel.invoke(TTRemoteKeyCommands.COMMAND_START_SCAN_REMOTE_KEY, null, scanCallback);
  }

  static void stopScan() {
    TTLockChannel.invoke(TTRemoteKeyCommands.COMMAND_STOP_SCAN_REMOTE_KEY, null, null);
  }

  static void init(
    String mac,
    String lockData,
    TTGetLockSystemCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTRemoteKeyCommands.COMMAND_INIT_REMOTE_KEY, map, callback, fail: failedCallback);
  }
}
