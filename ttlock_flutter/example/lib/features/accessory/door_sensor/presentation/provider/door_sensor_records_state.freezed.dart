// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'door_sensor_records_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoorSensorRecordsState {

 PageState<DoorSensorRecordEntity> get pageState;
/// Create a copy of DoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoorSensorRecordsStateCopyWith<DoorSensorRecordsState> get copyWith => _$DoorSensorRecordsStateCopyWithImpl<DoorSensorRecordsState>(this as DoorSensorRecordsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoorSensorRecordsState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'DoorSensorRecordsState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $DoorSensorRecordsStateCopyWith<$Res>  {
  factory $DoorSensorRecordsStateCopyWith(DoorSensorRecordsState value, $Res Function(DoorSensorRecordsState) _then) = _$DoorSensorRecordsStateCopyWithImpl;
@useResult
$Res call({
 PageState<DoorSensorRecordEntity> pageState
});


$PageStateCopyWith<DoorSensorRecordEntity, $Res> get pageState;

}
/// @nodoc
class _$DoorSensorRecordsStateCopyWithImpl<$Res>
    implements $DoorSensorRecordsStateCopyWith<$Res> {
  _$DoorSensorRecordsStateCopyWithImpl(this._self, this._then);

  final DoorSensorRecordsState _self;
  final $Res Function(DoorSensorRecordsState) _then;

/// Create a copy of DoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<DoorSensorRecordEntity>,
  ));
}
/// Create a copy of DoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<DoorSensorRecordEntity, $Res> get pageState {
  
  return $PageStateCopyWith<DoorSensorRecordEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [DoorSensorRecordsState].
extension DoorSensorRecordsStatePatterns on DoorSensorRecordsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoorSensorRecordsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoorSensorRecordsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoorSensorRecordsState value)  $default,){
final _that = this;
switch (_that) {
case _DoorSensorRecordsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoorSensorRecordsState value)?  $default,){
final _that = this;
switch (_that) {
case _DoorSensorRecordsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<DoorSensorRecordEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoorSensorRecordsState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<DoorSensorRecordEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _DoorSensorRecordsState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<DoorSensorRecordEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _DoorSensorRecordsState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _DoorSensorRecordsState extends DoorSensorRecordsState {
  const _DoorSensorRecordsState({this.pageState = const PageState<DoorSensorRecordEntity>()}): super._();
  

@override@JsonKey() final  PageState<DoorSensorRecordEntity> pageState;

/// Create a copy of DoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoorSensorRecordsStateCopyWith<_DoorSensorRecordsState> get copyWith => __$DoorSensorRecordsStateCopyWithImpl<_DoorSensorRecordsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoorSensorRecordsState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'DoorSensorRecordsState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$DoorSensorRecordsStateCopyWith<$Res> implements $DoorSensorRecordsStateCopyWith<$Res> {
  factory _$DoorSensorRecordsStateCopyWith(_DoorSensorRecordsState value, $Res Function(_DoorSensorRecordsState) _then) = __$DoorSensorRecordsStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<DoorSensorRecordEntity> pageState
});


@override $PageStateCopyWith<DoorSensorRecordEntity, $Res> get pageState;

}
/// @nodoc
class __$DoorSensorRecordsStateCopyWithImpl<$Res>
    implements _$DoorSensorRecordsStateCopyWith<$Res> {
  __$DoorSensorRecordsStateCopyWithImpl(this._self, this._then);

  final _DoorSensorRecordsState _self;
  final $Res Function(_DoorSensorRecordsState) _then;

/// Create a copy of DoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_DoorSensorRecordsState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<DoorSensorRecordEntity>,
  ));
}

/// Create a copy of DoorSensorRecordsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<DoorSensorRecordEntity, $Res> get pageState {
  
  return $PageStateCopyWith<DoorSensorRecordEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
