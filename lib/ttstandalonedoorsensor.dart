import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_accessory_exception.dart';
import 'package:ttlock_premise_flutter/models/standalone_door_sensor_models.dart';
import 'dart:convert';

@Deprecated('Use Stream<TTStandaloneDoorSensorScanModel> from TTLock.accessory.startScanStandaloneDoorSensor().')
typedef TTStandaloneDoorSensorScanCallback = void Function(TTStandaloneDoorSensorScanModel scanModel);

@Deprecated('Use Future<TTStandaloneDoorSensorInfo> from TTLock.accessory.standaloneDoorSensorInit(...).')
typedef TTStandaloneDoorSensorInitCallback = void Function(TTStandaloneDoorSensorInfo info);

@Deprecated('Use Future<String> from TTLock.accessory.getStandaloneDoorSensorFeatureValue(mac: ...).')
typedef TTStandaloneDoorSensorFeatureValueCallback = void Function(String featureValue);

/// Legacy standalone door sensor API. Prefer [new_ttlock.TTLock.accessory] instead.
@Deprecated('Use TTLock.accessory.*StandaloneDoorSensor* APIs instead.')
class TTStandaloneDoorSensor {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN = 'standaloneDoorSensorStartScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN = 'standaloneDoorSensorStopScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT = 'standaloneDoorSensorInit';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_GET_FEATURE_VALUE = 'standaloneDoorGetFeatureValue';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_IS_SUPPORT_FUNCTION = 'standaloneDoorIsSupportFunction';

  @Deprecated('Use TTLock.accessory.startScanStandaloneDoorSensor() and listen to the stream instead.')
  static void startScan(TTStandaloneDoorSensorScanCallback scanCallback) {
    new_ttlock.TTLock.accessory.standaloneDoorSensorStartScan().listen(scanCallback);
  }

  @Deprecated('Use TTLock.accessory.stopScanStandaloneDoorSensor() instead.')
  static void stopScan() {
    new_ttlock.TTLock.accessory.standaloneDoorSensorStopScan();
  }

  @Deprecated('Use TTLock.accessory.initStandaloneDoorSensor(...) instead.')
  static void init(
    String mac,
    String? standaloneInfoStr,
    TTStandaloneDoorSensorInitCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    Map<String, dynamic> info = <String, dynamic>{};
    if (standaloneInfoStr != null && standaloneInfoStr.isNotEmpty) {
      try {
        final decoded = jsonDecode(standaloneInfoStr);
        if (decoded is Map) {
          info = Map<String, dynamic>.from(decoded);
        }
      } catch (_) {
        // ignore parse errors; keep empty info
      }
    }

    new_ttlock.TTLock.accessory
        .standaloneDoorSensorInit(mac: mac, info: Map<String, dynamic>.from(info))
        .then(callback)
        .catchError((e, _) {
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

  @Deprecated('Use TTLock.accessory.getStandaloneDoorSensorFeatureValue(mac: ...) instead.')
  static void getFeatureValue(
    String mac,
    TTStandaloneDoorSensorFeatureValueCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.accessory
        .standaloneDoorSensorReadFeatureValue(mac)
        .then(callback)
        .catchError((e, _) {
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

  @Deprecated('Use TTLock.accessory.isStandaloneDoorSensorSupportFunction(...) instead.')
  static bool isSupportFunction({
    required String featureValue,
    required int supportFunction,
  }) {
    // legacy 同步接口无法对齐新 API 的 Future；请迁移到 standaloneDoorSensorIsSupportFunctionAsync
    return false;
  }

  @Deprecated('Use TTLock.accessory.standaloneDoorSensorIsSupportFunction(...) instead.')
  static Future<bool> isSupportFunctionAsync({
    required String featureValue,
    required int supportFunction,
  }) {
    return new_ttlock.TTLock.accessory.standaloneDoorSensorIsSupportFunction(
      featureValue: featureValue,
      function: supportFunction,
    );
  }
}

