// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock_setting.dart';

part 'lock_setting_dto.freezed.dart';
part 'lock_setting_dto.g.dart';

List<int> intListFromJson(Object? v) {
  if (v is! List) return const [];
  return v.map(intFromDynamic).toList();
}

List<Map<String, dynamic>> mapListFromJson(Object? v) {
  if (v is! List) return const [];
  return v.map((e) => Map<String, dynamic>.from(e as Map)).toList();
}

List<WorkingModeCyclicConfigDto> cyclicConfigListFromJson(Object? v) {
  if (v == null) return const [];
  Object decoded = v;
  if (v is String) {
    if (v.isEmpty) return const [];
    decoded = jsonDecode(v);
  }
  if (decoded is! List) return const [];
  return decoded
      .map(
        (e) => WorkingModeCyclicConfigDto.fromJson(
          Map<String, dynamic>.from(e as Map),
        ),
      )
      .toList();
}

FirmwareInfoDto? firmwareInfoFromJson(Object? v) {
  if (v is Map) return FirmwareInfoDto.fromJson(Map<String, dynamic>.from(v));
  return null;
}

Object? firmwareInfoToJson(FirmwareInfoDto? v) => v?.toJson();

Object? _readBuildingNumber(Map json, String key) =>
    json['buildingNumber'] ?? json['buildNumber'];

Object? _readLockData(Map json, String key) =>
    json['lockData'] ?? json['lockdata'];

@freezed
abstract class ExtraSettingDto with _$ExtraSettingDto {
  const ExtraSettingDto._();
  const factory ExtraSettingDto({
    @JsonKey(name: 'unauthorizedAttemptAlertFlag', fromJson: intFromDynamic)
    @Default(0)
    int flag,
    @JsonKey(name: 'unauthorizedAttemptAlertCount', fromJson: intFromDynamic)
    @Default(0)
    int count,
    @JsonKey(name: 'unauthorizedAttemptAlertLockTime', fromJson: intFromDynamic)
    @Default(0)
    int lockTime,
    @JsonKey(name: 'unauthorizedAttemptAlertPwd', fromJson: intFromDynamic)
    @Default(0)
    int pwd,
    @JsonKey(name: 'unauthorizedAttemptAlertCard', fromJson: intFromDynamic)
    @Default(0)
    int card,
    @JsonKey(
      name: 'unauthorizedAttemptAlertFingerprint',
      fromJson: intFromDynamic,
    )
    @Default(0)
    int fingerprint,
  }) = _ExtraSettingDto;

  factory ExtraSettingDto.fromJson(Map<String, dynamic> json) =>
      _$ExtraSettingDtoFromJson(json);

  ExtraSettingEntity toEntity() => ExtraSettingEntity(
    flag: flag,
    count: count,
    lockTime: lockTime,
    pwd: pwd,
    card: card,
    fingerprint: fingerprint,
  );
}

@freezed
abstract class PassageModeConfigDto with _$PassageModeConfigDto {
  const PassageModeConfigDto._();
  const factory PassageModeConfigDto({
    @JsonKey(name: 'passageMode', fromJson: intFromDynamic)
    @Default(2)
    int passageMode,
    @JsonKey(name: 'startDate', fromJson: intFromDynamic)
    @Default(0)
    int startDate,
    @JsonKey(name: 'endDate', fromJson: intFromDynamic) @Default(0) int endDate,
    @JsonKey(name: 'isAllDay', fromJson: intFromDynamic)
    @Default(2)
    int isAllDay,
    @JsonKey(name: 'weekDays', fromJson: intListFromJson)
    @Default([])
    List<int> weekDays,
    @JsonKey(name: 'autoUnlock', fromJson: intFromDynamic)
    @Default(2)
    int autoUnlock,
  }) = _PassageModeConfigDto;

  factory PassageModeConfigDto.fromJson(Map<String, dynamic> json) =>
      _$PassageModeConfigDtoFromJson(json);

  PassageModeConfigEntity toEntity() => PassageModeConfigEntity(
    passageMode: passageMode,
    startDate: startDate,
    endDate: endDate,
    isAllDay: isAllDay,
    weekDays: weekDays,
    autoUnlock: autoUnlock,
  );
}

@freezed
abstract class WorkingModeCyclicConfigDto with _$WorkingModeCyclicConfigDto {
  const WorkingModeCyclicConfigDto._();
  const factory WorkingModeCyclicConfigDto({
    @JsonKey(name: 'isAllDay', fromJson: intFromDynamic)
    @Default(2)
    int isAllDay,
    @JsonKey(name: 'startTime', fromJson: intFromDynamic)
    @Default(0)
    int startTime,
    @JsonKey(name: 'endTime', fromJson: intFromDynamic) @Default(0) int endTime,
    @JsonKey(name: 'weekDays', fromJson: intListFromJson)
    @Default([])
    List<int> weekDays,
  }) = _WorkingModeCyclicConfigDto;

