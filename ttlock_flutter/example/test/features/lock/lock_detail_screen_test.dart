import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_detail_screen.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import '../../helpers/mock_tt_lock_api.dart';

class _MockLockDomain extends Mock implements LockDomain {}



class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, LockEntity> getLockDetail(int lockId) =>
      _mock.getLockDetail(lockId);
  @override
  TaskEither<AppException, LockEntity> unlockLock(LockEntity lock) =>
      _mock.unlockLock(lock);
}

void main() {
  setUpAll(() {
    registerTtLockFallbacks();
    registerFallbackValue(const LockEntity(lockId: 0));
  });

  tearDown(resetTtLockTestHooks);

  MockTTLockApi mockTtlock({bool Function(TTLockFunction)? supports}) {
    final ttlock = MockTTLockApi();
    stubLockApiDefaults(ttlock, supports: supports);
    installMockLockApi(ttlock);
    return ttlock;
  }

  Future<void> pumpDetail(
    WidgetTester tester, {
    required LockEntity lock,
    required _MockLockDomain domain,
    MockTTLockApi? ttlock,
  }) async {
    when(
      () => domain.getLockDetail(lock.lockId),
    ).thenAnswer((_) => TaskEither.right(lock));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
          ],
        child: MaterialApp(
          home: LockDetailScreen(
            lockId: lock.lockId,
            lock: lock,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('hasGateway + 空 lockData：解锁可点', (tester) async {
    final domain = _MockLockDomain();
    const lock = LockEntity(
      lockId: 1,
      lockAlias: 'A',
      lockData: '',
      hasGateway: true,
    );
    when(
      () => domain.unlockLock(any()),
    ).thenAnswer((_) => TaskEither.right(lock));
    await pumpDetail(tester, lock: lock, domain: domain, ttlock: mockTtlock());
    expect(find.byKey(const Key('incomplete_lock_data')), findsOneWidget);
    expect(find.byKey(const Key('detail_refresh')), findsNothing);
    final unlock = tester.widget<FilledButton>(
      find.byKey(const Key('detail_unlock')),
    );
    expect(unlock.onPressed, isNotNull);
    await tester.tap(find.byKey(const Key('detail_unlock')));
    await tester.pumpAndSettle();
    verify(() => domain.unlockLock(any())).called(1);
  });

  testWidgets('lockData 非空：展示 ekey/密码/卡等入口', (tester) async {
    final domain = _MockLockDomain();
    const lock = LockEntity(lockId: 1, lockData: 'ld');
    await pumpDetail(tester, lock: lock, domain: domain, ttlock: mockTtlock());
    expect(find.byKey(const Key('entry_ekey')), findsOneWidget);
    expect(find.byKey(const Key('entry_passcode')), findsOneWidget);
    expect(find.byKey(const Key('entry_card')), findsOneWidget);
    expect(find.byKey(const Key('entry_lift')), findsNothing);
  });

  testWidgets('lockData 空且无网关：卡/指纹/人脸/掌静脉/密码/二维码按能力位隐藏；仍显示 ekey', (
    tester,
  ) async {
    final domain = _MockLockDomain();
    const lock = LockEntity(lockId: 1, lockData: '', hasGateway: false);
    await pumpDetail(tester, lock: lock, domain: domain, ttlock: mockTtlock());
    expect(find.byKey(const Key('entry_ekey')), findsOneWidget);
    expect(find.byKey(const Key('entry_passcode')), findsNothing);
    expect(find.byKey(const Key('entry_card')), findsNothing);
    expect(find.byKey(const Key('entry_fingerprint')), findsNothing);
    expect(find.byKey(const Key('entry_face')), findsNothing);
    expect(find.byKey(const Key('entry_palm_vein')), findsNothing);
    expect(find.byKey(const Key('entry_qr')), findsNothing);
  });

  testWidgets('仅照片人脸 bit：仍显示人脸入口', (tester) async {
    final domain = _MockLockDomain();
    const lock = LockEntity(lockId: 1, lockData: 'ld');
    await pumpDetail(
      tester,
      lock: lock,
      domain: domain,
      ttlock: mockTtlock(supports: (f) => f == TTLockFunction.zhiAnPhotoFace),
    );
    expect(find.byKey(const Key('entry_face')), findsOneWidget);
  });
}
