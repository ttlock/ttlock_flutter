import 'dart:convert' as convert;

import 'package:ttlock_premise_flutter/src/tt_response.dart';
import 'package:ttlock_premise_flutter/src/ttlock_commands.dart';
import 'package:ttlock_premise_flutter/src/ttgateway_commands.dart';
import 'package:ttlock_premise_flutter/src/ttremotekey_commands.dart';
import 'package:ttlock_premise_flutter/src/ttremotekeypad_commands.dart';
import 'package:ttlock_premise_flutter/src/ttdoorsensor_commands.dart';
import 'package:ttlock_premise_flutter/src/ttlock_types.dart';

/// Success handler: (callback, data, isOnPremise). Used for commands that need isOnPremise (e.g. RESET_PASSCODE).
typedef SuccessHandler = void Function(
    dynamic callback, Map data, bool isOnPremise);

/// Progress handler: (callback, data).
typedef ProgressHandler = void Function(dynamic callback, Map data);

/// Error handler: (fail, otherFail, resolvedErrorCode, errorMessage, data).
typedef ErrorHandler = void Function(
    dynamic fail, dynamic otherFail, int resolvedErrorCode, String errorMessage, Map data);

/// Command → success/progress/error handler tables. Replaces giant switch in channel.
class TTLockHandlers {
  TTLockHandlers._();

  static void _defaultSuccess(dynamic c, Map d, bool _) {
    (c as TTSuccessCallback)();
  }

