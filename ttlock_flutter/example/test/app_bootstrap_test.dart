// Callers: bootstrap smoke tests. Affected API: initial route = config when no creds.
// Schema: none. User: 无预填时先进配置页；有凭证+会话进首页.
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/main.dart';
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

  testWidgets('App 可构建, 无凭证初始落在配置页', (tester) async {
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const App()),
    );
    await tester.pumpAndSettle();
    expect(find.text('开放平台配置'), findsWidgets);
    expect(find.text('Client ID'), findsOneWidget);
  });

  testWidgets('有凭证未登录落在登录页', (tester) async {
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        appConfigServiceProvider.overrideWith(_CredAppConfigService.new),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const App()),
    );
    await tester.pumpAndSettle();
    expect(find.text('登录'), findsWidgets);
  });

  testWidgets('已登录落在首页 3 Tab Shell', (tester) async {
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        appConfigServiceProvider.overrideWith(_CredAppConfigService.new),
      ],
    );
    addTearDown(container.dispose);
    await container
        .read(userProvider.notifier)
        .setSession(const UserSession(accessToken: 't', refreshToken: 'r'));

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: const App()),
    );
    await tester.pumpAndSettle();
    expect(find.text('锁'), findsWidgets);
    expect(find.text('其他设备'), findsOneWidget);
    expect(find.text('我的'), findsOneWidget);
  });
}
