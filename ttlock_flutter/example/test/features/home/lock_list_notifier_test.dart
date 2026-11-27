import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/home/presentation/provider/lock_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';

class _MockLockDomain extends Mock implements LockDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（Riverpod 2 运行期注入限制）。
/// Fake 子类按文末「测试 Fake 约定」；mocktail Mock 直接 overrideWith 会运行期崩。
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
}

void main() {
  test('build 加载第 1 页', () async {
    final domain = _MockLockDomain();
    when(
      () => domain.listLocks(pageNo: 1, pageSize: 20, groupId: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockEntity>(data: [LockEntity(lockId: 1)], total: 1),
      ),
    );
    final container = ProviderContainer(
      overrides: [
        lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(lockListProvider, (_, _) {}); // 固定 autoDispose 存活
    await container.read(lockListProvider.future);
    expect(
      container.read(lockListProvider).value!.pageState.data.single.lockId,
      1,
    );
  });

  test('loadMore 追加下一页', () async {
    // 注意：PageState.hasMore = data.length < total。此处合并后 data=2、total=2，
    // 断言 hasMore=false 才自洽；若写 total=3 则 hasMore 应为 true。
    final domain = _MockLockDomain();
    when(
      () => domain.listLocks(pageNo: 1, pageSize: 20, groupId: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockEntity>(
          data: [LockEntity(lockId: 1)],
          currentPage: 1,
          total: 2,
        ),
      ),
    );
    when(
      () => domain.listLocks(pageNo: 2, pageSize: 20, groupId: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockEntity>(
          data: [LockEntity(lockId: 2)],
          currentPage: 2,
          total: 2,
        ),
      ),
    );
    final container = ProviderContainer(
      overrides: [
        lockDomainProvider.overrideWith(() => _FakeLockDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(lockListProvider, (_, _) {}); // 固定 autoDispose 存活
    await container.read(lockListProvider.future);
    await container.read(lockListProvider.notifier).loadMore();
    expect(container.read(lockListProvider).value!.pageState.data.length, 2);
    expect(container.read(lockListProvider).value!.pageState.hasMore, isFalse);
  });
}
