// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LockDto _$LockDtoFromJson(Map<String, dynamic> json) => _LockDto(
  lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
  lockName: json['lockName'] as String? ?? '',
  lockAlias: json['lockAlias'] as String? ?? '',
  lockMac: json['lockMac'] as String? ?? '',
  electricQuantity: json['electricQuantity'] == null
      ? 0
      : intFromDynamic(json['electricQuantity']),
  featureValue: json['featureValue'] as String? ?? '',
  hasGateway: json['hasGateway'] == null
      ? 0
      : intFromDynamic(json['hasGateway']),
  lockData: json['lockData'] as String? ?? '',
  groupId: json['groupId'] == null ? 0 : intFromDynamic(json['groupId']),
  groupName: json['groupName'] as String? ?? '',
  initDate: nullableDateTimeMsFromJson(json['date']),
  autoLockTime: nullableIntFromDynamic(json['autoLockTime']),
  lockSound: nullableIntFromDynamic(json['lockSound']),
  soundVolume: nullableIntFromDynamic(json['soundVolume']),
  privacyLock: nullableIntFromDynamic(json['privacyLock']),
  tamperAlert: nullableIntFromDynamic(json['tamperAlert']),
  resetButton: nullableIntFromDynamic(json['resetButton']),
  openDirection: nullableIntFromDynamic(json['openDirection']),
  passageMode: nullableIntFromDynamic(json['passageMode']),
  passageModeAutoUnlock: nullableIntFromDynamic(json['passageModeAutoUnlock']),
);

Map<String, dynamic> _$LockDtoToJson(_LockDto instance) => <String, dynamic>{
  'lockId': instance.lockId,
  'lockName': instance.lockName,
  'lockAlias': instance.lockAlias,
  'lockMac': instance.lockMac,
  'electricQuantity': instance.electricQuantity,
  'featureValue': instance.featureValue,
  'hasGateway': instance.hasGateway,
  'lockData': instance.lockData,
  'groupId': instance.groupId,
  'groupName': instance.groupName,
  'date': nullableDateTimeMsToJson(instance.initDate),
  'autoLockTime': instance.autoLockTime,
  'lockSound': instance.lockSound,
  'soundVolume': instance.soundVolume,
  'privacyLock': instance.privacyLock,
  'tamperAlert': instance.tamperAlert,
  'resetButton': instance.resetButton,
  'openDirection': instance.openDirection,
  'passageMode': instance.passageMode,
  'passageModeAutoUnlock': instance.passageModeAutoUnlock,
};

_LockInitializeDto _$LockInitializeDtoFromJson(Map<String, dynamic> json) =>
    _LockInitializeDto(
      lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
      keyId: json['keyId'] == null ? '' : stringFromDynamic(json['keyId']),
    );

Map<String, dynamic> _$LockInitializeDtoToJson(_LockInitializeDto instance) =>
    <String, dynamic>{'lockId': instance.lockId, 'keyId': instance.keyId};
