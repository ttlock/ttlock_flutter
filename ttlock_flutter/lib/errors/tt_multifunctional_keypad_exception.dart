import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTMultifunctionalKeypadError] 的操作失败。
final class TTMultifunctionalKeypadException extends TTException {
  TTMultifunctionalKeypadException(this.code, [super.message]);

  final TTMultifunctionalKeypadError code;

  @override
  String toString() => message ?? 'TTMultifunctionalKeypadException($code)';
}
