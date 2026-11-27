// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KeyDto {

@JsonKey(name: 'keyId', fromJson: intFromDynamic) int get keyId;@JsonKey(name: 'lockData') String get lockData;@JsonKey(name: 'lockId', fromJson: intFromDynamic) int get lockId;@JsonKey(name: 'userType', fromJson: _userTypeFromJson) KeyUserType get userType;@JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson) KeyStatus get keyStatus;@JsonKey(name: 'lockName') String get lockName;@JsonKey(name: 'lockAlias') String get lockAlias;@JsonKey(name: 'lockMac') String get lockMac;@JsonKey(name: 'noKeyPwd') String get noKeyPwd;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get startDate;@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get endDate;@JsonKey(name: 'remarks') String get remarks;@JsonKey(name: 'keyRight', fromJson: _keyRightFromJson) bool get keyRight;@JsonKey(name: 'featureValue') String get featureValue;@JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson) bool get remoteEnable;@JsonKey(name: 'passageMode', fromJson: _passageModeFromJson) bool get passageMode;@JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic) int get timezoneRawOffset;@JsonKey(name: 'groupId', fromJson: intFromDynamic) int get groupId;@JsonKey(name: 'groupName') String get groupName;@JsonKey(name: 'username') String get username;@JsonKey(name: 'keyName') String get keyName;@JsonKey(name: 'senderUsername') String get senderUsername;@JsonKey(name: 'uid', fromJson: intFromDynamic) int get uid;@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get sendDate;
/// Create a copy of KeyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeyDtoCopyWith<KeyDto> get copyWith => _$KeyDtoCopyWithImpl<KeyDto>(this as KeyDto, _$identity);

  /// Serializes this KeyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeyDto&&(identical(other.keyId, keyId) || other.keyId == keyId)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.keyStatus, keyStatus) || other.keyStatus == keyStatus)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.noKeyPwd, noKeyPwd) || other.noKeyPwd == noKeyPwd)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.keyRight, keyRight) || other.keyRight == keyRight)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.remoteEnable, remoteEnable) || other.remoteEnable == remoteEnable)&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.timezoneRawOffset, timezoneRawOffset) || other.timezoneRawOffset == timezoneRawOffset)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.username, username) || other.username == username)&&(identical(other.keyName, keyName) || other.keyName == keyName)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.sendDate, sendDate) || other.sendDate == sendDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,keyId,lockData,lockId,userType,keyStatus,lockName,lockAlias,lockMac,noKeyPwd,electricQuantity,startDate,endDate,remarks,keyRight,featureValue,remoteEnable,passageMode,timezoneRawOffset,groupId,groupName,username,keyName,senderUsername,uid,sendDate]);

@override
String toString() {
  return 'KeyDto(keyId: $keyId, lockData: $lockData, lockId: $lockId, userType: $userType, keyStatus: $keyStatus, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, noKeyPwd: $noKeyPwd, electricQuantity: $electricQuantity, startDate: $startDate, endDate: $endDate, remarks: $remarks, keyRight: $keyRight, featureValue: $featureValue, remoteEnable: $remoteEnable, passageMode: $passageMode, timezoneRawOffset: $timezoneRawOffset, groupId: $groupId, groupName: $groupName, username: $username, keyName: $keyName, senderUsername: $senderUsername, uid: $uid, sendDate: $sendDate)';
}


}

