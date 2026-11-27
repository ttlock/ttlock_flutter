// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wireless_keypad_upgrade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WirelessKeypadUpgradeCheck {

 bool get needUpgrade;/// 最新固件版本号；`needUpgrade` 为 false 时通常为空串。
 String get version;
/// Create a copy of WirelessKeypadUpgradeCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WirelessKeypadUpgradeCheckCopyWith<WirelessKeypadUpgradeCheck> get copyWith => _$WirelessKeypadUpgradeCheckCopyWithImpl<WirelessKeypadUpgradeCheck>(this as WirelessKeypadUpgradeCheck, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WirelessKeypadUpgradeCheck&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,needUpgrade,version);

@override
String toString() {
  return 'WirelessKeypadUpgradeCheck(needUpgrade: $needUpgrade, version: $version)';
}


}

/// @nodoc
abstract mixin class $WirelessKeypadUpgradeCheckCopyWith<$Res>  {
  factory $WirelessKeypadUpgradeCheckCopyWith(WirelessKeypadUpgradeCheck value, $Res Function(WirelessKeypadUpgradeCheck) _then) = _$WirelessKeypadUpgradeCheckCopyWithImpl;
@useResult
$Res call({
 bool needUpgrade, String version
});




}
/// @nodoc
class _$WirelessKeypadUpgradeCheckCopyWithImpl<$Res>
    implements $WirelessKeypadUpgradeCheckCopyWith<$Res> {
  _$WirelessKeypadUpgradeCheckCopyWithImpl(this._self, this._then);

  final WirelessKeypadUpgradeCheck _self;
  final $Res Function(WirelessKeypadUpgradeCheck) _then;

/// Create a copy of WirelessKeypadUpgradeCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needUpgrade = null,Object? version = null,}) {
  return _then(_self.copyWith(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WirelessKeypadUpgradeCheck].
extension WirelessKeypadUpgradeCheckPatterns on WirelessKeypadUpgradeCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WirelessKeypadUpgradeCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WirelessKeypadUpgradeCheck value)  $default,){
final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WirelessKeypadUpgradeCheck value)?  $default,){
final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool needUpgrade,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheck() when $default != null:
return $default(_that.needUpgrade,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool needUpgrade,  String version)  $default,) {final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheck():
return $default(_that.needUpgrade,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool needUpgrade,  String version)?  $default,) {final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheck() when $default != null:
return $default(_that.needUpgrade,_that.version);case _:
  return null;

}
}

}

/// @nodoc


class _WirelessKeypadUpgradeCheck implements WirelessKeypadUpgradeCheck {
  const _WirelessKeypadUpgradeCheck({this.needUpgrade = false, this.version = ''});
  

@override@JsonKey() final  bool needUpgrade;
/// 最新固件版本号；`needUpgrade` 为 false 时通常为空串。
@override@JsonKey() final  String version;

/// Create a copy of WirelessKeypadUpgradeCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WirelessKeypadUpgradeCheckCopyWith<_WirelessKeypadUpgradeCheck> get copyWith => __$WirelessKeypadUpgradeCheckCopyWithImpl<_WirelessKeypadUpgradeCheck>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WirelessKeypadUpgradeCheck&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,needUpgrade,version);

@override
String toString() {
  return 'WirelessKeypadUpgradeCheck(needUpgrade: $needUpgrade, version: $version)';
}


}

/// @nodoc
abstract mixin class _$WirelessKeypadUpgradeCheckCopyWith<$Res> implements $WirelessKeypadUpgradeCheckCopyWith<$Res> {
  factory _$WirelessKeypadUpgradeCheckCopyWith(_WirelessKeypadUpgradeCheck value, $Res Function(_WirelessKeypadUpgradeCheck) _then) = __$WirelessKeypadUpgradeCheckCopyWithImpl;
@override @useResult
$Res call({
 bool needUpgrade, String version
});




}
/// @nodoc
class __$WirelessKeypadUpgradeCheckCopyWithImpl<$Res>
    implements _$WirelessKeypadUpgradeCheckCopyWith<$Res> {
  __$WirelessKeypadUpgradeCheckCopyWithImpl(this._self, this._then);

  final _WirelessKeypadUpgradeCheck _self;
  final $Res Function(_WirelessKeypadUpgradeCheck) _then;

/// Create a copy of WirelessKeypadUpgradeCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? version = null,}) {
  return _then(_WirelessKeypadUpgradeCheck(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as bool,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
