// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockSettingsState {

 LockEntity? get lock; Set<TTLockFunction> get supportedFunctions; bool get soundOn; bool get privacyLockOn; bool get tamperAlertOn; bool get resetButtonOn; bool get remoteUnlockOn; bool get doubleAuthOn; bool get wifiPowerSavingOn; AutoLockingTime? get autoLockingTime;/// 已绑定门磁；null = 未绑定（请求失败也按未添加处理）。
 DoorSensorEntity? get doorSensor; int get soundVolume; int? get openDirection;
/// Create a copy of LockSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockSettingsStateCopyWith<LockSettingsState> get copyWith => _$LockSettingsStateCopyWithImpl<LockSettingsState>(this as LockSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockSettingsState&&(identical(other.lock, lock) || other.lock == lock)&&const DeepCollectionEquality().equals(other.supportedFunctions, supportedFunctions)&&(identical(other.soundOn, soundOn) || other.soundOn == soundOn)&&(identical(other.privacyLockOn, privacyLockOn) || other.privacyLockOn == privacyLockOn)&&(identical(other.tamperAlertOn, tamperAlertOn) || other.tamperAlertOn == tamperAlertOn)&&(identical(other.resetButtonOn, resetButtonOn) || other.resetButtonOn == resetButtonOn)&&(identical(other.remoteUnlockOn, remoteUnlockOn) || other.remoteUnlockOn == remoteUnlockOn)&&(identical(other.doubleAuthOn, doubleAuthOn) || other.doubleAuthOn == doubleAuthOn)&&(identical(other.wifiPowerSavingOn, wifiPowerSavingOn) || other.wifiPowerSavingOn == wifiPowerSavingOn)&&(identical(other.autoLockingTime, autoLockingTime) || other.autoLockingTime == autoLockingTime)&&(identical(other.doorSensor, doorSensor) || other.doorSensor == doorSensor)&&(identical(other.soundVolume, soundVolume) || other.soundVolume == soundVolume)&&(identical(other.openDirection, openDirection) || other.openDirection == openDirection));
}


@override
int get hashCode => Object.hash(runtimeType,lock,const DeepCollectionEquality().hash(supportedFunctions),soundOn,privacyLockOn,tamperAlertOn,resetButtonOn,remoteUnlockOn,doubleAuthOn,wifiPowerSavingOn,autoLockingTime,doorSensor,soundVolume,openDirection);

@override
String toString() {
  return 'LockSettingsState(lock: $lock, supportedFunctions: $supportedFunctions, soundOn: $soundOn, privacyLockOn: $privacyLockOn, tamperAlertOn: $tamperAlertOn, resetButtonOn: $resetButtonOn, remoteUnlockOn: $remoteUnlockOn, doubleAuthOn: $doubleAuthOn, wifiPowerSavingOn: $wifiPowerSavingOn, autoLockingTime: $autoLockingTime, doorSensor: $doorSensor, soundVolume: $soundVolume, openDirection: $openDirection)';
}


}

