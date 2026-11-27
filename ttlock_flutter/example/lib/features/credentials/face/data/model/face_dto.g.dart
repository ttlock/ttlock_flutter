// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaceDto _$FaceDtoFromJson(Map<String, dynamic> json) => _FaceDto(
  faceId: json['faceId'] == null ? 0 : intFromDynamic(json['faceId']),
  lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
  name: _readFaceName(json, 'name') == null
      ? ''
      : stringFromDynamic(_readFaceName(json, 'name')),
  faceNumber: json['faceNumber'] == null
      ? ''
      : stringFromDynamic(json['faceNumber']),
  status: json['status'] == null
      ? EntityStatus.normal
      : _statusFromJson(json['status']),
  nickname: _readNickname(json, 'nickname') == null
      ? ''
      : stringFromDynamic(_readNickname(json, 'nickname')),
  userid: json['userid'] == null ? '' : stringFromDynamic(json['userid']),
  type: _readFaceType(json, 'type') == null
      ? CredentialType.normal
      : _typeFromJson(_readFaceType(json, 'type')),
  startDate: nullableDateTimeMsFromJson(json['startDate']),
  endDate: nullableDateTimeMsFromJson(json['endDate']),
  cyclicConfig: json['cyclicConfig'] == null
      ? const []
      : _cyclicConfigFromJson(json['cyclicConfig']),
  createDate: nullableDateTimeMsFromJson(json['createDate']),
);

Map<String, dynamic> _$FaceDtoToJson(_FaceDto instance) => <String, dynamic>{
  'faceId': instance.faceId,
  'lockId': instance.lockId,
  'name': instance.name,
  'faceNumber': instance.faceNumber,
  'status': _$EntityStatusEnumMap[instance.status]!,
  'nickname': instance.nickname,
  'userid': instance.userid,
  'type': _$CredentialTypeEnumMap[instance.type]!,
  'startDate': nullableDateTimeMsToJson(instance.startDate),
  'endDate': nullableDateTimeMsToJson(instance.endDate),
  'cyclicConfig': instance.cyclicConfig,
  'createDate': nullableDateTimeMsToJson(instance.createDate),
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
