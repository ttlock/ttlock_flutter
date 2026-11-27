// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standalone_door_sensor_records_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StandaloneDoorSensorRecordsState {

 PageState<StandaloneDoorSensorRecordEntity> get pageState;
/// Create a copy of StandaloneDoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorRecordsStateCopyWith<StandaloneDoorSensorRecordsState> get copyWith => _$StandaloneDoorSensorRecordsStateCopyWithImpl<StandaloneDoorSensorRecordsState>(this as StandaloneDoorSensorRecordsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorRecordsState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'StandaloneDoorSensorRecordsState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorRecordsStateCopyWith<$Res>  {
  factory $StandaloneDoorSensorRecordsStateCopyWith(StandaloneDoorSensorRecordsState value, $Res Function(StandaloneDoorSensorRecordsState) _then) = _$StandaloneDoorSensorRecordsStateCopyWithImpl;
@useResult
$Res call({
 PageState<StandaloneDoorSensorRecordEntity> pageState
});


$PageStateCopyWith<StandaloneDoorSensorRecordEntity, $Res> get pageState;

}
/// @nodoc
class _$StandaloneDoorSensorRecordsStateCopyWithImpl<$Res>
    implements $StandaloneDoorSensorRecordsStateCopyWith<$Res> {
  _$StandaloneDoorSensorRecordsStateCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorRecordsState _self;
  final $Res Function(StandaloneDoorSensorRecordsState) _then;

/// Create a copy of StandaloneDoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<StandaloneDoorSensorRecordEntity>,
  ));
}
/// Create a copy of StandaloneDoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<StandaloneDoorSensorRecordEntity, $Res> get pageState {
  
  return $PageStateCopyWith<StandaloneDoorSensorRecordEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorRecordsState].
extension StandaloneDoorSensorRecordsStatePatterns on StandaloneDoorSensorRecordsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorRecordsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorRecordsState value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorRecordsState value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<StandaloneDoorSensorRecordEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordsState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<StandaloneDoorSensorRecordEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordsState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<StandaloneDoorSensorRecordEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordsState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _StandaloneDoorSensorRecordsState extends StandaloneDoorSensorRecordsState {
  const _StandaloneDoorSensorRecordsState({this.pageState = const PageState<StandaloneDoorSensorRecordEntity>()}): super._();
  

@override@JsonKey() final  PageState<StandaloneDoorSensorRecordEntity> pageState;

/// Create a copy of StandaloneDoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorRecordsStateCopyWith<_StandaloneDoorSensorRecordsState> get copyWith => __$StandaloneDoorSensorRecordsStateCopyWithImpl<_StandaloneDoorSensorRecordsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorRecordsState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'StandaloneDoorSensorRecordsState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorRecordsStateCopyWith<$Res> implements $StandaloneDoorSensorRecordsStateCopyWith<$Res> {
  factory _$StandaloneDoorSensorRecordsStateCopyWith(_StandaloneDoorSensorRecordsState value, $Res Function(_StandaloneDoorSensorRecordsState) _then) = __$StandaloneDoorSensorRecordsStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<StandaloneDoorSensorRecordEntity> pageState
});


@override $PageStateCopyWith<StandaloneDoorSensorRecordEntity, $Res> get pageState;

}
/// @nodoc
class __$StandaloneDoorSensorRecordsStateCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorRecordsStateCopyWith<$Res> {
  __$StandaloneDoorSensorRecordsStateCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorRecordsState _self;
  final $Res Function(_StandaloneDoorSensorRecordsState) _then;

/// Create a copy of StandaloneDoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_StandaloneDoorSensorRecordsState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<StandaloneDoorSensorRecordEntity>,
  ));
}

/// Create a copy of StandaloneDoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<StandaloneDoorSensorRecordEntity, $Res> get pageState {
  
  return $PageStateCopyWith<StandaloneDoorSensorRecordEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
