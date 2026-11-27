// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CardAddArgs {

 LockEntity get lock; String? get keypadMac;
/// Create a copy of CardAddArgs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardAddArgsCopyWith<CardAddArgs> get copyWith => _$CardAddArgsCopyWithImpl<CardAddArgs>(this as CardAddArgs, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardAddArgs&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.keypadMac, keypadMac) || other.keypadMac == keypadMac));
}


@override
int get hashCode => Object.hash(runtimeType,lock,keypadMac);

@override
String toString() {
  return 'CardAddArgs(lock: $lock, keypadMac: $keypadMac)';
}


}

/// @nodoc
abstract mixin class $CardAddArgsCopyWith<$Res>  {
  factory $CardAddArgsCopyWith(CardAddArgs value, $Res Function(CardAddArgs) _then) = _$CardAddArgsCopyWithImpl;
@useResult
$Res call({
 LockEntity lock, String? keypadMac
});


$LockEntityCopyWith<$Res> get lock;

}
/// @nodoc
class _$CardAddArgsCopyWithImpl<$Res>
    implements $CardAddArgsCopyWith<$Res> {
  _$CardAddArgsCopyWithImpl(this._self, this._then);

  final CardAddArgs _self;
  final $Res Function(CardAddArgs) _then;

/// Create a copy of CardAddArgs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lock = null,Object? keypadMac = freezed,}) {
  return _then(_self.copyWith(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity,keypadMac: freezed == keypadMac ? _self.keypadMac : keypadMac // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CardAddArgs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res> get lock {
  
  return $LockEntityCopyWith<$Res>(_self.lock, (value) {
    return _then(_self.copyWith(lock: value));
  });
}
}


/// Adds pattern-matching-related methods to [CardAddArgs].
extension CardAddArgsPatterns on CardAddArgs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardAddArgs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardAddArgs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardAddArgs value)  $default,){
final _that = this;
switch (_that) {
case _CardAddArgs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardAddArgs value)?  $default,){
final _that = this;
switch (_that) {
case _CardAddArgs() when $default != null:
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
case _CardAddArgs() when $default != null:
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
case _CardAddArgs():
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
case _CardAddArgs() when $default != null:
return $default(_that.lock,_that.keypadMac);case _:
  return null;

}
}

}

/// @nodoc


class _CardAddArgs implements CardAddArgs {
  const _CardAddArgs({required this.lock, this.keypadMac});
  

@override final  LockEntity lock;
@override final  String? keypadMac;

/// Create a copy of CardAddArgs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardAddArgsCopyWith<_CardAddArgs> get copyWith => __$CardAddArgsCopyWithImpl<_CardAddArgs>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardAddArgs&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.keypadMac, keypadMac) || other.keypadMac == keypadMac));
}


@override
int get hashCode => Object.hash(runtimeType,lock,keypadMac);

@override
String toString() {
  return 'CardAddArgs(lock: $lock, keypadMac: $keypadMac)';
}


}

