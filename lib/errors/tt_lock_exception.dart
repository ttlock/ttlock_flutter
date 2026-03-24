import 'package:ttlock_premise_flutter/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTLockError] 的操作失败。
final class TTLockException extends TTException {
  TTLockException(this.code, [super.message]);

  final TTLockError code;

  @override
  String toString() => message ?? 'TTLockException($code)';
}
