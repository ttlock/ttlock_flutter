import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/app_storage.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/domain/provider/group_domain.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/screen/group_manage_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_clear_records_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_records_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_settings_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/wifi_lock_config_screen.dart';
import 'package:ttlock_flutter_demo/router/app_router.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

import 'package:ttlock_flutter/ttlock_flutter.dart';

import '../helpers/mock_tt_lock_api.dart';

class _CredAppConfigService extends AppConfigService {
  @override
  AppConfig build() => const AppConfig(clientId: 'cid', clientSecret: 'sec');
}

/// 详情页会调 getLockDetail；Home 会调 listLocks。class Provider 必须用可构造 Fake.
class _FakeGroupDomain extends GroupDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, List<GroupEntity>> listWithLockNum() =>
      TaskEither.right(const []);
}

class _FakeLockDomain extends LockDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, PageState<LockEntity>> listLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  }) => TaskEither.right(const PageState<LockEntity>());
  @override
  TaskEither<AppException, LockEntity> getLockDetail(int lockId) =>
      TaskEither.right(LockEntity(lockId: lockId, lockAlias: 'L$lockId'));
  @override
  TaskEither<AppException, PageState<LockRecordEntity>> listRecords(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    int? recordType,
  }) => TaskEither.right(const PageState<LockRecordEntity>());
  @override
  TaskEither<AppException, AutoLockingTime> getAutoLockTime(String lockData) =>
      TaskEither.right(
        AutoLockingTime(currentTime: 0, minTime: 0, maxTime: 120),
      );
  @override
  TaskEither<AppException, PassageModeConfigEntity> getPassageMode(
    int lockId,
  ) => TaskEither.right(const PassageModeConfigEntity());
  @override
  TaskEither<AppException, WifiLockEntity> getWifiInfo(int lockId) =>
      TaskEither.right(const WifiLockEntity(networkName: 'HomeWiFi'));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(registerTtLockFallbacks);

  setUp(() => SharedPreferences.setMockInitialValues({}));

  tearDown(resetTtLockTestHooks);

  // 绕过 redirect 门禁：注入有凭证的 AppConfigService + 已登录会话。
  Future<ProviderContainer> loggedInContainer() async {
    final ttlock = MockTTLockApi();
    stubLockApiDefaults(ttlock);
    installMockLockApi(ttlock);
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        appConfigServiceProvider.overrideWith(_CredAppConfigService.new),
        lockDomainProvider.overrideWith(_FakeLockDomain.new),
        groupDomainProvider.overrideWith(_FakeGroupDomain.new),
      ],
    );
    addTearDown(container.dispose);
    await container
        .read(userProvider.notifier)
        .setSession(const UserSession(accessToken: 't', refreshToken: 'r'));
    return container;
  }

  testWidgets('P2 全路由可解析到预期 path', (tester) async {
    final container = await loggedInContainer();
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    final cases = <String, String>{
      RoutePaths.scan: '/scan',
      RoutePaths.groups: '/groups',
      RoutePaths.lockDetail.replaceFirst(':lockId', '1'): '/lock/1',
      RoutePaths.lockRecords.replaceFirst(':lockId', '1'): '/lock/1/records',
      RoutePaths.lockSettings.replaceFirst(':lockId', '1'): '/lock/1/settings',
      RoutePaths.lockWifi.replaceFirst(':lockId', '1'): '/lock/1/wifi',
    };
    for (final entry in cases.entries) {
      router.go(entry.value);
      await tester.pumpAndSettle();
      expect(
        router.routerDelegate.currentConfiguration.uri.path,
        entry.value,
        reason: entry.key,
      );
    }
  });

  testWidgets('全屏路由都能构建出真实屏', (tester) async {
    final container = await loggedInContainer();
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    router.go('/lock/1/settings');
    await tester.pumpAndSettle();
    expect(find.byType(LockSettingsScreen), findsOneWidget);

    router.go('/lock/1/wifi');
    await tester.pumpAndSettle();
    expect(find.byType(WifiLockConfigScreen), findsOneWidget);

    router.go('/lock/1/records');
    await tester.pumpAndSettle();
    expect(find.byType(LockRecordsScreen), findsOneWidget);

    router.go('/groups');
    await tester.pumpAndSettle();
    expect(find.byType(GroupManageScreen), findsOneWidget);
  });

  testWidgets('清空记录确认 sheet 可 push 构建', (tester) async {
    final container = await loggedInContainer();
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    router.go('/lock/1/records');
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.delete_sweep_outlined));
    await tester.pumpAndSettle();
    expect(find.byType(LockClearRecordsConfirmSheet), findsOneWidget);
  });
}
