import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_channel.dart';

void main() {
  group('resolveMeterChannel', () {
    test('online 为真时走云通道', () {
      expect(resolveMeterChannel(online: true), MeterChannel.cloud);
    });

    test('online 为假时走 BLE —— 不发起注定失败的云调用', () {
      expect(resolveMeterChannel(online: false), MeterChannel.ble);
    });
  });
}
