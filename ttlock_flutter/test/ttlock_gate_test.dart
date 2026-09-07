import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock.dart';

void main() {
  group('TTLock.setBleGuard', () {
    tearDown(() => BleGuard.reset());

    test('setBleGuard 委托到 BleGuard', () async {
      TTLock.setBleGuard((op) async => TTLockError.bluetoothOff);
      expect(BleGuard.guard, isNotNull);
      expect(await BleGuard.gate(TTBleOperation.scanDevice),
          TTLockError.bluetoothOff);
    });

    test('skipBleOperation 委托到 BleGuard', () async {
      TTLock.setBleGuard((op) async => TTLockError.noPermisstion);
      TTLock.skipBleOperation(TTBleOperation.stateQuery);
      expect(await BleGuard.gate(TTBleOperation.stateQuery), isNull);
    });
  });
}
