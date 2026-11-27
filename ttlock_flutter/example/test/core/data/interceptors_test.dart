import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/open_api_error_interceptor.dart';
import 'package:ttlock_flutter_demo/core/data/open_api_param_interceptor.dart';

void main() {
  test('param 拦截器注入 clientId/date/accessToken', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiParamInterceptor(
          clientId: () => 'cid123',
          accessToken: () => 'tok1',
        ),
      );
    final adapter = DioAdapter(dio: dio);
    final captured = <Map<String, dynamic>>[];
    adapter.onGet('/v3/lock/list', (server) {
      server.replyCallback(200, (options) {
        captured.add(Map<String, dynamic>.from(options.queryParameters));
        return {'list': []};
      });
    });
    await dio.get('/v3/lock/list');
    final q = captured.single;
    expect(q['clientId'], 'cid123');
    expect(q['accessToken'], 'tok1');
    expect(q.containsKey('date'), isTrue);
  });

  test('param 拦截器对 POST form 注入到 body', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiParamInterceptor(
          clientId: () => 'cid123',
          accessToken: () => 'tok1',
        ),
      );
    final adapter = DioAdapter(dio: dio);
    final captured = <Map<String, dynamic>>[];
    adapter.onPost('/v3/keyboardPwd/delete', (server) {
      server.replyCallback(200, (options) {
        captured.add(Map<String, dynamic>.from(options.data as Map));
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await dio.post(
      '/v3/keyboardPwd/delete',
      data: {'lockId': 1, 'keyboardPwdId': 2, 'deleteType': 2},
    );
    final body = captured.single;
    expect(body['clientId'], 'cid123');
    expect(body['accessToken'], 'tok1');
    expect(body['lockId'], 1);
    expect(body.containsKey('date'), isTrue);
  });

  test('param 拦截器对 multipart POST 注入 query 且保留 FormData', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiParamInterceptor(
          clientId: () => 'cid123',
          accessToken: () => 'tok1',
        ),
      );
    final adapter = DioAdapter(dio: dio);
    FormData? capturedData;
    Map<String, dynamic>? capturedQuery;
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(const [1, 2, 3], filename: 'face.jpg'),
    });
    adapter.onPost('/v3/face/getFeatureDataByPhoto', (server) {
      server.replyCallback(200, (options) {
        capturedData = options.data as FormData?;
        capturedQuery = Map<String, dynamic>.from(options.queryParameters);
        return {'featureData': 'F0E4'};
      });
    }, data: Matchers.any);
    await dio.post(
      '/v3/face/getFeatureDataByPhoto',
      data: formData,
      queryParameters: {'lockId': 1},
    );
    expect(identical(capturedData, formData), isTrue);
    expect(capturedQuery?['clientId'], 'cid123');
    expect(capturedQuery?['accessToken'], 'tok1');
    expect(capturedQuery?.containsKey('date'), isTrue);
    expect(capturedQuery?['lockId'], 1);
  });

  test('param 拦截器 shouldExclude 时不注入公共参数', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiParamInterceptor(
          clientId: () => 'cid123',
          accessToken: () => 'tok1',
          shouldExclude: (path) => path == '/oauth2/token',
        ),
      );
    final adapter = DioAdapter(dio: dio);
    final captured = <Map<String, dynamic>>[];
    adapter.onPost('/oauth2/token', (server) {
      server.replyCallback(200, (options) {
        captured.add(Map<String, dynamic>.from(options.data as Map));
        return {'access_token': 'x'};
      });
    }, data: Matchers.any);
    await dio.post(
      '/oauth2/token',
      data: {'client_id': 'cid123', 'grant_type': 'password'},
    );
    final body = captured.single;
    expect(body.containsKey('clientId'), isFalse);
    expect(body.containsKey('accessToken'), isFalse);
    expect(body.containsKey('date'), isFalse);
  });

  test('param 拦截器 accessToken 为 null 时不注入 token', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiParamInterceptor(
          clientId: () => 'cid123',
          accessToken: () => null,
        ),
      );
    final adapter = DioAdapter(dio: dio);
    final captured = <Map<String, dynamic>>[];
    adapter.onPost('/v3/user/register', (server) {
      server.replyCallback(200, (options) {
        captured.add(Map<String, dynamic>.from(options.data as Map));
        return {'errcode': 0, 'errmsg': '', 'description': ''};
      });
    }, data: Matchers.any);
    await dio.post('/v3/user/register', data: {'username': 'u'});
    final body = captured.single;
    expect(body['clientId'], 'cid123');
    expect(body.containsKey('date'), isTrue);
    expect(body.containsKey('accessToken'), isFalse);
  });

  test('error 拦截器 HTTP 200 业务码 10004 回调登出', () async {
    final calls = <(int, String)>[];
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiErrorInterceptor(
          onBusinessCode: (code, message) => calls.add((code, message)),
        ),
      );
    final adapter = DioAdapter(dio: dio);
    adapter.onPost(
      '/v3/lock/delete',
      (server) => server.reply(200, {
        'errcode': 10004,
        'errmsg': 'token 失效',
        'description': '',
      }),
      data: Matchers.any,
    );
    await dio.post('/v3/lock/delete', data: {'lockId': 1});
    expect(calls, [(10004, 'token 失效')]);
  });

  test('error 拦截器 onError 路径业务码 10004 回调登出', () async {
    final calls = <(int, String)>[];
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiErrorInterceptor(
          onBusinessCode: (code, message) => calls.add((code, message)),
        ),
      );
    final adapter = DioAdapter(dio: dio);
    adapter.onGet(
      '/v3/lock/list',
      (server) => server.throws(
        0,
        DioException(
          requestOptions: RequestOptions(path: '/v3/lock/list'),
          type: DioExceptionType.unknown,
          error: const AppException.business(code: 10004, message: 'token 失效'),
        ),
      ),
    );
    try {
      await dio.get('/v3/lock/list');
      fail('expected DioException');
    } on DioException catch (e) {
      expect(e.error, isA<AppBusinessException>());
      expect((e.error! as AppBusinessException).code, 10004);
      expect(calls, [(10004, 'token 失效')]);
    }
  });

  test('error 拦截器 HTTP 401 回调登出并将 error 映射为 AppHttpException', () async {
    final calls = <(int, String)>[];
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiErrorInterceptor(
          onBusinessCode: (code, message) => calls.add((code, message)),
        ),
      );
    final adapter = DioAdapter(dio: dio);
    adapter.onGet(
      '/v3/lock/list',
      (server) => server.reply(401, {'error': 'unauthorized'}),
    );
    try {
      await dio.get('/v3/lock/list');
      fail('expected DioException');
    } on DioException catch (e) {
      expect(e.error, isA<AppHttpException>());
      final app = e.error! as AppHttpException;
      expect(app.statusCode, 401);
      expect(calls, hasLength(1));
      expect(calls.single.$1, 401);
    }
  });

  test('error 拦截器 DioException 映射为 AppException', () async {
    final calls = <(int, String)>[];
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiErrorInterceptor(
          onBusinessCode: (code, message) => calls.add((code, message)),
        ),
      );
    final adapter = DioAdapter(dio: dio);
    adapter.onGet(
      '/v3/lock/list',
      (server) => server.throws(
        0,
        DioException(
          requestOptions: RequestOptions(path: '/v3/lock/list'),
          type: DioExceptionType.connectionTimeout,
        ),
      ),
    );
    try {
      await dio.get('/v3/lock/list');
      fail('expected DioException');
    } on DioException catch (e) {
      expect(e.error, isA<AppNetworkException>());
      expect(calls, isEmpty);
    }
  });

  test('error 拦截器非 10004 业务码不回调', () async {
    final calls = <(int, String)>[];
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiErrorInterceptor(
          onBusinessCode: (code, message) => calls.add((code, message)),
        ),
      );
    final adapter = DioAdapter(dio: dio);
    adapter.onPost(
      '/v3/lock/delete',
      (server) => server.reply(200, {
        'errcode': 10007,
        'errmsg': '账号或密码错误',
        'description': '',
      }),
      data: Matchers.any,
    );
    await dio.post('/v3/lock/delete', data: {'lockId': 1});
    expect(calls, isEmpty);
  });

  test('error 拦截器读接口裸数据不含 errcode 不误判', () async {
    final calls = <(int, String)>[];
    final dio = Dio(BaseOptions(baseUrl: 'https://api.sciener.com'))
      ..interceptors.add(
        OpenApiErrorInterceptor(
          onBusinessCode: (code, message) => calls.add((code, message)),
        ),
      );
    final adapter = DioAdapter(dio: dio);
    adapter.onGet(
      '/v3/lock/list',
      (server) => server.reply(200, {
        'list': <Object>[],
        'pageNo': 1,
        'pageSize': 20,
        'pages': 0,
        'total': 0,
      }),
    );
    final response = await dio.get('/v3/lock/list');
    expect(response.statusCode, 200);
    expect(calls, isEmpty);
  });

  test('openApiErrorHandlerProvider 默认可覆盖', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    expect(container.read(openApiErrorHandlerProvider), isNotNull);

    var seenCode = 0;
    final overridden = ProviderContainer(
      overrides: [
        openApiErrorHandlerProvider.overrideWithValue((code, message, ref) {
          seenCode = code;
        }),
      ],
    );
    addTearDown(overridden.dispose);
    expect(overridden.read(openApiErrorHandlerProvider), isNotNull);
    expect(seenCode, 0);
  });
}
