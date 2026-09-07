import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/src/ble_timeout.dart';

void main() {
  group('BleTimeout.resolve', () {
    tearDown(() => BleTimeout.reset());

    test('builtin default 为 30s', () {
      expect(
        BleTimeout.resolve(method: 'controlLock'),
        const Duration(seconds: 30),
      );
    });

    test('method map：initLock 为 300s', () {
      expect(
        BleTimeout.resolve(method: 'initLock'),
        const Duration(seconds: 300),
      );
    });

    test('method map：configWifi 为 2min', () {
      expect(
        BleTimeout.resolve(method: 'configWifi'),
        const Duration(minutes: 2),
      );
    });

    test('method map：configCameraLockWifi 为 3min', () {
      expect(
        BleTimeout.resolve(method: 'configCameraLockWifi'),
        const Duration(minutes: 3),
      );
    });

    test('method map：addFaceData 为 90s', () {
      expect(
        BleTimeout.resolve(method: 'addFaceData'),
        const Duration(seconds: 90),
      );
    });

    test('per-call 正 Duration 覆盖 method map', () {
      expect(
        BleTimeout.resolve(
          callTimeout: const Duration(seconds: 1),
          method: 'initLock',
        ),
        const Duration(seconds: 1),
      );
    });

    test('Duration.zero 禁用超时', () {
      expect(
        BleTimeout.resolve(
          callTimeout: Duration.zero,
          method: 'initLock',
        ),
        isNull,
      );
    });

    test('setTimeouts 可改 default；null 恢复 builtin', () {
      BleTimeout.set(const TTLockTimeouts(
        defaultTimeout: Duration(seconds: 5),
        methodTimeouts: {},
      ));
      expect(
        BleTimeout.resolve(method: 'controlLock'),
        const Duration(seconds: 5),
      );
      BleTimeout.set(null);
      expect(
        BleTimeout.resolve(method: 'controlLock'),
        const Duration(seconds: 30),
      );
    });

    test('defaultTimeout 为 null 且无 method 命中 → null', () {
      BleTimeout.set(const TTLockTimeouts(
        defaultTimeout: null,
        methodTimeouts: {},
      ));
      expect(BleTimeout.resolve(method: 'controlLock'), isNull);
    });
  });
}