/// @nodoc
abstract mixin class $KeyDtoCopyWith<$Res>  {
  factory $KeyDtoCopyWith(KeyDto value, $Res Function(KeyDto) _then) = _$KeyDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'keyId', fromJson: intFromDynamic) int keyId,@JsonKey(name: 'lockData') String lockData,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'userType', fromJson: _userTypeFromJson) KeyUserType userType,@JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson) KeyStatus keyStatus,@JsonKey(name: 'lockName') String lockName,@JsonKey(name: 'lockAlias') String lockAlias,@JsonKey(name: 'lockMac') String lockMac,@JsonKey(name: 'noKeyPwd') String noKeyPwd,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? endDate,@JsonKey(name: 'remarks') String remarks,@JsonKey(name: 'keyRight', fromJson: _keyRightFromJson) bool keyRight,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson) bool remoteEnable,@JsonKey(name: 'passageMode', fromJson: _passageModeFromJson) bool passageMode,@JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic) int timezoneRawOffset,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'username') String username,@JsonKey(name: 'keyName') String keyName,@JsonKey(name: 'senderUsername') String senderUsername,@JsonKey(name: 'uid', fromJson: intFromDynamic) int uid,@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? sendDate
});




}
/// @nodoc
class _$KeyDtoCopyWithImpl<$Res>
    implements $KeyDtoCopyWith<$Res> {
  _$KeyDtoCopyWithImpl(this._self, this._then);

  final KeyDto _self;
  final $Res Function(KeyDto) _then;

/// Create a copy of KeyDto
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


/// Adds pattern-matching-related methods to [KeyDto].
extension KeyDtoPatterns on KeyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeyDto value)  $default,){
final _that = this;
switch (_that) {
case _KeyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeyDto value)?  $default,){
final _that = this;
switch (_that) {
case _KeyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'keyId', fromJson: intFromDynamic)  int keyId, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'userType', fromJson: _userTypeFromJson)  KeyUserType userType, @JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson)  KeyStatus keyStatus, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'noKeyPwd')  String noKeyPwd, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'remarks')  String remarks, @JsonKey(name: 'keyRight', fromJson: _keyRightFromJson)  bool keyRight, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson)  bool remoteEnable, @JsonKey(name: 'passageMode', fromJson: _passageModeFromJson)  bool passageMode, @JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic)  int timezoneRawOffset, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'username')  String username, @JsonKey(name: 'keyName')  String keyName, @JsonKey(name: 'senderUsername')  String senderUsername, @JsonKey(name: 'uid', fromJson: intFromDynamic)  int uid, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? sendDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeyDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'keyId', fromJson: intFromDynamic)  int keyId, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'userType', fromJson: _userTypeFromJson)  KeyUserType userType, @JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson)  KeyStatus keyStatus, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'noKeyPwd')  String noKeyPwd, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'remarks')  String remarks, @JsonKey(name: 'keyRight', fromJson: _keyRightFromJson)  bool keyRight, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson)  bool remoteEnable, @JsonKey(name: 'passageMode', fromJson: _passageModeFromJson)  bool passageMode, @JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic)  int timezoneRawOffset, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'username')  String username, @JsonKey(name: 'keyName')  String keyName, @JsonKey(name: 'senderUsername')  String senderUsername, @JsonKey(name: 'uid', fromJson: intFromDynamic)  int uid, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? sendDate)  $default,) {final _that = this;
switch (_that) {
case _KeyDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'keyId', fromJson: intFromDynamic)  int keyId, @JsonKey(name: 'lockData')  String lockData, @JsonKey(name: 'lockId', fromJson: intFromDynamic)  int lockId, @JsonKey(name: 'userType', fromJson: _userTypeFromJson)  KeyUserType userType, @JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson)  KeyStatus keyStatus, @JsonKey(name: 'lockName')  String lockName, @JsonKey(name: 'lockAlias')  String lockAlias, @JsonKey(name: 'lockMac')  String lockMac, @JsonKey(name: 'noKeyPwd')  String noKeyPwd, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? endDate, @JsonKey(name: 'remarks')  String remarks, @JsonKey(name: 'keyRight', fromJson: _keyRightFromJson)  bool keyRight, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson)  bool remoteEnable, @JsonKey(name: 'passageMode', fromJson: _passageModeFromJson)  bool passageMode, @JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic)  int timezoneRawOffset, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'username')  String username, @JsonKey(name: 'keyName')  String keyName, @JsonKey(name: 'senderUsername')  String senderUsername, @JsonKey(name: 'uid', fromJson: intFromDynamic)  int uid, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? sendDate)?  $default,) {final _that = this;
switch (_that) {
case _KeyDto() when $default != null:
return $default(_that.keyId,_that.lockData,_that.lockId,_that.userType,_that.keyStatus,_that.lockName,_that.lockAlias,_that.lockMac,_that.noKeyPwd,_that.electricQuantity,_that.startDate,_that.endDate,_that.remarks,_that.keyRight,_that.featureValue,_that.remoteEnable,_that.passageMode,_that.timezoneRawOffset,_that.groupId,_that.groupName,_that.username,_that.keyName,_that.senderUsername,_that.uid,_that.sendDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KeyDto extends KeyDto {
  const _KeyDto({@JsonKey(name: 'keyId', fromJson: intFromDynamic) this.keyId = 0, @JsonKey(name: 'lockData') this.lockData = '', @JsonKey(name: 'lockId', fromJson: intFromDynamic) this.lockId = 0, @JsonKey(name: 'userType', fromJson: _userTypeFromJson) this.userType = KeyUserType.normal, @JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson) this.keyStatus = KeyStatus.normal, @JsonKey(name: 'lockName') this.lockName = '', @JsonKey(name: 'lockAlias') this.lockAlias = '', @JsonKey(name: 'lockMac') this.lockMac = '', @JsonKey(name: 'noKeyPwd') this.noKeyPwd = '', @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.startDate, @JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.endDate, @JsonKey(name: 'remarks') this.remarks = '', @JsonKey(name: 'keyRight', fromJson: _keyRightFromJson) this.keyRight = false, @JsonKey(name: 'featureValue') this.featureValue = '', @JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson) this.remoteEnable = false, @JsonKey(name: 'passageMode', fromJson: _passageModeFromJson) this.passageMode = false, @JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic) this.timezoneRawOffset = 0, @JsonKey(name: 'groupId', fromJson: intFromDynamic) this.groupId = 0, @JsonKey(name: 'groupName') this.groupName = '', @JsonKey(name: 'username') this.username = '', @JsonKey(name: 'keyName') this.keyName = '', @JsonKey(name: 'senderUsername') this.senderUsername = '', @JsonKey(name: 'uid', fromJson: intFromDynamic) this.uid = 0, @JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.sendDate}): super._();
  factory _KeyDto.fromJson(Map<String, dynamic> json) => _$KeyDtoFromJson(json);

@override@JsonKey(name: 'keyId', fromJson: intFromDynamic) final  int keyId;
@override@JsonKey(name: 'lockData') final  String lockData;
@override@JsonKey(name: 'lockId', fromJson: intFromDynamic) final  int lockId;
@override@JsonKey(name: 'userType', fromJson: _userTypeFromJson) final  KeyUserType userType;
@override@JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson) final  KeyStatus keyStatus;
@override@JsonKey(name: 'lockName') final  String lockName;
@override@JsonKey(name: 'lockAlias') final  String lockAlias;
@override@JsonKey(name: 'lockMac') final  String lockMac;
@override@JsonKey(name: 'noKeyPwd') final  String noKeyPwd;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
@override@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? startDate;
@override@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? endDate;
@override@JsonKey(name: 'remarks') final  String remarks;
@override@JsonKey(name: 'keyRight', fromJson: _keyRightFromJson) final  bool keyRight;
@override@JsonKey(name: 'featureValue') final  String featureValue;
@override@JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson) final  bool remoteEnable;
@override@JsonKey(name: 'passageMode', fromJson: _passageModeFromJson) final  bool passageMode;
@override@JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic) final  int timezoneRawOffset;
@override@JsonKey(name: 'groupId', fromJson: intFromDynamic) final  int groupId;
@override@JsonKey(name: 'groupName') final  String groupName;
@override@JsonKey(name: 'username') final  String username;
@override@JsonKey(name: 'keyName') final  String keyName;
@override@JsonKey(name: 'senderUsername') final  String senderUsername;
@override@JsonKey(name: 'uid', fromJson: intFromDynamic) final  int uid;
@override@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? sendDate;