/// @nodoc
abstract mixin class _$CardAddArgsCopyWith<$Res> implements $CardAddArgsCopyWith<$Res> {
  factory _$CardAddArgsCopyWith(_CardAddArgs value, $Res Function(_CardAddArgs) _then) = __$CardAddArgsCopyWithImpl;
@override @useResult
$Res call({
 LockEntity lock, String? keypadMac
});


@override $LockEntityCopyWith<$Res> get lock;

}
/// @nodoc
class __$CardAddArgsCopyWithImpl<$Res>
    implements _$CardAddArgsCopyWith<$Res> {
  __$CardAddArgsCopyWithImpl(this._self, this._then);

  final _CardAddArgs _self;
  final $Res Function(_CardAddArgs) _then;

/// Create a copy of CardAddArgs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lock = null,Object? keypadMac = freezed,}) {
  return _then(_CardAddArgs(
lock: null == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity,keypadMac: freezed == keypadMac ? _self.keypadMac : keypadMac // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CardAddArgs
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
mixin _$CardAddState {

 CredentialValidityKind get kind; bool get showCyclic; DateTime? get startDate; DateTime? get endDate; CyclicSchedule? get schedule; bool get enrolling; bool get waiting;/// 取消后仍展示 enrollCancelHint（锁端录入模式未立即退出）。
 bool get showCancelHint; AppException? get error;/// 提交时刻的名称快照 —— 重试登记时用它，不吃用户之后对表单的修改。
 String? get cardName;/// 录入成功但云登记失败时保留的编号；重试登记用。
 String? get pendingCardNumber;/// 云登记失败，等待重试（此时锁里已有该卡，只是云端未登记）。
 bool get pendingRegister;
/// Create a copy of CardAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardAddStateCopyWith<CardAddState> get copyWith => _$CardAddStateCopyWithImpl<CardAddState>(this as CardAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.enrolling, enrolling) || other.enrolling == enrolling)&&(identical(other.waiting, waiting) || other.waiting == waiting)&&(identical(other.showCancelHint, showCancelHint) || other.showCancelHint == showCancelHint)&&(identical(other.error, error) || other.error == error)&&(identical(other.cardName, cardName) || other.cardName == cardName)&&(identical(other.pendingCardNumber, pendingCardNumber) || other.pendingCardNumber == pendingCardNumber)&&(identical(other.pendingRegister, pendingRegister) || other.pendingRegister == pendingRegister));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,enrolling,waiting,showCancelHint,error,cardName,pendingCardNumber,pendingRegister);

@override
String toString() {
  return 'CardAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, enrolling: $enrolling, waiting: $waiting, showCancelHint: $showCancelHint, error: $error, cardName: $cardName, pendingCardNumber: $pendingCardNumber, pendingRegister: $pendingRegister)';
}


}

/// @nodoc
abstract mixin class $CardAddStateCopyWith<$Res>  {
  factory $CardAddStateCopyWith(CardAddState value, $Res Function(CardAddState) _then) = _$CardAddStateCopyWithImpl;
@useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool enrolling, bool waiting, bool showCancelHint, AppException? error, String? cardName, String? pendingCardNumber, bool pendingRegister
});


$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$CardAddStateCopyWithImpl<$Res>
    implements $CardAddStateCopyWith<$Res> {
  _$CardAddStateCopyWithImpl(this._self, this._then);

  final CardAddState _self;
  final $Res Function(CardAddState) _then;

/// Create a copy of CardAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? enrolling = null,Object? waiting = null,Object? showCancelHint = null,Object? error = freezed,Object? cardName = freezed,Object? pendingCardNumber = freezed,Object? pendingRegister = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,enrolling: null == enrolling ? _self.enrolling : enrolling // ignore: cast_nullable_to_non_nullable
as bool,waiting: null == waiting ? _self.waiting : waiting // ignore: cast_nullable_to_non_nullable
as bool,showCancelHint: null == showCancelHint ? _self.showCancelHint : showCancelHint // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,cardName: freezed == cardName ? _self.cardName : cardName // ignore: cast_nullable_to_non_nullable
as String?,pendingCardNumber: freezed == pendingCardNumber ? _self.pendingCardNumber : pendingCardNumber // ignore: cast_nullable_to_non_nullable
as String?,pendingRegister: null == pendingRegister ? _self.pendingRegister : pendingRegister // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CardAddState
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


/// Adds pattern-matching-related methods to [CardAddState].
extension CardAddStatePatterns on CardAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardAddState value)  $default,){
final _that = this;
switch (_that) {
case _CardAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardAddState value)?  $default,){
final _that = this;
switch (_that) {
case _CardAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool enrolling,  bool waiting,  bool showCancelHint,  AppException? error,  String? cardName,  String? pendingCardNumber,  bool pendingRegister)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.enrolling,_that.waiting,_that.showCancelHint,_that.error,_that.cardName,_that.pendingCardNumber,_that.pendingRegister);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool enrolling,  bool waiting,  bool showCancelHint,  AppException? error,  String? cardName,  String? pendingCardNumber,  bool pendingRegister)  $default,) {final _that = this;
switch (_that) {
case _CardAddState():
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.enrolling,_that.waiting,_that.showCancelHint,_that.error,_that.cardName,_that.pendingCardNumber,_that.pendingRegister);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CredentialValidityKind kind,  bool showCyclic,  DateTime? startDate,  DateTime? endDate,  CyclicSchedule? schedule,  bool enrolling,  bool waiting,  bool showCancelHint,  AppException? error,  String? cardName,  String? pendingCardNumber,  bool pendingRegister)?  $default,) {final _that = this;
switch (_that) {
case _CardAddState() when $default != null:
return $default(_that.kind,_that.showCyclic,_that.startDate,_that.endDate,_that.schedule,_that.enrolling,_that.waiting,_that.showCancelHint,_that.error,_that.cardName,_that.pendingCardNumber,_that.pendingRegister);case _:
  return null;

}
}

}

/// @nodoc


