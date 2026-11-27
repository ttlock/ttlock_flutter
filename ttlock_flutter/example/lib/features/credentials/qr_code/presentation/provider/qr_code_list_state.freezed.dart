// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QrCodeListState {

 PageState<QrCodeEntity> get pageState;
/// Create a copy of QrCodeListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrCodeListStateCopyWith<QrCodeListState> get copyWith => _$QrCodeListStateCopyWithImpl<QrCodeListState>(this as QrCodeListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrCodeListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'QrCodeListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class $QrCodeListStateCopyWith<$Res>  {
  factory $QrCodeListStateCopyWith(QrCodeListState value, $Res Function(QrCodeListState) _then) = _$QrCodeListStateCopyWithImpl;
@useResult
$Res call({
 PageState<QrCodeEntity> pageState
});


$PageStateCopyWith<QrCodeEntity, $Res> get pageState;

}
/// @nodoc
class _$QrCodeListStateCopyWithImpl<$Res>
    implements $QrCodeListStateCopyWith<$Res> {
  _$QrCodeListStateCopyWithImpl(this._self, this._then);

  final QrCodeListState _self;
  final $Res Function(QrCodeListState) _then;

/// Create a copy of QrCodeListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,}) {
  return _then(_self.copyWith(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<QrCodeEntity>,
  ));
}
/// Create a copy of QrCodeListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<QrCodeEntity, $Res> get pageState {
  
  return $PageStateCopyWith<QrCodeEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}


/// Adds pattern-matching-related methods to [QrCodeListState].
extension QrCodeListStatePatterns on QrCodeListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrCodeListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrCodeListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrCodeListState value)  $default,){
final _that = this;
switch (_that) {
case _QrCodeListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrCodeListState value)?  $default,){
final _that = this;
switch (_that) {
case _QrCodeListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState<QrCodeEntity> pageState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrCodeListState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState<QrCodeEntity> pageState)  $default,) {final _that = this;
switch (_that) {
case _QrCodeListState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState<QrCodeEntity> pageState)?  $default,) {final _that = this;
switch (_that) {
case _QrCodeListState() when $default != null:
return $default(_that.pageState);case _:
  return null;

}
}

}

/// @nodoc


class _QrCodeListState extends QrCodeListState {
  const _QrCodeListState({this.pageState = const PageState<QrCodeEntity>()}): super._();
  

@override@JsonKey() final  PageState<QrCodeEntity> pageState;

/// Create a copy of QrCodeListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrCodeListStateCopyWith<_QrCodeListState> get copyWith => __$QrCodeListStateCopyWithImpl<_QrCodeListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrCodeListState&&(identical(other.pageState, pageState) || other.pageState == pageState));
}


@override
int get hashCode => Object.hash(runtimeType,pageState);

@override
String toString() {
  return 'QrCodeListState(pageState: $pageState)';
}


}

/// @nodoc
abstract mixin class _$QrCodeListStateCopyWith<$Res> implements $QrCodeListStateCopyWith<$Res> {
  factory _$QrCodeListStateCopyWith(_QrCodeListState value, $Res Function(_QrCodeListState) _then) = __$QrCodeListStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<QrCodeEntity> pageState
});


@override $PageStateCopyWith<QrCodeEntity, $Res> get pageState;

}
/// @nodoc
class __$QrCodeListStateCopyWithImpl<$Res>
    implements _$QrCodeListStateCopyWith<$Res> {
  __$QrCodeListStateCopyWithImpl(this._self, this._then);

  final _QrCodeListState _self;
  final $Res Function(_QrCodeListState) _then;

/// Create a copy of QrCodeListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,}) {
  return _then(_QrCodeListState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState<QrCodeEntity>,
  ));
}

/// Create a copy of QrCodeListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<QrCodeEntity, $Res> get pageState {
  
  return $PageStateCopyWith<QrCodeEntity, $Res>(_self.pageState, (value) {
    return _then(_self.copyWith(pageState: value));
  });
}
}

// dart format on
