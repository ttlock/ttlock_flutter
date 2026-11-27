// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LockDto {

@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'lockName') String get lockName;@JsonKey(name: 'lockAlias') String get lockAlias;@JsonKey(name: 'lockMac') String get lockMac;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;@JsonKey(name: 'featureValue') String get featureValue;@JsonKey(name: 'hasGateway', fromJson: intFromDynamic) int get hasGateway;@JsonKey(name: 'lockData') String get lockData;@JsonKey(name: 'groupId', fromJson: intFromDynamic) int get groupId;@JsonKey(name: 'groupName') String get groupName;@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get initDate;/// 以下字段仅 `lock/detail` 可能返回；list 响应中为 null。
@JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic) int? get autoLockTime;@JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic) int? get lockSound;@JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic) int? get soundVolume;@JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic) int? get privacyLock;@JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic) int? get tamperAlert;@JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic) int? get resetButton;@JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic) int? get openDirection;@JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic) int? get passageMode;@JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic) int? get passageModeAutoUnlock;
/// Create a copy of LockDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockDtoCopyWith<LockDto> get copyWith => _$LockDtoCopyWithImpl<LockDto>(this as LockDto, _$identity);

  /// Serializes this LockDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockDto&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.hasGateway, hasGateway) || other.hasGateway == hasGateway)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.initDate, initDate) || other.initDate == initDate)&&(identical(other.autoLockTime, autoLockTime) || other.autoLockTime == autoLockTime)&&(identical(other.lockSound, lockSound) || other.lockSound == lockSound)&&(identical(other.soundVolume, soundVolume) || other.soundVolume == soundVolume)&&(identical(other.privacyLock, privacyLock) || other.privacyLock == privacyLock)&&(identical(other.tamperAlert, tamperAlert) || other.tamperAlert == tamperAlert)&&(identical(other.resetButton, resetButton) || other.resetButton == resetButton)&&(identical(other.openDirection, openDirection) || other.openDirection == openDirection)&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.passageModeAutoUnlock, passageModeAutoUnlock) || other.passageModeAutoUnlock == passageModeAutoUnlock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,lockId,lockName,lockAlias,lockMac,electricQuantity,featureValue,hasGateway,lockData,groupId,groupName,initDate,autoLockTime,lockSound,soundVolume,privacyLock,tamperAlert,resetButton,openDirection,passageMode,passageModeAutoUnlock]);

@override
String toString() {
  return 'LockDto(lockId: $lockId, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, electricQuantity: $electricQuantity, featureValue: $featureValue, hasGateway: $hasGateway, lockData: $lockData, groupId: $groupId, groupName: $groupName, initDate: $initDate, autoLockTime: $autoLockTime, lockSound: $lockSound, soundVolume: $soundVolume, privacyLock: $privacyLock, tamperAlert: $tamperAlert, resetButton: $resetButton, openDirection: $openDirection, passageMode: $passageMode, passageModeAutoUnlock: $passageModeAutoUnlock)';
}


}

