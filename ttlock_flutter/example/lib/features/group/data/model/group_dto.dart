// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/group/domain/entity/group.dart';

part 'group_dto.freezed.dart';
part 'group_dto.g.dart';

Object? _readName(Map map, String key) {
  return map['name'] ?? map['groupName'];
}

@freezed
abstract class GroupDto with _$GroupDto {
  const GroupDto._();
  const factory GroupDto({
    @JsonKey(name: 'groupId', fromJson: intFromDynamic) @Default(0) int groupId,
    @JsonKey(name: 'name', readValue: _readName) @Default('') String name,
    @JsonKey(name: 'lockNum', fromJson: intFromDynamic) @Default(0) int lockNum,
  }) = _GroupDto;

  factory GroupDto.fromJson(Map<String, dynamic> json) =>
      _$GroupDtoFromJson(json);

  GroupEntity toEntity() =>
      GroupEntity(groupId: groupId, name: name, lockNum: lockNum);
}
