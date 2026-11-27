// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserListItemDto {

@JsonKey(name: 'username') String get username;@JsonKey(name: 'regtime') int get regtime;
/// Create a copy of UserListItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListItemDtoCopyWith<UserListItemDto> get copyWith => _$UserListItemDtoCopyWithImpl<UserListItemDto>(this as UserListItemDto, _$identity);

  /// Serializes this UserListItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListItemDto&&(identical(other.username, username) || other.username == username)&&(identical(other.regtime, regtime) || other.regtime == regtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,regtime);

@override
String toString() {
  return 'UserListItemDto(username: $username, regtime: $regtime)';
}


}

/// @nodoc
abstract mixin class $UserListItemDtoCopyWith<$Res>  {
  factory $UserListItemDtoCopyWith(UserListItemDto value, $Res Function(UserListItemDto) _then) = _$UserListItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'username') String username,@JsonKey(name: 'regtime') int regtime
});




}
/// @nodoc
class _$UserListItemDtoCopyWithImpl<$Res>
    implements $UserListItemDtoCopyWith<$Res> {
  _$UserListItemDtoCopyWithImpl(this._self, this._then);

  final UserListItemDto _self;
  final $Res Function(UserListItemDto) _then;

/// Create a copy of UserListItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? regtime = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,regtime: null == regtime ? _self.regtime : regtime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserListItemDto].
extension UserListItemDtoPatterns on UserListItemDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserListItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserListItemDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserListItemDto value)  $default,){
final _that = this;
switch (_that) {
case _UserListItemDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserListItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserListItemDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'regtime')  int regtime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserListItemDto() when $default != null:
return $default(_that.username,_that.regtime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'regtime')  int regtime)  $default,) {final _that = this;
switch (_that) {
case _UserListItemDto():
return $default(_that.username,_that.regtime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'regtime')  int regtime)?  $default,) {final _that = this;
switch (_that) {
case _UserListItemDto() when $default != null:
return $default(_that.username,_that.regtime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserListItemDto extends UserListItemDto {
  const _UserListItemDto({@JsonKey(name: 'username') this.username = '', @JsonKey(name: 'regtime') this.regtime = 0}): super._();
  factory _UserListItemDto.fromJson(Map<String, dynamic> json) => _$UserListItemDtoFromJson(json);

@override@JsonKey(name: 'username') final  String username;
@override@JsonKey(name: 'regtime') final  int regtime;

/// Create a copy of UserListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListItemDtoCopyWith<_UserListItemDto> get copyWith => __$UserListItemDtoCopyWithImpl<_UserListItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserListItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListItemDto&&(identical(other.username, username) || other.username == username)&&(identical(other.regtime, regtime) || other.regtime == regtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,regtime);

@override
String toString() {
  return 'UserListItemDto(username: $username, regtime: $regtime)';
}


}

/// @nodoc
abstract mixin class _$UserListItemDtoCopyWith<$Res> implements $UserListItemDtoCopyWith<$Res> {
  factory _$UserListItemDtoCopyWith(_UserListItemDto value, $Res Function(_UserListItemDto) _then) = __$UserListItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'username') String username,@JsonKey(name: 'regtime') int regtime
});




}
/// @nodoc
class __$UserListItemDtoCopyWithImpl<$Res>
    implements _$UserListItemDtoCopyWith<$Res> {
  __$UserListItemDtoCopyWithImpl(this._self, this._then);

  final _UserListItemDto _self;
  final $Res Function(_UserListItemDto) _then;

/// Create a copy of UserListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? regtime = null,}) {
  return _then(_UserListItemDto(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,regtime: null == regtime ? _self.regtime : regtime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UserListDto {

@JsonKey(name: 'list') List<UserListItemDto> get list;@JsonKey(name: 'pageNo') int get pageNo;@JsonKey(name: 'pageSize') int get pageSize;@JsonKey(name: 'pages') int get pages;@JsonKey(name: 'total') int get total;
/// Create a copy of UserListDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListDtoCopyWith<UserListDto> get copyWith => _$UserListDtoCopyWithImpl<UserListDto>(this as UserListDto, _$identity);

  /// Serializes this UserListDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListDto&&const DeepCollectionEquality().equals(other.list, list)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list),pageNo,pageSize,pages,total);

@override
String toString() {
  return 'UserListDto(list: $list, pageNo: $pageNo, pageSize: $pageSize, pages: $pages, total: $total)';
}


}

/// @nodoc
abstract mixin class $UserListDtoCopyWith<$Res>  {
  factory $UserListDtoCopyWith(UserListDto value, $Res Function(UserListDto) _then) = _$UserListDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'list') List<UserListItemDto> list,@JsonKey(name: 'pageNo') int pageNo,@JsonKey(name: 'pageSize') int pageSize,@JsonKey(name: 'pages') int pages,@JsonKey(name: 'total') int total
});




}
/// @nodoc
class _$UserListDtoCopyWithImpl<$Res>
    implements $UserListDtoCopyWith<$Res> {
  _$UserListDtoCopyWithImpl(this._self, this._then);

  final UserListDto _self;
  final $Res Function(UserListDto) _then;

/// Create a copy of UserListDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? pageNo = null,Object? pageSize = null,Object? pages = null,Object? total = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<UserListItemDto>,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserListDto].
extension UserListDtoPatterns on UserListDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserListDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserListDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserListDto value)  $default,){
final _that = this;
switch (_that) {
case _UserListDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserListDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserListDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'list')  List<UserListItemDto> list, @JsonKey(name: 'pageNo')  int pageNo, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'pages')  int pages, @JsonKey(name: 'total')  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserListDto() when $default != null:
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'list')  List<UserListItemDto> list, @JsonKey(name: 'pageNo')  int pageNo, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'pages')  int pages, @JsonKey(name: 'total')  int total)  $default,) {final _that = this;
switch (_that) {
case _UserListDto():
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'list')  List<UserListItemDto> list, @JsonKey(name: 'pageNo')  int pageNo, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'pages')  int pages, @JsonKey(name: 'total')  int total)?  $default,) {final _that = this;
switch (_that) {
case _UserListDto() when $default != null:
return $default(_that.list,_that.pageNo,_that.pageSize,_that.pages,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserListDto extends UserListDto {
  const _UserListDto({@JsonKey(name: 'list') final  List<UserListItemDto> list = const [], @JsonKey(name: 'pageNo') this.pageNo = 1, @JsonKey(name: 'pageSize') this.pageSize = 20, @JsonKey(name: 'pages') this.pages = 0, @JsonKey(name: 'total') this.total = 0}): _list = list,super._();
  factory _UserListDto.fromJson(Map<String, dynamic> json) => _$UserListDtoFromJson(json);

 final  List<UserListItemDto> _list;
@override@JsonKey(name: 'list') List<UserListItemDto> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey(name: 'pageNo') final  int pageNo;
@override@JsonKey(name: 'pageSize') final  int pageSize;
@override@JsonKey(name: 'pages') final  int pages;
@override@JsonKey(name: 'total') final  int total;

/// Create a copy of UserListDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserListDtoCopyWith<_UserListDto> get copyWith => __$UserListDtoCopyWithImpl<_UserListDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserListDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserListDto&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),pageNo,pageSize,pages,total);

@override
String toString() {
  return 'UserListDto(list: $list, pageNo: $pageNo, pageSize: $pageSize, pages: $pages, total: $total)';
}


}

/// @nodoc
abstract mixin class _$UserListDtoCopyWith<$Res> implements $UserListDtoCopyWith<$Res> {
  factory _$UserListDtoCopyWith(_UserListDto value, $Res Function(_UserListDto) _then) = __$UserListDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'list') List<UserListItemDto> list,@JsonKey(name: 'pageNo') int pageNo,@JsonKey(name: 'pageSize') int pageSize,@JsonKey(name: 'pages') int pages,@JsonKey(name: 'total') int total
});




}
/// @nodoc
class __$UserListDtoCopyWithImpl<$Res>
    implements _$UserListDtoCopyWith<$Res> {
  __$UserListDtoCopyWithImpl(this._self, this._then);

  final _UserListDto _self;
  final $Res Function(_UserListDto) _then;

/// Create a copy of UserListDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? pageNo = null,Object? pageSize = null,Object? pages = null,Object? total = null,}) {
  return _then(_UserListDto(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<UserListItemDto>,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
