// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_meter_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElectricMeterListState {

 PageState<ElectricMeterEntity> get pageState;
/// Create a copy of ElectricMeterListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterListStateCopyWith<ElectricMeterListState> get copyWith => _$ElectricMeterListStateCopyWithImpl<ElectricMeterListState>(this as ElectricMeterListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'ElectricMeterListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterListStateCopyWith<$Res>  {
  factory $ElectricMeterListStateCopyWith(ElectricMeterListState value, $Res Function(ElectricMeterListState) _then) = _$ElectricMeterListStateCopyWithImpl;
@useResult
$Res call({
 PageState<ElectricMeterEntity> pageState
});


$PageStateCopyWith<ElectricMeterEntity, $Res> get pageState;

}
/// @nodoc
class _$ElectricMeterListStateCopyWithImpl<$Res>
    implements $ElectricMeterListStateCopyWith<$Res> {
  _$ElectricMeterListStateCopyWithImpl(this._self, this._then);

  final ElectricMeterListState _self;
  final $Res Function(ElectricMeterListState) _then;

/// Create a copy of ElectricMeterListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<ElectricMeterEntity>,
  ));
}
/// Create a copy of ElectricMeterListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<ElectricMeterEntity, $Res> get pageState {
  
  return $PageStateCopyWith<ElectricMeterEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [ElectricMeterListState].
extension ElectricMeterListStatePatterns on ElectricMeterListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterListState value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterListState value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<ElectricMeterEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<ElectricMeterEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<ElectricMeterEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterListState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricMeterListState extends ElectricMeterListState {
  const _ElectricMeterListState({this.pageState = const PageState<ElectricMeterEntity>()}): super._();
  

@override@JsonKey() final  PageState<ElectricMeterEntity> pageState;

/// Create a copy of ElectricMeterListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterListStateCopyWith<_ElectricMeterListState> get copyWith => __$ElectricMeterListStateCopyWithImpl<_ElectricMeterListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'ElectricMeterListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterListStateCopyWith<$Res> implements $ElectricMeterListStateCopyWith<$Res> {
  factory _$ElectricMeterListStateCopyWith(_ElectricMeterListState value, $Res Function(_ElectricMeterListState) _then) = __$ElectricMeterListStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<ElectricMeterEntity> pageState
});


@override $PageStateCopyWith<ElectricMeterEntity, $Res> get pageState;

}
/// @nodoc
class __$ElectricMeterListStateCopyWithImpl<$Res>
    implements _$ElectricMeterListStateCopyWith<$Res> {
  __$ElectricMeterListStateCopyWithImpl(this._self, this._then);

  final _ElectricMeterListState _self;
  final $Res Function(_ElectricMeterListState) _then;

/// Create a copy of ElectricMeterListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_ElectricMeterListState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<ElectricMeterEntity>,
  ));
}

/// Create a copy of ElectricMeterListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<ElectricMeterEntity, $Res> get pageState {
  
  return $PageStateCopyWith<ElectricMeterEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
