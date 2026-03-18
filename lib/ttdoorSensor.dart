import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_accessory_exception.dart';

/// Legacy door sensor API. Prefer [new_ttlock.TTLock.accessory] instead.
@Deprecated('Use TTLock.accessory.startScanDoorSensor() / stopScanDoorSensor() / initDoorSensor() instead.')
class TTDoorSensor {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN_DOOR_SENSOR = 'doorSensorStartScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN_DOOR_SENSOR = 'doorSensorStopScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_DOOR_SENSOR = 'doorSensorInit';

  /// Legacy: scan for door sensors via callback. Prefer [new_ttlock.TTLock.accessory.startScanDoorSensor].
  @Deprecated('Use TTLock.accessory.startScanDoorSensor() and listen to the stream instead.')
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    new_ttlock.TTLock.accessory.startScanDoorSensor().listen((model) {
      final legacyMap = {
        'name': model.name,
        'mac': model.mac,
        'rssi': model.rssi,
        'isMultifunctionalKeypad': model.isMultifunctionalKeypad,
        'advertisementData': model.advertisementData,
      };
      scanCallback(TTRemoteAccessoryScanModel.fromMap(Map<String, dynamic>.from(legacyMap)));
    });
  }

  /// Legacy: stop door sensor scan. Prefer [new_ttlock.TTLock.accessory.stopScanDoorSensor].
  @Deprecated('Use TTLock.accessory.stopScanDoorSensor() instead.')
  static void stopScan() {
    new_ttlock.TTLock.accessory.stopScanDoorSensor();
  }

  /// Legacy: init door sensor via callbacks. Prefer [new_ttlock.TTLock.accessory.initDoorSensor].
  @Deprecated('Use TTLock.accessory.initDoorSensor(mac: mac, lockData: lockData) instead.')
  static void init(
    String mac,
    String lockData,
    TTGetLockSystemCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.accessory
        .initDoorSensor(mac: mac, lockData: lockData)
        .then((model) {
      final legacyMap = {
        'modelNum': model.modelNum,
        'hardwareRevision': model.hardwareRevision,
        'firmwareRevision': model.firmwareRevision,
        'electricQuantity': model.electricQuantity,
        'nbOperator': model.nbOperator,
        'nbNodeId': model.nbNodeId,
        'nbCardNumber': model.nbCardNumber,
        'nbRssi': model.nbRssi,
        'lockData': model.lockData,
      };
      callback(TTLockSystemModel.fromMap(Map<String, dynamic>.from(legacyMap)));
    }).catchError((e, _) {
      if (e is TTAccessoryException) {
        final error = e.code >= 0 && e.code < TTRemoteAccessoryError.values.length
            ? TTRemoteAccessoryError.values[e.code]
            : TTRemoteAccessoryError.fail;
        failedCallback(error, e.message);
      } else {
        failedCallback(TTRemoteAccessoryError.fail, e.toString());
      }
    });
  }
}