  static final Map<String, SuccessHandler> successHandlers = {
    TTLockCommands.COMMAND_GET_BLUETOOTH_STATE: (c, d, _) {
      (c as TTBluetoothStateCallback)(TTBluetoothState.values[d[TTResponse.state]]);
    },
    TTLockCommands.COMMAND_START_SCAN_LOCK: (c, d, _) {
      (c as TTLockScanCallback)(TTLockScanModel(d));
    },
    TTGatewayCommands.COMMAND_START_SCAN_GATEWAY: (c, d, _) {
      (c as TTGatewayScanCallback)(TTGatewayScanModel(d));
    },
    TTRemoteKeyCommands.COMMAND_START_SCAN_REMOTE_KEY: (c, d, _) {
      (c as TTRemoteAccessoryScanCallback)(TTRemoteAccessoryScanModel(d));
    },
    TTRemoteKeypadCommands.COMMAND_START_SCAN_REMOTE_KEYPAD: (c, d, _) {
      (c as TTRemoteAccessoryScanCallback)(TTRemoteAccessoryScanModel(d));
    },
    TTDoorSensorCommands.COMMAND_START_SCAN_DOOR_SENSOR: (c, d, _) {
      (c as TTRemoteAccessoryScanCallback)(TTRemoteAccessoryScanModel(d));
    },
    TTLockCommands.COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME: (c, d, _) {
      (c as TTGetLockAutomaticLockingPeriodicTimeCallback)(
          d[TTResponse.currentTime], d[TTResponse.minTime], d[TTResponse.maxTime]);
    },
    TTLockCommands.COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE: (c, d, _) {
      (c as TTGetSwitchStateCallback)(d[TTResponse.isOn]);
    },
    TTLockCommands.COMMAND_GET_LOCK_CONFIG: (c, d, _) {
      (c as TTGetSwitchStateCallback)(d[TTResponse.isOn]);
    },
    TTLockCommands.COMMAND_GET_LOCK_DIRECTION: (c, d, _) {
      (c as TTGetLockDirectionCallback)(TTLockDirection.values[d[TTResponse.direction]]);
    },
    TTLockCommands.COMMAND_GET_LOCK_SYSTEM_INFO: (c, d, _) {
      (c as TTGetLockSystemCallback)(TTLockSystemModel(d));
    },
    TTRemoteKeyCommands.COMMAND_INIT_REMOTE_KEY: (c, d, _) {
      (c as TTGetLockSystemCallback)(TTLockSystemModel(d));
    },
    TTDoorSensorCommands.COMMAND_INIT_DOOR_SENSOR: (c, d, _) {
      (c as TTGetLockSystemCallback)(TTLockSystemModel(d));
    },
    TTLockCommands.COMMAND_INIT_LOCK: (c, d, _) {
      (c as TTLockDataCallback)(d[TTResponse.lockData]);
    },
    TTLockCommands.COMMAND_RESET_EKEY: (c, d, _) {
      (c as TTLockDataCallback)(d[TTResponse.lockData]);
    },
    TTLockCommands.COMMAND_RESET_PASSCODE: (c, d, isOnPremise) {
      if (isOnPremise) {
        (c as TTLockDataCallback)(d[TTResponse.lockData]);
      } else {
        (c as TTSuccessCallback)();
      }
    },
    TTLockCommands.COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE: (c, d, _) {
      (c as TTLockDataCallback)(d[TTResponse.lockData]);
    },
    TTLockCommands.COMMAND_GET_PASSCODE_VERIFICATION_PARAMS: (c, d, _) {
      (c as TTLockDataCallback)(d[TTResponse.lockData]);
    },
    TTLockCommands.COMMAND_CONTROL_LOCK: (c, d, _) {
      (c as TTControlLockCallback)(d[TTResponse.lockTime],
          d[TTResponse.electricQuantity], d[TTResponse.uniqueId]);
    },
    TTLockCommands.COMMAND_ACTIVE_LIFT_FLOORS: (c, d, _) {
      (c as TTLiftCallback)(d[TTResponse.lockTime],
          d[TTResponse.electricQuantity], d[TTResponse.uniqueId]);
    },
    TTLockCommands.COMMAND_MODIFY_ADMIN_PASSCODE: (c, d, isOnPremise) {
      if (isOnPremise) {
        (c as TTLockDataCallback)(d[TTResponse.lockData]);
      } else {
        (c as TTSuccessCallback)();
      }
    },
    TTLockCommands.COMMAND_GET_ADMIN_PASSCODE: (c, d, _) {
      (c as TTGetAdminPasscodeCallback)(d[TTResponse.adminPasscode]);
    },
    TTLockCommands.COMMAND_ADD_CARD: (c, d, _) {
      (c as TTCardNumberCallback)(d[TTResponse.cardNumber]);
    },
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD: (c, d, _) {
      (c as TTCardNumberCallback)(d[TTResponse.cardNumber]);
    },
    TTLockCommands.COMMAND_ADD_FINGERPRINT: (c, d, _) {
      (c as TTAddFingerprintCallback)(d[TTResponse.fingerprintNumber]);
    },
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT: (c, d, _) {
      (c as TTAddFingerprintCallback)(d[TTResponse.fingerprintNumber]);
    },
    TTLockCommands.COMMAND_GET_LOCK_SWITCH_STATE: (c, d, _) {
      (c as TTGetLockStatusCallback)(TTLockSwitchState.values[d[TTResponse.lockSwitchState]]);
    },
    TTLockCommands.COMMAND_GET_LOCK_TIME: (c, d, _) {
      (c as TTGetLockTimeCallback)(d[TTResponse.timestamp]);
    },
    TTLockCommands.COMMAND_GET_LOCK_OPERATE_RECORD: (c, d, _) {
      (c as TTGetLockOperateRecordCallback)(d[TTResponse.records] ?? "");
    },
    TTLockCommands.COMMAND_GET_LOCK_POWER: (c, d, _) {
      (c as TTGetLockElectricQuantityCallback)(d[TTResponse.electricQuantity]);
    },
    TTLockCommands.COMMAND_SET_NB_ADDRESS: (c, d, _) {
      (c as TTGetLockElectricQuantityCallback)(d[TTResponse.electricQuantity]);
    },
    TTLockCommands.COMMAND_FUNCTION_SUPPORT: (c, d, _) {
      (c as TTFunctionSupportCallback)(d[TTResponse.isSupport]);
    },
    TTLockCommands.COMMAND_GET_NB_AWAKE_MODES: (c, d, _) {
      (c as TTGetNbAwakeModesCallback)(d[TTResponse.nbAwakeModes]);
    },
    TTLockCommands.COMMAND_GET_ALL_VALID_PASSCODE: (c, d, _) {
      List list = [];
      String? s = d[TTResponse.passcodeListString];
      if (s != null) list = convert.jsonDecode(s);
      (c as TTGetAllPasscodeCallback)(list);
    },
    TTLockCommands.COMMAND_GET_ALL_VALID_CARD: (c, d, _) {
      List list = [];
      String? s = d[TTResponse.cardListString];
      if (s != null) list = convert.jsonDecode(s);
      (c as TTGetAllCardsCallback)(list);
    },
    TTLockCommands.COMMAND_GET_ALL_VALID_FINGERPRINT: (c, d, _) {
      List list = [];
      String? s = d[TTResponse.fingerprintListString];
      if (s != null) list = convert.jsonDecode(s);
      (c as TTGetAllFingerprintsCallback)(list);
    },
    TTLockCommands.COMMAND_GET_NB_AWAKE_TIMES: (c, d, _) {
      List<Map> nbAwakeTimeList = d[TTResponse.nbAwakeTimeList];
      List<TTNbAwakeTimeModel> list = [];
      for (var element in nbAwakeTimeList) {
        TTNbAwakeTimeModel model = TTNbAwakeTimeModel();
        model.minutes = element[TTResponse.minutes];
        model.type = TTNbAwakeTimeType.values[element[TTResponse.type]];
        list.add(model);
      }
      (c as TTGetNbAwakeTimesCallback)(list);
    },
    TTLockCommands.COMMAND_GET_LOCK_VERSION: (c, d, _) {
      (c as TTGetLockVersionCallback)(d[TTResponse.lockVersion]);
    },
    TTLockCommands.COMMAND_SCAN_WIFI: (c, d, _) {
      (c as TTWifiLockScanWifiCallback)(d[TTResponse.finished], d[TTResponse.wifiList]);
    },
    TTLockCommands.COMMAND_GET_WIFI_INFO: (c, d, _) {
      (c as TTWifiLockGetWifiInfoCallback)(TTWifiInfoModel(d));
    },
    TTLockCommands.COMMAND_CONFIG_CAMERA_LOCK_WIFI: (c, d, _) {
      (c as TTCameraLockConfigWifiCallback)(
          d[TTResponse.videoModuleSerialNumber], d[TTResponse.wifiName]);
    },
    TTLockCommands.COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME: (c, d, _) {
      (c as TTGetLockSoundWithSoundVolumeCallback)(
          TTSoundVolumeType.values[d[TTResponse.soundVolumeType]]);
    },
    TTLockCommands.COMMAND_GET_LOCK_FRETURE_VALUE: (c, d, _) {
      (c as TTLockDataCallback)(d[TTResponse.lockData]);
    },
    TTGatewayCommands.COMMAND_CONNECT_GATEWAY: (c, d, _) {
      (c as TTGatewayConnectCallback)(TTGatewayConnectStatus.values[d[TTResponse.status]]);
    },
    TTGatewayCommands.COMMAND_GET_SURROUND_WIFI: (c, d, _) {
      (c as TTGatewayGetAroundWifiCallback)(d[TTResponse.finished], d[TTResponse.wifiList]);
    },
    TTGatewayCommands.COMMAND_INIT_GATEWAY: (c, d, _) {
      (c as TTGatewayInitCallback)(d);
    },
    TTLockCommands.COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY: (c, d, _) {
      (c as TTGetLockAccessoryElectricQuantity)(
          d[TTResponse.electricQuantity], d[TTResponse.updateDate]);
    },
    TTRemoteKeypadCommands.COMMAND_INIT_REMOTE_KEYPAD: (c, d, _) {
      (c as TTRemoteKeypadInitSuccessCallback)(d[TTResponse.electricQuantity],
          d[TTResponse.wirelessKeypadFeatureValue]);
    },
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK: (c, d, _) {
      (c as TTRemoteKeypadGetStoredLockSuccessCallback)(d["lockMacs"]);
    },
    TTRemoteKeypadCommands.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD: (c, d, _) {
      var systemInfoModelMap = d["systemInfoModel"] ?? {};
      (c as TTMultifunctionalRemoteKeypadInitSuccessCallback)(
          d["electricQuantity"],
          d["wirelessKeypadFeatureValue"],
          d["slotNumber"],
          d["slotLimit"],
          systemInfoModelMap["modelNum"],
          systemInfoModelMap["hardwareRevision"],
          systemInfoModelMap["firmwareRevision"],
      );
    },
    TTLockCommands.COMMAND_ADD_FACE: (c, d, _) {
      (c as TTAddFaceSuccessCallback)(d[TTResponse.faceNumber]);
    },
    TTLockCommands.COMMAND_ADD_FACE_DATA: (c, d, _) {
      (c as TTAddFaceSuccessCallback)(d[TTResponse.faceNumber]);
    },
  };

