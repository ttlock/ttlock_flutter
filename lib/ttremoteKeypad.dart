import 'package:ttlock_flutter/ttlock.dart';

class TTRemoteKeypad {
  static const String COMMAND_START_SCAN_REMOTE_KEYPAD =
      "remoteKeypadStartScan";
  static const String COMMAND_STOP_SCAN_REMOTE_KEYPAD = "remoteKeypadStopScan";
  static const String COMMAND_INIT_REMOTE_KEYPAD = "remoteKeypadInit";

  static void startScan(TTRemoteAccessoryScanModel scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_REMOTE_KEYPAD, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_REMOTE_KEYPAD, null, null);
  }

  static void init(
    String remoteAccessoryMac,
    String lockData,
    TTRemoteKeypadInitSuccessCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = remoteAccessoryMac;
    map[TTResponse.lockData] = lockData;
    TTLock.invoke(COMMAND_INIT_REMOTE_KEYPAD, map, callback,
        fail: failedCallback);
  }
}
