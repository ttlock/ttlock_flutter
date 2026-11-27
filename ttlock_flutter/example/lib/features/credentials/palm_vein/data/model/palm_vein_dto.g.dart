// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palm_vein_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PalmVeinDto _$PalmVeinDtoFromJson(Map<String, dynamic> json) => _PalmVeinDto(
  id: json['id'] == null ? 0 : intFromDynamic(json['id']),
  name: json['name'] as String? ?? '',
  number: json['number'] == null ? '' : stringFromDynamic(json['number']),
  status: json['status'] == null
      ? EntityStatus.normal
      : _entityStatusFromJson(json['status']),
  nickname: json['nickname'] as String? ?? '',
  startDate: nullableDateTimeMsFromJson(json['startDate']),
  endDate: nullableDateTimeMsFromJson(json['endDate']),
  type: json['type'] == null
      ? CredentialType.normal
      : _credentialTypeFromJson(json['type']),
  cyclicConfig: json['cyclicConfig'] == null
      ? const []
      : _cyclicConfigFromJson(json['cyclicConfig']),
  createDate: nullableDateTimeMsFromJson(json['createDate']),
);

Map<String, dynamic> _$PalmVeinDtoToJson(_PalmVeinDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'status': _$EntityStatusEnumMap[instance.status]!,
      'nickname': instance.nickname,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'type': _$CredentialTypeEnumMap[instance.type]!,
      'cyclicConfig': instance.cyclicConfig,
      'createDate': instance.createDate?.toIso8601String(),
    };

const _$EntityStatusEnumMap = {
  EntityStatus.normal: 'normal',
  EntityStatus.expired: 'expired',
  EntityStatus.pending: 'pending',
};

const _$CredentialTypeEnumMap = {
  CredentialType.normal: 'normal',
  CredentialType.cycle: 'cycle',
};
