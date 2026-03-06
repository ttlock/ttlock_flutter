import 'package:flutter/services.dart';

import 'package:ttlock_premise_flutter/src/tt_response.dart';
import 'package:ttlock_premise_flutter/src/ttlock_commands.dart';
import 'package:ttlock_premise_flutter/src/ttlock_handlers.dart';
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

  /// All "start scan" commands; used for queue cleanup and shouldRemoveFromQueue.
  static const Set<String> _scanStartCommands = {
    TTLockCommands.COMMAND_START_SCAN_LOCK,
    TTGatewayCommands.COMMAND_START_SCAN_GATEWAY,
    TTDoorSensorCommands.COMMAND_START_SCAN_DOOR_SENSOR,
    TTRemoteKeyCommands.COMMAND_START_SCAN_REMOTE_KEY,
    TTRemoteKeypadCommands.COMMAND_START_SCAN_REMOTE_KEYPAD,
  };

  /// All "stop scan" commands; these are not queued.
  static const Set<String> _scanStopCommands = {
    TTLockCommands.COMMAND_STOP_SCAN_LOCK,
    TTGatewayCommands.COMMAND_STOP_SCAN_GATEWAY,
    TTDoorSensorCommands.COMMAND_STOP_SCAN_DOOR_SENSOR,
    TTRemoteKeyCommands.COMMAND_STOP_SCAN_REMOTE_KEY,
    TTRemoteKeypadCommands.COMMAND_STOP_SCAN_REMOTE_KEYPAD,
  };

  static final List<String> scanCommandList = [
    ..._scanStartCommands,
    ..._scanStopCommands,
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

    // On any start-scan command, clear existing scan entries from queue.
    if (_scanStartCommands.contains(command)) {
      _commandQueue.removeWhere((map) => _scanStartCommands.contains(map.keys.first));
    }

    if (_scanStopCommands.contains(command)) {
      // Stop-scan commands are not queued.
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
      if (key == command) {
        callBack = map[command][TTLockCommands.CALLBACK_SUCCESS];
        index = i;
        break;
      }
    }
    // Remove this entry from queue unless it's a streaming/scan command that stays for more results.
    bool shouldRemoveFromQueue = true;
    if (index == -1) {
      shouldRemoveFromQueue = false;
    } else {
      if (_scanStartCommands.contains(command)) {
        shouldRemoveFromQueue = false;
      }
      if (command == TTLockCommands.COMMAND_SCAN_WIFI &&
          data[TTResponse.finished] == false) {
        shouldRemoveFromQueue = false;
      }
      if (command == TTGatewayCommands.COMMAND_GET_SURROUND_WIFI &&
          data[TTResponse.finished] == false) {
        shouldRemoveFromQueue = false;
      }
    }
    if (shouldRemoveFromQueue) {
      _commandQueue.removeAt(index);
    }

    if (callBack == null) {
      if (printLog) {
        print(
            "********************************************  $command callback null *********************************************");
      }
      return;
    }
    TTLockHandlers.runSuccess(command, callBack, data, isOnPremise);
  }

  static void _progressCallback(String command, Map data) {
    dynamic callBack;
    for (var i = 0; i < _commandQueue.length; i++) {
      Map map = _commandQueue[i];
      String key = map.keys.first;
      if (key == command) {
        callBack = map[command][TTLockCommands.CALLBACK_PROGRESS];
        break;
      }
    }
    if (callBack != null) {
      TTLockHandlers.runProgress(command, callBack, data);
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
      if (key == command) {
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

    TTLockHandlers.errorHandlerFor(command)(
        callBack, otherCallBack, resolvedErrorCode, errorMessage, data);
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
