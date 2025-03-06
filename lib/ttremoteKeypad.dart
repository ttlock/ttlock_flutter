import 'package:ttlock_flutter/ttlock.dart';

class TTRemoteKeypad {
  static const String COMMAND_START_SCAN_REMOTE_KEYPAD =
      "remoteKeypadStartScan";
  static const String COMMAND_STOP_SCAN_REMOTE_KEYPAD = "remoteKeypadStopScan";
  static const String COMMAND_INIT_REMOTE_KEYPAD = "remoteKeypadInit";

  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_REMOTE_KEYPAD, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_REMOTE_KEYPAD, null, null);
  }

  static void init(
    String mac,
    String lockMac,
    TTRemoteKeypadInitSuccessCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.lockMac] = lockMac;
    TTLock.invoke(COMMAND_INIT_REMOTE_KEYPAD, map, callback,
        fail_callback: failedCallback);
  }
}
