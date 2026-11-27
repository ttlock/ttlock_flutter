import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/services/permission_service/permission_service.dart';

part 'tt_lock_ble_guard_provider.g.dart';

/// 注册一次 BLE 门卫；测试勿 read，除非显式要测门卫。
@Riverpod(keepAlive: true)
bool ttLockBleGuard(Ref ref) {
  final perms = ref.read(permissionServiceProvider.notifier);
  TTLock.setBleGuard((op) async {
    if (op == TTBleOperation.stateQuery) return null;
    if (!await perms.requestBlePermissions()) {
      debugPrint('[BleGuard] op=$op → noPermisstion (runtime permission denied)');
      return TTLockError.noPermisstion;
    }
    final state = await TTLock.lock.getBluetoothState();
    debugPrint('[BleGuard] op=$op bluetoothState=$state');
    // Android 12+ 缺 BLUETOOTH_CONNECT 时原生返回 unAuthorized，勿误报「蓝牙未开启」。
    if (state == TTBluetoothState.unAuthorized) {
      return TTLockError.noPermisstion;
    }
    if (state == TTBluetoothState.unsupported) {
      return TTLockError.fail;
    }
    if (state != TTBluetoothState.turnOn) {
      return TTLockError.bluetoothOff;
    }
    return null;
  });
  return true;
}
