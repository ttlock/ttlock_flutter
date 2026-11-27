// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_encoder_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotelInfoDto {

@JsonKey(name: 'hotelInfo') String get hotelInfo;
/// Create a copy of HotelInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelInfoDtoCopyWith<HotelInfoDto> get copyWith => _$HotelInfoDtoCopyWithImpl<HotelInfoDto>(this as HotelInfoDto, _$identity);

  /// Serializes this HotelInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelInfoDto&&(identical(other.hotelInfo, hotelInfo) || other.hotelInfo == hotelInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelInfo);

@override
String toString() {
  return 'HotelInfoDto(hotelInfo: $hotelInfo)';
}


}

/// @nodoc
abstract mixin class $HotelInfoDtoCopyWith<$Res>  {
  factory $HotelInfoDtoCopyWith(HotelInfoDto value, $Res Function(HotelInfoDto) _then) = _$HotelInfoDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'hotelInfo') String hotelInfo
});




}
/// @nodoc
class _$HotelInfoDtoCopyWithImpl<$Res>
    implements $HotelInfoDtoCopyWith<$Res> {
  _$HotelInfoDtoCopyWithImpl(this._self, this._then);

  final HotelInfoDto _self;
  final $Res Function(HotelInfoDto) _then;

/// Create a copy of HotelInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hotelInfo = null,}) {
  return _then(_self.copyWith(
hotelInfo: null == hotelInfo ? _self.hotelInfo : hotelInfo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelInfoDto].
extension HotelInfoDtoPatterns on HotelInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _HotelInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _HotelInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotelInfo')  String hotelInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelInfoDto() when $default != null:
return $default(_that.hotelInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'hotelInfo')  String hotelInfo)  $default,) {final _that = this;
switch (_that) {
case _HotelInfoDto():
return $default(_that.hotelInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'hotelInfo')  String hotelInfo)?  $default,) {final _that = this;
switch (_that) {
case _HotelInfoDto() when $default != null:
return $default(_that.hotelInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotelInfoDto extends HotelInfoDto {
  const _HotelInfoDto({@JsonKey(name: 'hotelInfo') this.hotelInfo = ''}): super._();
  factory _HotelInfoDto.fromJson(Map<String, dynamic> json) => _$HotelInfoDtoFromJson(json);

@override@JsonKey(name: 'hotelInfo') final  String hotelInfo;

/// Create a copy of HotelInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelInfoDtoCopyWith<_HotelInfoDto> get copyWith => __$HotelInfoDtoCopyWithImpl<_HotelInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelInfoDto&&(identical(other.hotelInfo, hotelInfo) || other.hotelInfo == hotelInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hotelInfo);

@override
String toString() {
  return 'HotelInfoDto(hotelInfo: $hotelInfo)';
}


}

/// @nodoc
abstract mixin class _$HotelInfoDtoCopyWith<$Res> implements $HotelInfoDtoCopyWith<$Res> {
  factory _$HotelInfoDtoCopyWith(_HotelInfoDto value, $Res Function(_HotelInfoDto) _then) = __$HotelInfoDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'hotelInfo') String hotelInfo
});




}
/// @nodoc
class __$HotelInfoDtoCopyWithImpl<$Res>
    implements _$HotelInfoDtoCopyWith<$Res> {
  __$HotelInfoDtoCopyWithImpl(this._self, this._then);

  final _HotelInfoDto _self;
  final $Res Function(_HotelInfoDto) _then;

/// Create a copy of HotelInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hotelInfo = null,}) {
  return _then(_HotelInfoDto(
hotelInfo: null == hotelInfo ? _self.hotelInfo : hotelInfo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$IcKeyDto {

@JsonKey(name: 'icKey') String get icKey;
/// Create a copy of IcKeyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IcKeyDtoCopyWith<IcKeyDto> get copyWith => _$IcKeyDtoCopyWithImpl<IcKeyDto>(this as IcKeyDto, _$identity);

  /// Serializes this IcKeyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IcKeyDto&&(identical(other.icKey, icKey) || other.icKey == icKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icKey);

@override
String toString() {
  return 'IcKeyDto(icKey: $icKey)';
}


}

/// @nodoc
abstract mixin class $IcKeyDtoCopyWith<$Res>  {
  factory $IcKeyDtoCopyWith(IcKeyDto value, $Res Function(IcKeyDto) _then) = _$IcKeyDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'icKey') String icKey
});




}
/// @nodoc
class _$IcKeyDtoCopyWithImpl<$Res>
    implements $IcKeyDtoCopyWith<$Res> {
  _$IcKeyDtoCopyWithImpl(this._self, this._then);

  final IcKeyDto _self;
  final $Res Function(IcKeyDto) _then;

/// Create a copy of IcKeyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icKey = null,}) {
  return _then(_self.copyWith(
icKey: null == icKey ? _self.icKey : icKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IcKeyDto].
extension IcKeyDtoPatterns on IcKeyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IcKeyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IcKeyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IcKeyDto value)  $default,){
final _that = this;
switch (_that) {
case _IcKeyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IcKeyDto value)?  $default,){
final _that = this;
switch (_that) {
case _IcKeyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'icKey')  String icKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IcKeyDto() when $default != null:
return $default(_that.icKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'icKey')  String icKey)  $default,) {final _that = this;
switch (_that) {
case _IcKeyDto():
return $default(_that.icKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'icKey')  String icKey)?  $default,) {final _that = this;
switch (_that) {
case _IcKeyDto() when $default != null:
return $default(_that.icKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IcKeyDto extends IcKeyDto {
  const _IcKeyDto({@JsonKey(name: 'icKey') this.icKey = ''}): super._();
  factory _IcKeyDto.fromJson(Map<String, dynamic> json) => _$IcKeyDtoFromJson(json);

@override@JsonKey(name: 'icKey') final  String icKey;

/// Create a copy of IcKeyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IcKeyDtoCopyWith<_IcKeyDto> get copyWith => __$IcKeyDtoCopyWithImpl<_IcKeyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IcKeyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IcKeyDto&&(identical(other.icKey, icKey) || other.icKey == icKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icKey);

@override
String toString() {
  return 'IcKeyDto(icKey: $icKey)';
}


}

/// @nodoc
abstract mixin class _$IcKeyDtoCopyWith<$Res> implements $IcKeyDtoCopyWith<$Res> {
  factory _$IcKeyDtoCopyWith(_IcKeyDto value, $Res Function(_IcKeyDto) _then) = __$IcKeyDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'icKey') String icKey
});




}
/// @nodoc
class __$IcKeyDtoCopyWithImpl<$Res>
    implements _$IcKeyDtoCopyWith<$Res> {
  __$IcKeyDtoCopyWithImpl(this._self, this._then);

  final _IcKeyDto _self;
  final $Res Function(_IcKeyDto) _then;

/// Create a copy of IcKeyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icKey = null,}) {
  return _then(_IcKeyDto(
icKey: null == icKey ? _self.icKey : icKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
