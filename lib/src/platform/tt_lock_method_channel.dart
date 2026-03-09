import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ttlock_premise_flutter/errors/tt_accessory_exception.dart';
import 'package:ttlock_premise_flutter/errors/tt_exception.dart';
import 'package:ttlock_premise_flutter/errors/tt_gateway_exception.dart';
import 'package:ttlock_premise_flutter/errors/tt_lock_exception.dart';
import 'package:ttlock_premise_flutter/models/enums.dart';
import 'package:ttlock_premise_flutter/src/constants/commands.dart';
import 'package:ttlock_premise_flutter/src/platform/tt_lock_platform.dart';

/// MethodChannel + EventChannel implementation of [TTLockPlatform].
class TTLockMethodChannel implements TTLockPlatform {
  static const _commandChannel = MethodChannel('com.ttlock/command/ttlock');
  static const _eventChannel = EventChannel('com.ttlock/listen/ttlock');

  bool _listening = false;

  @override
  bool printLog = true;

  /// Pending completers for one-shot commands, keyed by command name.
  final _completers = <String, Completer<Map<String, dynamic>>>{};

  /// Active stream controllers for streaming/progress commands, keyed by command name.
  final _streams = <String, StreamController<PlatformStreamEvent>>{};

  void _ensureListening() {
    if (_listening) return;
    _listening = true;
    _eventChannel
        .receiveBroadcastStream('TTLockListen')
        .listen(_onEvent, onError: _onError);
  }

  @override
  Future<Map<String, dynamic>> invoke(String command, [Object? params]) {
    _ensureListening();

    final existing = _completers.remove(command);
    if (existing != null && !existing.isCompleted) {
      existing.completeError(
        const TTException(code: -1, message: 'Superseded by a new request'),
      );
    }

    final completer = Completer<Map<String, dynamic>>();
    _completers[command] = completer;
    _commandChannel.invokeMethod(command, params);
    return completer.future;
  }

  @override
  Future<void> send(String command, [Object? params]) async {
    _ensureListening();
    await _commandChannel.invokeMethod(command, params);

    final startCommand = TTCommands.scanStopToStartMap[command];
    if (startCommand != null) {
      _streams.remove(startCommand)?.close();
    }
  }

  @override
  Stream<PlatformStreamEvent> eventStream(String command, [Object? params]) {
    _ensureListening();

    _streams[command]?.close();
    final controller = StreamController<PlatformStreamEvent>.broadcast();
    _streams[command] = controller;

    _commandChannel.invokeMethod(command, params);
    return controller.stream;
  }

  // ---------------------------------------------------------------------------
  // Event routing
  // ---------------------------------------------------------------------------

  void _onEvent(dynamic value) {
    if (printLog) print('TTLock: $value');

    final map = value as Map;
    final command = map['command'] as String;
    final rawData = map['data'] as Map?;
    final data = rawData?.cast<String, dynamic>() ?? <String, dynamic>{};
    final resultState = map['resultState'] as int;

    if (resultState == 2) {
      _handleError(command, map, data);
    } else if (resultState == 1) {
      _handleProgress(command, data);
    } else {
      _handleSuccess(command, data);
    }
  }

  void _handleError(String command, Map event, Map<String, dynamic> data) {
    final errorCode = event['errorCode'] as int;
    final errorMessage = (event['errorMessage'] as String?) ?? '';
    final exception = _buildException(command, errorCode, errorMessage, data);

    final stream = _streams[command];
    if (stream != null) {
      stream.addError(exception);
      if (!_keepStreamOnError(command, data)) {
        _streams.remove(command)?.close();
      }
    } else {
      final completer = _completers.remove(command);
      if (completer != null && !completer.isCompleted) {
        completer.completeError(exception);
      }
    }
  }

  void _handleProgress(String command, Map<String, dynamic> data) {
    _streams[command]?.add(PlatformStreamEvent(isProgress: true, data: data));
  }

  void _handleSuccess(String command, Map<String, dynamic> data) {
    final stream = _streams[command];
    if (stream != null) {
      stream.add(PlatformStreamEvent(isProgress: false, data: data));
      if (_shouldCloseStreamOnSuccess(command, data)) {
        _streams.remove(command)?.close();
      }
    } else {
      final completer = _completers.remove(command);
      if (completer != null && !completer.isCompleted) {
        completer.complete(data);
      }
    }
  }

  void _onError(Object error) {
    if (printLog) print('TTLock EventChannel error: $error');
  }

  // ---------------------------------------------------------------------------
  // Stream lifecycle helpers
  // ---------------------------------------------------------------------------

  bool _shouldCloseStreamOnSuccess(String command, Map<String, dynamic> data) {
    if (TTCommands.scanStartCommands.contains(command)) return false;
    if (command == TTCommands.scanWifi || command == TTCommands.getSurroundWifi) {
      return data['finished'] == true;
    }
    return true;
  }

  bool _keepStreamOnError(String command, Map<String, dynamic> data) {
    if (command == TTCommands.multifunctionalKeypadAddFingerprint &&
        data['errorDevice'] == TTErrorDevice.keyPad.value) {
      return true;
    }
    return false;
  }

  // ---------------------------------------------------------------------------
  // Exception building
  // ---------------------------------------------------------------------------

  Exception _buildException(
    String command,
    int errorCode,
    String errorMessage,
    Map<String, dynamic> data,
  ) {
    if (TTCommands.gatewayErrorCommands.contains(command)) {
      final code = errorCode < TTGatewayError.values.length ? errorCode : 0;
      return TTGatewayException(error: TTGatewayError.fromValue(code), message: errorMessage);
    }

    if (TTCommands.remoteErrorCommands.contains(command)) {
      final code = errorCode < TTRemoteAccessoryError.values.length ? errorCode : 0;
      return TTAccessoryException(code: code, message: errorMessage);
    }

    if (TTCommands.multifunctionalKeypadErrorCommands.contains(command)) {
      if (data['errorDevice'] == TTErrorDevice.keyPad.value) {
        final code = errorCode < TTRemoteKeyPadAccessoryError.values.length ? errorCode : 0;
        return TTAccessoryException(code: code, message: errorMessage);
      }
    }

    var code = errorCode;
    var msg = errorMessage;
    if (code == TTLockError.lockIsBusy.value) {
      msg = 'The TTLock SDK can only communicate with one lock at a time';
    }
    if (code > TTLockError.wrongWifiPassword.value) {
      code = TTLockError.fail.value;
    }
    return TTLockException(error: TTLockError.fromValue(code), message: msg);
  }
}
