import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_record.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_records_notifier.dart';

class MockLockDomain extends Mock implements LockDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class FakeLockDomain extends LockDomain {
  FakeLockDomain(this._mock);
  final MockLockDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, PageState<LockRecordEntity>> listRecords(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    int? recordType,
  }) => _mock.listRecords(
    lockId,
    pageNo: pageNo,
    pageSize: pageSize,
    recordType: recordType,
  );
  @override
  TaskEither<AppException, Unit> deleteRecords(
    int lockId,
    List<int> recordIdList,
  ) => _mock.deleteRecords(lockId, recordIdList);
  @override
  TaskEither<AppException, Unit> clearRecords(int lockId) =>
      _mock.clearRecords(lockId);
  @override
  TaskEither<AppException, String> fetchOfflineRecords(
    String lockData, {
    TTOperateRecordType type = TTOperateRecordType.total,
  }) => _mock.fetchOfflineRecords(lockData, type: type);
  @override
  TaskEither<AppException, Unit> uploadRecords(int lockId, String records) =>
      _mock.uploadRecords(lockId, records);
}

ProviderContainer _container(MockLockDomain domain) {
  final container = ProviderContainer(
    overrides: [lockDomainProvider.overrideWith(() => FakeLockDomain(domain))],
  );
  // autoDispose Notifier 必须 listen 固定存活，否则 read 到重建实例。
  container.listen(lockRecordsProvider(1), (_, _) {});
  return container;
}

void main() {
  test('build 加载第 1 页，loadMore 追加', () async {
    final domain = MockLockDomain();
    when(
      () => domain.listRecords(1, pageNo: 1, pageSize: 20, recordType: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockRecordEntity>(
          data: [LockRecordEntity(recordId: 1, lockId: 1)],
          currentPage: 1,
          total: 2,
        ),
      ),
    );
    when(
      () => domain.listRecords(1, pageNo: 2, pageSize: 20, recordType: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockRecordEntity>(
          data: [LockRecordEntity(recordId: 2, lockId: 1)],
          currentPage: 2,
          total: 2,
        ),
      ),
    );
    final container = _container(domain);
    addTearDown(container.dispose);
    final n = container.read(lockRecordsProvider(1).notifier);
    await container.read(lockRecordsProvider(1).future);
    await n.loadMore();
    expect(n.state.value!.pageState.data.length, 2);
    expect(n.state.value!.pageState.hasMore, isFalse);
  });

  test('setFilter 更新后重载', () async {
    final domain = MockLockDomain();
    when(
      () => domain.listRecords(1, pageNo: 1, pageSize: 20, recordType: null),
    ).thenAnswer(
      (_) => TaskEither.right(const PageState<LockRecordEntity>(total: 0)),
    );
    when(
      () => domain.listRecords(1, pageNo: 1, pageSize: 20, recordType: 4),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockRecordEntity>(
          data: [LockRecordEntity(recordId: 3, recordType: 4)],
          total: 1,
        ),
      ),
    );
    final container = _container(domain);
    addTearDown(container.dispose);
    final n = container.read(lockRecordsProvider(1).notifier);
    await container.read(lockRecordsProvider(1).future);
    await n.setFilter(4);
    expect(n.state.value!.recordTypeFilter, 4);
    expect(n.state.value!.pageState.data.single.recordType, 4);
  });

  test('delete 单条后从列表移除', () async {
    final domain = MockLockDomain();
    when(
      () => domain.listRecords(1, pageNo: 1, pageSize: 20, recordType: null),
    ).thenAnswer(
      (_) => TaskEither.right(
        const PageState<LockRecordEntity>(
          data: [LockRecordEntity(recordId: 1), LockRecordEntity(recordId: 2)],
          total: 2,
        ),
      ),
    );
    when(
      () => domain.deleteRecords(1, [2]),
    ).thenAnswer((_) => TaskEither.right(unit));
    final container = _container(domain);
    addTearDown(container.dispose);
    final n = container.read(lockRecordsProvider(1).notifier);
    await container.read(lockRecordsProvider(1).future);
    await n.deleteRecord(2);
    expect(n.state.value!.pageState.data.map((e) => e.recordId), [1]);
  });
}
