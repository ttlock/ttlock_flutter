// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'palm_vein_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PalmVeinAddState {

 CredentialValidityKind get kind;/// 掌静脉复用 `cyclicCardOrFingerprint` 启发式探测（非官方掌静脉循环位）。
 bool get showCyclic; DateTime? get startDate; DateTime? get endDate; CyclicSchedule? get schedule;/// 是否已发起过录入（用于首帧展示「开始录入」/ 停止后展示「重新添加」）。
 bool get started;/// BLE 采集当前相位（canStartAdd/error/success，掌静脉无 collecting）。
 TTAddPalmVeinPhase? get phase;/// BLE 采集流是否仍在运行。
 bool get isRunning;/// 云端确认（confirmAdd）是否进行中。
 bool get isSubmitting;/// 采集相位对应的实时提示（引导 / 误差编码文案）。
 String get hint; String? get palmVeinNumber;/// BLE 采集 + 云端确认均成功。
 bool get succeeded; AppException? get error;
/// Create a copy of PalmVeinAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PalmVeinAddStateCopyWith<PalmVeinAddState> get copyWith => _$PalmVeinAddStateCopyWithImpl<PalmVeinAddState>(this as PalmVeinAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PalmVeinAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.started, started) || other.started == started)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.palmVeinNumber, palmVeinNumber) || other.palmVeinNumber == palmVeinNumber)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,started,phase,isRunning,isSubmitting,hint,palmVeinNumber,succeeded,error);

@override
String toString() {
  return 'PalmVeinAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, started: $started, phase: $phase, isRunning: $isRunning, isSubmitting: $isSubmitting, hint: $hint, palmVeinNumber: $palmVeinNumber, succeeded: $succeeded, error: $error)';
}


}

