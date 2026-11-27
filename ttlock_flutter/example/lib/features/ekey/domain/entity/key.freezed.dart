// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KeyEntity {

 int get keyId; String get lockData; int get lockId; KeyUserType get userType; KeyStatus get keyStatus; String get lockName; String get lockAlias; String get lockMac; String get noKeyPwd; int get electricQuantity; DateTime? get startDate; DateTime? get endDate; String get remarks; bool get keyRight; String get featureValue; bool get remoteEnable; bool get passageMode; int get timezoneRawOffset; int get groupId; String get groupName; String get username; String get keyName; String get senderUsername; int get uid; DateTime? get sendDate;
/// Create a copy of KeyEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeyEntityCopyWith<KeyEntity> get copyWith => _$KeyEntityCopyWithImpl<KeyEntity>(this as KeyEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeyEntity&&(identical(other.keyId, keyId) || other.keyId == keyId)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.keyStatus, keyStatus) || other.keyStatus == keyStatus)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.noKeyPwd, noKeyPwd) || other.noKeyPwd == noKeyPwd)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.keyRight, keyRight) || other.keyRight == keyRight)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.remoteEnable, remoteEnable) || other.remoteEnable == remoteEnable)&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.timezoneRawOffset, timezoneRawOffset) || other.timezoneRawOffset == timezoneRawOffset)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.username, username) || other.username == username)&&(identical(other.keyName, keyName) || other.keyName == keyName)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.sendDate, sendDate) || other.sendDate == sendDate));
}


@override
int get hashCode => Object.hashAll([runtimeType,keyId,lockData,lockId,userType,keyStatus,lockName,lockAlias,lockMac,noKeyPwd,electricQuantity,startDate,endDate,remarks,keyRight,featureValue,remoteEnable,passageMode,timezoneRawOffset,groupId,groupName,username,keyName,senderUsername,uid,sendDate]);

@override
String toString() {
  return 'KeyEntity(keyId: $keyId, lockData: $lockData, lockId: $lockId, userType: $userType, keyStatus: $keyStatus, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, noKeyPwd: $noKeyPwd, electricQuantity: $electricQuantity, startDate: $startDate, endDate: $endDate, remarks: $remarks, keyRight: $keyRight, featureValue: $featureValue, remoteEnable: $remoteEnable, passageMode: $passageMode, timezoneRawOffset: $timezoneRawOffset, groupId: $groupId, groupName: $groupName, username: $username, keyName: $keyName, senderUsername: $senderUsername, uid: $uid, sendDate: $sendDate)';
}


}

