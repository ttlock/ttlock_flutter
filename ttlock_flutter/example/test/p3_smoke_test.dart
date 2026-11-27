import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/local/storage/app_storage.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/provider/card_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/provider/fingerprint_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/provider/palm_vein_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/provider/qr_code_domain.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/provider/ekey_domain.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/domain/provider/group_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/router/app_router.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/domain/app_config.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';

import 'helpers/mock_tt_lock_api.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

class _CredAppConfigService extends AppConfigService {
  @override
  AppConfig build() => const AppConfig(clientId: 'cid', clientSecret: 'sec');
}

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
      TaskEither.right(
        LockEntity(lockId: lockId, lockAlias: 'L$lockId', lockData: 'ld'),
      );
}

class _FakeEkeyDomain extends EkeyDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, PageState<KeyEntity>> listKeys(
    int lockId, {
    int pageNo = 1,
  }) => TaskEither.right(const PageState<KeyEntity>());
}

class _FakePasscodeDomain extends PasscodeDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, List<KeyboardPwdEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => TaskEither.right(const []);
}

class _FakeCardDomain extends CardDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, List<IdentityCardEntity>> list(int lockId) =>
      TaskEither.right(const []);
}

class _FakeFingerprintDomain extends FingerprintDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, List<FingerprintEntity>> list(int lockId) =>
      TaskEither.right(const []);
}

class _FakeFaceDomain extends FaceDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, List<FaceEntity>> list(int lockId) =>
      TaskEither.right(const []);
}

class _FakePalmVeinDomain extends PalmVeinDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, List<PalmVeinEntity>> list(int lockId) =>
      TaskEither.right(const []);
}

class _FakeQrCodeDomain extends QrCodeDomain {
  @override
  void build() {}
  @override
  TaskEither<AppException, PageState<QrCodeEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    String? name,
  }) => TaskEither.right(const PageState<QrCodeEntity>());
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(registerTtLockFallbacks);

  setUp(() => SharedPreferences.setMockInitialValues({}));

  tearDown(resetTtLockTestHooks);

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
        ekeyDomainProvider.overrideWith(_FakeEkeyDomain.new),
        passcodeDomainProvider.overrideWith(_FakePasscodeDomain.new),
        cardDomainProvider.overrideWith(_FakeCardDomain.new),
        fingerprintDomainProvider.overrideWith(_FakeFingerprintDomain.new),
        faceDomainProvider.overrideWith(_FakeFaceDomain.new),
        palmVeinDomainProvider.overrideWith(_FakePalmVeinDomain.new),
        qrCodeDomainProvider.overrideWith(_FakeQrCodeDomain.new),
      ],
    );
    addTearDown(container.dispose);
    await container
        .read(userProvider.notifier)
        .setSession(const UserSession(accessToken: 't', refreshToken: 'r'));
    return container;
  }

  Future<void> pumpRouter(
    WidgetTester tester,
    ProviderContainer container,
  ) async {
    final router = container.read(appRouterProvider);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
  }

  testWidgets('锁详情 ekey 入口进入真实列表', (tester) async {
    final container = await loggedInContainer();
    final router = container.read(appRouterProvider);
    await pumpRouter(tester, container);

    router.go('/lock/1');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('entry_ekey')));
    await tester.pumpAndSettle();

    expect(find.text('p3-placeholder'), findsNothing);
    expect(find.byKey(const Key('ekey_list')), findsOneWidget);
  });

  testWidgets('锁详情 P3 入口进入真实列表（表驱动）', (tester) async {
    final container = await loggedInContainer();
    final router = container.read(appRouterProvider);
    await pumpRouter(tester, container);

    const cases = <(String entryKey, String listKey)>[
      ('entry_ekey', 'ekey_list'),
      ('entry_passcode', 'passcode_list'),
      ('entry_card', 'card_list'),
      ('entry_fingerprint', 'fingerprint_list'),
      ('entry_face', 'face_list'),
      ('entry_palm_vein', 'palm_vein_list'),
      ('entry_qr', 'qr_code_list'),
    ];

    for (final (entryKey, listKey) in cases) {
      router.go('/lock/1');
      await tester.pumpAndSettle();
      final entry = find.byKey(Key(entryKey));
      await tester.ensureVisible(entry);
      await tester.pumpAndSettle();
      await tester.tap(entry);
      await tester.pumpAndSettle();
      expect(find.text('p3-placeholder'), findsNothing, reason: entryKey);
      expect(find.byKey(Key(listKey)), findsOneWidget, reason: listKey);
    }
  });
}
