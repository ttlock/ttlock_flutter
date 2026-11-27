// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';

part 'gateway_dto.freezed.dart';
part 'gateway_dto.g.dart';

@freezed
abstract class GatewayDto with _$GatewayDto {
  const GatewayDto._();
  const factory GatewayDto({
    @JsonKey(name: 'gatewayId', fromJson: intFromDynamic)
    @Default(0)
    int gatewayId,
    @JsonKey(name: 'gatewayMac') @Default('') String gatewayMac,
    @JsonKey(name: 'gatewayName') @Default('') String gatewayName,
    @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)
    @Default(2)
    int gatewayVersion,
    @JsonKey(name: 'networkName') @Default('') String networkName,
    @JsonKey(name: 'networkMac') @Default('') String networkMac,
    @JsonKey(name: 'lockNum', fromJson: intFromDynamic) @Default(0) int lockNum,
    @JsonKey(name: 'isOnline', fromJson: intFromDynamic)
    @Default(0)
    int isOnline,
  }) = _GatewayDto;

  factory GatewayDto.fromJson(Map<String, dynamic> json) =>
      _$GatewayDtoFromJson(json);

  GatewayEntity toEntity() => GatewayEntity(
    gatewayId: gatewayId,
    gatewayMac: gatewayMac,
    gatewayName: gatewayName,
    gatewayVersion: GatewayVersion.fromValue(gatewayVersion),
    networkName: networkName,
    networkMac: networkMac,
    lockNum: lockNum,
    isOnline: isOnline == 1,
  );
}

@freezed
abstract class GatewayByLockDto with _$GatewayByLockDto {
  const GatewayByLockDto._();
  const factory GatewayByLockDto({
    @JsonKey(name: 'gatewayId', fromJson: intFromDynamic)
    @Default(0)
    int gatewayId,
    @JsonKey(name: 'gatewayMac') @Default('') String gatewayMac,
    @JsonKey(name: 'gatewayName') @Default('') String gatewayName,
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,
    @JsonKey(name: 'rssiUpdateDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? rssiUpdateDate,
  }) = _GatewayByLockDto;

  factory GatewayByLockDto.fromJson(Map<String, dynamic> json) =>
      _$GatewayByLockDtoFromJson(json);

  GatewayEntity toEntity() => GatewayEntity(
    gatewayId: gatewayId,
    gatewayMac: gatewayMac,
    gatewayName: gatewayName,
  );
}

@freezed
abstract class GatewayLockDto with _$GatewayLockDto {
  const GatewayLockDto._();
  const factory GatewayLockDto({
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'lockMac') @Default('') String lockMac,
    @JsonKey(name: 'lockName') @Default('') String lockName,
    @JsonKey(name: 'lockAlias') @Default('') String lockAlias,
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,
    @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? updateDate,
  }) = _GatewayLockDto;

  factory GatewayLockDto.fromJson(Map<String, dynamic> json) =>
      _$GatewayLockDtoFromJson(json);
}

@freezed
abstract class GatewayDeviceDto with _$GatewayDeviceDto {
  const GatewayDeviceDto._();
  const factory GatewayDeviceDto({
    @JsonKey(name: 'deviceType', fromJson: intFromDynamic)
    @Default(0)
    int deviceType,
    @JsonKey(name: 'deviceId', fromJson: intFromDynamic)
    @Default(0)
    int deviceId,
    @JsonKey(name: 'deviceMac') @Default('') String deviceMac,
    @JsonKey(name: 'deviceName') @Default('') String deviceName,
    @JsonKey(name: 'deviceAlias') @Default('') String deviceAlias,
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,
    @JsonKey(name: 'updateDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? updateDate,
  }) = _GatewayDeviceDto;

  factory GatewayDeviceDto.fromJson(Map<String, dynamic> json) =>
      _$GatewayDeviceDtoFromJson(json);
}

@freezed
abstract class GatewayFirmwareInfoDto with _$GatewayFirmwareInfoDto {
  const factory GatewayFirmwareInfoDto({
    @JsonKey(name: 'modelNum') @Default('') String modelNum,
    @JsonKey(name: 'hardwareRevision') @Default('') String hardwareRevision,
    @JsonKey(name: 'firmwareRevision') @Default('') String firmwareRevision,
  }) = _GatewayFirmwareInfoDto;

  factory GatewayFirmwareInfoDto.fromJson(Map<String, dynamic> json) =>
      _$GatewayFirmwareInfoDtoFromJson(json);
}

@freezed
abstract class GatewayUpgradeCheckDto with _$GatewayUpgradeCheckDto {
  const GatewayUpgradeCheckDto._();
  const factory GatewayUpgradeCheckDto({
    @JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)
    @Default(0)
    int needUpgrade,
    @JsonKey(name: 'firmwareInfo') GatewayFirmwareInfoDto? firmwareInfo,
    @JsonKey(name: 'version') @Default('') String version,
  }) = _GatewayUpgradeCheckDto;

  factory GatewayUpgradeCheckDto.fromJson(Map<String, dynamic> json) =>
      _$GatewayUpgradeCheckDtoFromJson(json);
}

@freezed
abstract class GatewayUpgradeCheckOnPremiseDto
    with _$GatewayUpgradeCheckOnPremiseDto {
  const GatewayUpgradeCheckOnPremiseDto._();
  const factory GatewayUpgradeCheckOnPremiseDto({
    @JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)
    @Default(0)
    int needUpgrade,
    @JsonKey(name: 'firmwareInfo') GatewayFirmwareInfoDto? firmwareInfo,
    @JsonKey(name: 'firmwarePackage') @Default('') String firmwarePackage,
    @JsonKey(name: 'version') @Default('') String version,
  }) = _GatewayUpgradeCheckOnPremiseDto;

  factory GatewayUpgradeCheckOnPremiseDto.fromJson(Map<String, dynamic> json) =>
      _$GatewayUpgradeCheckOnPremiseDtoFromJson(json);
}
