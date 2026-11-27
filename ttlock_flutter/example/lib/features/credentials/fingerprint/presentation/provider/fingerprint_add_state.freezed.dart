// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fingerprint_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FingerprintAddArgs {

 LockEntity get lock; String? get keypadMac;
/// Create a copy of FingerprintAddArgs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FingerprintAddArgsCopyWith<FingerprintAddArgs> get copyWith => _$FingerprintAddArgsCopyWithImpl<FingerprintAddArgs>(this as FingerprintAddArgs, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FingerprintAddArgs&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.keypadMac, keypadMac) || other.keypadMac == keypadMac));
}


@override
int get hashCode => Object.hash(runtimeType,lock,keypadMac);

@override
String toString() {
  return 'FingerprintAddArgs(lock: $lock, keypadMac: $keypadMac)';
}


}

/// @nodoc
abstract mixin class $FingerprintAddArgsCopyWith<$Res>  {
  factory $FingerprintAddArgsCopyWith(FingerprintAddArgs value, $Res Function(FingerprintAddArgs) _then) = _$FingerprintAddArgsCopyWithImpl;
@useResult
$Res call({
 LockEntity lock, String? keypadMac
});


$LockEntityCopyWith<$Res> get lock;

}
/// @nodoc
class _$FingerprintAddArgsCopyWithImpl<$Res>
    implements $FingerprintAddArgsCopyWith<$Res> {
  _$FingerprintAddArgsCopyWithImpl(this._self, this._then);

  final FingerprintAddArgs _self;
  final $Res Function(FingerprintAddArgs) _then;

/// Create a copy of FingerprintAddArgs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lock = null,Object? keypadMac = freezed,}) {
  return _then(_self.copyWith(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity,keypadMac: freezed == keypadMac ? _self.keypadMac : keypadMac // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FingerprintAddArgs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res> get lock {
  
  return $LockEntityCopyWith<$Res>(_self.lock, (value) {
    return _then(_self.copyWith(lock: value));
  });
}
}


/// Adds pattern-matching-related methods to [FingerprintAddArgs].
extension FingerprintAddArgsPatterns on FingerprintAddArgs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FingerprintAddArgs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FingerprintAddArgs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FingerprintAddArgs value)  $default,){
final _that = this;
switch (_that) {
case _FingerprintAddArgs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FingerprintAddArgs value)?  $default,){
final _that = this;
switch (_that) {
case _FingerprintAddArgs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LockEntity lock,  String? keypadMac)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FingerprintAddArgs() when $default != null:
return $default(_that.lock,_that.keypadMac);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LockEntity lock,  String? keypadMac)  $default,) {final _that = this;
switch (_that) {
case _FingerprintAddArgs():
return $default(_that.lock,_that.keypadMac);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LockEntity lock,  String? keypadMac)?  $default,) {final _that = this;
switch (_that) {
case _FingerprintAddArgs() when $default != null:
return $default(_that.lock,_that.keypadMac);case _:
  return null;

}
}

}

/// @nodoc


class _FingerprintAddArgs implements FingerprintAddArgs {
  const _FingerprintAddArgs({required this.lock, this.keypadMac});
  

@override final  LockEntity lock;
@override final  String? keypadMac;

/// Create a copy of FingerprintAddArgs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FingerprintAddArgsCopyWith<_FingerprintAddArgs> get copyWith => __$FingerprintAddArgsCopyWithImpl<_FingerprintAddArgs>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FingerprintAddArgs&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.keypadMac, keypadMac) || other.keypadMac == keypadMac));
}


@override
int get hashCode => Object.hash(runtimeType,lock,keypadMac);

@override
String toString() {
  return 'FingerprintAddArgs(lock: $lock, keypadMac: $keypadMac)';
}


}

