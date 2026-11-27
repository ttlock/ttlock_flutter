// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gateway_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GatewayListState {

 PageState<GatewayEntity> get pageState;
/// Create a copy of GatewayListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayListStateCopyWith<GatewayListState> get copyWith => _$GatewayListStateCopyWithImpl<GatewayListState>(this as GatewayListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'GatewayListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $GatewayListStateCopyWith<$Res>  {
  factory $GatewayListStateCopyWith(GatewayListState value, $Res Function(GatewayListState) _then) = _$GatewayListStateCopyWithImpl;
@useResult
$Res call({
 PageState<GatewayEntity> pageState
});


$PageStateCopyWith<GatewayEntity, $Res> get pageState;

}
/// @nodoc
class _$GatewayListStateCopyWithImpl<$Res>
    implements $GatewayListStateCopyWith<$Res> {
  _$GatewayListStateCopyWithImpl(this._self, this._then);

  final GatewayListState _self;
  final $Res Function(GatewayListState) _then;

/// Create a copy of GatewayListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<GatewayEntity>,
  ));
}
/// Create a copy of GatewayListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<GatewayEntity, $Res> get pageState {
  
  return $PageStateCopyWith<GatewayEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [GatewayListState].
extension GatewayListStatePatterns on GatewayListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayListState value)  $default,){
final _that = this;
switch (_that) {
case _GatewayListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayListState value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<GatewayEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<GatewayEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _GatewayListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<GatewayEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _GatewayListState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _GatewayListState extends GatewayListState {
  const _GatewayListState({this.pageState = const PageState<GatewayEntity>()}): super._();
  

@override@JsonKey() final  PageState<GatewayEntity> pageState;

/// Create a copy of GatewayListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayListStateCopyWith<_GatewayListState> get copyWith => __$GatewayListStateCopyWithImpl<_GatewayListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'GatewayListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$GatewayListStateCopyWith<$Res> implements $GatewayListStateCopyWith<$Res> {
  factory _$GatewayListStateCopyWith(_GatewayListState value, $Res Function(_GatewayListState) _then) = __$GatewayListStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<GatewayEntity> pageState
});


@override $PageStateCopyWith<GatewayEntity, $Res> get pageState;

}
/// @nodoc
class __$GatewayListStateCopyWithImpl<$Res>
    implements _$GatewayListStateCopyWith<$Res> {
  __$GatewayListStateCopyWithImpl(this._self, this._then);

  final _GatewayListState _self;
  final $Res Function(_GatewayListState) _then;

/// Create a copy of GatewayListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_GatewayListState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<GatewayEntity>,
  ));
}

/// Create a copy of GatewayListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<GatewayEntity, $Res> get pageState {
  
  return $PageStateCopyWith<GatewayEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
