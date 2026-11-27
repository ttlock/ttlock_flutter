// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrCodeDto _$QrCodeDtoFromJson(Map<String, dynamic> json) => _QrCodeDto(
  qrCodeId: json['qrCodeId'] == null ? 0 : intFromDynamic(json['qrCodeId']),
  lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
  type: json['type'] == null ? 1 : intFromDynamic(json['type']),
  qrCodeNumber: json['qrCodeNumber'] == null
      ? ''
      : stringFromDynamic(json['qrCodeNumber']),
  name: json['name'] as String? ?? '',
  startDate: nullableDateTimeMsFromJson(json['startDate']),
  endDate: nullableDateTimeMsFromJson(json['endDate']),
  refreshTime: json['refreshTime'] == null
      ? 0
      : intFromDynamic(json['refreshTime']),
  cyclicConfig:
      (json['cyclicConfig'] as List<dynamic>?)
          ?.map((e) => CyclicConfig.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createDate: nullableDateTimeMsFromJson(json['createDate']),
  status: json['status'] == null ? 0 : intFromDynamic(json['status']),
  creator: json['creator'] as String? ?? '',
  link: json['link'] == null ? '' : stringFromDynamic(json['link']),
  qrCodeVersion: json['qrCodeVersion'] == null
      ? 0
      : intFromDynamic(json['qrCodeVersion']),
  qrCodeContent: json['qrCodeContent'] == null
      ? ''
      : stringFromDynamic(json['qrCodeContent']),
);

Map<String, dynamic> _$QrCodeDtoToJson(_QrCodeDto instance) =>
    <String, dynamic>{
      'qrCodeId': instance.qrCodeId,
      'lockId': instance.lockId,
      'type': instance.type,
      'qrCodeNumber': instance.qrCodeNumber,
      'name': instance.name,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'refreshTime': instance.refreshTime,
      'cyclicConfig': instance.cyclicConfig,
      'createDate': instance.createDate?.toIso8601String(),
      'status': instance.status,
      'creator': instance.creator,
      'link': instance.link,
      'qrCodeVersion': instance.qrCodeVersion,
      'qrCodeContent': instance.qrCodeContent,
    };
