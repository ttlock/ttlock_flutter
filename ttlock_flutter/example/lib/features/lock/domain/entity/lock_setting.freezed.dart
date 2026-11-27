// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LockCloudSettings {

 int? get autoLockTime; bool? get lockSoundOn; int? get soundVolume; bool? get privacyLockOn; bool? get tamperAlertOn; bool? get resetButtonOn; int? get openDirection; bool? get passageModeOn; bool? get passageModeAutoUnlockOn;
/// Create a copy of LockCloudSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockCloudSettingsCopyWith<LockCloudSettings> get copyWith => _$LockCloudSettingsCopyWithImpl<LockCloudSettings>(this as LockCloudSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockCloudSettings&&(identical(other.autoLockTime, autoLockTime) || other.autoLockTime == autoLockTime)&&(identical(other.lockSoundOn, lockSoundOn) || other.lockSoundOn == lockSoundOn)&&(identical(other.soundVolume, soundVolume) || other.soundVolume == soundVolume)&&(identical(other.privacyLockOn, privacyLockOn) || other.privacyLockOn == privacyLockOn)&&(identical(other.tamperAlertOn, tamperAlertOn) || other.tamperAlertOn == tamperAlertOn)&&(identical(other.resetButtonOn, resetButtonOn) || other.resetButtonOn == resetButtonOn)&&(identical(other.openDirection, openDirection) || other.openDirection == openDirection)&&(identical(other.passageModeOn, passageModeOn) || other.passageModeOn == passageModeOn)&&(identical(other.passageModeAutoUnlockOn, passageModeAutoUnlockOn) || other.passageModeAutoUnlockOn == passageModeAutoUnlockOn));
}


@override
int get hashCode => Object.hash(runtimeType,autoLockTime,lockSoundOn,soundVolume,privacyLockOn,tamperAlertOn,resetButtonOn,openDirection,passageModeOn,passageModeAutoUnlockOn);

@override
String toString() {
  return 'LockCloudSettings(autoLockTime: $autoLockTime, lockSoundOn: $lockSoundOn, soundVolume: $soundVolume, privacyLockOn: $privacyLockOn, tamperAlertOn: $tamperAlertOn, resetButtonOn: $resetButtonOn, openDirection: $openDirection, passageModeOn: $passageModeOn, passageModeAutoUnlockOn: $passageModeAutoUnlockOn)';
}


}

