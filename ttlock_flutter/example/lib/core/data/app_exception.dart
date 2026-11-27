import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
sealed class AppException with _$AppException implements Exception {
  const AppException._();
  const factory AppException(String message, StackTrace? stackTrace) =
      AppExceptionGeneric;
  const factory AppException.network({
    required dynamic exception,
    required String message,
    StackTrace? stackTrace,
  }) = AppNetworkException;
  const factory AppException.business({
    required int code,
    required String message,
    Object? data,
    StackTrace? stackTrace,
  }) = AppBusinessException;
  const factory AppException.http({
    required int statusCode,
    required String message,
    Object? data,
    StackTrace? stackTrace,
  }) = AppHttpException;
  const factory AppException.parse({
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) = AppParseException;
  const factory AppException.database({
    required String message,
    StackTrace? stackTrace,
  }) = AppDatabaseException;
  const factory AppException.firmware({
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) = AppFirmwareException;
  const factory AppException.unknown({
    required String message,
    Object? error,
    StackTrace? stackTrace,
  }) = AppUnknownException;

  static AppException fromDioException(DioException exception) {
    final stackTrace = exception.stackTrace;

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return AppException.network(
          exception: exception,
          message: '连接超时，请检查网络连接',
          stackTrace: stackTrace,
        );
      case DioExceptionType.sendTimeout:
        return AppException.network(
          exception: exception,
          message: '请求超时，请稍后重试',
          stackTrace: stackTrace,
        );
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return AppException.network(
          exception: exception,
          message: '响应超时，请稍后重试',
          stackTrace: stackTrace,
        );
      case DioExceptionType.badCertificate:
        return AppException.network(
          exception: exception,
          message: 'SSL证书验证失败',
          stackTrace: stackTrace,
        );
      case DioExceptionType.connectionError:
        return AppException.network(
          exception: exception,
          message: '网络连接失败，请检查网络设置',
          stackTrace: stackTrace,
        );
      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode ?? 0;
        if (statusCode >= 400 && statusCode < 500) {
          return AppException.http(
            statusCode: statusCode,
            message: _getHttpErrorMessage(statusCode),
            data: exception.response?.data,
            stackTrace: stackTrace,
          );
        } else if (statusCode >= 500) {
          return AppException.http(
            statusCode: statusCode,
            message: '服务器内部错误，请稍后重试',
            data: exception.response?.data,
            stackTrace: stackTrace,
          );
        } else {
          return AppException.http(
            statusCode: statusCode,
            message: exception.message ?? '请求失败',
            data: exception.response?.data,
            stackTrace: stackTrace,
          );
        }
      case DioExceptionType.cancel:
        return AppException.network(
          exception: exception,
          message: '请求已取消',
          stackTrace: stackTrace,
        );
      case DioExceptionType.unknown:
        return AppException.unknown(
          message: exception.message ?? '未知网络错误',
          error: exception,
          stackTrace: stackTrace,
        );
    }
  }

  bool get isAuthException => switch (this) {
    AppBusinessException(:final code) =>
      code == 10004 || code == 401 || code == 4001,
    _ => false,
  };

  bool get isNetworkException => this is AppNetworkException;

  bool get isBusinessException => this is AppBusinessException;

  static String _getHttpErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return '请求参数错误';
      case 401:
        return '未授权访问，请重新登录';
      case 403:
        return '没有权限访问该资源';
      case 404:
        return '请求的资源不存在';
      case 405:
        return '请求方法不被允许';
      case 408:
        return '请求超时';
      case 422:
        return '请求参数验证失败';
      case 429:
        return '请求过于频繁，请稍后重试';
      case 500:
        return '服务器内部错误';
      case 502:
        return '网关错误';
      case 503:
        return '服务暂时不可用';
      case 504:
        return '网关超时';
      default:
        return '请求失败 (状态码: $statusCode)';
    }
  }
}
