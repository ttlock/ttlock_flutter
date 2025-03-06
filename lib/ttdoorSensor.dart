import 'package:ttlock_flutter/ttlock.dart';

class TTDoorSensor {
  static const String COMMAND_START_SCAN_DOOR_SENSOR = "doorSensorStartScan";
  static const String COMMAND_STOP_SCAN_DOOR_SENSOR = "doorSensorStopScan";
  static const String COMMAND_INIT_DOOR_SENSOR = "doorSensorInit";

  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_DOOR_SENSOR, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_DOOR_SENSOR, null, null);
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
    TTLock.invoke(COMMAND_INIT_DOOR_SENSOR, map, callback,
        fail_callback: failedCallback);
  }
}
