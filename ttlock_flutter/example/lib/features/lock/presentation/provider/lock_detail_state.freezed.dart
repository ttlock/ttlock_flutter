// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockDetailState {

 LockEntity? get lock; bool get operating; AppException? get error; bool get showPasscode; bool get showCard; bool get showFingerprint; bool get showFace; bool get showPalmVein; bool get showQrCode;
/// Create a copy of LockDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockDetailStateCopyWith<LockDetailState> get copyWith => _$LockDetailStateCopyWithImpl<LockDetailState>(this as LockDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockDetailState&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error)&&(identical(other.showPasscode, showPasscode) || other.showPasscode == showPasscode)&&(identical(other.showCard, showCard) || other.showCard == showCard)&&(identical(other.showFingerprint, showFingerprint) || other.showFingerprint == showFingerprint)&&(identical(other.showFace, showFace) || other.showFace == showFace)&&(identical(other.showPalmVein, showPalmVein) || other.showPalmVein == showPalmVein)&&(identical(other.showQrCode, showQrCode) || other.showQrCode == showQrCode));
}


@override
int get hashCode => Object.hash(runtimeType,lock,operating,error,showPasscode,showCard,showFingerprint,showFace,showPalmVein,showQrCode);

@override
String toString() {
  return 'LockDetailState(lock: $lock, operating: $operating, error: $error, showPasscode: $showPasscode, showCard: $showCard, showFingerprint: $showFingerprint, showFace: $showFace, showPalmVein: $showPalmVein, showQrCode: $showQrCode)';
}


}

