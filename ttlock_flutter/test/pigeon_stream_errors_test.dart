import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'package:ttlock_flutter/src/pigeon_errors.dart';

void main() {
  group('mapLockStreamErrors', () {
    test('converts PlatformException to TTLockException', () async {
      final stream = mapLockStreamErrors<int>(
        Stream<int>.error(
          PlatformException(code: '${TTLockError.bluetoothOff.index}', message: 'off'),
        ),
      );
      await expectLater(
        stream,
        emitsError(isA<TTLockException>().having((e) => e.code, 'code', TTLockError.bluetoothOff)),
      );
    });

    test('passes through non-PlatformException', () async {
      final stream = mapLockStreamErrors<int>(Stream<int>.error(StateError('x')));
      await expectLater(stream, emitsError(isA<StateError>()));
    });
  });

  group('mapGatewayStreamErrors', () {
    test('converts PlatformException to TTGatewayException', () async {
      final stream = mapGatewayStreamErrors<int>(
        Stream<int>.error(
          PlatformException(code: '${TTGatewayError.timeOut.index}', message: 'timeout'),
        ),
      );
      await expectLater(
        stream,
        emitsError(isA<TTGatewayException>().having((e) => e.code, 'code', TTGatewayError.timeOut)),
      );
    });
  });

  group('mapKeypadCredentialStreamErrors', () {
    test('maps high raw code to TTLockException', () async {
      final stream = mapKeypadCredentialStreamErrors<int>(
        Stream<int>.error(
          PlatformException(
            code: '${TTMultifunctionalKeypadError.values.length + TTLockError.fail.index}',
            message: 'lock fail',
          ),
        ),
      );
      await expectLater(stream, emitsError(isA<TTLockException>()));
    });

    test('maps low raw code to TTMultifunctionalKeypadException', () async {
      final stream = mapKeypadCredentialStreamErrors<int>(
        Stream<int>.error(
          PlatformException(code: '0', message: 'keypad'),
        ),
      );
      await expectLater(stream, emitsError(isA<TTMultifunctionalKeypadException>()));
    });
  });

  group('unknown stream error codes', () {
    test('maps string code to TTPigeonException', () async {
      final stream = mapLockStreamErrors<int>(
        Stream<int>.error(PlatformException(code: 'NO_LOCK_DATA', message: 'missing')),
      );
      await expectLater(
        stream,
        emitsError(
          isA<TTPigeonException>()
              .having((e) => e.code, 'code', 'NO_LOCK_DATA')
              .having((e) => e.message, 'message', 'missing'),
        ),
      );
    });
  });
}
