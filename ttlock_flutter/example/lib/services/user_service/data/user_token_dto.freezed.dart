// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTokenDto {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'uid') int get uid;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'expires_in') int get expiresIn;@JsonKey(name: 'errcode') int get errcode;@JsonKey(name: 'errmsg') String get errmsg;
/// Create a copy of UserTokenDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTokenDtoCopyWith<UserTokenDto> get copyWith => _$UserTokenDtoCopyWithImpl<UserTokenDto>(this as UserTokenDto, _$identity);

  /// Serializes this UserTokenDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTokenDto&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.errcode, errcode) || other.errcode == errcode)&&(identical(other.errmsg, errmsg) || other.errmsg == errmsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,uid,refreshToken,expiresIn,errcode,errmsg);

@override
String toString() {
  return 'UserTokenDto(accessToken: $accessToken, uid: $uid, refreshToken: $refreshToken, expiresIn: $expiresIn, errcode: $errcode, errmsg: $errmsg)';
}


}

/// @nodoc
abstract mixin class $UserTokenDtoCopyWith<$Res>  {
  factory $UserTokenDtoCopyWith(UserTokenDto value, $Res Function(UserTokenDto) _then) = _$UserTokenDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'uid') int uid,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'errcode') int errcode,@JsonKey(name: 'errmsg') String errmsg
});




}
/// @nodoc
class _$UserTokenDtoCopyWithImpl<$Res>
    implements $UserTokenDtoCopyWith<$Res> {
  _$UserTokenDtoCopyWithImpl(this._self, this._then);

  final UserTokenDto _self;
  final $Res Function(UserTokenDto) _then;

/// Create a copy of UserTokenDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? uid = null,Object? refreshToken = null,Object? expiresIn = null,Object? errcode = null,Object? errmsg = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,errcode: null == errcode ? _self.errcode : errcode // ignore: cast_nullable_to_non_nullable
as int,errmsg: null == errmsg ? _self.errmsg : errmsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserTokenDto].
extension UserTokenDtoPatterns on UserTokenDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTokenDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTokenDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTokenDto value)  $default,){
final _that = this;
switch (_that) {
case _UserTokenDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTokenDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserTokenDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'uid')  int uid, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTokenDto() when $default != null:
return $default(_that.accessToken,_that.uid,_that.refreshToken,_that.expiresIn,_that.errcode,_that.errmsg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'uid')  int uid, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg)  $default,) {final _that = this;
switch (_that) {
case _UserTokenDto():
return $default(_that.accessToken,_that.uid,_that.refreshToken,_that.expiresIn,_that.errcode,_that.errmsg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'uid')  int uid, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'errcode')  int errcode, @JsonKey(name: 'errmsg')  String errmsg)?  $default,) {final _that = this;
switch (_that) {
case _UserTokenDto() when $default != null:
return $default(_that.accessToken,_that.uid,_that.refreshToken,_that.expiresIn,_that.errcode,_that.errmsg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTokenDto extends UserTokenDto {
  const _UserTokenDto({@JsonKey(name: 'access_token') this.accessToken = '', @JsonKey(name: 'uid') this.uid = 0, @JsonKey(name: 'refresh_token') this.refreshToken = '', @JsonKey(name: 'expires_in') this.expiresIn = 0, @JsonKey(name: 'errcode') this.errcode = 0, @JsonKey(name: 'errmsg') this.errmsg = ''}): super._();
  factory _UserTokenDto.fromJson(Map<String, dynamic> json) => _$UserTokenDtoFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'uid') final  int uid;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override@JsonKey(name: 'errcode') final  int errcode;
@override@JsonKey(name: 'errmsg') final  String errmsg;

/// Create a copy of UserTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTokenDtoCopyWith<_UserTokenDto> get copyWith => __$UserTokenDtoCopyWithImpl<_UserTokenDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTokenDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTokenDto&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.errcode, errcode) || other.errcode == errcode)&&(identical(other.errmsg, errmsg) || other.errmsg == errmsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,uid,refreshToken,expiresIn,errcode,errmsg);

@override
String toString() {
  return 'UserTokenDto(accessToken: $accessToken, uid: $uid, refreshToken: $refreshToken, expiresIn: $expiresIn, errcode: $errcode, errmsg: $errmsg)';
}


}

/// @nodoc
abstract mixin class _$UserTokenDtoCopyWith<$Res> implements $UserTokenDtoCopyWith<$Res> {
  factory _$UserTokenDtoCopyWith(_UserTokenDto value, $Res Function(_UserTokenDto) _then) = __$UserTokenDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'uid') int uid,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'errcode') int errcode,@JsonKey(name: 'errmsg') String errmsg
});




}
/// @nodoc
class __$UserTokenDtoCopyWithImpl<$Res>
    implements _$UserTokenDtoCopyWith<$Res> {
  __$UserTokenDtoCopyWithImpl(this._self, this._then);

  final _UserTokenDto _self;
  final $Res Function(_UserTokenDto) _then;

/// Create a copy of UserTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? uid = null,Object? refreshToken = null,Object? expiresIn = null,Object? errcode = null,Object? errmsg = null,}) {
  return _then(_UserTokenDto(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,errcode: null == errcode ? _self.errcode : errcode // ignore: cast_nullable_to_non_nullable
as int,errmsg: null == errmsg ? _self.errmsg : errmsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