/// @nodoc
abstract mixin class _$FingerprintAddArgsCopyWith<$Res> implements $FingerprintAddArgsCopyWith<$Res> {
  factory _$FingerprintAddArgsCopyWith(_FingerprintAddArgs value, $Res Function(_FingerprintAddArgs) _then) = __$FingerprintAddArgsCopyWithImpl;
@override @useResult
$Res call({
 LockEntity lock, String? keypadMac
});


@override $LockEntityCopyWith<$Res> get lock;

}
/// @nodoc
class __$FingerprintAddArgsCopyWithImpl<$Res>
    implements _$FingerprintAddArgsCopyWith<$Res> {
  __$FingerprintAddArgsCopyWithImpl(this._self, this._then);

  final _FingerprintAddArgs _self;
  final $Res Function(_FingerprintAddArgs) _then;

/// Create a copy of FingerprintAddArgs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lock = null,Object? keypadMac = freezed,}) {
  return _then(_FingerprintAddArgs(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity,keypadMac: freezed == keypadMac ? _self.keypadMac : keypadMac // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FingerprintAddArgs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res> get lock {
  
  return $LockEntityCopyWith<$Res>(_self.lock, (value) {
    return _then(_self.copyWith(lock: value));
  });
}
}

/// @nodoc
mixin _$FingerprintAddState {

 CredentialValidityKind get kind; bool get showCyclic; DateTime? get startDate; DateTime? get endDate; CyclicSchedule? get schedule; bool get enrolling; bool get waiting; bool get collecting; int? get currentCount; int? get totalCount;/// 取消后仍展示 enrollCancelHint（锁端录入模式未立即退出）。
 bool get showCancelHint; AppException? get error;/// 提交时刻的名称快照 —— 重试登记时用它，不吃用户之后对表单的修改。
 String? get fingerprintName;/// 录入成功但云登记失败时保留的编号；重试登记用。
 String? get pendingFingerprintNumber;/// 云登记失败，等待重试（此时锁里已有该指纹，只是云端未登记）。
 bool get pendingRegister;
/// Create a copy of FingerprintAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FingerprintAddStateCopyWith<FingerprintAddState> get copyWith => _$FingerprintAddStateCopyWithImpl<FingerprintAddState>(this as FingerprintAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FingerprintAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.enrolling, enrolling) || other.enrolling == enrolling)&&(identical(other.waiting, waiting) || other.waiting == waiting)&&(identical(other.collecting, collecting) || other.collecting == collecting)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.showCancelHint, showCancelHint) || other.showCancelHint == showCancelHint)&&(identical(other.error, error) || other.error == error)&&(identical(other.fingerprintName, fingerprintName) || other.fingerprintName == fingerprintName)&&(identical(other.pendingFingerprintNumber, pendingFingerprintNumber) || other.pendingFingerprintNumber == pendingFingerprintNumber)&&(identical(other.pendingRegister, pendingRegister) || other.pendingRegister == pendingRegister));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,enrolling,waiting,collecting,currentCount,totalCount,showCancelHint,error,fingerprintName,pendingFingerprintNumber,pendingRegister);

@override
String toString() {
  return 'FingerprintAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, enrolling: $enrolling, waiting: $waiting, collecting: $collecting, currentCount: $currentCount, totalCount: $totalCount, showCancelHint: $showCancelHint, error: $error, fingerprintName: $fingerprintName, pendingFingerprintNumber: $pendingFingerprintNumber, pendingRegister: $pendingRegister)';
}


}

/// @nodoc
abstract mixin class $FingerprintAddStateCopyWith<$Res>  {
  factory $FingerprintAddStateCopyWith(FingerprintAddState value, $Res Function(FingerprintAddState) _then) = _$FingerprintAddStateCopyWithImpl;
@useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool enrolling, bool waiting, bool collecting, int? currentCount, int? totalCount, bool showCancelHint, AppException? error, String? fingerprintName, String? pendingFingerprintNumber, bool pendingRegister
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$FingerprintAddStateCopyWithImpl<$Res>
    implements $FingerprintAddStateCopyWith<$Res> {
  _$FingerprintAddStateCopyWithImpl(this._self, this._then);

  final FingerprintAddState _self;
  final $Res Function(FingerprintAddState) _then;

/// Create a copy of FingerprintAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? enrolling = null,Object? waiting = null,Object? collecting = null,Object? currentCount = freezed,Object? totalCount = freezed,Object? showCancelHint = null,Object? error = freezed,Object? fingerprintName = freezed,Object? pendingFingerprintNumber = freezed,Object? pendingRegister = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,enrolling: null == enrolling ? _self.enrolling : enrolling // ignore: cast_nullable_to_non_nullable
as bool,waiting: null == waiting ? _self.waiting : waiting // ignore: cast_nullable_to_non_nullable
as bool,collecting: null == collecting ? _self.collecting : collecting // ignore: cast_nullable_to_non_nullable
as bool,currentCount: freezed == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,showCancelHint: null == showCancelHint ? _self.showCancelHint : showCancelHint // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,fingerprintName: freezed == fingerprintName ? _self.fingerprintName : fingerprintName // ignore: cast_nullable_to_non_nullable
as String?,pendingFingerprintNumber: freezed == pendingFingerprintNumber ? _self.pendingFingerprintNumber : pendingFingerprintNumber // ignore: cast_nullable_to_non_nullable
as String?,pendingRegister: null == pendingRegister ? _self.pendingRegister : pendingRegister // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of FingerprintAddState
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


/// Adds pattern-matching-related methods to [FingerprintAddState].
extension FingerprintAddStatePatterns on FingerprintAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FingerprintAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FingerprintAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FingerprintAddState value)  $default,){
final _that = this;
switch (_that) {
case _FingerprintAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FingerprintAddState value)?  $default,){
final _that = this;
switch (_that) {
case _FingerprintAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool enrolling,  bool waiting,  bool collecting,  int? currentCount,  int? totalCount,  bool showCancelHint,  AppException? error,  String? fingerprintName,  String? pendingFingerprintNumber,  bool pendingRegister)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FingerprintAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.enrolling,_that.waiting,_that.collecting,_that.currentCount,_that.totalCount,_that.showCancelHint,_that.error,_that.fingerprintName,_that.pendingFingerprintNumber,_that.pendingRegister);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool enrolling,  bool waiting,  bool collecting,  int? currentCount,  int? totalCount,  bool showCancelHint,  AppException? error,  String? fingerprintName,  String? pendingFingerprintNumber,  bool pendingRegister)  $default,) {final _that = this;
switch (_that) {
case _FingerprintAddState():
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.enrolling,_that.waiting,_that.collecting,_that.currentCount,_that.totalCount,_that.showCancelHint,_that.error,_that.fingerprintName,_that.pendingFingerprintNumber,_that.pendingRegister);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool enrolling,  bool waiting,  bool collecting,  int? currentCount,  int? totalCount,  bool showCancelHint,  AppException? error,  String? fingerprintName,  String? pendingFingerprintNumber,  bool pendingRegister)?  $default,) {final _that = this;
switch (_that) {
case _FingerprintAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.enrolling,_that.waiting,_that.collecting,_that.currentCount,_that.totalCount,_that.showCancelHint,_that.error,_that.fingerprintName,_that.pendingFingerprintNumber,_that.pendingRegister);case _:
  return null;

}
}

}

