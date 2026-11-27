// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'door_sensor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DoorSensorDto _$DoorSensorDtoFromJson(Map<String, dynamic> json) =>
    _DoorSensorDto(
      doorSensorId: json['doorSensorId'] == null
          ? 0
          : intFromDynamic(json['doorSensorId']),
      name: json['name'] as String? ?? '',
      electricQuantity: json['electricQuantity'] == null
          ? 0
          : intFromDynamic(json['electricQuantity']),
      version: json['version'] as String? ?? '',
      mac: json['mac'] as String? ?? '',
      number: json['number'] as String? ?? '',
      doorNotClosedWarningTime: json['doorNotClosedWarningTime'] == null
          ? 0
          : intFromDynamic(json['doorNotClosedWarningTime']),
    );

Map<String, dynamic> _$DoorSensorDtoToJson(_DoorSensorDto instance) =>
    <String, dynamic>{
      'doorSensorId': instance.doorSensorId,
      'name': instance.name,
      'electricQuantity': instance.electricQuantity,
      'version': instance.version,
      'mac': instance.mac,
      'number': instance.number,
      'doorNotClosedWarningTime': instance.doorNotClosedWarningTime,
    };

_DoorSensorRecordDto _$DoorSensorRecordDtoFromJson(Map<String, dynamic> json) =>
    _DoorSensorRecordDto(
      recordId: json['recordId'] == null ? 0 : intFromDynamic(json['recordId']),
      recordTypeFromLock: json['recordTypeFromLock'] == null
          ? 0
          : intFromDynamic(json['recordTypeFromLock']),
      recordType: json['recordType'] == null
          ? 0
          : intFromDynamic(json['recordType']),
      success: json['success'] == null
          ? false
          : boolFromDynamic(json['success']),
      lockDate: nullableDateTimeMsFromJson(json['lockDate']),
      serverDate: nullableDateTimeMsFromJson(json['serverDate']),
    );

Map<String, dynamic> _$DoorSensorRecordDtoToJson(
  _DoorSensorRecordDto instance,
) => <String, dynamic>{
  'recordId': instance.recordId,
  'recordTypeFromLock': instance.recordTypeFromLock,
  'recordType': instance.recordType,
  'success': instance.success,
  'lockDate': nullableDateTimeMsToJson(instance.lockDate),
  'serverDate': nullableDateTimeMsToJson(instance.serverDate),
};

_DoorSensorUpgradeCheckDto _$DoorSensorUpgradeCheckDtoFromJson(
  Map<String, dynamic> json,
) => _DoorSensorUpgradeCheckDto(
  needUpgrade: json['needUpgrade'] == null
      ? 0
      : intFromDynamic(json['needUpgrade']),
  firmwareInfo: json['firmwareInfo'],
  firmwarePackage: json['firmwarePackage'] as String? ?? '',
  version: json['version'] as String? ?? '',
);

Map<String, dynamic> _$DoorSensorUpgradeCheckDtoToJson(
  _DoorSensorUpgradeCheckDto instance,
) => <String, dynamic>{
  'needUpgrade': instance.needUpgrade,
  'firmwareInfo': instance.firmwareInfo,
  'firmwarePackage': instance.firmwarePackage,
  'version': instance.version,
};
