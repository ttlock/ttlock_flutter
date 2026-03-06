import 'dart:convert' as convert;

import 'package:flutter/services.dart';

import 'package:ttlock_premise_flutter/src/tt_response.dart';
import 'package:ttlock_premise_flutter/src/ttlock_commands.dart';
import 'package:ttlock_premise_flutter/src/ttlock_types.dart';
import 'package:ttlock_premise_flutter/src/ttgateway_commands.dart';
import 'package:ttlock_premise_flutter/src/ttremotekey_commands.dart';
import 'package:ttlock_premise_flutter/src/ttremotekeypad_commands.dart';
import 'package:ttlock_premise_flutter/src/ttdoorsensor_commands.dart';

/// Channel layer: MethodChannel/EventChannel, queue, invoke, event and callback dispatch.
/// Does not import ttlock.dart, ttgateway.dart, etc.; uses only command constants and types.
class TTLockChannel {
  TTLockChannel._();

  static bool isOnPremise = true;
  static bool printLog = true;

  static final MethodChannel _commandChannel =
      MethodChannel("com.ttlock/command/ttlock");
  static final EventChannel _listenChannel =
      EventChannel("com.ttlock/listen/ttlock");

  static final List _commandQueue = [];
  static bool isListenEvent = false;

  static final List<String> scanCommandList = [
    TTLockCommands.COMMAND_START_SCAN_LOCK,
    TTLockCommands.COMMAND_STOP_SCAN_LOCK,
    TTGatewayCommands.COMMAND_START_SCAN_GATEWAY,
    TTGatewayCommands.COMMAND_STOP_SCAN_GATEWAY,
    TTDoorSensorCommands.COMMAND_START_SCAN_DOOR_SENSOR,
    TTDoorSensorCommands.COMMAND_STOP_SCAN_DOOR_SENSOR,
    TTRemoteKeyCommands.COMMAND_START_SCAN_REMOTE_KEY,
    TTRemoteKeyCommands.COMMAND_STOP_SCAN_REMOTE_KEY,
    TTRemoteKeypadCommands.COMMAND_START_SCAN_REMOTE_KEYPAD,
    TTRemoteKeypadCommands.COMMAND_STOP_SCAN_REMOTE_KEYPAD,
  ];

  static void invoke(
    String command,
    Object? parameter,
    Object? success, {
    Object? progress,
    Object? fail,
    Object? otherFail,
  }) {
    if (!isListenEvent) {
      isListenEvent = true;
      _listenChannel
          .receiveBroadcastStream("TTLockListen")
          .listen(_onEvent, onError: _onError);
    }

    scanCommandList.forEach((scanCommand) {
      if (command.compareTo(scanCommand) == 0) {
        List removeMapList = [];
        _commandQueue.forEach((map) {
          String key = map.keys.first;
          if (key.compareTo(TTLockCommands.COMMAND_START_SCAN_LOCK) == 0 ||
              key.compareTo(TTGatewayCommands.COMMAND_START_SCAN_GATEWAY) == 0 ||
              key.compareTo(TTRemoteKeyCommands.COMMAND_START_SCAN_REMOTE_KEY) ==
                  0 ||
              key.compareTo(
                      TTRemoteKeypadCommands.COMMAND_START_SCAN_REMOTE_KEYPAD) ==
                  0 ||
              key.compareTo(
                      TTDoorSensorCommands.COMMAND_START_SCAN_DOOR_SENSOR) ==
                  0) {
            removeMapList.add(map);
          }
        });
        removeMapList.forEach((map) {
          _commandQueue.remove(map);
        });
      }
    });

    if (command == TTLockCommands.COMMAND_STOP_SCAN_LOCK ||
        command == TTGatewayCommands.COMMAND_STOP_SCAN_GATEWAY ||
        command == TTRemoteKeyCommands.COMMAND_STOP_SCAN_REMOTE_KEY ||
        command == TTRemoteKeypadCommands.COMMAND_STOP_SCAN_REMOTE_KEYPAD ||
        command == TTDoorSensorCommands.COMMAND_STOP_SCAN_DOOR_SENSOR) {
      // no queue for stop commands
    } else {
      Map commandMap = {};
      Map callbackMap = {};
      callbackMap[TTLockCommands.CALLBACK_SUCCESS] = success;
      callbackMap[TTLockCommands.CALLBACK_PROGRESS] = progress;
      callbackMap[TTLockCommands.CALLBACK_FAIL] = fail;
      callbackMap[TTLockCommands.CALLBACK_OTHER_FAIL] = otherFail;
      commandMap[command] = callbackMap;
      _commandQueue.add(commandMap);
    }

    _commandChannel.invokeMethod(command, parameter);
  }

