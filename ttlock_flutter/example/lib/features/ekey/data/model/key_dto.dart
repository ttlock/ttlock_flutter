// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';

part 'key_dto.freezed.dart';
part 'key_dto.g.dart';

bool _keyRightFromJson(Object? v) => boolFromDynamic(v);

bool _remoteEnableFromJson(Object? v) => intFromDynamic(v) == 1;

bool _passageModeFromJson(Object? v) => intFromDynamic(v) == 1;

KeyUserType _userTypeFromJson(Object? v) =>
    KeyUserType.fromValue(v?.toString());

KeyStatus _keyStatusFromJson(Object? v) => KeyStatus.fromValue(v?.toString());

@freezed
abstract class KeyDto with _$KeyDto {
  const KeyDto._();
  const factory KeyDto({
    @JsonKey(name: 'keyId', fromJson: intFromDynamic) @Default(0) int keyId,
    @JsonKey(name: 'lockData') @Default('') String lockData,
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'userType', fromJson: _userTypeFromJson)
    @Default(KeyUserType.normal)
    KeyUserType userType,
    @JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson)
    @Default(KeyStatus.normal)
    KeyStatus keyStatus,
    @JsonKey(name: 'lockName') @Default('') String lockName,
    @JsonKey(name: 'lockAlias') @Default('') String lockAlias,
    @JsonKey(name: 'lockMac') @Default('') String lockMac,
    @JsonKey(name: 'noKeyPwd') @Default('') String noKeyPwd,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,
    @JsonKey(
      name: 'startDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? startDate,
    @JsonKey(
      name: 'endDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? endDate,
    @JsonKey(name: 'remarks') @Default('') String remarks,
    @JsonKey(name: 'keyRight', fromJson: _keyRightFromJson)
    @Default(false)
    bool keyRight,
    @JsonKey(name: 'featureValue') @Default('') String featureValue,
    @JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson)
    @Default(false)
    bool remoteEnable,
    @JsonKey(name: 'passageMode', fromJson: _passageModeFromJson)
    @Default(false)
    bool passageMode,
    @JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic)
    @Default(0)
    int timezoneRawOffset,
    @JsonKey(name: 'groupId', fromJson: intFromDynamic) @Default(0) int groupId,
    @JsonKey(name: 'groupName') @Default('') String groupName,
    @JsonKey(name: 'username') @Default('') String username,
    @JsonKey(name: 'keyName') @Default('') String keyName,
    @JsonKey(name: 'senderUsername') @Default('') String senderUsername,
    @JsonKey(name: 'uid', fromJson: intFromDynamic) @Default(0) int uid,
    @JsonKey(
      name: 'date',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? sendDate,
  }) = _KeyDto;

  factory KeyDto.fromJson(Map<String, dynamic> json) => _$KeyDtoFromJson(json);

  KeyEntity toEntity() => KeyEntity(
    keyId: keyId,
    lockData: lockData,
    lockId: lockId,
    userType: userType,
    keyStatus: keyStatus,
    lockName: lockName,
    lockAlias: lockAlias,
    lockMac: lockMac,
    noKeyPwd: noKeyPwd,
    electricQuantity: electricQuantity,
    startDate: startDate,
    endDate: endDate,
    remarks: remarks,
    keyRight: keyRight,
    featureValue: featureValue,
    remoteEnable: remoteEnable,
    passageMode: passageMode,
    timezoneRawOffset: timezoneRawOffset,
    groupId: groupId,
    groupName: groupName,
    username: username,
    keyName: keyName,
    senderUsername: senderUsername,
    uid: uid,
    sendDate: sendDate,
  );
}