  static void runSuccess(String command, dynamic callback, Map data, bool isOnPremise) {
    SuccessHandler? h = successHandlers[command];
    if (h != null) {
      h(callback, data, isOnPremise);
    } else {
      _defaultSuccess(callback, data, isOnPremise);
    }
  }

  // --- Progress handlers ---
  static final Map<String, ProgressHandler> progressHandlers = {
    TTLockCommands.COMMAND_ADD_CARD: (c, _) {
      (c as TTAddCardProgressCallback)();
    },
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD: (c, _) {
      (c as TTAddCardProgressCallback)();
    },
    TTLockCommands.COMMAND_ADD_FINGERPRINT: (c, d) {
      (c as TTAddFingerprintProgressCallback)(
          d[TTResponse.currentCount], d[TTResponse.totalCount]);
    },
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT: (c, d) {
      (c as TTAddFingerprintProgressCallback)(
          d[TTResponse.currentCount], d[TTResponse.totalCount]);
    },
    TTLockCommands.COMMAND_ADD_FACE: (c, d) {
      (c as TTAddFaceProgressCallback)(TTFaceState.values[d[TTResponse.state]],
          TTFaceErrorCode.values[d[TTResponse.errorCode]]);
    },
  };

  static void runProgress(String command, dynamic callback, Map data) {
    ProgressHandler? h = progressHandlers[command];
    if (h != null) {
      h(callback, data);
    }
  }

