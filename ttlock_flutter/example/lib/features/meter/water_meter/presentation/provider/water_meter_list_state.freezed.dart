// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_meter_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaterMeterListState {

 PageState<WaterMeterEntity> get pageState;
/// Create a copy of WaterMeterListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterListStateCopyWith<WaterMeterListState> get copyWith => _$WaterMeterListStateCopyWithImpl<WaterMeterListState>(this as WaterMeterListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'WaterMeterListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $WaterMeterListStateCopyWith<$Res>  {
  factory $WaterMeterListStateCopyWith(WaterMeterListState value, $Res Function(WaterMeterListState) _then) = _$WaterMeterListStateCopyWithImpl;
@useResult
$Res call({
 PageState<WaterMeterEntity> pageState
});


$PageStateCopyWith<WaterMeterEntity, $Res> get pageState;

}
/// @nodoc
class _$WaterMeterListStateCopyWithImpl<$Res>
    implements $WaterMeterListStateCopyWith<$Res> {
  _$WaterMeterListStateCopyWithImpl(this._self, this._then);

  final WaterMeterListState _self;
  final $Res Function(WaterMeterListState) _then;

/// Create a copy of WaterMeterListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<WaterMeterEntity>,
  ));
}
/// Create a copy of WaterMeterListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<WaterMeterEntity, $Res> get pageState {
  
  return $PageStateCopyWith<WaterMeterEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [WaterMeterListState].
extension WaterMeterListStatePatterns on WaterMeterListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterListState value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterListState value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<WaterMeterEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterListState() when $default != null:
return $default(_that.pageState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<WaterMeterEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterListState():
return $default(_that.pageState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<WaterMeterEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterListState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _WaterMeterListState extends WaterMeterListState {
  const _WaterMeterListState({this.pageState = const PageState<WaterMeterEntity>()}): super._();
  

@override@JsonKey() final  PageState<WaterMeterEntity> pageState;

/// Create a copy of WaterMeterListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterListStateCopyWith<_WaterMeterListState> get copyWith => __$WaterMeterListStateCopyWithImpl<_WaterMeterListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'WaterMeterListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterListStateCopyWith<$Res> implements $WaterMeterListStateCopyWith<$Res> {
  factory _$WaterMeterListStateCopyWith(_WaterMeterListState value, $Res Function(_WaterMeterListState) _then) = __$WaterMeterListStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<WaterMeterEntity> pageState
});


@override $PageStateCopyWith<WaterMeterEntity, $Res> get pageState;

}
/// @nodoc
class __$WaterMeterListStateCopyWithImpl<$Res>
    implements _$WaterMeterListStateCopyWith<$Res> {
  __$WaterMeterListStateCopyWithImpl(this._self, this._then);

  final _WaterMeterListState _self;
  final $Res Function(_WaterMeterListState) _then;

/// Create a copy of WaterMeterListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_WaterMeterListState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<WaterMeterEntity>,
  ));
}

/// Create a copy of WaterMeterListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<WaterMeterEntity, $Res> get pageState {
  
  return $PageStateCopyWith<WaterMeterEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
