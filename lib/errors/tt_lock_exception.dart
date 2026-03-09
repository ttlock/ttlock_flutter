import 'package:ttlock_premise_flutter/errors/tt_exception.dart';
import 'package:ttlock_premise_flutter/models/enums.dart';

/// Exception thrown by lock operations.
class TTLockException extends TTException {
  final TTLockError error;

  TTLockException({required this.error, String message = ''})
      : super(code: error.value, message: message);

  @override
  String toString() => 'TTLockException($error, $message)';
}
