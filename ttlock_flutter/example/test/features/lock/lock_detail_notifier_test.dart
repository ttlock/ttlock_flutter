import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_detail_notifier.dart';
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
  TaskEither<AppException, LockEntity> getLockDetail(int lockId) =>
      _mock.getLockDetail(lockId);
  @override
  TaskEither<AppException, LockEntity> unlockLock(LockEntity lock) =>
      _mock.unlockLock(lock);
  @override
  TaskEither<AppException, LockEntity> lockLock(LockEntity lock) =>
      _mock.lockLock(lock);
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

  ProviderContainer containerWith({
    required _MockLockDomain domain,
    MockTTLockApi? ttlock,
  }) {
    if (ttlock != null) installMockLockApi(ttlock);
    final container = ProviderContainer(
      overrides: [
        lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('build：云端 detail + 路由 \$extra lockData 注入', () async {
    final domain = _MockLockDomain();
    // 云端 detail **不返回** lockData（cloud lock/detail.md）——mock 忠实模拟。
    when(() => domain.getLockDetail(7)).thenAnswer(
      (_) => TaskEither.right(
        const LockEntity(lockId: 7, lockAlias: 'D', electricQuantity: 60),
      ),
    );
    final container = containerWith(domain: domain, ttlock: mockTtlock());
    // $extra 携带 lockData（来自 list 响应 / 上一页 Entity）
    const extra = LockEntity(lockId: 7, lockData: 'ld');
    container.listen(lockDetailProvider(7, extra), (_, _) {});
    await container.read(lockDetailProvider(7, extra).future);
    final lock = container.read(lockDetailProvider(7, extra)).value!.lock!;
    expect(lock.lockAlias, 'D'); // 云端字段刷新
    expect(lock.lockData, 'ld'); // 路由注入保留
    expect(lock.electricQuantity, 60);
  });

  test('build：无 \$extra（深链）→ lockData 空', () async {
    final domain = _MockLockDomain();
    when(() => domain.getLockDetail(7)).thenAnswer(
      (_) => TaskEither.right(const LockEntity(lockId: 7, lockAlias: 'D')),
    );
    final container = containerWith(domain: domain, ttlock: mockTtlock());
    container.listen(lockDetailProvider(7, null), (_, _) {});
    await container.read(lockDetailProvider(7, null).future);
    expect(
      container.read(lockDetailProvider(7, null)).value!.lock!.lockData,
      isEmpty,
    );
  });

  test('unlock 调 domain 并写回更新后 lock', () async {
    final domain = _MockLockDomain();
    when(
      () => domain.getLockDetail(7),
    ).thenAnswer((_) => TaskEither.right(const LockEntity(lockId: 7)));
    when(() => domain.unlockLock(any())).thenAnswer(
      (_) => TaskEither.right(
        const LockEntity(lockId: 7, lockData: 'ld2', electricQuantity: 70),
      ),
    );
    final container = containerWith(domain: domain, ttlock: mockTtlock());
    const extra = LockEntity(lockId: 7, lockData: 'ld');
    container.listen(lockDetailProvider(7, extra), (_, _) {});
    final n = container.read(lockDetailProvider(7, extra).notifier);
    await container.read(lockDetailProvider(7, extra).future);
    await n.unlock();
    verify(() => domain.unlockLock(any())).called(1);
    expect(n.state.value!.operating, isFalse);
    expect(n.state.value!.error, isNull);
    expect(n.state.value!.lock!.lockData, 'ld2');
    expect(n.state.value!.lock!.electricQuantity, 70);
  });

  test('applyLock 写回设置页 Entity，不覆盖 BLE lockData', () async {
    final domain = _MockLockDomain();
    when(
      () => domain.getLockDetail(7),
    ).thenAnswer((_) => TaskEither.right(const LockEntity(lockId: 7)));
    when(() => domain.unlockLock(any())).thenAnswer(
      (_) => TaskEither.right(
        const LockEntity(lockId: 7, lockData: 'ld2', electricQuantity: 70),
      ),
    );
    final container = containerWith(domain: domain, ttlock: mockTtlock());
    const extra = LockEntity(lockId: 7, lockData: 'ld');
    container.listen(lockDetailProvider(7, extra), (_, _) {});
    final n = container.read(lockDetailProvider(7, extra).notifier);
    await container.read(lockDetailProvider(7, extra).future);
    await n.unlock();
    n.applyLock(
      const LockEntity(
        lockId: 7,
        lockData: 'ld3',
        electricQuantity: 80,
        lockAlias: 'B',
      ),
    );
    expect(n.state.value!.lock!.lockData, 'ld3');
    expect(n.state.value!.lock!.electricQuantity, 80);
    expect(n.state.value!.lock!.lockAlias, 'B');
  });

  test('unlock：hasGateway + 空 lockData 不拦截，调 domain', () async {
    final domain = _MockLockDomain();
    when(() => domain.getLockDetail(7)).thenAnswer(
      (_) => TaskEither.right(
        const LockEntity(lockId: 7, lockAlias: 'D', hasGateway: true),
      ),
    );
    when(() => domain.unlockLock(any())).thenAnswer(
      (_) => TaskEither.right(
        const LockEntity(lockId: 7, hasGateway: true, lockData: ''),
      ),
    );
    final container = containerWith(domain: domain, ttlock: mockTtlock());
    const extra = LockEntity(lockId: 7, lockData: '', hasGateway: true);
    container.listen(lockDetailProvider(7, extra), (_, _) {});
    final n = container.read(lockDetailProvider(7, extra).notifier);
    await container.read(lockDetailProvider(7, extra).future);
    await n.unlock();
    verify(() => domain.unlockLock(any())).called(1);
    expect(n.state.value!.operating, isFalse);
  });

  test('unlock：无 lockData 且无网关 → 不调 domain', () async {
    final domain = _MockLockDomain();
    when(() => domain.getLockDetail(7)).thenAnswer(
      (_) => TaskEither.right(const LockEntity(lockId: 7, lockAlias: 'D')),
    );
    final container = containerWith(domain: domain, ttlock: mockTtlock());
    const extra = LockEntity(lockId: 7, lockData: '');
    container.listen(lockDetailProvider(7, extra), (_, _) {});
    final n = container.read(lockDetailProvider(7, extra).notifier);
    await container.read(lockDetailProvider(7, extra).future);
    await n.unlock();
    verifyNever(() => domain.unlockLock(any()));
  });


  test('supports 抛错时对应入口视为 false，不得当成展示', () async {
    final domain = _MockLockDomain();
    final ttlock = MockTTLockApi();
    installMockLockApi(ttlock);
    when(() => domain.getLockDetail(7)).thenAnswer(
      (_) => TaskEither.right(const LockEntity(lockId: 7, lockAlias: 'D')),
    );
    when(
      () =>
          ttlock.supportFunction(any(), any(), timeout: any(named: 'timeout')),
    ).thenThrow(Exception('probe'));
    final container = containerWith(domain: domain, ttlock: ttlock);
    const extra = LockEntity(lockId: 7, lockData: 'ld');
    container.listen(lockDetailProvider(7, extra), (_, _) {});
    await container.read(lockDetailProvider(7, extra).future);
    final state = container.read(lockDetailProvider(7, extra)).value!;
    expect(state.showPasscode, isFalse);
    expect(state.showQrCode, isFalse);
    expect(state.showCard, isFalse);
    expect(state.showFingerprint, isFalse);
    expect(state.showFace, isFalse);
    expect(state.showPalmVein, isFalse);
  });
  // 重命名入口在设置页（T8），详情 Notifier 不提供 rename
}
