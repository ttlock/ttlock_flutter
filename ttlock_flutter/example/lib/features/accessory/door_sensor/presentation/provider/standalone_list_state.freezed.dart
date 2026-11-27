// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standalone_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StandaloneDoorSensorListState {

 PageState<StandaloneDoorSensorEntity> get pageState;
/// Create a copy of StandaloneDoorSensorListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorListStateCopyWith<StandaloneDoorSensorListState> get copyWith => _$StandaloneDoorSensorListStateCopyWithImpl<StandaloneDoorSensorListState>(this as StandaloneDoorSensorListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'StandaloneDoorSensorListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorListStateCopyWith<$Res>  {
  factory $StandaloneDoorSensorListStateCopyWith(StandaloneDoorSensorListState value, $Res Function(StandaloneDoorSensorListState) _then) = _$StandaloneDoorSensorListStateCopyWithImpl;
@useResult
$Res call({
 PageState<StandaloneDoorSensorEntity> pageState
});


$PageStateCopyWith<StandaloneDoorSensorEntity, $Res> get pageState;

}
/// @nodoc
class _$StandaloneDoorSensorListStateCopyWithImpl<$Res>
    implements $StandaloneDoorSensorListStateCopyWith<$Res> {
  _$StandaloneDoorSensorListStateCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorListState _self;
  final $Res Function(StandaloneDoorSensorListState) _then;

/// Create a copy of StandaloneDoorSensorListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<StandaloneDoorSensorEntity>,
  ));
}
/// Create a copy of StandaloneDoorSensorListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<StandaloneDoorSensorEntity, $Res> get pageState {
  
  return $PageStateCopyWith<StandaloneDoorSensorEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorListState].
extension StandaloneDoorSensorListStatePatterns on StandaloneDoorSensorListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorListState value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorListState value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<StandaloneDoorSensorEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<StandaloneDoorSensorEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<StandaloneDoorSensorEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorListState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _StandaloneDoorSensorListState extends StandaloneDoorSensorListState {
  const _StandaloneDoorSensorListState({this.pageState = const PageState<StandaloneDoorSensorEntity>()}): super._();
  

@override@JsonKey() final  PageState<StandaloneDoorSensorEntity> pageState;

/// Create a copy of StandaloneDoorSensorListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorListStateCopyWith<_StandaloneDoorSensorListState> get copyWith => __$StandaloneDoorSensorListStateCopyWithImpl<_StandaloneDoorSensorListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'StandaloneDoorSensorListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorListStateCopyWith<$Res> implements $StandaloneDoorSensorListStateCopyWith<$Res> {
  factory _$StandaloneDoorSensorListStateCopyWith(_StandaloneDoorSensorListState value, $Res Function(_StandaloneDoorSensorListState) _then) = __$StandaloneDoorSensorListStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<StandaloneDoorSensorEntity> pageState
});


@override $PageStateCopyWith<StandaloneDoorSensorEntity, $Res> get pageState;

}
/// @nodoc
class __$StandaloneDoorSensorListStateCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorListStateCopyWith<$Res> {
  __$StandaloneDoorSensorListStateCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorListState _self;
  final $Res Function(_StandaloneDoorSensorListState) _then;

/// Create a copy of StandaloneDoorSensorListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_StandaloneDoorSensorListState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<StandaloneDoorSensorEntity>,
  ));
}

/// Create a copy of StandaloneDoorSensorListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<StandaloneDoorSensorEntity, $Res> get pageState {
  
  return $PageStateCopyWith<StandaloneDoorSensorEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
