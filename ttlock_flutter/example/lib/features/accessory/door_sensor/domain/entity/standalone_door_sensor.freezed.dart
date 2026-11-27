// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standalone_door_sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StandaloneDoorSensorEntity {

 String get mac; String get featureValue; int get statusDelayFlag; int get electricQuantity; DoorSensorState get doorSensorState; String get wifiName; String get doorSensorNumber; int get doorSensorId; String get name; DateTime? get recordUpdateDate; String get wifiMac; StandaloneUserType get userType; String get firmwareRevision;
/// Create a copy of StandaloneDoorSensorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorEntityCopyWith<StandaloneDoorSensorEntity> get copyWith => _$StandaloneDoorSensorEntityCopyWithImpl<StandaloneDoorSensorEntity>(this as StandaloneDoorSensorEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorEntity&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.statusDelayFlag, statusDelayFlag) || other.statusDelayFlag == statusDelayFlag)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.doorSensorState, doorSensorState) || other.doorSensorState == doorSensorState)&&(identical(other.wifiName, wifiName) || other.wifiName == wifiName)&&(identical(other.doorSensorNumber, doorSensorNumber) || other.doorSensorNumber == doorSensorNumber)&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.recordUpdateDate, recordUpdateDate) || other.recordUpdateDate == recordUpdateDate)&&(identical(other.wifiMac, wifiMac) || other.wifiMac == wifiMac)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}


@override
int get hashCode => Object.hash(runtimeType,mac,featureValue,statusDelayFlag,electricQuantity,doorSensorState,wifiName,doorSensorNumber,doorSensorId,name,recordUpdateDate,wifiMac,userType,firmwareRevision);

