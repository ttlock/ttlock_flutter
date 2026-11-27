// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mine_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MineState {

 String get userName; String get siteLabel; String get version;
/// Create a copy of MineState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MineStateCopyWith<MineState> get copyWith => _$MineStateCopyWithImpl<MineState>(this as MineState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MineState&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.siteLabel, siteLabel) || other.siteLabel == siteLabel)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,userName,siteLabel,version);

@override
String toString() {
  return 'MineState(userName: $userName, siteLabel: $siteLabel, version: $version)';
}


}

/// @nodoc
abstract mixin class $MineStateCopyWith<$Res>  {
  factory $MineStateCopyWith(MineState value, $Res Function(MineState) _then) = _$MineStateCopyWithImpl;
@useResult
$Res call({
 String userName, String siteLabel, String version
});




}
/// @nodoc
class _$MineStateCopyWithImpl<$Res>
    implements $MineStateCopyWith<$Res> {
  _$MineStateCopyWithImpl(this._self, this._then);

  final MineState _self;
  final $Res Function(MineState) _then;

/// Create a copy of MineState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? siteLabel = null,Object? version = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,siteLabel: null == siteLabel ? _self.siteLabel : siteLabel // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MineState].
extension MineStatePatterns on MineState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MineState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MineState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MineState value)  $default,){
final _that = this;
switch (_that) {
case _MineState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MineState value)?  $default,){
final _that = this;
switch (_that) {
case _MineState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userName,  String siteLabel,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MineState() when $default != null:
return $default(_that.userName,_that.siteLabel,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userName,  String siteLabel,  String version)  $default,) {final _that = this;
switch (_that) {
case _MineState():
return $default(_that.userName,_that.siteLabel,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userName,  String siteLabel,  String version)?  $default,) {final _that = this;
switch (_that) {
case _MineState() when $default != null:
return $default(_that.userName,_that.siteLabel,_that.version);case _:
  return null;

}
}

}

/// @nodoc


class _MineState extends MineState {
  const _MineState({this.userName = '', this.siteLabel = '', this.version = ''}): super._();
  

@override@JsonKey() final  String userName;
@override@JsonKey() final  String siteLabel;
@override@JsonKey() final  String version;

/// Create a copy of MineState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MineStateCopyWith<_MineState> get copyWith => __$MineStateCopyWithImpl<_MineState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MineState&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.siteLabel, siteLabel) || other.siteLabel == siteLabel)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,userName,siteLabel,version);

@override
String toString() {
  return 'MineState(userName: $userName, siteLabel: $siteLabel, version: $version)';
}


}

/// @nodoc
abstract mixin class _$MineStateCopyWith<$Res> implements $MineStateCopyWith<$Res> {
  factory _$MineStateCopyWith(_MineState value, $Res Function(_MineState) _then) = __$MineStateCopyWithImpl;
@override @useResult
$Res call({
 String userName, String siteLabel, String version
});




}
/// @nodoc
class __$MineStateCopyWithImpl<$Res>
    implements _$MineStateCopyWith<$Res> {
  __$MineStateCopyWithImpl(this._self, this._then);

  final _MineState _self;
  final $Res Function(_MineState) _then;

/// Create a copy of MineState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? siteLabel = null,Object? version = null,}) {
  return _then(_MineState(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,siteLabel: null == siteLabel ? _self.siteLabel : siteLabel // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
