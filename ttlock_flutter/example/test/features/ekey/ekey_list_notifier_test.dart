import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/provider/ekey_domain.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/provider/ekey_list_notifier.dart';

class _MockEkeyDomain extends Mock implements EkeyDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakeEkeyDomain extends EkeyDomain {
  _FakeEkeyDomain(this._mock);
  final _MockEkeyDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, PageState<KeyEntity>> listKeys(
    int lockId, {
    int pageNo = 1,
  }) => _mock.listKeys(lockId, pageNo: pageNo);
}

ProviderContainer _container(_MockEkeyDomain domain) {
  final container = ProviderContainer(
    overrides: [ekeyDomainProvider.overrideWith(() => _FakeEkeyDomain(domain))],
  );
  container.listen(ekeyListProvider(1), (_, _) {});
  return container;
}

void main() {
  test('build 加载第 1 页，loadMore 追加', () async {
    final domain = _MockEkeyDomain();
    when(() => domain.listKeys(1, pageNo: 1)).thenAnswer(
      (_) => TaskEither.right(
        const PageState<KeyEntity>(
          data: [KeyEntity(keyId: 1)],
          currentPage: 1,
          total: 2,
        ),
      ),
    );
    when(() => domain.listKeys(1, pageNo: 2)).thenAnswer(
      (_) => TaskEither.right(
        const PageState<KeyEntity>(
          data: [KeyEntity(keyId: 2)],
          currentPage: 2,
          total: 2,
        ),
      ),
    );
    final container = _container(domain);
    addTearDown(container.dispose);
    final n = container.read(ekeyListProvider(1).notifier);
    await container.read(ekeyListProvider(1).future);
    await n.loadMore();
    expect(n.state.value!.pageState.data.length, 2);
    expect(n.state.value!.pageState.hasMore, isFalse);
  });

  test('refresh 重载第 1 页', () async {
    final domain = _MockEkeyDomain();
    when(() => domain.listKeys(1, pageNo: 1)).thenAnswer(
      (_) => TaskEither.right(
        const PageState<KeyEntity>(
          data: [KeyEntity(keyId: 1)],
          currentPage: 1,
          total: 1,
        ),
      ),
    );
    final container = _container(domain);
    addTearDown(container.dispose);
    final n = container.read(ekeyListProvider(1).notifier);
    await container.read(ekeyListProvider(1).future);
    when(() => domain.listKeys(1, pageNo: 1)).thenAnswer(
      (_) => TaskEither.right(
        const PageState<KeyEntity>(
          data: [KeyEntity(keyId: 9)],
          currentPage: 1,
          total: 1,
        ),
      ),
    );
    await n.refresh();
    expect(n.state.value!.pageState.data.single.keyId, 9);
  });
}
