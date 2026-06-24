import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

Never throwLockError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTPigeonException(code, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTLockError.values.length) {
    throw TTLockException(TTLockError.values[i], msg);
  }
  throw TTPigeonException(code, msg);
}

Never throwGatewayError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTPigeonException(code, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTGatewayError.values.length) {
    throw TTGatewayException(TTGatewayError.values[i], msg);
  }
  throw TTPigeonException(code, msg);
}

Never throwRemoteAccessoryError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTPigeonException(code, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTRemoteAccessoryError.values.length) {
    throw TTRemoteAccessoryException(TTRemoteAccessoryError.values[i], msg);
  }
  throw TTPigeonException(code, msg);
}

Never throwMultifunctionalKeypadError(PlatformException e) {
  final code = e.code;
  final msg = e.message;
  if (code == 'channel-error' || code == 'null-error') {
    throw TTPigeonException(code, msg);
  }
  final i = int.tryParse(code);
  if (i != null && i >= 0 && i < TTMultifunctionalKeypadError.values.length) {
    throw TTMultifunctionalKeypadException(TTMultifunctionalKeypadError.values[i], msg);
  }
  throw TTPigeonException(code, msg);
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

Future<T> runLockApi<T>(Future<T> Function() fn) async {
  try {
    return await fn();
  } on PlatformException catch (e) {
    throwLockError(e);
  }
}

Future<T> runGatewayApi<T>(Future<T> Function() fn) async {
  try {
    return await fn();
  } on PlatformException catch (e) {
    throwGatewayError(e);
  }
}

Future<T> runRemoteAccessoryApi<T>(Future<T> Function() fn) async {
  try {
    return await fn();
  } on PlatformException catch (e) {
    throwRemoteAccessoryError(e);
  }
}

Future<T> runMultifunctionalKeypadApi<T>(Future<T> Function() fn) async {
  try {
    return await fn();
  } on PlatformException catch (e) {
    throwMultifunctionalKeypadError(e);
  }
}

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
