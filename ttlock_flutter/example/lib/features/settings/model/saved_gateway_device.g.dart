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
      gatewayType: (json['gateway_type'] as num?)?.toInt() ?? 0,
      wifiSsid: json['wifi_ssid'] as String?,
      useStaticIp: json['use_static_ip'] as bool? ?? false,
      ipAddress: json['ip_address'] as String?,
      subnetMask: json['subnet_mask'] as String?,
      router: json['router'] as String?,
      preferredDns: json['preferred_dns'] as String?,
      apnEnabled: json['apn_enabled'] as bool? ?? false,
      apn: json['apn'] as String?,
      initializedAt: DateTime.parse(json['initialized_at'] as String),
    );

Map<String, dynamic> _$SavedGatewayDeviceToJson(_SavedGatewayDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'gateway_model': instance.gatewayModel,
      'gateway_type': instance.gatewayType,
      'wifi_ssid': instance.wifiSsid,
      'use_static_ip': instance.useStaticIp,
      'ip_address': instance.ipAddress,
      'subnet_mask': instance.subnetMask,
      'router': instance.router,
      'preferred_dns': instance.preferredDns,
      'apn_enabled': instance.apnEnabled,
      'apn': instance.apn,
      'initialized_at': instance.initializedAt.toIso8601String(),
    };
