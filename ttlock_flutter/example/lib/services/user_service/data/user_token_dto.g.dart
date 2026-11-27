// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTokenDto _$UserTokenDtoFromJson(Map<String, dynamic> json) =>
    _UserTokenDto(
      accessToken: json['access_token'] as String? ?? '',
      uid: (json['uid'] as num?)?.toInt() ?? 0,
      refreshToken: json['refresh_token'] as String? ?? '',
      expiresIn: (json['expires_in'] as num?)?.toInt() ?? 0,
      errcode: (json['errcode'] as num?)?.toInt() ?? 0,
      errmsg: json['errmsg'] as String? ?? '',
    );

Map<String, dynamic> _$UserTokenDtoToJson(_UserTokenDto instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'uid': instance.uid,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'errcode': instance.errcode,
      'errmsg': instance.errmsg,
    };
