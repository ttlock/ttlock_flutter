import 'package:ttlock_premise_flutter/errors/tt_exception.dart';

/// Exception thrown by accessory operations (remote key, keypad, door sensor).
class TTAccessoryException extends TTException {
  const TTAccessoryException({required super.code, super.message});

  @override
  String toString() => 'TTAccessoryException(code: $code, message: $message)';
}
