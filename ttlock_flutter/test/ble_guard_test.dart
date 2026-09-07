import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    show TTLockError;

void main() {
  group('BleGuard.gate', () {
    tearDown(() => BleGuard.reset());

    test('未注册 guard → 放行（返回 null）', () async {
      expect(await BleGuard.gate(TTBleOperation.deviceOperation), isNull);
    });

    test('guard 返回 null → 放行', () async {
      BleGuard.set((op) async => null);
      expect(await BleGuard.gate(TTBleOperation.deviceOperation), isNull);
    });

    test('guard 返回错误码 → 返回该错误码', () async {
      BleGuard.set((op) async => TTLockError.noPermisstion);
      expect(await BleGuard.gate(TTBleOperation.deviceOperation),
          TTLockError.noPermisstion);
    });

    test('强制跳过：getBluetoothState 不调用 guard', () async {
      final calls = <TTBleOperation>[];
      BleGuard.set((op) async {
        calls.add(op);
        return TTLockError.bluetoothOff;
      });
      expect(await BleGuard.gate(TTBleOperation.getBluetoothState), isNull);
      expect(calls, isEmpty);
    });

    test('使用方 opt-out：skip 后放行', () async {
      BleGuard.set((op) async => TTLockError.noPermisstion);
      BleGuard.skip(TTBleOperation.stateQuery);
      expect(await BleGuard.gate(TTBleOperation.stateQuery), isNull);
    });

    test('guard 收到正确 operation', () async {
      TTBleOperation? seen;
      BleGuard.set((op) async {
        seen = op;
        return null;
      });
      await BleGuard.gate(TTBleOperation.scanDevice);
      expect(seen, TTBleOperation.scanDevice);
    });
  });
}
