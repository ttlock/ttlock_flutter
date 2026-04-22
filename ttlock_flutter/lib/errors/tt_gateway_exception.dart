import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTGatewayError] 的操作失败。
final class TTGatewayException extends TTException {
  TTGatewayException(this.code, [super.message]);

  final TTGatewayError code;

  @override
  String toString() => message ?? 'TTGatewayException($code)';
}
