// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KeyDto _$KeyDtoFromJson(Map<String, dynamic> json) => _KeyDto(
  keyId: json['keyId'] == null ? 0 : intFromDynamic(json['keyId']),
  lockData: json['lockData'] as String? ?? '',
  lockId: json['lockId'] == null ? 0 : intFromDynamic(json['lockId']),
  userType: json['userType'] == null
      ? KeyUserType.normal
      : _userTypeFromJson(json['userType']),
  keyStatus: json['keyStatus'] == null
      ? KeyStatus.normal
      : _keyStatusFromJson(json['keyStatus']),
  lockName: json['lockName'] as String? ?? '',
  lockAlias: json['lockAlias'] as String? ?? '',
  lockMac: json['lockMac'] as String? ?? '',
  noKeyPwd: json['noKeyPwd'] as String? ?? '',
  electricQuantity: json['electricQuantity'] == null
      ? 0
      : intFromDynamic(json['electricQuantity']),
  startDate: nullableDateTimeMsFromJson(json['startDate']),
  endDate: nullableDateTimeMsFromJson(json['endDate']),
  remarks: json['remarks'] as String? ?? '',
  keyRight: json['keyRight'] == null
      ? false
      : _keyRightFromJson(json['keyRight']),
  featureValue: json['featureValue'] as String? ?? '',
  remoteEnable: json['remoteEnable'] == null
      ? false
      : _remoteEnableFromJson(json['remoteEnable']),
  passageMode: json['passageMode'] == null
      ? false
      : _passageModeFromJson(json['passageMode']),
  timezoneRawOffset: json['timezoneRawOffset'] == null
      ? 0
      : intFromDynamic(json['timezoneRawOffset']),
  groupId: json['groupId'] == null ? 0 : intFromDynamic(json['groupId']),
  groupName: json['groupName'] as String? ?? '',
  username: json['username'] as String? ?? '',
  keyName: json['keyName'] as String? ?? '',
  senderUsername: json['senderUsername'] as String? ?? '',
  uid: json['uid'] == null ? 0 : intFromDynamic(json['uid']),
  sendDate: nullableDateTimeMsFromJson(json['date']),
);

Map<String, dynamic> _$KeyDtoToJson(_KeyDto instance) => <String, dynamic>{
  'keyId': instance.keyId,
  'lockData': instance.lockData,
  'lockId': instance.lockId,
  'userType': _$KeyUserTypeEnumMap[instance.userType]!,
  'keyStatus': _$KeyStatusEnumMap[instance.keyStatus]!,
  'lockName': instance.lockName,
  'lockAlias': instance.lockAlias,
  'lockMac': instance.lockMac,
  'noKeyPwd': instance.noKeyPwd,
  'electricQuantity': instance.electricQuantity,
  'startDate': nullableDateTimeMsToJson(instance.startDate),
  'endDate': nullableDateTimeMsToJson(instance.endDate),
  'remarks': instance.remarks,
  'keyRight': instance.keyRight,
  'featureValue': instance.featureValue,
  'remoteEnable': instance.remoteEnable,
  'passageMode': instance.passageMode,
  'timezoneRawOffset': instance.timezoneRawOffset,
  'groupId': instance.groupId,
  'groupName': instance.groupName,
  'username': instance.username,
  'keyName': instance.keyName,
  'senderUsername': instance.senderUsername,
  'uid': instance.uid,
  'date': nullableDateTimeMsToJson(instance.sendDate),
};

const _$KeyUserTypeEnumMap = {
  KeyUserType.admin: 'admin',
  KeyUserType.normal: 'normal',
};

const _$KeyStatusEnumMap = {
  KeyStatus.normal: 'normal',
  KeyStatus.pending: 'pending',
  KeyStatus.frozen: 'frozen',
  KeyStatus.deleted: 'deleted',
  KeyStatus.reset: 'reset',
};
