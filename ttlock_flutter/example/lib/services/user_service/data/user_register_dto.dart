// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_dto.freezed.dart';
part 'user_register_dto.g.dart';

@freezed
abstract class UserRegisterDto with _$UserRegisterDto {
  const UserRegisterDto._();
  const factory UserRegisterDto({
    @JsonKey(name: 'username') @Default('') String username,
    @JsonKey(name: 'errcode') @Default(0) int errcode,
    @JsonKey(name: 'errmsg') @Default('') String errmsg,
  }) = _UserRegisterDto;

  factory UserRegisterDto.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterDtoFromJson(json);
}