@override
String toString() {
  return 'StandaloneDoorSensorEntity(mac: $mac, featureValue: $featureValue, statusDelayFlag: $statusDelayFlag, electricQuantity: $electricQuantity, doorSensorState: $doorSensorState, wifiName: $wifiName, doorSensorNumber: $doorSensorNumber, doorSensorId: $doorSensorId, name: $name, recordUpdateDate: $recordUpdateDate, wifiMac: $wifiMac, userType: $userType, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorEntityCopyWith<$Res>  {
  factory $StandaloneDoorSensorEntityCopyWith(StandaloneDoorSensorEntity value, $Res Function(StandaloneDoorSensorEntity) _then) = _$StandaloneDoorSensorEntityCopyWithImpl;
@useResult
$Res call({
 String mac, String featureValue, int statusDelayFlag, int electricQuantity, DoorSensorState doorSensorState, String wifiName, String doorSensorNumber, int doorSensorId, String name, DateTime? recordUpdateDate, String wifiMac, StandaloneUserType userType, String firmwareRevision
});




}
/// @nodoc
class _$StandaloneDoorSensorEntityCopyWithImpl<$Res>
    implements $StandaloneDoorSensorEntityCopyWith<$Res> {
  _$StandaloneDoorSensorEntityCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorEntity _self;
  final $Res Function(StandaloneDoorSensorEntity) _then;

/// Create a copy of StandaloneDoorSensorEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mac = null,Object? featureValue = null,Object? statusDelayFlag = null,Object? electricQuantity = null,Object? doorSensorState = null,Object? wifiName = null,Object? doorSensorNumber = null,Object? doorSensorId = null,Object? name = null,Object? recordUpdateDate = freezed,Object? wifiMac = null,Object? userType = null,Object? firmwareRevision = null,}) {
  return _then(_self.copyWith(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,statusDelayFlag: null == statusDelayFlag ? _self.statusDelayFlag : statusDelayFlag // ignore: cast_nullable_to_non_nullable
as int,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,doorSensorState: null == doorSensorState ? _self.doorSensorState : doorSensorState // ignore: cast_nullable_to_non_nullable
as DoorSensorState,wifiName: null == wifiName ? _self.wifiName : wifiName // ignore: cast_nullable_to_non_nullable
as String,doorSensorNumber: null == doorSensorNumber ? _self.doorSensorNumber : doorSensorNumber // ignore: cast_nullable_to_non_nullable
as String,doorSensorId: null == doorSensorId ? _self.doorSensorId : doorSensorId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,recordUpdateDate: freezed == recordUpdateDate ? _self.recordUpdateDate : recordUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,wifiMac: null == wifiMac ? _self.wifiMac : wifiMac // ignore: cast_nullable_to_non_nullable
as String,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as StandaloneUserType,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorEntity].
extension StandaloneDoorSensorEntityPatterns on StandaloneDoorSensorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorEntity value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String mac,  String featureValue,  int statusDelayFlag,  int electricQuantity,  DoorSensorState doorSensorState,  String wifiName,  String doorSensorNumber,  int doorSensorId,  String name,  DateTime? recordUpdateDate,  String wifiMac,  StandaloneUserType userType,  String firmwareRevision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorEntity() when $default != null:
return $default(_that.mac,_that.featureValue,_that.statusDelayFlag,_that.electricQuantity,_that.doorSensorState,_that.wifiName,_that.doorSensorNumber,_that.doorSensorId,_that.name,_that.recordUpdateDate,_that.wifiMac,_that.userType,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String mac,  String featureValue,  int statusDelayFlag,  int electricQuantity,  DoorSensorState doorSensorState,  String wifiName,  String doorSensorNumber,  int doorSensorId,  String name,  DateTime? recordUpdateDate,  String wifiMac,  StandaloneUserType userType,  String firmwareRevision)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorEntity():
return $default(_that.mac,_that.featureValue,_that.statusDelayFlag,_that.electricQuantity,_that.doorSensorState,_that.wifiName,_that.doorSensorNumber,_that.doorSensorId,_that.name,_that.recordUpdateDate,_that.wifiMac,_that.userType,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String mac,  String featureValue,  int statusDelayFlag,  int electricQuantity,  DoorSensorState doorSensorState,  String wifiName,  String doorSensorNumber,  int doorSensorId,  String name,  DateTime? recordUpdateDate,  String wifiMac,  StandaloneUserType userType,  String firmwareRevision)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorEntity() when $default != null:
return $default(_that.mac,_that.featureValue,_that.statusDelayFlag,_that.electricQuantity,_that.doorSensorState,_that.wifiName,_that.doorSensorNumber,_that.doorSensorId,_that.name,_that.recordUpdateDate,_that.wifiMac,_that.userType,_that.firmwareRevision);case _:
  return null;

}
}

}

/// @nodoc


