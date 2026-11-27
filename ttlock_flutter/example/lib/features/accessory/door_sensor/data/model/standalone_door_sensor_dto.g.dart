// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standalone_door_sensor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StandaloneDoorSensorDto _$StandaloneDoorSensorDtoFromJson(
  Map<String, dynamic> json,
) => _StandaloneDoorSensorDto(
  mac: json['mac'] as String? ?? '',
  featureValue: json['featureValue'] as String? ?? '',
  statusDelayFlag: json['statusDelayFlag'] == null
      ? 0
      : intFromDynamic(json['statusDelayFlag']),
  electricQuantity: json['electricQuantity'] == null
      ? 0
      : intFromDynamic(json['electricQuantity']),
  doorSensorStateValue: json['doorSensorState'] == null
      ? 2
      : intFromDynamic(json['doorSensorState']),
  wifiName: json['wifiName'] as String? ?? '',
  doorSensorNumber: json['doorSensorNumber'] as String? ?? '',
  doorSensorId: json['doorSensorId'] == null
      ? 0
      : intFromDynamic(json['doorSensorId']),
  name: json['name'] as String? ?? '',
  recordUpdateDate: nullableDateTimeMsFromJson(json['recordUpdateDate']),
  wifiMac: json['wifiMac'] as String? ?? '',
  userTypeValue: json['userType'] as String? ?? 'ADMIN',
  firmwareRevision: json['firmwareRevision'] as String? ?? '',
);

Map<String, dynamic> _$StandaloneDoorSensorDtoToJson(
  _StandaloneDoorSensorDto instance,
) => <String, dynamic>{
  'mac': instance.mac,
  'featureValue': instance.featureValue,
  'statusDelayFlag': instance.statusDelayFlag,
  'electricQuantity': instance.electricQuantity,
  'doorSensorState': instance.doorSensorStateValue,
  'wifiName': instance.wifiName,
  'doorSensorNumber': instance.doorSensorNumber,
  'doorSensorId': instance.doorSensorId,
  'name': instance.name,
  'recordUpdateDate': nullableDateTimeMsToJson(instance.recordUpdateDate),
  'wifiMac': instance.wifiMac,
  'userType': instance.userTypeValue,
  'firmwareRevision': instance.firmwareRevision,
};

_StandaloneDoorSensorRecordDto _$StandaloneDoorSensorRecordDtoFromJson(
  Map<String, dynamic> json,
) => _StandaloneDoorSensorRecordDto(
  date: nullableDateTimeMsFromJson(json['date']),
  recordType: json['recordType'] == null
      ? 0
      : intFromDynamic(json['recordType']),
);

Map<String, dynamic> _$StandaloneDoorSensorRecordDtoToJson(
  _StandaloneDoorSensorRecordDto instance,
) => <String, dynamic>{
  'date': nullableDateTimeMsToJson(instance.date),
  'recordType': instance.recordType,
};

_StandaloneDoorSensorAlertFlagDto _$StandaloneDoorSensorAlertFlagDtoFromJson(
  Map<String, dynamic> json,
) => _StandaloneDoorSensorAlertFlagDto(
  notCloseAlertFlag: json['notCloseAlertFlag'] == null
      ? 0
      : intFromDynamic(json['notCloseAlertFlag']),
  notCloseAlertSecondNum: json['notCloseAlertSecondNum'] == null
      ? 0
      : intFromDynamic(json['notCloseAlertSecondNum']),
  longTimeNotOpenAlertFlag: json['longTimeNotOpenAlertFlag'] == null
      ? 0
      : intFromDynamic(json['longTimeNotOpenAlertFlag']),
  longTimeNotOpenDayNum: json['longTimeNotOpenDayNum'] == null
      ? 0
      : intFromDynamic(json['longTimeNotOpenDayNum']),
);

Map<String, dynamic> _$StandaloneDoorSensorAlertFlagDtoToJson(
  _StandaloneDoorSensorAlertFlagDto instance,
) => <String, dynamic>{
  'notCloseAlertFlag': instance.notCloseAlertFlag,
  'notCloseAlertSecondNum': instance.notCloseAlertSecondNum,
  'longTimeNotOpenAlertFlag': instance.longTimeNotOpenAlertFlag,
  'longTimeNotOpenDayNum': instance.longTimeNotOpenDayNum,
};

_StandaloneDoorSensorUserDto _$StandaloneDoorSensorUserDtoFromJson(
  Map<String, dynamic> json,
) => _StandaloneDoorSensorUserDto(
  id: json['id'] == null ? 0 : intFromDynamic(json['id']),
  username: json['username'] as String? ?? '',
);

Map<String, dynamic> _$StandaloneDoorSensorUserDtoToJson(
  _StandaloneDoorSensorUserDto instance,
) => <String, dynamic>{'id': instance.id, 'username': instance.username};
