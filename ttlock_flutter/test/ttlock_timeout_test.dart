import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/src/ble_timeout.dart';
import 'package:ttlock_flutter/ttlock.dart';

void main() {
  tearDown(() => BleTimeout.reset());

  test('setTimeouts 委托 BleTimeout', () {
    const cfg = TTLockTimeouts(defaultTimeout: Duration(seconds: 9));
    TTLock.setTimeouts(cfg);
    expect(TTLock.timeouts.defaultTimeout, const Duration(seconds: 9));
    expect(BleTimeout.config.defaultTimeout, const Duration(seconds: 9));
  });

  test('setTimeouts(null) 恢复 builtin', () {
    TTLock.setTimeouts(const TTLockTimeouts(defaultTimeout: Duration(seconds: 1)));
    TTLock.setTimeouts(null);
    expect(TTLock.timeouts.defaultTimeout, const Duration(seconds: 30));
  });
}
