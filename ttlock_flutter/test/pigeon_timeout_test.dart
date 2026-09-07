import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter/src/ble_timeout.dart';
import 'package:ttlock_flutter/src/pigeon_errors.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    show TTGatewayError, TTLockError, TTRemoteAccessoryError;

void main() {
  group('run*Api timeout', () {
    tearDown(() {
      BleGuard.reset();
      BleTimeout.reset();
    });

    test('runLockApi 超时 → bluetoothConnectTimeount', () async {
      await expectLater(
        runLockApi(
          () => Completer<String>().future,
          timeout: const Duration(milliseconds: 20),
          method: 'controlLock',
        ),
        throwsA(isA<TTLockException>().having(
          (e) => e.code,
          'code',
          TTLockError.bluetoothConnectTimeount,
        )),
      );
    });

    test('runGatewayApi 超时 → timeOut', () async {
      await expectLater(
        runGatewayApi(
          () => Completer<void>().future,
          timeout: const Duration(milliseconds: 20),
        ),
        throwsA(isA<TTGatewayException>().having(
          (e) => e.code,
          'code',
          TTGatewayError.timeOut,
        )),
      );
    });

    test('runRemoteAccessoryApi 超时 → timeout', () async {
      await expectLater(
        runRemoteAccessoryApi(
          () => Completer<void>().future,
          timeout: const Duration(milliseconds: 20),
        ),
        throwsA(isA<TTRemoteAccessoryException>().having(
          (e) => e.code,
          'code',
          TTRemoteAccessoryError.timeout,
        )),
      );
    });

    test('Duration.zero 不因超时失败', () async {
      final c = Completer<String>();
      final f = runLockApi(
        () => c.future,
        timeout: Duration.zero,
        method: 'controlLock',
      );
      c.complete('ok');
      expect(await f, 'ok');
    });

    test('method map：initLock 在短于 300s 的 delay 下不超时', () async {
      BleTimeout.set(const TTLockTimeouts(
        defaultTimeout: Duration(milliseconds: 30),
        methodTimeouts: {'initLock': Duration(seconds: 2)},
      ));
      expect(
        await runLockApi(
          () => Future<String>.delayed(
            const Duration(milliseconds: 80),
            () => 'ok',
          ),
          method: 'initLock',
        ),
        'ok',
      );
    });

    test('gate 先于 timeout：gate 失败不进入等待', () async {
      BleGuard.set((_) async => TTLockError.noPermisstion);
      final sw = Stopwatch()..start();
      await expectLater(
        runLockApi(
          () => Completer<String>().future,
          timeout: const Duration(seconds: 5),
        ),
        throwsA(isA<TTLockException>().having(
          (e) => e.code,
          'code',
          TTLockError.noPermisstion,
        )),
      );
      sw.stop();
      expect(sw.elapsedMilliseconds, lessThan(1000));
    });
  });
}