/// @nodoc
abstract mixin class $PalmVeinAddStateCopyWith<$Res>  {
  factory $PalmVeinAddStateCopyWith(PalmVeinAddState value, $Res Function(PalmVeinAddState) _then) = _$PalmVeinAddStateCopyWithImpl;
@useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool started, TTAddPalmVeinPhase? phase, bool isRunning, bool isSubmitting, String hint, String? palmVeinNumber, bool succeeded, AppException? error
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$PalmVeinAddStateCopyWithImpl<$Res>
    implements $PalmVeinAddStateCopyWith<$Res> {
  _$PalmVeinAddStateCopyWithImpl(this._self, this._then);

  final PalmVeinAddState _self;
  final $Res Function(PalmVeinAddState) _then;

/// Create a copy of PalmVeinAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? started = null,Object? phase = freezed,Object? isRunning = null,Object? isSubmitting = null,Object? hint = null,Object? palmVeinNumber = freezed,Object? succeeded = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,started: null == started ? _self.started : started // ignore: cast_nullable_to_non_nullable
as bool,phase: freezed == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as TTAddPalmVeinPhase?,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,palmVeinNumber: freezed == palmVeinNumber ? _self.palmVeinNumber : palmVeinNumber // ignore: cast_nullable_to_non_nullable
as String?,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of PalmVeinAddState
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


/// Adds pattern-matching-related methods to [PalmVeinAddState].
extension PalmVeinAddStatePatterns on PalmVeinAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PalmVeinAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PalmVeinAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PalmVeinAddState value)  $default,){
final _that = this;
switch (_that) {
case _PalmVeinAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PalmVeinAddState value)?  $default,){
final _that = this;
switch (_that) {
case _PalmVeinAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool started,  TTAddPalmVeinPhase? phase,  bool isRunning,  bool isSubmitting,  String hint,  String? palmVeinNumber,  bool succeeded,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PalmVeinAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.started,_that.phase,_that.isRunning,_that.isSubmitting,_that.hint,_that.palmVeinNumber,_that.succeeded,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool started,  TTAddPalmVeinPhase? phase,  bool isRunning,  bool isSubmitting,  String hint,  String? palmVeinNumber,  bool succeeded,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _PalmVeinAddState():
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.started,_that.phase,_that.isRunning,_that.isSubmitting,_that.hint,_that.palmVeinNumber,_that.succeeded,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool started,  TTAddPalmVeinPhase? phase,  bool isRunning,  bool isSubmitting,  String hint,  String? palmVeinNumber,  bool succeeded,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _PalmVeinAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.started,_that.phase,_that.isRunning,_that.isSubmitting,_that.hint,_that.palmVeinNumber,_that.succeeded,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PalmVeinAddState extends PalmVeinAddState {
  const _PalmVeinAddState({this.kind = CredentialValidityKind.permanent, this.showCyclic = false, this.startDate, this.endDate, this.schedule, this.started = false, this.phase, this.isRunning = false, this.isSubmitting = false, this.hint = '', this.palmVeinNumber, this.succeeded = false, this.error}): super._();
  

@override@JsonKey() final  CredentialValidityKind kind;
/// 掌静脉复用 `cyclicCardOrFingerprint` 启发式探测（非官方掌静脉循环位）。
@override@JsonKey() final  bool showCyclic;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  CyclicSchedule? schedule;
/// 是否已发起过录入（用于首帧展示「开始录入」/ 停止后展示「重新添加」）。
@override@JsonKey() final  bool started;
/// BLE 采集当前相位（canStartAdd/error/success，掌静脉无 collecting）。
@override final  TTAddPalmVeinPhase? phase;
/// BLE 采集流是否仍在运行。
@override@JsonKey() final  bool isRunning;
/// 云端确认（confirmAdd）是否进行中。
@override@JsonKey() final  bool isSubmitting;
/// 采集相位对应的实时提示（引导 / 误差编码文案）。
@override@JsonKey() final  String hint;
@override final  String? palmVeinNumber;
/// BLE 采集 + 云端确认均成功。
@override@JsonKey() final  bool succeeded;
@override final  AppException? error;

/// Create a copy of PalmVeinAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PalmVeinAddStateCopyWith<_PalmVeinAddState> get copyWith => __$PalmVeinAddStateCopyWithImpl<_PalmVeinAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PalmVeinAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.started, started) || other.started == started)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.palmVeinNumber, palmVeinNumber) || other.palmVeinNumber == palmVeinNumber)&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,started,phase,isRunning,isSubmitting,hint,palmVeinNumber,succeeded,error);

@override
String toString() {
  return 'PalmVeinAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, started: $started, phase: $phase, isRunning: $isRunning, isSubmitting: $isSubmitting, hint: $hint, palmVeinNumber: $palmVeinNumber, succeeded: $succeeded, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PalmVeinAddStateCopyWith<$Res> implements $PalmVeinAddStateCopyWith<$Res> {
  factory _$PalmVeinAddStateCopyWith(_PalmVeinAddState value, $Res Function(_PalmVeinAddState) _then) = __$PalmVeinAddStateCopyWithImpl;
@override @useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool started, TTAddPalmVeinPhase? phase, bool isRunning, bool isSubmitting, String hint, String? palmVeinNumber, bool succeeded, AppException? error
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$PalmVeinAddStateCopyWithImpl<$Res>
    implements _$PalmVeinAddStateCopyWith<$Res> {
  __$PalmVeinAddStateCopyWithImpl(this._self, this._then);

  final _PalmVeinAddState _self;
  final $Res Function(_PalmVeinAddState) _then;

/// Create a copy of PalmVeinAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? started = null,Object? phase = freezed,Object? isRunning = null,Object? isSubmitting = null,Object? hint = null,Object? palmVeinNumber = freezed,Object? succeeded = null,Object? error = freezed,}) {
  return _then(_PalmVeinAddState(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,started: null == started ? _self.started : started // ignore: cast_nullable_to_non_nullable
as bool,phase: freezed == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as TTAddPalmVeinPhase?,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,palmVeinNumber: freezed == palmVeinNumber ? _self.palmVeinNumber : palmVeinNumber // ignore: cast_nullable_to_non_nullable
as String?,succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of PalmVeinAddState
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
