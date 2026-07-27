// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfigModel _$ConfigModelFromJson(Map<String, dynamic> json) => _ConfigModel(
      uid: (json['uid'] as num?)?.toInt() ?? 0,
      password: json['password'] as String?,
      serverIp: json['server_ip'] as String?,
      serverPort: json['server_port'] as String?,
      serverRegion:
          $enumDecodeNullable(_$ServerRegionEnumMap, json['server_region']) ??
              ServerRegion.china,
    );

Map<String, dynamic> _$ConfigModelToJson(_ConfigModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'password': instance.password,
      'server_ip': instance.serverIp,
      'server_port': instance.serverPort,
      'server_region': _$ServerRegionEnumMap[instance.serverRegion]!,
    };

const _$ServerRegionEnumMap = {
  ServerRegion.china: 'china',
  ServerRegion.global: 'global',
};
