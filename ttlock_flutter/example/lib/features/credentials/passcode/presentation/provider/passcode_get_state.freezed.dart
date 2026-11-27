// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passcode_get_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasscodeGetState {

 PasscodeGetKind get kind; bool get showCyclic; KeyboardPwdType get cyclicType; int get startMinutes; int get endMinutes; DateTime? get startDate; DateTime? get endDate; KeyboardPwdEntity? get result; bool get submitting; AppException? get error;
/// Create a copy of PasscodeGetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasscodeGetStateCopyWith<PasscodeGetState> get copyWith => _$PasscodeGetStateCopyWithImpl<PasscodeGetState>(this as PasscodeGetState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasscodeGetState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.cyclicType, cyclicType) || other.cyclicType == cyclicType)&&(identical(other.startMinutes, startMinutes) || other.startMinutes == startMinutes)&&(identical(other.endMinutes, endMinutes) || other.endMinutes == endMinutes)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.result, result) || other.result == result)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,cyclicType,startMinutes,endMinutes,startDate,endDate,result,submitting,error);

@override
String toString() {
  return 'PasscodeGetState(kind: $kind, showCyclic: $showCyclic, cyclicType: $cyclicType, startMinutes: $startMinutes, endMinutes: $endMinutes, startDate: $startDate, endDate: $endDate, result: $result, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class $PasscodeGetStateCopyWith<$Res>  {
  factory $PasscodeGetStateCopyWith(PasscodeGetState value, $Res Function(PasscodeGetState) _then) = _$PasscodeGetStateCopyWithImpl;
@useResult
$Res call({
 PasscodeGetKind kind, bool showCyclic, KeyboardPwdType cyclicType, int startMinutes, int endMinutes, DateTime? startDate, DateTime? endDate, KeyboardPwdEntity? result, bool submitting, AppException? error
});


$KeyboardPwdEntityCopyWith<$Res>? get result;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$PasscodeGetStateCopyWithImpl<$Res>
    implements $PasscodeGetStateCopyWith<$Res> {
  _$PasscodeGetStateCopyWithImpl(this._self, this._then);

  final PasscodeGetState _self;
  final $Res Function(PasscodeGetState) _then;

/// Create a copy of PasscodeGetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? showCyclic = null,Object? cyclicType = null,Object? startMinutes = null,Object? endMinutes = null,Object? startDate = freezed,Object? endDate = freezed,Object? result = freezed,Object? submitting = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PasscodeGetKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,cyclicType: null == cyclicType ? _self.cyclicType : cyclicType // ignore: cast_nullable_to_non_nullable
as KeyboardPwdType,startMinutes: null == startMinutes ? _self.startMinutes : startMinutes // ignore: cast_nullable_to_non_nullable
as int,endMinutes: null == endMinutes ? _self.endMinutes : endMinutes // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as KeyboardPwdEntity?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of PasscodeGetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyboardPwdEntityCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $KeyboardPwdEntityCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of PasscodeGetState
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


/// Adds pattern-matching-related methods to [PasscodeGetState].
extension PasscodeGetStatePatterns on PasscodeGetState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasscodeGetState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasscodeGetState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasscodeGetState value)  $default,){
final _that = this;
switch (_that) {
case _PasscodeGetState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasscodeGetState value)?  $default,){
final _that = this;
switch (_that) {
case _PasscodeGetState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PasscodeGetKind kind,  bool showCyclic,  KeyboardPwdType cyclicType,  int startMinutes,  int endMinutes,  DateTime? startDate,  DateTime? endDate,  KeyboardPwdEntity? result,  bool submitting,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasscodeGetState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.cyclicType,_that.startMinutes,_that.endMinutes,_that.startDate,_that.endDate,_that.result,_that.submitting,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PasscodeGetKind kind,  bool showCyclic,  KeyboardPwdType cyclicType,  int startMinutes,  int endMinutes,  DateTime? startDate,  DateTime? endDate,  KeyboardPwdEntity? result,  bool submitting,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _PasscodeGetState():
return $default(_that.kind,_that.showCyclic,_that.cyclicType,_that.startMinutes,_that.endMinutes,_that.startDate,_that.endDate,_that.result,_that.submitting,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PasscodeGetKind kind,  bool showCyclic,  KeyboardPwdType cyclicType,  int startMinutes,  int endMinutes,  DateTime? startDate,  DateTime? endDate,  KeyboardPwdEntity? result,  bool submitting,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _PasscodeGetState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.cyclicType,_that.startMinutes,_that.endMinutes,_that.startDate,_that.endDate,_that.result,_that.submitting,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PasscodeGetState extends PasscodeGetState {
  const _PasscodeGetState({this.kind = PasscodeGetKind.permanent, this.showCyclic = false, this.cyclicType = KeyboardPwdType.cyclicMonday, this.startMinutes = 480, this.endMinutes = 1020, this.startDate, this.endDate, this.result, this.submitting = false, this.error}): super._();
  

@override@JsonKey() final  PasscodeGetKind kind;
@override@JsonKey() final  bool showCyclic;
@override@JsonKey() final  KeyboardPwdType cyclicType;
@override@JsonKey() final  int startMinutes;
@override@JsonKey() final  int endMinutes;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  KeyboardPwdEntity? result;
@override@JsonKey() final  bool submitting;
@override final  AppException? error;

/// Create a copy of PasscodeGetState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasscodeGetStateCopyWith<_PasscodeGetState> get copyWith => __$PasscodeGetStateCopyWithImpl<_PasscodeGetState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasscodeGetState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.cyclicType, cyclicType) || other.cyclicType == cyclicType)&&(identical(other.startMinutes, startMinutes) || other.startMinutes == startMinutes)&&(identical(other.endMinutes, endMinutes) || other.endMinutes == endMinutes)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.result, result) || other.result == result)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,cyclicType,startMinutes,endMinutes,startDate,endDate,result,submitting,error);

@override
String toString() {
  return 'PasscodeGetState(kind: $kind, showCyclic: $showCyclic, cyclicType: $cyclicType, startMinutes: $startMinutes, endMinutes: $endMinutes, startDate: $startDate, endDate: $endDate, result: $result, submitting: $submitting, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PasscodeGetStateCopyWith<$Res> implements $PasscodeGetStateCopyWith<$Res> {
  factory _$PasscodeGetStateCopyWith(_PasscodeGetState value, $Res Function(_PasscodeGetState) _then) = __$PasscodeGetStateCopyWithImpl;
@override @useResult
$Res call({
 PasscodeGetKind kind, bool showCyclic, KeyboardPwdType cyclicType, int startMinutes, int endMinutes, DateTime? startDate, DateTime? endDate, KeyboardPwdEntity? result, bool submitting, AppException? error
});


@override $KeyboardPwdEntityCopyWith<$Res>? get result;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$PasscodeGetStateCopyWithImpl<$Res>
    implements _$PasscodeGetStateCopyWith<$Res> {
  __$PasscodeGetStateCopyWithImpl(this._self, this._then);

  final _PasscodeGetState _self;
  final $Res Function(_PasscodeGetState) _then;

/// Create a copy of PasscodeGetState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? showCyclic = null,Object? cyclicType = null,Object? startMinutes = null,Object? endMinutes = null,Object? startDate = freezed,Object? endDate = freezed,Object? result = freezed,Object? submitting = null,Object? error = freezed,}) {
  return _then(_PasscodeGetState(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PasscodeGetKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,cyclicType: null == cyclicType ? _self.cyclicType : cyclicType // ignore: cast_nullable_to_non_nullable
as KeyboardPwdType,startMinutes: null == startMinutes ? _self.startMinutes : startMinutes // ignore: cast_nullable_to_non_nullable
as int,endMinutes: null == endMinutes ? _self.endMinutes : endMinutes // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as KeyboardPwdEntity?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of PasscodeGetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyboardPwdEntityCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $KeyboardPwdEntityCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of PasscodeGetState
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
