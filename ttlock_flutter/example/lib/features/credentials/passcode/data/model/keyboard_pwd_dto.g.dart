// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard_pwd_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KeyboardPwdDto _$KeyboardPwdDtoFromJson(Map<String, dynamic> json) =>
    _KeyboardPwdDto(
      keyboardPwdId: json['keyboardPwdId'] == null
          ? 0
          : intFromDynamic(json['keyboardPwdId']),
      lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
      keyboardPwd: json['keyboardPwd'] as String? ?? '',
      keyboardPwdName: json['keyboardPwdName'] as String? ?? '',
      keyboardPwdType: json['keyboardPwdType'] == null
          ? 3
          : intFromDynamic(json['keyboardPwdType']),
      startDate: nullableDateTimeMsFromJson(json['startDate']),
      endDate: nullableDateTimeMsFromJson(json['endDate']),
      sendDate: nullableDateTimeMsFromJson(json['sendDate']),
      isCustom: json['isCustom'] == null
          ? false
          : boolFromDynamic(json['isCustom']),
      senderUsername: json['senderUsername'] as String? ?? '',
    );

Map<String, dynamic> _$KeyboardPwdDtoToJson(_KeyboardPwdDto instance) =>
    <String, dynamic>{
      'keyboardPwdId': instance.keyboardPwdId,
      'lockId': instance.lockId,
      'keyboardPwd': instance.keyboardPwd,
      'keyboardPwdName': instance.keyboardPwdName,
      'keyboardPwdType': instance.keyboardPwdType,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'sendDate': instance.sendDate?.toIso8601String(),
      'isCustom': instance.isCustom,
      'senderUsername': instance.senderUsername,
    };
