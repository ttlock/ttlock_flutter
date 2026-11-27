import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_delete_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_settings_screen.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import '../../helpers/mock_tt_lock_api.dart';

class _MockLockDomain extends Mock implements LockDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<
    AppException,
    ({LockEntity lock, LockCloudSettings settings})
  >
  getLockDetailWithSettings(int lockId) => TaskEither.right((
    lock: LockEntity(lockId: lockId),
    settings: const LockCloudSettings(),
  ));
  @override
  TaskEither<AppException, WifiLockEntity> getWifiInfo(int lockId) =>
      TaskEither.right(const WifiLockEntity());
  @override
  TaskEither<AppException, Unit> setSound(
    LockEntity lock, {
    required bool on,
  }) => _mock.setSound(lock, on: on);
  @override
  TaskEither<AppException, LockUpgradeCheckEntity> checkUpgrade(int lockId) =>
      _mock.checkUpgrade(lockId);
  @override
  TaskEither<AppException, Unit> deleteLockFlow(LockEntity lock) =>
      _mock.deleteLockFlow(lock);
  @override
  TaskEither<AppException, Unit> setWifiPowerSaving(
    LockEntity lock, {
    required bool on,
  }) => _mock.setWifiPowerSaving(lock, on: on);
  @override
  TaskEither<AppException, Unit> syncSettingsFromLock(LockEntity lock) =>
      _mock.syncSettingsFromLock(lock);
}

const lock = LockEntity(
  lockId: 1,
  lockAlias: 'A',
  lockData: 'ld',
  hasGateway: true,
);