  // --- Error handlers: gateway / remote / multifunctional keypad / default ---
  static void _gatewayError(dynamic fail, dynamic otherFail, int code, String msg, Map data) {
    TTGatewayFailedCallback? cb = fail;
    if (cb != null) cb(TTGatewayError.values[code], msg);
  }

  static void _remoteError(dynamic fail, dynamic otherFail, int code, String msg, Map data) {
    TTRemoteFailedCallback? cb = fail;
    if (cb != null) cb(TTRemoteAccessoryError.values[code], msg);
  }

  static void _multifunctionalKeypadError(dynamic fail, dynamic otherFail, int code, String msg, Map data) {
    if (data["errorDevice"] == TTErrorDevice.keyPad.index) {
      TTRemoteKeypadFailedCallback? cb = otherFail;
      if (cb != null) cb(TTRemoteKeyPadAccessoryError.values[code], msg);
    } else {
      int c = code < 0 ? 0 : code;
      TTFailedCallback? cb = fail is TTFailedCallback ? fail : null;
      if (cb != null) cb(TTLockError.values[c], msg);
    }
  }

  static void _defaultError(dynamic fail, dynamic otherFail, int code, String msg, Map data) {
    TTFailedCallback? cb = fail;
    if (cb != null) cb(TTLockError.values[code], msg);
  }

  static const Set<String> _gatewayErrorCommands = {
    TTGatewayCommands.COMMAND_GET_SURROUND_WIFI,
    TTGatewayCommands.COMMAND_INIT_GATEWAY,
    TTGatewayCommands.COMMAND_CONFIG_IP,
    TTGatewayCommands.COMMAND_UPGRADE_GATEWAY,
  };

  static const Set<String> _remoteErrorCommands = {
    TTRemoteKeyCommands.COMMAND_INIT_REMOTE_KEY,
    TTDoorSensorCommands.COMMAND_INIT_DOOR_SENSOR,
    TTRemoteKeypadCommands.COMMAND_INIT_REMOTE_KEYPAD,
  };

  static const Set<String> _multifunctionalKeypadErrorCommands = {
    TTRemoteKeypadCommands.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD,
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK,
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK,
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT,
    TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD,
  };

  static ErrorHandler errorHandlerFor(String command) {
    if (_gatewayErrorCommands.contains(command)) return _gatewayError;
    if (_remoteErrorCommands.contains(command)) return _remoteError;
    if (_multifunctionalKeypadErrorCommands.contains(command)) return _multifunctionalKeypadError;
    return _defaultError;
  }
}
