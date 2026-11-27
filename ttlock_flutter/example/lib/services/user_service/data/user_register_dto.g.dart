// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRegisterDto _$UserRegisterDtoFromJson(Map<String, dynamic> json) =>
    _UserRegisterDto(
      username: json['username'] as String? ?? '',
      errcode: (json['errcode'] as num?)?.toInt() ?? 0,
      errmsg: json['errmsg'] as String? ?? '',
    );

Map<String, dynamic> _$UserRegisterDtoToJson(_UserRegisterDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'errcode': instance.errcode,
      'errmsg': instance.errmsg,
    };
