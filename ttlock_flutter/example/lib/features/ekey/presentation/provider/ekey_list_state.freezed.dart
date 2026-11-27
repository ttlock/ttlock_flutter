// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ekey_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EkeyListState {

 PageState<KeyEntity> get pageState;
/// Create a copy of EkeyListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EkeyListStateCopyWith<EkeyListState> get copyWith => _$EkeyListStateCopyWithImpl<EkeyListState>(this as EkeyListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EkeyListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'EkeyListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $EkeyListStateCopyWith<$Res>  {
  factory $EkeyListStateCopyWith(EkeyListState value, $Res Function(EkeyListState) _then) = _$EkeyListStateCopyWithImpl;
@useResult
$Res call({
 PageState<KeyEntity> pageState
});


$PageStateCopyWith<KeyEntity, $Res> get pageState;

}
/// @nodoc
class _$EkeyListStateCopyWithImpl<$Res>
    implements $EkeyListStateCopyWith<$Res> {
  _$EkeyListStateCopyWithImpl(this._self, this._then);

  final EkeyListState _self;
  final $Res Function(EkeyListState) _then;

/// Create a copy of EkeyListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<KeyEntity>,
  ));
}
/// Create a copy of EkeyListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<KeyEntity, $Res> get pageState {
  
  return $PageStateCopyWith<KeyEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [EkeyListState].
extension EkeyListStatePatterns on EkeyListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EkeyListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EkeyListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EkeyListState value)  $default,){
final _that = this;
switch (_that) {
case _EkeyListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EkeyListState value)?  $default,){
final _that = this;
switch (_that) {
case _EkeyListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<KeyEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EkeyListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<KeyEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _EkeyListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<KeyEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _EkeyListState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _EkeyListState extends EkeyListState {
  const _EkeyListState({this.pageState = const PageState<KeyEntity>()}): super._();
  

@override@JsonKey() final  PageState<KeyEntity> pageState;

/// Create a copy of EkeyListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EkeyListStateCopyWith<_EkeyListState> get copyWith => __$EkeyListStateCopyWithImpl<_EkeyListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EkeyListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'EkeyListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$EkeyListStateCopyWith<$Res> implements $EkeyListStateCopyWith<$Res> {
  factory _$EkeyListStateCopyWith(_EkeyListState value, $Res Function(_EkeyListState) _then) = __$EkeyListStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<KeyEntity> pageState
});


@override $PageStateCopyWith<KeyEntity, $Res> get pageState;

}
/// @nodoc
class __$EkeyListStateCopyWithImpl<$Res>
    implements _$EkeyListStateCopyWith<$Res> {
  __$EkeyListStateCopyWithImpl(this._self, this._then);

  final _EkeyListState _self;
  final $Res Function(_EkeyListState) _then;

/// Create a copy of EkeyListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_EkeyListState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<KeyEntity>,
  ));
}

/// Create a copy of EkeyListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<KeyEntity, $Res> get pageState {
  
  return $PageStateCopyWith<KeyEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
