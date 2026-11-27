// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passcode_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasscodeAddState {

 bool get permanent; DateTime? get startDate; DateTime? get endDate; bool get submitting; AppException? get error;
/// Create a copy of PasscodeAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasscodeAddStateCopyWith<PasscodeAddState> get copyWith => _$PasscodeAddStateCopyWithImpl<PasscodeAddState>(this as PasscodeAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasscodeAddState&&(identical(other.permanent, permanent) || other.permanent == permanent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,permanent,startDate,endDate,submitting,error);

@override
String toString() {
  return 'PasscodeAddState(permanent: $permanent, startDate: $startDate, endDate: $endDate, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class $PasscodeAddStateCopyWith<$Res>  {
  factory $PasscodeAddStateCopyWith(PasscodeAddState value, $Res Function(PasscodeAddState) _then) = _$PasscodeAddStateCopyWithImpl;
@useResult
$Res call({
 bool permanent, DateTime? startDate, DateTime? endDate, bool submitting, AppException? error
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$PasscodeAddStateCopyWithImpl<$Res>
    implements $PasscodeAddStateCopyWith<$Res> {
  _$PasscodeAddStateCopyWithImpl(this._self, this._then);

  final PasscodeAddState _self;
  final $Res Function(PasscodeAddState) _then;

/// Create a copy of PasscodeAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permanent = null,Object? startDate = freezed,Object? endDate = freezed,Object? submitting = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
permanent: null == permanent ? _self.permanent : permanent // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of PasscodeAddState
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


/// Adds pattern-matching-related methods to [PasscodeAddState].
extension PasscodeAddStatePatterns on PasscodeAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasscodeAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasscodeAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasscodeAddState value)  $default,){
final _that = this;
switch (_that) {
case _PasscodeAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasscodeAddState value)?  $default,){
final _that = this;
switch (_that) {
case _PasscodeAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool permanent,  DateTime? startDate,  DateTime? endDate,  bool submitting,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasscodeAddState() when $default != null:
return $default(_that.permanent,_that.startDate,_that.endDate,_that.submitting,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool permanent,  DateTime? startDate,  DateTime? endDate,  bool submitting,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _PasscodeAddState():
return $default(_that.permanent,_that.startDate,_that.endDate,_that.submitting,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool permanent,  DateTime? startDate,  DateTime? endDate,  bool submitting,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _PasscodeAddState() when $default != null:
return $default(_that.permanent,_that.startDate,_that.endDate,_that.submitting,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PasscodeAddState extends PasscodeAddState {
  const _PasscodeAddState({this.permanent = true, this.startDate, this.endDate, this.submitting = false, this.error}): super._();
  

@override@JsonKey() final  bool permanent;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  bool submitting;
@override final  AppException? error;

/// Create a copy of PasscodeAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasscodeAddStateCopyWith<_PasscodeAddState> get copyWith => __$PasscodeAddStateCopyWithImpl<_PasscodeAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasscodeAddState&&(identical(other.permanent, permanent) || other.permanent == permanent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,permanent,startDate,endDate,submitting,error);

@override
String toString() {
  return 'PasscodeAddState(permanent: $permanent, startDate: $startDate, endDate: $endDate, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PasscodeAddStateCopyWith<$Res> implements $PasscodeAddStateCopyWith<$Res> {
  factory _$PasscodeAddStateCopyWith(_PasscodeAddState value, $Res Function(_PasscodeAddState) _then) = __$PasscodeAddStateCopyWithImpl;
@override @useResult
$Res call({
 bool permanent, DateTime? startDate, DateTime? endDate, bool submitting, AppException? error
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$PasscodeAddStateCopyWithImpl<$Res>
    implements _$PasscodeAddStateCopyWith<$Res> {
  __$PasscodeAddStateCopyWithImpl(this._self, this._then);

  final _PasscodeAddState _self;
  final $Res Function(_PasscodeAddState) _then;

/// Create a copy of PasscodeAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permanent = null,Object? startDate = freezed,Object? endDate = freezed,Object? submitting = null,Object? error = freezed,}) {
  return _then(_PasscodeAddState(
permanent: null == permanent ? _self.permanent : permanent // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of PasscodeAddState
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
