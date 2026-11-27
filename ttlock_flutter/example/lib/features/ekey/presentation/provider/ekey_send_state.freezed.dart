// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ekey_send_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EkeySendState {

 bool get permanent; DateTime? get startDate; DateTime? get endDate; bool get authorized; bool get submitting; AppException? get error;
/// Create a copy of EkeySendState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EkeySendStateCopyWith<EkeySendState> get copyWith => _$EkeySendStateCopyWithImpl<EkeySendState>(this as EkeySendState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EkeySendState&&(identical(other.permanent, permanent) || other.permanent == permanent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.authorized, authorized) || other.authorized == authorized)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,permanent,startDate,endDate,authorized,submitting,error);

@override
String toString() {
  return 'EkeySendState(permanent: $permanent, startDate: $startDate, endDate: $endDate, authorized: $authorized, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class $EkeySendStateCopyWith<$Res>  {
  factory $EkeySendStateCopyWith(EkeySendState value, $Res Function(EkeySendState) _then) = _$EkeySendStateCopyWithImpl;
@useResult
$Res call({
 bool permanent, DateTime? startDate, DateTime? endDate, bool authorized, bool submitting, AppException? error
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$EkeySendStateCopyWithImpl<$Res>
    implements $EkeySendStateCopyWith<$Res> {
  _$EkeySendStateCopyWithImpl(this._self, this._then);

  final EkeySendState _self;
  final $Res Function(EkeySendState) _then;

/// Create a copy of EkeySendState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permanent = null,Object? startDate = freezed,Object? endDate = freezed,Object? authorized = null,Object? submitting = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
permanent: null == permanent ? _self.permanent : permanent // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,authorized: null == authorized ? _self.authorized : authorized // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of EkeySendState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [EkeySendState].
extension EkeySendStatePatterns on EkeySendState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EkeySendState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EkeySendState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EkeySendState value)  $default,){
final _that = this;
switch (_that) {
case _EkeySendState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EkeySendState value)?  $default,){
final _that = this;
switch (_that) {
case _EkeySendState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool permanent,  DateTime? startDate,  DateTime? endDate,  bool authorized,  bool submitting,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EkeySendState() when $default != null:
return $default(_that.permanent,_that.startDate,_that.endDate,_that.authorized,_that.submitting,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool permanent,  DateTime? startDate,  DateTime? endDate,  bool authorized,  bool submitting,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _EkeySendState():
return $default(_that.permanent,_that.startDate,_that.endDate,_that.authorized,_that.submitting,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool permanent,  DateTime? startDate,  DateTime? endDate,  bool authorized,  bool submitting,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _EkeySendState() when $default != null:
return $default(_that.permanent,_that.startDate,_that.endDate,_that.authorized,_that.submitting,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _EkeySendState extends EkeySendState {
  const _EkeySendState({this.permanent = true, this.startDate, this.endDate, this.authorized = false, this.submitting = false, this.error}): super._();
  

@override@JsonKey() final  bool permanent;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  bool authorized;
@override@JsonKey() final  bool submitting;
@override final  AppException? error;

/// Create a copy of EkeySendState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EkeySendStateCopyWith<_EkeySendState> get copyWith => __$EkeySendStateCopyWithImpl<_EkeySendState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EkeySendState&&(identical(other.permanent, permanent) || other.permanent == permanent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.authorized, authorized) || other.authorized == authorized)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,permanent,startDate,endDate,authorized,submitting,error);

@override
String toString() {
  return 'EkeySendState(permanent: $permanent, startDate: $startDate, endDate: $endDate, authorized: $authorized, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class _$EkeySendStateCopyWith<$Res> implements $EkeySendStateCopyWith<$Res> {
  factory _$EkeySendStateCopyWith(_EkeySendState value, $Res Function(_EkeySendState) _then) = __$EkeySendStateCopyWithImpl;
@override @useResult
$Res call({
 bool permanent, DateTime? startDate, DateTime? endDate, bool authorized, bool submitting, AppException? error
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$EkeySendStateCopyWithImpl<$Res>
    implements _$EkeySendStateCopyWith<$Res> {
  __$EkeySendStateCopyWithImpl(this._self, this._then);

  final _EkeySendState _self;
  final $Res Function(_EkeySendState) _then;

/// Create a copy of EkeySendState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permanent = null,Object? startDate = freezed,Object? endDate = freezed,Object? authorized = null,Object? submitting = null,Object? error = freezed,}) {
  return _then(_EkeySendState(
permanent: null == permanent ? _self.permanent : permanent // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,authorized: null == authorized ? _self.authorized : authorized // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of EkeySendState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
