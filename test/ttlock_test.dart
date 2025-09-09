import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter/ttlock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('TTLock', () {
    const MethodChannel channel = MethodChannel('com.ttlock/command/ttlock');
    final List<MethodCall> log = <MethodCall>[];

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
      });
      log.clear();
    });

    tearDown(() {
      channel.setMockMethodCallHandler(null);
    });

    test('getLockTimeDirect returns time', () async {
      // Arrange
      const String lockData = 'test_lock_data';
      const String lockMac = 'test_lock_mac';
      const String expectedTime = '2024-01-01 12:00:00';

      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getLockTimeDirect') {
          return expectedTime;
        }
        return null;
      });

      // Act
      final String time = await TTLock.getLockTimeDirect(lockData: lockData, lockMac: lockMac);

      // Assert
      expect(time, expectedTime);
    });

    test('getLockPower returns power on success', () async {
      // Arrange
      const String lockData = 'test_lock_data';
      const int expectedPower = 99;
      bool successCalled = false;

      // Act
      TTLock.getLockPower(
        lockData,
        (power) {
          // Assert
          expect(power, expectedPower);
          successCalled = true;
        },
        (errorCode, errorMsg) {
          // Should not be called
        },
      );

      // Simulate the native side sending a success event
      final ByteData? data = const StandardMethodCodec().encodeSuccessEnvelope({
        'command': 'getLockPower',
        'resultState': 0, // Success
        'data': {'electricQuantity': expectedPower}
      });
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage('com.ttlock/listen/ttlock', data, (ByteData? reply) {});

      // Wait for the callback to be called
      await Future.delayed(Duration.zero);
      expect(successCalled, isTrue);
    });

    test('getLockPower calls fail callback on failure', () async {
      // Arrange
      const String lockData = 'test_lock_data';
      const TTLockError expectedError = TTLockError.fail;
      const String expectedErrorMessage = 'Something went wrong';
      bool failCalled = false;

      // Act
      TTLock.getLockPower(
        lockData,
        (power) {
          // Should not be called
        },
        (errorCode, errorMsg) {
          // Assert
          expect(errorCode, expectedError);
          expect(errorMsg, expectedErrorMessage);
          failCalled = true;
        },
      );

      // Simulate the native side sending a failure event
      final ByteData? data = const StandardMethodCodec().encodeSuccessEnvelope({
        'command': 'getLockPower',
        'resultState': 2, // Fail
        'errorCode': expectedError.index,
        'errorMessage': expectedErrorMessage,
      });
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage('com.ttlock/listen/ttlock', data, (ByteData? reply) {});

      // Wait for the callback to be called
      await Future.delayed(Duration.zero);
      expect(failCalled, isTrue);
    });

    test('isBLEEnabled returns true', () async {
      // Arrange
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'isBLEEnabled') {
          return true;
        }
        return null;
      });

      // Act
      final bool result = await TTLock.isBLEEnabled();

      // Assert
      expect(result, isTrue);
    });

    test('resetLock calls success callback', () async {
      // Arrange
      const String lockData = 'test_lock_data';
      bool successCalled = false;

      // Act
      TTLock.resetLock(
        lockData,
        () {
          successCalled = true;
        },
        (errorCode, errorMsg) {
          // Should not be called
        },
      );

      // Simulate success
      final ByteData? data = const StandardMethodCodec().encodeSuccessEnvelope({
        'command': 'resetLock',
        'resultState': 0, // Success
        'data': {}
      });
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage('com.ttlock/listen/ttlock', data, (ByteData? reply) {});

      await Future.delayed(Duration.zero);
      expect(successCalled, isTrue);
    });

    test('initLock returns lockData on success', () async {
      // Arrange
      const String expectedLockData = 'new_lock_data';
      bool successCalled = false;

      // Act
      TTLock.initLock(
        {},
        (lockData) {
          expect(lockData, expectedLockData);
          successCalled = true;
        },
        (errorCode, errorMsg) {
          // Should not be called
        },
      );

      // Simulate success
      final ByteData? data = const StandardMethodCodec().encodeSuccessEnvelope({
        'command': 'initLock',
        'resultState': 0, // Success
        'data': {'lockData': expectedLockData}
      });
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage('com.ttlock/listen/ttlock', data, (ByteData? reply) {});

      await Future.delayed(Duration.zero);
      expect(successCalled, isTrue);
    });

    test('controlLock with unlock action calls success callback', () async {
      // Arrange
      const String lockData = 'test_lock_data';
      const int expectedLockTime = 1234567890;
      const int expectedPower = 88;
      const int expectedUniqueId = 98765;
      const String expectedLockDataResponse = 'response_lock_data';
      bool successCalled = false;

      // Act
      TTLock.controlLock(
        lockData,
        TTControlAction.unlock,
        (lockTime, electricQuantity, uniqueId, lockDataResponse) {
          // Assert
          expect(lockTime, expectedLockTime);
          expect(electricQuantity, expectedPower);
          expect(uniqueId, expectedUniqueId);
          expect(lockDataResponse, expectedLockDataResponse);
          successCalled = true;
        },
        (errorCode, errorMsg) {
          // Should not be called
        },
      );

      // Simulate success
      final ByteData? data = const StandardMethodCodec().encodeSuccessEnvelope({
        'command': 'controlLock',
        'resultState': 0, // Success
        'data': {
          'lockTime': expectedLockTime,
          'electricQuantity': expectedPower,
          'uniqueId': expectedUniqueId,
          'lockData': expectedLockDataResponse
        }
      });
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage('com.ttlock/listen/ttlock', data, (ByteData? reply) {});

      await Future.delayed(Duration.zero);
      expect(successCalled, isTrue);
    });

    test('controlLock with unlock action calls fail callback on failure', () async {
      // Arrange
      const String lockData = 'test_lock_data';
      const TTLockError expectedError = TTLockError.noPermission;
      const String expectedErrorMessage = 'Unlock failed';
      bool failCalled = false;

      // Act
      TTLock.controlLock(
        lockData,
        TTControlAction.unlock,
        (lockTime, electricQuantity, uniqueId, lockData) {
          // Should not be called
        },
        (errorCode, errorMsg) {
          // Assert
          expect(errorCode, expectedError);
          expect(errorMsg, expectedErrorMessage);
          failCalled = true;
        },
      );

      // Simulate failure
      final ByteData? data = const StandardMethodCodec().encodeSuccessEnvelope({
        'command': 'controlLock',
        'resultState': 2, // Fail
        'errorCode': expectedError.index,
        'errorMessage': expectedErrorMessage,
      });
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage('com.ttlock/listen/ttlock', data, (ByteData? reply) {});

      await Future.delayed(Duration.zero);
      expect(failCalled, isTrue);
    });
  });
}
