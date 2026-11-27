import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';

String getUserFriendlyMessage(AppException e, AppLocalizations l10n) {
  return switch (e) {
    AppBusinessException(:final code, :final message) => switch (code) {
      -29 => l10n.cardEncoderUnavailable,
      -28 => l10n.enrollTimeout,
      -35 => l10n.hotelCloudPending,
      -26 => l10n.doorSensorAlreadyBound,
      -25 => l10n.remoteRequired,
      -24 => l10n.invalidCyclicSchedule,
      -23 => l10n.permanentPeriodReadonly,
      -22 => l10n.photoFaceNeedsGateway,
      -21 => l10n.bleUnreachable,
      -20 => l10n.usernameRequired,
      -11 => l10n.bluetoothPermissionDenied,
      -10 => l10n.bluetoothNotOn,
      -4 => l10n.unauthorizedAttemptNeedsGateway,
      -3 => l10n.workingModeNeedsGateway,
      -2 => l10n.unsupportedLockScene,
      -1 => l10n.lockAlreadyInitialized,
      _ => message.isEmpty ? l10n.errorUnknown : message,
    },
    AppNetworkException() => l10n.errorNetwork,
    AppHttpException() => l10n.errorHttp,
    AppParseException() => l10n.errorParse,
    AppFirmwareException() => switch(e.error){
      TTLockException(:final code, :final message) => "$code: $message",
      TTGatewayException(:final code, :final message) => "$code: $message",
      TTRemoteAccessoryException(:final code, :final message) => "$code: $message",
      TTMultifunctionalKeypadException(:final code, :final message) => "$code: $message",
      TTStandaloneDoorSensorException(:final code, :final message) => "$code: $message",
      Object() => "${e.error}",
      null => "Unknown error",
    },
    _ => l10n.errorUnknown,
  };
}
