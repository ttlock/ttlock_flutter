// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockListState {

 PageState<LockEntity> get pageState;
/// Create a copy of LockListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockListStateCopyWith<LockListState> get copyWith => _$LockListStateCopyWithImpl<LockListState>(this as LockListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'LockListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $LockListStateCopyWith<$Res>  {
  factory $LockListStateCopyWith(LockListState value, $Res Function(LockListState) _then) = _$LockListStateCopyWithImpl;
@useResult
$Res call({
 PageState<LockEntity> pageState
});


$PageStateCopyWith<LockEntity, $Res> get pageState;

}
/// @nodoc
class _$LockListStateCopyWithImpl<$Res>
    implements $LockListStateCopyWith<$Res> {
  _$LockListStateCopyWithImpl(this._self, this._then);

  final LockListState _self;
  final $Res Function(LockListState) _then;

/// Create a copy of LockListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<LockEntity>,
  ));
}
/// Create a copy of LockListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<LockEntity, $Res> get pageState {
  
  return $PageStateCopyWith<LockEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [LockListState].
extension LockListStatePatterns on LockListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockListState value)  $default,){
final _that = this;
switch (_that) {
case _LockListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockListState value)?  $default,){
final _that = this;
switch (_that) {
case _LockListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<LockEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<LockEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _LockListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<LockEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _LockListState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _LockListState extends LockListState {
  const _LockListState({this.pageState = const PageState<LockEntity>()}): super._();
  

@override@JsonKey() final  PageState<LockEntity> pageState;

/// Create a copy of LockListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockListStateCopyWith<_LockListState> get copyWith => __$LockListStateCopyWithImpl<_LockListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'LockListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$LockListStateCopyWith<$Res> implements $LockListStateCopyWith<$Res> {
  factory _$LockListStateCopyWith(_LockListState value, $Res Function(_LockListState) _then) = __$LockListStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<LockEntity> pageState
});


@override $PageStateCopyWith<LockEntity, $Res> get pageState;

}
/// @nodoc
class __$LockListStateCopyWithImpl<$Res>
    implements _$LockListStateCopyWith<$Res> {
  __$LockListStateCopyWithImpl(this._self, this._then);

  final _LockListState _self;
  final $Res Function(_LockListState) _then;

/// Create a copy of LockListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_LockListState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<LockEntity>,
  ));
}

/// Create a copy of LockListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<LockEntity, $Res> get pageState {
  
  return $PageStateCopyWith<LockEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
