// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupDto _$GroupDtoFromJson(Map<String, dynamic> json) => _GroupDto(
  groupId: json['groupId'] == null ? 0 : intFromDynamic(json['groupId']),
  name: _readName(json, 'name') as String? ?? '',
  lockNum: json['lockNum'] == null ? 0 : intFromDynamic(json['lockNum']),
);

Map<String, dynamic> _$GroupDtoToJson(_GroupDto instance) => <String, dynamic>{
  'groupId': instance.groupId,
  'name': instance.name,
  'lockNum': instance.lockNum,
};
