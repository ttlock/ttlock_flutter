// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standalone_door_sensor_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StandaloneDoorSensorDto {

@JsonKey(name: 'mac') String get mac;@JsonKey(name: 'featureValue') String get featureValue;@JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic) int get statusDelayFlag;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;@JsonKey(name: 'doorSensorState', fromJson: intFromDynamic) int get doorSensorStateValue;@JsonKey(name: 'wifiName') String get wifiName;@JsonKey(name: 'doorSensorNumber') String get doorSensorNumber;@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) int get doorSensorId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'recordUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get recordUpdateDate;@JsonKey(name: 'wifiMac') String get wifiMac;@JsonKey(name: 'userType') String get userTypeValue;@JsonKey(name: 'firmwareRevision') String get firmwareRevision;
/// Create a copy of StandaloneDoorSensorDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorDtoCopyWith<StandaloneDoorSensorDto> get copyWith => _$StandaloneDoorSensorDtoCopyWithImpl<StandaloneDoorSensorDto>(this as StandaloneDoorSensorDto, _$identity);

  /// Serializes this StandaloneDoorSensorDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorDto&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.statusDelayFlag, statusDelayFlag) || other.statusDelayFlag == statusDelayFlag)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.doorSensorStateValue, doorSensorStateValue) || other.doorSensorStateValue == doorSensorStateValue)&&(identical(other.wifiName, wifiName) || other.wifiName == wifiName)&&(identical(other.doorSensorNumber, doorSensorNumber) || other.doorSensorNumber == doorSensorNumber)&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.recordUpdateDate, recordUpdateDate) || other.recordUpdateDate == recordUpdateDate)&&(identical(other.wifiMac, wifiMac) || other.wifiMac == wifiMac)&&(identical(other.userTypeValue, userTypeValue) || other.userTypeValue == userTypeValue)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mac,featureValue,statusDelayFlag,electricQuantity,doorSensorStateValue,wifiName,doorSensorNumber,doorSensorId,name,recordUpdateDate,wifiMac,userTypeValue,firmwareRevision);

