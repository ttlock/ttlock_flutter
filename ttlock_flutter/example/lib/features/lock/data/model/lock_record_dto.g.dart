// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LockRecordDto _$LockRecordDtoFromJson(Map<String, dynamic> json) =>
    _LockRecordDto(
      recordId: json['recordId'] == null ? 0 : intFromDynamic(json['recordId']),
      lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
      recordTypeFromLock: json['recordTypeFromLock'] == null
          ? 0
          : intFromDynamic(json['recordTypeFromLock']),
      recordType: json['recordType'] == null
          ? 0
          : intFromDynamic(json['recordType']),
      success: json['success'] == null
          ? false
          : boolFromDynamic(json['success']),
      username: json['username'] as String? ?? '',
      keyboardPwd: json['keyboardPwd'] as String? ?? '',
      lockDate: nullableDateTimeMsFromJson(json['lockDate']),
      serverDate: nullableDateTimeMsFromJson(json['serverDate']),
      subRecordType: json['subRecordType'] == null
          ? 0
          : intFromDynamic(json['subRecordType']),
    );

Map<String, dynamic> _$LockRecordDtoToJson(_LockRecordDto instance) =>
    <String, dynamic>{
      'recordId': instance.recordId,
      'lockId': instance.lockId,
      'recordTypeFromLock': instance.recordTypeFromLock,
      'recordType': instance.recordType,
      'success': instance.success,
      'username': instance.username,
      'keyboardPwd': instance.keyboardPwd,
      'lockDate': nullableDateTimeMsToJson(instance.lockDate),
      'serverDate': nullableDateTimeMsToJson(instance.serverDate),
      'subRecordType': instance.subRecordType,
    };
