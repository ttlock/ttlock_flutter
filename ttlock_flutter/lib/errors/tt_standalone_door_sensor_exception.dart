import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTStandaloneDoorSensorError] 的操作失败。
final class TTStandaloneDoorSensorException extends TTException {
  TTStandaloneDoorSensorException(this.code, [super.message]);

  final TTStandaloneDoorSensorError code;

  @override
  String toString() => message ?? 'TTStandaloneDoorSensorException($code)';
}
