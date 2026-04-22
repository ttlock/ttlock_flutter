/// 插件侧统一异常基类，与 Pigeon 生成的各 `*Error` / `*ErrorCode` 枚举配合使用。
abstract class TTException implements Exception {
  TTException([this.message]);

  final String? message;

  @override
  String toString() => message ?? '$runtimeType';
}

/// 无法映射到具体设备错误码时的 Pigeon/平台异常（如 `channel-error`、`missing_mac`）。
final class TTPigeonException extends TTException {
  TTPigeonException(this.code, [super.message]);

  final String code;

  @override
  String toString() => message ?? 'TTPigeonException($code)';
}
