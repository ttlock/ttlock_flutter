// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credential_enums.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CyclicConfig {

@JsonKey(name: 'weekDay') int get weekDay;@JsonKey(name: 'startTime') int get startTime;@JsonKey(name: 'endTime') int get endTime;
/// Create a copy of CyclicConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CyclicConfigCopyWith<CyclicConfig> get copyWith => _$CyclicConfigCopyWithImpl<CyclicConfig>(this as CyclicConfig, _$identity);

  /// Serializes this CyclicConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CyclicConfig&&(identical(other.weekDay, weekDay) || other.weekDay == weekDay)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekDay,startTime,endTime);

@override
String toString() {
  return 'CyclicConfig(weekDay: $weekDay, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $CyclicConfigCopyWith<$Res>  {
  factory $CyclicConfigCopyWith(CyclicConfig value, $Res Function(CyclicConfig) _then) = _$CyclicConfigCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'weekDay') int weekDay,@JsonKey(name: 'startTime') int startTime,@JsonKey(name: 'endTime') int endTime
});




}
/// @nodoc
class _$CyclicConfigCopyWithImpl<$Res>
    implements $CyclicConfigCopyWith<$Res> {
  _$CyclicConfigCopyWithImpl(this._self, this._then);

  final CyclicConfig _self;
  final $Res Function(CyclicConfig) _then;

/// Create a copy of CyclicConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekDay = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
weekDay: null == weekDay ? _self.weekDay : weekDay // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CyclicConfig].
extension CyclicConfigPatterns on CyclicConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CyclicConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CyclicConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CyclicConfig value)  $default,){
final _that = this;
switch (_that) {
case _CyclicConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CyclicConfig value)?  $default,){
final _that = this;
switch (_that) {
case _CyclicConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'weekDay')  int weekDay, @JsonKey(name: 'startTime')  int startTime, @JsonKey(name: 'endTime')  int endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CyclicConfig() when $default != null:
return $default(_that.weekDay,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'weekDay')  int weekDay, @JsonKey(name: 'startTime')  int startTime, @JsonKey(name: 'endTime')  int endTime)  $default,) {final _that = this;
switch (_that) {
case _CyclicConfig():
return $default(_that.weekDay,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'weekDay')  int weekDay, @JsonKey(name: 'startTime')  int startTime, @JsonKey(name: 'endTime')  int endTime)?  $default,) {final _that = this;
switch (_that) {
case _CyclicConfig() when $default != null:
return $default(_that.weekDay,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CyclicConfig extends CyclicConfig {
  const _CyclicConfig({@JsonKey(name: 'weekDay') this.weekDay = 0, @JsonKey(name: 'startTime') this.startTime = 0, @JsonKey(name: 'endTime') this.endTime = 0}): super._();
  factory _CyclicConfig.fromJson(Map<String, dynamic> json) => _$CyclicConfigFromJson(json);

@override@JsonKey(name: 'weekDay') final  int weekDay;
@override@JsonKey(name: 'startTime') final  int startTime;
@override@JsonKey(name: 'endTime') final  int endTime;

/// Create a copy of CyclicConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CyclicConfigCopyWith<_CyclicConfig> get copyWith => __$CyclicConfigCopyWithImpl<_CyclicConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CyclicConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CyclicConfig&&(identical(other.weekDay, weekDay) || other.weekDay == weekDay)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekDay,startTime,endTime);

@override
String toString() {
  return 'CyclicConfig(weekDay: $weekDay, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$CyclicConfigCopyWith<$Res> implements $CyclicConfigCopyWith<$Res> {
  factory _$CyclicConfigCopyWith(_CyclicConfig value, $Res Function(_CyclicConfig) _then) = __$CyclicConfigCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'weekDay') int weekDay,@JsonKey(name: 'startTime') int startTime,@JsonKey(name: 'endTime') int endTime
});




}
/// @nodoc
class __$CyclicConfigCopyWithImpl<$Res>
    implements _$CyclicConfigCopyWith<$Res> {
  __$CyclicConfigCopyWithImpl(this._self, this._then);

  final _CyclicConfig _self;
  final $Res Function(_CyclicConfig) _then;

/// Create a copy of CyclicConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekDay = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_CyclicConfig(
weekDay: null == weekDay ? _self.weekDay : weekDay // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