/// @nodoc
abstract mixin class $LockDtoCopyWith<$Res>  {
  factory $LockDtoCopyWith(LockDto value, $Res Function(LockDto) _then) = _$LockDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'lockName') String lockName,@JsonKey(name: 'lockAlias') String lockAlias,@JsonKey(name: 'lockMac') String lockMac,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'hasGateway', fromJson: intFromDynamic) int hasGateway,@JsonKey(name: 'lockData') String lockData,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? initDate,@JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic) int? autoLockTime,@JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic) int? lockSound,@JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic) int? soundVolume,@JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic) int? privacyLock,@JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic) int? tamperAlert,@JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic) int? resetButton,@JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic) int? openDirection,@JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic) int? passageMode,@JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic) int? passageModeAutoUnlock
});




}
/// @nodoc
class _$LockDtoCopyWithImpl<$Res>
    implements $LockDtoCopyWith<$Res> {
  _$LockDtoCopyWithImpl(this._self, this._then);

  final LockDto _self;
  final $Res Function(LockDto) _then;

/// Create a copy of LockDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockId = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? electricQuantity = null,Object? featureValue = null,Object? hasGateway = null,Object? lockData = null,Object? groupId = null,Object? groupName = null,Object? initDate = freezed,Object? autoLockTime = freezed,Object? lockSound = freezed,Object? soundVolume = freezed,Object? privacyLock = freezed,Object? tamperAlert = freezed,Object? resetButton = freezed,Object? openDirection = freezed,Object? passageMode = freezed,Object? passageModeAutoUnlock = freezed,}) {
  return _then(_self.copyWith(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,hasGateway: null == hasGateway ? _self.hasGateway : hasGateway // ignore: cast_nullable_to_non_nullable
as int,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,initDate: freezed == initDate ? _self.initDate : initDate // ignore: cast_nullable_to_non_nullable
as DateTime?,autoLockTime: freezed == autoLockTime ? _self.autoLockTime : autoLockTime // ignore: cast_nullable_to_non_nullable
as int?,lockSound: freezed == lockSound ? _self.lockSound : lockSound // ignore: cast_nullable_to_non_nullable
as int?,soundVolume: freezed == soundVolume ? _self.soundVolume : soundVolume // ignore: cast_nullable_to_non_nullable
as int?,privacyLock: freezed == privacyLock ? _self.privacyLock : privacyLock // ignore: cast_nullable_to_non_nullable
as int?,tamperAlert: freezed == tamperAlert ? _self.tamperAlert : tamperAlert // ignore: cast_nullable_to_non_nullable
as int?,resetButton: freezed == resetButton ? _self.resetButton : resetButton // ignore: cast_nullable_to_non_nullable
as int?,openDirection: freezed == openDirection ? _self.openDirection : openDirection // ignore: cast_nullable_to_non_nullable
as int?,passageMode: freezed == passageMode ? _self.passageMode : passageMode // ignore: cast_nullable_to_non_nullable
as int?,passageModeAutoUnlock: freezed == passageModeAutoUnlock ? _self.passageModeAutoUnlock : passageModeAutoUnlock // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LockDto].
extension LockDtoPatterns on LockDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockDto value)  $default,){
final _that = this;
switch (_that) {
case _LockDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockDto value)?  $default,){
final _that = this;
switch (_that) {
case _LockDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'hasGateway', fromJson: intFromDynamic)  int hasGateway, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? initDate, @JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic)  int? autoLockTime, @JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic)  int? lockSound, @JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic)  int? soundVolume, @JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic)  int? privacyLock, @JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic)  int? tamperAlert, @JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic)  int? resetButton, @JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic)  int? openDirection, @JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic)  int? passageMode, @JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic)  int? passageModeAutoUnlock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockDto() when $default != null:
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.groupId,_that.groupName,_that.initDate,_that.autoLockTime,_that.lockSound,_that.soundVolume,_that.privacyLock,_that.tamperAlert,_that.resetButton,_that.openDirection,_that.passageMode,_that.passageModeAutoUnlock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'hasGateway', fromJson: intFromDynamic)  int hasGateway, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? initDate, @JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic)  int? autoLockTime, @JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic)  int? lockSound, @JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic)  int? soundVolume, @JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic)  int? privacyLock, @JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic)  int? tamperAlert, @JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic)  int? resetButton, @JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic)  int? openDirection, @JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic)  int? passageMode, @JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic)  int? passageModeAutoUnlock)  $default,) {final _that = this;
switch (_that) {
case _LockDto():
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.groupId,_that.groupName,_that.initDate,_that.autoLockTime,_that.lockSound,_that.soundVolume,_that.privacyLock,_that.tamperAlert,_that.resetButton,_that.openDirection,_that.passageMode,_that.passageModeAutoUnlock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'hasGateway', fromJson: intFromDynamic)  int hasGateway, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? initDate, @JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic)  int? autoLockTime, @JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic)  int? lockSound, @JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic)  int? soundVolume, @JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic)  int? privacyLock, @JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic)  int? tamperAlert, @JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic)  int? resetButton, @JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic)  int? openDirection, @JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic)  int? passageMode, @JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic)  int? passageModeAutoUnlock)?  $default,) {final _that = this;
switch (_that) {
case _LockDto() when $default != null:
return $default(_that.lockId,_that.lockName,_that.lockAlias,_that.lockMac,_that.electricQuantity,_that.featureValue,_that.hasGateway,_that.lockData,_that.groupId,_that.groupName,_that.initDate,_that.autoLockTime,_that.lockSound,_that.soundVolume,_that.privacyLock,_that.tamperAlert,_that.resetButton,_that.openDirection,_that.passageMode,_that.passageModeAutoUnlock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockDto extends LockDto {
  const _LockDto({@JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'lockName') this.lockName = '', @JsonKey(name: 'lockAlias') this.lockAlias = '', @JsonKey(name: 'lockMac') this.lockMac = '', @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'featureValue') this.featureValue = '', @JsonKey(name: 'hasGateway', fromJson: intFromDynamic) this.hasGateway = 0, @JsonKey(name: 'lockData') this.lockData = '', @JsonKey(name: 'groupId', fromJson: intFromDynamic) this.groupId = 0, @JsonKey(name: 'groupName') this.groupName = '', @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.initDate, @JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic) this.autoLockTime, @JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic) this.lockSound, @JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic) this.soundVolume, @JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic) this.privacyLock, @JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic) this.tamperAlert, @JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic) this.resetButton, @JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic) this.openDirection, @JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic) this.passageMode, @JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic) this.passageModeAutoUnlock}): super._();
  factory _LockDto.fromJson(Map<String, dynamic> json) => _$LockDtoFromJson(json);

