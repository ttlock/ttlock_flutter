// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfigDto {

@JsonKey(name: 'clientId') String get clientId;@JsonKey(name: 'clientSecret') String get clientSecret;@JsonKey(name: 'site') String get site;
/// Create a copy of AppConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigDtoCopyWith<AppConfigDto> get copyWith => _$AppConfigDtoCopyWithImpl<AppConfigDto>(this as AppConfigDto, _$identity);

  /// Serializes this AppConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.site, site) || other.site == site));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,clientSecret,site);

@override
String toString() {
  return 'AppConfigDto(clientId: $clientId, clientSecret: $clientSecret, site: $site)';
}


}

/// @nodoc
abstract mixin class $AppConfigDtoCopyWith<$Res>  {
  factory $AppConfigDtoCopyWith(AppConfigDto value, $Res Function(AppConfigDto) _then) = _$AppConfigDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'clientId') String clientId,@JsonKey(name: 'clientSecret') String clientSecret,@JsonKey(name: 'site') String site
});




}
/// @nodoc
class _$AppConfigDtoCopyWithImpl<$Res>
    implements $AppConfigDtoCopyWith<$Res> {
  _$AppConfigDtoCopyWithImpl(this._self, this._then);

  final AppConfigDto _self;
  final $Res Function(AppConfigDto) _then;

/// Create a copy of AppConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? clientSecret = null,Object? site = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfigDto].
extension AppConfigDtoPatterns on AppConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _AppConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'clientId')  String clientId, @JsonKey(name: 'clientSecret')  String clientSecret, @JsonKey(name: 'site')  String site)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfigDto() when $default != null:
return $default(_that.clientId,_that.clientSecret,_that.site);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'clientId')  String clientId, @JsonKey(name: 'clientSecret')  String clientSecret, @JsonKey(name: 'site')  String site)  $default,) {final _that = this;
switch (_that) {
case _AppConfigDto():
return $default(_that.clientId,_that.clientSecret,_that.site);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'clientId')  String clientId, @JsonKey(name: 'clientSecret')  String clientSecret, @JsonKey(name: 'site')  String site)?  $default,) {final _that = this;
switch (_that) {
case _AppConfigDto() when $default != null:
return $default(_that.clientId,_that.clientSecret,_that.site);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfigDto extends AppConfigDto {
  const _AppConfigDto({@JsonKey(name: 'clientId') this.clientId = '', @JsonKey(name: 'clientSecret') this.clientSecret = '', @JsonKey(name: 'site') this.site = 'cn'}): super._();
  factory _AppConfigDto.fromJson(Map<String, dynamic> json) => _$AppConfigDtoFromJson(json);

@override@JsonKey(name: 'clientId') final  String clientId;
@override@JsonKey(name: 'clientSecret') final  String clientSecret;
@override@JsonKey(name: 'site') final  String site;

/// Create a copy of AppConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigDtoCopyWith<_AppConfigDto> get copyWith => __$AppConfigDtoCopyWithImpl<_AppConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfigDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret)&&(identical(other.site, site) || other.site == site));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,clientSecret,site);

@override
String toString() {
  return 'AppConfigDto(clientId: $clientId, clientSecret: $clientSecret, site: $site)';
}


}

/// @nodoc
abstract mixin class _$AppConfigDtoCopyWith<$Res> implements $AppConfigDtoCopyWith<$Res> {
  factory _$AppConfigDtoCopyWith(_AppConfigDto value, $Res Function(_AppConfigDto) _then) = __$AppConfigDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'clientId') String clientId,@JsonKey(name: 'clientSecret') String clientSecret,@JsonKey(name: 'site') String site
});




}
/// @nodoc
class __$AppConfigDtoCopyWithImpl<$Res>
    implements _$AppConfigDtoCopyWith<$Res> {
  __$AppConfigDtoCopyWithImpl(this._self, this._then);

  final _AppConfigDto _self;
  final $Res Function(_AppConfigDto) _then;

/// Create a copy of AppConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? clientSecret = null,Object? site = null,}) {
  return _then(_AppConfigDto(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
