import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/bootstrap/open_api_auth_error_handler.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/open_api_error_interceptor.dart';
import 'package:ttlock_flutter_demo/core/data/open_api_param_interceptor.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<ProviderContainer> containerWithPrefs({
    bool withAuthHandler = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    return ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        if (withAuthHandler)
          openApiErrorHandlerProvider.overrideWithValue(
            openApiAuthErrorHandler,
          ),
      ],
    );
  }

  test('dioProvider 使用 appConfig.baseUrl 并装配拦截器', () async {
    final container = await containerWithPrefs();
    addTearDown(container.dispose);

    final dio = container.read(dioProvider);
    expect(dio.options.baseUrl, AppSite.cn.baseUrl);
    expect(dio.interceptors.whereType<OpenApiParamInterceptor>(), isNotEmpty);
    expect(dio.interceptors.whereType<OpenApiErrorInterceptor>(), isNotEmpty);

    // 拦截器 FIFO：LogInterceptor 必须在参数注入之后，否则日志打印的是
    // 注入前快照（clientId / date / accessToken 全缺）。
    final interceptors = dio.interceptors.toList();
    expect(
      interceptors.indexWhere((i) => i is LogInterceptor),
      greaterThan(interceptors.indexWhere((i) => i is OpenApiParamInterceptor)),
    );
  });

  test('dio 随 site 切换重建 baseUrl', () async {
    final container = await containerWithPrefs();
    addTearDown(container.dispose);

    expect(container.read(dioProvider).options.baseUrl, AppSite.cn.baseUrl);

    await container
        .read(appConfigServiceProvider.notifier)
        .update(const AppConfig(site: AppSite.overseas));

    expect(
      container.read(dioProvider).options.baseUrl,
      AppSite.overseas.baseUrl,
    );
  });

  test('dioProvider 默认 handler 为 no-op 不清会话', () async {
    final container = await containerWithPrefs();
    addTearDown(container.dispose);
    await container
        .read(userProvider.notifier)
        .setSession(const UserSession(accessToken: 't', refreshToken: 'r'));

    final dio = container.read(dioProvider);
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
    expect(container.read(userProvider), isNotNull);
  });

  test('dioProvider 收到 10004 时经 handler 清会话', () async {
    final container = await containerWithPrefs(withAuthHandler: true);
    addTearDown(container.dispose);
    await container
        .read(userProvider.notifier)
        .setSession(const UserSession(accessToken: 't', refreshToken: 'r'));

    final dio = container.read(dioProvider);
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
    expect(container.read(userProvider), isNull);
  });

  test('dioProvider 收到 HTTP 401 时经 handler 清会话', () async {
    final container = await containerWithPrefs(withAuthHandler: true);
    addTearDown(container.dispose);
    await container
        .read(userProvider.notifier)
        .setSession(const UserSession(accessToken: 't', refreshToken: 'r'));

    final dio = container.read(dioProvider);
    final adapter = DioAdapter(dio: dio);
    adapter.onGet(
      '/v3/lock/list',
      (server) => server.reply(401, {'error': 'unauthorized'}),
    );

    try {
      await dio.get('/v3/lock/list');
      fail('expected DioException');
    } on DioException {
      expect(container.read(userProvider), isNull);
    }
  });
}
