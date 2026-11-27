// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceAddState {

 CredentialValidityKind get kind;/// 人脸始终展示循环选项（对齐开源），不探测能力位。
 bool get showCyclic; DateTime? get startDate; DateTime? get endDate; CyclicSchedule? get schedule;/// 是否已发起过录入（用于首帧展示「开始录入」/ 停止后展示「重新添加」）。
 bool get started;/// BLE 采集当前相位（canStartAdd/collecting/error/success）。
 TTAddFacePhase? get phase;/// BLE 采集流是否仍在运行。
 bool get isRunning;/// 云端确认（confirmAdd）是否进行中。
 bool get isSubmitting;/// 采集相位对应的实时提示（引导 / 误差编码文案）。
 String get hint; String? get faceNumber;/// BLE 采集 + 云端确认均成功。
 bool get succeeded; AppException? get error;
/// Create a copy of FaceAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceAddStateCopyWith<FaceAddState> get copyWith => _$FaceAddStateCopyWithImpl<FaceAddState>(this as FaceAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.started, started) || other.started == started)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.faceNumber, faceNumber) || other.faceNumber == faceNumber)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,started,phase,isRunning,isSubmitting,hint,faceNumber,succeeded,error);

@override
String toString() {
  return 'FaceAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, started: $started, phase: $phase, isRunning: $isRunning, isSubmitting: $isSubmitting, hint: $hint, faceNumber: $faceNumber, succeeded: $succeeded, error: $error)';
}


}

/// @nodoc
abstract mixin class $FaceAddStateCopyWith<$Res>  {
  factory $FaceAddStateCopyWith(FaceAddState value, $Res Function(FaceAddState) _then) = _$FaceAddStateCopyWithImpl;
@useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool started, TTAddFacePhase? phase, bool isRunning, bool isSubmitting, String hint, String? faceNumber, bool succeeded, AppException? error
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$FaceAddStateCopyWithImpl<$Res>
    implements $FaceAddStateCopyWith<$Res> {
  _$FaceAddStateCopyWithImpl(this._self, this._then);

  final FaceAddState _self;
  final $Res Function(FaceAddState) _then;

/// Create a copy of FaceAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? started = null,Object? phase = freezed,Object? isRunning = null,Object? isSubmitting = null,Object? hint = null,Object? faceNumber = freezed,Object? succeeded = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,started: null == started ? _self.started : started // ignore: cast_nullable_to_non_nullable
as bool,phase: freezed == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as TTAddFacePhase?,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,faceNumber: freezed == faceNumber ? _self.faceNumber : faceNumber // ignore: cast_nullable_to_non_nullable
as String?,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of FaceAddState
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


/// Adds pattern-matching-related methods to [FaceAddState].
extension FaceAddStatePatterns on FaceAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceAddState value)  $default,){
final _that = this;
switch (_that) {
case _FaceAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceAddState value)?  $default,){
final _that = this;
switch (_that) {
case _FaceAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool started,  TTAddFacePhase? phase,  bool isRunning,  bool isSubmitting,  String hint,  String? faceNumber,  bool succeeded,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.started,_that.phase,_that.isRunning,_that.isSubmitting,_that.hint,_that.faceNumber,_that.succeeded,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool started,  TTAddFacePhase? phase,  bool isRunning,  bool isSubmitting,  String hint,  String? faceNumber,  bool succeeded,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _FaceAddState():
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.started,_that.phase,_that.isRunning,_that.isSubmitting,_that.hint,_that.faceNumber,_that.succeeded,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool started,  TTAddFacePhase? phase,  bool isRunning,  bool isSubmitting,  String hint,  String? faceNumber,  bool succeeded,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _FaceAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.started,_that.phase,_that.isRunning,_that.isSubmitting,_that.hint,_that.faceNumber,_that.succeeded,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _FaceAddState extends FaceAddState {
  const _FaceAddState({this.kind = CredentialValidityKind.permanent, this.showCyclic = true, this.startDate, this.endDate, this.schedule, this.started = false, this.phase, this.isRunning = false, this.isSubmitting = false, this.hint = '', this.faceNumber, this.succeeded = false, this.error}): super._();
  

@override@JsonKey() final  CredentialValidityKind kind;
/// 人脸始终展示循环选项（对齐开源），不探测能力位。
@override@JsonKey() final  bool showCyclic;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  CyclicSchedule? schedule;
/// 是否已发起过录入（用于首帧展示「开始录入」/ 停止后展示「重新添加」）。
@override@JsonKey() final  bool started;
/// BLE 采集当前相位（canStartAdd/collecting/error/success）。
@override final  TTAddFacePhase? phase;
/// BLE 采集流是否仍在运行。
@override@JsonKey() final  bool isRunning;
/// 云端确认（confirmAdd）是否进行中。
@override@JsonKey() final  bool isSubmitting;
/// 采集相位对应的实时提示（引导 / 误差编码文案）。
@override@JsonKey() final  String hint;
@override final  String? faceNumber;
/// BLE 采集 + 云端确认均成功。
@override@JsonKey() final  bool succeeded;
@override final  AppException? error;

/// Create a copy of FaceAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceAddStateCopyWith<_FaceAddState> get copyWith => __$FaceAddStateCopyWithImpl<_FaceAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.started, started) || other.started == started)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.faceNumber, faceNumber) || other.faceNumber == faceNumber)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,started,phase,isRunning,isSubmitting,hint,faceNumber,succeeded,error);

@override
String toString() {
  return 'FaceAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, started: $started, phase: $phase, isRunning: $isRunning, isSubmitting: $isSubmitting, hint: $hint, faceNumber: $faceNumber, succeeded: $succeeded, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FaceAddStateCopyWith<$Res> implements $FaceAddStateCopyWith<$Res> {
  factory _$FaceAddStateCopyWith(_FaceAddState value, $Res Function(_FaceAddState) _then) = __$FaceAddStateCopyWithImpl;
@override @useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool started, TTAddFacePhase? phase, bool isRunning, bool isSubmitting, String hint, String? faceNumber, bool succeeded, AppException? error
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$FaceAddStateCopyWithImpl<$Res>
    implements _$FaceAddStateCopyWith<$Res> {
  __$FaceAddStateCopyWithImpl(this._self, this._then);

  final _FaceAddState _self;
  final $Res Function(_FaceAddState) _then;

/// Create a copy of FaceAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? started = null,Object? phase = freezed,Object? isRunning = null,Object? isSubmitting = null,Object? hint = null,Object? faceNumber = freezed,Object? succeeded = null,Object? error = freezed,}) {
  return _then(_FaceAddState(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,started: null == started ? _self.started : started // ignore: cast_nullable_to_non_nullable
as bool,phase: freezed == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as TTAddFacePhase?,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,faceNumber: freezed == faceNumber ? _self.faceNumber : faceNumber // ignore: cast_nullable_to_non_nullable
as String?,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of FaceAddState
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