  factory WorkingModeCyclicConfigDto.fromJson(Map<String, dynamic> json) =>
      _$WorkingModeCyclicConfigDtoFromJson(json);

  WorkingModeCyclicConfigEntity toEntity() => WorkingModeCyclicConfigEntity(
    isAllDay: isAllDay,
    startTime: startTime,
    endTime: endTime,
    weekDays: weekDays,
  );
}

@freezed
abstract class WorkingModeDto with _$WorkingModeDto {
  const WorkingModeDto._();
  const factory WorkingModeDto({
    @JsonKey(name: 'workingMode', fromJson: intFromDynamic)
    @Default(1)
    int workingMode,
    @JsonKey(name: 'cyclicConfig', fromJson: cyclicConfigListFromJson)
    @Default([])
    List<WorkingModeCyclicConfigDto> cyclicConfig,
  }) = _WorkingModeDto;

  factory WorkingModeDto.fromJson(Map<String, dynamic> json) =>
      _$WorkingModeDtoFromJson(json);

  WorkingModeEntity toEntity() => WorkingModeEntity(
    workingMode: workingMode,
    cyclicConfig: cyclicConfig.map((e) => e.toEntity()).toList(),
  );
}

@freezed
abstract class FirmwareInfoDto with _$FirmwareInfoDto {
  const FirmwareInfoDto._();
  const factory FirmwareInfoDto({
    @JsonKey(name: 'modelNum') @Default('') String modelNum,
    @JsonKey(name: 'hardwareRevision') @Default('') String hardwareRevision,
    @JsonKey(name: 'firmwareRevision') @Default('') String firmwareRevision,
  }) = _FirmwareInfoDto;

  factory FirmwareInfoDto.fromJson(Map<String, dynamic> json) =>
      _$FirmwareInfoDtoFromJson(json);

  FirmwareInfoEntity toEntity() => FirmwareInfoEntity(
    modelNum: modelNum,
    hardwareRevision: hardwareRevision,
    firmwareRevision: firmwareRevision,
  );
}

@freezed
abstract class LockUpgradeCheckDto with _$LockUpgradeCheckDto {
  const LockUpgradeCheckDto._();
  const factory LockUpgradeCheckDto({
    @JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)
    @Default(2)
    int needUpgrade,
    @JsonKey(fromJson: firmwareInfoFromJson, toJson: firmwareInfoToJson)
    FirmwareInfoDto? firmwareInfo,
    @JsonKey(name: 'firmwarePackage') @Default('') String firmwarePackage,
    @JsonKey(name: 'version') @Default('') String version,
  }) = _LockUpgradeCheckDto;

  factory LockUpgradeCheckDto.fromJson(Map<String, dynamic> json) =>
      _$LockUpgradeCheckDtoFromJson(json);

  LockUpgradeCheckEntity toEntity() => LockUpgradeCheckEntity(
    needUpgrade: needUpgrade,
    firmwareInfo: firmwareInfo?.toEntity(),
    firmwarePackage: firmwarePackage,
    version: version,
  );
}

@freezed
abstract class NbDeviceInfoDto with _$NbDeviceInfoDto {
  const NbDeviceInfoDto._();
  const factory NbDeviceInfoDto({
    @JsonKey(name: 'nbNodeId') @Default('') String nbNodeId,
    @JsonKey(name: 'nbCardNumber') @Default('') String nbCardNumber,
    @JsonKey(name: 'nbOperator') @Default('') String nbOperator,
    @JsonKey(name: 'nbOperatorName') @Default('') String nbOperatorName,
    @JsonKey(name: 'nbRssi', fromJson: intFromDynamic) @Default(0) int nbRssi,
    @JsonKey(
      name: 'updateDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? updateDate,
  }) = _NbDeviceInfoDto;

  factory NbDeviceInfoDto.fromJson(Map<String, dynamic> json) =>
      _$NbDeviceInfoDtoFromJson(json);

  NbDeviceInfoEntity toEntity() => NbDeviceInfoEntity(
    nbNodeId: nbNodeId,
    nbCardNumber: nbCardNumber,
    nbOperator: nbOperator,
    nbOperatorName: nbOperatorName,
    nbRssi: nbRssi,
    updateDate: updateDate,
  );
}

@freezed
abstract class NbPlatformEndpointDto with _$NbPlatformEndpointDto {
  const NbPlatformEndpointDto._();
  const factory NbPlatformEndpointDto({
    @JsonKey(name: 'nbOperator') @Default('') String nbOperator,
    @JsonKey(name: 'ip') @Default('') String ip,
    @JsonKey(name: 'port', fromJson: intFromDynamic) @Default(0) int port,
  }) = _NbPlatformEndpointDto;

