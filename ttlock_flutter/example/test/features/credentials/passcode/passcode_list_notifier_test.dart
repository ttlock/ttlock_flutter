import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_list_notifier.dart';

class _MockPasscodeDomain extends Mock implements PasscodeDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见「测试 Fake 约定」）。
class _FakePasscodeDomain extends PasscodeDomain {
  _FakePasscodeDomain(this._mock);
  final _MockPasscodeDomain _mock;

  @override
  void build() {}

  @override
  TaskEither<AppException, List<KeyboardPwdEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _mock.list(lockId, pageNo: pageNo, pageSize: pageSize);
}

ProviderContainer _container(_MockPasscodeDomain domain) {
  final container = ProviderContainer(
    overrides: [
      passcodeDomainProvider.overrideWith(() => _FakePasscodeDomain(domain)),
    ],
  );
  container.listen(passcodeListProvider(1), (_, _) {});
  return container;
}

void main() {
  test('build 加载第 1 页，loadMore 追加', () async {
    final domain = _MockPasscodeDomain();
    when(() => domain.list(1, pageNo: 1, pageSize: 20)).thenAnswer(
      (_) => TaskEither.right(
        List.generate(20, (i) => KeyboardPwdEntity(keyboardPwdId: i + 1)),
      ),
    );
    when(() => domain.list(1, pageNo: 2, pageSize: 20)).thenAnswer(
      (_) => TaskEither.right(const [KeyboardPwdEntity(keyboardPwdId: 21)]),
    );
    final container = _container(domain);
    addTearDown(container.dispose);
    final n = container.read(passcodeListProvider(1).notifier);
    await container.read(passcodeListProvider(1).future);
    await n.loadMore();
    expect(n.state.value!.items.length, 21);
    expect(n.state.value!.hasMore, isFalse);
  });

  test('refresh 重载第 1 页', () async {
    final domain = _MockPasscodeDomain();
    when(() => domain.list(1, pageNo: 1, pageSize: 20)).thenAnswer(
      (_) => TaskEither.right(const [KeyboardPwdEntity(keyboardPwdId: 1)]),
    );
    final container = _container(domain);
    addTearDown(container.dispose);
    final n = container.read(passcodeListProvider(1).notifier);
    await container.read(passcodeListProvider(1).future);
    when(() => domain.list(1, pageNo: 1, pageSize: 20)).thenAnswer(
      (_) => TaskEither.right(const [KeyboardPwdEntity(keyboardPwdId: 9)]),
    );
    await n.refresh();
    expect(n.state.value!.items.single.keyboardPwdId, 9);
  });
}