/// @nodoc
abstract mixin class $KeyEntityCopyWith<$Res>  {
  factory $KeyEntityCopyWith(KeyEntity value, $Res Function(KeyEntity) _then) = _$KeyEntityCopyWithImpl;
@useResult
$Res call({
 int keyId, String lockData, int lockId, KeyUserType userType, KeyStatus keyStatus, String lockName, String lockAlias, String lockMac, String noKeyPwd, int electricQuantity, DateTime? startDate, DateTime? endDate, String remarks, bool keyRight, String featureValue, bool remoteEnable, bool passageMode, int timezoneRawOffset, int groupId, String groupName, String username, String keyName, String senderUsername, int uid, DateTime? sendDate
});




}
/// @nodoc
class _$KeyEntityCopyWithImpl<$Res>
    implements $KeyEntityCopyWith<$Res> {
  _$KeyEntityCopyWithImpl(this._self, this._then);

  final KeyEntity _self;
  final $Res Function(KeyEntity) _then;

/// Create a copy of KeyEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyId = null,Object? lockData = null,Object? lockId = null,Object? userType = null,Object? keyStatus = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? noKeyPwd = null,Object? electricQuantity = null,Object? startDate = freezed,Object? endDate = freezed,Object? remarks = null,Object? keyRight = null,Object? featureValue = null,Object? remoteEnable = null,Object? passageMode = null,Object? timezoneRawOffset = null,Object? groupId = null,Object? groupName = null,Object? username = null,Object? keyName = null,Object? senderUsername = null,Object? uid = null,Object? sendDate = freezed,}) {
  return _then(_self.copyWith(
keyId: null == keyId ? _self.keyId : keyId // ignore: cast_nullable_to_non_nullable
as int,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as KeyUserType,keyStatus: null == keyStatus ? _self.keyStatus : keyStatus // ignore: cast_nullable_to_non_nullable
as KeyStatus,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,noKeyPwd: null == noKeyPwd ? _self.noKeyPwd : noKeyPwd // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,remarks: null == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String,keyRight: null == keyRight ? _self.keyRight : keyRight // ignore: cast_nullable_to_non_nullable
as bool,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,remoteEnable: null == remoteEnable ? _self.remoteEnable : remoteEnable // ignore: cast_nullable_to_non_nullable
as bool,passageMode: null == passageMode ? _self.passageMode : passageMode // ignore: cast_nullable_to_non_nullable
as bool,timezoneRawOffset: null == timezoneRawOffset ? _self.timezoneRawOffset : timezoneRawOffset // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,keyName: null == keyName ? _self.keyName : keyName // ignore: cast_nullable_to_non_nullable
as String,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,sendDate: freezed == sendDate ? _self.sendDate : sendDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [KeyEntity].
extension KeyEntityPatterns on KeyEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeyEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeyEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeyEntity value)  $default,){
final _that = this;
switch (_that) {
case _KeyEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeyEntity value)?  $default,){
final _that = this;
switch (_that) {
case _KeyEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int keyId,  String lockData,  int lockId,  KeyUserType userType,  KeyStatus keyStatus,  String lockName,  String lockAlias,  String lockMac,  String noKeyPwd,  int electricQuantity,  DateTime? startDate,  DateTime? endDate,  String remarks,  bool keyRight,  String featureValue,  bool remoteEnable,  bool passageMode,  int timezoneRawOffset,  int groupId,  String groupName,  String username,  String keyName,  String senderUsername,  int uid,  DateTime? sendDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeyEntity() when $default != null:
return $default(_that.keyId,_that.lockData,_that.lockId,_that.userType,_that.keyStatus,_that.lockName,_that.lockAlias,_that.lockMac,_that.noKeyPwd,_that.electricQuantity,_that.startDate,_that.endDate,_that.remarks,_that.keyRight,_that.featureValue,_that.remoteEnable,_that.passageMode,_that.timezoneRawOffset,_that.groupId,_that.groupName,_that.username,_that.keyName,_that.senderUsername,_that.uid,_that.sendDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int keyId,  String lockData,  int lockId,  KeyUserType userType,  KeyStatus keyStatus,  String lockName,  String lockAlias,  String lockMac,  String noKeyPwd,  int electricQuantity,  DateTime? startDate,  DateTime? endDate,  String remarks,  bool keyRight,  String featureValue,  bool remoteEnable,  bool passageMode,  int timezoneRawOffset,  int groupId,  String groupName,  String username,  String keyName,  String senderUsername,  int uid,  DateTime? sendDate)  $default,) {final _that = this;
switch (_that) {
case _KeyEntity():
return $default(_that.keyId,_that.lockData,_that.lockId,_that.userType,_that.keyStatus,_that.lockName,_that.lockAlias,_that.lockMac,_that.noKeyPwd,_that.electricQuantity,_that.startDate,_that.endDate,_that.remarks,_that.keyRight,_that.featureValue,_that.remoteEnable,_that.passageMode,_that.timezoneRawOffset,_that.groupId,_that.groupName,_that.username,_that.keyName,_that.senderUsername,_that.uid,_that.sendDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int keyId,  String lockData,  int lockId,  KeyUserType userType,  KeyStatus keyStatus,  String lockName,  String lockAlias,  String lockMac,  String noKeyPwd,  int electricQuantity,  DateTime? startDate,  DateTime? endDate,  String remarks,  bool keyRight,  String featureValue,  bool remoteEnable,  bool passageMode,  int timezoneRawOffset,  int groupId,  String groupName,  String username,  String keyName,  String senderUsername,  int uid,  DateTime? sendDate)?  $default,) {final _that = this;
switch (_that) {
case _KeyEntity() when $default != null:
return $default(_that.keyId,_that.lockData,_that.lockId,_that.userType,_that.keyStatus,_that.lockName,_that.lockAlias,_that.lockMac,_that.noKeyPwd,_that.electricQuantity,_that.startDate,_that.endDate,_that.remarks,_that.keyRight,_that.featureValue,_that.remoteEnable,_that.passageMode,_that.timezoneRawOffset,_that.groupId,_that.groupName,_that.username,_that.keyName,_that.senderUsername,_that.uid,_that.sendDate);case _:
  return null;

}
}

}

/// @nodoc


class _KeyEntity extends KeyEntity {
  const _KeyEntity({this.keyId = 0, this.lockData = '', this.lockId = 0, this.userType = KeyUserType.normal, this.keyStatus = KeyStatus.normal, this.lockName = '', this.lockAlias = '', this.lockMac = '', this.noKeyPwd = '', this.electricQuantity = 0, this.startDate, this.endDate, this.remarks = '', this.keyRight = false, this.featureValue = '', this.remoteEnable = false, this.passageMode = false, this.timezoneRawOffset = 0, this.groupId = 0, this.groupName = '', this.username = '', this.keyName = '', this.senderUsername = '', this.uid = 0, this.sendDate}): super._();
  

@override@JsonKey() final  int keyId;
@override@JsonKey() final  String lockData;
@override@JsonKey() final  int lockId;
@override@JsonKey() final  KeyUserType userType;
@override@JsonKey() final  KeyStatus keyStatus;
@override@JsonKey() final  String lockName;
@override@JsonKey() final  String lockAlias;
@override@JsonKey() final  String lockMac;
@override@JsonKey() final  String noKeyPwd;
@override@JsonKey() final  int electricQuantity;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  String remarks;
@override@JsonKey() final  bool keyRight;
@override@JsonKey() final  String featureValue;
@override@JsonKey() final  bool remoteEnable;
@override@JsonKey() final  bool passageMode;
@override@JsonKey() final  int timezoneRawOffset;
@override@JsonKey() final  int groupId;
@override@JsonKey() final  String groupName;
@override@JsonKey() final  String username;
@override@JsonKey() final  String keyName;
@override@JsonKey() final  String senderUsername;
@override@JsonKey() final  int uid;
@override final  DateTime? sendDate;

/// Create a copy of KeyEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyEntityCopyWith<_KeyEntity> get copyWith => __$KeyEntityCopyWithImpl<_KeyEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyEntity&&(identical(other.keyId, keyId) || other.keyId == keyId)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.keyStatus, keyStatus) || other.keyStatus == keyStatus)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.noKeyPwd, noKeyPwd) || other.noKeyPwd == noKeyPwd)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.keyRight, keyRight) || other.keyRight == keyRight)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.remoteEnable, remoteEnable) || other.remoteEnable == remoteEnable)&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.timezoneRawOffset, timezoneRawOffset) || other.timezoneRawOffset == timezoneRawOffset)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.username, username) || other.username == username)&&(identical(other.keyName, keyName) || other.keyName == keyName)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.sendDate, sendDate) || other.sendDate == sendDate));
}


@override
int get hashCode => Object.hashAll([runtimeType,keyId,lockData,lockId,userType,keyStatus,lockName,lockAlias,lockMac,noKeyPwd,electricQuantity,startDate,endDate,remarks,keyRight,featureValue,remoteEnable,passageMode,timezoneRawOffset,groupId,groupName,username,keyName,senderUsername,uid,sendDate]);

@override
String toString() {
  return 'KeyEntity(keyId: $keyId, lockData: $lockData, lockId: $lockId, userType: $userType, keyStatus: $keyStatus, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, noKeyPwd: $noKeyPwd, electricQuantity: $electricQuantity, startDate: $startDate, endDate: $endDate, remarks: $remarks, keyRight: $keyRight, featureValue: $featureValue, remoteEnable: $remoteEnable, passageMode: $passageMode, timezoneRawOffset: $timezoneRawOffset, groupId: $groupId, groupName: $groupName, username: $username, keyName: $keyName, senderUsername: $senderUsername, uid: $uid, sendDate: $sendDate)';
}


}

/// @nodoc
abstract mixin class _$KeyEntityCopyWith<$Res> implements $KeyEntityCopyWith<$Res> {
  factory _$KeyEntityCopyWith(_KeyEntity value, $Res Function(_KeyEntity) _then) = __$KeyEntityCopyWithImpl;
@override @useResult
$Res call({
 int keyId, String lockData, int lockId, KeyUserType userType, KeyStatus keyStatus, String lockName, String lockAlias, String lockMac, String noKeyPwd, int electricQuantity, DateTime? startDate, DateTime? endDate, String remarks, bool keyRight, String featureValue, bool remoteEnable, bool passageMode, int timezoneRawOffset, int groupId, String groupName, String username, String keyName, String senderUsername, int uid, DateTime? sendDate
});




}
/// @nodoc
class __$KeyEntityCopyWithImpl<$Res>
    implements _$KeyEntityCopyWith<$Res> {
  __$KeyEntityCopyWithImpl(this._self, this._then);

  final _KeyEntity _self;
  final $Res Function(_KeyEntity) _then;

/// Create a copy of KeyEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyId = null,Object? lockData = null,Object? lockId = null,Object? userType = null,Object? keyStatus = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? noKeyPwd = null,Object? electricQuantity = null,Object? startDate = freezed,Object? endDate = freezed,Object? remarks = null,Object? keyRight = null,Object? featureValue = null,Object? remoteEnable = null,Object? passageMode = null,Object? timezoneRawOffset = null,Object? groupId = null,Object? groupName = null,Object? username = null,Object? keyName = null,Object? senderUsername = null,Object? uid = null,Object? sendDate = freezed,}) {
  return _then(_KeyEntity(
keyId: null == keyId ? _self.keyId : keyId // ignore: cast_nullable_to_non_nullable
as int,lockData: null == lockData ? _self.lockData : lockData // ignore: cast_nullable_to_non_nullable
as String,lockId: null == lockId ? _self.lockId : lockId // ignore: cast_nullable_to_non_nullable
as int,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as KeyUserType,keyStatus: null == keyStatus ? _self.keyStatus : keyStatus // ignore: cast_nullable_to_non_nullable
as KeyStatus,lockName: null == lockName ? _self.lockName : lockName // ignore: cast_nullable_to_non_nullable
as String,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,lockMac: null == lockMac ? _self.lockMac : lockMac // ignore: cast_nullable_to_non_nullable
as String,noKeyPwd: null == noKeyPwd ? _self.noKeyPwd : noKeyPwd // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,remarks: null == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String,keyRight: null == keyRight ? _self.keyRight : keyRight // ignore: cast_nullable_to_non_nullable
as bool,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,remoteEnable: null == remoteEnable ? _self.remoteEnable : remoteEnable // ignore: cast_nullable_to_non_nullable
as bool,passageMode: null == passageMode ? _self.passageMode : passageMode // ignore: cast_nullable_to_non_nullable
as bool,timezoneRawOffset: null == timezoneRawOffset ? _self.timezoneRawOffset : timezoneRawOffset // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,keyName: null == keyName ? _self.keyName : keyName // ignore: cast_nullable_to_non_nullable
as String,senderUsername: null == senderUsername ? _self.senderUsername : senderUsername // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,sendDate: freezed == sendDate ? _self.sendDate : sendDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
