import 'package:ttlock_flutter/ttlock.dart';

/// A class for interacting with a TTlock door sensor accessory.
///
/// This class provides methods to scan for, initialize, and stop scanning for door sensors.
class TTDoorSensor {
  /// Command to start scanning for door sensors.
  static const String COMMAND_START_SCAN_DOOR_SENSOR = "doorSensorStartScan";
  /// Command to stop scanning for door sensors.
  static const String COMMAND_STOP_SCAN_DOOR_SENSOR = "doorSensorStopScan";
  /// Command to initialize a door sensor.
  static const String COMMAND_INIT_DOOR_SENSOR = "doorSensorInit";

  /// Starts scanning for nearby door sensors.
  ///
  /// [scanCallback] A callback that will be invoked for each door sensor found.
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_DOOR_SENSOR, null, scanCallback);
  }

  /// Stops the door sensor scan.
  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_DOOR_SENSOR, null, null);
  }

  /// Initializes a door sensor.
  ///
  /// [mac] The MAC address of the door sensor.
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
    TTLock.invoke(COMMAND_INIT_DOOR_SENSOR, map, callback,
        fail_callback: failedCallback);
  }
}
