import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTLockUpgradeError] 的固件升级失败。
final class TTUpgradeException extends TTException {
  TTUpgradeException(this.code, [super.message]);

  final TTLockUpgradeError code;

  @override
  String toString() => message ?? 'TTUpgradeException($code)';
}

/// 当前平台未实现该升级能力。
///
/// 识别 Pigeon `PlatformException.message` 含 `notImplemented`，或 `code == unsupported`。
final class TTUpgradeNotImplementedException extends TTException {
  TTUpgradeNotImplementedException([super.message]);

  @override
  String toString() => message ?? 'TTUpgradeNotImplementedException';
}
