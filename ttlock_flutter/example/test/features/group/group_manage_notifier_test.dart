import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/domain/provider/group_domain.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/provider/group_manage_notifier.dart';

class MockGroupDomain extends Mock implements GroupDomain {}

/// class 型 Notifier 的 override 必须用可构造子类（详见文末「测试 Fake 约定」）。
///
/// 注意：`extends` 会继承真实实现，**只覆写被测代码调用到的那些方法是不够的**——
/// 漏覆写的方法不会报错，而是悄悄落到真实实现上（`GroupDomain._repo` 那个
/// `late final` 因 `build()` 为空实现而从未赋值，直接 `LateInitializationError`）。
/// 因此 `GroupManageNotifier.build` 调用的 `list` 与 `listWithLockNum` 必须都在此转发。
class FakeGroupDomain extends GroupDomain {
  FakeGroupDomain(this._mock);
  final MockGroupDomain _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, List<GroupEntity>> list() => _mock.list();
  @override
  TaskEither<AppException, List<GroupEntity>> listWithLockNum() =>
      _mock.listWithLockNum();
  @override
  TaskEither<AppException, int> add(String name) => _mock.add(name);
  @override
  TaskEither<AppException, Unit> rename(int groupId, String name) =>
      _mock.rename(groupId, name);
  @override
  TaskEither<AppException, Unit> delete(int groupId) => _mock.delete(groupId);
}

void main() {
  test('build 加载分组，add/delete 后刷新', () async {
    final domain = MockGroupDomain();
    // build() 合并两次查询：list() 给基础分组，listWithLockNum() 给带锁数量的同批分组，
    // 后者按 groupId 覆盖前者并累加 lockNum（group_manage_notifier.dart:17-30）。
    when(() => domain.list()).thenAnswer(
      (_) => TaskEither.right(const [GroupEntity(groupId: 1, name: 'g1')]),
    );
    when(() => domain.listWithLockNum()).thenAnswer(
      (_) => TaskEither.right(const [
        GroupEntity(groupId: 1, name: 'g1', lockNum: 2),
      ]),
    );
    when(() => domain.add('g2')).thenAnswer((_) => TaskEither.right(2));
    when(() => domain.delete(1)).thenAnswer((_) => TaskEither.right(unit));
    final container = ProviderContainer(
      overrides: [
        groupDomainProvider.overrideWith(() => FakeGroupDomain(domain)),
      ],
    );
    addTearDown(container.dispose);
    container.listen(groupManageProvider, (_, _) {});
    await container.read(groupManageProvider.future);
    expect(container.read(groupManageProvider).value!.groups.length, 1);

    await container.read(groupManageProvider.notifier).add('g2');
    verify(() => domain.add('g2')).called(1);
    expect(container.read(groupManageProvider).value!.groups.length, 1);

    await container.read(groupManageProvider.notifier).delete(1);
    verify(() => domain.delete(1)).called(1);
  });
}
