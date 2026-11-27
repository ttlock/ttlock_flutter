// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppConfigDto _$AppConfigDtoFromJson(Map<String, dynamic> json) =>
    _AppConfigDto(
      clientId: json['clientId'] as String? ?? '',
      clientSecret: json['clientSecret'] as String? ?? '',
      site: json['site'] as String? ?? 'cn',
    );

Map<String, dynamic> _$AppConfigDtoToJson(_AppConfigDto instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
      'site': instance.site,
    };
