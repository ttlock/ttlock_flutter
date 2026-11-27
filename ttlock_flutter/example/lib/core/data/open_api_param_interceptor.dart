import 'package:dio/dio.dart';

/// Injects Open Platform common params: `clientId`, `date`, `accessToken`.
///
/// GET read APIs and multipart POSTs receive them as query parameters;
/// form-urlencoded POSTs receive them in the form body.
class OpenApiParamInterceptor extends Interceptor {
  OpenApiParamInterceptor({
    required String Function() clientId,
    required String? Function() accessToken,
    bool Function(String path)? shouldExclude,
  }) : _clientId = clientId,
       _accessToken = accessToken,
       _shouldExclude = shouldExclude ?? _neverExclude;

  static bool _neverExclude(String path) => false;

  final String Function() _clientId;
  final String? Function() _accessToken;
  final bool Function(String path) _shouldExclude;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!_shouldExclude(options.path)) {
      final date = DateTime.now().millisecondsSinceEpoch.toString();
      if (options.method == 'POST' && options.data is! FormData) {
        // 开放平台写接口为 form-urlencoded:公共参数进 form body(curl --data-urlencode 同款)
        final data = (options.data is Map)
            ? Map<String, dynamic>.from(options.data as Map)
            : <String, dynamic>{};
        data.putIfAbsent('clientId', _clientId);
        data['date'] = date;
        final token = _accessToken();
        if (token != null) data['accessToken'] = token;
        options.data = data;
      } else {
        // GET 读接口 / multipart POST:公共参数进 query，保留 FormData 实例
        final query = options.queryParameters;
        query.putIfAbsent('clientId', _clientId);
        query['date'] = date;
        final token = _accessToken();
        if (token != null) query['accessToken'] = token;
        options.queryParameters = query;
      }
    }
    handler.next(options);
  }
}