@override
String toString() {
  return 'StandaloneDoorSensorDto(mac: $mac, featureValue: $featureValue, statusDelayFlag: $statusDelayFlag, electricQuantity: $electricQuantity, doorSensorStateValue: $doorSensorStateValue, wifiName: $wifiName, doorSensorNumber: $doorSensorNumber, doorSensorId: $doorSensorId, name: $name, recordUpdateDate: $recordUpdateDate, wifiMac: $wifiMac, userTypeValue: $userTypeValue, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorDtoCopyWith<$Res>  {
  factory $StandaloneDoorSensorDtoCopyWith(StandaloneDoorSensorDto value, $Res Function(StandaloneDoorSensorDto) _then) = _$StandaloneDoorSensorDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'mac') String mac,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic) int statusDelayFlag,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'doorSensorState', fromJson: intFromDynamic) int doorSensorStateValue,@JsonKey(name: 'wifiName') String wifiName,@JsonKey(name: 'doorSensorNumber') String doorSensorNumber,@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) int doorSensorId,@JsonKey(name: 'name') String name,@JsonKey(name: 'recordUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? recordUpdateDate,@JsonKey(name: 'wifiMac') String wifiMac,@JsonKey(name: 'userType') String userTypeValue,@JsonKey(name: 'firmwareRevision') String firmwareRevision
});




}
/// @nodoc
class _$StandaloneDoorSensorDtoCopyWithImpl<$Res>
    implements $StandaloneDoorSensorDtoCopyWith<$Res> {
  _$StandaloneDoorSensorDtoCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorDto _self;
  final $Res Function(StandaloneDoorSensorDto) _then;

/// Create a copy of StandaloneDoorSensorDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mac = null,Object? featureValue = null,Object? statusDelayFlag = null,Object? electricQuantity = null,Object? doorSensorStateValue = null,Object? wifiName = null,Object? doorSensorNumber = null,Object? doorSensorId = null,Object? name = null,Object? recordUpdateDate = freezed,Object? wifiMac = null,Object? userTypeValue = null,Object? firmwareRevision = null,}) {
  return _then(_self.copyWith(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,statusDelayFlag: null == statusDelayFlag ? _self.statusDelayFlag : statusDelayFlag // ignore: cast_nullable_to_non_nullable
as int,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,doorSensorStateValue: null == doorSensorStateValue ? _self.doorSensorStateValue : doorSensorStateValue // ignore: cast_nullable_to_non_nullable
as int,wifiName: null == wifiName ? _self.wifiName : wifiName // ignore: cast_nullable_to_non_nullable
as String,doorSensorNumber: null == doorSensorNumber ? _self.doorSensorNumber : doorSensorNumber // ignore: cast_nullable_to_non_nullable
as String,doorSensorId: null == doorSensorId ? _self.doorSensorId : doorSensorId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,recordUpdateDate: freezed == recordUpdateDate ? _self.recordUpdateDate : recordUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,wifiMac: null == wifiMac ? _self.wifiMac : wifiMac // ignore: cast_nullable_to_non_nullable
as String,userTypeValue: null == userTypeValue ? _self.userTypeValue : userTypeValue // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorDto].
extension StandaloneDoorSensorDtoPatterns on StandaloneDoorSensorDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorDto value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorDto value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic)  int statusDelayFlag, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'doorSensorState', fromJson: intFromDynamic)  int doorSensorStateValue, @JsonKey(name: 'wifiName')  String wifiName, @JsonKey(name: 'doorSensorNumber')  String doorSensorNumber, @JsonKey(name: 'doorSensorId', fromJson: intFromDynamic)  int doorSensorId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'recordUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? recordUpdateDate, @JsonKey(name: 'wifiMac')  String wifiMac, @JsonKey(name: 'userType')  String userTypeValue, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorDto() when $default != null:
return $default(_that.mac,_that.featureValue,_that.statusDelayFlag,_that.electricQuantity,_that.doorSensorStateValue,_that.wifiName,_that.doorSensorNumber,_that.doorSensorId,_that.name,_that.recordUpdateDate,_that.wifiMac,_that.userTypeValue,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic)  int statusDelayFlag, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'doorSensorState', fromJson: intFromDynamic)  int doorSensorStateValue, @JsonKey(name: 'wifiName')  String wifiName, @JsonKey(name: 'doorSensorNumber')  String doorSensorNumber, @JsonKey(name: 'doorSensorId', fromJson: intFromDynamic)  int doorSensorId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'recordUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? recordUpdateDate, @JsonKey(name: 'wifiMac')  String wifiMac, @JsonKey(name: 'userType')  String userTypeValue, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorDto():
return $default(_that.mac,_that.featureValue,_that.statusDelayFlag,_that.electricQuantity,_that.doorSensorStateValue,_that.wifiName,_that.doorSensorNumber,_that.doorSensorId,_that.name,_that.recordUpdateDate,_that.wifiMac,_that.userTypeValue,_that.firmwareRevision);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic)  int statusDelayFlag, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'doorSensorState', fromJson: intFromDynamic)  int doorSensorStateValue, @JsonKey(name: 'wifiName')  String wifiName, @JsonKey(name: 'doorSensorNumber')  String doorSensorNumber, @JsonKey(name: 'doorSensorId', fromJson: intFromDynamic)  int doorSensorId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'recordUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? recordUpdateDate, @JsonKey(name: 'wifiMac')  String wifiMac, @JsonKey(name: 'userType')  String userTypeValue, @JsonKey(name: 'firmwareRevision')  String firmwareRevision)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorDto() when $default != null:
return $default(_that.mac,_that.featureValue,_that.statusDelayFlag,_that.electricQuantity,_that.doorSensorStateValue,_that.wifiName,_that.doorSensorNumber,_that.doorSensorId,_that.name,_that.recordUpdateDate,_that.wifiMac,_that.userTypeValue,_that.firmwareRevision);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StandaloneDoorSensorDto extends StandaloneDoorSensorDto {
  const _StandaloneDoorSensorDto({@JsonKey(name: 'mac') this.mac = '', @JsonKey(name: 'featureValue') this.featureValue = '', @JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic) this.statusDelayFlag = 0, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'doorSensorState', fromJson: intFromDynamic) this.doorSensorStateValue = 2, @JsonKey(name: 'wifiName') this.wifiName = '', @JsonKey(name: 'doorSensorNumber') this.doorSensorNumber = '', @JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) this.doorSensorId = 0, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'recordUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.recordUpdateDate, @JsonKey(name: 'wifiMac') this.wifiMac = '', @JsonKey(name: 'userType') this.userTypeValue = 'ADMIN', @JsonKey(name: 'firmwareRevision') this.firmwareRevision = ''}): super._();
  factory _StandaloneDoorSensorDto.fromJson(Map<String, dynamic> json) => _$StandaloneDoorSensorDtoFromJson(json);

