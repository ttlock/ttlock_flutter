// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/services/user_service/domain/user.dart';

part 'user_list_dto.freezed.dart';
part 'user_list_dto.g.dart';

@freezed
abstract class UserListItemDto with _$UserListItemDto {
  const UserListItemDto._();
  const factory UserListItemDto({
    @JsonKey(name: 'username') @Default('') String username,
    @JsonKey(name: 'regtime') @Default(0) int regtime,
  }) = _UserListItemDto;

  factory UserListItemDto.fromJson(Map<String, dynamic> json) =>
      _$UserListItemDtoFromJson(json);

  CloudUser toEntity() => CloudUser(username: username, registeredAt: regtime);
}

@freezed
abstract class UserListDto with _$UserListDto {
  const UserListDto._();
  const factory UserListDto({
    @JsonKey(name: 'list') @Default([]) List<UserListItemDto> list,
    @JsonKey(name: 'pageNo') @Default(1) int pageNo,
    @JsonKey(name: 'pageSize') @Default(20) int pageSize,
    @JsonKey(name: 'pages') @Default(0) int pages,
    @JsonKey(name: 'total') @Default(0) int total,
  }) = _UserListDto;

  factory UserListDto.fromJson(Map<String, dynamic> json) =>
      _$UserListDtoFromJson(json);

  CloudUserPage toEntity() => CloudUserPage(
    list: list.map((e) => e.toEntity()).toList(),
    pageNo: pageNo,
    pageSize: pageSize,
    pages: pages,
    total: total,
  );
}
