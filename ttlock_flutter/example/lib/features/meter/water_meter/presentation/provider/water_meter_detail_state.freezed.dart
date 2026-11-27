// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_meter_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaterMeterDetailState {

 WaterMeterEntity get item; bool get operating; AppException? get error;
/// Create a copy of WaterMeterDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterDetailStateCopyWith<WaterMeterDetailState> get copyWith => _$WaterMeterDetailStateCopyWithImpl<WaterMeterDetailState>(this as WaterMeterDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterDetailState&&(identical(other.item, item) || other.item == item)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,operating,error);

@override
String toString() {
  return 'WaterMeterDetailState(item: $item, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class $WaterMeterDetailStateCopyWith<$Res>  {
  factory $WaterMeterDetailStateCopyWith(WaterMeterDetailState value, $Res Function(WaterMeterDetailState) _then) = _$WaterMeterDetailStateCopyWithImpl;
@useResult
$Res call({
 WaterMeterEntity item, bool operating, AppException? error
});


$WaterMeterEntityCopyWith<$Res> get item;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$WaterMeterDetailStateCopyWithImpl<$Res>
    implements $WaterMeterDetailStateCopyWith<$Res> {
  _$WaterMeterDetailStateCopyWithImpl(this._self, this._then);

  final WaterMeterDetailState _self;
  final $Res Function(WaterMeterDetailState) _then;

/// Create a copy of WaterMeterDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as WaterMeterEntity,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of WaterMeterDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterMeterEntityCopyWith<$Res> get item {
  
  return $WaterMeterEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of WaterMeterDetailState
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


/// Adds pattern-matching-related methods to [WaterMeterDetailState].
extension WaterMeterDetailStatePatterns on WaterMeterDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterDetailState value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WaterMeterEntity item,  bool operating,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterDetailState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WaterMeterEntity item,  bool operating,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterDetailState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WaterMeterEntity item,  bool operating,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterDetailState() when $default != null:
return $default(_that.item,_that.operating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WaterMeterDetailState extends WaterMeterDetailState {
  const _WaterMeterDetailState({required this.item, this.operating = false, this.error}): super._();
  

@override final  WaterMeterEntity item;
@override@JsonKey() final  bool operating;
@override final  AppException? error;

/// Create a copy of WaterMeterDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterDetailStateCopyWith<_WaterMeterDetailState> get copyWith => __$WaterMeterDetailStateCopyWithImpl<_WaterMeterDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterDetailState&&(identical(other.item, item) || other.item == item)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,operating,error);

@override
String toString() {
  return 'WaterMeterDetailState(item: $item, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterDetailStateCopyWith<$Res> implements $WaterMeterDetailStateCopyWith<$Res> {
  factory _$WaterMeterDetailStateCopyWith(_WaterMeterDetailState value, $Res Function(_WaterMeterDetailState) _then) = __$WaterMeterDetailStateCopyWithImpl;
@override @useResult
$Res call({
 WaterMeterEntity item, bool operating, AppException? error
});


@override $WaterMeterEntityCopyWith<$Res> get item;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$WaterMeterDetailStateCopyWithImpl<$Res>
    implements _$WaterMeterDetailStateCopyWith<$Res> {
  __$WaterMeterDetailStateCopyWithImpl(this._self, this._then);

  final _WaterMeterDetailState _self;
  final $Res Function(_WaterMeterDetailState) _then;

/// Create a copy of WaterMeterDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_WaterMeterDetailState(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as WaterMeterEntity,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of WaterMeterDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterMeterEntityCopyWith<$Res> get item {
  
  return $WaterMeterEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of WaterMeterDetailState
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
