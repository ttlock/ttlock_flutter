import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_ops.dart';

void main() {
  test('online 为真时走云通道，不碰 BLE', () async {
    var bleCalled = false;
    final r = await runMeterOp<String>(
      online: true,
      cloud: () async => 'cloud',
      ble: () async {
        bleCalled = true;
        return 'ble';
      },
    );
    expect(r, 'cloud');
    expect(bleCalled, isFalse);
  });

  test('online 为假时不发起云调用，直接走 BLE', () async {
    var cloudCalled = false;
    final r = await runMeterOp<String>(
      online: false,
      cloud: () async {
        cloudCalled = true;
        return 'cloud';
      },
      ble: () async => 'ble',
    );
    expect(r, 'ble');
    expect(cloudCalled, isFalse);
  });

  test('云失败（业务错误）时回退 BLE', () async {
    final r = await runMeterOp<String>(
      online: true,
      cloud: () async =>
          throw AppException.business(code: 7, message: 'offline'),
      ble: () async => 'ble',
    );
    expect(r, 'ble');
  });

  test('云失败（网络错误）时回退 BLE', () async {
    final r = await runMeterOp<String>(
      online: true,
      cloud: () async =>
          throw AppException.network(exception: null, message: 'net'),
      ble: () async => 'ble',
    );
    expect(r, 'ble');
  });

  test('云失败（解析错误）不回退，直接上抛', () async {
    await expectLater(
      runMeterOp<String>(
        online: true,
        cloud: () async => throw AppException.parse(message: 'bad json'),
        ble: () async => 'ble',
      ),
      throwsA(isA<AppParseException>()),
    );
  });

  test('两路皆失败时回传云侧错误，而非 BLE 错误', () async {
    await expectLater(
      runMeterOp<String>(
        online: true,
        cloud: () async =>
            throw AppException.business(code: 42, message: 'cloud-boom'),
        ble: () async => throw AppException.firmware(message: 'ble-boom'),
      ),
      throwsA(isA<AppBusinessException>().having((e) => e.code, 'code', 42)),
    );
  });
}
