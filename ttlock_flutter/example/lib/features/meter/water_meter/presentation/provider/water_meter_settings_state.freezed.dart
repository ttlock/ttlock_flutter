// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_meter_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaterMeterSettingsState {

 WaterMeterEntity get item;/// null ⇒ 固件信息不可用（spec §9 风险 12），该区显示占位。
 MeterFirmwareEntity? get firmware;/// 服务端 `detail.featureValue` 判定（spec §5.3），决定 4G 网络入口显隐。
 bool get isCatOne; bool get operating; AppException? get error;
/// Create a copy of WaterMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterSettingsStateCopyWith<WaterMeterSettingsState> get copyWith => _$WaterMeterSettingsStateCopyWithImpl<WaterMeterSettingsState>(this as WaterMeterSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterSettingsState&&(identical(other.item, item) || other.item == item)&&(identical(other.firmware, firmware) || other.firmware == firmware)&&(identical(other.isCatOne, isCatOne) || other.isCatOne == isCatOne)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,firmware,isCatOne,operating,error);

@override
String toString() {
  return 'WaterMeterSettingsState(item: $item, firmware: $firmware, isCatOne: $isCatOne, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class $WaterMeterSettingsStateCopyWith<$Res>  {
  factory $WaterMeterSettingsStateCopyWith(WaterMeterSettingsState value, $Res Function(WaterMeterSettingsState) _then) = _$WaterMeterSettingsStateCopyWithImpl;
@useResult
$Res call({
 WaterMeterEntity item, MeterFirmwareEntity? firmware, bool isCatOne, bool operating, AppException? error
});


$WaterMeterEntityCopyWith<$Res> get item;$MeterFirmwareEntityCopyWith<$Res>? get firmware;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$WaterMeterSettingsStateCopyWithImpl<$Res>
    implements $WaterMeterSettingsStateCopyWith<$Res> {
  _$WaterMeterSettingsStateCopyWithImpl(this._self, this._then);

  final WaterMeterSettingsState _self;
  final $Res Function(WaterMeterSettingsState) _then;

/// Create a copy of WaterMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? firmware = freezed,Object? isCatOne = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as WaterMeterEntity,firmware: freezed == firmware ? _self.firmware : firmware // ignore: cast_nullable_to_non_nullable
as MeterFirmwareEntity?,isCatOne: null == isCatOne ? _self.isCatOne : isCatOne // ignore: cast_nullable_to_non_nullable
as bool,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of WaterMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterMeterEntityCopyWith<$Res> get item {
  
  return $WaterMeterEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of WaterMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeterFirmwareEntityCopyWith<$Res>? get firmware {
    if (_self.firmware == null) {
    return null;
  }

  return $MeterFirmwareEntityCopyWith<$Res>(_self.firmware!, (value) {
    return _then(_self.copyWith(firmware: value));
  });
}/// Create a copy of WaterMeterSettingsState
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


/// Adds pattern-matching-related methods to [WaterMeterSettingsState].
extension WaterMeterSettingsStatePatterns on WaterMeterSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WaterMeterEntity item,  MeterFirmwareEntity? firmware,  bool isCatOne,  bool operating,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterSettingsState() when $default != null:
return $default(_that.item,_that.firmware,_that.isCatOne,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WaterMeterEntity item,  MeterFirmwareEntity? firmware,  bool isCatOne,  bool operating,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterSettingsState():
return $default(_that.item,_that.firmware,_that.isCatOne,_that.operating,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WaterMeterEntity item,  MeterFirmwareEntity? firmware,  bool isCatOne,  bool operating,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterSettingsState() when $default != null:
return $default(_that.item,_that.firmware,_that.isCatOne,_that.operating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WaterMeterSettingsState extends WaterMeterSettingsState {
  const _WaterMeterSettingsState({required this.item, this.firmware, this.isCatOne = false, this.operating = false, this.error}): super._();
  

@override final  WaterMeterEntity item;
/// null ⇒ 固件信息不可用（spec §9 风险 12），该区显示占位。
@override final  MeterFirmwareEntity? firmware;
/// 服务端 `detail.featureValue` 判定（spec §5.3），决定 4G 网络入口显隐。
@override@JsonKey() final  bool isCatOne;
@override@JsonKey() final  bool operating;
@override final  AppException? error;

/// Create a copy of WaterMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterSettingsStateCopyWith<_WaterMeterSettingsState> get copyWith => __$WaterMeterSettingsStateCopyWithImpl<_WaterMeterSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterSettingsState&&(identical(other.item, item) || other.item == item)&&(identical(other.firmware, firmware) || other.firmware == firmware)&&(identical(other.isCatOne, isCatOne) || other.isCatOne == isCatOne)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,firmware,isCatOne,operating,error);

@override
String toString() {
  return 'WaterMeterSettingsState(item: $item, firmware: $firmware, isCatOne: $isCatOne, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterSettingsStateCopyWith<$Res> implements $WaterMeterSettingsStateCopyWith<$Res> {
  factory _$WaterMeterSettingsStateCopyWith(_WaterMeterSettingsState value, $Res Function(_WaterMeterSettingsState) _then) = __$WaterMeterSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 WaterMeterEntity item, MeterFirmwareEntity? firmware, bool isCatOne, bool operating, AppException? error
});


@override $WaterMeterEntityCopyWith<$Res> get item;@override $MeterFirmwareEntityCopyWith<$Res>? get firmware;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$WaterMeterSettingsStateCopyWithImpl<$Res>
    implements _$WaterMeterSettingsStateCopyWith<$Res> {
  __$WaterMeterSettingsStateCopyWithImpl(this._self, this._then);

  final _WaterMeterSettingsState _self;
  final $Res Function(_WaterMeterSettingsState) _then;

/// Create a copy of WaterMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? firmware = freezed,Object? isCatOne = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_WaterMeterSettingsState(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as WaterMeterEntity,firmware: freezed == firmware ? _self.firmware : firmware // ignore: cast_nullable_to_non_nullable
as MeterFirmwareEntity?,isCatOne: null == isCatOne ? _self.isCatOne : isCatOne // ignore: cast_nullable_to_non_nullable
as bool,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of WaterMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterMeterEntityCopyWith<$Res> get item {
  
  return $WaterMeterEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of WaterMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeterFirmwareEntityCopyWith<$Res>? get firmware {
    if (_self.firmware == null) {
    return null;
  }

  return $MeterFirmwareEntityCopyWith<$Res>(_self.firmware!, (value) {
    return _then(_self.copyWith(firmware: value));
  });
}/// Create a copy of WaterMeterSettingsState
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