/// @nodoc


class _FingerprintAddState extends FingerprintAddState {
  const _FingerprintAddState({this.kind = CredentialValidityKind.permanent, this.showCyclic = false, this.startDate, this.endDate, this.schedule, this.enrolling = false, this.waiting = false, this.collecting = false, this.currentCount, this.totalCount, this.showCancelHint = false, this.error, this.fingerprintName, this.pendingFingerprintNumber, this.pendingRegister = false}): super._();
  

@override@JsonKey() final  CredentialValidityKind kind;
@override@JsonKey() final  bool showCyclic;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  CyclicSchedule? schedule;
@override@JsonKey() final  bool enrolling;
@override@JsonKey() final  bool waiting;
@override@JsonKey() final  bool collecting;
@override final  int? currentCount;
@override final  int? totalCount;
/// 取消后仍展示 enrollCancelHint（锁端录入模式未立即退出）。
@override@JsonKey() final  bool showCancelHint;
@override final  AppException? error;
/// 提交时刻的名称快照 —— 重试登记时用它，不吃用户之后对表单的修改。
@override final  String? fingerprintName;
/// 录入成功但云登记失败时保留的编号；重试登记用。
@override final  String? pendingFingerprintNumber;
/// 云登记失败，等待重试（此时锁里已有该指纹，只是云端未登记）。
@override@JsonKey() final  bool pendingRegister;

/// Create a copy of FingerprintAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FingerprintAddStateCopyWith<_FingerprintAddState> get copyWith => __$FingerprintAddStateCopyWithImpl<_FingerprintAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FingerprintAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.enrolling, enrolling) || other.enrolling == enrolling)&&(identical(other.waiting, waiting) || other.waiting == waiting)&&(identical(other.collecting, collecting) || other.collecting == collecting)&&(identical(other.currentCount, currentCount) || other.currentCount == currentCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.showCancelHint, showCancelHint) || other.showCancelHint == showCancelHint)&&(identical(other.error, error) || other.error == error)&&(identical(other.fingerprintName, fingerprintName) || other.fingerprintName == fingerprintName)&&(identical(other.pendingFingerprintNumber, pendingFingerprintNumber) || other.pendingFingerprintNumber == pendingFingerprintNumber)&&(identical(other.pendingRegister, pendingRegister) || other.pendingRegister == pendingRegister));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,enrolling,waiting,collecting,currentCount,totalCount,showCancelHint,error,fingerprintName,pendingFingerprintNumber,pendingRegister);

@override
String toString() {
  return 'FingerprintAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, enrolling: $enrolling, waiting: $waiting, collecting: $collecting, currentCount: $currentCount, totalCount: $totalCount, showCancelHint: $showCancelHint, error: $error, fingerprintName: $fingerprintName, pendingFingerprintNumber: $pendingFingerprintNumber, pendingRegister: $pendingRegister)';
}


}