class _CardAddState extends CardAddState {
  const _CardAddState({this.kind = CredentialValidityKind.permanent, this.showCyclic = false, this.startDate, this.endDate, this.schedule, this.enrolling = false, this.waiting = false, this.showCancelHint = false, this.error, this.cardName, this.pendingCardNumber, this.pendingRegister = false}): super._();
  

@override@JsonKey() final  CredentialValidityKind kind;
@override@JsonKey() final  bool showCyclic;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  CyclicSchedule? schedule;
@override@JsonKey() final  bool enrolling;
@override@JsonKey() final  bool waiting;
/// 取消后仍展示 enrollCancelHint（锁端录入模式未立即退出）。
@override@JsonKey() final  bool showCancelHint;
@override final  AppException? error;
/// 提交时刻的名称快照 —— 重试登记时用它，不吃用户之后对表单的修改。
@override final  String? cardName;
/// 录入成功但云登记失败时保留的编号；重试登记用。
@override final  String? pendingCardNumber;
/// 云登记失败，等待重试（此时锁里已有该卡，只是云端未登记）。
@override@JsonKey() final  bool pendingRegister;

/// Create a copy of CardAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardAddStateCopyWith<_CardAddState> get copyWith => __$CardAddStateCopyWithImpl<_CardAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardAddState&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.showCyclic, showCyclic) || other.showCyclic == showCyclic)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.enrolling, enrolling) || other.enrolling == enrolling)&&(identical(other.waiting, waiting) || other.waiting == waiting)&&(identical(other.showCancelHint, showCancelHint) || other.showCancelHint == showCancelHint)&&(identical(other.error, error) || other.error == error)&&(identical(other.cardName, cardName) || other.cardName == cardName)&&(identical(other.pendingCardNumber, pendingCardNumber) || other.pendingCardNumber == pendingCardNumber)&&(identical(other.pendingRegister, pendingRegister) || other.pendingRegister == pendingRegister));
}


@override
int get hashCode => Object.hash(runtimeType,kind,showCyclic,startDate,endDate,schedule,enrolling,waiting,showCancelHint,error,cardName,pendingCardNumber,pendingRegister);

@override
String toString() {
  return 'CardAddState(kind: $kind, showCyclic: $showCyclic, startDate: $startDate, endDate: $endDate, schedule: $schedule, enrolling: $enrolling, waiting: $waiting, showCancelHint: $showCancelHint, error: $error, cardName: $cardName, pendingCardNumber: $pendingCardNumber, pendingRegister: $pendingRegister)';
}


}

/// @nodoc
abstract mixin class _$CardAddStateCopyWith<$Res> implements $CardAddStateCopyWith<$Res> {
  factory _$CardAddStateCopyWith(_CardAddState value, $Res Function(_CardAddState) _then) = __$CardAddStateCopyWithImpl;
@override @useResult
$Res call({
 CredentialValidityKind kind, bool showCyclic, DateTime? startDate, DateTime? endDate, CyclicSchedule? schedule, bool enrolling, bool waiting, bool showCancelHint, AppException? error, String? cardName, String? pendingCardNumber, bool pendingRegister
});


@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$CardAddStateCopyWithImpl<$Res>
    implements _$CardAddStateCopyWith<$Res> {
  __$CardAddStateCopyWithImpl(this._self, this._then);

  final _CardAddState _self;
  final $Res Function(_CardAddState) _then;

/// Create a copy of CardAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? showCyclic = null,Object? startDate = freezed,Object? endDate = freezed,Object? schedule = freezed,Object? enrolling = null,Object? waiting = null,Object? showCancelHint = null,Object? error = freezed,Object? cardName = freezed,Object? pendingCardNumber = freezed,Object? pendingRegister = null,}) {
  return _then(_CardAddState(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CredentialValidityKind,showCyclic: null == showCyclic ? _self.showCyclic : showCyclic // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as CyclicSchedule?,enrolling: null == enrolling ? _self.enrolling : enrolling // ignore: cast_nullable_to_non_nullable
as bool,waiting: null == waiting ? _self.waiting : waiting // ignore: cast_nullable_to_non_nullable
as bool,showCancelHint: null == showCancelHint ? _self.showCancelHint : showCancelHint // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,cardName: freezed == cardName ? _self.cardName : cardName // ignore: cast_nullable_to_non_nullable
as String?,pendingCardNumber: freezed == pendingCardNumber ? _self.pendingCardNumber : pendingCardNumber // ignore: cast_nullable_to_non_nullable
as String?,pendingRegister: null == pendingRegister ? _self.pendingRegister : pendingRegister // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CardAddState
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