/// @nodoc
abstract mixin class $LockSettingsStateCopyWith<$Res>  {
  factory $LockSettingsStateCopyWith(LockSettingsState value, $Res Function(LockSettingsState) _then) = _$LockSettingsStateCopyWithImpl;
@useResult
$Res call({
 LockEntity? lock, Set<TTLockFunction> supportedFunctions, bool soundOn, bool privacyLockOn, bool tamperAlertOn, bool resetButtonOn, bool remoteUnlockOn, bool doubleAuthOn, bool wifiPowerSavingOn, AutoLockingTime? autoLockingTime, DoorSensorEntity? doorSensor, int soundVolume, int? openDirection
});


$LockEntityCopyWith<$Res>? get lock;$DoorSensorEntityCopyWith<$Res>? get doorSensor;

}
/// @nodoc
class _$LockSettingsStateCopyWithImpl<$Res>
    implements $LockSettingsStateCopyWith<$Res> {
  _$LockSettingsStateCopyWithImpl(this._self, this._then);

  final LockSettingsState _self;
  final $Res Function(LockSettingsState) _then;

/// Create a copy of LockSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lock = freezed,Object? supportedFunctions = null,Object? soundOn = null,Object? privacyLockOn = null,Object? tamperAlertOn = null,Object? resetButtonOn = null,Object? remoteUnlockOn = null,Object? doubleAuthOn = null,Object? wifiPowerSavingOn = null,Object? autoLockingTime = freezed,Object? doorSensor = freezed,Object? soundVolume = null,Object? openDirection = freezed,}) {
  return _then(_self.copyWith(
lock: freezed == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity?,supportedFunctions: null == supportedFunctions ? _self.supportedFunctions : supportedFunctions // ignore: cast_nullable_to_non_nullable
as Set<TTLockFunction>,soundOn: null == soundOn ? _self.soundOn : soundOn // ignore: cast_nullable_to_non_nullable
as bool,privacyLockOn: null == privacyLockOn ? _self.privacyLockOn : privacyLockOn // ignore: cast_nullable_to_non_nullable
as bool,tamperAlertOn: null == tamperAlertOn ? _self.tamperAlertOn : tamperAlertOn // ignore: cast_nullable_to_non_nullable
as bool,resetButtonOn: null == resetButtonOn ? _self.resetButtonOn : resetButtonOn // ignore: cast_nullable_to_non_nullable
as bool,remoteUnlockOn: null == remoteUnlockOn ? _self.remoteUnlockOn : remoteUnlockOn // ignore: cast_nullable_to_non_nullable
as bool,doubleAuthOn: null == doubleAuthOn ? _self.doubleAuthOn : doubleAuthOn // ignore: cast_nullable_to_non_nullable
as bool,wifiPowerSavingOn: null == wifiPowerSavingOn ? _self.wifiPowerSavingOn : wifiPowerSavingOn // ignore: cast_nullable_to_non_nullable
as bool,autoLockingTime: freezed == autoLockingTime ? _self.autoLockingTime : autoLockingTime // ignore: cast_nullable_to_non_nullable
as AutoLockingTime?,doorSensor: freezed == doorSensor ? _self.doorSensor : doorSensor // ignore: cast_nullable_to_non_nullable
as DoorSensorEntity?,soundVolume: null == soundVolume ? _self.soundVolume : soundVolume // ignore: cast_nullable_to_non_nullable
as int,openDirection: freezed == openDirection ? _self.openDirection : openDirection // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of LockSettingsState
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
}/// Create a copy of LockSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoorSensorEntityCopyWith<$Res>? get doorSensor {
    if (_self.doorSensor == null) {
    return null;
  }

  return $DoorSensorEntityCopyWith<$Res>(_self.doorSensor!, (value) {
    return _then(_self.copyWith(doorSensor: value));
  });
}
}


/// Adds pattern-matching-related methods to [LockSettingsState].
extension LockSettingsStatePatterns on LockSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _LockSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _LockSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LockEntity? lock,  Set<TTLockFunction> supportedFunctions,  bool soundOn,  bool privacyLockOn,  bool tamperAlertOn,  bool resetButtonOn,  bool remoteUnlockOn,  bool doubleAuthOn,  bool wifiPowerSavingOn,  AutoLockingTime? autoLockingTime,  DoorSensorEntity? doorSensor,  int soundVolume,  int? openDirection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockSettingsState() when $default != null:
return $default(_that.lock,_that.supportedFunctions,_that.soundOn,_that.privacyLockOn,_that.tamperAlertOn,_that.resetButtonOn,_that.remoteUnlockOn,_that.doubleAuthOn,_that.wifiPowerSavingOn,_that.autoLockingTime,_that.doorSensor,_that.soundVolume,_that.openDirection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LockEntity? lock,  Set<TTLockFunction> supportedFunctions,  bool soundOn,  bool privacyLockOn,  bool tamperAlertOn,  bool resetButtonOn,  bool remoteUnlockOn,  bool doubleAuthOn,  bool wifiPowerSavingOn,  AutoLockingTime? autoLockingTime,  DoorSensorEntity? doorSensor,  int soundVolume,  int? openDirection)  $default,) {final _that = this;
switch (_that) {
case _LockSettingsState():
return $default(_that.lock,_that.supportedFunctions,_that.soundOn,_that.privacyLockOn,_that.tamperAlertOn,_that.resetButtonOn,_that.remoteUnlockOn,_that.doubleAuthOn,_that.wifiPowerSavingOn,_that.autoLockingTime,_that.doorSensor,_that.soundVolume,_that.openDirection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LockEntity? lock,  Set<TTLockFunction> supportedFunctions,  bool soundOn,  bool privacyLockOn,  bool tamperAlertOn,  bool resetButtonOn,  bool remoteUnlockOn,  bool doubleAuthOn,  bool wifiPowerSavingOn,  AutoLockingTime? autoLockingTime,  DoorSensorEntity? doorSensor,  int soundVolume,  int? openDirection)?  $default,) {final _that = this;
switch (_that) {
case _LockSettingsState() when $default != null:
return $default(_that.lock,_that.supportedFunctions,_that.soundOn,_that.privacyLockOn,_that.tamperAlertOn,_that.resetButtonOn,_that.remoteUnlockOn,_that.doubleAuthOn,_that.wifiPowerSavingOn,_that.autoLockingTime,_that.doorSensor,_that.soundVolume,_that.openDirection);case _:
  return null;

}
}

}

