import 'package:ttlock_premise_flutter/src/ttlock_channel.dart';
import 'package:ttlock_premise_flutter/src/ttdoorsensor_commands.dart';
import 'package:ttlock_premise_flutter/ttlock.dart';

class TTDoorSensor {
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLockChannel.invoke(TTDoorSensorCommands.COMMAND_START_SCAN_DOOR_SENSOR, null, scanCallback);
  }

  static void stopScan() {
    TTLockChannel.invoke(TTDoorSensorCommands.COMMAND_STOP_SCAN_DOOR_SENSOR, null, null);
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
    TTLockChannel.invoke(TTDoorSensorCommands.COMMAND_INIT_DOOR_SENSOR, map, callback,
        fail: failedCallback);
  }
}
