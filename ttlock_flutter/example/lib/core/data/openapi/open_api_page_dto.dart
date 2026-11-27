// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_api_page_dto.freezed.dart';
part 'open_api_page_dto.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class OpenApiPageDto<T> with _$OpenApiPageDto<T> {
  const OpenApiPageDto._();
  const factory OpenApiPageDto({
    @JsonKey(name: 'list') @Default([]) List<T> list,
    @JsonKey(name: 'pageNo') @Default(1) int pageNo,
    @JsonKey(name: 'pageSize') @Default(20) int pageSize,
    @JsonKey(name: 'pages') @Default(0) int pages,
    @JsonKey(name: 'total') @Default(0) int total,
  }) = _OpenApiPageDto<T>;

  factory OpenApiPageDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) itemFromJson,
  ) => _$OpenApiPageDtoFromJson(json, itemFromJson);
}
