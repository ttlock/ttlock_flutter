// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfigModel _$ConfigModelFromJson(Map<String, dynamic> json) => _ConfigModel(
      uid: (json['uid'] as num?)?.toInt() ?? 0,
      serverIp: json['server_ip'] as String?,
      serverPort: json['server_port'] as String?,
      gatewayName: json['gateway_name'] as String? ?? 'Gateway',
    );

Map<String, dynamic> _$ConfigModelToJson(_ConfigModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'server_ip': instance.serverIp,
      'server_port': instance.serverPort,
      'gateway_name': instance.gatewayName,
    };