void main() {
  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(const LockEntity(lockId: 0));
  });

  tearDown(resetTtLockTestHooks);

  Future<void> tallSurface(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 2400));
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }

  void stubTtlock(MockTTLockApi ttlock) {
    stubLockApiDefaults(ttlock);
    installMockLockApi(ttlock);
  }

  testWidgets('渲染设置项，声音开关调用 domain', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    stubTtlock(ttlock);
    when(
      () =>
          ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((inv) async {
      final fn = inv.positionalArguments[0] as TTLockFunction;
      return fn != TTLockFunction.soundVolumeAndLanguageSetting;
    });
    when(
      () => domain.setSound(lock, on: false),
    ).thenAnswer((_) => TaskEither.right(unit));
    await tallSurface(tester);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(
          home: LockSettingsScreen(lockId: 1, lock: lock),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('settings_auto_lock')), findsOneWidget);
    expect(find.byKey(const Key('settings_check_upgrade')), findsOneWidget);
    await tester.tap(find.byKey(const Key('settings_sound')));
    await tester.pumpAndSettle();
    verify(() => domain.setSound(lock, on: false)).called(1);
  });

  testWidgets('检查固件升级显示结果', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    stubTtlock(ttlock);
    when(() => domain.checkUpgrade(1)).thenAnswer(
      (_) => TaskEither.right(
        const LockUpgradeCheckEntity(needUpgrade: 1, version: '1.2.0'),
      ),
    );
    await tallSurface(tester);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(
          home: LockSettingsScreen(lockId: 1, lock: lock),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('settings_check_upgrade')));
    await tester.pumpAndSettle();
    expect(find.textContaining('1.2.0'), findsWidgets);
  });

  testWidgets('返回时带出本地 LockEntity（不丢 lockData）', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    stubTtlock(ttlock);

    LockEntity? popped;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: TextButton(
                key: const Key('open_settings'),
                onPressed: () async {
                  popped = await Navigator.of(context).push<LockEntity>(
                    MaterialPageRoute(
                      builder: (_) =>
                          const LockSettingsScreen(lockId: 1, lock: lock),
                    ),
                  );
                },
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open_settings')));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(popped, isNotNull);
    expect(popped!.lockData, 'ld');
    expect(popped!.lockId, 1);
  });

  testWidgets('空 lockData：横幅 + BLE 项禁用，不调 getLockConfig', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    const emptyLock = LockEntity(
      lockId: 1,
      lockAlias: 'A',
      lockData: '',
      hasGateway: true,
    );
    await tester.binding.setSurfaceSize(const Size(400, 2400));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(
          home: LockSettingsScreen(lockId: 1, lock: emptyLock),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('incomplete_lock_data')), findsOneWidget);
    expect(find.byKey(const Key('settings_sound')), findsNothing);
    expect(find.byKey(const Key('settings_auto_lock')), findsNothing);
    expect(find.byKey(const Key('settings_lock_info')), findsOneWidget);
    expect(find.byKey(const Key('settings_refresh_system_info')), findsNothing);
    expect(find.byKey(const Key('settings_refresh_battery')), findsNothing);
    expect(
      tester
          .widget<ListTile>(find.byKey(const Key('settings_lock_time')))
          .onTap,
      isNull,
    );
    expect(
      tester.widget<ListTile>(find.byKey(const Key('settings_delete'))).onTap,
      isNull,
    );
    expect(
      tester
          .widget<ListTile>(find.byKey(const Key('settings_check_upgrade')))
          .onTap,
      isNotNull,
    );
    expect(
      tester.widget<ListTile>(find.byKey(const Key('settings_rename'))).onTap,
      isNotNull,
    );
    expect(
      tester.widget<ListTile>(find.byKey(const Key('settings_transfer'))).onTap,
      isNotNull,
    );
    expect(
      tester
          .widget<ListTile>(find.byKey(const Key('settings_change_group')))
          .onTap,
      isNotNull,
    );
    // 空 lockData 时 nb 注册等 BLE 能力项不展示。
    expect(find.byKey(const Key('settings_nb_register')), findsNothing);
    verifyNever(
      () => ttlock.getLockConfig(any(), any(), timeout: any(named: 'timeout')),
    );
  });

  const phase1CapabilityKeys = <(TTLockFunction, String)>[
    (TTLockFunction.privacyLock, 'settings_privacy_lock'),
    (TTLockFunction.tamperAlert, 'settings_tamper_alert'),
    (TTLockFunction.resetButton, 'settings_reset_button'),
    (TTLockFunction.unlockSwitch, 'settings_remote_unlock'),
    (TTLockFunction.doubleAuth, 'settings_double_auth'),
    (TTLockFunction.audioSwitch, 'settings_sound'),
    (TTLockFunction.unlockDirection, 'settings_open_direction'),
    (TTLockFunction.passageMode, 'settings_passage_mode'),
  ];

  const wifiPowerSavingKey = Key('settings_wifi_power_saving');
  const workingModeKey = Key('settings_working_mode');
  const unauthorizedAttemptKey = Key('settings_unauthorized_attempt');

  Future<void> pumpSettings(
    WidgetTester tester, {
    required _MockLockDomain domain,
    required MockTTLockApi ttlock,
  }) async {
    await tallSurface(tester);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(
          home: LockSettingsScreen(lockId: 1, lock: lock),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('段 1 能力位全开时显示对应 Key', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    stubTtlock(ttlock);
    await pumpSettings(tester, domain: domain, ttlock: ttlock);
    for (final (_, key) in phase1CapabilityKeys) {
      expect(find.byKey(Key(key)), findsOneWidget, reason: key);
    }
    expect(find.byKey(wifiPowerSavingKey), findsOneWidget);
    expect(find.byKey(workingModeKey), findsOneWidget);
    expect(find.byKey(unauthorizedAttemptKey), findsOneWidget);
  });

  testWidgets('wifiLock=false 隐藏 settings_wifi_power_saving', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    stubTtlock(ttlock);
    when(
      () =>
          ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((inv) async {
      final fn = inv.positionalArguments[0] as TTLockFunction;
      return fn != TTLockFunction.wifiLock;
    });
    await pumpSettings(tester, domain: domain, ttlock: ttlock);
    expect(find.byKey(wifiPowerSavingKey), findsNothing);
    expect(find.byKey(const Key('settings_auto_lock')), findsOneWidget);
    verifyNever(
      () => ttlock.getLockConfig(
        TTLockConfig.wifiLockPowerSavingMode,
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  testWidgets('workingMode=false 隐藏 settings_working_mode', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    stubTtlock(ttlock);
    when(
      () =>
          ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((inv) async {
      final fn = inv.positionalArguments[0] as TTLockFunction;
      return fn != TTLockFunction.workingMode;
    });
    await pumpSettings(tester, domain: domain, ttlock: ttlock);
    expect(find.byKey(workingModeKey), findsNothing);
    expect(find.byKey(const Key('settings_auto_lock')), findsOneWidget);
  });

  testWidgets(
    'unauthorizedAttemptAlarm=false 隐藏 settings_unauthorized_attempt',
    (tester) async {
      final domain = _MockLockDomain();
      final ttlock = MockTTLockApi();
      stubTtlock(ttlock);
      when(
        () => ttlock.supportFunction(
          any(),
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((inv) async {
        final fn = inv.positionalArguments[0] as TTLockFunction;
        return fn != TTLockFunction.unauthorizedAttemptAlarm;
      });
      await pumpSettings(tester, domain: domain, ttlock: ttlock);
      expect(find.byKey(unauthorizedAttemptKey), findsNothing);
      expect(find.byKey(const Key('settings_auto_lock')), findsOneWidget);
    },
  );

  for (final (function, key) in phase1CapabilityKeys) {
    testWidgets('${function.name}=false 隐藏 $key', (tester) async {
      final domain = _MockLockDomain();
      final ttlock = MockTTLockApi();
      stubTtlock(ttlock);
      when(
        () => ttlock.supportFunction(
          any(),
          any(),
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((inv) async {
        final fn = inv.positionalArguments[0] as TTLockFunction;
        return fn != function;
      });
      await pumpSettings(tester, domain: domain, ttlock: ttlock);
      expect(find.byKey(Key(key)), findsNothing);
      expect(find.byKey(const Key('settings_auto_lock')), findsOneWidget);
      if (function == TTLockFunction.privacyLock) {
        verifyNever(
          () => ttlock.getLockConfig(
            TTLockConfig.privacyLock,
            any(),
            timeout: any(named: 'timeout'),
          ),
        );
      }
    });
  }

  testWidgets('supports(audioSwitch)==false 隐藏声音开关', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    stubTtlock(ttlock);
    when(
      () =>
          ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((inv) async {
      final fn = inv.positionalArguments[0] as TTLockFunction;
      return fn != TTLockFunction.audioSwitch;
    });
    await tallSurface(tester);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(
          home: LockSettingsScreen(lockId: 1, lock: lock),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('settings_sound')), findsNothing);
    expect(find.byKey(const Key('settings_auto_lock')), findsOneWidget);
    verifyNever(
      () => ttlock.getLockConfig(
        TTLockConfig.audio,
        any(),
        timeout: any(named: 'timeout'),
      ),
    );
  });

  testWidgets('删除失败 SnackBar 且不 pop', (tester) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    stubTtlock(ttlock);
    when(() => domain.deleteLockFlow(any())).thenAnswer(
      (_) => TaskEither.left(
        const AppException.business(code: -21, message: 'ble_unreachable'),
      ),
    );
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => const LockSettingsScreen(lockId: 1, lock: lock),
        ),
        GoRoute(
          path: RoutePaths.lockDeleteConfirm,
          builder: (context, state) =>
              LockDeleteConfirmSheet(lock: state.extra! as LockEntity),
        ),
      ],
    );
    await tester.binding.setSurfaceSize(const Size(400, 2400));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('settings_delete')));
    await tester.tap(find.byKey(const Key('settings_delete')));
    await tester.pumpAndSettle();
    final l10n = lookupAppLocalizations(const Locale('zh'));
    await tester.tap(find.widgetWithText(FilledButton, l10n.deleteLock));
    await tester.pumpAndSettle();
    expect(find.text(l10n.bleUnreachable), findsOneWidget);
    expect(find.byType(LockSettingsScreen), findsOneWidget);
    verify(() => domain.deleteLockFlow(any())).called(1);
  });
}
