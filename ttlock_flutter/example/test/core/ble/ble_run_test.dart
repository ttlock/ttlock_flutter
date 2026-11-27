import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart' show TTLockError;
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

void main() {
  test('runBle：TTLockException → 抛 AppException', () async {
    expect(
      () => runBle(
        () async => throw TTLockException(TTLockError.fail, 'x'),
      ),
      throwsA(isA<AppFirmwareException>()),
    );
  });

  test('gateBleStream：映射底层错误', () async {
    final errors = <Object>[];
    final sub = gateBleStream(
      () => Stream<int>.error(TTLockException(TTLockError.bluetoothOff)),
    ).listen((_) {}, onError: errors.add);
    await Future<void>.delayed(Duration.zero);
    expect(errors.single, isA<AppBusinessException>());
    expect((errors.single as AppBusinessException).code, -10);
    await sub.cancel();
  });
}
