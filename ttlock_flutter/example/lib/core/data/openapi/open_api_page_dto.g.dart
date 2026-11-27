// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_api_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpenApiPageDto<T> _$OpenApiPageDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _OpenApiPageDto<T>(
  list: (json['list'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
  pageNo: (json['pageNo'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
  pages: (json['pages'] as num?)?.toInt() ?? 0,
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$OpenApiPageDtoToJson<T>(
  _OpenApiPageDto<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'list': instance.list.map(toJsonT).toList(),
  'pageNo': instance.pageNo,
  'pageSize': instance.pageSize,
  'pages': instance.pages,
  'total': instance.total,
};
