import 'package:ttlock_flutter/errors/errors.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart'
    show TTLockError, TTMultifunctionalKeypadError;
import 'package:ttlock_flutter_demo/core/ble/keypad_enroll_timeout.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/services/permission_service/permission_service.dart';

/// BLE 插件异常 → 统一 [AppException]（薄工具，无状态）。
///
/// 插件侧已统一为领域异常（[TTLockException] / [TTGatewayException] 等），
/// 不再出现独立的 Pigeon 字符串异常类型。
abstract final class BleExceptionMapper {
  static AppException mapToAppException(
    Object error, [
    StackTrace? stackTrace,
  ]) {
    if (error is AppException) return error;
    if (error is TTLockException) {
      switch (error.code) {
        case TTLockError.noPermisstion:
          return AppException.business(
            code: PermissionService.permissionDeniedCode,
            message: 'bluetooth_permission_denied',
            data: error,
            stackTrace: stackTrace,
          );
        case TTLockError.bluetoothOff:
          return AppException.business(
            code: -10,
            message: 'bluetooth_not_on',
            data: error,
            stackTrace: stackTrace,
          );
        default:
          return AppException.firmware(
            message: error.message ?? 'BLE lock operation failed',
            error: error,
            stackTrace: stackTrace,
          );
      }
    }
    if (error is TTMultifunctionalKeypadException &&
        error.code == TTMultifunctionalKeypadError.timeout) {
      return AppException.business(
        code: kKeypadEnrollTimeoutCode,
        message: 'enroll_timeout',
        data: error,
        stackTrace: stackTrace,
      );
    }
    if (error is TTException) {
      return AppException.firmware(
        message: error.message ?? error.toString(),
        error: error,
        stackTrace: stackTrace,
      );
    }
    return AppException.unknown(
      message: error.toString(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}
