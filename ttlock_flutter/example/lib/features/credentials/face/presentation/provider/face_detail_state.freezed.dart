// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'face_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaceDetailState {

 FaceEntity get item; bool get operating; AppException? get error;
/// Create a copy of FaceDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceDetailStateCopyWith<FaceDetailState> get copyWith => _$FaceDetailStateCopyWithImpl<FaceDetailState>(this as FaceDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceDetailState&&(identical(other.item, item) || other.item == item)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,operating,error);

@override
String toString() {
  return 'FaceDetailState(item: $item, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class $FaceDetailStateCopyWith<$Res>  {
  factory $FaceDetailStateCopyWith(FaceDetailState value, $Res Function(FaceDetailState) _then) = _$FaceDetailStateCopyWithImpl;
@useResult
$Res call({
 FaceEntity item, bool operating, AppException? error
});


$FaceEntityCopyWith<$Res> get item;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$FaceDetailStateCopyWithImpl<$Res>
    implements $FaceDetailStateCopyWith<$Res> {
  _$FaceDetailStateCopyWithImpl(this._self, this._then);

  final FaceDetailState _self;
  final $Res Function(FaceDetailState) _then;

/// Create a copy of FaceDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as FaceEntity,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of FaceDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceEntityCopyWith<$Res> get item {
  
  return $FaceEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of FaceDetailState
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


/// Adds pattern-matching-related methods to [FaceDetailState].
extension FaceDetailStatePatterns on FaceDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceDetailState value)  $default,){
final _that = this;
switch (_that) {
case _FaceDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _FaceDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FaceEntity item,  bool operating,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceDetailState() when $default != null:
return $default(_that.item,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FaceEntity item,  bool operating,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _FaceDetailState():
return $default(_that.item,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FaceEntity item,  bool operating,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _FaceDetailState() when $default != null:
return $default(_that.item,_that.operating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _FaceDetailState extends FaceDetailState {
  const _FaceDetailState({required this.item, this.operating = false, this.error}): super._();
  

@override final  FaceEntity item;
@override@JsonKey() final  bool operating;
@override final  AppException? error;

/// Create a copy of FaceDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceDetailStateCopyWith<_FaceDetailState> get copyWith => __$FaceDetailStateCopyWithImpl<_FaceDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceDetailState&&(identical(other.item, item) || other.item == item)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,operating,error);

@override
String toString() {
  return 'FaceDetailState(item: $item, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FaceDetailStateCopyWith<$Res> implements $FaceDetailStateCopyWith<$Res> {
  factory _$FaceDetailStateCopyWith(_FaceDetailState value, $Res Function(_FaceDetailState) _then) = __$FaceDetailStateCopyWithImpl;
@override @useResult
$Res call({
 FaceEntity item, bool operating, AppException? error
});


@override $FaceEntityCopyWith<$Res> get item;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$FaceDetailStateCopyWithImpl<$Res>
    implements _$FaceDetailStateCopyWith<$Res> {
  __$FaceDetailStateCopyWithImpl(this._self, this._then);

  final _FaceDetailState _self;
  final $Res Function(_FaceDetailState) _then;

/// Create a copy of FaceDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_FaceDetailState(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as FaceEntity,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of FaceDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceEntityCopyWith<$Res> get item {
  
  return $FaceEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of FaceDetailState
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
