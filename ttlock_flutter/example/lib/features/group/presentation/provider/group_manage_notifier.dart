import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';
import 'package:ttlock_flutter_demo/features/group/domain/provider/group_domain.dart';
import 'package:ttlock_flutter_demo/features/group/presentation/provider/group_manage_state.dart';

part 'group_manage_notifier.g.dart';

@Riverpod()
class GroupManageNotifier extends _$GroupManageNotifier {
  GroupDomain get _domain => ref.read(groupDomainProvider.notifier);

  @override
  Future<GroupManageState> build() async {
    final r = await _domain.list().flatMap(
      (groups) => _domain.listWithLockNum().flatMap(
        (lockNumGroups) {
          Map<int, GroupEntity> map = {};
          for (var group in groups) {
            map[group.groupId] = group;
          }
          for (var lockNumGroup in lockNumGroups) {
            map[lockNumGroup.groupId] = lockNumGroup.copyWith(lockNum: lockNumGroup.lockNum + (map[lockNumGroup.groupId]?.lockNum ?? 0));
          }
          return TaskEither.right(map.toSortedList(Order.orderInt).map((e) => e.value).toList());
        }
      ),
    ).run();
    return r.fold(
      (err) => throw err,
      (groups) => GroupManageState(groups: groups),
    );
  }

  // 变更操作与成功后的 refresh() 共用同一 loading 窗口。
  Future<void> _runWithRefresh(Future<void> Function() action) =>
      withGlobalLoading(() async {
        await action();
        ref.invalidateSelf();
      }, status: ref.read(l10nProvider).loading);

  Future<void> add(String name) =>
      _runWithRefresh(() => _domain.add(name).run());

  Future<void> rename(int groupId, String name) =>
      _runWithRefresh(() => _domain.rename(groupId, name).run());

  Future<void> delete(int groupId) =>
      _runWithRefresh(() => _domain.delete(groupId).run());
}