/// @nodoc


class _LockSettingsState extends LockSettingsState {
  const _LockSettingsState({this.lock, final  Set<TTLockFunction> supportedFunctions = const <TTLockFunction>{}, this.soundOn = false, this.privacyLockOn = false, this.tamperAlertOn = false, this.resetButtonOn = false, this.remoteUnlockOn = false, this.doubleAuthOn = false, this.wifiPowerSavingOn = false, this.autoLockingTime, this.doorSensor, this.soundVolume = 3, this.openDirection}): _supportedFunctions = supportedFunctions,super._();
  

@override final  LockEntity? lock;
 final  Set<TTLockFunction> _supportedFunctions;
@override@JsonKey() Set<TTLockFunction> get supportedFunctions {
  if (_supportedFunctions is EqualUnmodifiableSetView) return _supportedFunctions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_supportedFunctions);
}

@override@JsonKey() final  bool soundOn;
@override@JsonKey() final  bool privacyLockOn;
@override@JsonKey() final  bool tamperAlertOn;
@override@JsonKey() final  bool resetButtonOn;
@override@JsonKey() final  bool remoteUnlockOn;
@override@JsonKey() final  bool doubleAuthOn;
@override@JsonKey() final  bool wifiPowerSavingOn;
@override final  AutoLockingTime? autoLockingTime;
/// 已绑定门磁；null = 未绑定（请求失败也按未添加处理）。
@override final  DoorSensorEntity? doorSensor;
@override@JsonKey() final  int soundVolume;
@override final  int? openDirection;

/// Create a copy of LockSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockSettingsStateCopyWith<_LockSettingsState> get copyWith => __$LockSettingsStateCopyWithImpl<_LockSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockSettingsState&&(identical(other.lock, lock) || other.lock == lock)&&const DeepCollectionEquality().equals(other._supportedFunctions, _supportedFunctions)&&(identical(other.soundOn, soundOn) || other.soundOn == soundOn)&&(identical(other.privacyLockOn, privacyLockOn) || other.privacyLockOn == privacyLockOn)&&(identical(other.tamperAlertOn, tamperAlertOn) || other.tamperAlertOn == tamperAlertOn)&&(identical(other.resetButtonOn, resetButtonOn) || other.resetButtonOn == resetButtonOn)&&(identical(other.remoteUnlockOn, remoteUnlockOn) || other.remoteUnlockOn == remoteUnlockOn)&&(identical(other.doubleAuthOn, doubleAuthOn) || other.doubleAuthOn == doubleAuthOn)&&(identical(other.wifiPowerSavingOn, wifiPowerSavingOn) || other.wifiPowerSavingOn == wifiPowerSavingOn)&&(identical(other.autoLockingTime, autoLockingTime) || other.autoLockingTime == autoLockingTime)&&(identical(other.doorSensor, doorSensor) || other.doorSensor == doorSensor)&&(identical(other.soundVolume, soundVolume) || other.soundVolume == soundVolume)&&(identical(other.openDirection, openDirection) || other.openDirection == openDirection));
}


@override
int get hashCode => Object.hash(runtimeType,lock,const DeepCollectionEquality().hash(_supportedFunctions),soundOn,privacyLockOn,tamperAlertOn,resetButtonOn,remoteUnlockOn,doubleAuthOn,wifiPowerSavingOn,autoLockingTime,doorSensor,soundVolume,openDirection);

