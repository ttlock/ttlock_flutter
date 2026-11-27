import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/home/presentation/screen/home_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/screen/lock_detail_screen.dart';

import 'helpers/mock_tt_lock_api.dart';

class _MockLockDomain extends Mock implements LockDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeLockDomain extends LockDomain {
  _FakeLockDomain(this._mock);
  final _MockLockDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, PageState<LockEntity>> listLocks({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
  }) => _mock.listLocks(pageNo: pageNo, pageSize: pageSize, groupId: groupId);
  @override
  TaskEither<AppException, LockEntity> getLockDetail(int lockId) =>
      _mock.getLockDetail(lockId);
}

void main() {
  setUpAll(() {
    registerFallbackValue(const LockEntity(lockId: 0));
    registerTtLockFallbacks();
  });

  tearDown(resetTtLockTestHooks);

  testWidgets('home 渲染锁卡片 Key', (tester) async {
    final domain = _MockLockDomain();
    when(
      () => domain.listLocks(pageNo: 1, pageSize: 20, groupId: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockEntity>(
          data: [LockEntity(lockId: 1, lockAlias: 'A', lockData: 'ld')],
          total: 1,
        ),
      ),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('lock_card_1')), findsOneWidget);
  });

  testWidgets('详情页存在解锁按钮', (tester) async {
    final domain = _MockLockDomain();
    const lock = LockEntity(lockId: 1, lockAlias: 'A', lockData: 'ld');
    when(
      () => domain.getLockDetail(1),
    ).thenAnswer((_) => TaskEither.right(lock));
    final ttlock = MockTTLockApi();
    stubLockApiDefaults(ttlock);
    installMockLockApi(ttlock);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
        ],
        child: const MaterialApp(home: LockDetailScreen(lockId: 1, lock: lock)),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('detail_unlock')), findsOneWidget);
  });
}