/// Create a copy of KeyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyDtoCopyWith<_KeyDto> get copyWith => __$KeyDtoCopyWithImpl<_KeyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KeyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyDto&&(identical(other.keyId, keyId) || other.keyId == keyId)&&(identical(other.lockData, lockData) || other.lockData == lockData)&&(identical(other.lockId, lockId) || other.lockId == lockId)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.keyStatus, keyStatus) || other.keyStatus == keyStatus)&&(identical(other.lockName, lockName) || other.lockName == lockName)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias)&&(identical(other.lockMac, lockMac) || other.lockMac == lockMac)&&(identical(other.noKeyPwd, noKeyPwd) || other.noKeyPwd == noKeyPwd)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.keyRight, keyRight) || other.keyRight == keyRight)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.remoteEnable, remoteEnable) || other.remoteEnable == remoteEnable)&&(identical(other.passageMode, passageMode) || other.passageMode == passageMode)&&(identical(other.timezoneRawOffset, timezoneRawOffset) || other.timezoneRawOffset == timezoneRawOffset)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.username, username) || other.username == username)&&(identical(other.keyName, keyName) || other.keyName == keyName)&&(identical(other.senderUsername, senderUsername) || other.senderUsername == senderUsername)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.sendDate, sendDate) || other.sendDate == sendDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,keyId,lockData,lockId,userType,keyStatus,lockName,lockAlias,lockMac,noKeyPwd,electricQuantity,startDate,endDate,remarks,keyRight,featureValue,remoteEnable,passageMode,timezoneRawOffset,groupId,groupName,username,keyName,senderUsername,uid,sendDate]);

