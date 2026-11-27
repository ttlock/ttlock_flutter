// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';

part 'user_token_dto.freezed.dart';
part 'user_token_dto.g.dart';

@freezed
abstract class UserTokenDto with _$UserTokenDto {
  const UserTokenDto._();
  const factory UserTokenDto({
    @JsonKey(name: 'access_token') @Default('') String accessToken,
    @JsonKey(name: 'uid') @Default(0) int uid,
    @JsonKey(name: 'refresh_token') @Default('') String refreshToken,
    @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
    @JsonKey(name: 'errcode') @Default(0) int errcode,
    @JsonKey(name: 'errmsg') @Default('') String errmsg,
  }) = _UserTokenDto;

  factory UserTokenDto.fromJson(Map<String, dynamic> json) =>
      _$UserTokenDtoFromJson(json);

  UserSession toEntity({String loginName = ''}) => UserSession(
    accessToken: accessToken,
    refreshToken: refreshToken,
    uid: uid,
    expiresIn: expiresIn,
    loginName: loginName,
    obtainedAt: DateTime.now().millisecondsSinceEpoch,
  );
}