class _StandaloneDoorSensorEntity extends StandaloneDoorSensorEntity {
  const _StandaloneDoorSensorEntity({this.mac = '', this.featureValue = '', this.statusDelayFlag = 0, this.electricQuantity = 0, this.doorSensorState = DoorSensorState.unknown, this.wifiName = '', this.doorSensorNumber = '', this.doorSensorId = 0, this.name = '', this.recordUpdateDate, this.wifiMac = '', this.userType = StandaloneUserType.admin, this.firmwareRevision = ''}): super._();
  

@override@JsonKey() final  String mac;
@override@JsonKey() final  String featureValue;
@override@JsonKey() final  int statusDelayFlag;
@override@JsonKey() final  int electricQuantity;
@override@JsonKey() final  DoorSensorState doorSensorState;
@override@JsonKey() final  String wifiName;
@override@JsonKey() final  String doorSensorNumber;
@override@JsonKey() final  int doorSensorId;
@override@JsonKey() final  String name;
@override final  DateTime? recordUpdateDate;
@override@JsonKey() final  String wifiMac;
@override@JsonKey() final  StandaloneUserType userType;
@override@JsonKey() final  String firmwareRevision;

/// Create a copy of StandaloneDoorSensorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorEntityCopyWith<_StandaloneDoorSensorEntity> get copyWith => __$StandaloneDoorSensorEntityCopyWithImpl<_StandaloneDoorSensorEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorEntity&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.statusDelayFlag, statusDelayFlag) || other.statusDelayFlag == statusDelayFlag)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.doorSensorState, doorSensorState) || other.doorSensorState == doorSensorState)&&(identical(other.wifiName, wifiName) || other.wifiName == wifiName)&&(identical(other.doorSensorNumber, doorSensorNumber) || other.doorSensorNumber == doorSensorNumber)&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.recordUpdateDate, recordUpdateDate) || other.recordUpdateDate == recordUpdateDate)&&(identical(other.wifiMac, wifiMac) || other.wifiMac == wifiMac)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}


@override
int get hashCode => Object.hash(runtimeType,mac,featureValue,statusDelayFlag,electricQuantity,doorSensorState,wifiName,doorSensorNumber,doorSensorId,name,recordUpdateDate,wifiMac,userType,firmwareRevision);

@override
String toString() {
  return 'StandaloneDoorSensorEntity(mac: $mac, featureValue: $featureValue, statusDelayFlag: $statusDelayFlag, electricQuantity: $electricQuantity, doorSensorState: $doorSensorState, wifiName: $wifiName, doorSensorNumber: $doorSensorNumber, doorSensorId: $doorSensorId, name: $name, recordUpdateDate: $recordUpdateDate, wifiMac: $wifiMac, userType: $userType, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorEntityCopyWith<$Res> implements $StandaloneDoorSensorEntityCopyWith<$Res> {
  factory _$StandaloneDoorSensorEntityCopyWith(_StandaloneDoorSensorEntity value, $Res Function(_StandaloneDoorSensorEntity) _then) = __$StandaloneDoorSensorEntityCopyWithImpl;
@override @useResult
$Res call({
 String mac, String featureValue, int statusDelayFlag, int electricQuantity, DoorSensorState doorSensorState, String wifiName, String doorSensorNumber, int doorSensorId, String name, DateTime? recordUpdateDate, String wifiMac, StandaloneUserType userType, String firmwareRevision
});




}
/// @nodoc
class __$StandaloneDoorSensorEntityCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorEntityCopyWith<$Res> {
  __$StandaloneDoorSensorEntityCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorEntity _self;
  final $Res Function(_StandaloneDoorSensorEntity) _then;

/// Create a copy of StandaloneDoorSensorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mac = null,Object? featureValue = null,Object? statusDelayFlag = null,Object? electricQuantity = null,Object? doorSensorState = null,Object? wifiName = null,Object? doorSensorNumber = null,Object? doorSensorId = null,Object? name = null,Object? recordUpdateDate = freezed,Object? wifiMac = null,Object? userType = null,Object? firmwareRevision = null,}) {
  return _then(_StandaloneDoorSensorEntity(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,statusDelayFlag: null == statusDelayFlag ? _self.statusDelayFlag : statusDelayFlag // ignore: cast_nullable_to_non_nullable
as int,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,doorSensorState: null == doorSensorState ? _self.doorSensorState : doorSensorState // ignore: cast_nullable_to_non_nullable
as DoorSensorState,wifiName: null == wifiName ? _self.wifiName : wifiName // ignore: cast_nullable_to_non_nullable
as String,doorSensorNumber: null == doorSensorNumber ? _self.doorSensorNumber : doorSensorNumber // ignore: cast_nullable_to_non_nullable
as String,doorSensorId: null == doorSensorId ? _self.doorSensorId : doorSensorId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,recordUpdateDate: freezed == recordUpdateDate ? _self.recordUpdateDate : recordUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,wifiMac: null == wifiMac ? _self.wifiMac : wifiMac // ignore: cast_nullable_to_non_nullable
as String,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as StandaloneUserType,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$StandaloneDoorSensorRecordEntity {

 DateTime? get date; int get recordType;
/// Create a copy of StandaloneDoorSensorRecordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorRecordEntityCopyWith<StandaloneDoorSensorRecordEntity> get copyWith => _$StandaloneDoorSensorRecordEntityCopyWithImpl<StandaloneDoorSensorRecordEntity>(this as StandaloneDoorSensorRecordEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorRecordEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.recordType, recordType) || other.recordType == recordType));
}


@override
int get hashCode => Object.hash(runtimeType,date,recordType);

@override
String toString() {
  return 'StandaloneDoorSensorRecordEntity(date: $date, recordType: $recordType)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorRecordEntityCopyWith<$Res>  {
  factory $StandaloneDoorSensorRecordEntityCopyWith(StandaloneDoorSensorRecordEntity value, $Res Function(StandaloneDoorSensorRecordEntity) _then) = _$StandaloneDoorSensorRecordEntityCopyWithImpl;
@useResult
$Res call({
 DateTime? date, int recordType
});




}
/// @nodoc
class _$StandaloneDoorSensorRecordEntityCopyWithImpl<$Res>
    implements $StandaloneDoorSensorRecordEntityCopyWith<$Res> {
  _$StandaloneDoorSensorRecordEntityCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorRecordEntity _self;
  final $Res Function(StandaloneDoorSensorRecordEntity) _then;

/// Create a copy of StandaloneDoorSensorRecordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? recordType = null,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorRecordEntity].
extension StandaloneDoorSensorRecordEntityPatterns on StandaloneDoorSensorRecordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorRecordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorRecordEntity value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorRecordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? date,  int recordType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordEntity() when $default != null:
return $default(_that.date,_that.recordType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? date,  int recordType)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordEntity():
return $default(_that.date,_that.recordType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? date,  int recordType)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordEntity() when $default != null:
return $default(_that.date,_that.recordType);case _:
  return null;

}
}

}

/// @nodoc


class _StandaloneDoorSensorRecordEntity extends StandaloneDoorSensorRecordEntity {
  const _StandaloneDoorSensorRecordEntity({this.date, this.recordType = 0}): super._();
  

@override final  DateTime? date;
@override@JsonKey() final  int recordType;

/// Create a copy of StandaloneDoorSensorRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorRecordEntityCopyWith<_StandaloneDoorSensorRecordEntity> get copyWith => __$StandaloneDoorSensorRecordEntityCopyWithImpl<_StandaloneDoorSensorRecordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorRecordEntity&&(identical(other.date, date) || other.date == date)&&(identical(other.recordType, recordType) || other.recordType == recordType));
}


@override
int get hashCode => Object.hash(runtimeType,date,recordType);

@override
String toString() {
  return 'StandaloneDoorSensorRecordEntity(date: $date, recordType: $recordType)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorRecordEntityCopyWith<$Res> implements $StandaloneDoorSensorRecordEntityCopyWith<$Res> {
  factory _$StandaloneDoorSensorRecordEntityCopyWith(_StandaloneDoorSensorRecordEntity value, $Res Function(_StandaloneDoorSensorRecordEntity) _then) = __$StandaloneDoorSensorRecordEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime? date, int recordType
});




}
/// @nodoc
class __$StandaloneDoorSensorRecordEntityCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorRecordEntityCopyWith<$Res> {
  __$StandaloneDoorSensorRecordEntityCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorRecordEntity _self;
  final $Res Function(_StandaloneDoorSensorRecordEntity) _then;

/// Create a copy of StandaloneDoorSensorRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? recordType = null,}) {
  return _then(_StandaloneDoorSensorRecordEntity(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$StandaloneDoorSensorAlertFlagEntity {

 int get notCloseAlertFlag; int get notCloseAlertSecondNum; int get longTimeNotOpenAlertFlag; int get longTimeNotOpenDayNum;
/// Create a copy of StandaloneDoorSensorAlertFlagEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorAlertFlagEntityCopyWith<StandaloneDoorSensorAlertFlagEntity> get copyWith => _$StandaloneDoorSensorAlertFlagEntityCopyWithImpl<StandaloneDoorSensorAlertFlagEntity>(this as StandaloneDoorSensorAlertFlagEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorAlertFlagEntity&&(identical(other.notCloseAlertFlag, notCloseAlertFlag) || other.notCloseAlertFlag == notCloseAlertFlag)&&(identical(other.notCloseAlertSecondNum, notCloseAlertSecondNum) || other.notCloseAlertSecondNum == notCloseAlertSecondNum)&&(identical(other.longTimeNotOpenAlertFlag, longTimeNotOpenAlertFlag) || other.longTimeNotOpenAlertFlag == longTimeNotOpenAlertFlag)&&(identical(other.longTimeNotOpenDayNum, longTimeNotOpenDayNum) || other.longTimeNotOpenDayNum == longTimeNotOpenDayNum));
}


@override
int get hashCode => Object.hash(runtimeType,notCloseAlertFlag,notCloseAlertSecondNum,longTimeNotOpenAlertFlag,longTimeNotOpenDayNum);

@override
String toString() {
  return 'StandaloneDoorSensorAlertFlagEntity(notCloseAlertFlag: $notCloseAlertFlag, notCloseAlertSecondNum: $notCloseAlertSecondNum, longTimeNotOpenAlertFlag: $longTimeNotOpenAlertFlag, longTimeNotOpenDayNum: $longTimeNotOpenDayNum)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorAlertFlagEntityCopyWith<$Res>  {
  factory $StandaloneDoorSensorAlertFlagEntityCopyWith(StandaloneDoorSensorAlertFlagEntity value, $Res Function(StandaloneDoorSensorAlertFlagEntity) _then) = _$StandaloneDoorSensorAlertFlagEntityCopyWithImpl;
@useResult
$Res call({
 int notCloseAlertFlag, int notCloseAlertSecondNum, int longTimeNotOpenAlertFlag, int longTimeNotOpenDayNum
});




}
/// @nodoc
class _$StandaloneDoorSensorAlertFlagEntityCopyWithImpl<$Res>
    implements $StandaloneDoorSensorAlertFlagEntityCopyWith<$Res> {
  _$StandaloneDoorSensorAlertFlagEntityCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorAlertFlagEntity _self;
  final $Res Function(StandaloneDoorSensorAlertFlagEntity) _then;

/// Create a copy of StandaloneDoorSensorAlertFlagEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notCloseAlertFlag = null,Object? notCloseAlertSecondNum = null,Object? longTimeNotOpenAlertFlag = null,Object? longTimeNotOpenDayNum = null,}) {
  return _then(_self.copyWith(
notCloseAlertFlag: null == notCloseAlertFlag ? _self.notCloseAlertFlag : notCloseAlertFlag // ignore: cast_nullable_to_non_nullable
as int,notCloseAlertSecondNum: null == notCloseAlertSecondNum ? _self.notCloseAlertSecondNum : notCloseAlertSecondNum // ignore: cast_nullable_to_non_nullable
as int,longTimeNotOpenAlertFlag: null == longTimeNotOpenAlertFlag ? _self.longTimeNotOpenAlertFlag : longTimeNotOpenAlertFlag // ignore: cast_nullable_to_non_nullable
as int,longTimeNotOpenDayNum: null == longTimeNotOpenDayNum ? _self.longTimeNotOpenDayNum : longTimeNotOpenDayNum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorAlertFlagEntity].
extension StandaloneDoorSensorAlertFlagEntityPatterns on StandaloneDoorSensorAlertFlagEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorAlertFlagEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorAlertFlagEntity value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorAlertFlagEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int notCloseAlertFlag,  int notCloseAlertSecondNum,  int longTimeNotOpenAlertFlag,  int longTimeNotOpenDayNum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagEntity() when $default != null:
return $default(_that.notCloseAlertFlag,_that.notCloseAlertSecondNum,_that.longTimeNotOpenAlertFlag,_that.longTimeNotOpenDayNum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int notCloseAlertFlag,  int notCloseAlertSecondNum,  int longTimeNotOpenAlertFlag,  int longTimeNotOpenDayNum)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagEntity():
return $default(_that.notCloseAlertFlag,_that.notCloseAlertSecondNum,_that.longTimeNotOpenAlertFlag,_that.longTimeNotOpenDayNum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int notCloseAlertFlag,  int notCloseAlertSecondNum,  int longTimeNotOpenAlertFlag,  int longTimeNotOpenDayNum)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagEntity() when $default != null:
return $default(_that.notCloseAlertFlag,_that.notCloseAlertSecondNum,_that.longTimeNotOpenAlertFlag,_that.longTimeNotOpenDayNum);case _:
  return null;

}
}

}

/// @nodoc


class _StandaloneDoorSensorAlertFlagEntity extends StandaloneDoorSensorAlertFlagEntity {
  const _StandaloneDoorSensorAlertFlagEntity({this.notCloseAlertFlag = 0, this.notCloseAlertSecondNum = 0, this.longTimeNotOpenAlertFlag = 0, this.longTimeNotOpenDayNum = 0}): super._();
  

@override@JsonKey() final  int notCloseAlertFlag;
@override@JsonKey() final  int notCloseAlertSecondNum;
@override@JsonKey() final  int longTimeNotOpenAlertFlag;
@override@JsonKey() final  int longTimeNotOpenDayNum;

/// Create a copy of StandaloneDoorSensorAlertFlagEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorAlertFlagEntityCopyWith<_StandaloneDoorSensorAlertFlagEntity> get copyWith => __$StandaloneDoorSensorAlertFlagEntityCopyWithImpl<_StandaloneDoorSensorAlertFlagEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorAlertFlagEntity&&(identical(other.notCloseAlertFlag, notCloseAlertFlag) || other.notCloseAlertFlag == notCloseAlertFlag)&&(identical(other.notCloseAlertSecondNum, notCloseAlertSecondNum) || other.notCloseAlertSecondNum == notCloseAlertSecondNum)&&(identical(other.longTimeNotOpenAlertFlag, longTimeNotOpenAlertFlag) || other.longTimeNotOpenAlertFlag == longTimeNotOpenAlertFlag)&&(identical(other.longTimeNotOpenDayNum, longTimeNotOpenDayNum) || other.longTimeNotOpenDayNum == longTimeNotOpenDayNum));
}


@override
int get hashCode => Object.hash(runtimeType,notCloseAlertFlag,notCloseAlertSecondNum,longTimeNotOpenAlertFlag,longTimeNotOpenDayNum);

@override
String toString() {
  return 'StandaloneDoorSensorAlertFlagEntity(notCloseAlertFlag: $notCloseAlertFlag, notCloseAlertSecondNum: $notCloseAlertSecondNum, longTimeNotOpenAlertFlag: $longTimeNotOpenAlertFlag, longTimeNotOpenDayNum: $longTimeNotOpenDayNum)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorAlertFlagEntityCopyWith<$Res> implements $StandaloneDoorSensorAlertFlagEntityCopyWith<$Res> {
  factory _$StandaloneDoorSensorAlertFlagEntityCopyWith(_StandaloneDoorSensorAlertFlagEntity value, $Res Function(_StandaloneDoorSensorAlertFlagEntity) _then) = __$StandaloneDoorSensorAlertFlagEntityCopyWithImpl;
@override @useResult
$Res call({
 int notCloseAlertFlag, int notCloseAlertSecondNum, int longTimeNotOpenAlertFlag, int longTimeNotOpenDayNum
});




}
/// @nodoc
class __$StandaloneDoorSensorAlertFlagEntityCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorAlertFlagEntityCopyWith<$Res> {
  __$StandaloneDoorSensorAlertFlagEntityCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorAlertFlagEntity _self;
  final $Res Function(_StandaloneDoorSensorAlertFlagEntity) _then;

/// Create a copy of StandaloneDoorSensorAlertFlagEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notCloseAlertFlag = null,Object? notCloseAlertSecondNum = null,Object? longTimeNotOpenAlertFlag = null,Object? longTimeNotOpenDayNum = null,}) {
  return _then(_StandaloneDoorSensorAlertFlagEntity(
notCloseAlertFlag: null == notCloseAlertFlag ? _self.notCloseAlertFlag : notCloseAlertFlag // ignore: cast_nullable_to_non_nullable
as int,notCloseAlertSecondNum: null == notCloseAlertSecondNum ? _self.notCloseAlertSecondNum : notCloseAlertSecondNum // ignore: cast_nullable_to_non_nullable
as int,longTimeNotOpenAlertFlag: null == longTimeNotOpenAlertFlag ? _self.longTimeNotOpenAlertFlag : longTimeNotOpenAlertFlag // ignore: cast_nullable_to_non_nullable
as int,longTimeNotOpenDayNum: null == longTimeNotOpenDayNum ? _self.longTimeNotOpenDayNum : longTimeNotOpenDayNum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$StandaloneDoorSensorUserEntity {

 int get id; String get username;
/// Create a copy of StandaloneDoorSensorUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorUserEntityCopyWith<StandaloneDoorSensorUserEntity> get copyWith => _$StandaloneDoorSensorUserEntityCopyWithImpl<StandaloneDoorSensorUserEntity>(this as StandaloneDoorSensorUserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}


@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString() {
  return 'StandaloneDoorSensorUserEntity(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorUserEntityCopyWith<$Res>  {
  factory $StandaloneDoorSensorUserEntityCopyWith(StandaloneDoorSensorUserEntity value, $Res Function(StandaloneDoorSensorUserEntity) _then) = _$StandaloneDoorSensorUserEntityCopyWithImpl;
@useResult
$Res call({
 int id, String username
});




}
/// @nodoc
class _$StandaloneDoorSensorUserEntityCopyWithImpl<$Res>
    implements $StandaloneDoorSensorUserEntityCopyWith<$Res> {
  _$StandaloneDoorSensorUserEntityCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorUserEntity _self;
  final $Res Function(StandaloneDoorSensorUserEntity) _then;

/// Create a copy of StandaloneDoorSensorUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorUserEntity].
extension StandaloneDoorSensorUserEntityPatterns on StandaloneDoorSensorUserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorUserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorUserEntity value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorUserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserEntity() when $default != null:
return $default(_that.id,_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserEntity():
return $default(_that.id,_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserEntity() when $default != null:
return $default(_that.id,_that.username);case _:
  return null;

}
}

}

/// @nodoc


class _StandaloneDoorSensorUserEntity extends StandaloneDoorSensorUserEntity {
  const _StandaloneDoorSensorUserEntity({this.id = 0, this.username = ''}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String username;

/// Create a copy of StandaloneDoorSensorUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorUserEntityCopyWith<_StandaloneDoorSensorUserEntity> get copyWith => __$StandaloneDoorSensorUserEntityCopyWithImpl<_StandaloneDoorSensorUserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}


@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString() {
  return 'StandaloneDoorSensorUserEntity(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorUserEntityCopyWith<$Res> implements $StandaloneDoorSensorUserEntityCopyWith<$Res> {
  factory _$StandaloneDoorSensorUserEntityCopyWith(_StandaloneDoorSensorUserEntity value, $Res Function(_StandaloneDoorSensorUserEntity) _then) = __$StandaloneDoorSensorUserEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String username
});




}
/// @nodoc
class __$StandaloneDoorSensorUserEntityCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorUserEntityCopyWith<$Res> {
  __$StandaloneDoorSensorUserEntityCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorUserEntity _self;
  final $Res Function(_StandaloneDoorSensorUserEntity) _then;

/// Create a copy of StandaloneDoorSensorUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,}) {
  return _then(_StandaloneDoorSensorUserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
