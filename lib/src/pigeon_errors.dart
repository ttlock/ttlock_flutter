import 'package:flutter/services.dart';
import 'package:ttlock_premise_flutter/errors/errors.dart';
import 'package:ttlock_premise_flutter/pigeon/messages.g.dart';

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
