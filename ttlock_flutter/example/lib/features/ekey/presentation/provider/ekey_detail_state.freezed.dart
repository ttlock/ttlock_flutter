// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ekey_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EkeyDetailState {

 KeyEntity get key; String? get unlockLink; bool get operating; AppException? get error;
/// Create a copy of EkeyDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EkeyDetailStateCopyWith<EkeyDetailState> get copyWith => _$EkeyDetailStateCopyWithImpl<EkeyDetailState>(this as EkeyDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EkeyDetailState&&(identical(other.key, key) || other.key == key)&&(identical(other.unlockLink, unlockLink) || other.unlockLink == unlockLink)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,key,unlockLink,operating,error);

@override
String toString() {
  return 'EkeyDetailState(key: $key, unlockLink: $unlockLink, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class $EkeyDetailStateCopyWith<$Res>  {
  factory $EkeyDetailStateCopyWith(EkeyDetailState value, $Res Function(EkeyDetailState) _then) = _$EkeyDetailStateCopyWithImpl;
@useResult
$Res call({
 KeyEntity key, String? unlockLink, bool operating, AppException? error
});


$KeyEntityCopyWith<$Res> get key;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$EkeyDetailStateCopyWithImpl<$Res>
    implements $EkeyDetailStateCopyWith<$Res> {
  _$EkeyDetailStateCopyWithImpl(this._self, this._then);

  final EkeyDetailState _self;
  final $Res Function(EkeyDetailState) _then;

/// Create a copy of EkeyDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? unlockLink = freezed,Object? operating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as KeyEntity,unlockLink: freezed == unlockLink ? _self.unlockLink : unlockLink // ignore: cast_nullable_to_non_nullable
as String?,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of EkeyDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyEntityCopyWith<$Res> get key {
  
  return $KeyEntityCopyWith<$Res>(_self.key, (value) {
    return _then(_self.copyWith(key: value));
  });
}/// Create a copy of EkeyDetailState
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


/// Adds pattern-matching-related methods to [EkeyDetailState].
extension EkeyDetailStatePatterns on EkeyDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EkeyDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EkeyDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EkeyDetailState value)  $default,){
final _that = this;
switch (_that) {
case _EkeyDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EkeyDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _EkeyDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( KeyEntity key,  String? unlockLink,  bool operating,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EkeyDetailState() when $default != null:
return $default(_that.key,_that.unlockLink,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( KeyEntity key,  String? unlockLink,  bool operating,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _EkeyDetailState():
return $default(_that.key,_that.unlockLink,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( KeyEntity key,  String? unlockLink,  bool operating,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _EkeyDetailState() when $default != null:
return $default(_that.key,_that.unlockLink,_that.operating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _EkeyDetailState extends EkeyDetailState {
  const _EkeyDetailState({required this.key, this.unlockLink, this.operating = false, this.error}): super._();
  

@override final  KeyEntity key;
@override final  String? unlockLink;
@override@JsonKey() final  bool operating;
@override final  AppException? error;

/// Create a copy of EkeyDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EkeyDetailStateCopyWith<_EkeyDetailState> get copyWith => __$EkeyDetailStateCopyWithImpl<_EkeyDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EkeyDetailState&&(identical(other.key, key) || other.key == key)&&(identical(other.unlockLink, unlockLink) || other.unlockLink == unlockLink)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,key,unlockLink,operating,error);

@override
String toString() {
  return 'EkeyDetailState(key: $key, unlockLink: $unlockLink, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$EkeyDetailStateCopyWith<$Res> implements $EkeyDetailStateCopyWith<$Res> {
  factory _$EkeyDetailStateCopyWith(_EkeyDetailState value, $Res Function(_EkeyDetailState) _then) = __$EkeyDetailStateCopyWithImpl;
@override @useResult
$Res call({
 KeyEntity key, String? unlockLink, bool operating, AppException? error
});


@override $KeyEntityCopyWith<$Res> get key;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$EkeyDetailStateCopyWithImpl<$Res>
    implements _$EkeyDetailStateCopyWith<$Res> {
  __$EkeyDetailStateCopyWithImpl(this._self, this._then);

  final _EkeyDetailState _self;
  final $Res Function(_EkeyDetailState) _then;

/// Create a copy of EkeyDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? unlockLink = freezed,Object? operating = null,Object? error = freezed,}) {
  return _then(_EkeyDetailState(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as KeyEntity,unlockLink: freezed == unlockLink ? _self.unlockLink : unlockLink // ignore: cast_nullable_to_non_nullable
as String?,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of EkeyDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyEntityCopyWith<$Res> get key {
  
  return $KeyEntityCopyWith<$Res>(_self.key, (value) {
    return _then(_self.copyWith(key: value));
  });
}/// Create a copy of EkeyDetailState
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
