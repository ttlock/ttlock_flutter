// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_lock_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WifiLockDto _$WifiLockDtoFromJson(Map<String, dynamic> json) => _WifiLockDto(
  networkName: json['networkName'] as String? ?? '',
  ip: json['ip'] as String? ?? '',
  subnetMask: json['subnetMask'] as String? ?? '',
  defaultGateway: json['defaultGateway'] as String? ?? '',
  wifiMac: json['wifiMac'] as String? ?? '',
  rssiGrade: json['rssiGrade'] == null ? 0 : intFromDynamic(json['rssiGrade']),
  isOnline: json['isOnline'] == null
      ? false
      : boolFromDynamic(json['isOnline']),
  powerSavingMode: json['powerSavingMode'] == null
      ? 0
      : intFromDynamic(json['powerSavingMode']),
  preferredDns: json['preferredDns'] as String? ?? '',
  alternateDns: json['alternateDns'] as String? ?? '',
);

Map<String, dynamic> _$WifiLockDtoToJson(_WifiLockDto instance) =>
    <String, dynamic>{
      'networkName': instance.networkName,
      'ip': instance.ip,
      'subnetMask': instance.subnetMask,
      'defaultGateway': instance.defaultGateway,
      'wifiMac': instance.wifiMac,
      'rssiGrade': instance.rssiGrade,
      'isOnline': instance.isOnline,
      'powerSavingMode': instance.powerSavingMode,
      'preferredDns': instance.preferredDns,
      'alternateDns': instance.alternateDns,
    };
