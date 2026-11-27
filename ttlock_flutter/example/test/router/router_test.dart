// Callers: CI / fvm flutter test. Affected API: GoRouter redirect for config gate.
// Schema: none. User: 「进入app时若没有本地数据或config测试预填则先进入id密钥完善页面，再进入登录页」
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/router/app_router.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class _CredAppConfigService extends AppConfigService {
  @override
  AppConfig build() => const AppConfig(clientId: 'cid', clientSecret: 'sec');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<ProviderContainer> containerWithPrefs({
    UserSession? session,
    bool withCredentials = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final overrides = [
      sharedPreferencesProvider.overrideWithValue(prefs),
      if (withCredentials)
        appConfigServiceProvider.overrideWith(_CredAppConfigService.new),
    ];
    final container = ProviderContainer(overrides: overrides);
    if (session != null) {
      await container.read(userProvider.notifier).setSession(session);
    }
    return container;
  }

  testWidgets('无 clientId/Secret 访问 / 重定向到 /config', (tester) async {
    final container = await containerWithPrefs();
    addTearDown(container.dispose);
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    router.go('/');
    await tester.pumpAndSettle();
    expect(router.routerDelegate.currentConfiguration.uri.path, '/config');
  });

  testWidgets('有凭证未登录访问 / 重定向到 /login', (tester) async {
    final container = await containerWithPrefs(withCredentials: true);
    addTearDown(container.dispose);
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    router.go('/');
    await tester.pumpAndSettle();
    expect(router.routerDelegate.currentConfiguration.uri.path, '/login');
  });

  testWidgets('空 accessToken 不算已登录，有凭证时仍去 /login', (tester) async {
    final container = await containerWithPrefs(
      withCredentials: true,
      session: const UserSession(accessToken: '', refreshToken: ''),
    );
    addTearDown(container.dispose);
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    router.go('/');
    await tester.pumpAndSettle();
    expect(router.routerDelegate.currentConfiguration.uri.path, '/login');
  });

  testWidgets('有凭证已登录访问 / 留在 home', (tester) async {
    final container = await containerWithPrefs(
      withCredentials: true,
      session: const UserSession(accessToken: 't', refreshToken: 'r'),
    );
    addTearDown(container.dispose);
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    router.go('/');
    await tester.pumpAndSettle();
    expect(router.routerDelegate.currentConfiguration.uri.path, '/');
  });

  testWidgets('登出后 refreshListenable 重定向到 /login', (tester) async {
    final container = await containerWithPrefs(
      withCredentials: true,
      session: const UserSession(accessToken: 't', refreshToken: 'r'),
    );
    addTearDown(container.dispose);
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    router.go('/');
    await tester.pumpAndSettle();
    expect(router.routerDelegate.currentConfiguration.uri.path, '/');

    await container.read(userProvider.notifier).logout();
    await tester.pumpAndSettle();
    expect(router.routerDelegate.currentConfiguration.uri.path, '/login');
  });
}
