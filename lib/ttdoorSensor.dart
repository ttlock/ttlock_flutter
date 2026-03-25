import 'dart:async';

import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_remote_accessory_exception.dart';

/// Legacy door sensor API. Prefer [new_ttlock.TTLock.doorSensor] instead.
@Deprecated('Use TTLock.doorSensor.accessoryStartScanDoorSensor() / initDoorSensor() instead.')
class TTDoorSensor {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN_DOOR_SENSOR = 'doorSensorStartScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN_DOOR_SENSOR = 'doorSensorStopScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_DOOR_SENSOR = 'doorSensorInit';

  static StreamSubscription<TTRemoteAccessoryScanModel>? _scanSub;
  
  /// Legacy: scan for door sensors via callback. Prefer [new_ttlock.TTLock.doorSensor.accessoryStartScanDoorSensor].
  @Deprecated('Use TTLock.doorSensor.accessoryStartScanDoorSensor() and listen to the stream instead.')
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    _scanSub?.cancel();
    _scanSub = new_ttlock.TTLock.doorSensor.accessoryStartScanDoorSensor().listen(scanCallback);
  }

  /// Legacy: stop door sensor scan. Prefer cancelling the stream subscription.
  @Deprecated('Cancel the subscription from accessoryStartScanDoorSensor().')
  static void stopScan() {
    _scanSub?.cancel();
    _scanSub = null;
  }

  /// Legacy: init door sensor via callbacks. Prefer [new_ttlock.TTLock.doorSensor.initDoorSensor].
  @Deprecated('Use TTLock.doorSensor.initDoorSensor(mac, lockData) instead.')
  static void init(
    String mac,
    String lockData,
    TTGetLockSystemCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.doorSensor
        .initDoorSensor(mac, lockData)
        .then(callback).catchError((e, _) {
      if (e is TTRemoteAccessoryException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTRemoteAccessoryError.failed, e.toString());
      }
    });
  }
}