@override
String toString() {
  return 'LockSettingsState(lock: $lock, supportedFunctions: $supportedFunctions, soundOn: $soundOn, privacyLockOn: $privacyLockOn, tamperAlertOn: $tamperAlertOn, resetButtonOn: $resetButtonOn, remoteUnlockOn: $remoteUnlockOn, doubleAuthOn: $doubleAuthOn, wifiPowerSavingOn: $wifiPowerSavingOn, autoLockingTime: $autoLockingTime, doorSensor: $doorSensor, soundVolume: $soundVolume, openDirection: $openDirection)';
}


}

/// @nodoc
abstract mixin class _$LockSettingsStateCopyWith<$Res> implements $LockSettingsStateCopyWith<$Res> {
  factory _$LockSettingsStateCopyWith(_LockSettingsState value, $Res Function(_LockSettingsState) _then) = __$LockSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 LockEntity? lock, Set<TTLockFunction> supportedFunctions, bool soundOn, bool privacyLockOn, bool tamperAlertOn, bool resetButtonOn, bool remoteUnlockOn, bool doubleAuthOn, bool wifiPowerSavingOn, AutoLockingTime? autoLockingTime, DoorSensorEntity? doorSensor, int soundVolume, int? openDirection
});


@override $LockEntityCopyWith<$Res>? get lock;@override $DoorSensorEntityCopyWith<$Res>? get doorSensor;

}
/// @nodoc
class __$LockSettingsStateCopyWithImpl<$Res>
    implements _$LockSettingsStateCopyWith<$Res> {
  __$LockSettingsStateCopyWithImpl(this._self, this._then);

  final _LockSettingsState _self;
  final $Res Function(_LockSettingsState) _then;

/// Create a copy of LockSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lock = freezed,Object? supportedFunctions = null,Object? soundOn = null,Object? privacyLockOn = null,Object? tamperAlertOn = null,Object? resetButtonOn = null,Object? remoteUnlockOn = null,Object? doubleAuthOn = null,Object? wifiPowerSavingOn = null,Object? autoLockingTime = freezed,Object? doorSensor = freezed,Object? soundVolume = null,Object? openDirection = freezed,}) {
  return _then(_LockSettingsState(
lock: freezed == lock ? _self.lock : lock // ignore: cast_nullable_to_non_nullable
as LockEntity?,supportedFunctions: null == supportedFunctions ? _self._supportedFunctions : supportedFunctions // ignore: cast_nullable_to_non_nullable
as Set<TTLockFunction>,soundOn: null == soundOn ? _self.soundOn : soundOn // ignore: cast_nullable_to_non_nullable
as bool,privacyLockOn: null == privacyLockOn ? _self.privacyLockOn : privacyLockOn // ignore: cast_nullable_to_non_nullable
as bool,tamperAlertOn: null == tamperAlertOn ? _self.tamperAlertOn : tamperAlertOn // ignore: cast_nullable_to_non_nullable
as bool,resetButtonOn: null == resetButtonOn ? _self.resetButtonOn : resetButtonOn // ignore: cast_nullable_to_non_nullable
as bool,remoteUnlockOn: null == remoteUnlockOn ? _self.remoteUnlockOn : remoteUnlockOn // ignore: cast_nullable_to_non_nullable
as bool,doubleAuthOn: null == doubleAuthOn ? _self.doubleAuthOn : doubleAuthOn // ignore: cast_nullable_to_non_nullable
as bool,wifiPowerSavingOn: null == wifiPowerSavingOn ? _self.wifiPowerSavingOn : wifiPowerSavingOn // ignore: cast_nullable_to_non_nullable
as bool,autoLockingTime: freezed == autoLockingTime ? _self.autoLockingTime : autoLockingTime // ignore: cast_nullable_to_non_nullable
as AutoLockingTime?,doorSensor: freezed == doorSensor ? _self.doorSensor : doorSensor // ignore: cast_nullable_to_non_nullable
as DoorSensorEntity?,soundVolume: null == soundVolume ? _self.soundVolume : soundVolume // ignore: cast_nullable_to_non_nullable
as int,openDirection: freezed == openDirection ? _self.openDirection : openDirection // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of LockSettingsState
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
}/// Create a copy of LockSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoorSensorEntityCopyWith<$Res>? get doorSensor {
    if (_self.doorSensor == null) {
    return null;
  }

  return $DoorSensorEntityCopyWith<$Res>(_self.doorSensor!, (value) {
    return _then(_self.copyWith(doorSensor: value));
  });
}
}

// dart format on
