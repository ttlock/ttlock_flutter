import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTRemoteAccessoryError] 的操作失败。
final class TTRemoteAccessoryException extends TTException {
  TTRemoteAccessoryException(this.code, [super.message]);

  final TTRemoteAccessoryError code;

  @override
  String toString() => message ?? 'TTRemoteAccessoryException($code)';
}
