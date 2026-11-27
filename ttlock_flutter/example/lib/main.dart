// Callers: app entry. Affected API: override sharedPreferences from core app_storage.
// Schema: none. User: 启动时恢复本地 config 与会话；无凭证走配置门禁.
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/bootstrap/open_api_auth_error_handler.dart';
import 'package:ttlock_flutter_demo/core/data/dio_provider.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/app_storage.dart';
import 'package:ttlock_flutter_demo/core/locale/app_l10n.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/core/theme/theme_provider.dart';
import 'package:ttlock_flutter_demo/router/app_router.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/core/ble/tt_lock_ble_guard_provider.dart';
import 'package:ttlock_flutter_demo/core/loading/easy_loading_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      openApiErrorHandlerProvider.overrideWithValue(openApiAuthErrorHandler),
    ],
  );
  await container.read(appConfigServiceProvider.notifier).init();
  await container.read(userProvider.notifier).restore();
  container.read(ttLockBleGuardProvider);
  configureEasyLoading();
  runApp(UncontrolledProviderScope(container: container, child: const App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final mode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      title: ref.watch(l10nProvider).appName,
      theme: ref.watch(appThemeProvider(mode)),
      darkTheme: ref.watch(appThemeProvider(ThemeMode.dark)),
      themeMode: mode,
      locale: ref.watch(localeProvider),
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: supportedLocales,
      routerConfig: router,
      builder: EasyLoading.init(),
    );
  }
}
