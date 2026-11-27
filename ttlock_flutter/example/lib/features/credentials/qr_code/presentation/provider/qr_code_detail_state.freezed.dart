// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_code_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QrCodeDetailState {

 QrCodeEntity get qrCode; bool get operating; AppException? get error;
/// Create a copy of QrCodeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrCodeDetailStateCopyWith<QrCodeDetailState> get copyWith => _$QrCodeDetailStateCopyWithImpl<QrCodeDetailState>(this as QrCodeDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrCodeDetailState&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,qrCode,operating,error);

@override
String toString() {
  return 'QrCodeDetailState(qrCode: $qrCode, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class $QrCodeDetailStateCopyWith<$Res>  {
  factory $QrCodeDetailStateCopyWith(QrCodeDetailState value, $Res Function(QrCodeDetailState) _then) = _$QrCodeDetailStateCopyWithImpl;
@useResult
$Res call({
 QrCodeEntity qrCode, bool operating, AppException? error
});


$QrCodeEntityCopyWith<$Res> get qrCode;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$QrCodeDetailStateCopyWithImpl<$Res>
    implements $QrCodeDetailStateCopyWith<$Res> {
  _$QrCodeDetailStateCopyWithImpl(this._self, this._then);

  final QrCodeDetailState _self;
  final $Res Function(QrCodeDetailState) _then;

/// Create a copy of QrCodeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? qrCode = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
qrCode: null == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as QrCodeEntity,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of QrCodeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrCodeEntityCopyWith<$Res> get qrCode {
  
  return $QrCodeEntityCopyWith<$Res>(_self.qrCode, (value) {
    return _then(_self.copyWith(qrCode: value));
  });
}/// Create a copy of QrCodeDetailState
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


/// Adds pattern-matching-related methods to [QrCodeDetailState].
extension QrCodeDetailStatePatterns on QrCodeDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrCodeDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrCodeDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrCodeDetailState value)  $default,){
final _that = this;
switch (_that) {
case _QrCodeDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrCodeDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _QrCodeDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QrCodeEntity qrCode,  bool operating,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrCodeDetailState() when $default != null:
return $default(_that.qrCode,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QrCodeEntity qrCode,  bool operating,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _QrCodeDetailState():
return $default(_that.qrCode,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QrCodeEntity qrCode,  bool operating,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _QrCodeDetailState() when $default != null:
return $default(_that.qrCode,_that.operating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _QrCodeDetailState extends QrCodeDetailState {
  const _QrCodeDetailState({required this.qrCode, this.operating = false, this.error}): super._();
  

@override final  QrCodeEntity qrCode;
@override@JsonKey() final  bool operating;
@override final  AppException? error;

/// Create a copy of QrCodeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrCodeDetailStateCopyWith<_QrCodeDetailState> get copyWith => __$QrCodeDetailStateCopyWithImpl<_QrCodeDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrCodeDetailState&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,qrCode,operating,error);

@override
String toString() {
  return 'QrCodeDetailState(qrCode: $qrCode, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$QrCodeDetailStateCopyWith<$Res> implements $QrCodeDetailStateCopyWith<$Res> {
  factory _$QrCodeDetailStateCopyWith(_QrCodeDetailState value, $Res Function(_QrCodeDetailState) _then) = __$QrCodeDetailStateCopyWithImpl;
@override @useResult
$Res call({
 QrCodeEntity qrCode, bool operating, AppException? error
});


@override $QrCodeEntityCopyWith<$Res> get qrCode;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$QrCodeDetailStateCopyWithImpl<$Res>
    implements _$QrCodeDetailStateCopyWith<$Res> {
  __$QrCodeDetailStateCopyWithImpl(this._self, this._then);

  final _QrCodeDetailState _self;
  final $Res Function(_QrCodeDetailState) _then;

/// Create a copy of QrCodeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? qrCode = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_QrCodeDetailState(
qrCode: null == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as QrCodeEntity,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of QrCodeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrCodeEntityCopyWith<$Res> get qrCode {
  
  return $QrCodeEntityCopyWith<$Res>(_self.qrCode, (value) {
    return _then(_self.copyWith(qrCode: value));
  });
}/// Create a copy of QrCodeDetailState
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
