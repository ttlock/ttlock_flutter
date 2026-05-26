// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_gateway_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedGatewayDevice _$SavedGatewayDeviceFromJson(Map<String, dynamic> json) =>
    _SavedGatewayDevice(
      name: json['name'] as String,
      mac: json['mac'] as String,
      gatewayModel: json['gateway_model'] as String? ?? '',
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedGatewayDeviceToJson(_SavedGatewayDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'gateway_model': instance.gatewayModel,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
