import 'package:flutter/foundation.dart' show visibleForTesting;

/// SDK 操作超时配置。
class TTLockTimeouts {
  const TTLockTimeouts({
    this.defaultTimeout = const Duration(seconds: 30),
    this.methodTimeouts = const {},
  });

  /// 内置默认（对齐 ttaccess_shared 历史约定）。
  static const builtin = TTLockTimeouts(
    defaultTimeout: Duration(seconds: 30),
    methodTimeouts: {
      'initLock': Duration(seconds: 300),
      'configWifi': Duration(minutes: 2),
      'configCameraLockWifi': Duration(minutes: 3),
      'addFaceData': Duration(seconds: 90),
    },
  );

  /// 未命中 [methodTimeouts] 时使用；`null` 表示不加默认超时。
  final Duration? defaultTimeout;

  /// 稳定方法名 → 超时；key 与 `tt_*_api` 传入的 `method:` 一致。
  final Map<String, Duration> methodTimeouts;
}

/// 超时配置 holder（独立文件，避免 pigeon_errors ⇄ ttlock.dart 循环依赖）。
class BleTimeout {
  BleTimeout._();

  static TTLockTimeouts _config = TTLockTimeouts.builtin;

  static TTLockTimeouts get config => _config;

  /// 注册配置；`null` 恢复 [TTLockTimeouts.builtin]。
  static void set(TTLockTimeouts? timeouts) =>
      _config = timeouts ?? TTLockTimeouts.builtin;

  /// 解析有效超时。返回 `null` = 本次不加 `Future.timeout`。
  ///
  /// 优先级：`callTimeout`（含 [Duration.zero] 禁用）>
  /// [TTLockTimeouts.methodTimeouts] > [TTLockTimeouts.defaultTimeout]。
  static Duration? resolve({Duration? callTimeout, String? method}) {
    if (callTimeout != null) {
      if (callTimeout == Duration.zero) return null;
      return callTimeout;
    }
    final mapped = method == null ? null : _config.methodTimeouts[method];
    if (mapped != null) return mapped;
    return _config.defaultTimeout;
  }

  @visibleForTesting
  static void reset() => _config = TTLockTimeouts.builtin;
}
