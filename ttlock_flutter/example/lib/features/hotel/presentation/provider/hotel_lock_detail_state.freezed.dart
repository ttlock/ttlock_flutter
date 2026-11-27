// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_lock_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HotelLockDetailState {

 HotelLockEntity? get lock; bool get submitting;/// 普通错误（BLE 失败、hotelInfo 不可用等）；`cloudPending` 时不置此字段。
 AppException? get error;/// BLE 已成功、云端未同步。此时 [pendingSector] 必有值。
 bool get cloudPending; String? get pendingSector; bool get icKeyLoading; String? get icKey; AppException? get icKeyError;
/// Create a copy of HotelLockDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelLockDetailStateCopyWith<HotelLockDetailState> get copyWith => _$HotelLockDetailStateCopyWithImpl<HotelLockDetailState>(this as HotelLockDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelLockDetailState&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error)&&(identical(other.cloudPending, cloudPending) || other.cloudPending == cloudPending)&&(identical(other.pendingSector, pendingSector) || other.pendingSector == pendingSector)&&(identical(other.icKeyLoading, icKeyLoading) || other.icKeyLoading == icKeyLoading)&&(identical(other.icKey, icKey) || other.icKey == icKey)&&(identical(other.icKeyError, icKeyError) || other.icKeyError == icKeyError));
}


@override
int get hashCode => Object.hash(runtimeType,lock,submitting,error,cloudPending,pendingSector,icKeyLoading,icKey,icKeyError);

@override
String toString() {
  return 'HotelLockDetailState(lock: $lock, submitting: $submitting, error: $error, cloudPending: $cloudPending, pendingSector: $pendingSector, icKeyLoading: $icKeyLoading, icKey: $icKey, icKeyError: $icKeyError)';
}


}

/// @nodoc
abstract mixin class $HotelLockDetailStateCopyWith<$Res>  {
  factory $HotelLockDetailStateCopyWith(HotelLockDetailState value, $Res Function(HotelLockDetailState) _then) = _$HotelLockDetailStateCopyWithImpl;
@useResult
$Res call({
 HotelLockEntity? lock, bool submitting, AppException? error, bool cloudPending, String? pendingSector, bool icKeyLoading, String? icKey, AppException? icKeyError
});


$HotelLockEntityCopyWith<$Res>? get lock;$AppExceptionCopyWith<$Res>? get error;$AppExceptionCopyWith<$Res>? get icKeyError;

}
/// @nodoc
class _$HotelLockDetailStateCopyWithImpl<$Res>
    implements $HotelLockDetailStateCopyWith<$Res> {
  _$HotelLockDetailStateCopyWithImpl(this._self, this._then);

  final HotelLockDetailState _self;
  final $Res Function(HotelLockDetailState) _then;

/// Create a copy of HotelLockDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lock = freezed,Object? submitting = null,Object? error = freezed,Object? cloudPending = null,Object? pendingSector = freezed,Object? icKeyLoading = null,Object? icKey = freezed,Object? icKeyError = freezed,}) {
  return _then(_self.copyWith(
lock: freezed == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as HotelLockEntity?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,cloudPending: null == cloudPending ? _self.cloudPending : cloudPending // ignore: cast_nullable_to_non_nullable
as bool,pendingSector: freezed == pendingSector ? _self.pendingSector : pendingSector // ignore: cast_nullable_to_non_nullable
as String?,icKeyLoading: null == icKeyLoading ? _self.icKeyLoading : icKeyLoading // ignore: cast_nullable_to_non_nullable
as bool,icKey: freezed == icKey ? _self.icKey : icKey // ignore: cast_nullable_to_non_nullable
as String?,icKeyError: freezed == icKeyError ? _self.icKeyError : icKeyError // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of HotelLockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelLockEntityCopyWith<$Res>? get lock {
    if (_self.lock == null) {
    return null;
  }

  return $HotelLockEntityCopyWith<$Res>(_self.lock!, (value) {
    return _then(_self.copyWith(lock: value));
  });
}/// Create a copy of HotelLockDetailState
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
}/// Create a copy of HotelLockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get icKeyError {
    if (_self.icKeyError == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.icKeyError!, (value) {
    return _then(_self.copyWith(icKeyError: value));
  });
}
}


