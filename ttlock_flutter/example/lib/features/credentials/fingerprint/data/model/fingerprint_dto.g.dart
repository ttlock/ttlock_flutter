// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fingerprint_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FingerprintDto _$FingerprintDtoFromJson(Map<String, dynamic> json) =>
    _FingerprintDto(
      fingerprintId: json['fingerprintId'] == null
          ? 0
          : intFromDynamic(json['fingerprintId']),
      lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
      fingerprintNumber: json['fingerprintNumber'] == null
          ? ''
          : stringFromDynamic(json['fingerprintNumber']),
      fingerprintType: json['fingerprintType'] == null
          ? 1
          : intFromDynamic(json['fingerprintType']),
      fingerprintName: json['fingerprintName'] as String? ?? '',
      startDate: nullableDateTimeMsFromJson(json['startDate']),
      endDate: nullableDateTimeMsFromJson(json['endDate']),
      cyclicConfig: json['cyclicConfig'] == null
          ? const []
          : cyclicConfigListFromJson(json['cyclicConfig']),
      createDate: nullableDateTimeMsFromJson(json['createDate']),
      senderUsername: json['senderUsername'] as String? ?? '',
    );

Map<String, dynamic> _$FingerprintDtoToJson(_FingerprintDto instance) =>
    <String, dynamic>{
      'fingerprintId': instance.fingerprintId,
      'lockId': instance.lockId,
      'fingerprintNumber': instance.fingerprintNumber,
      'fingerprintType': instance.fingerprintType,
      'fingerprintName': instance.fingerprintName,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'cyclicConfig': instance.cyclicConfig,
      'createDate': instance.createDate?.toIso8601String(),
      'senderUsername': instance.senderUsername,
    };