  static void _successCallback(String command, Map data) {
    dynamic callBack;
    int index = -1;
    for (var i = 0; i < _commandQueue.length; i++) {
      Map map = _commandQueue[i];
      String key = map.keys.first;
      if (key.compareTo(command) == 0) {
        callBack = map[command][TTLockCommands.CALLBACK_SUCCESS];
        index = i;
        break;
      }
    }
    bool reomveCommand = true;
    if (index == -1) {
      reomveCommand = false;
    } else {
      if (command == TTLockCommands.COMMAND_START_SCAN_LOCK ||
          command == TTGatewayCommands.COMMAND_START_SCAN_GATEWAY ||
          command == TTRemoteKeyCommands.COMMAND_START_SCAN_REMOTE_KEY ||
          command == TTRemoteKeypadCommands.COMMAND_START_SCAN_REMOTE_KEYPAD ||
          command == TTDoorSensorCommands.COMMAND_START_SCAN_DOOR_SENSOR) {
        reomveCommand = false;
      }
      if (command == TTLockCommands.COMMAND_SCAN_WIFI &&
          data[TTResponse.finished] == false) {
        reomveCommand = false;
      }
      if (command == TTGatewayCommands.COMMAND_GET_SURROUND_WIFI &&
          data[TTResponse.finished] == false) {
        reomveCommand = false;
      }
    }
    if (reomveCommand) {
      _commandQueue.removeAt(index);
    }

    if (callBack == null) {
      if (printLog) {
        print(
            "********************************************  $command callback null *********************************************");
      }
      return;
    }
    switch (command) {
      case TTLockCommands.COMMAND_GET_BLUETOOTH_STATE:
        int stateValue = data[TTResponse.state];
        TTBluetoothState state = TTBluetoothState.values[stateValue];
        TTBluetoothStateCallback stateCallback = callBack;
        stateCallback(state);
        break;

      case TTLockCommands.COMMAND_START_SCAN_LOCK:
        TTLockScanCallback scanCallback = callBack;
        scanCallback(TTLockScanModel(data));
        break;

      case TTGatewayCommands.COMMAND_START_SCAN_GATEWAY:
        TTGatewayScanCallback scanCallback = callBack;
        scanCallback(TTGatewayScanModel(data));
        break;

      case TTRemoteKeyCommands.COMMAND_START_SCAN_REMOTE_KEY:
      case TTRemoteKeypadCommands.COMMAND_START_SCAN_REMOTE_KEYPAD:
      case TTDoorSensorCommands.COMMAND_START_SCAN_DOOR_SENSOR:
        TTRemoteAccessoryScanCallback scanCallback = callBack;
        scanCallback(TTRemoteAccessoryScanModel(data));
        break;

      case TTLockCommands.COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME:
        TTGetLockAutomaticLockingPeriodicTimeCallback
            getLockAutomaticLockingPeriodicTimeCallback = callBack;
        getLockAutomaticLockingPeriodicTimeCallback(
            data[TTResponse.currentTime],
            data[TTResponse.minTime],
            data[TTResponse.maxTime]);
        break;

      case TTLockCommands.COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE:
      case TTLockCommands.COMMAND_GET_LOCK_CONFIG:
        TTGetSwitchStateCallback switchStateCallback = callBack;
        switchStateCallback(data[TTResponse.isOn]);
        break;
      case TTLockCommands.COMMAND_GET_LOCK_DIRECTION:
        TTGetLockDirectionCallback lockDirectionCallback = callBack;
        int direction = data[TTResponse.direction];
        lockDirectionCallback(TTLockDirection.values[direction]);
        break;
      case TTLockCommands.COMMAND_GET_LOCK_SYSTEM_INFO:
      case TTRemoteKeyCommands.COMMAND_INIT_REMOTE_KEY:
      case TTDoorSensorCommands.COMMAND_INIT_DOOR_SENSOR:
        TTGetLockSystemCallback getLockSystemCallback = callBack;
        getLockSystemCallback(TTLockSystemModel(data));
        break;

      case TTLockCommands.COMMAND_INIT_LOCK:
      case TTLockCommands.COMMAND_RESET_EKEY:
      case TTLockCommands.COMMAND_RESET_PASSCODE:
      case TTLockCommands.COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE:
      case TTLockCommands.COMMAND_GET_PASSCODE_VERIFICATION_PARAMS:
        TTLockDataCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.lockData]);
        break;

