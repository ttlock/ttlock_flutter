import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';

part 'group_manage_state.freezed.dart';

@freezed
abstract class GroupManageState with _$GroupManageState {
  const GroupManageState._();
  const factory GroupManageState({
    @Default([]) List<GroupEntity> groups,
    @Default(false) bool loading,
  }) = _GroupManageState;
}