@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'lockName') final  String lockName;
@override@JsonKey(name: 'lockAlias') final  String lockAlias;
@override@JsonKey(name: 'lockMac') final  String lockMac;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
@override@JsonKey(name: 'featureValue') final  String featureValue;
@override@JsonKey(name: 'hasGateway', fromJson: intFromDynamic) final  int hasGateway;
@override@JsonKey(name: 'lockData') final  String lockData;
@override@JsonKey(name: 'groupId', fromJson: intFromDynamic) final  int groupId;
@override@JsonKey(name: 'groupName') final  String groupName;
@override@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? initDate;
/// 以下字段仅 `lock/detail` 可能返回；list 响应中为 null。
@override@JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic) final  int? autoLockTime;
@override@JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic) final  int? lockSound;
@override@JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic) final  int? soundVolume;
@override@JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic) final  int? privacyLock;
@override@JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic) final  int? tamperAlert;
@override@JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic) final  int? resetButton;
@override@JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic) final  int? openDirection;
@override@JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic) final  int? passageMode;
@override@JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic) final  int? passageModeAutoUnlock;

/// Create a copy of LockDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockDtoCopyWith<_LockDto> get copyWith => __$LockDtoCopyWithImpl<_LockDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockDto&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.hasGateway, hasGateway) || other.hasGateway == hasGateway)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.initDate, initDate) || other.initDate == initDate)&&(identical(other.autoLockTime, autoLockTime) || other.autoLockTime == autoLockTime)&&(identical(other.lockSound, lockSound) || other.lockSound == lockSound)&&(identical(other.soundVolume, soundVolume) || other.soundVolume == soundVolume)&&(identical(other.privacyLock, privacyLock) || other.privacyLock == privacyLock)&&(identical(other.tamperAlert, tamperAlert) || other.tamperAlert == tamperAlert)&&(identical(other.resetButton, resetButton) || other.resetButton == resetButton)&&(identical(other.openDirection, openDirection) || other.openDirection == openDirection)&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.passageModeAutoUnlock, passageModeAutoUnlock) || other.passageModeAutoUnlock == passageModeAutoUnlock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,lockId,lockName,lockAlias,lockMac,electricQuantity,featureValue,hasGateway,lockData,groupId,groupName,initDate,autoLockTime,lockSound,soundVolume,privacyLock,tamperAlert,resetButton,openDirection,passageMode,passageModeAutoUnlock]);

