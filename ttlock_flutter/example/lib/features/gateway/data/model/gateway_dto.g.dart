// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gateway_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GatewayDto _$GatewayDtoFromJson(Map<String, dynamic> json) => _GatewayDto(
  gatewayId: json['gatewayId'] == null ? 0 : intFromDynamic(json['gatewayId']),
  gatewayMac: json['gatewayMac'] as String? ?? '',
  gatewayName: json['gatewayName'] as String? ?? '',
  gatewayVersion: json['gatewayVersion'] == null
      ? 2
      : intFromDynamic(json['gatewayVersion']),
  networkName: json['networkName'] as String? ?? '',
  networkMac: json['networkMac'] as String? ?? '',
  lockNum: json['lockNum'] == null ? 0 : intFromDynamic(json['lockNum']),
  isOnline: json['isOnline'] == null ? 0 : intFromDynamic(json['isOnline']),
);

Map<String, dynamic> _$GatewayDtoToJson(_GatewayDto instance) =>
    <String, dynamic>{
      'gatewayId': instance.gatewayId,
      'gatewayMac': instance.gatewayMac,
      'gatewayName': instance.gatewayName,
      'gatewayVersion': instance.gatewayVersion,
      'networkName': instance.networkName,
      'networkMac': instance.networkMac,
      'lockNum': instance.lockNum,
      'isOnline': instance.isOnline,
    };

_GatewayByLockDto _$GatewayByLockDtoFromJson(Map<String, dynamic> json) =>
    _GatewayByLockDto(
      gatewayId: json['gatewayId'] == null
          ? 0
          : intFromDynamic(json['gatewayId']),
      gatewayMac: json['gatewayMac'] as String? ?? '',
      gatewayName: json['gatewayName'] as String? ?? '',
      rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
      rssiUpdateDate: nullableDateTimeMsFromJson(json['rssiUpdateDate']),
    );

Map<String, dynamic> _$GatewayByLockDtoToJson(_GatewayByLockDto instance) =>
    <String, dynamic>{
      'gatewayId': instance.gatewayId,
      'gatewayMac': instance.gatewayMac,
      'gatewayName': instance.gatewayName,
      'rssi': instance.rssi,
      'rssiUpdateDate': instance.rssiUpdateDate?.toIso8601String(),
    };

_GatewayLockDto _$GatewayLockDtoFromJson(Map<String, dynamic> json) =>
    _GatewayLockDto(
      lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
      lockMac: json['lockMac'] as String? ?? '',
      lockName: json['lockName'] as String? ?? '',
      lockAlias: json['lockAlias'] as String? ?? '',
      rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
      updateDate: nullableDateTimeMsFromJson(json['updateDate']),
    );

Map<String, dynamic> _$GatewayLockDtoToJson(_GatewayLockDto instance) =>
    <String, dynamic>{
      'lockId': instance.lockId,
      'lockMac': instance.lockMac,
      'lockName': instance.lockName,
      'lockAlias': instance.lockAlias,
      'rssi': instance.rssi,
      'updateDate': instance.updateDate?.toIso8601String(),
    };

_GatewayDeviceDto _$GatewayDeviceDtoFromJson(Map<String, dynamic> json) =>
    _GatewayDeviceDto(
      deviceType: json['deviceType'] == null
          ? 0
          : intFromDynamic(json['deviceType']),
      deviceId: json['deviceId'] == null ? 0 : intFromDynamic(json['deviceId']),
      deviceMac: json['deviceMac'] as String? ?? '',
      deviceName: json['deviceName'] as String? ?? '',
      deviceAlias: json['deviceAlias'] as String? ?? '',
      rssi: json['rssi'] == null ? 0 : intFromDynamic(json['rssi']),
      updateDate: nullableDateTimeMsFromJson(json['updateDate']),
    );

Map<String, dynamic> _$GatewayDeviceDtoToJson(_GatewayDeviceDto instance) =>
    <String, dynamic>{
      'deviceType': instance.deviceType,
      'deviceId': instance.deviceId,
      'deviceMac': instance.deviceMac,
      'deviceName': instance.deviceName,
      'deviceAlias': instance.deviceAlias,
      'rssi': instance.rssi,
      'updateDate': instance.updateDate?.toIso8601String(),
    };

_GatewayFirmwareInfoDto _$GatewayFirmwareInfoDtoFromJson(
  Map<String, dynamic> json,
) => _GatewayFirmwareInfoDto(
  modelNum: json['modelNum'] as String? ?? '',
  hardwareRevision: json['hardwareRevision'] as String? ?? '',
  firmwareRevision: json['firmwareRevision'] as String? ?? '',
);

Map<String, dynamic> _$GatewayFirmwareInfoDtoToJson(
  _GatewayFirmwareInfoDto instance,
) => <String, dynamic>{
  'modelNum': instance.modelNum,
  'hardwareRevision': instance.hardwareRevision,
  'firmwareRevision': instance.firmwareRevision,
};

_GatewayUpgradeCheckDto _$GatewayUpgradeCheckDtoFromJson(
  Map<String, dynamic> json,
) => _GatewayUpgradeCheckDto(
  needUpgrade: json['needUpgrade'] == null
      ? 0
      : intFromDynamic(json['needUpgrade']),
  firmwareInfo: json['firmwareInfo'] == null
      ? null
      : GatewayFirmwareInfoDto.fromJson(
          json['firmwareInfo'] as Map<String, dynamic>,
        ),
  version: json['version'] as String? ?? '',
);

Map<String, dynamic> _$GatewayUpgradeCheckDtoToJson(
  _GatewayUpgradeCheckDto instance,
) => <String, dynamic>{
  'needUpgrade': instance.needUpgrade,
  'firmwareInfo': instance.firmwareInfo,
  'version': instance.version,
};

_GatewayUpgradeCheckOnPremiseDto _$GatewayUpgradeCheckOnPremiseDtoFromJson(
  Map<String, dynamic> json,
) => _GatewayUpgradeCheckOnPremiseDto(
  needUpgrade: json['needUpgrade'] == null
      ? 0
      : intFromDynamic(json['needUpgrade']),
  firmwareInfo: json['firmwareInfo'] == null
      ? null
      : GatewayFirmwareInfoDto.fromJson(
          json['firmwareInfo'] as Map<String, dynamic>,
        ),
  firmwarePackage: json['firmwarePackage'] as String? ?? '',
  version: json['version'] as String? ?? '',
);

Map<String, dynamic> _$GatewayUpgradeCheckOnPremiseDtoToJson(
  _GatewayUpgradeCheckOnPremiseDto instance,
) => <String, dynamic>{
  'needUpgrade': instance.needUpgrade,
  'firmwareInfo': instance.firmwareInfo,
  'firmwarePackage': instance.firmwarePackage,
  'version': instance.version,
};