/// Adds pattern-matching-related methods to [HotelLockDetailState].
extension HotelLockDetailStatePatterns on HotelLockDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelLockDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelLockDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelLockDetailState value)  $default,){
final _that = this;
switch (_that) {
case _HotelLockDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelLockDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _HotelLockDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HotelLockEntity? lock,  bool submitting,  AppException? error,  bool cloudPending,  String? pendingSector,  bool icKeyLoading,  String? icKey,  AppException? icKeyError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelLockDetailState() when $default != null:
return $default(_that.lock,_that.submitting,_that.error,_that.cloudPending,_that.pendingSector,_that.icKeyLoading,_that.icKey,_that.icKeyError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HotelLockEntity? lock,  bool submitting,  AppException? error,  bool cloudPending,  String? pendingSector,  bool icKeyLoading,  String? icKey,  AppException? icKeyError)  $default,) {final _that = this;
switch (_that) {
case _HotelLockDetailState():
return $default(_that.lock,_that.submitting,_that.error,_that.cloudPending,_that.pendingSector,_that.icKeyLoading,_that.icKey,_that.icKeyError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HotelLockEntity? lock,  bool submitting,  AppException? error,  bool cloudPending,  String? pendingSector,  bool icKeyLoading,  String? icKey,  AppException? icKeyError)?  $default,) {final _that = this;
switch (_that) {
case _HotelLockDetailState() when $default != null:
return $default(_that.lock,_that.submitting,_that.error,_that.cloudPending,_that.pendingSector,_that.icKeyLoading,_that.icKey,_that.icKeyError);case _:
  return null;

}
}

}

/// @nodoc


class _HotelLockDetailState extends HotelLockDetailState {
  const _HotelLockDetailState({this.lock, this.submitting = false, this.error, this.cloudPending = false, this.pendingSector, this.icKeyLoading = false, this.icKey, this.icKeyError}): super._();
  

@override final  HotelLockEntity? lock;
@override@JsonKey() final  bool submitting;
/// 普通错误（BLE 失败、hotelInfo 不可用等）；`cloudPending` 时不置此字段。
@override final  AppException? error;
/// BLE 已成功、云端未同步。此时 [pendingSector] 必有值。
@override@JsonKey() final  bool cloudPending;
@override final  String? pendingSector;
@override@JsonKey() final  bool icKeyLoading;
@override final  String? icKey;
@override final  AppException? icKeyError;

/// Create a copy of HotelLockDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelLockDetailStateCopyWith<_HotelLockDetailState> get copyWith => __$HotelLockDetailStateCopyWithImpl<_HotelLockDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelLockDetailState&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.error, error) || other.error == error)&&(identical(other.cloudPending, cloudPending) || other.cloudPending == cloudPending)&&(identical(other.pendingSector, pendingSector) || other.pendingSector == pendingSector)&&(identical(other.icKeyLoading, icKeyLoading) || other.icKeyLoading == icKeyLoading)&&(identical(other.icKey, icKey) || other.icKey == icKey)&&(identical(other.icKeyError, icKeyError) || other.icKeyError == icKeyError));
}


@override
int get hashCode => Object.hash(runtimeType,lock,submitting,error,cloudPending,pendingSector,icKeyLoading,icKey,icKeyError);

@override
String toString() {
  return 'HotelLockDetailState(lock: $lock, submitting: $submitting, error: $error, cloudPending: $cloudPending, pendingSector: $pendingSector, icKeyLoading: $icKeyLoading, icKey: $icKey, icKeyError: $icKeyError)';
}


}

/// @nodoc
abstract mixin class _$HotelLockDetailStateCopyWith<$Res> implements $HotelLockDetailStateCopyWith<$Res> {
  factory _$HotelLockDetailStateCopyWith(_HotelLockDetailState value, $Res Function(_HotelLockDetailState) _then) = __$HotelLockDetailStateCopyWithImpl;
@override @useResult
$Res call({
 HotelLockEntity? lock, bool submitting, AppException? error, bool cloudPending, String? pendingSector, bool icKeyLoading, String? icKey, AppException? icKeyError
});


@override $HotelLockEntityCopyWith<$Res>? get lock;@override $AppExceptionCopyWith<$Res>? get error;@override $AppExceptionCopyWith<$Res>? get icKeyError;

}
/// @nodoc
class __$HotelLockDetailStateCopyWithImpl<$Res>
    implements _$HotelLockDetailStateCopyWith<$Res> {
  __$HotelLockDetailStateCopyWithImpl(this._self, this._then);

  final _HotelLockDetailState _self;
  final $Res Function(_HotelLockDetailState) _then;

/// Create a copy of HotelLockDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lock = freezed,Object? submitting = null,Object? error = freezed,Object? cloudPending = null,Object? pendingSector = freezed,Object? icKeyLoading = null,Object? icKey = freezed,Object? icKeyError = freezed,}) {
  return _then(_HotelLockDetailState(
lock: freezed == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as HotelLockEntity?,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,cloudPending: null == cloudPending ? _self.cloudPending : cloudPending // ignore: cast_nullable_to_non_nullable
as bool,pendingSector: freezed == pendingSector ? _self.pendingSector : pendingSector // ignore: cast_nullable_to_non_nullable
as String?,icKeyLoading: null == icKeyLoading ? _self.icKeyLoading : icKeyLoading // ignore: cast_nullable_to_non_nullable
as bool,icKey: freezed == icKey ? _self.icKey : icKey // ignore: cast_nullable_to_non_nullable
as String?,icKeyError: freezed == icKeyError ? _self.icKeyError : icKeyError // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of HotelLockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HotelLockEntityCopyWith<$Res>? get lock {
    if (_self.lock == null) {
    return null;
  }

  return $HotelLockEntityCopyWith<$Res>(_self.lock!, (value) {
    return _then(_self.copyWith(lock: value));
  });
}/// Create a copy of HotelLockDetailState
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
}/// Create a copy of HotelLockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get icKeyError {
    if (_self.icKeyError == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.icKeyError!, (value) {
    return _then(_self.copyWith(icKeyError: value));
  });
}
}

// dart format on
