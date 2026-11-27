// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserListItemDto _$UserListItemDtoFromJson(Map<String, dynamic> json) =>
    _UserListItemDto(
      username: json['username'] as String? ?? '',
      regtime: (json['regtime'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserListItemDtoToJson(_UserListItemDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'regtime': instance.regtime,
    };

_UserListDto _$UserListDtoFromJson(Map<String, dynamic> json) => _UserListDto(
  list:
      (json['list'] as List<dynamic>?)
          ?.map((e) => UserListItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pageNo: (json['pageNo'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
  pages: (json['pages'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserListDtoToJson(_UserListDto instance) =>
    <String, dynamic>{
      'list': instance.list,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'pages': instance.pages,
      'total': instance.total,
    };
