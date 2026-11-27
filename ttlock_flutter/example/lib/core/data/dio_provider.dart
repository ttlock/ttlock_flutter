import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/open_api_error_interceptor.dart';
import 'package:ttlock_flutter_demo/core/data/open_api_param_interceptor.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

part 'dio_provider.g.dart';

/// Overridable handler for Open Platform auth-expiry codes (10004 / HTTP 401).
///
/// Default is a no-op; wire session clearing at the composition root
/// ([main]) via [openApiErrorHandlerProvider.overrideWithValue].
@Riverpod(keepAlive: true)
void Function(int code, String message, Ref ref) openApiErrorHandler(Ref ref) {
  return (_, _, _) {};
}

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final config = ref.watch(appConfigServiceProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  dio.interceptors.addAll([
    OpenApiParamInterceptor(
      clientId: () => config.clientId,
      accessToken: () => ref.read(userProvider)?.accessToken,
      shouldExclude: (path) => path == '/oauth2/token',
    ),
    OpenApiErrorInterceptor(
      onBusinessCode: (code, msg) {
        ref.read(openApiErrorHandlerProvider)(code, msg, ref);
      },
    ),
    // 拦截器 FIFO 执行：LogInterceptor 必须最后加，否则打印的是注入前的请求快照
    // （见 dio LogInterceptor 文档「should be the last interceptor added」）。
    LogInterceptor(requestBody: true, responseBody: true),
  ]);
  ref.onDispose(dio.close);
  return dio;
}
