// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

part 'keyboard_pwd_dto.freezed.dart';
part 'keyboard_pwd_dto.g.dart';

@freezed
abstract class KeyboardPwdDto with _$KeyboardPwdDto {
  const KeyboardPwdDto._();
  const factory KeyboardPwdDto({
    @JsonKey(name: 'keyboardPwdId', fromJson: intFromDynamic)
    @Default(0)
    int keyboardPwdId,
    @JsonKey(name: 'lockId', fromJson: intFromDynamic) @Default(0) int lockId,
    @JsonKey(name: 'keyboardPwd') @Default('') String keyboardPwd,
    @JsonKey(name: 'keyboardPwdName') @Default('') String keyboardPwdName,
    @JsonKey(name: 'keyboardPwdType', fromJson: intFromDynamic)
    @Default(3)
    int keyboardPwdType,
    @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? startDate,
    @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? endDate,
    @JsonKey(name: 'sendDate', fromJson: nullableDateTimeMsFromJson)
    DateTime? sendDate,
    @JsonKey(name: 'isCustom', fromJson: boolFromDynamic)
    @Default(false)
    bool isCustom,
    @JsonKey(name: 'senderUsername') @Default('') String senderUsername,
  }) = _KeyboardPwdDto;

  factory KeyboardPwdDto.fromJson(Map<String, dynamic> json) =>
      _$KeyboardPwdDtoFromJson(json);

  KeyboardPwdEntity toEntity() => KeyboardPwdEntity(
    keyboardPwdId: keyboardPwdId,
    lockId: lockId,
    keyboardPwd: keyboardPwd,
    keyboardPwdName: keyboardPwdName,
    keyboardPwdType: KeyboardPwdType.fromValue(keyboardPwdType),
    startDate: startDate,
    endDate: endDate,
    sendDate: sendDate,
    isCustom: isCustom,
    senderUsername: senderUsername,
  );
}
