import 'package:dio/dio.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

abstract final class ExceptionUtils {
  static AppException extractAppException(Object error, StackTrace? stack) {
    if (error is AppException) return error;
    if (error is DioException) return AppException.fromDioException(error);
    return AppException.unknown(
      message: error.toString(),
      error: error,
      stackTrace: stack,
    );
  }
}
