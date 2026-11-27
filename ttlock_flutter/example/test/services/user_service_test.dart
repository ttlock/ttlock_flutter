import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/util/md5_utils.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_api.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_data_source.dart';
import 'package:ttlock_flutter_demo/services/user_service/data/user_token_dto.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_service.dart';

class _TestAppConfigService extends AppConfigService {
  @override
  AppConfig build() => const AppConfig(clientId: 'cid', clientSecret: 'sec');
}

class _EmptyAppConfigService extends AppConfigService {
  @override
  AppConfig build() => const AppConfig();
}

Dio _oauthDio() => Dio(
  BaseOptions(
    baseUrl: 'https://api.sciener.com',
    contentType: Headers.formUrlEncodedContentType,
  ),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('密码 MD5 32 位小写', () {
    expect(md5Of('123456'), 'e10adc3949ba59abbe56e057f20f883e');
  });

  test('DTO 解析 access_token/uid', () {
    const json = {
      'access_token': 'a',
      'uid': 2340,
      'refresh_token': 'r',
      'expires_in': 7776000,
    };
    final dto = UserTokenDto.fromJson(json);
    expect(dto.accessToken, 'a');
    expect(dto.toEntity().uid, 2340);
  });

  test('UserSession.isExpired 按 obtainedAt + expiresIn 判断', () {
    final now = DateTime.now().millisecondsSinceEpoch;
    final fresh = UserSession(
      accessToken: 'a',
      refreshToken: 'r',
      expiresIn: 7776000,
      obtainedAt: now,
    );
    expect(fresh.isExpired, isFalse);

    final stale = UserSession(
      accessToken: 'a',
      refreshToken: 'r',
      expiresIn: 1,
      obtainedAt: now - 2000,
    );
    expect(stale.isExpired, isTrue);

    const noExpiry = UserSession(accessToken: 'a', refreshToken: 'r');
    expect(noExpiry.isExpired, isFalse);
  });

  group('UserApi http_mock_adapter', () {
    test('login POST /oauth2/token 解析 access_token/uid', () async {
      final dio = _oauthDio();
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/oauth2/token',
        (server) => server.reply(200, {
          'access_token': 'a',
          'uid': 2340,
          'refresh_token': 'r',
          'expires_in': 7776000,
        }),
        data: Matchers.any,
      );
      final dto = await UserApi(dio).login(
        clientId: 'cid',
        clientSecret: 'sec',
        username: 'user1',
        password: 'e10adc3949ba59abbe56e057f20f883e',
      );
      expect(dto.accessToken, 'a');
      expect(dto.uid, 2340);
      expect(dto.refreshToken, 'r');
      expect(dto.expiresIn, 7776000);
    });

    test('refresh POST /oauth2/token 带 grant_type=refresh_token', () async {
      final dio = _oauthDio();
      final adapter = DioAdapter(dio: dio);
      Map<String, dynamic>? body;
      adapter.onPost('/oauth2/token', (server) {
        server.replyCallback(200, (options) {
          body = Map<String, dynamic>.from(options.data as Map);
          return {
            'access_token': 'a2',
            'refresh_token': 'r2',
            'expires_in': 7776000,
          };
        });
      }, data: Matchers.any);
      final dto = await UserApi(dio).refresh(
        clientId: 'cid',
        clientSecret: 'sec',
        grantType: 'refresh_token',
        refreshToken: 'r',
      );
      expect(dto.accessToken, 'a2');
      expect(body!['grant_type'], 'refresh_token');
      expect(body!['refresh_token'], 'r');
    });

    test('register POST /v3/user/register 返回 username', () async {
      final dio = _oauthDio();
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/v3/user/register',
        (server) => server.reply(200, {'username': 'abcd_user1'}),
        data: Matchers.any,
      );
      final dto = await UserApi(dio).register(
        clientId: 'cid',
        clientSecret: 'sec',
        username: 'user1',
        password: 'e10adc3949ba59abbe56e057f20f883e',
      );
      expect(dto.username, 'abcd_user1');
    });
  });

  group('UserDataSource', () {
    test('login 将明文密码 MD5 后提交并返回 DTO', () async {
      final dio = _oauthDio();
      final adapter = DioAdapter(dio: dio);
      Map<String, dynamic>? body;
      adapter.onPost('/oauth2/token', (server) {
        server.replyCallback(200, (options) {
          body = Map<String, dynamic>.from(options.data as Map);
          return {
            'access_token': 'a',
            'uid': 2340,
            'refresh_token': 'r',
            'expires_in': 7776000,
          };
        });
      }, data: Matchers.any);

      final container = ProviderContainer(
        overrides: [userApiProvider.overrideWithValue(UserApi(dio))],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(userDataSourceProvider.notifier)
          .login(
            clientId: 'cid',
            clientSecret: 'sec',
            username: 'user1',
            password: '123456',
          )
          .run();

      expect(result.isRight(), isTrue);
      expect(body!['password'], 'e10adc3949ba59abbe56e057f20f883e');
      expect(body!['username'], 'user1');
      final dto = result.getOrElse((_) => throw StateError('expected Right'));
      expect(dto.accessToken, 'a');
      expect(dto.uid, 2340);
    });
  });

  group('UserProvider 会话持久化', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('setSession 写入 user_session，restore 读回', () async {
      final prefs = await SharedPreferences.getInstance();
      final container = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      );
      addTearDown(container.dispose);

      const session = UserSession(
        accessToken: 'a',
        refreshToken: 'r',
        uid: 2340,
        expiresIn: 7776000,
        loginName: 'user1',
        obtainedAt: 1700000000000,
      );
      await container.read(userProvider.notifier).setSession(session);

      final raw = prefs.getString('user_session');
      expect(raw, isNotNull);
      final map = jsonDecode(raw!) as Map<String, dynamic>;
      expect(map['accessToken'], 'a');
      expect(map['refreshToken'], 'r');
      expect(map['uid'], 2340);
      expect(map['loginName'], 'user1');
      expect(map['obtainedAt'], 1700000000000);

      final reloaded = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      );
      addTearDown(reloaded.dispose);
      await reloaded.read(userProvider.notifier).restore();
      final restored = reloaded.read(userProvider);
      expect(restored?.accessToken, 'a');
      expect(restored?.uid, 2340);
      expect(restored?.loginName, 'user1');
    });

    test('logout 清空内存会话与持久化', () async {
      final prefs = await SharedPreferences.getInstance();
      final container = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      );
      addTearDown(container.dispose);

      await container
          .read(userProvider.notifier)
          .setSession(const UserSession(accessToken: 'a', refreshToken: 'r'));
      await container.read(userProvider.notifier).logout();
      expect(container.read(userProvider), isNull);
      expect(prefs.getString('user_session'), isNull);
    });
  });

  group('UserService 登录链路', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('login 成功后写入 userProvider 与持久化', () async {
      final prefs = await SharedPreferences.getInstance();
      final dio = _oauthDio();
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/oauth2/token',
        (server) => server.reply(200, {
          'access_token': 'tok',
          'uid': 2340,
          'refresh_token': 'ref',
          'expires_in': 7776000,
        }),
        data: Matchers.any,
      );

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          userApiProvider.overrideWithValue(UserApi(dio)),
          appConfigServiceProvider.overrideWith(_TestAppConfigService.new),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(userServiceProvider.notifier)
          .login('user1', '123456')
          .run();

      expect(result.isRight(), isTrue);
      final session = container.read(userProvider);
      expect(session?.accessToken, 'tok');
      expect(session?.uid, 2340);
      expect(session?.loginName, 'user1');
      expect(prefs.getString('user_session'), isNotNull);
    });

    test('login HTTP 200 errcode 10007 返回 Left 且不写会话', () async {
      final prefs = await SharedPreferences.getInstance();
      final dio = _oauthDio();
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/oauth2/token',
        (server) => server.reply(200, {'errcode': 10007, 'errmsg': '账号或密码错误'}),
        data: Matchers.any,
      );

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          userApiProvider.overrideWithValue(UserApi(dio)),
          appConfigServiceProvider.overrideWith(_TestAppConfigService.new),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(userServiceProvider.notifier)
          .login('user1', 'wrong')
          .run();

      expect(result.isLeft(), isTrue);
      result.fold((e) {
        expect(e, isA<AppBusinessException>());
        expect((e as AppBusinessException).code, 10007);
        expect(e.message, '账号或密码错误');
        expect(e.isAuthException, isFalse);
      }, (_) {});
      expect(container.read(userProvider), isNull);
      expect(prefs.getString('user_session'), isNull);
    });

    // Called by: fvm flutter test test/services/user_service_test.dart
    // Extends existing UserService suite; reproduces OAuth body with only errmsg.
    test('login HTTP 200 仅 errmsg 无 access_token 返回 Left 且不写会话', () async {
      final prefs = await SharedPreferences.getInstance();
      final dio = _oauthDio();
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/oauth2/token',
        (server) => server.reply(200, {
          'errmsg':
              'invalid_request, Missing parameters: client_secret client_id',
        }),
        data: Matchers.any,
      );

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          userApiProvider.overrideWithValue(UserApi(dio)),
          appConfigServiceProvider.overrideWith(_TestAppConfigService.new),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(userServiceProvider.notifier)
          .login('user1', '123456')
          .run();

      expect(result.isLeft(), isTrue);
      result.fold((e) {
        expect(e, isA<AppBusinessException>());
        expect(
          e.message,
          'invalid_request, Missing parameters: client_secret client_id',
        );
      }, (_) {});
      expect(container.read(userProvider), isNull);
      expect(prefs.getString('user_session'), isNull);
    });

    test('clientId/clientSecret 为空时不发请求并返回 Left', () async {
      final prefs = await SharedPreferences.getInstance();
      final dio = _oauthDio();
      var requestCount = 0;
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            requestCount++;
            handler.next(options);
          },
        ),
      );
      DioAdapter(dio: dio).onPost(
        '/oauth2/token',
        (server) => server.reply(200, {'access_token': 'should-not-happen'}),
        data: Matchers.any,
      );

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          userApiProvider.overrideWithValue(UserApi(dio)),
          appConfigServiceProvider.overrideWith(_EmptyAppConfigService.new),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(userServiceProvider.notifier)
          .login('user1', '123456')
          .run();

      expect(requestCount, 0);
      expect(result.isLeft(), isTrue);
      result.fold((e) {
        expect(e, isA<AppBusinessException>());
        expect(e.message, contains('clientId'));
      }, (_) {});
      expect(container.read(userProvider), isNull);
    });

    test('login 网络失败映射为 AppException 且不写会话', () async {
      final prefs = await SharedPreferences.getInstance();
      final dio = _oauthDio();
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/oauth2/token',
        (server) => server.throws(
          0,
          DioException(
            requestOptions: RequestOptions(path: '/oauth2/token'),
            type: DioExceptionType.connectionTimeout,
          ),
        ),
        data: Matchers.any,
      );

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          userApiProvider.overrideWithValue(UserApi(dio)),
          appConfigServiceProvider.overrideWith(_TestAppConfigService.new),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(userServiceProvider.notifier)
          .login('user1', '123456')
          .run();

      expect(result.isLeft(), isTrue);
      result.fold((e) => expect(e, isA<AppNetworkException>()), (_) {});
      expect(container.read(userProvider), isNull);
    });
  });
}
