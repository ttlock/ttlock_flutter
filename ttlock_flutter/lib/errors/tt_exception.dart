/// 插件侧统一异常基类，与 Pigeon 生成的各 `*Error` / `*ErrorCode` 枚举配合使用。
abstract class TTException implements Exception {
  TTException([this.message]);

  final String? message;

  @override
  String toString() => message ?? '$runtimeType';
}
