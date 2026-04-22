import 'dart:async';

import 'package:ttlock_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_flutter/ttlock_classic.dart';
import 'package:ttlock_flutter/errors/tt_remote_accessory_exception.dart';
import 'dart:convert';

@Deprecated('Use Stream<TTStandaloneDoorSensorScanModel> from TTLock.doorSensor.accessoryStandaloneDoorSensorStartScan().')
typedef TTStandaloneDoorSensorScanCallback = void Function(TTStandaloneDoorSensorScanModel scanModel);

@Deprecated('Use Future<TTStandaloneDoorSensorInfo> from TTLock.doorSensor.standaloneDoorSensorInit(...).')
typedef TTStandaloneDoorSensorInitCallback = void Function(TTStandaloneDoorSensorInfo info);

@Deprecated('Use Future<String> from TTLock.doorSensor.standaloneDoorSensorReadFeatureValue(mac).')
typedef TTStandaloneDoorSensorFeatureValueCallback = void Function(String featureValue);

/// Legacy standalone door sensor API. Prefer [new_ttlock.TTLock.doorSensor] instead.
@Deprecated('Use TTLock.doorSensor standalone APIs instead.')
class TTStandaloneDoorSensor {
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN = 'standaloneDoorSensorStartScan';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN = 'standaloneDoorSensorStopScan';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT = 'standaloneDoorSensorInit';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_GET_FEATURE_VALUE = 'standaloneDoorGetFeatureValue';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_IS_SUPPORT_FUNCTION = 'standaloneDoorIsSupportFunction';

  static StreamSubscription<TTStandaloneDoorSensorScanModel>? _scanSub;

  @Deprecated('Use TTLock.doorSensor.accessoryStandaloneDoorSensorStartScan() and listen to the stream instead.')
  static void startScan(TTStandaloneDoorSensorScanCallback scanCallback) {
    _scanSub?.cancel();
    _scanSub = new_ttlock.TTLock.doorSensor.accessoryStandaloneDoorSensorStartScan().listen(scanCallback);
  }

  @Deprecated('Cancel the subscription from accessoryStandaloneDoorSensorStartScan().')
  static void stopScan() {
    _scanSub?.cancel();
    _scanSub = null;
  }

  @Deprecated('Use TTLock.doorSensor.standaloneDoorSensorInit(...) instead.')
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

    new_ttlock.TTLock.doorSensor
        .standaloneDoorSensorInit(mac, Map<String, Object?>.from(info))
        .then(callback)
        .catchError((e, _) {
      if (e is TTRemoteAccessoryException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTRemoteAccessoryError.failed, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.doorSensor.standaloneDoorSensorReadFeatureValue(mac) instead.')
  static void getFeatureValue(
    String mac,
    TTStandaloneDoorSensorFeatureValueCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.doorSensor
        .standaloneDoorSensorReadFeatureValue(mac)
        .then(callback)
        .catchError((e, _) {
      if (e is TTRemoteAccessoryException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTRemoteAccessoryError.failed, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.doorSensor.standaloneDoorSensorIsSupportFunction(...) instead.')
  static bool isSupportFunction({
    required String featureValue,
    required int supportFunction,
  }) {
    // legacy 同步接口无法对齐新 API 的 Future；请迁移到 standaloneDoorSensorIsSupportFunctionAsync
    return false;
  }

  @Deprecated('Use TTLock.doorSensor.standaloneDoorSensorIsSupportFunction(...) instead.')
  static Future<bool> isSupportFunctionAsync({
    required String featureValue,
    required int supportFunction,
  }) {
    return new_ttlock.TTLock.doorSensor.standaloneDoorSensorIsSupportFunction(
      featureValue,
      supportFunction,
    );
  }
}
