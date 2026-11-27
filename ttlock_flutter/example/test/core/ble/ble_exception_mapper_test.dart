import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart'
    show TTLockError, TTMultifunctionalKeypadError, TTGatewayError;
import 'package:ttlock_flutter_demo/core/ble/keypad_enroll_timeout.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_exception_mapper.dart';

void main() {
  test('TTLockError.noPermisstion → AppBusinessException(-11)', () {
    final e = BleExceptionMapper.mapToAppException(
      TTLockException(TTLockError.noPermisstion, 'no permission'),
    );
    expect(e, isA<AppBusinessException>());
    expect((e as AppBusinessException).code, -11);
    expect(e.message, 'bluetooth_permission_denied');
  });

  test('TTLockError.bluetoothOff → AppBusinessException(-10)', () {
    final e = BleExceptionMapper.mapToAppException(
      TTLockException(TTLockError.bluetoothOff, 'off'),
    );
    expect(e, isA<AppBusinessException>());
    expect((e as AppBusinessException).code, -10);
  });

  test('其它 TTLockException → AppFirmwareException', () {
    final e = BleExceptionMapper.mapToAppException(
      TTLockException(TTLockError.fail, 'fail'),
    );
    expect(e, isA<AppFirmwareException>());
  });

  test('键盘 timeout → AppBusinessException(-28)', () {
    final e = BleExceptionMapper.mapToAppException(
      TTMultifunctionalKeypadException(
        TTMultifunctionalKeypadError.timeout,
        '等待超时',
      ),
    );
    expect(e, isA<AppBusinessException>());
    expect((e as AppBusinessException).code, kKeypadEnrollTimeoutCode);
  });

  test('TTGatewayException → AppFirmwareException', () {
    final e = BleExceptionMapper.mapToAppException(
      TTGatewayException(TTGatewayError.failed, 'gw'),
    );
    expect(e, isA<AppFirmwareException>());
  });

  test('普通 Object → AppUnknownException', () {
    final e = BleExceptionMapper.mapToAppException(StateError('x'));
    expect(e, isA<AppUnknownException>());
  });

  test('已是 AppException 原样返回', () {
    final src = AppException.network(exception: 'x', message: 'x');
    expect(BleExceptionMapper.mapToAppException(src), same(src));
  });
}
