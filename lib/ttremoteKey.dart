import 'package:ttlock_flutter/ttlock.dart';

/// A class for interacting with a TTlock remote key accessory.
///
/// This class provides methods to scan for, initialize, and stop scanning for remote keys.
class TTRemoteKey {
  /// Command to start scanning for remote keys.
  static const String COMMAND_START_SCAN_REMOTE_KEY = "startScanRemoteKey";
  /// Command to stop scanning for remote keys.
  static const String COMMAND_STOP_SCAN_REMOTE_KEY = "stopScanRemoteKey";
  /// Command to initialize a remote key.
  static const String COMMAND_INIT_REMOTE_KEY = "initRemoteKey";

  /// Starts scanning for nearby remote keys.
  ///
  /// [scanCallback] A callback that will be invoked for each remote key found.
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_REMOTE_KEY, null, scanCallback);
  }

  /// Stops the remote key scan.
  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_REMOTE_KEY, null, null);
  }

  /// Initializes a remote key.
  ///
  /// [mac] The MAC address of the remote key.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns system information about the lock.
  /// [failedCallback] A callback for when the initialization fails.
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
