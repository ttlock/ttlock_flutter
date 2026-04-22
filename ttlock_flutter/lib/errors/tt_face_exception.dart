import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'tt_exception.dart';

/// 对应 [TTFaceErrorCode] 的人脸流程错误（非 [TTFaceErrorCode.normal] 时表示失败）。
final class TTFaceException extends TTException {
  TTFaceException(this.code, [super.message]);

  final TTFaceErrorCode code;

  @override
  String toString() => message ?? 'TTFaceException($code)';
}