@override@JsonKey(name: 'mac') final  String mac;
@override@JsonKey(name: 'featureValue') final  String featureValue;
@override@JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic) final  int statusDelayFlag;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
@override@JsonKey(name: 'doorSensorState', fromJson: intFromDynamic) final  int doorSensorStateValue;
@override@JsonKey(name: 'wifiName') final  String wifiName;
@override@JsonKey(name: 'doorSensorNumber') final  String doorSensorNumber;
@override@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) final  int doorSensorId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'recordUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? recordUpdateDate;
@override@JsonKey(name: 'wifiMac') final  String wifiMac;
@override@JsonKey(name: 'userType') final  String userTypeValue;
@override@JsonKey(name: 'firmwareRevision') final  String firmwareRevision;

/// Create a copy of StandaloneDoorSensorDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorDtoCopyWith<_StandaloneDoorSensorDto> get copyWith => __$StandaloneDoorSensorDtoCopyWithImpl<_StandaloneDoorSensorDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StandaloneDoorSensorDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorDto&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.statusDelayFlag, statusDelayFlag) || other.statusDelayFlag == statusDelayFlag)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.doorSensorStateValue, doorSensorStateValue) || other.doorSensorStateValue == doorSensorStateValue)&&(identical(other.wifiName, wifiName) || other.wifiName == wifiName)&&(identical(other.doorSensorNumber, doorSensorNumber) || other.doorSensorNumber == doorSensorNumber)&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.recordUpdateDate, recordUpdateDate) || other.recordUpdateDate == recordUpdateDate)&&(identical(other.wifiMac, wifiMac) || other.wifiMac == wifiMac)&&(identical(other.userTypeValue, userTypeValue) || other.userTypeValue == userTypeValue)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mac,featureValue,statusDelayFlag,electricQuantity,doorSensorStateValue,wifiName,doorSensorNumber,doorSensorId,name,recordUpdateDate,wifiMac,userTypeValue,firmwareRevision);

