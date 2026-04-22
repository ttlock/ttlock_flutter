import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTLockError] 的操作失败。
final class TTLockException extends TTException {
  TTLockException(this.code, [super.message]);

  final TTLockError code;

  @override
  String toString() => message ?? 'TTLockException($code)';
}
