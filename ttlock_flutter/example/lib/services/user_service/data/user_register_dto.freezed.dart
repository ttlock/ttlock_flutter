// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRegisterDto {

@JsonKey(name: 'username') String get username;@JsonKey(name: 'errcode') int get errcode;@JsonKey(name: 'errmsg') String get errmsg;
/// Create a copy of UserRegisterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRegisterDtoCopyWith<UserRegisterDto> get copyWith => _$UserRegisterDtoCopyWithImpl<UserRegisterDto>(this as UserRegisterDto, _$identity);

  /// Serializes this UserRegisterDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterDto&&(identical(other.username, username) || other.username == username)&&(identical(other.errcode, errcode) || other.errcode == errcode)&&(identical(other.errmsg, errmsg) || other.errmsg == errmsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,errcode,errmsg);

@override
String toString() {
  return 'UserRegisterDto(username: $username, errcode: $errcode, errmsg: $errmsg)';
}


}

/// @nodoc
abstract mixin class $UserRegisterDtoCopyWith<$Res>  {
  factory $UserRegisterDtoCopyWith(UserRegisterDto value, $Res Function(UserRegisterDto) _then) = _$UserRegisterDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'username') String username,@JsonKey(name: 'errcode') int errcode,@JsonKey(name: 'errmsg') String errmsg
});




}
/// @nodoc
class _$UserRegisterDtoCopyWithImpl<$Res>
    implements $UserRegisterDtoCopyWith<$Res> {
  _$UserRegisterDtoCopyWithImpl(this._self, this._then);

  final UserRegisterDto _self;
  final $Res Function(UserRegisterDto) _then;

/// Create a copy of UserRegisterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? errcode = null,Object? errmsg = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,errcode: null == errcode ? _self.errcode : errcode // ignore: cast_nullable_to_non_nullable
as int,errmsg: null == errmsg ? _self.errmsg : errmsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRegisterDto].
extension UserRegisterDtoPatterns on UserRegisterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRegisterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRegisterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRegisterDto value)  $default,){
final _that = this;
switch (_that) {
case _UserRegisterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRegisterDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserRegisterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRegisterDto() when $default != null:
return $default(_that.username,_that.errcode,_that.errmsg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg)  $default,) {final _that = this;
switch (_that) {
case _UserRegisterDto():
return $default(_that.username,_that.errcode,_that.errmsg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'username')  String username, @JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg)?  $default,) {final _that = this;
switch (_that) {
case _UserRegisterDto() when $default != null:
return $default(_that.username,_that.errcode,_that.errmsg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRegisterDto extends UserRegisterDto {
  const _UserRegisterDto({@JsonKey(name: 'username') this.username = '', @JsonKey(name: 'errcode') this.errcode = 0, @JsonKey(name: 'errmsg') this.errmsg = ''}): super._();
  factory _UserRegisterDto.fromJson(Map<String, dynamic> json) => _$UserRegisterDtoFromJson(json);

@override@JsonKey(name: 'username') final  String username;
@override@JsonKey(name: 'errcode') final  int errcode;
@override@JsonKey(name: 'errmsg') final  String errmsg;

/// Create a copy of UserRegisterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRegisterDtoCopyWith<_UserRegisterDto> get copyWith => __$UserRegisterDtoCopyWithImpl<_UserRegisterDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRegisterDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRegisterDto&&(identical(other.username, username) || other.username == username)&&(identical(other.errcode, errcode) || other.errcode == errcode)&&(identical(other.errmsg, errmsg) || other.errmsg == errmsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,errcode,errmsg);

@override
String toString() {
  return 'UserRegisterDto(username: $username, errcode: $errcode, errmsg: $errmsg)';
}


}

/// @nodoc
abstract mixin class _$UserRegisterDtoCopyWith<$Res> implements $UserRegisterDtoCopyWith<$Res> {
  factory _$UserRegisterDtoCopyWith(_UserRegisterDto value, $Res Function(_UserRegisterDto) _then) = __$UserRegisterDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'username') String username,@JsonKey(name: 'errcode') int errcode,@JsonKey(name: 'errmsg') String errmsg
});




}
/// @nodoc
class __$UserRegisterDtoCopyWithImpl<$Res>
    implements _$UserRegisterDtoCopyWith<$Res> {
  __$UserRegisterDtoCopyWithImpl(this._self, this._then);

  final _UserRegisterDto _self;
  final $Res Function(_UserRegisterDto) _then;

/// Create a copy of UserRegisterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? errcode = null,Object? errmsg = null,}) {
  return _then(_UserRegisterDto(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,errcode: null == errcode ? _self.errcode : errcode // ignore: cast_nullable_to_non_nullable
as int,errmsg: null == errmsg ? _self.errmsg : errmsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
