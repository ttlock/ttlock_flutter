import 'package:ttlock_premise_flutter/errors/tt_exception.dart';
import 'package:ttlock_premise_flutter/models/enums.dart';

/// Exception thrown by gateway operations.
class TTGatewayException extends TTException {
  final TTGatewayError error;

  TTGatewayException({required this.error, String message = ''})
      : super(code: error.value, message: message);

  @override
  String toString() => 'TTGatewayException($error, $message)';
}
