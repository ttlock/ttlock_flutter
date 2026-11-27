import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/group/data/repository/group_repository.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/domain/repository/group_repository_interface.dart';

part 'group_domain.g.dart';

@Riverpod(keepAlive: true)
class GroupDomain extends _$GroupDomain {
  late final GroupRepositoryInterface _repo;

  @override
  void build() {
    _repo = ref.watch(groupRepositoryProvider.notifier);
  }

  TaskEither<AppException, List<GroupEntity>> list() => _repo.list();

  TaskEither<AppException, List<GroupEntity>> listWithLockNum() =>
      _repo.listWithLockNum();

  TaskEither<AppException, int> add(String name) => _repo.add(name);

  TaskEither<AppException, Unit> rename(int groupId, String name) =>
      _repo.rename(groupId, name);

  TaskEither<AppException, Unit> delete(int groupId) => _repo.delete(groupId);

  /// 锁指派分组；groupId 传 null 表示取消分组（云端 0）。
  /// P1 `GroupRepository.setDeviceGroup(lockId, groupId)` 已内置 deviceType=0。
  TaskEither<AppException, Unit> setDeviceGroupForLock(
    int lockId,
    int? groupId,
  ) => _repo.setDeviceGroup(lockId, groupId ?? 0);
}
