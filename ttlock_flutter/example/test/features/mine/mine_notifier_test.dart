import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/config/app_site.dart';
import 'package:ttlock_flutter_demo/features/mine/presentation/provider/mine_notifier.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/data/app_config_repository.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class _LoggedInUser extends UserProvider {
  @override
  UserSession? build() => const UserSession(
    accessToken: 't',
    refreshToken: 'r',
    uid: 1,
    loginName: 'user1',
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('mine 显示已登录账号与站点', () async {
    final container = ProviderContainer(
      overrides: [userProvider.overrideWith(_LoggedInUser.new)],
    );
    addTearDown(container.dispose);
    final n = container.read(mineProvider.notifier);
    await n.load();
    final s = container.read(mineProvider);
    expect(s.userName, 'user1');
    expect(s.siteLabel, '中国站');
  });

  test('更新站点后 mine 展示新站点标签', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        userProvider.overrideWith(_LoggedInUser.new),
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
    );
    addTearDown(container.dispose);
    await container
        .read(appConfigServiceProvider.notifier)
        .update(const AppConfig(site: AppSite.overseas));
    final n = container.read(mineProvider.notifier);
    await n.load();
    expect(container.read(mineProvider).siteLabel, '境外站');
  });
}
