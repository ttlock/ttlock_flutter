// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_meter_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElectricMeterSettingsState {

 ElectricMeterEntity get item;/// null ⇒ 固件信息不可用（spec §9 风险 12），该区显示占位。
 MeterFirmwareEntity? get firmware;/// 服务端 `detail.featureValue` 判定（spec §5.3），决定 4G 网络入口显隐。
 bool get isCatOne; bool get operating; AppException? get error;
/// Create a copy of ElectricMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterSettingsStateCopyWith<ElectricMeterSettingsState> get copyWith => _$ElectricMeterSettingsStateCopyWithImpl<ElectricMeterSettingsState>(this as ElectricMeterSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterSettingsState&&(identical(other.item, item) || other.item == item)&&(identical(other.firmware, firmware) || other.firmware == firmware)&&(identical(other.isCatOne, isCatOne) || other.isCatOne == isCatOne)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,firmware,isCatOne,operating,error);

@override
String toString() {
  return 'ElectricMeterSettingsState(item: $item, firmware: $firmware, isCatOne: $isCatOne, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterSettingsStateCopyWith<$Res>  {
  factory $ElectricMeterSettingsStateCopyWith(ElectricMeterSettingsState value, $Res Function(ElectricMeterSettingsState) _then) = _$ElectricMeterSettingsStateCopyWithImpl;
@useResult
$Res call({
 ElectricMeterEntity item, MeterFirmwareEntity? firmware, bool isCatOne, bool operating, AppException? error
});


$ElectricMeterEntityCopyWith<$Res> get item;$MeterFirmwareEntityCopyWith<$Res>? get firmware;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$ElectricMeterSettingsStateCopyWithImpl<$Res>
    implements $ElectricMeterSettingsStateCopyWith<$Res> {
  _$ElectricMeterSettingsStateCopyWithImpl(this._self, this._then);

  final ElectricMeterSettingsState _self;
  final $Res Function(ElectricMeterSettingsState) _then;

/// Create a copy of ElectricMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? firmware = freezed,Object? isCatOne = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ElectricMeterEntity,firmware: freezed == firmware ? _self.firmware : firmware // ignore: cast_nullable_to_non_nullable
as MeterFirmwareEntity?,isCatOne: null == isCatOne ? _self.isCatOne : isCatOne // ignore: cast_nullable_to_non_nullable
as bool,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of ElectricMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ElectricMeterEntityCopyWith<$Res> get item {
  
  return $ElectricMeterEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of ElectricMeterSettingsState
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
}/// Create a copy of ElectricMeterSettingsState
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


/// Adds pattern-matching-related methods to [ElectricMeterSettingsState].
extension ElectricMeterSettingsStatePatterns on ElectricMeterSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ElectricMeterEntity item,  MeterFirmwareEntity? firmware,  bool isCatOne,  bool operating,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterSettingsState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ElectricMeterEntity item,  MeterFirmwareEntity? firmware,  bool isCatOne,  bool operating,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterSettingsState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ElectricMeterEntity item,  MeterFirmwareEntity? firmware,  bool isCatOne,  bool operating,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterSettingsState() when $default != null:
return $default(_that.item,_that.firmware,_that.isCatOne,_that.operating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricMeterSettingsState extends ElectricMeterSettingsState {
  const _ElectricMeterSettingsState({required this.item, this.firmware, this.isCatOne = false, this.operating = false, this.error}): super._();
  

@override final  ElectricMeterEntity item;
/// null ⇒ 固件信息不可用（spec §9 风险 12），该区显示占位。
@override final  MeterFirmwareEntity? firmware;
/// 服务端 `detail.featureValue` 判定（spec §5.3），决定 4G 网络入口显隐。
@override@JsonKey() final  bool isCatOne;
@override@JsonKey() final  bool operating;
@override final  AppException? error;

/// Create a copy of ElectricMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterSettingsStateCopyWith<_ElectricMeterSettingsState> get copyWith => __$ElectricMeterSettingsStateCopyWithImpl<_ElectricMeterSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterSettingsState&&(identical(other.item, item) || other.item == item)&&(identical(other.firmware, firmware) || other.firmware == firmware)&&(identical(other.isCatOne, isCatOne) || other.isCatOne == isCatOne)&&(identical(other.operating, operating) || other.operating == operating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,firmware,isCatOne,operating,error);

@override
String toString() {
  return 'ElectricMeterSettingsState(item: $item, firmware: $firmware, isCatOne: $isCatOne, operating: $operating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterSettingsStateCopyWith<$Res> implements $ElectricMeterSettingsStateCopyWith<$Res> {
  factory _$ElectricMeterSettingsStateCopyWith(_ElectricMeterSettingsState value, $Res Function(_ElectricMeterSettingsState) _then) = __$ElectricMeterSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 ElectricMeterEntity item, MeterFirmwareEntity? firmware, bool isCatOne, bool operating, AppException? error
});


@override $ElectricMeterEntityCopyWith<$Res> get item;@override $MeterFirmwareEntityCopyWith<$Res>? get firmware;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$ElectricMeterSettingsStateCopyWithImpl<$Res>
    implements _$ElectricMeterSettingsStateCopyWith<$Res> {
  __$ElectricMeterSettingsStateCopyWithImpl(this._self, this._then);

  final _ElectricMeterSettingsState _self;
  final $Res Function(_ElectricMeterSettingsState) _then;

/// Create a copy of ElectricMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? firmware = freezed,Object? isCatOne = null,Object? operating = null,Object? error = freezed,}) {
  return _then(_ElectricMeterSettingsState(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ElectricMeterEntity,firmware: freezed == firmware ? _self.firmware : firmware // ignore: cast_nullable_to_non_nullable
as MeterFirmwareEntity?,isCatOne: null == isCatOne ? _self.isCatOne : isCatOne // ignore: cast_nullable_to_non_nullable
as bool,operating: null == operating ? _self.operating : operating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of ElectricMeterSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ElectricMeterEntityCopyWith<$Res> get item {
  
  return $ElectricMeterEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}/// Create a copy of ElectricMeterSettingsState
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
}/// Create a copy of ElectricMeterSettingsState
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
