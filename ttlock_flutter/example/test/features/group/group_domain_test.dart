import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/group/data/repository/group_repository.dart';
import 'package:ttlock_flutter_demo/features/group/domain/provider/group_domain.dart';

class MockGroupRepo extends Mock implements GroupRepository {}

/// class 型 Provider 的 override 必须用可构造子类（详见文末「测试 Fake 约定」）。
class FakeGroupRepository extends GroupRepository {
  FakeGroupRepository(this._mock);
  final MockGroupRepo _mock;
  @override
  void build() {}
  @override
  TaskEither<AppException, Unit> setDeviceGroup(int lockId, int groupId) =>
      _mock.setDeviceGroup(lockId, groupId);
  @override
  TaskEither<AppException, int> add(String name) => _mock.add(name);
}

void main() {
  test(
    'setDeviceGroupForLock 映射到 repo.setDeviceGroup(lockId, groupId)',
    () async {
      final repo = MockGroupRepo();
      when(
        () => repo.setDeviceGroup(1, 5),
      ).thenAnswer((_) => TaskEither.right(unit));
      when(
        () => repo.setDeviceGroup(1, 0),
      ).thenAnswer((_) => TaskEither.right(unit));
      final container = ProviderContainer(
        overrides: [
          groupRepositoryProvider.overrideWith(() => FakeGroupRepository(repo)),
        ],
      );
      addTearDown(container.dispose);
      final domain = container.read(groupDomainProvider.notifier);
      expect(
        (await domain.setDeviceGroupForLock(1, 5).run()).isRight(),
        isTrue,
      );
      expect(
        (await domain.setDeviceGroupForLock(1, null).run()).isRight(),
        isTrue,
      );
      verify(() => repo.setDeviceGroup(1, 5)).called(1);
      verify(() => repo.setDeviceGroup(1, 0)).called(1);
    },
  );

  test('add 返回 groupId', () async {
    final repo = MockGroupRepo();
    when(() => repo.add('新分组')).thenAnswer((_) => TaskEither.right(42));
    final container = ProviderContainer(
      overrides: [
        groupRepositoryProvider.overrideWith(() => FakeGroupRepository(repo)),
      ],
    );
    addTearDown(container.dispose);
    expect(
      (await container.read(groupDomainProvider.notifier).add('新分组').run())
          .getRight()
          .toNullable(),
      42,
    );
  });
}