@override
String toString() {
  return 'LockDto(lockId: $lockId, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, electricQuantity: $electricQuantity, featureValue: $featureValue, hasGateway: $hasGateway, lockData: $lockData, groupId: $groupId, groupName: $groupName, initDate: $initDate, autoLockTime: $autoLockTime, lockSound: $lockSound, soundVolume: $soundVolume, privacyLock: $privacyLock, tamperAlert: $tamperAlert, resetButton: $resetButton, openDirection: $openDirection, passageMode: $passageMode, passageModeAutoUnlock: $passageModeAutoUnlock)';
}


}

/// @nodoc
abstract mixin class _$LockDtoCopyWith<$Res> implements $LockDtoCopyWith<$Res> {
  factory _$LockDtoCopyWith(_LockDto value, $Res Function(_LockDto) _then) = __$LockDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'lockName') String lockName,@JsonKey(name: 'lockAlias') String lockAlias,@JsonKey(name: 'lockMac') String lockMac,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'hasGateway', fromJson: intFromDynamic) int hasGateway,@JsonKey(name: 'lockData') String lockData,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? initDate,@JsonKey(name: 'autoLockTime', fromJson: nullableIntFromDynamic) int? autoLockTime,@JsonKey(name: 'lockSound', fromJson: nullableIntFromDynamic) int? lockSound,@JsonKey(name: 'soundVolume', fromJson: nullableIntFromDynamic) int? soundVolume,@JsonKey(name: 'privacyLock', fromJson: nullableIntFromDynamic) int? privacyLock,@JsonKey(name: 'tamperAlert', fromJson: nullableIntFromDynamic) int? tamperAlert,@JsonKey(name: 'resetButton', fromJson: nullableIntFromDynamic) int? resetButton,@JsonKey(name: 'openDirection', fromJson: nullableIntFromDynamic) int? openDirection,@JsonKey(name: 'passageMode', fromJson: nullableIntFromDynamic) int? passageMode,@JsonKey(name: 'passageModeAutoUnlock', fromJson: nullableIntFromDynamic) int? passageModeAutoUnlock
});




}
/// @nodoc
class __$LockDtoCopyWithImpl<$Res>
    implements _$LockDtoCopyWith<$Res> {
  __$LockDtoCopyWithImpl(this._self, this._then);

  final _LockDto _self;
  final $Res Function(_LockDto) _then;

/// Create a copy of LockDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockId = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? electricQuantity = null,Object? featureValue = null,Object? hasGateway = null,Object? lockData = null,Object? groupId = null,Object? groupName = null,Object? initDate = freezed,Object? autoLockTime = freezed,Object? lockSound = freezed,Object? soundVolume = freezed,Object? privacyLock = freezed,Object? tamperAlert = freezed,Object? resetButton = freezed,Object? openDirection = freezed,Object? passageMode = freezed,Object? passageModeAutoUnlock = freezed,}) {
  return _then(_LockDto(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,hasGateway: null == hasGateway ? _self.hasGateway : hasGateway // ignore: cast_nullable_to_non_nullable
as int,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,initDate: freezed == initDate ? _self.initDate : initDate // ignore: cast_nullable_to_non_nullable
as DateTime?,autoLockTime: freezed == autoLockTime ? _self.autoLockTime : autoLockTime // ignore: cast_nullable_to_non_nullable
as int?,lockSound: freezed == lockSound ? _self.lockSound : lockSound // ignore: cast_nullable_to_non_nullable
as int?,soundVolume: freezed == soundVolume ? _self.soundVolume : soundVolume // ignore: cast_nullable_to_non_nullable
as int?,privacyLock: freezed == privacyLock ? _self.privacyLock : privacyLock // ignore: cast_nullable_to_non_nullable
as int?,tamperAlert: freezed == tamperAlert ? _self.tamperAlert : tamperAlert // ignore: cast_nullable_to_non_nullable
as int?,resetButton: freezed == resetButton ? _self.resetButton : resetButton // ignore: cast_nullable_to_non_nullable
as int?,openDirection: freezed == openDirection ? _self.openDirection : openDirection // ignore: cast_nullable_to_non_nullable
as int?,passageMode: freezed == passageMode ? _self.passageMode : passageMode // ignore: cast_nullable_to_non_nullable
as int?,passageModeAutoUnlock: freezed == passageModeAutoUnlock ? _self.passageModeAutoUnlock : passageModeAutoUnlock // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LockInitializeDto {

@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'keyId', fromJson: stringFromDynamic) String get keyId;
/// Create a copy of LockInitializeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LockInitializeDtoCopyWith<LockInitializeDto> get copyWith => _$LockInitializeDtoCopyWithImpl<LockInitializeDto>(this as LockInitializeDto, _$identity);

  /// Serializes this LockInitializeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LockInitializeDto&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.keyId, keyId) || other.keyId == keyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockId,keyId);

@override
String toString() {
  return 'LockInitializeDto(lockId: $lockId, keyId: $keyId)';
}


}

/// @nodoc
abstract mixin class $LockInitializeDtoCopyWith<$Res>  {
  factory $LockInitializeDtoCopyWith(LockInitializeDto value, $Res Function(LockInitializeDto) _then) = _$LockInitializeDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'keyId', fromJson: stringFromDynamic) String keyId
});




}
/// @nodoc
class _$LockInitializeDtoCopyWithImpl<$Res>
    implements $LockInitializeDtoCopyWith<$Res> {
  _$LockInitializeDtoCopyWithImpl(this._self, this._then);

  final LockInitializeDto _self;
  final $Res Function(LockInitializeDto) _then;

/// Create a copy of LockInitializeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lockId = null,Object? keyId = null,}) {
  return _then(_self.copyWith(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,keyId: null == keyId ? _self.keyId : keyId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LockInitializeDto].
extension LockInitializeDtoPatterns on LockInitializeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LockInitializeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LockInitializeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LockInitializeDto value)  $default,){
final _that = this;
switch (_that) {
case _LockInitializeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LockInitializeDto value)?  $default,){
final _that = this;
switch (_that) {
case _LockInitializeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'keyId', fromJson: stringFromDynamic)  String keyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LockInitializeDto() when $default != null:
return $default(_that.lockId,_that.keyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'keyId', fromJson: stringFromDynamic)  String keyId)  $default,) {final _that = this;
switch (_that) {
case _LockInitializeDto():
return $default(_that.lockId,_that.keyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'keyId', fromJson: stringFromDynamic)  String keyId)?  $default,) {final _that = this;
switch (_that) {
case _LockInitializeDto() when $default != null:
return $default(_that.lockId,_that.keyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LockInitializeDto extends LockInitializeDto {
  const _LockInitializeDto({@JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'keyId', fromJson: stringFromDynamic) this.keyId = ''}): super._();
  factory _LockInitializeDto.fromJson(Map<String, dynamic> json) => _$LockInitializeDtoFromJson(json);

@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'keyId', fromJson: stringFromDynamic) final  String keyId;

/// Create a copy of LockInitializeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LockInitializeDtoCopyWith<_LockInitializeDto> get copyWith => __$LockInitializeDtoCopyWithImpl<_LockInitializeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LockInitializeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LockInitializeDto&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.keyId, keyId) || other.keyId == keyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lockId,keyId);

@override
String toString() {
  return 'LockInitializeDto(lockId: $lockId, keyId: $keyId)';
}


}

/// @nodoc
abstract mixin class _$LockInitializeDtoCopyWith<$Res> implements $LockInitializeDtoCopyWith<$Res> {
  factory _$LockInitializeDtoCopyWith(_LockInitializeDto value, $Res Function(_LockInitializeDto) _then) = __$LockInitializeDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'keyId', fromJson: stringFromDynamic) String keyId
});




}
/// @nodoc
class __$LockInitializeDtoCopyWithImpl<$Res>
    implements _$LockInitializeDtoCopyWith<$Res> {
  __$LockInitializeDtoCopyWithImpl(this._self, this._then);

  final _LockInitializeDto _self;
  final $Res Function(_LockInitializeDto) _then;

/// Create a copy of LockInitializeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lockId = null,Object? keyId = null,}) {
  return _then(_LockInitializeDto(
lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,keyId: null == keyId ? _self.keyId : keyId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