/// @nodoc
abstract mixin class _$FingerprintAddStateCopyWith<$Res> implements $FingerprintAddStateCopyWith<$Res> {
  factory _$FingerprintAddStateCopyWith(_FingerprintAddState value, $Res Function(_FingerprintAddState) _then) = __$FingerprintAddStateCopyWithImpl;
@override @useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool enrolling, bool waiting, bool collecting, int? currentCount, int? totalCount, bool showCancelHint, AppException? error, String? fingerprintName, String? pendingFingerprintNumber, bool pendingRegister
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$FingerprintAddStateCopyWithImpl<$Res>
    implements _$FingerprintAddStateCopyWith<$Res> {
  __$FingerprintAddStateCopyWithImpl(this._self, this._then);

  final _FingerprintAddState _self;
  final $Res Function(_FingerprintAddState) _then;

/// Create a copy of FingerprintAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? enrolling = null,Object? waiting = null,Object? collecting = null,Object? currentCount = freezed,Object? totalCount = freezed,Object? showCancelHint = null,Object? error = freezed,Object? fingerprintName = freezed,Object? pendingFingerprintNumber = freezed,Object? pendingRegister = null,}) {
  return _then(_FingerprintAddState(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,enrolling: null == enrolling ? _self.enrolling : enrolling // ignore: cast_nullable_to_non_nullable
as bool,waiting: null == waiting ? _self.waiting : waiting // ignore: cast_nullable_to_non_nullable
as bool,collecting: null == collecting ? _self.collecting : collecting // ignore: cast_nullable_to_non_nullable
as bool,currentCount: freezed == currentCount ? _self.currentCount : currentCount // ignore: cast_nullable_to_non_nullable
as int?,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,showCancelHint: null == showCancelHint ? _self.showCancelHint : showCancelHint // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,fingerprintName: freezed == fingerprintName ? _self.fingerprintName : fingerprintName // ignore: cast_nullable_to_non_nullable
as String?,pendingFingerprintNumber: freezed == pendingFingerprintNumber ? _self.pendingFingerprintNumber : pendingFingerprintNumber // ignore: cast_nullable_to_non_nullable
as String?,pendingRegister: null == pendingRegister ? _self.pendingRegister : pendingRegister // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FingerprintAddState
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
