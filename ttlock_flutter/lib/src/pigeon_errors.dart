import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter/src/ble_timeout.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

Never throwLockError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTLockException(TTLockError.fail, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTLockError.values.length) {
    throw TTLockException(TTLockError.values[i], msg);
  }
  throw TTLockException(TTLockError.fail, msg);
}

Never throwGatewayError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTGatewayException(TTGatewayError.failed, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTGatewayError.values.length) {
    throw TTGatewayException(TTGatewayError.values[i], msg);
  }
  throw TTGatewayException(TTGatewayError.failed, msg);
}

Never throwRemoteAccessoryError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTRemoteAccessoryException(TTRemoteAccessoryError.failed, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTRemoteAccessoryError.values.length) {
    throw TTRemoteAccessoryException(TTRemoteAccessoryError.values[i], msg);
  }
  throw TTRemoteAccessoryException(TTRemoteAccessoryError.failed, msg);
}

Never throwMultifunctionalKeypadError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTMultifunctionalKeypadException(TTMultifunctionalKeypadError.failed, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTMultifunctionalKeypadError.values.length) {
    throw TTMultifunctionalKeypadException(TTMultifunctionalKeypadError.values[i], msg);
  }
  throw TTMultifunctionalKeypadException(TTMultifunctionalKeypadError.failed, msg);
}

Never throwStandaloneDoorSensorError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTStandaloneDoorSensorException(TTStandaloneDoorSensorError.failed, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTStandaloneDoorSensorError.values.length) {
    throw TTStandaloneDoorSensorException(TTStandaloneDoorSensorError.values[i], msg);
  }
  throw TTStandaloneDoorSensorException(TTStandaloneDoorSensorError.failed, msg);
}

/// [initMultifunctionalKeypad] 在原生侧可能回调锁错误或键盘错误；二者 `raw` 可能重叠，
/// 约定：`raw >= [TTMultifunctionalKeypadError] 个数` 时按 [TTLockError] 解析，否则按键盘错误解析。
Future<T> runMultifunctionalKeypadInit<T>(Future<T> Function() fn) async {
  try {
    return await fn();
  } on PlatformException catch (e) {
    final i = int.tryParse(e.code);
    if (i != null && i >= TTMultifunctionalKeypadError.values.length) {
      throwLockError(e);
    }
    throwMultifunctionalKeypadError(e);
  }
}

/// 供流方法在链头触发门卫：返回一个在订阅时执行 gate 的 Future。
Future<void> runBleGate(TTBleOperation op) async {
  final err = await BleGuard.gate(op);
  if (err != null) throw TTLockException(err);
}

Future<T> _runGated<T>(
  TTBleOperation op,
  Future<T> Function() fn,
  Never Function(PlatformException) convert,
  Never Function() onTimeout, {
  Duration? timeout,
  String? method,
}) async {
  await runBleGate(op);
  final effective =
      BleTimeout.resolve(callTimeout: timeout, method: method);
  try {
    final future = fn();
    if (effective == null) return await future;
    return await future.timeout(effective);
  } on TimeoutException {
    onTimeout();
  } on PlatformException catch (e) {
    convert(e);
  }
}

Future<T> runLockApi<T>(
  Future<T> Function() fn, {
  TTBleOperation op = TTBleOperation.deviceOperation,
  Duration? timeout,
  String? method,
}) =>
    _runGated(
      op,
      fn,
      throwLockError,
      () => throw TTLockException(TTLockError.bluetoothConnectTimeount),
      timeout: timeout,
      method: method,
    );

Future<T> runGatewayApi<T>(
  Future<T> Function() fn, {
  TTBleOperation op = TTBleOperation.deviceOperation,
  Duration? timeout,
  String? method,
}) =>
    _runGated(
      op,
      fn,
      throwGatewayError,
      () => throw TTGatewayException(TTGatewayError.timeOut),
      timeout: timeout,
      method: method,
    );

