import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter/src/pigeon_errors.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    show TTLockError;

void main() {
  group('runLockApi gate', () {
    tearDown(() => BleGuard.reset());

    test('gate 拦截 → 抛 TTLockException(noPermisstion)', () async {
      BleGuard.set((op) async => TTLockError.noPermisstion);
      await expectLater(
        runLockApi(() async => 'x'),
        throwsA(isA<TTLockException>()
            .having((e) => e.code, 'code', TTLockError.noPermisstion)),
      );
    });

    test('gate 放行 → 执行 fn', () async {
      BleGuard.set((op) async => null);
      expect(await runLockApi(() async => 'ok'), 'ok');
    });

    test('未注册 guard → 放行并执行 fn', () async {
      expect(await runLockApi(() async => 'ok'), 'ok');
    });

    test('PlatformException 错误映射保留', () async {
      await expectLater(
        runLockApi(() async => throw PlatformException(
            code: '${TTLockError.bluetoothOff.index}', message: 'off')),
        throwsA(isA<TTLockException>()
            .having((e) => e.code, 'code', TTLockError.bluetoothOff)),
      );
    });

    test('op 参数传给 guard', () async {
      TTBleOperation? seen;
      BleGuard.set((op) async {
        seen = op;
        return TTLockError.bluetoothOff;
      });
      await expectLater(
        runLockApi(() async => 'x', op: TTBleOperation.stateQuery),
        throwsA(isA<TTLockException>()),
      );
      expect(seen, TTBleOperation.stateQuery);
    });

    test('runBleGate 拦截时抛 TTLockException', () async {
      BleGuard.set((op) async => TTLockError.bluetoothOff);
      await expectLater(
        runBleGate(TTBleOperation.deviceOperation),
        throwsA(isA<TTLockException>()
            .having((e) => e.code, 'code', TTLockError.bluetoothOff)),
      );
    });

    test('runBleGate 放行时不抛', () async {
      BleGuard.set((op) async => null);
      await expectLater(runBleGate(TTBleOperation.scanDevice), completes);
    });
  });
}