  factory NbPlatformEndpointDto.fromJson(Map<String, dynamic> json) =>
      _$NbPlatformEndpointDtoFromJson(json);

  NbPlatformEndpointEntity toEntity() =>
      NbPlatformEndpointEntity(nbOperator: nbOperator, ip: ip, port: port);
}

@freezed
abstract class HotelLockDto with _$HotelLockDto {
  const HotelLockDto._();
  const factory HotelLockDto({
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'lockName') @Default('') String lockName,
    @JsonKey(name: 'lockAlias') @Default('') String lockAlias,
    @JsonKey(name: 'lockMac') @Default('') String lockMac,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,
    @JsonKey(name: 'featureValue') @Default('') String featureValue,
    @JsonKey(name: 'hasGateway', fromJson: intFromDynamic)
    @Default(0)
    int hasGateway,
    @JsonKey(name: 'lockData') @Default('') String lockData,
    @JsonKey(name: 'sector') @Default('') String sector,
    @JsonKey(
      name: 'electricQuantityUpdateDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? electricQuantityUpdateDate,
    @JsonKey(name: 'buildingName') @Default('') String buildingName,
    @JsonKey(
      name: 'buildingNumber',
      readValue: _readBuildingNumber,
      fromJson: intFromDynamic,
    )
    @Default(0)
    int buildingNumber,
    @JsonKey(name: 'floorName') @Default('') String floorName,
    @JsonKey(name: 'floorNumber', fromJson: intFromDynamic)
    @Default(0)
    int floorNumber,
    @JsonKey(name: 'groupId', fromJson: intFromDynamic) @Default(0) int groupId,
    @JsonKey(name: 'groupName') @Default('') String groupName,
    @JsonKey(
      name: 'date',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? initDate,
  }) = _HotelLockDto;

  factory HotelLockDto.fromJson(Map<String, dynamic> json) =>
      _$HotelLockDtoFromJson(json);

  HotelLockEntity toEntity() => HotelLockEntity(
    lockId: lockId,
    lockName: lockName,
    lockAlias: lockAlias,
    lockMac: lockMac,
    electricQuantity: electricQuantity,
    featureValue: featureValue,
    hasGateway: hasGateway == 1,
    lockData: lockData,
    sector: sector,
    electricQuantityUpdateDate: electricQuantityUpdateDate,
    buildingName: buildingName,
    buildingNumber: buildingNumber,
    floorName: floorName,
    floorNumber: floorNumber,
    groupId: groupId,
    groupName: groupName,
    initDate: initDate,
  );
}

@freezed
abstract class LockImportDataDto with _$LockImportDataDto {
  const LockImportDataDto._();
  const factory LockImportDataDto({
    @JsonKey(name: 'keyNum', fromJson: intFromDynamic) @Default(0) int keyNum,
    @JsonKey(name: 'keyboardPwdNum', fromJson: intFromDynamic)
    @Default(0)
    int keyboardPwdNum,
    @JsonKey(name: 'cardNum', fromJson: intFromDynamic) @Default(0) int cardNum,
    @JsonKey(name: 'keyboardPwdList', fromJson: mapListFromJson)
    @Default([])
    List<Map<String, dynamic>> keyboardPwdList,
    @JsonKey(name: 'identityCardList', fromJson: mapListFromJson)
    @Default([])
    List<Map<String, dynamic>> identityCardList,
  }) = _LockImportDataDto;

  factory LockImportDataDto.fromJson(Map<String, dynamic> json) =>
      _$LockImportDataDtoFromJson(json);

  LockImportDataEntity toEntity() => LockImportDataEntity(
    keyNum: keyNum,
    keyboardPwdNum: keyboardPwdNum,
    cardNum: cardNum,
    keyboardPwdList: keyboardPwdList,
    identityCardList: identityCardList,
  );
}

@freezed
abstract class ChangeTimezoneResultDto with _$ChangeTimezoneResultDto {
  const ChangeTimezoneResultDto._();
  const factory ChangeTimezoneResultDto({
    @JsonKey(
      name: 'lockData',
      readValue: _readLockData,
      fromJson: stringFromDynamic,
    )
    @Default('')
    String lockData,
  }) = _ChangeTimezoneResultDto;

  factory ChangeTimezoneResultDto.fromJson(Map<String, dynamic> json) =>
      _$ChangeTimezoneResultDtoFromJson(json);
}