Future<T> runRemoteAccessoryApi<T>(
  Future<T> Function() fn, {
  TTBleOperation op = TTBleOperation.deviceOperation,
  Duration? timeout,
  String? method,
}) =>
    _runGated(
      op,
      fn,
      throwRemoteAccessoryError,
      () => throw TTRemoteAccessoryException(TTRemoteAccessoryError.timeout),
      timeout: timeout,
      method: method,
    );

Future<T> runMultifunctionalKeypadApi<T>(
  Future<T> Function() fn, {
  TTBleOperation op = TTBleOperation.deviceOperation,
  Duration? timeout,
  String? method,
}) =>
    _runGated(
      op,
      fn,
      throwMultifunctionalKeypadError,
      () => throw TTMultifunctionalKeypadException(
            TTMultifunctionalKeypadError.timeout),
      timeout: timeout,
      method: method,
    );

Future<T> runStandaloneDoorSensorApi<T>(
  Future<T> Function() fn, {
  TTBleOperation op = TTBleOperation.deviceOperation,
  Duration? timeout,
  String? method,
}) =>
    _runGated(
      op,
      fn,
      throwStandaloneDoorSensorError,
      () => throw TTStandaloneDoorSensorException(
            TTStandaloneDoorSensorError.connectTimeout),
      timeout: timeout,
      method: method,
    );

Object _mapPlatformException(PlatformException e, Never Function(PlatformException) convert) {
  try {
    convert(e);
  } on Object catch (mapped) {
    return mapped;
  }
}

Stream<T> _mapStreamErrors<T>(
  Stream<T> stream,
  Never Function(PlatformException) convert,
) {
  return stream.transform<T>(
    StreamTransformer<T, T>.fromHandlers(
      handleData: (data, sink) => sink.add(data),
      handleError: (error, stackTrace, sink) {
        if (error is PlatformException) {
          sink.addError(_mapPlatformException(error, convert), stackTrace);
        } else {
          sink.addError(error, stackTrace);
        }
      },
      handleDone: (sink) => sink.close(),
    ),
  );
}

/// EventChannel 流上的 [PlatformException] → [TTLockException] / [TTPigeonException]。
Stream<T> mapLockStreamErrors<T>(Stream<T> stream) =>
    _mapStreamErrors(stream, throwLockError);

/// EventChannel 流上的 [PlatformException] → [TTGatewayException] / [TTPigeonException]。
Stream<T> mapGatewayStreamErrors<T>(Stream<T> stream) =>
    _mapStreamErrors(stream, throwGatewayError);

/// EventChannel 流上的 [PlatformException] → [TTRemoteAccessoryException] / [TTPigeonException]。
Stream<T> mapRemoteAccessoryStreamErrors<T>(Stream<T> stream) =>
    _mapStreamErrors(stream, throwRemoteAccessoryError);

/// EventChannel 流上的 [PlatformException] → [TTMultifunctionalKeypadException] / [TTPigeonException]。
Stream<T> mapMultifunctionalKeypadStreamErrors<T>(Stream<T> stream) =>
    _mapStreamErrors(stream, throwMultifunctionalKeypadError);

/// EventChannel 流上的 [PlatformException] → [TTStandaloneDoorSensorException] / [TTPigeonException]。
Stream<T> mapStandaloneDoorSensorStreamErrors<T>(Stream<T> stream) =>
    _mapStreamErrors(stream, throwStandaloneDoorSensorError);

/// 键盘录入类 EventChannel：原生可能回调锁错误或键盘错误（见 [runMultifunctionalKeypadInit]）。
Never throwKeypadCredentialStreamError(PlatformException e) {
  final i = int.tryParse(e.code);
  if (i != null && i >= TTMultifunctionalKeypadError.values.length) {
    throwLockError(e);
  }
  throwMultifunctionalKeypadError(e);
}

Stream<T> mapKeypadCredentialStreamErrors<T>(Stream<T> stream) =>
    _mapStreamErrors(stream, throwKeypadCredentialStreamError);