/// @nodoc
abstract mixin class $LockDetailStateCopyWith<$Res>  {
  factory $LockDetailStateCopyWith(LockDetailState value, $Res Function(LockDetailState) _then) = _$LockDetailStateCopyWithImpl;
@useResult
$Res call({
 LockEntity? lock, bool operating, AppException? error, bool showPasscode, bool showCard, bool showFingerprint, bool showFace, bool showPalmVein, bool showQrCode
});


$LockEntityCopyWith<$Res>? get lock;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$LockDetailStateCopyWithImpl<$Res>
    implements $LockDetailStateCopyWith<$Res> {
  _$LockDetailStateCopyWithImpl(this._self, this._then);

  final LockDetailState _self;
  final $Res Function(LockDetailState) _then;

/// Create a copy of LockDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lock = freezed,Object? operating = null,Object? error = freezed,Object? showPasscode = null,Object? showCard = null,Object? showFingerprint = null,Object? showFace = null,Object? showPalmVein = null,Object? showQrCode = null,}) {
  return _then(_self.copyWith(
lock: freezed == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity?,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,showPasscode: null == showPasscode ? _self.showPasscode : showPasscode // ignore: cast_nullable_to_non_nullable
as bool,showCard: null == showCard ? _self.showCard : showCard // ignore: cast_nullable_to_non_nullable
as bool,showFingerprint: null == showFingerprint ? _self.showFingerprint : showFingerprint // ignore: cast_nullable_to_non_nullable
as bool,showFace: null == showFace ? _self.showFace : showFace // ignore: cast_nullable_to_non_nullable
as bool,showPalmVein: null == showPalmVein ? _self.showPalmVein : showPalmVein // ignore: cast_nullable_to_non_nullable
as bool,showQrCode: null == showQrCode ? _self.showQrCode : showQrCode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res>? get lock {
    if (_self.lock == null) {
    return null;
  }

  return $LockEntityCopyWith<$Res>(_self.lock!, (value) {
    return _then(_self.copyWith(lock: value));
  });
}/// Create a copy of LockDetailState
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


/// Adds pattern-matching-related methods to [LockDetailState].
extension LockDetailStatePatterns on LockDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockDetailState value)  $default,){
final _that = this;
switch (_that) {
case _LockDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _LockDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LockEntity? lock,  bool operating,  AppException? error,  bool showPasscode,  bool showCard,  bool showFingerprint,  bool showFace,  bool showPalmVein,  bool showQrCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockDetailState() when $default != null:
return $default(_that.lock,_that.operating,_that.error,_that.showPasscode,_that.showCard,_that.showFingerprint,_that.showFace,_that.showPalmVein,_that.showQrCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LockEntity? lock,  bool operating,  AppException? error,  bool showPasscode,  bool showCard,  bool showFingerprint,  bool showFace,  bool showPalmVein,  bool showQrCode)  $default,) {final _that = this;
switch (_that) {
case _LockDetailState():
return $default(_that.lock,_that.operating,_that.error,_that.showPasscode,_that.showCard,_that.showFingerprint,_that.showFace,_that.showPalmVein,_that.showQrCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LockEntity? lock,  bool operating,  AppException? error,  bool showPasscode,  bool showCard,  bool showFingerprint,  bool showFace,  bool showPalmVein,  bool showQrCode)?  $default,) {final _that = this;
switch (_that) {
case _LockDetailState() when $default != null:
return $default(_that.lock,_that.operating,_that.error,_that.showPasscode,_that.showCard,_that.showFingerprint,_that.showFace,_that.showPalmVein,_that.showQrCode);case _:
  return null;

}
}

}

/// @nodoc


class _LockDetailState extends LockDetailState {
  const _LockDetailState({this.lock, this.operating = false, this.error, this.showPasscode = false, this.showCard = false, this.showFingerprint = false, this.showFace = false, this.showPalmVein = false, this.showQrCode = true}): super._();
  

@override final  LockEntity? lock;
@override@JsonKey() final  bool operating;
@override final  AppException? error;
@override@JsonKey() final  bool showPasscode;
@override@JsonKey() final  bool showCard;
@override@JsonKey() final  bool showFingerprint;
@override@JsonKey() final  bool showFace;
@override@JsonKey() final  bool showPalmVein;
@override@JsonKey() final  bool showQrCode;

/// Create a copy of LockDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockDetailStateCopyWith<_LockDetailState> get copyWith => __$LockDetailStateCopyWithImpl<_LockDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockDetailState&&(identical(other.lock, lock) || other.lock == lock)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error)&&(identical(other.showPasscode, showPasscode) || other.showPasscode == showPasscode)&&(identical(other.showCard, showCard) || other.showCard == showCard)&&(identical(other.showFingerprint, showFingerprint) || other.showFingerprint == showFingerprint)&&(identical(other.showFace, showFace) || other.showFace == showFace)&&(identical(other.showPalmVein, showPalmVein) || other.showPalmVein == showPalmVein)&&(identical(other.showQrCode, showQrCode) || other.showQrCode == showQrCode));
}


@override
int get hashCode => Object.hash(runtimeType,lock,operating,error,showPasscode,showCard,showFingerprint,showFace,showPalmVein,showQrCode);

@override
String toString() {
  return 'LockDetailState(lock: $lock, operating: $operating, error: $error, showPasscode: $showPasscode, showCard: $showCard, showFingerprint: $showFingerprint, showFace: $showFace, showPalmVein: $showPalmVein, showQrCode: $showQrCode)';
}


}

/// @nodoc
abstract mixin class _$LockDetailStateCopyWith<$Res> implements $LockDetailStateCopyWith<$Res> {
  factory _$LockDetailStateCopyWith(_LockDetailState value, $Res Function(_LockDetailState) _then) = __$LockDetailStateCopyWithImpl;
@override @useResult
$Res call({
 LockEntity? lock, bool operating, AppException? error, bool showPasscode, bool showCard, bool showFingerprint, bool showFace, bool showPalmVein, bool showQrCode
});


@override $LockEntityCopyWith<$Res>? get lock;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$LockDetailStateCopyWithImpl<$Res>
    implements _$LockDetailStateCopyWith<$Res> {
  __$LockDetailStateCopyWithImpl(this._self, this._then);

  final _LockDetailState _self;
  final $Res Function(_LockDetailState) _then;

/// Create a copy of LockDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lock = freezed,Object? operating = null,Object? error = freezed,Object? showPasscode = null,Object? showCard = null,Object? showFingerprint = null,Object? showFace = null,Object? showPalmVein = null,Object? showQrCode = null,}) {
  return _then(_LockDetailState(
lock: freezed == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity?,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,showPasscode: null == showPasscode ? _self.showPasscode : showPasscode // ignore: cast_nullable_to_non_nullable
as bool,showCard: null == showCard ? _self.showCard : showCard // ignore: cast_nullable_to_non_nullable
as bool,showFingerprint: null == showFingerprint ? _self.showFingerprint : showFingerprint // ignore: cast_nullable_to_non_nullable
as bool,showFace: null == showFace ? _self.showFace : showFace // ignore: cast_nullable_to_non_nullable
as bool,showPalmVein: null == showPalmVein ? _self.showPalmVein : showPalmVein // ignore: cast_nullable_to_non_nullable
as bool,showQrCode: null == showQrCode ? _self.showQrCode : showQrCode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LockDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LockEntityCopyWith<$Res>? get lock {
    if (_self.lock == null) {
    return null;
  }

  return $LockEntityCopyWith<$Res>(_self.lock!, (value) {
    return _then(_self.copyWith(lock: value));
  });
}/// Create a copy of LockDetailState
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
