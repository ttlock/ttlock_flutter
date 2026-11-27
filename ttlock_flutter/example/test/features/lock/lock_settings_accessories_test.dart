import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/locale/app_localizations.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/provider/door_sensor_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_settings_screen.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import '../../helpers/mock_tt_lock_api.dart';

class _MockLockDomain extends Mock implements LockDomain {}



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
  TaskEither<AppException, LockUpgradeCheckEntity> checkUpgrade(int lockId) =>
      _mock.checkUpgrade(lockId);
}

class _FakeDoorSensorDomain extends DoorSensorDomain {
  @override
  void build() {}

  @override
  TaskEither<AppException, Option<DoorSensorEntity>> queryBound(int lockId) =>
      TaskEither.right(const Option.none());
}

const lock = LockEntity(
  lockId: 1,
  lockAlias: 'A',
  lockData: 'ld',
  hasGateway: true,
);

void main() {
  setUpAll(registerTtLockFallbacks);

  tearDown(resetTtLockTestHooks);

  overrides(domain, ttlock) => [
    lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
    doorSensorDomainProvider.overrideWith(_FakeDoorSensorDomain.new),
  ];

  testWidgets('settings shows remote entry when remoteKey supported', (
    tester,
  ) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(
      () => ttlock.getLockConfig(any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => true);
    when(
      () => ttlock.getRemoteUnlockSwitchState(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => false);
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((inv) async {
      final fn = inv.positionalArguments[0] as TTLockFunction;
      return fn == TTLockFunction.remoteKey ||
          fn == TTLockFunction.wirelessKeypad ||
          fn == TTLockFunction.doorSensor;
    });
    when(
      () => domain.checkUpgrade(any()),
    ).thenAnswer((_) => TaskEither.right(const LockUpgradeCheckEntity()));

    await tester.binding.setSurfaceSize(const Size(400, 2400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides(domain, ttlock),
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: LockSettingsScreen(lockId: 1, lock: lock),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('entry_accessory_remote')), findsOneWidget);
    expect(find.byKey(const Key('entry_accessory_keypad')), findsOneWidget);
    expect(
      find.byKey(const Key('entry_accessory_door_sensor')),
      findsOneWidget,
    );
  });

  testWidgets('settings hides remote entry when remoteKey unsupported', (
    tester,
  ) async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(
      () => ttlock.getLockConfig(any(), any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => true);
    when(
      () => ttlock.getRemoteUnlockSwitchState(any(), timeout: any(named: 'timeout')),
    ).thenAnswer((_) async => false);
    when(() => ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout'))).thenAnswer((_) async => false);
    when(
      () => domain.checkUpgrade(any()),
    ).thenAnswer((_) => TaskEither.right(const LockUpgradeCheckEntity()));

    await tester.binding.setSurfaceSize(const Size(400, 2400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides(domain, ttlock),
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: LockSettingsScreen(lockId: 1, lock: lock),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('entry_accessory_remote')), findsNothing);
  });
}