      case TTLockCommands.COMMAND_CONTROL_LOCK:
        TTControlLockCallback controlLockCallback = callBack;
        controlLockCallback(data[TTResponse.lockTime],
            data[TTResponse.electricQuantity], data[TTResponse.uniqueId]);
        break;

      case TTLockCommands.COMMAND_ACTIVE_LIFT_FLOORS:
        TTLiftCallback liftCallback = callBack;
        liftCallback(data[TTResponse.lockTime],
            data[TTResponse.electricQuantity], data[TTResponse.uniqueId]);
        break;

      case TTLockCommands.COMMAND_RESET_PASSCODE:
      case TTLockCommands.COMMAND_MODIFY_ADMIN_PASSCODE:
        if (isOnPremise) {
          TTLockDataCallback lockDataCallback = callBack;
          lockDataCallback(data[TTResponse.lockData]);
        } else {
          TTSuccessCallback successCallback = callBack;
          successCallback();
        }
        break;

      case TTLockCommands.COMMAND_GET_ADMIN_PASSCODE:
        TTGetAdminPasscodeCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.adminPasscode]);
        break;

      case TTLockCommands.COMMAND_ADD_CARD:
      case TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD:
        TTCardNumberCallback addCardCallback = callBack;
        addCardCallback(data[TTResponse.cardNumber]);
        break;

      case TTLockCommands.COMMAND_ADD_FINGERPRINT:
      case TTRemoteKeypadCommands
            .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT:
        TTAddFingerprintCallback addFingerprintCallback = callBack;
        addFingerprintCallback(data[TTResponse.fingerprintNumber]);
        break;

      case TTLockCommands.COMMAND_GET_LOCK_SWITCH_STATE:
        TTGetLockStatusCallback getLockStatusCallback = callBack;
        int lockSwitchState = data[TTResponse.lockSwitchState];
        getLockStatusCallback(TTLockSwitchState.values[lockSwitchState]);
        break;

      case TTLockCommands.COMMAND_GET_LOCK_TIME:
        TTGetLockTimeCallback getLockTimeCallback = callBack;
        getLockTimeCallback(data[TTResponse.timestamp]);
        break;

      case TTLockCommands.COMMAND_GET_LOCK_OPERATE_RECORD:
        TTGetLockOperateRecordCallback getLockOperateRecordCallback = callBack;
        getLockOperateRecordCallback(data[TTResponse.records] ?? "");
        break;

      case TTLockCommands.COMMAND_GET_LOCK_POWER:
      case TTLockCommands.COMMAND_SET_NB_ADDRESS:
        TTGetLockElectricQuantityCallback getLockElectricQuantityCallback =
            callBack;
        getLockElectricQuantityCallback(data[TTResponse.electricQuantity]);
        break;

      case TTLockCommands.COMMAND_FUNCTION_SUPPORT:
        TTFunctionSupportCallback functionSupportCallback = callBack;
        functionSupportCallback(data[TTResponse.isSupport]);
        break;
      case TTLockCommands.COMMAND_GET_NB_AWAKE_MODES:
        TTGetNbAwakeModesCallback getNbAwakeModesCallback = callBack;
        getNbAwakeModesCallback(data[TTResponse.nbAwakeModes]);
        break;
      case TTLockCommands.COMMAND_GET_ALL_VALID_PASSCODE:
        TTGetAllPasscodeCallback getAllPasscodeCallback = callBack;
        List passcodeList = [];
        String? passcodeListString = data[TTResponse.passcodeListString];
        if (passcodeListString != null) {
          passcodeList = convert.jsonDecode(passcodeListString);
        }
        getAllPasscodeCallback(passcodeList);
        break;
      case TTLockCommands.COMMAND_GET_ALL_VALID_CARD:
        TTGetAllCardsCallback getAllCardsCallback = callBack;
        List cardList = [];
        String? cardListString = data[TTResponse.cardListString];
        if (cardListString != null) {
          cardList = convert.jsonDecode(cardListString);
        }
        getAllCardsCallback(cardList);
        break;
      case TTLockCommands.COMMAND_GET_ALL_VALID_FINGERPRINT:
        TTGetAllFingerprintsCallback getAllFingerprintsCallback = callBack;
        List fingerprintList = [];
        String? fingerprintListString =
            data[TTResponse.fingerprintListString];
        if (fingerprintListString != null) {
          fingerprintList = convert.jsonDecode(fingerprintListString);
        }
        getAllFingerprintsCallback(fingerprintList);
        break;
      case TTLockCommands.COMMAND_GET_NB_AWAKE_TIMES:
        TTGetNbAwakeTimesCallback getNbAwakeTimesCallback = callBack;
        List<Map> nbAwakeTimeList = data[TTResponse.nbAwakeTimeList];
        List<TTNbAwakeTimeModel> list = [];
        nbAwakeTimeList.forEach((element) {
          TTNbAwakeTimeModel model = TTNbAwakeTimeModel();
          model.minutes = element[TTResponse.minutes];
          model.type =
              TTNbAwakeTimeType.values[element[TTResponse.type]];
          list.add(model);
        });
        getNbAwakeTimesCallback(list);
        break;

      case TTLockCommands.COMMAND_GET_ADMIN_PASSCODE:
        TTGetAdminPasscodeCallback getAdminPasscodeCallback = callBack;
        getAdminPasscodeCallback(data[TTResponse.adminPasscode]);
        break;
      case TTLockCommands.COMMAND_GET_LOCK_VERSION:
        TTGetLockVersionCallback getLockVersionCallback = callBack;
        getLockVersionCallback(data[TTResponse.lockVersion]);
        break;
      case TTLockCommands.COMMAND_SCAN_WIFI:
        TTWifiLockScanWifiCallback scanWifiCallback = callBack;
        bool scanFinished = data[TTResponse.finished];
        List wifiList = data[TTResponse.wifiList];
        scanWifiCallback(scanFinished, wifiList);
        break;
      case TTLockCommands.COMMAND_GET_WIFI_INFO:
        TTWifiLockGetWifiInfoCallback getWifiInfoCallback = callBack;
        getWifiInfoCallback(TTWifiInfoModel(data));
        break;
      case TTLockCommands.COMMAND_CONFIG_CAMERA_LOCK_WIFI:
        TTCameraLockConfigWifiCallback cameraLockConfigWifiCallback = callBack;
        String serialNumber = data[TTResponse.videoModuleSerialNumber];
        String wifiName = data[TTResponse.wifiName];
        cameraLockConfigWifiCallback(serialNumber, wifiName);
        break;
      case TTLockCommands.COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME:
        int soundVolumeValue = data[TTResponse.soundVolumeType];
        TTSoundVolumeType soundVolumeType =
            TTSoundVolumeType.values[soundVolumeValue];
        TTGetLockSoundWithSoundVolumeCallback getLockSoundCallback = callBack;
        getLockSoundCallback(soundVolumeType);
        break;

      case TTLockCommands.COMMAND_GET_LOCK_FRETURE_VALUE:
        TTLockDataCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.lockData]);
        break;

      case TTGatewayCommands.COMMAND_CONNECT_GATEWAY:
        TTGatewayConnectCallback connectCallback = callBack;
        TTGatewayConnectStatus status =
            TTGatewayConnectStatus.values[data[TTResponse.status]];
        connectCallback(status);
        break;

      case TTGatewayCommands.COMMAND_GET_SURROUND_WIFI:
        TTGatewayGetAroundWifiCallback getAroundWifiCallback = callBack;
        bool gwFinished = data[TTResponse.finished];
        List gwWifiList = data[TTResponse.wifiList];
        getAroundWifiCallback(gwFinished, gwWifiList);
        break;

      case TTGatewayCommands.COMMAND_INIT_GATEWAY:
        TTGatewayInitCallback gatewayInitCallback = callBack;
        gatewayInitCallback(data);
        break;
      case TTLockCommands.COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY:
        TTGetLockAccessoryElectricQuantity getLockAccessoryElectricQuantity =
            callBack;
        getLockAccessoryElectricQuantity(
            data[TTResponse.electricQuantity], data[TTResponse.updateDate]);
        break;
      case TTRemoteKeypadCommands.COMMAND_INIT_REMOTE_KEYPAD:
        TTRemoteKeypadInitSuccessCallback remoteKeypadInitSuccessCallback =
            callBack;
        remoteKeypadInitSuccessCallback(data[TTResponse.electricQuantity],
            data[TTResponse.wirelessKeypadFeatureValue]);
        break;
      case TTRemoteKeypadCommands
            .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK:
        TTRemoteKeypadGetStoredLockSuccessCallback getStoredLocks = callBack;
        getStoredLocks(data["lockMacs"]);
        break;
      case TTRemoteKeypadCommands.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD:
        var systemInfoModelMap = data["systemInfoModel"] ?? {};
        TTMultifunctionalRemoteKeypadInitSuccessCallback initSuccessCallback =
            callBack;
        initSuccessCallback(
            data["electricQuantity"],
            data["wirelessKeypadFeatureValue"],
            data["slotNumber"],
            data["slotLimit"],
            systemInfoModelMap["modelNum"],
            systemInfoModelMap["hardwareRevision"],
            systemInfoModelMap["firmwareRevision"],
        );
        break;
      case TTLockCommands.COMMAND_ADD_FACE:
      case TTLockCommands.COMMAND_ADD_FACE_DATA:
        TTAddFaceSuccessCallback addFaceSuccessCallback = callBack;
        addFaceSuccessCallback(data[TTResponse.faceNumber]);
        break;
      default:
        TTSuccessCallback successCallback = callBack;
        successCallback();
    }
  }

  static void _progressCallback(String command, Map data) {
    dynamic callBack;
    for (var i = 0; i < _commandQueue.length; i++) {
      Map map = _commandQueue[i];
      String key = map.keys.first;
      if (key.compareTo(command) == 0) {
        callBack = map[command][TTLockCommands.CALLBACK_PROGRESS];
        break;
      }
    }
    switch (command) {
      case TTLockCommands.COMMAND_ADD_CARD:
      case TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD:
        TTAddCardProgressCallback progressCallback = callBack;
        progressCallback();
        break;
      case TTLockCommands.COMMAND_ADD_FINGERPRINT:
      case TTRemoteKeypadCommands
            .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT:
        TTAddFingerprintProgressCallback progressCallback = callBack;
        progressCallback(
            data[TTResponse.currentCount], data[TTResponse.totalCount]);
        break;
      case TTLockCommands.COMMAND_ADD_FACE:
        TTAddFaceProgressCallback progressCallback = callBack;
        progressCallback(TTFaceState.values[data[TTResponse.state]],
            TTFaceErrorCode.values[data[TTResponse.errorCode]]);
        break;
      default:
    }
  }

  static void _errorCallback(
      String command, int errorCode, String errorMessage, Map data) {
    if (errorCode == TTLockError.lockIsBusy.index) {
      errorMessage =
          "The TTLock SDK can only communicate with one lock at a time";
    }
    int resolvedErrorCode = errorCode;
    if (resolvedErrorCode > TTLockError.wrongWifiPassword.index) {
      resolvedErrorCode = TTLockError.fail.index;
    }

    dynamic callBack;
    dynamic otherCallBack;
    int index = -1;
    for (var i = 0; i < _commandQueue.length; i++) {
      Map map = _commandQueue[i];
      String key = map.keys.first;
      if (key.compareTo(command) == 0) {
        callBack = map[command][TTLockCommands.CALLBACK_FAIL];
        otherCallBack = map[command][TTLockCommands.CALLBACK_OTHER_FAIL];
        index = i;
        break;
      }
    }
    if (_commandQueue.length > 0 &&
        !(command ==
                TTRemoteKeypadCommands
                    .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT &&
            data["errorDevice"] == TTErrorDevice.keyPad.index &&
            resolvedErrorCode ==
                TTRemoteKeyPadAccessoryError.duplicateFingerprint.index)) {
      if (printLog) {
        print(
            "移除方法:$command;;;errorDevice:${data["errorDevice"]};;;;errorCode:${data["errorCode"]}");
      }
      if (index > -1) {
        _commandQueue.removeAt(index);
      }
    }

    if (command == TTGatewayCommands.COMMAND_GET_SURROUND_WIFI ||
        command == TTGatewayCommands.COMMAND_INIT_GATEWAY ||
        command == TTGatewayCommands.COMMAND_CONFIG_IP ||
        command == TTGatewayCommands.COMMAND_UPGRADE_GATEWAY) {
      TTGatewayFailedCallback? failedCallback = callBack;
      TTGatewayError error = TTGatewayError.values[resolvedErrorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    } else if (command == TTRemoteKeyCommands.COMMAND_INIT_REMOTE_KEY ||
        command == TTDoorSensorCommands.COMMAND_INIT_DOOR_SENSOR ||
        command == TTRemoteKeypadCommands.COMMAND_INIT_REMOTE_KEYPAD) {
      TTRemoteFailedCallback? failedCallback = callBack;
      TTRemoteAccessoryError error =
          TTRemoteAccessoryError.values[resolvedErrorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    } else if ((command ==
            TTRemoteKeypadCommands.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD) ||
        command ==
            TTRemoteKeypadCommands
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK ||
        command ==
            TTRemoteKeypadCommands
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK ||
        command ==
            TTRemoteKeypadCommands
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT ||
        command ==
            TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD) {
      if (data["errorDevice"] == TTErrorDevice.keyPad.index) {
        TTRemoteKeypadFailedCallback? failedCallback = otherCallBack;
        TTRemoteKeyPadAccessoryError error =
            TTRemoteKeyPadAccessoryError.values[resolvedErrorCode];
        if (failedCallback != null) {
          failedCallback(error, errorMessage);
        }
      } else {
        if (resolvedErrorCode < 0) {
          resolvedErrorCode = 0;
        }
        final TTFailedCallback? failCb =
            callBack is TTFailedCallback ? callBack : null;
        if (failCb != null) {
          failCb(TTLockError.values[resolvedErrorCode], errorMessage);
        }
      }
    } else {
      TTFailedCallback? failedCallback = callBack;
      TTLockError error = TTLockError.values[resolvedErrorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    }
  }

  static void _onEvent(dynamic value) {
    if (printLog) {
      print('TTLock listen: $value');
    }

    Map map = value;
    String command = map[TTResponse.command];
    Map data = map[TTResponse.data] == null ? {} : map[TTResponse.data];
    int resultState = map[TTResponse.resultState];

    if (resultState == TTLockReuslt.fail.index) {
      int errorCode = map[TTResponse.errorCode];
      String errorMessage = map[TTResponse.errorMessage] == null
          ? ""
          : map[TTResponse.errorMessage];
      _errorCallback(command, errorCode, errorMessage, data);
    } else if (resultState == TTLockReuslt.progress.index) {
      _progressCallback(command, data);
    } else {
      _successCallback(command, data);
    }
  }

  static void _onError(Object value) {
    if (printLog) {
      print('TTLockPlugin Error: $value');
    }
  }
}
