// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteDto _$RemoteDtoFromJson(Map<String, dynamic> json) => _RemoteDto(
  remoteId: json['remoteId'] == null ? 0 : intFromDynamic(json['remoteId']),
  name: json['name'] as String? ?? '',
  mac: json['mac'] as String? ?? '',
  electricQuantity: json['electricQuantity'] == null
      ? 0
      : intFromDynamic(json['electricQuantity']),
  status: json['status'] == null
      ? EntityStatus.normal
      : entityStatusFromJson(json['status']),
  nickname: json['nickname'] as String? ?? '',
  userId: _readUserId(json, 'userId') as String? ?? '',
  startDate: nullableDateTimeMsFromJson(json['startDate']),
  endDate: nullableDateTimeMsFromJson(json['endDate']),
  type: json['type'] == null
      ? CredentialType.normal
      : credentialTypeFromJson(json['type']),
  cyclicConfig: json['cyclicConfig'] == null
      ? const []
      : cyclicConfigListFromJson(json['cyclicConfig']),
  createDate: nullableDateTimeMsFromJson(json['createDate']),
);

Map<String, dynamic> _$RemoteDtoToJson(_RemoteDto instance) =>
    <String, dynamic>{
      'remoteId': instance.remoteId,
      'name': instance.name,
      'mac': instance.mac,
      'electricQuantity': instance.electricQuantity,
      'status': _$EntityStatusEnumMap[instance.status]!,
      'nickname': instance.nickname,
      'userId': instance.userId,
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
