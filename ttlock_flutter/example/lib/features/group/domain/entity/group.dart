import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';

@freezed
abstract class GroupEntity with _$GroupEntity {
  const GroupEntity._();
  const factory GroupEntity({
    @Default(0) int groupId,
    @Default('') String name,
    @Default(0) int lockNum,
  }) = _GroupEntity;
}
