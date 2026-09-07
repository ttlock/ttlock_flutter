import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    show TTLockError;

/// BLE 操作类别——供 guard 区分场景（如「扫描锁」vs「操作锁」展示不同引导）。
enum TTBleOperation {
  /// 邻近扫描（锁/网关/配件）。
  scanDevice,

  /// 连上设备后的读写（开锁/加卡/配网/设配置…）。
  deviceOperation,

  /// 查询能力/状态（如 supportFunction）。
  stateQuery,

  /// 查蓝牙开关——SDK 强制跳过（见 [BleGuard._forcedSkip]），不会传给 guard。
  getBluetoothState,
}

/// 蓝牙门卫：返回 null 放行；返回错误码则拦截并抛对应 [TTLockException]。
typedef TTBleGuard = Future<TTLockError?> Function(TTBleOperation operation);

/// 门卫状态 holder（独立文件，避免 pigeon_errors ⇄ ttlock.dart 循环依赖）。
class BleGuard {
  BleGuard._();

  static TTBleGuard? _guard;
  static final Set<TTBleOperation> _consumerSkip = {};

  /// 注册门卫；传 null 表示移除（恢复默认放行）。
  static void set(TTBleGuard? guard) => _guard = guard;

  /// 当前门卫（供测试/对外读取）。
  static TTBleGuard? get guard => _guard;

  /// 让某个操作跳过门卫（使用方 opt-out）。
  static void skip(TTBleOperation op) => _consumerSkip.add(op);

  /// 收口：是否放行。返回 null = 放行；非 null = 应抛的 TTLockError。
  static Future<TTLockError?> gate(TTBleOperation op) async {
    if (_forcedSkip(op) || _consumerSkip.contains(op)) return null;
    final guard = _guard;
    if (guard == null) return null;
    return guard(op);
  }

  static bool _forcedSkip(TTBleOperation op) =>
      op == TTBleOperation.getBluetoothState;

  @visibleForTesting
  static void reset() {
    _guard = null;
    _consumerSkip.clear();
  }
}
