// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passcode_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasscodeDetailState {

 KeyboardPwdEntity get pwd; bool get operating; AppException? get error;
/// Create a copy of PasscodeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasscodeDetailStateCopyWith<PasscodeDetailState> get copyWith => _$PasscodeDetailStateCopyWithImpl<PasscodeDetailState>(this as PasscodeDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasscodeDetailState&&(identical(other.pwd, pwd) || other.pwd == pwd)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,pwd,operating,error);

@override
String toString() {
  return 'PasscodeDetailState(pwd: $pwd, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class $PasscodeDetailStateCopyWith<$Res>  {
  factory $PasscodeDetailStateCopyWith(PasscodeDetailState value, $Res Function(PasscodeDetailState) _then) = _$PasscodeDetailStateCopyWithImpl;
@useResult
$Res call({
 KeyboardPwdEntity pwd, bool operating, AppException? error
});


$KeyboardPwdEntityCopyWith<$Res> get pwd;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$PasscodeDetailStateCopyWithImpl<$Res>
    implements $PasscodeDetailStateCopyWith<$Res> {
  _$PasscodeDetailStateCopyWithImpl(this._self, this._then);

  final PasscodeDetailState _self;
  final $Res Function(PasscodeDetailState) _then;

/// Create a copy of PasscodeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pwd = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
pwd: null == pwd ? _self.pwd : pwd // ignore: cast_nullable_to_non_nullable
as KeyboardPwdEntity,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of PasscodeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyboardPwdEntityCopyWith<$Res> get pwd {
  
  return $KeyboardPwdEntityCopyWith<$Res>(_self.pwd, (value) {
    return _then(_self.copyWith(pwd: value));
  });
}/// Create a copy of PasscodeDetailState
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


/// Adds pattern-matching-related methods to [PasscodeDetailState].
extension PasscodeDetailStatePatterns on PasscodeDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasscodeDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasscodeDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasscodeDetailState value)  $default,){
final _that = this;
switch (_that) {
case _PasscodeDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasscodeDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _PasscodeDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( KeyboardPwdEntity pwd,  bool operating,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasscodeDetailState() when $default != null:
return $default(_that.pwd,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( KeyboardPwdEntity pwd,  bool operating,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _PasscodeDetailState():
return $default(_that.pwd,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( KeyboardPwdEntity pwd,  bool operating,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _PasscodeDetailState() when $default != null:
return $default(_that.pwd,_that.operating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PasscodeDetailState extends PasscodeDetailState {
  const _PasscodeDetailState({required this.pwd, this.operating = false, this.error}): super._();
  

@override final  KeyboardPwdEntity pwd;
@override@JsonKey() final  bool operating;
@override final  AppException? error;

/// Create a copy of PasscodeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasscodeDetailStateCopyWith<_PasscodeDetailState> get copyWith => __$PasscodeDetailStateCopyWithImpl<_PasscodeDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasscodeDetailState&&(identical(other.pwd, pwd) || other.pwd == pwd)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,pwd,operating,error);

@override
String toString() {
  return 'PasscodeDetailState(pwd: $pwd, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PasscodeDetailStateCopyWith<$Res> implements $PasscodeDetailStateCopyWith<$Res> {
  factory _$PasscodeDetailStateCopyWith(_PasscodeDetailState value, $Res Function(_PasscodeDetailState) _then) = __$PasscodeDetailStateCopyWithImpl;
@override @useResult
$Res call({
 KeyboardPwdEntity pwd, bool operating, AppException? error
});


@override $KeyboardPwdEntityCopyWith<$Res> get pwd;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$PasscodeDetailStateCopyWithImpl<$Res>
    implements _$PasscodeDetailStateCopyWith<$Res> {
  __$PasscodeDetailStateCopyWithImpl(this._self, this._then);

  final _PasscodeDetailState _self;
  final $Res Function(_PasscodeDetailState) _then;

/// Create a copy of PasscodeDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pwd = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_PasscodeDetailState(
pwd: null == pwd ? _self.pwd : pwd // ignore: cast_nullable_to_non_nullable
as KeyboardPwdEntity,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of PasscodeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyboardPwdEntityCopyWith<$Res> get pwd {
  
  return $KeyboardPwdEntityCopyWith<$Res>(_self.pwd, (value) {
    return _then(_self.copyWith(pwd: value));
  });
}/// Create a copy of PasscodeDetailState
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