@override
String toString() {
  return 'StandaloneDoorSensorDto(mac: $mac, featureValue: $featureValue, statusDelayFlag: $statusDelayFlag, electricQuantity: $electricQuantity, doorSensorStateValue: $doorSensorStateValue, wifiName: $wifiName, doorSensorNumber: $doorSensorNumber, doorSensorId: $doorSensorId, name: $name, recordUpdateDate: $recordUpdateDate, wifiMac: $wifiMac, userTypeValue: $userTypeValue, firmwareRevision: $firmwareRevision)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorDtoCopyWith<$Res> implements $StandaloneDoorSensorDtoCopyWith<$Res> {
  factory _$StandaloneDoorSensorDtoCopyWith(_StandaloneDoorSensorDto value, $Res Function(_StandaloneDoorSensorDto) _then) = __$StandaloneDoorSensorDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'mac') String mac,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic) int statusDelayFlag,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'doorSensorState', fromJson: intFromDynamic) int doorSensorStateValue,@JsonKey(name: 'wifiName') String wifiName,@JsonKey(name: 'doorSensorNumber') String doorSensorNumber,@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) int doorSensorId,@JsonKey(name: 'name') String name,@JsonKey(name: 'recordUpdateDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? recordUpdateDate,@JsonKey(name: 'wifiMac') String wifiMac,@JsonKey(name: 'userType') String userTypeValue,@JsonKey(name: 'firmwareRevision') String firmwareRevision
});




}
/// @nodoc
class __$StandaloneDoorSensorDtoCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorDtoCopyWith<$Res> {
  __$StandaloneDoorSensorDtoCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorDto _self;
  final $Res Function(_StandaloneDoorSensorDto) _then;

/// Create a copy of StandaloneDoorSensorDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mac = null,Object? featureValue = null,Object? statusDelayFlag = null,Object? electricQuantity = null,Object? doorSensorStateValue = null,Object? wifiName = null,Object? doorSensorNumber = null,Object? doorSensorId = null,Object? name = null,Object? recordUpdateDate = freezed,Object? wifiMac = null,Object? userTypeValue = null,Object? firmwareRevision = null,}) {
  return _then(_StandaloneDoorSensorDto(
mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,statusDelayFlag: null == statusDelayFlag ? _self.statusDelayFlag : statusDelayFlag // ignore: cast_nullable_to_non_nullable
as int,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,doorSensorStateValue: null == doorSensorStateValue ? _self.doorSensorStateValue : doorSensorStateValue // ignore: cast_nullable_to_non_nullable
as int,wifiName: null == wifiName ? _self.wifiName : wifiName // ignore: cast_nullable_to_non_nullable
as String,doorSensorNumber: null == doorSensorNumber ? _self.doorSensorNumber : doorSensorNumber // ignore: cast_nullable_to_non_nullable
as String,doorSensorId: null == doorSensorId ? _self.doorSensorId : doorSensorId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,recordUpdateDate: freezed == recordUpdateDate ? _self.recordUpdateDate : recordUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,wifiMac: null == wifiMac ? _self.wifiMac : wifiMac // ignore: cast_nullable_to_non_nullable
as String,userTypeValue: null == userTypeValue ? _self.userTypeValue : userTypeValue // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StandaloneDoorSensorRecordDto {

@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get date;@JsonKey(name: 'recordType', fromJson: intFromDynamic) int get recordType;
/// Create a copy of StandaloneDoorSensorRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorRecordDtoCopyWith<StandaloneDoorSensorRecordDto> get copyWith => _$StandaloneDoorSensorRecordDtoCopyWithImpl<StandaloneDoorSensorRecordDto>(this as StandaloneDoorSensorRecordDto, _$identity);

  /// Serializes this StandaloneDoorSensorRecordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorRecordDto&&(identical(other.date, date) || other.date == date)&&(identical(other.recordType, recordType) || other.recordType == recordType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,recordType);

@override
String toString() {
  return 'StandaloneDoorSensorRecordDto(date: $date, recordType: $recordType)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorRecordDtoCopyWith<$Res>  {
  factory $StandaloneDoorSensorRecordDtoCopyWith(StandaloneDoorSensorRecordDto value, $Res Function(StandaloneDoorSensorRecordDto) _then) = _$StandaloneDoorSensorRecordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? date,@JsonKey(name: 'recordType', fromJson: intFromDynamic) int recordType
});




}
/// @nodoc
class _$StandaloneDoorSensorRecordDtoCopyWithImpl<$Res>
    implements $StandaloneDoorSensorRecordDtoCopyWith<$Res> {
  _$StandaloneDoorSensorRecordDtoCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorRecordDto _self;
  final $Res Function(StandaloneDoorSensorRecordDto) _then;

/// Create a copy of StandaloneDoorSensorRecordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? recordType = null,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorRecordDto].
extension StandaloneDoorSensorRecordDtoPatterns on StandaloneDoorSensorRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? date, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? date, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? date, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorRecordDto() when $default != null:
return $default(_that.date,_that.recordType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StandaloneDoorSensorRecordDto extends StandaloneDoorSensorRecordDto {
  const _StandaloneDoorSensorRecordDto({@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.date, @JsonKey(name: 'recordType', fromJson: intFromDynamic) this.recordType = 0}): super._();
  factory _StandaloneDoorSensorRecordDto.fromJson(Map<String, dynamic> json) => _$StandaloneDoorSensorRecordDtoFromJson(json);

@override@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? date;
@override@JsonKey(name: 'recordType', fromJson: intFromDynamic) final  int recordType;

/// Create a copy of StandaloneDoorSensorRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorRecordDtoCopyWith<_StandaloneDoorSensorRecordDto> get copyWith => __$StandaloneDoorSensorRecordDtoCopyWithImpl<_StandaloneDoorSensorRecordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StandaloneDoorSensorRecordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorRecordDto&&(identical(other.date, date) || other.date == date)&&(identical(other.recordType, recordType) || other.recordType == recordType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,recordType);

@override
String toString() {
  return 'StandaloneDoorSensorRecordDto(date: $date, recordType: $recordType)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorRecordDtoCopyWith<$Res> implements $StandaloneDoorSensorRecordDtoCopyWith<$Res> {
  factory _$StandaloneDoorSensorRecordDtoCopyWith(_StandaloneDoorSensorRecordDto value, $Res Function(_StandaloneDoorSensorRecordDto) _then) = __$StandaloneDoorSensorRecordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'date', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? date,@JsonKey(name: 'recordType', fromJson: intFromDynamic) int recordType
});




}
/// @nodoc
class __$StandaloneDoorSensorRecordDtoCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorRecordDtoCopyWith<$Res> {
  __$StandaloneDoorSensorRecordDtoCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorRecordDto _self;
  final $Res Function(_StandaloneDoorSensorRecordDto) _then;

/// Create a copy of StandaloneDoorSensorRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? recordType = null,}) {
  return _then(_StandaloneDoorSensorRecordDto(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$StandaloneDoorSensorAlertFlagDto {

@JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic) int get notCloseAlertFlag;@JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic) int get notCloseAlertSecondNum;@JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic) int get longTimeNotOpenAlertFlag;@JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic) int get longTimeNotOpenDayNum;
/// Create a copy of StandaloneDoorSensorAlertFlagDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorAlertFlagDtoCopyWith<StandaloneDoorSensorAlertFlagDto> get copyWith => _$StandaloneDoorSensorAlertFlagDtoCopyWithImpl<StandaloneDoorSensorAlertFlagDto>(this as StandaloneDoorSensorAlertFlagDto, _$identity);

  /// Serializes this StandaloneDoorSensorAlertFlagDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorAlertFlagDto&&(identical(other.notCloseAlertFlag, notCloseAlertFlag) || other.notCloseAlertFlag == notCloseAlertFlag)&&(identical(other.notCloseAlertSecondNum, notCloseAlertSecondNum) || other.notCloseAlertSecondNum == notCloseAlertSecondNum)&&(identical(other.longTimeNotOpenAlertFlag, longTimeNotOpenAlertFlag) || other.longTimeNotOpenAlertFlag == longTimeNotOpenAlertFlag)&&(identical(other.longTimeNotOpenDayNum, longTimeNotOpenDayNum) || other.longTimeNotOpenDayNum == longTimeNotOpenDayNum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notCloseAlertFlag,notCloseAlertSecondNum,longTimeNotOpenAlertFlag,longTimeNotOpenDayNum);

@override
String toString() {
  return 'StandaloneDoorSensorAlertFlagDto(notCloseAlertFlag: $notCloseAlertFlag, notCloseAlertSecondNum: $notCloseAlertSecondNum, longTimeNotOpenAlertFlag: $longTimeNotOpenAlertFlag, longTimeNotOpenDayNum: $longTimeNotOpenDayNum)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorAlertFlagDtoCopyWith<$Res>  {
  factory $StandaloneDoorSensorAlertFlagDtoCopyWith(StandaloneDoorSensorAlertFlagDto value, $Res Function(StandaloneDoorSensorAlertFlagDto) _then) = _$StandaloneDoorSensorAlertFlagDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic) int notCloseAlertFlag,@JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic) int notCloseAlertSecondNum,@JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic) int longTimeNotOpenAlertFlag,@JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic) int longTimeNotOpenDayNum
});




}
/// @nodoc
class _$StandaloneDoorSensorAlertFlagDtoCopyWithImpl<$Res>
    implements $StandaloneDoorSensorAlertFlagDtoCopyWith<$Res> {
  _$StandaloneDoorSensorAlertFlagDtoCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorAlertFlagDto _self;
  final $Res Function(StandaloneDoorSensorAlertFlagDto) _then;

/// Create a copy of StandaloneDoorSensorAlertFlagDto
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


/// Adds pattern-matching-related methods to [StandaloneDoorSensorAlertFlagDto].
extension StandaloneDoorSensorAlertFlagDtoPatterns on StandaloneDoorSensorAlertFlagDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorAlertFlagDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorAlertFlagDto value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorAlertFlagDto value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic)  int notCloseAlertFlag, @JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic)  int notCloseAlertSecondNum, @JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic)  int longTimeNotOpenAlertFlag, @JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic)  int longTimeNotOpenDayNum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic)  int notCloseAlertFlag, @JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic)  int notCloseAlertSecondNum, @JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic)  int longTimeNotOpenAlertFlag, @JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic)  int longTimeNotOpenDayNum)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic)  int notCloseAlertFlag, @JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic)  int notCloseAlertSecondNum, @JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic)  int longTimeNotOpenAlertFlag, @JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic)  int longTimeNotOpenDayNum)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorAlertFlagDto() when $default != null:
return $default(_that.notCloseAlertFlag,_that.notCloseAlertSecondNum,_that.longTimeNotOpenAlertFlag,_that.longTimeNotOpenDayNum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StandaloneDoorSensorAlertFlagDto extends StandaloneDoorSensorAlertFlagDto {
  const _StandaloneDoorSensorAlertFlagDto({@JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic) this.notCloseAlertFlag = 0, @JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic) this.notCloseAlertSecondNum = 0, @JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic) this.longTimeNotOpenAlertFlag = 0, @JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic) this.longTimeNotOpenDayNum = 0}): super._();
  factory _StandaloneDoorSensorAlertFlagDto.fromJson(Map<String, dynamic> json) => _$StandaloneDoorSensorAlertFlagDtoFromJson(json);

