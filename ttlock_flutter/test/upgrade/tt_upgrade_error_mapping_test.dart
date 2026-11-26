import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter/src/pigeon_errors.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

void main() {
  test('mapUpgradeStreamErrors 识别 notImplemented', () async {
    final src = Stream<TTUpgradeEvent>.error(
      PlatformException(
          code: '${TTLockError.fail.index}', message: 'notImplemented'),
    );
    expect(
      () => mapUpgradeStreamErrors(src).first,
      throwsA(isA<TTUpgradeNotImplementedException>()),
    );
  });

  test('mapUpgradeStreamErrors 映射 TTLockUpgradeError.upgradeFail', () async {
    final src = Stream<TTUpgradeEvent>.error(
      PlatformException(
        code: '${TTLockUpgradeError.upgradeFail.index}',
        message: 'dfu failed',
      ),
    );
    try {
      await mapUpgradeStreamErrors(src).first;
      fail('expected throw');
    } on TTUpgradeException catch (e) {
      expect(e.code, TTLockUpgradeError.upgradeFail);
      expect(e.message, 'dfu failed');
    }
  });
}
