import 'package:dio/dio.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';

/// Maps Dio errors to [AppException] and notifies on auth-expiry codes.
///
/// Open Platform token expiry appears as business `errcode` 10004 inside an
/// HTTP 200 body (write APIs). HTTP 401 is the transport-level equivalent;
/// both fire [onBusinessCode] so callers can clear the session and redirect.
class OpenApiErrorInterceptor extends Interceptor {
  OpenApiErrorInterceptor({required this.onBusinessCode});

  final void Function(int code, String message) onBusinessCode;

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    // cloud 业务码在 HTTP 200 响应体里(写接口 {errcode,...}):10004 token 失效 -> 全局登出
    // 注意:读接口返回裸数据/分页,不含 errcode,不会被误判
    final data = response.data;
    if (data is Map && data['errcode'] is int && data['errcode'] == 10004) {
      onBusinessCode(10004, (data['errmsg'] as String?) ?? 'token 失效');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final app = err.error is AppException
        ? err.error as AppException
        : ExceptionUtils.extractAppException(err, err.stackTrace);
    if (app is AppBusinessException && app.code == 10004) {
      onBusinessCode(10004, app.message);
    } else if (app is AppHttpException && app.statusCode == 401) {
      onBusinessCode(401, app.message);
    }
    handler.reject(err.copyWith(error: app));
  }
}