@override@JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic) final  int notCloseAlertFlag;
@override@JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic) final  int notCloseAlertSecondNum;
@override@JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic) final  int longTimeNotOpenAlertFlag;
@override@JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic) final  int longTimeNotOpenDayNum;

/// Create a copy of StandaloneDoorSensorAlertFlagDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorAlertFlagDtoCopyWith<_StandaloneDoorSensorAlertFlagDto> get copyWith => __$StandaloneDoorSensorAlertFlagDtoCopyWithImpl<_StandaloneDoorSensorAlertFlagDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StandaloneDoorSensorAlertFlagDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorAlertFlagDto&&(identical(other.notCloseAlertFlag, notCloseAlertFlag) || other.notCloseAlertFlag == notCloseAlertFlag)&&(identical(other.notCloseAlertSecondNum, notCloseAlertSecondNum) || other.notCloseAlertSecondNum == notCloseAlertSecondNum)&&(identical(other.longTimeNotOpenAlertFlag, longTimeNotOpenAlertFlag) || other.longTimeNotOpenAlertFlag == longTimeNotOpenAlertFlag)&&(identical(other.longTimeNotOpenDayNum, longTimeNotOpenDayNum) || other.longTimeNotOpenDayNum == longTimeNotOpenDayNum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notCloseAlertFlag,notCloseAlertSecondNum,longTimeNotOpenAlertFlag,longTimeNotOpenDayNum);