@override
String toString() {
  return 'KeyDto(keyId: $keyId, lockData: $lockData, lockId: $lockId, userType: $userType, keyStatus: $keyStatus, lockName: $lockName, lockAlias: $lockAlias, lockMac: $lockMac, noKeyPwd: $noKeyPwd, electricQuantity: $electricQuantity, startDate: $startDate, endDate: $endDate, remarks: $remarks, keyRight: $keyRight, featureValue: $featureValue, remoteEnable: $remoteEnable, passageMode: $passageMode, timezoneRawOffset: $timezoneRawOffset, groupId: $groupId, groupName: $groupName, username: $username, keyName: $keyName, senderUsername: $senderUsername, uid: $uid, sendDate: $sendDate)';
}


}

/// @nodoc
abstract mixin class _$KeyDtoCopyWith<$Res> implements $KeyDtoCopyWith<$Res> {
  factory _$KeyDtoCopyWith(_KeyDto value, $Res Function(_KeyDto) _then) = __$KeyDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'keyId', fromJson: intFromDynamic) int keyId,@JsonKey(name: 'lockData') String lockData,@JsonKey(name: 'lockId', fromJson: intFromDynamic) int lockId,@JsonKey(name: 'userType', fromJson: _userTypeFromJson) KeyUserType userType,@JsonKey(name: 'keyStatus', fromJson: _keyStatusFromJson) KeyStatus keyStatus,@JsonKey(name: 'lockName') String lockName,@JsonKey(name: 'lockAlias') String lockAlias,@JsonKey(name: 'lockMac') String lockMac,@JsonKey(name: 'noKeyPwd') String noKeyPwd,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'startDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? startDate,@JsonKey(name: 'endDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? endDate,@JsonKey(name: 'remarks') String remarks,@JsonKey(name: 'keyRight', fromJson: _keyRightFromJson) bool keyRight,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'remoteEnable', fromJson: _remoteEnableFromJson) bool remoteEnable,@JsonKey(name: 'passageMode', fromJson: _passageModeFromJson) bool passageMode,@JsonKey(name: 'timezoneRawOffset', fromJson: intFromDynamic) int timezoneRawOffset,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'username') String username,@JsonKey(name: 'keyName') String keyName,@JsonKey(name: 'senderUsername') String senderUsername,@JsonKey(name: 'uid', fromJson: intFromDynamic) int uid,@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? sendDate
});




}
/// @nodoc
class __$KeyDtoCopyWithImpl<$Res>
    implements _$KeyDtoCopyWith<$Res> {
  __$KeyDtoCopyWithImpl(this._self, this._then);

  final _KeyDto _self;
  final $Res Function(_KeyDto) _then;

/// Create a copy of KeyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyId = null,Object? lockData = null,Object? lockId = null,Object? userType = null,Object? keyStatus = null,Object? lockName = null,Object? lockAlias = null,Object? lockMac = null,Object? noKeyPwd = null,Object? electricQuantity = null,Object? startDate = freezed,Object? endDate = freezed,Object? remarks = null,Object? keyRight = null,Object? featureValue = null,Object? remoteEnable = null,Object? passageMode = null,Object? timezoneRawOffset = null,Object? groupId = null,Object? groupName = null,Object? username = null,Object? keyName = null,Object? senderUsername = null,Object? uid = null,Object? sendDate = freezed,}) {
  return _then(_KeyDto(
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