/// @nodoc
abstract mixin class $LockCloudSettingsCopyWith<$Res>  {
  factory $LockCloudSettingsCopyWith(LockCloudSettings value, $Res Function(LockCloudSettings) _then) = _$LockCloudSettingsCopyWithImpl;
@useResult
$Res call({
 int? autoLockTime, bool? lockSoundOn, int? soundVolume, bool? privacyLockOn, bool? tamperAlertOn, bool? resetButtonOn, int? openDirection, bool? passageModeOn, bool? passageModeAutoUnlockOn
});




}
/// @nodoc
class _$LockCloudSettingsCopyWithImpl<$Res>
    implements $LockCloudSettingsCopyWith<$Res> {
  _$LockCloudSettingsCopyWithImpl(this._self, this._then);

  final LockCloudSettings _self;
  final $Res Function(LockCloudSettings) _then;

/// Create a copy of LockCloudSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? autoLockTime = freezed,Object? lockSoundOn = freezed,Object? soundVolume = freezed,Object? privacyLockOn = freezed,Object? tamperAlertOn = freezed,Object? resetButtonOn = freezed,Object? openDirection = freezed,Object? passageModeOn = freezed,Object? passageModeAutoUnlockOn = freezed,}) {
  return _then(_self.copyWith(
autoLockTime: freezed == autoLockTime ? _self.autoLockTime : autoLockTime // ignore: cast_nullable_to_non_nullable
as int?,lockSoundOn: freezed == lockSoundOn ? _self.lockSoundOn : lockSoundOn // ignore: cast_nullable_to_non_nullable
as bool?,soundVolume: freezed == soundVolume ? _self.soundVolume : soundVolume // ignore: cast_nullable_to_non_nullable
as int?,privacyLockOn: freezed == privacyLockOn ? _self.privacyLockOn : privacyLockOn // ignore: cast_nullable_to_non_nullable
as bool?,tamperAlertOn: freezed == tamperAlertOn ? _self.tamperAlertOn : tamperAlertOn // ignore: cast_nullable_to_non_nullable
as bool?,resetButtonOn: freezed == resetButtonOn ? _self.resetButtonOn : resetButtonOn // ignore: cast_nullable_to_non_nullable
as bool?,openDirection: freezed == openDirection ? _self.openDirection : openDirection // ignore: cast_nullable_to_non_nullable
as int?,passageModeOn: freezed == passageModeOn ? _self.passageModeOn : passageModeOn // ignore: cast_nullable_to_non_nullable
as bool?,passageModeAutoUnlockOn: freezed == passageModeAutoUnlockOn ? _self.passageModeAutoUnlockOn : passageModeAutoUnlockOn // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [LockCloudSettings].
extension LockCloudSettingsPatterns on LockCloudSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockCloudSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockCloudSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockCloudSettings value)  $default,){
final _that = this;
switch (_that) {
case _LockCloudSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockCloudSettings value)?  $default,){
final _that = this;
switch (_that) {
case _LockCloudSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? autoLockTime,  bool? lockSoundOn,  int? soundVolume,  bool? privacyLockOn,  bool? tamperAlertOn,  bool? resetButtonOn,  int? openDirection,  bool? passageModeOn,  bool? passageModeAutoUnlockOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockCloudSettings() when $default != null:
return $default(_that.autoLockTime,_that.lockSoundOn,_that.soundVolume,_that.privacyLockOn,_that.tamperAlertOn,_that.resetButtonOn,_that.openDirection,_that.passageModeOn,_that.passageModeAutoUnlockOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? autoLockTime,  bool? lockSoundOn,  int? soundVolume,  bool? privacyLockOn,  bool? tamperAlertOn,  bool? resetButtonOn,  int? openDirection,  bool? passageModeOn,  bool? passageModeAutoUnlockOn)  $default,) {final _that = this;
switch (_that) {
case _LockCloudSettings():
return $default(_that.autoLockTime,_that.lockSoundOn,_that.soundVolume,_that.privacyLockOn,_that.tamperAlertOn,_that.resetButtonOn,_that.openDirection,_that.passageModeOn,_that.passageModeAutoUnlockOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? autoLockTime,  bool? lockSoundOn,  int? soundVolume,  bool? privacyLockOn,  bool? tamperAlertOn,  bool? resetButtonOn,  int? openDirection,  bool? passageModeOn,  bool? passageModeAutoUnlockOn)?  $default,) {final _that = this;
switch (_that) {
case _LockCloudSettings() when $default != null:
return $default(_that.autoLockTime,_that.lockSoundOn,_that.soundVolume,_that.privacyLockOn,_that.tamperAlertOn,_that.resetButtonOn,_that.openDirection,_that.passageModeOn,_that.passageModeAutoUnlockOn);case _:
  return null;

}
}

}

/// @nodoc


class _LockCloudSettings implements LockCloudSettings {
  const _LockCloudSettings({this.autoLockTime, this.lockSoundOn, this.soundVolume, this.privacyLockOn, this.tamperAlertOn, this.resetButtonOn, this.openDirection, this.passageModeOn, this.passageModeAutoUnlockOn});
  

@override final  int? autoLockTime;
@override final  bool? lockSoundOn;
@override final  int? soundVolume;
@override final  bool? privacyLockOn;
@override final  bool? tamperAlertOn;
@override final  bool? resetButtonOn;
@override final  int? openDirection;
@override final  bool? passageModeOn;
@override final  bool? passageModeAutoUnlockOn;

/// Create a copy of LockCloudSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockCloudSettingsCopyWith<_LockCloudSettings> get copyWith => __$LockCloudSettingsCopyWithImpl<_LockCloudSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockCloudSettings&&(identical(other.autoLockTime, autoLockTime) || other.autoLockTime == autoLockTime)&&(identical(other.lockSoundOn, lockSoundOn) || other.lockSoundOn == lockSoundOn)&&(identical(other.soundVolume, soundVolume) || other.soundVolume == soundVolume)&&(identical(other.privacyLockOn, privacyLockOn) || other.privacyLockOn == privacyLockOn)&&(identical(other.tamperAlertOn, tamperAlertOn) || other.tamperAlertOn == tamperAlertOn)&&(identical(other.resetButtonOn, resetButtonOn) || other.resetButtonOn == resetButtonOn)&&(identical(other.openDirection, openDirection) || other.openDirection == openDirection)&&(identical(other.passageModeOn, passageModeOn) || other.passageModeOn == passageModeOn)&&(identical(other.passageModeAutoUnlockOn, passageModeAutoUnlockOn) || other.passageModeAutoUnlockOn == passageModeAutoUnlockOn));
}


@override
int get hashCode => Object.hash(runtimeType,autoLockTime,lockSoundOn,soundVolume,privacyLockOn,tamperAlertOn,resetButtonOn,openDirection,passageModeOn,passageModeAutoUnlockOn);

@override
String toString() {
  return 'LockCloudSettings(autoLockTime: $autoLockTime, lockSoundOn: $lockSoundOn, soundVolume: $soundVolume, privacyLockOn: $privacyLockOn, tamperAlertOn: $tamperAlertOn, resetButtonOn: $resetButtonOn, openDirection: $openDirection, passageModeOn: $passageModeOn, passageModeAutoUnlockOn: $passageModeAutoUnlockOn)';
}


}

/// @nodoc
abstract mixin class _$LockCloudSettingsCopyWith<$Res> implements $LockCloudSettingsCopyWith<$Res> {
  factory _$LockCloudSettingsCopyWith(_LockCloudSettings value, $Res Function(_LockCloudSettings) _then) = __$LockCloudSettingsCopyWithImpl;
@override @useResult
$Res call({
 int? autoLockTime, bool? lockSoundOn, int? soundVolume, bool? privacyLockOn, bool? tamperAlertOn, bool? resetButtonOn, int? openDirection, bool? passageModeOn, bool? passageModeAutoUnlockOn
});




}
/// @nodoc
class __$LockCloudSettingsCopyWithImpl<$Res>
    implements _$LockCloudSettingsCopyWith<$Res> {
  __$LockCloudSettingsCopyWithImpl(this._self, this._then);

  final _LockCloudSettings _self;
  final $Res Function(_LockCloudSettings) _then;

/// Create a copy of LockCloudSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? autoLockTime = freezed,Object? lockSoundOn = freezed,Object? soundVolume = freezed,Object? privacyLockOn = freezed,Object? tamperAlertOn = freezed,Object? resetButtonOn = freezed,Object? openDirection = freezed,Object? passageModeOn = freezed,Object? passageModeAutoUnlockOn = freezed,}) {
  return _then(_LockCloudSettings(
autoLockTime: freezed == autoLockTime ? _self.autoLockTime : autoLockTime // ignore: cast_nullable_to_non_nullable
as int?,lockSoundOn: freezed == lockSoundOn ? _self.lockSoundOn : lockSoundOn // ignore: cast_nullable_to_non_nullable
as bool?,soundVolume: freezed == soundVolume ? _self.soundVolume : soundVolume // ignore: cast_nullable_to_non_nullable
as int?,privacyLockOn: freezed == privacyLockOn ? _self.privacyLockOn : privacyLockOn // ignore: cast_nullable_to_non_nullable
as bool?,tamperAlertOn: freezed == tamperAlertOn ? _self.tamperAlertOn : tamperAlertOn // ignore: cast_nullable_to_non_nullable
as bool?,resetButtonOn: freezed == resetButtonOn ? _self.resetButtonOn : resetButtonOn // ignore: cast_nullable_to_non_nullable
as bool?,openDirection: freezed == openDirection ? _self.openDirection : openDirection // ignore: cast_nullable_to_non_nullable
as int?,passageModeOn: freezed == passageModeOn ? _self.passageModeOn : passageModeOn // ignore: cast_nullable_to_non_nullable
as bool?,passageModeAutoUnlockOn: freezed == passageModeAutoUnlockOn ? _self.passageModeAutoUnlockOn : passageModeAutoUnlockOn // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$ExtraSettingEntity {

 int get flag; int get count; int get lockTime; int get pwd; int get card; int get fingerprint;
/// Create a copy of ExtraSettingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtraSettingEntityCopyWith<ExtraSettingEntity> get copyWith => _$ExtraSettingEntityCopyWithImpl<ExtraSettingEntity>(this as ExtraSettingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtraSettingEntity&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.count, count) || other.count == count)&&(identical(other.lockTime, lockTime) || other.lockTime == lockTime)&&(identical(other.pwd, pwd) || other.pwd == pwd)&&(identical(other.card, card) || other.card == card)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint));
}


@override
int get hashCode => Object.hash(runtimeType,flag,count,lockTime,pwd,card,fingerprint);

@override
String toString() {
  return 'ExtraSettingEntity(flag: $flag, count: $count, lockTime: $lockTime, pwd: $pwd, card: $card, fingerprint: $fingerprint)';
}


}

/// @nodoc
abstract mixin class $ExtraSettingEntityCopyWith<$Res>  {
  factory $ExtraSettingEntityCopyWith(ExtraSettingEntity value, $Res Function(ExtraSettingEntity) _then) = _$ExtraSettingEntityCopyWithImpl;
@useResult
$Res call({
 int flag, int count, int lockTime, int pwd, int card, int fingerprint
});




}
/// @nodoc
class _$ExtraSettingEntityCopyWithImpl<$Res>
    implements $ExtraSettingEntityCopyWith<$Res> {
  _$ExtraSettingEntityCopyWithImpl(this._self, this._then);

  final ExtraSettingEntity _self;
  final $Res Function(ExtraSettingEntity) _then;

/// Create a copy of ExtraSettingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flag = null,Object? count = null,Object? lockTime = null,Object? pwd = null,Object? card = null,Object? fingerprint = null,}) {
  return _then(_self.copyWith(
flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,lockTime: null == lockTime ? _self.lockTime : lockTime // ignore: cast_nullable_to_non_nullable
as int,pwd: null == pwd ? _self.pwd : pwd // ignore: cast_nullable_to_non_nullable
as int,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as int,fingerprint: null == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtraSettingEntity].
extension ExtraSettingEntityPatterns on ExtraSettingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtraSettingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtraSettingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtraSettingEntity value)  $default,){
final _that = this;
switch (_that) {
case _ExtraSettingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtraSettingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ExtraSettingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int flag,  int count,  int lockTime,  int pwd,  int card,  int fingerprint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtraSettingEntity() when $default != null:
return $default(_that.flag,_that.count,_that.lockTime,_that.pwd,_that.card,_that.fingerprint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int flag,  int count,  int lockTime,  int pwd,  int card,  int fingerprint)  $default,) {final _that = this;
switch (_that) {
case _ExtraSettingEntity():
return $default(_that.flag,_that.count,_that.lockTime,_that.pwd,_that.card,_that.fingerprint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int flag,  int count,  int lockTime,  int pwd,  int card,  int fingerprint)?  $default,) {final _that = this;
switch (_that) {
case _ExtraSettingEntity() when $default != null:
return $default(_that.flag,_that.count,_that.lockTime,_that.pwd,_that.card,_that.fingerprint);case _:
  return null;

}
}

}

/// @nodoc


class _ExtraSettingEntity implements ExtraSettingEntity {
  const _ExtraSettingEntity({this.flag = 0, this.count = 0, this.lockTime = 0, this.pwd = 0, this.card = 0, this.fingerprint = 0});
  

@override@JsonKey() final  int flag;
@override@JsonKey() final  int count;
@override@JsonKey() final  int lockTime;
@override@JsonKey() final  int pwd;
@override@JsonKey() final  int card;
@override@JsonKey() final  int fingerprint;

/// Create a copy of ExtraSettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtraSettingEntityCopyWith<_ExtraSettingEntity> get copyWith => __$ExtraSettingEntityCopyWithImpl<_ExtraSettingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtraSettingEntity&&(identical(other.flag, flag) || other.flag == flag)&&(identical(other.count, count) || other.count == count)&&(identical(other.lockTime, lockTime) || other.lockTime == lockTime)&&(identical(other.pwd, pwd) || other.pwd == pwd)&&(identical(other.card, card) || other.card == card)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint));
}


@override
int get hashCode => Object.hash(runtimeType,flag,count,lockTime,pwd,card,fingerprint);

@override
String toString() {
  return 'ExtraSettingEntity(flag: $flag, count: $count, lockTime: $lockTime, pwd: $pwd, card: $card, fingerprint: $fingerprint)';
}


}

/// @nodoc
abstract mixin class _$ExtraSettingEntityCopyWith<$Res> implements $ExtraSettingEntityCopyWith<$Res> {
  factory _$ExtraSettingEntityCopyWith(_ExtraSettingEntity value, $Res Function(_ExtraSettingEntity) _then) = __$ExtraSettingEntityCopyWithImpl;
@override @useResult
$Res call({
 int flag, int count, int lockTime, int pwd, int card, int fingerprint
});




}
/// @nodoc
class __$ExtraSettingEntityCopyWithImpl<$Res>
    implements _$ExtraSettingEntityCopyWith<$Res> {
  __$ExtraSettingEntityCopyWithImpl(this._self, this._then);

  final _ExtraSettingEntity _self;
  final $Res Function(_ExtraSettingEntity) _then;

/// Create a copy of ExtraSettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flag = null,Object? count = null,Object? lockTime = null,Object? pwd = null,Object? card = null,Object? fingerprint = null,}) {
  return _then(_ExtraSettingEntity(
flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,lockTime: null == lockTime ? _self.lockTime : lockTime // ignore: cast_nullable_to_non_nullable
as int,pwd: null == pwd ? _self.pwd : pwd // ignore: cast_nullable_to_non_nullable
as int,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as int,fingerprint: null == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PassageModeConfigEntity {

 int get passageMode; int get startDate; int get endDate; int get isAllDay; List<int> get weekDays; int get autoUnlock;
/// Create a copy of PassageModeConfigEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassageModeConfigEntityCopyWith<PassageModeConfigEntity> get copyWith => _$PassageModeConfigEntityCopyWithImpl<PassageModeConfigEntity>(this as PassageModeConfigEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassageModeConfigEntity&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&const DeepCollectionEquality().equals(other.weekDays, weekDays)&&(identical(other.autoUnlock, autoUnlock) || other.autoUnlock == autoUnlock));
}


@override
int get hashCode => Object.hash(runtimeType,passageMode,startDate,endDate,isAllDay,const DeepCollectionEquality().hash(weekDays),autoUnlock);

@override
String toString() {
  return 'PassageModeConfigEntity(passageMode: $passageMode, startDate: $startDate, endDate: $endDate, isAllDay: $isAllDay, weekDays: $weekDays, autoUnlock: $autoUnlock)';
}


}

/// @nodoc
abstract mixin class $PassageModeConfigEntityCopyWith<$Res>  {
  factory $PassageModeConfigEntityCopyWith(PassageModeConfigEntity value, $Res Function(PassageModeConfigEntity) _then) = _$PassageModeConfigEntityCopyWithImpl;
@useResult
$Res call({
 int passageMode, int startDate, int endDate, int isAllDay, List<int> weekDays, int autoUnlock
});




}
/// @nodoc
class _$PassageModeConfigEntityCopyWithImpl<$Res>
    implements $PassageModeConfigEntityCopyWith<$Res> {
  _$PassageModeConfigEntityCopyWithImpl(this._self, this._then);

  final PassageModeConfigEntity _self;
  final $Res Function(PassageModeConfigEntity) _then;

/// Create a copy of PassageModeConfigEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passageMode = null,Object? startDate = null,Object? endDate = null,Object? isAllDay = null,Object? weekDays = null,Object? autoUnlock = null,}) {
  return _then(_self.copyWith(
passageMode: null == passageMode ? _self.passageMode : passageMode // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as int,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as int,weekDays: null == weekDays ? _self.weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<int>,autoUnlock: null == autoUnlock ? _self.autoUnlock : autoUnlock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PassageModeConfigEntity].
extension PassageModeConfigEntityPatterns on PassageModeConfigEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassageModeConfigEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassageModeConfigEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassageModeConfigEntity value)  $default,){
final _that = this;
switch (_that) {
case _PassageModeConfigEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassageModeConfigEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PassageModeConfigEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int passageMode,  int startDate,  int endDate,  int isAllDay,  List<int> weekDays,  int autoUnlock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassageModeConfigEntity() when $default != null:
return $default(_that.passageMode,_that.startDate,_that.endDate,_that.isAllDay,_that.weekDays,_that.autoUnlock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int passageMode,  int startDate,  int endDate,  int isAllDay,  List<int> weekDays,  int autoUnlock)  $default,) {final _that = this;
switch (_that) {
case _PassageModeConfigEntity():
return $default(_that.passageMode,_that.startDate,_that.endDate,_that.isAllDay,_that.weekDays,_that.autoUnlock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int passageMode,  int startDate,  int endDate,  int isAllDay,  List<int> weekDays,  int autoUnlock)?  $default,) {final _that = this;
switch (_that) {
case _PassageModeConfigEntity() when $default != null:
return $default(_that.passageMode,_that.startDate,_that.endDate,_that.isAllDay,_that.weekDays,_that.autoUnlock);case _:
  return null;

}
}

}

/// @nodoc


class _PassageModeConfigEntity implements PassageModeConfigEntity {
  const _PassageModeConfigEntity({this.passageMode = 2, this.startDate = 0, this.endDate = 0, this.isAllDay = 2, final  List<int> weekDays = const [], this.autoUnlock = 2}): _weekDays = weekDays;
  

@override@JsonKey() final  int passageMode;
@override@JsonKey() final  int startDate;
@override@JsonKey() final  int endDate;
@override@JsonKey() final  int isAllDay;
 final  List<int> _weekDays;
@override@JsonKey() List<int> get weekDays {
  if (_weekDays is EqualUnmodifiableListView) return _weekDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekDays);
}

@override@JsonKey() final  int autoUnlock;

/// Create a copy of PassageModeConfigEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassageModeConfigEntityCopyWith<_PassageModeConfigEntity> get copyWith => __$PassageModeConfigEntityCopyWithImpl<_PassageModeConfigEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassageModeConfigEntity&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&const DeepCollectionEquality().equals(other._weekDays, _weekDays)&&(identical(other.autoUnlock, autoUnlock) || other.autoUnlock == autoUnlock));
}


@override
int get hashCode => Object.hash(runtimeType,passageMode,startDate,endDate,isAllDay,const DeepCollectionEquality().hash(_weekDays),autoUnlock);

@override
String toString() {
  return 'PassageModeConfigEntity(passageMode: $passageMode, startDate: $startDate, endDate: $endDate, isAllDay: $isAllDay, weekDays: $weekDays, autoUnlock: $autoUnlock)';
}


}

/// @nodoc
abstract mixin class _$PassageModeConfigEntityCopyWith<$Res> implements $PassageModeConfigEntityCopyWith<$Res> {
  factory _$PassageModeConfigEntityCopyWith(_PassageModeConfigEntity value, $Res Function(_PassageModeConfigEntity) _then) = __$PassageModeConfigEntityCopyWithImpl;
@override @useResult
$Res call({
 int passageMode, int startDate, int endDate, int isAllDay, List<int> weekDays, int autoUnlock
});




}
/// @nodoc
class __$PassageModeConfigEntityCopyWithImpl<$Res>
    implements _$PassageModeConfigEntityCopyWith<$Res> {
  __$PassageModeConfigEntityCopyWithImpl(this._self, this._then);

  final _PassageModeConfigEntity _self;
  final $Res Function(_PassageModeConfigEntity) _then;

/// Create a copy of PassageModeConfigEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passageMode = null,Object? startDate = null,Object? endDate = null,Object? isAllDay = null,Object? weekDays = null,Object? autoUnlock = null,}) {
  return _then(_PassageModeConfigEntity(
passageMode: null == passageMode ? _self.passageMode : passageMode // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as int,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as int,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as int,weekDays: null == weekDays ? _self._weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<int>,autoUnlock: null == autoUnlock ? _self.autoUnlock : autoUnlock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$WorkingModeCyclicConfigEntity {

 int get isAllDay; int get startTime; int get endTime; List<int> get weekDays;
/// Create a copy of WorkingModeCyclicConfigEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkingModeCyclicConfigEntityCopyWith<WorkingModeCyclicConfigEntity> get copyWith => _$WorkingModeCyclicConfigEntityCopyWithImpl<WorkingModeCyclicConfigEntity>(this as WorkingModeCyclicConfigEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkingModeCyclicConfigEntity&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other.weekDays, weekDays));
}


@override
int get hashCode => Object.hash(runtimeType,isAllDay,startTime,endTime,const DeepCollectionEquality().hash(weekDays));

@override
String toString() {
  return 'WorkingModeCyclicConfigEntity(isAllDay: $isAllDay, startTime: $startTime, endTime: $endTime, weekDays: $weekDays)';
}


}

/// @nodoc
abstract mixin class $WorkingModeCyclicConfigEntityCopyWith<$Res>  {
  factory $WorkingModeCyclicConfigEntityCopyWith(WorkingModeCyclicConfigEntity value, $Res Function(WorkingModeCyclicConfigEntity) _then) = _$WorkingModeCyclicConfigEntityCopyWithImpl;
@useResult
$Res call({
 int isAllDay, int startTime, int endTime, List<int> weekDays
});




}
/// @nodoc
class _$WorkingModeCyclicConfigEntityCopyWithImpl<$Res>
    implements $WorkingModeCyclicConfigEntityCopyWith<$Res> {
  _$WorkingModeCyclicConfigEntityCopyWithImpl(this._self, this._then);

  final WorkingModeCyclicConfigEntity _self;
  final $Res Function(WorkingModeCyclicConfigEntity) _then;

/// Create a copy of WorkingModeCyclicConfigEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAllDay = null,Object? startTime = null,Object? endTime = null,Object? weekDays = null,}) {
  return _then(_self.copyWith(
isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,weekDays: null == weekDays ? _self.weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkingModeCyclicConfigEntity].
extension WorkingModeCyclicConfigEntityPatterns on WorkingModeCyclicConfigEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkingModeCyclicConfigEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkingModeCyclicConfigEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkingModeCyclicConfigEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int isAllDay,  int startTime,  int endTime,  List<int> weekDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigEntity() when $default != null:
return $default(_that.isAllDay,_that.startTime,_that.endTime,_that.weekDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int isAllDay,  int startTime,  int endTime,  List<int> weekDays)  $default,) {final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigEntity():
return $default(_that.isAllDay,_that.startTime,_that.endTime,_that.weekDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int isAllDay,  int startTime,  int endTime,  List<int> weekDays)?  $default,) {final _that = this;
switch (_that) {
case _WorkingModeCyclicConfigEntity() when $default != null:
return $default(_that.isAllDay,_that.startTime,_that.endTime,_that.weekDays);case _:
  return null;

}
}

}

/// @nodoc


class _WorkingModeCyclicConfigEntity implements WorkingModeCyclicConfigEntity {
  const _WorkingModeCyclicConfigEntity({this.isAllDay = 2, this.startTime = 0, this.endTime = 0, final  List<int> weekDays = const []}): _weekDays = weekDays;
  

@override@JsonKey() final  int isAllDay;
@override@JsonKey() final  int startTime;
@override@JsonKey() final  int endTime;
 final  List<int> _weekDays;
@override@JsonKey() List<int> get weekDays {
  if (_weekDays is EqualUnmodifiableListView) return _weekDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekDays);
}


/// Create a copy of WorkingModeCyclicConfigEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkingModeCyclicConfigEntityCopyWith<_WorkingModeCyclicConfigEntity> get copyWith => __$WorkingModeCyclicConfigEntityCopyWithImpl<_WorkingModeCyclicConfigEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkingModeCyclicConfigEntity&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other._weekDays, _weekDays));
}


@override
int get hashCode => Object.hash(runtimeType,isAllDay,startTime,endTime,const DeepCollectionEquality().hash(_weekDays));

@override
String toString() {
  return 'WorkingModeCyclicConfigEntity(isAllDay: $isAllDay, startTime: $startTime, endTime: $endTime, weekDays: $weekDays)';
}


}

/// @nodoc
abstract mixin class _$WorkingModeCyclicConfigEntityCopyWith<$Res> implements $WorkingModeCyclicConfigEntityCopyWith<$Res> {
  factory _$WorkingModeCyclicConfigEntityCopyWith(_WorkingModeCyclicConfigEntity value, $Res Function(_WorkingModeCyclicConfigEntity) _then) = __$WorkingModeCyclicConfigEntityCopyWithImpl;
@override @useResult
$Res call({
 int isAllDay, int startTime, int endTime, List<int> weekDays
});




}
/// @nodoc
class __$WorkingModeCyclicConfigEntityCopyWithImpl<$Res>
    implements _$WorkingModeCyclicConfigEntityCopyWith<$Res> {
  __$WorkingModeCyclicConfigEntityCopyWithImpl(this._self, this._then);

  final _WorkingModeCyclicConfigEntity _self;
  final $Res Function(_WorkingModeCyclicConfigEntity) _then;

/// Create a copy of WorkingModeCyclicConfigEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAllDay = null,Object? startTime = null,Object? endTime = null,Object? weekDays = null,}) {
  return _then(_WorkingModeCyclicConfigEntity(
isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as int,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as int,weekDays: null == weekDays ? _self._weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
mixin _$WorkingModeEntity {

 int get workingMode; List<WorkingModeCyclicConfigEntity> get cyclicConfig;
/// Create a copy of WorkingModeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkingModeEntityCopyWith<WorkingModeEntity> get copyWith => _$WorkingModeEntityCopyWithImpl<WorkingModeEntity>(this as WorkingModeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkingModeEntity&&(identical(other.workingMode, workingMode) || other.workingMode == workingMode)&&const DeepCollectionEquality().equals(other.cyclicConfig, cyclicConfig));
}


@override
int get hashCode => Object.hash(runtimeType,workingMode,const DeepCollectionEquality().hash(cyclicConfig));

@override
String toString() {
  return 'WorkingModeEntity(workingMode: $workingMode, cyclicConfig: $cyclicConfig)';
}


}

/// @nodoc
abstract mixin class $WorkingModeEntityCopyWith<$Res>  {
  factory $WorkingModeEntityCopyWith(WorkingModeEntity value, $Res Function(WorkingModeEntity) _then) = _$WorkingModeEntityCopyWithImpl;
@useResult
$Res call({
 int workingMode, List<WorkingModeCyclicConfigEntity> cyclicConfig
});




}
/// @nodoc
class _$WorkingModeEntityCopyWithImpl<$Res>
    implements $WorkingModeEntityCopyWith<$Res> {
  _$WorkingModeEntityCopyWithImpl(this._self, this._then);

  final WorkingModeEntity _self;
  final $Res Function(WorkingModeEntity) _then;

/// Create a copy of WorkingModeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workingMode = null,Object? cyclicConfig = null,}) {
  return _then(_self.copyWith(
workingMode: null == workingMode ? _self.workingMode : workingMode // ignore: cast_nullable_to_non_nullable
as int,cyclicConfig: null == cyclicConfig ? _self.cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<WorkingModeCyclicConfigEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkingModeEntity].
extension WorkingModeEntityPatterns on WorkingModeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkingModeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkingModeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkingModeEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkingModeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkingModeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkingModeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int workingMode,  List<WorkingModeCyclicConfigEntity> cyclicConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkingModeEntity() when $default != null:
return $default(_that.workingMode,_that.cyclicConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int workingMode,  List<WorkingModeCyclicConfigEntity> cyclicConfig)  $default,) {final _that = this;
switch (_that) {
case _WorkingModeEntity():
return $default(_that.workingMode,_that.cyclicConfig);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int workingMode,  List<WorkingModeCyclicConfigEntity> cyclicConfig)?  $default,) {final _that = this;
switch (_that) {
case _WorkingModeEntity() when $default != null:
return $default(_that.workingMode,_that.cyclicConfig);case _:
  return null;

}
}

}

/// @nodoc


class _WorkingModeEntity implements WorkingModeEntity {
  const _WorkingModeEntity({this.workingMode = 1, final  List<WorkingModeCyclicConfigEntity> cyclicConfig = const []}): _cyclicConfig = cyclicConfig;
  

@override@JsonKey() final  int workingMode;
 final  List<WorkingModeCyclicConfigEntity> _cyclicConfig;
@override@JsonKey() List<WorkingModeCyclicConfigEntity> get cyclicConfig {
  if (_cyclicConfig is EqualUnmodifiableListView) return _cyclicConfig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cyclicConfig);
}


/// Create a copy of WorkingModeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkingModeEntityCopyWith<_WorkingModeEntity> get copyWith => __$WorkingModeEntityCopyWithImpl<_WorkingModeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkingModeEntity&&(identical(other.workingMode, workingMode) || other.workingMode == workingMode)&&const DeepCollectionEquality().equals(other._cyclicConfig, _cyclicConfig));
}


@override
int get hashCode => Object.hash(runtimeType,workingMode,const DeepCollectionEquality().hash(_cyclicConfig));

@override
String toString() {
  return 'WorkingModeEntity(workingMode: $workingMode, cyclicConfig: $cyclicConfig)';
}


}

/// @nodoc
abstract mixin class _$WorkingModeEntityCopyWith<$Res> implements $WorkingModeEntityCopyWith<$Res> {
  factory _$WorkingModeEntityCopyWith(_WorkingModeEntity value, $Res Function(_WorkingModeEntity) _then) = __$WorkingModeEntityCopyWithImpl;
@override @useResult
$Res call({
 int workingMode, List<WorkingModeCyclicConfigEntity> cyclicConfig
});




}
/// @nodoc
class __$WorkingModeEntityCopyWithImpl<$Res>
    implements _$WorkingModeEntityCopyWith<$Res> {
  __$WorkingModeEntityCopyWithImpl(this._self, this._then);

  final _WorkingModeEntity _self;
  final $Res Function(_WorkingModeEntity) _then;

/// Create a copy of WorkingModeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workingMode = null,Object? cyclicConfig = null,}) {
  return _then(_WorkingModeEntity(
workingMode: null == workingMode ? _self.workingMode : workingMode // ignore: cast_nullable_to_non_nullable
as int,cyclicConfig: null == cyclicConfig ? _self._cyclicConfig : cyclicConfig // ignore: cast_nullable_to_non_nullable
as List<WorkingModeCyclicConfigEntity>,
  ));
}


}

/// @nodoc
mixin _$FirmwareInfoEntity {

 String get modelNum; String get hardwareRevision; String get firmwareRevision;
/// Create a copy of FirmwareInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirmwareInfoEntityCopyWith<FirmwareInfoEntity> get copyWith => _$FirmwareInfoEntityCopyWithImpl<FirmwareInfoEntity>(this as FirmwareInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirmwareInfoEntity&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}


@override
int get hashCode => Object.hash(runtimeType,modelNum,hardwareRevision,firmwareRevision);

@override
String toString() {
  return 'FirmwareInfoEntity(modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class $FirmwareInfoEntityCopyWith<$Res>  {
  factory $FirmwareInfoEntityCopyWith(FirmwareInfoEntity value, $Res Function(FirmwareInfoEntity) _then) = _$FirmwareInfoEntityCopyWithImpl;
@useResult
$Res call({
 String modelNum, String hardwareRevision, String firmwareRevision
});




}
/// @nodoc
class _$FirmwareInfoEntityCopyWithImpl<$Res>
    implements $FirmwareInfoEntityCopyWith<$Res> {
  _$FirmwareInfoEntityCopyWithImpl(this._self, this._then);

  final FirmwareInfoEntity _self;
  final $Res Function(FirmwareInfoEntity) _then;

/// Create a copy of FirmwareInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,}) {
  return _then(_self.copyWith(
modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FirmwareInfoEntity].
extension FirmwareInfoEntityPatterns on FirmwareInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirmwareInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirmwareInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirmwareInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _FirmwareInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirmwareInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FirmwareInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String modelNum,  String hardwareRevision,  String firmwareRevision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirmwareInfoEntity() when $default != null:
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String modelNum,  String hardwareRevision,  String firmwareRevision)  $default,) {final _that = this;
switch (_that) {
case _FirmwareInfoEntity():
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String modelNum,  String hardwareRevision,  String firmwareRevision)?  $default,) {final _that = this;
switch (_that) {
case _FirmwareInfoEntity() when $default != null:
return $default(_that.modelNum,_that.hardwareRevision,_that.firmwareRevision);case _:
  return null;

}
}

}

/// @nodoc


class _FirmwareInfoEntity implements FirmwareInfoEntity {
  const _FirmwareInfoEntity({this.modelNum = '', this.hardwareRevision = '', this.firmwareRevision = ''});
  

@override@JsonKey() final  String modelNum;
@override@JsonKey() final  String hardwareRevision;
@override@JsonKey() final  String firmwareRevision;

/// Create a copy of FirmwareInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirmwareInfoEntityCopyWith<_FirmwareInfoEntity> get copyWith => __$FirmwareInfoEntityCopyWithImpl<_FirmwareInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirmwareInfoEntity&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}


@override
int get hashCode => Object.hash(runtimeType,modelNum,hardwareRevision,firmwareRevision);

@override
String toString() {
  return 'FirmwareInfoEntity(modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class _$FirmwareInfoEntityCopyWith<$Res> implements $FirmwareInfoEntityCopyWith<$Res> {
  factory _$FirmwareInfoEntityCopyWith(_FirmwareInfoEntity value, $Res Function(_FirmwareInfoEntity) _then) = __$FirmwareInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String modelNum, String hardwareRevision, String firmwareRevision
});




}
/// @nodoc
class __$FirmwareInfoEntityCopyWithImpl<$Res>
    implements _$FirmwareInfoEntityCopyWith<$Res> {
  __$FirmwareInfoEntityCopyWithImpl(this._self, this._then);

  final _FirmwareInfoEntity _self;
  final $Res Function(_FirmwareInfoEntity) _then;

/// Create a copy of FirmwareInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,}) {
  return _then(_FirmwareInfoEntity(
modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LockUpgradeCheckEntity {

 int get needUpgrade; FirmwareInfoEntity? get firmwareInfo; String get firmwarePackage; String get version;
/// Create a copy of LockUpgradeCheckEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockUpgradeCheckEntityCopyWith<LockUpgradeCheckEntity> get copyWith => _$LockUpgradeCheckEntityCopyWithImpl<LockUpgradeCheckEntity>(this as LockUpgradeCheckEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockUpgradeCheckEntity&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.firmwareInfo, firmwareInfo) || other.firmwareInfo == firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,needUpgrade,firmwareInfo,firmwarePackage,version);

@override
String toString() {
  return 'LockUpgradeCheckEntity(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class $LockUpgradeCheckEntityCopyWith<$Res>  {
  factory $LockUpgradeCheckEntityCopyWith(LockUpgradeCheckEntity value, $Res Function(LockUpgradeCheckEntity) _then) = _$LockUpgradeCheckEntityCopyWithImpl;
@useResult
$Res call({
 int needUpgrade, FirmwareInfoEntity? firmwareInfo, String firmwarePackage, String version
});


$FirmwareInfoEntityCopyWith<$Res>? get firmwareInfo;

}
/// @nodoc
class _$LockUpgradeCheckEntityCopyWithImpl<$Res>
    implements $LockUpgradeCheckEntityCopyWith<$Res> {
  _$LockUpgradeCheckEntityCopyWithImpl(this._self, this._then);

  final LockUpgradeCheckEntity _self;
  final $Res Function(LockUpgradeCheckEntity) _then;

/// Create a copy of LockUpgradeCheckEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_self.copyWith(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as FirmwareInfoEntity?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LockUpgradeCheckEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareInfoEntityCopyWith<$Res>? get firmwareInfo {
    if (_self.firmwareInfo == null) {
    return null;
  }

  return $FirmwareInfoEntityCopyWith<$Res>(_self.firmwareInfo!, (value) {
    return _then(_self.copyWith(firmwareInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [LockUpgradeCheckEntity].
extension LockUpgradeCheckEntityPatterns on LockUpgradeCheckEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockUpgradeCheckEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockUpgradeCheckEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockUpgradeCheckEntity value)  $default,){
final _that = this;
switch (_that) {
case _LockUpgradeCheckEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockUpgradeCheckEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LockUpgradeCheckEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int needUpgrade,  FirmwareInfoEntity? firmwareInfo,  String firmwarePackage,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockUpgradeCheckEntity() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int needUpgrade,  FirmwareInfoEntity? firmwareInfo,  String firmwarePackage,  String version)  $default,) {final _that = this;
switch (_that) {
case _LockUpgradeCheckEntity():
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int needUpgrade,  FirmwareInfoEntity? firmwareInfo,  String firmwarePackage,  String version)?  $default,) {final _that = this;
switch (_that) {
case _LockUpgradeCheckEntity() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
  return null;

}
}

}

/// @nodoc


class _LockUpgradeCheckEntity implements LockUpgradeCheckEntity {
  const _LockUpgradeCheckEntity({this.needUpgrade = 2, this.firmwareInfo, this.firmwarePackage = '', this.version = ''});
  

@override@JsonKey() final  int needUpgrade;
@override final  FirmwareInfoEntity? firmwareInfo;
@override@JsonKey() final  String firmwarePackage;
@override@JsonKey() final  String version;

/// Create a copy of LockUpgradeCheckEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockUpgradeCheckEntityCopyWith<_LockUpgradeCheckEntity> get copyWith => __$LockUpgradeCheckEntityCopyWithImpl<_LockUpgradeCheckEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockUpgradeCheckEntity&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.firmwareInfo, firmwareInfo) || other.firmwareInfo == firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,needUpgrade,firmwareInfo,firmwarePackage,version);

@override
String toString() {
  return 'LockUpgradeCheckEntity(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class _$LockUpgradeCheckEntityCopyWith<$Res> implements $LockUpgradeCheckEntityCopyWith<$Res> {
  factory _$LockUpgradeCheckEntityCopyWith(_LockUpgradeCheckEntity value, $Res Function(_LockUpgradeCheckEntity) _then) = __$LockUpgradeCheckEntityCopyWithImpl;
@override @useResult
$Res call({
 int needUpgrade, FirmwareInfoEntity? firmwareInfo, String firmwarePackage, String version
});


@override $FirmwareInfoEntityCopyWith<$Res>? get firmwareInfo;

}
/// @nodoc
class __$LockUpgradeCheckEntityCopyWithImpl<$Res>
    implements _$LockUpgradeCheckEntityCopyWith<$Res> {
  __$LockUpgradeCheckEntityCopyWithImpl(this._self, this._then);

  final _LockUpgradeCheckEntity _self;
  final $Res Function(_LockUpgradeCheckEntity) _then;

/// Create a copy of LockUpgradeCheckEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_LockUpgradeCheckEntity(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as FirmwareInfoEntity?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LockUpgradeCheckEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareInfoEntityCopyWith<$Res>? get firmwareInfo {
    if (_self.firmwareInfo == null) {
    return null;
  }

  return $FirmwareInfoEntityCopyWith<$Res>(_self.firmwareInfo!, (value) {
    return _then(_self.copyWith(firmwareInfo: value));
  });
}
}

/// @nodoc
mixin _$NbDeviceInfoEntity {

 String get nbNodeId; String get nbCardNumber; String get nbOperator; String get nbOperatorName; int get nbRssi; DateTime? get updateDate;
/// Create a copy of NbDeviceInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NbDeviceInfoEntityCopyWith<NbDeviceInfoEntity> get copyWith => _$NbDeviceInfoEntityCopyWithImpl<NbDeviceInfoEntity>(this as NbDeviceInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NbDeviceInfoEntity&&(identical(other.nbNodeId, nbNodeId) || other.nbNodeId == nbNodeId)&&(identical(other.nbCardNumber, nbCardNumber) || other.nbCardNumber == nbCardNumber)&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.nbOperatorName, nbOperatorName) || other.nbOperatorName == nbOperatorName)&&(identical(other.nbRssi, nbRssi) || other.nbRssi == nbRssi)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}


@override
int get hashCode => Object.hash(runtimeType,nbNodeId,nbCardNumber,nbOperator,nbOperatorName,nbRssi,updateDate);

@override
String toString() {
  return 'NbDeviceInfoEntity(nbNodeId: $nbNodeId, nbCardNumber: $nbCardNumber, nbOperator: $nbOperator, nbOperatorName: $nbOperatorName, nbRssi: $nbRssi, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class $NbDeviceInfoEntityCopyWith<$Res>  {
  factory $NbDeviceInfoEntityCopyWith(NbDeviceInfoEntity value, $Res Function(NbDeviceInfoEntity) _then) = _$NbDeviceInfoEntityCopyWithImpl;
@useResult
$Res call({
 String nbNodeId, String nbCardNumber, String nbOperator, String nbOperatorName, int nbRssi, DateTime? updateDate
});




}
/// @nodoc
class _$NbDeviceInfoEntityCopyWithImpl<$Res>
    implements $NbDeviceInfoEntityCopyWith<$Res> {
  _$NbDeviceInfoEntityCopyWithImpl(this._self, this._then);

  final NbDeviceInfoEntity _self;
  final $Res Function(NbDeviceInfoEntity) _then;

/// Create a copy of NbDeviceInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nbNodeId = null,Object? nbCardNumber = null,Object? nbOperator = null,Object? nbOperatorName = null,Object? nbRssi = null,Object? updateDate = freezed,}) {
  return _then(_self.copyWith(
nbNodeId: null == nbNodeId ? _self.nbNodeId : nbNodeId // ignore: cast_nullable_to_non_nullable
as String,nbCardNumber: null == nbCardNumber ? _self.nbCardNumber : nbCardNumber // ignore: cast_nullable_to_non_nullable
as String,nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,nbOperatorName: null == nbOperatorName ? _self.nbOperatorName : nbOperatorName // ignore: cast_nullable_to_non_nullable
as String,nbRssi: null == nbRssi ? _self.nbRssi : nbRssi // ignore: cast_nullable_to_non_nullable
as int,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NbDeviceInfoEntity].
extension NbDeviceInfoEntityPatterns on NbDeviceInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NbDeviceInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NbDeviceInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NbDeviceInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _NbDeviceInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NbDeviceInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NbDeviceInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nbNodeId,  String nbCardNumber,  String nbOperator,  String nbOperatorName,  int nbRssi,  DateTime? updateDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NbDeviceInfoEntity() when $default != null:
return $default(_that.nbNodeId,_that.nbCardNumber,_that.nbOperator,_that.nbOperatorName,_that.nbRssi,_that.updateDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nbNodeId,  String nbCardNumber,  String nbOperator,  String nbOperatorName,  int nbRssi,  DateTime? updateDate)  $default,) {final _that = this;
switch (_that) {
case _NbDeviceInfoEntity():
return $default(_that.nbNodeId,_that.nbCardNumber,_that.nbOperator,_that.nbOperatorName,_that.nbRssi,_that.updateDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nbNodeId,  String nbCardNumber,  String nbOperator,  String nbOperatorName,  int nbRssi,  DateTime? updateDate)?  $default,) {final _that = this;
switch (_that) {
case _NbDeviceInfoEntity() when $default != null:
return $default(_that.nbNodeId,_that.nbCardNumber,_that.nbOperator,_that.nbOperatorName,_that.nbRssi,_that.updateDate);case _:
  return null;

}
}

}

/// @nodoc


class _NbDeviceInfoEntity implements NbDeviceInfoEntity {
  const _NbDeviceInfoEntity({this.nbNodeId = '', this.nbCardNumber = '', this.nbOperator = '', this.nbOperatorName = '', this.nbRssi = 0, this.updateDate});
  

@override@JsonKey() final  String nbNodeId;
@override@JsonKey() final  String nbCardNumber;
@override@JsonKey() final  String nbOperator;
@override@JsonKey() final  String nbOperatorName;
@override@JsonKey() final  int nbRssi;
@override final  DateTime? updateDate;

/// Create a copy of NbDeviceInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NbDeviceInfoEntityCopyWith<_NbDeviceInfoEntity> get copyWith => __$NbDeviceInfoEntityCopyWithImpl<_NbDeviceInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NbDeviceInfoEntity&&(identical(other.nbNodeId, nbNodeId) || other.nbNodeId == nbNodeId)&&(identical(other.nbCardNumber, nbCardNumber) || other.nbCardNumber == nbCardNumber)&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.nbOperatorName, nbOperatorName) || other.nbOperatorName == nbOperatorName)&&(identical(other.nbRssi, nbRssi) || other.nbRssi == nbRssi)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}


@override
int get hashCode => Object.hash(runtimeType,nbNodeId,nbCardNumber,nbOperator,nbOperatorName,nbRssi,updateDate);

@override
String toString() {
  return 'NbDeviceInfoEntity(nbNodeId: $nbNodeId, nbCardNumber: $nbCardNumber, nbOperator: $nbOperator, nbOperatorName: $nbOperatorName, nbRssi: $nbRssi, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class _$NbDeviceInfoEntityCopyWith<$Res> implements $NbDeviceInfoEntityCopyWith<$Res> {
  factory _$NbDeviceInfoEntityCopyWith(_NbDeviceInfoEntity value, $Res Function(_NbDeviceInfoEntity) _then) = __$NbDeviceInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String nbNodeId, String nbCardNumber, String nbOperator, String nbOperatorName, int nbRssi, DateTime? updateDate
});




}
/// @nodoc
class __$NbDeviceInfoEntityCopyWithImpl<$Res>
    implements _$NbDeviceInfoEntityCopyWith<$Res> {
  __$NbDeviceInfoEntityCopyWithImpl(this._self, this._then);

  final _NbDeviceInfoEntity _self;
  final $Res Function(_NbDeviceInfoEntity) _then;

/// Create a copy of NbDeviceInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nbNodeId = null,Object? nbCardNumber = null,Object? nbOperator = null,Object? nbOperatorName = null,Object? nbRssi = null,Object? updateDate = freezed,}) {
  return _then(_NbDeviceInfoEntity(
nbNodeId: null == nbNodeId ? _self.nbNodeId : nbNodeId // ignore: cast_nullable_to_non_nullable
as String,nbCardNumber: null == nbCardNumber ? _self.nbCardNumber : nbCardNumber // ignore: cast_nullable_to_non_nullable
as String,nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,nbOperatorName: null == nbOperatorName ? _self.nbOperatorName : nbOperatorName // ignore: cast_nullable_to_non_nullable
as String,nbRssi: null == nbRssi ? _self.nbRssi : nbRssi // ignore: cast_nullable_to_non_nullable
as int,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$NbPlatformEndpointEntity {

 String get nbOperator; String get ip; int get port;
/// Create a copy of NbPlatformEndpointEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NbPlatformEndpointEntityCopyWith<NbPlatformEndpointEntity> get copyWith => _$NbPlatformEndpointEntityCopyWithImpl<NbPlatformEndpointEntity>(this as NbPlatformEndpointEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NbPlatformEndpointEntity&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port));
}


@override
int get hashCode => Object.hash(runtimeType,nbOperator,ip,port);

@override
String toString() {
  return 'NbPlatformEndpointEntity(nbOperator: $nbOperator, ip: $ip, port: $port)';
}


}

/// @nodoc
abstract mixin class $NbPlatformEndpointEntityCopyWith<$Res>  {
  factory $NbPlatformEndpointEntityCopyWith(NbPlatformEndpointEntity value, $Res Function(NbPlatformEndpointEntity) _then) = _$NbPlatformEndpointEntityCopyWithImpl;
@useResult
$Res call({
 String nbOperator, String ip, int port
});




}
/// @nodoc
class _$NbPlatformEndpointEntityCopyWithImpl<$Res>
    implements $NbPlatformEndpointEntityCopyWith<$Res> {
  _$NbPlatformEndpointEntityCopyWithImpl(this._self, this._then);

  final NbPlatformEndpointEntity _self;
  final $Res Function(NbPlatformEndpointEntity) _then;

/// Create a copy of NbPlatformEndpointEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nbOperator = null,Object? ip = null,Object? port = null,}) {
  return _then(_self.copyWith(
nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NbPlatformEndpointEntity].
extension NbPlatformEndpointEntityPatterns on NbPlatformEndpointEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NbPlatformEndpointEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NbPlatformEndpointEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NbPlatformEndpointEntity value)  $default,){
final _that = this;
switch (_that) {
case _NbPlatformEndpointEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NbPlatformEndpointEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NbPlatformEndpointEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nbOperator,  String ip,  int port)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NbPlatformEndpointEntity() when $default != null:
return $default(_that.nbOperator,_that.ip,_that.port);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nbOperator,  String ip,  int port)  $default,) {final _that = this;
switch (_that) {
case _NbPlatformEndpointEntity():
return $default(_that.nbOperator,_that.ip,_that.port);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nbOperator,  String ip,  int port)?  $default,) {final _that = this;
switch (_that) {
case _NbPlatformEndpointEntity() when $default != null:
return $default(_that.nbOperator,_that.ip,_that.port);case _:
  return null;

}
}

}

/// @nodoc


class _NbPlatformEndpointEntity implements NbPlatformEndpointEntity {
  const _NbPlatformEndpointEntity({this.nbOperator = '', this.ip = '', this.port = 0});
  

@override@JsonKey() final  String nbOperator;
@override@JsonKey() final  String ip;
@override@JsonKey() final  int port;

/// Create a copy of NbPlatformEndpointEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NbPlatformEndpointEntityCopyWith<_NbPlatformEndpointEntity> get copyWith => __$NbPlatformEndpointEntityCopyWithImpl<_NbPlatformEndpointEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NbPlatformEndpointEntity&&(identical(other.nbOperator, nbOperator) || other.nbOperator == nbOperator)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.port, port) || other.port == port));
}


@override
int get hashCode => Object.hash(runtimeType,nbOperator,ip,port);

@override
String toString() {
  return 'NbPlatformEndpointEntity(nbOperator: $nbOperator, ip: $ip, port: $port)';
}


}

/// @nodoc
abstract mixin class _$NbPlatformEndpointEntityCopyWith<$Res> implements $NbPlatformEndpointEntityCopyWith<$Res> {
  factory _$NbPlatformEndpointEntityCopyWith(_NbPlatformEndpointEntity value, $Res Function(_NbPlatformEndpointEntity) _then) = __$NbPlatformEndpointEntityCopyWithImpl;
@override @useResult
$Res call({
 String nbOperator, String ip, int port
});




}
/// @nodoc
class __$NbPlatformEndpointEntityCopyWithImpl<$Res>
    implements _$NbPlatformEndpointEntityCopyWith<$Res> {
  __$NbPlatformEndpointEntityCopyWithImpl(this._self, this._then);

  final _NbPlatformEndpointEntity _self;
  final $Res Function(_NbPlatformEndpointEntity) _then;

/// Create a copy of NbPlatformEndpointEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nbOperator = null,Object? ip = null,Object? port = null,}) {
  return _then(_NbPlatformEndpointEntity(
nbOperator: null == nbOperator ? _self.nbOperator : nbOperator // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$HotelLockEntity {

 int get lockId; String get lockName; String get lockAlias; String get lockMac; int get electricQuantity; String get featureValue; bool get hasGateway; String get lockData; String get sector; DateTime? get electricQuantityUpdateDate; String get buildingName; int get buildingNumber; String get floorName; int get floorNumber; int get groupId; String get groupName; DateTime? get initDate;
/// Create a copy of HotelLockEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelLockEntityCopyWith<HotelLockEntity> get copyWith => _$HotelLockEntityCopyWithImpl<HotelLockEntity>(this as HotelLockEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotelLockEntity&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.hasGateway, hasGateway) || other.hasGateway == hasGateway)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.electricQuantityUpdateDate, electricQuantityUpdateDate) || other.electricQuantityUpdateDate == electricQuantityUpdateDate)&&(identical(other.buildingName, buildingName) || other.buildingName == buildingName)&&(identical(other.buildingNumber, buildingNumber) || other.buildingNumber == buildingNumber)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.floorNumber, floorNumber) || other.floorNumber == floorNumber)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.initDate, initDate) || other.initDate == initDate));
}


@override
int get hashCode => Object.hash(runtimeType,lockId,lockName,lockAlias,lockMac,electricQuantity,featureValue,hasGateway,lockData,sector,electricQuantityUpdateDate,buildingName,buildingNumber,floorName,floorNumber,groupId,groupName,initDate);

@override
String toString() {
  return 'HotelLockEntity(lockId: $lockId, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, electricQuantity: $electricQuantity, featureValue: $featureValue, hasGateway: $hasGateway, lockData: $lockData, sector: $sector, electricQuantityUpdateDate: $electricQuantityUpdateDate, buildingName: $buildingName, buildingNumber: $buildingNumber, floorName: $floorName, floorNumber: $floorNumber, groupId: $groupId, groupName: $groupName, initDate: $initDate)';
}


}

/// @nodoc
abstract mixin class $HotelLockEntityCopyWith<$Res>  {
  factory $HotelLockEntityCopyWith(HotelLockEntity value, $Res Function(HotelLockEntity) _then) = _$HotelLockEntityCopyWithImpl;
@useResult
$Res call({
 int lockId, String lockName, String lockAlias, String lockMac, int electricQuantity, String featureValue, bool hasGateway, String lockData, String sector, DateTime? electricQuantityUpdateDate, String buildingName, int buildingNumber, String floorName, int floorNumber, int groupId, String groupName, DateTime? initDate
});




}
/// @nodoc
class _$HotelLockEntityCopyWithImpl<$Res>
    implements $HotelLockEntityCopyWith<$Res> {
  _$HotelLockEntityCopyWithImpl(this._self, this._then);

  final HotelLockEntity _self;
  final $Res Function(HotelLockEntity) _then;

/// Create a copy of HotelLockEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockId = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? electricQuantity = null,Object? featureValue = null,Object? hasGateway = null,Object? lockData = null,Object? sector = null,Object? electricQuantityUpdateDate = freezed,Object? buildingName = null,Object? buildingNumber = null,Object? floorName = null,Object? floorNumber = null,Object? groupId = null,Object? groupName = null,Object? initDate = freezed,}) {
  return _then(_self.copyWith(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,hasGateway: null == hasGateway ? _self.hasGateway : hasGateway // ignore: cast_nullable_to_non_nullable
as bool,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,electricQuantityUpdateDate: freezed == electricQuantityUpdateDate ? _self.electricQuantityUpdateDate : electricQuantityUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,buildingName: null == buildingName ? _self.buildingName : buildingName // ignore: cast_nullable_to_non_nullable
as String,buildingNumber: null == buildingNumber ? _self.buildingNumber : buildingNumber // ignore: cast_nullable_to_non_nullable
as int,floorName: null == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String,floorNumber: null == floorNumber ? _self.floorNumber : floorNumber // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,initDate: freezed == initDate ? _self.initDate : initDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HotelLockEntity].
extension HotelLockEntityPatterns on HotelLockEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotelLockEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotelLockEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotelLockEntity value)  $default,){
final _that = this;
switch (_that) {
case _HotelLockEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotelLockEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HotelLockEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int lockId,  String lockName,  String lockAlias,  String lockMac,  int electricQuantity,  String featureValue,  bool hasGateway,  String lockData,  String sector,  DateTime? electricQuantityUpdateDate,  String buildingName,  int buildingNumber,  String floorName,  int floorNumber,  int groupId,  String groupName,  DateTime? initDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotelLockEntity() when $default != null:
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.sector,_that.electricQuantityUpdateDate,_that.buildingName,_that.buildingNumber,_that.floorName,_that.floorNumber,_that.groupId,_that.groupName,_that.initDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int lockId,  String lockName,  String lockAlias,  String lockMac,  int electricQuantity,  String featureValue,  bool hasGateway,  String lockData,  String sector,  DateTime? electricQuantityUpdateDate,  String buildingName,  int buildingNumber,  String floorName,  int floorNumber,  int groupId,  String groupName,  DateTime? initDate)  $default,) {final _that = this;
switch (_that) {
case _HotelLockEntity():
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.sector,_that.electricQuantityUpdateDate,_that.buildingName,_that.buildingNumber,_that.floorName,_that.floorNumber,_that.groupId,_that.groupName,_that.initDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int lockId,  String lockName,  String lockAlias,  String lockMac,  int electricQuantity,  String featureValue,  bool hasGateway,  String lockData,  String sector,  DateTime? electricQuantityUpdateDate,  String buildingName,  int buildingNumber,  String floorName,  int floorNumber,  int groupId,  String groupName,  DateTime? initDate)?  $default,) {final _that = this;
switch (_that) {
case _HotelLockEntity() when $default != null:
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.sector,_that.electricQuantityUpdateDate,_that.buildingName,_that.buildingNumber,_that.floorName,_that.floorNumber,_that.groupId,_that.groupName,_that.initDate);case _:
  return null;

}
}

}

/// @nodoc


class _HotelLockEntity extends HotelLockEntity {
  const _HotelLockEntity({this.lockId = 0, this.lockName = '', this.lockAlias = '', this.lockMac = '', this.electricQuantity = 0, this.featureValue = '', this.hasGateway = false, this.lockData = '', this.sector = '', this.electricQuantityUpdateDate, this.buildingName = '', this.buildingNumber = 0, this.floorName = '', this.floorNumber = 0, this.groupId = 0, this.groupName = '', this.initDate}): super._();
  

@override@JsonKey() final  int lockId;
@override@JsonKey() final  String lockName;
@override@JsonKey() final  String lockAlias;
@override@JsonKey() final  String lockMac;
@override@JsonKey() final  int electricQuantity;
@override@JsonKey() final  String featureValue;
@override@JsonKey() final  bool hasGateway;
@override@JsonKey() final  String lockData;
@override@JsonKey() final  String sector;
@override final  DateTime? electricQuantityUpdateDate;
@override@JsonKey() final  String buildingName;
@override@JsonKey() final  int buildingNumber;
@override@JsonKey() final  String floorName;
@override@JsonKey() final  int floorNumber;
@override@JsonKey() final  int groupId;
@override@JsonKey() final  String groupName;
@override final  DateTime? initDate;

/// Create a copy of HotelLockEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelLockEntityCopyWith<_HotelLockEntity> get copyWith => __$HotelLockEntityCopyWithImpl<_HotelLockEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotelLockEntity&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.hasGateway, hasGateway) || other.hasGateway == hasGateway)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.electricQuantityUpdateDate, electricQuantityUpdateDate) || other.electricQuantityUpdateDate == electricQuantityUpdateDate)&&(identical(other.buildingName, buildingName) || other.buildingName == buildingName)&&(identical(other.buildingNumber, buildingNumber) || other.buildingNumber == buildingNumber)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.floorNumber, floorNumber) || other.floorNumber == floorNumber)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.initDate, initDate) || other.initDate == initDate));
}


@override
int get hashCode => Object.hash(runtimeType,lockId,lockName,lockAlias,lockMac,electricQuantity,featureValue,hasGateway,lockData,sector,electricQuantityUpdateDate,buildingName,buildingNumber,floorName,floorNumber,groupId,groupName,initDate);

@override
String toString() {
  return 'HotelLockEntity(lockId: $lockId, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, electricQuantity: $electricQuantity, featureValue: $featureValue, hasGateway: $hasGateway, lockData: $lockData, sector: $sector, electricQuantityUpdateDate: $electricQuantityUpdateDate, buildingName: $buildingName, buildingNumber: $buildingNumber, floorName: $floorName, floorNumber: $floorNumber, groupId: $groupId, groupName: $groupName, initDate: $initDate)';
}


}

/// @nodoc
abstract mixin class _$HotelLockEntityCopyWith<$Res> implements $HotelLockEntityCopyWith<$Res> {
  factory _$HotelLockEntityCopyWith(_HotelLockEntity value, $Res Function(_HotelLockEntity) _then) = __$HotelLockEntityCopyWithImpl;
@override @useResult
$Res call({
 int lockId, String lockName, String lockAlias, String lockMac, int electricQuantity, String featureValue, bool hasGateway, String lockData, String sector, DateTime? electricQuantityUpdateDate, String buildingName, int buildingNumber, String floorName, int floorNumber, int groupId, String groupName, DateTime? initDate
});




}
/// @nodoc
class __$HotelLockEntityCopyWithImpl<$Res>
    implements _$HotelLockEntityCopyWith<$Res> {
  __$HotelLockEntityCopyWithImpl(this._self, this._then);

  final _HotelLockEntity _self;
  final $Res Function(_HotelLockEntity) _then;

/// Create a copy of HotelLockEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockId = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? electricQuantity = null,Object? featureValue = null,Object? hasGateway = null,Object? lockData = null,Object? sector = null,Object? electricQuantityUpdateDate = freezed,Object? buildingName = null,Object? buildingNumber = null,Object? floorName = null,Object? floorNumber = null,Object? groupId = null,Object? groupName = null,Object? initDate = freezed,}) {
  return _then(_HotelLockEntity(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,hasGateway: null == hasGateway ? _self.hasGateway : hasGateway // ignore: cast_nullable_to_non_nullable
as bool,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,electricQuantityUpdateDate: freezed == electricQuantityUpdateDate ? _self.electricQuantityUpdateDate : electricQuantityUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,buildingName: null == buildingName ? _self.buildingName : buildingName // ignore: cast_nullable_to_non_nullable
as String,buildingNumber: null == buildingNumber ? _self.buildingNumber : buildingNumber // ignore: cast_nullable_to_non_nullable
as int,floorName: null == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String,floorNumber: null == floorNumber ? _self.floorNumber : floorNumber // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,initDate: freezed == initDate ? _self.initDate : initDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$LockImportDataEntity {

 int get keyNum; int get keyboardPwdNum; int get cardNum; List<Map<String, dynamic>> get keyboardPwdList; List<Map<String, dynamic>> get identityCardList;
/// Create a copy of LockImportDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockImportDataEntityCopyWith<LockImportDataEntity> get copyWith => _$LockImportDataEntityCopyWithImpl<LockImportDataEntity>(this as LockImportDataEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockImportDataEntity&&(identical(other.keyNum, keyNum) || other.keyNum == keyNum)&&(identical(other.keyboardPwdNum, keyboardPwdNum) || other.keyboardPwdNum == keyboardPwdNum)&&(identical(other.cardNum, cardNum) || other.cardNum == cardNum)&&const DeepCollectionEquality().equals(other.keyboardPwdList, keyboardPwdList)&&const DeepCollectionEquality().equals(other.identityCardList, identityCardList));
}


@override
int get hashCode => Object.hash(runtimeType,keyNum,keyboardPwdNum,cardNum,const DeepCollectionEquality().hash(keyboardPwdList),const DeepCollectionEquality().hash(identityCardList));

@override
String toString() {
  return 'LockImportDataEntity(keyNum: $keyNum, keyboardPwdNum: $keyboardPwdNum, cardNum: $cardNum, keyboardPwdList: $keyboardPwdList, identityCardList: $identityCardList)';
}


}

/// @nodoc
abstract mixin class $LockImportDataEntityCopyWith<$Res>  {
  factory $LockImportDataEntityCopyWith(LockImportDataEntity value, $Res Function(LockImportDataEntity) _then) = _$LockImportDataEntityCopyWithImpl;
@useResult
$Res call({
 int keyNum, int keyboardPwdNum, int cardNum, List<Map<String, dynamic>> keyboardPwdList, List<Map<String, dynamic>> identityCardList
});




}
/// @nodoc
class _$LockImportDataEntityCopyWithImpl<$Res>
    implements $LockImportDataEntityCopyWith<$Res> {
  _$LockImportDataEntityCopyWithImpl(this._self, this._then);

  final LockImportDataEntity _self;
  final $Res Function(LockImportDataEntity) _then;

/// Create a copy of LockImportDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyNum = null,Object? keyboardPwdNum = null,Object? cardNum = null,Object? keyboardPwdList = null,Object? identityCardList = null,}) {
  return _then(_self.copyWith(
keyNum: null == keyNum ? _self.keyNum : keyNum // ignore: cast_nullable_to_non_nullable
as int,keyboardPwdNum: null == keyboardPwdNum ? _self.keyboardPwdNum : keyboardPwdNum // ignore: cast_nullable_to_non_nullable
as int,cardNum: null == cardNum ? _self.cardNum : cardNum // ignore: cast_nullable_to_non_nullable
as int,keyboardPwdList: null == keyboardPwdList ? _self.keyboardPwdList : keyboardPwdList // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,identityCardList: null == identityCardList ? _self.identityCardList : identityCardList // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [LockImportDataEntity].
extension LockImportDataEntityPatterns on LockImportDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockImportDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockImportDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockImportDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _LockImportDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockImportDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LockImportDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int keyNum,  int keyboardPwdNum,  int cardNum,  List<Map<String, dynamic>> keyboardPwdList,  List<Map<String, dynamic>> identityCardList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockImportDataEntity() when $default != null:
return $default(_that.keyNum,_that.keyboardPwdNum,_that.cardNum,_that.keyboardPwdList,_that.identityCardList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int keyNum,  int keyboardPwdNum,  int cardNum,  List<Map<String, dynamic>> keyboardPwdList,  List<Map<String, dynamic>> identityCardList)  $default,) {final _that = this;
switch (_that) {
case _LockImportDataEntity():
return $default(_that.keyNum,_that.keyboardPwdNum,_that.cardNum,_that.keyboardPwdList,_that.identityCardList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int keyNum,  int keyboardPwdNum,  int cardNum,  List<Map<String, dynamic>> keyboardPwdList,  List<Map<String, dynamic>> identityCardList)?  $default,) {final _that = this;
switch (_that) {
case _LockImportDataEntity() when $default != null:
return $default(_that.keyNum,_that.keyboardPwdNum,_that.cardNum,_that.keyboardPwdList,_that.identityCardList);case _:
  return null;

}
}

}

/// @nodoc


class _LockImportDataEntity implements LockImportDataEntity {
  const _LockImportDataEntity({this.keyNum = 0, this.keyboardPwdNum = 0, this.cardNum = 0, final  List<Map<String, dynamic>> keyboardPwdList = const [], final  List<Map<String, dynamic>> identityCardList = const []}): _keyboardPwdList = keyboardPwdList,_identityCardList = identityCardList;
  

@override@JsonKey() final  int keyNum;
@override@JsonKey() final  int keyboardPwdNum;
@override@JsonKey() final  int cardNum;
 final  List<Map<String, dynamic>> _keyboardPwdList;
@override@JsonKey() List<Map<String, dynamic>> get keyboardPwdList {
  if (_keyboardPwdList is EqualUnmodifiableListView) return _keyboardPwdList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keyboardPwdList);
}

 final  List<Map<String, dynamic>> _identityCardList;
@override@JsonKey() List<Map<String, dynamic>> get identityCardList {
  if (_identityCardList is EqualUnmodifiableListView) return _identityCardList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_identityCardList);
}


/// Create a copy of LockImportDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockImportDataEntityCopyWith<_LockImportDataEntity> get copyWith => __$LockImportDataEntityCopyWithImpl<_LockImportDataEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockImportDataEntity&&(identical(other.keyNum, keyNum) || other.keyNum == keyNum)&&(identical(other.keyboardPwdNum, keyboardPwdNum) || other.keyboardPwdNum == keyboardPwdNum)&&(identical(other.cardNum, cardNum) || other.cardNum == cardNum)&&const DeepCollectionEquality().equals(other._keyboardPwdList, _keyboardPwdList)&&const DeepCollectionEquality().equals(other._identityCardList, _identityCardList));
}


@override
int get hashCode => Object.hash(runtimeType,keyNum,keyboardPwdNum,cardNum,const DeepCollectionEquality().hash(_keyboardPwdList),const DeepCollectionEquality().hash(_identityCardList));

@override
String toString() {
  return 'LockImportDataEntity(keyNum: $keyNum, keyboardPwdNum: $keyboardPwdNum, cardNum: $cardNum, keyboardPwdList: $keyboardPwdList, identityCardList: $identityCardList)';
}


}

/// @nodoc
abstract mixin class _$LockImportDataEntityCopyWith<$Res> implements $LockImportDataEntityCopyWith<$Res> {
  factory _$LockImportDataEntityCopyWith(_LockImportDataEntity value, $Res Function(_LockImportDataEntity) _then) = __$LockImportDataEntityCopyWithImpl;
@override @useResult
$Res call({
 int keyNum, int keyboardPwdNum, int cardNum, List<Map<String, dynamic>> keyboardPwdList, List<Map<String, dynamic>> identityCardList
});




}
/// @nodoc
class __$LockImportDataEntityCopyWithImpl<$Res>
    implements _$LockImportDataEntityCopyWith<$Res> {
  __$LockImportDataEntityCopyWithImpl(this._self, this._then);

  final _LockImportDataEntity _self;
  final $Res Function(_LockImportDataEntity) _then;

/// Create a copy of LockImportDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyNum = null,Object? keyboardPwdNum = null,Object? cardNum = null,Object? keyboardPwdList = null,Object? identityCardList = null,}) {
  return _then(_LockImportDataEntity(
keyNum: null == keyNum ? _self.keyNum : keyNum // ignore: cast_nullable_to_non_nullable
as int,keyboardPwdNum: null == keyboardPwdNum ? _self.keyboardPwdNum : keyboardPwdNum // ignore: cast_nullable_to_non_nullable
as int,cardNum: null == cardNum ? _self.cardNum : cardNum // ignore: cast_nullable_to_non_nullable
as int,keyboardPwdList: null == keyboardPwdList ? _self._keyboardPwdList : keyboardPwdList // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,identityCardList: null == identityCardList ? _self._identityCardList : identityCardList // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
