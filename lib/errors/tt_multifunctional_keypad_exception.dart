import 'package:ttlock_premise_flutter/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTMultifunctionalKeypadError] 的操作失败。
final class TTMultifunctionalKeypadException extends TTException {
  TTMultifunctionalKeypadException(this.code, [super.message]);

  final TTMultifunctionalKeypadError code;

  @override
  String toString() => message ?? 'TTMultifunctionalKeypadException($code)';
}
