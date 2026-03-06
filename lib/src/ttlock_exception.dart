import 'package:flutter/services.dart';

import 'package:ttlock_premise_flutter/src/ttlock_enums.dart';

/// Exception thrown when a lock (or generic) operation fails.
/// [errorCode] is the [TTLockError] index from native; [errorMessage] is the native message.
class TTLockException implements Exception {
  TTLockException({required this.errorCode, required this.errorMessage});

  /// Native error code (index of [TTLockError] or raw int).
  final int errorCode;

  /// Human-readable message from native.
  final String errorMessage;

  /// [TTLockError] enum value when [errorCode] is in range; otherwise [TTLockError.fail].
  TTLockError get lockError {
    if (errorCode >= 0 && errorCode < TTLockError.values.length) {
      return TTLockError.values[errorCode];
    }
    return TTLockError.fail;
  }

  @override
  String toString() => 'TTLockException($errorCode: $errorMessage)';

  /// Build from [PlatformException]. Uses [code] as errorCode and [message] as errorMessage.
  static TTLockException fromPlatform(PlatformException e) {
    int code = int.tryParse(e.code) ?? TTLockError.fail.index;
    return TTLockException(
      errorCode: code,
      errorMessage: e.message ?? '',
    );
  }
}

/// Exception for gateway operations.
class TTGatewayException implements Exception {
  TTGatewayException({required this.errorCode, required this.errorMessage});

  final int errorCode;
  final String errorMessage;

  TTGatewayError get gatewayError {
    if (errorCode >= 0 && errorCode < TTGatewayError.values.length) {
      return TTGatewayError.values[errorCode];
    }
    return TTGatewayError.fail;
  }

  @override
  String toString() => 'TTGatewayException($errorCode: $errorMessage)';

  static TTGatewayException fromPlatform(PlatformException e) {
    int code = int.tryParse(e.code) ?? TTGatewayError.fail.index;
    return TTGatewayException(
      errorCode: code,
      errorMessage: e.message ?? '',
    );
  }
}

/// Exception for remote accessory (remote key, keypad, door sensor).
class TTRemoteAccessoryException implements Exception {
  TTRemoteAccessoryException({required this.errorCode, required this.errorMessage});

  final int errorCode;
  final String errorMessage;

  TTRemoteAccessoryError get remoteError {
    if (errorCode >= 0 && errorCode < TTRemoteAccessoryError.values.length) {
      return TTRemoteAccessoryError.values[errorCode];
    }
    return TTRemoteAccessoryError.fail;
  }

  @override
  String toString() => 'TTRemoteAccessoryException($errorCode: $errorMessage)';

  static TTRemoteAccessoryException fromPlatform(PlatformException e) {
    int code = int.tryParse(e.code) ?? TTRemoteAccessoryError.fail.index;
    return TTRemoteAccessoryException(
      errorCode: code,
      errorMessage: e.message ?? '',
    );
  }
}

/// Exception for remote keypad (multifunctional keypad) specific errors.
class TTRemoteKeypadException implements Exception {
  TTRemoteKeypadException({required this.errorCode, required this.errorMessage});

  final int errorCode;
  final String errorMessage;

  TTRemoteKeyPadAccessoryError get keypadError {
    if (errorCode >= 0 && errorCode < TTRemoteKeyPadAccessoryError.values.length) {
      return TTRemoteKeyPadAccessoryError.values[errorCode];
    }
    return TTRemoteKeyPadAccessoryError.fail;
  }

  @override
  String toString() => 'TTRemoteKeypadException($errorCode: $errorMessage)';

  static TTRemoteKeypadException fromPlatform(PlatformException e) {
    int code = int.tryParse(e.code) ?? TTRemoteKeyPadAccessoryError.fail.index;
    return TTRemoteKeypadException(
      errorCode: code,
      errorMessage: e.message ?? '',
    );
  }
}