@override
String toString() {
  return 'StandaloneDoorSensorAlertFlagDto(notCloseAlertFlag: $notCloseAlertFlag, notCloseAlertSecondNum: $notCloseAlertSecondNum, longTimeNotOpenAlertFlag: $longTimeNotOpenAlertFlag, longTimeNotOpenDayNum: $longTimeNotOpenDayNum)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorAlertFlagDtoCopyWith<$Res> implements $StandaloneDoorSensorAlertFlagDtoCopyWith<$Res> {
  factory _$StandaloneDoorSensorAlertFlagDtoCopyWith(_StandaloneDoorSensorAlertFlagDto value, $Res Function(_StandaloneDoorSensorAlertFlagDto) _then) = __$StandaloneDoorSensorAlertFlagDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic) int notCloseAlertFlag,@JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic) int notCloseAlertSecondNum,@JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic) int longTimeNotOpenAlertFlag,@JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic) int longTimeNotOpenDayNum
});




}
/// @nodoc
class __$StandaloneDoorSensorAlertFlagDtoCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorAlertFlagDtoCopyWith<$Res> {
  __$StandaloneDoorSensorAlertFlagDtoCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorAlertFlagDto _self;
  final $Res Function(_StandaloneDoorSensorAlertFlagDto) _then;

/// Create a copy of StandaloneDoorSensorAlertFlagDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notCloseAlertFlag = null,Object? notCloseAlertSecondNum = null,Object? longTimeNotOpenAlertFlag = null,Object? longTimeNotOpenDayNum = null,}) {
  return _then(_StandaloneDoorSensorAlertFlagDto(
notCloseAlertFlag: null == notCloseAlertFlag ? _self.notCloseAlertFlag : notCloseAlertFlag // ignore: cast_nullable_to_non_nullable
as int,notCloseAlertSecondNum: null == notCloseAlertSecondNum ? _self.notCloseAlertSecondNum : notCloseAlertSecondNum // ignore: cast_nullable_to_non_nullable
as int,longTimeNotOpenAlertFlag: null == longTimeNotOpenAlertFlag ? _self.longTimeNotOpenAlertFlag : longTimeNotOpenAlertFlag // ignore: cast_nullable_to_non_nullable
as int,longTimeNotOpenDayNum: null == longTimeNotOpenDayNum ? _self.longTimeNotOpenDayNum : longTimeNotOpenDayNum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$StandaloneDoorSensorUserDto {

@JsonKey(name: 'id', fromJson: intFromDynamic) int get id;@JsonKey(name: 'username') String get username;
/// Create a copy of StandaloneDoorSensorUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandaloneDoorSensorUserDtoCopyWith<StandaloneDoorSensorUserDto> get copyWith => _$StandaloneDoorSensorUserDtoCopyWithImpl<StandaloneDoorSensorUserDto>(this as StandaloneDoorSensorUserDto, _$identity);

  /// Serializes this StandaloneDoorSensorUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandaloneDoorSensorUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString() {
  return 'StandaloneDoorSensorUserDto(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class $StandaloneDoorSensorUserDtoCopyWith<$Res>  {
  factory $StandaloneDoorSensorUserDtoCopyWith(StandaloneDoorSensorUserDto value, $Res Function(StandaloneDoorSensorUserDto) _then) = _$StandaloneDoorSensorUserDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'username') String username
});




}
/// @nodoc
class _$StandaloneDoorSensorUserDtoCopyWithImpl<$Res>
    implements $StandaloneDoorSensorUserDtoCopyWith<$Res> {
  _$StandaloneDoorSensorUserDtoCopyWithImpl(this._self, this._then);

  final StandaloneDoorSensorUserDto _self;
  final $Res Function(StandaloneDoorSensorUserDto) _then;

/// Create a copy of StandaloneDoorSensorUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StandaloneDoorSensorUserDto].
extension StandaloneDoorSensorUserDtoPatterns on StandaloneDoorSensorUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandaloneDoorSensorUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandaloneDoorSensorUserDto value)  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandaloneDoorSensorUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'username')  String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'username')  String username)  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'username')  String username)?  $default,) {final _that = this;
switch (_that) {
case _StandaloneDoorSensorUserDto() when $default != null:
return $default(_that.id,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StandaloneDoorSensorUserDto extends StandaloneDoorSensorUserDto {
  const _StandaloneDoorSensorUserDto({@JsonKey(name: 'id', fromJson: intFromDynamic) this.id = 0, @JsonKey(name: 'username') this.username = ''}): super._();
  factory _StandaloneDoorSensorUserDto.fromJson(Map<String, dynamic> json) => _$StandaloneDoorSensorUserDtoFromJson(json);

@override@JsonKey(name: 'id', fromJson: intFromDynamic) final  int id;
@override@JsonKey(name: 'username') final  String username;

/// Create a copy of StandaloneDoorSensorUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandaloneDoorSensorUserDtoCopyWith<_StandaloneDoorSensorUserDto> get copyWith => __$StandaloneDoorSensorUserDtoCopyWithImpl<_StandaloneDoorSensorUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StandaloneDoorSensorUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandaloneDoorSensorUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username);

@override
String toString() {
  return 'StandaloneDoorSensorUserDto(id: $id, username: $username)';
}


}

/// @nodoc
abstract mixin class _$StandaloneDoorSensorUserDtoCopyWith<$Res> implements $StandaloneDoorSensorUserDtoCopyWith<$Res> {
  factory _$StandaloneDoorSensorUserDtoCopyWith(_StandaloneDoorSensorUserDto value, $Res Function(_StandaloneDoorSensorUserDto) _then) = __$StandaloneDoorSensorUserDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'username') String username
});




}
/// @nodoc
class __$StandaloneDoorSensorUserDtoCopyWithImpl<$Res>
    implements _$StandaloneDoorSensorUserDtoCopyWith<$Res> {
  __$StandaloneDoorSensorUserDtoCopyWithImpl(this._self, this._then);

  final _StandaloneDoorSensorUserDto _self;
  final $Res Function(_StandaloneDoorSensorUserDto) _then;

/// Create a copy of StandaloneDoorSensorUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,}) {
  return _then(_StandaloneDoorSensorUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
