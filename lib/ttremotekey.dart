import 'package:ttlock_flutter/ttlock.dart';

class TTRemoteKey {
  static const String COMMAND_START_SCAN_REMOTE_KEY = "startScanRemoteKey";
  static const String COMMAND_STOP_SCAN_REMOTE_KEY = "stopScanRemoteKey";
  static const String COMMAND_INIT_REMOTE_KEY = "initRemoteKey";

  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_REMOTE_KEY, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_REMOTE_KEY, null, null);
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
    TTLock.invoke(COMMAND_INIT_REMOTE_KEY, map, callback, fail_callback: failedCallback);
  }
}
