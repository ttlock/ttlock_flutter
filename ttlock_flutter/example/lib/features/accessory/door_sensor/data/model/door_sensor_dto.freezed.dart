// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'door_sensor_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoorSensorDto {

@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) int get doorSensorId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;@JsonKey(name: 'version') String get version;@JsonKey(name: 'mac') String get mac;@JsonKey(name: 'number') String get number;@JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic) int get doorNotClosedWarningTime;
/// Create a copy of DoorSensorDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoorSensorDtoCopyWith<DoorSensorDto> get copyWith => _$DoorSensorDtoCopyWithImpl<DoorSensorDto>(this as DoorSensorDto, _$identity);

  /// Serializes this DoorSensorDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoorSensorDto&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.version, version) || other.version == version)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.number, number) || other.number == number)&&(identical(other.doorNotClosedWarningTime, doorNotClosedWarningTime) || other.doorNotClosedWarningTime == doorNotClosedWarningTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doorSensorId,name,electricQuantity,version,mac,number,doorNotClosedWarningTime);

@override
String toString() {
  return 'DoorSensorDto(doorSensorId: $doorSensorId, name: $name, electricQuantity: $electricQuantity, version: $version, mac: $mac, number: $number, doorNotClosedWarningTime: $doorNotClosedWarningTime)';
}


}

/// @nodoc
abstract mixin class $DoorSensorDtoCopyWith<$Res>  {
  factory $DoorSensorDtoCopyWith(DoorSensorDto value, $Res Function(DoorSensorDto) _then) = _$DoorSensorDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) int doorSensorId,@JsonKey(name: 'name') String name,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'version') String version,@JsonKey(name: 'mac') String mac,@JsonKey(name: 'number') String number,@JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic) int doorNotClosedWarningTime
});




}
/// @nodoc
class _$DoorSensorDtoCopyWithImpl<$Res>
    implements $DoorSensorDtoCopyWith<$Res> {
  _$DoorSensorDtoCopyWithImpl(this._self, this._then);

  final DoorSensorDto _self;
  final $Res Function(DoorSensorDto) _then;

/// Create a copy of DoorSensorDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doorSensorId = null,Object? name = null,Object? electricQuantity = null,Object? version = null,Object? mac = null,Object? number = null,Object? doorNotClosedWarningTime = null,}) {
  return _then(_self.copyWith(
doorSensorId: null == doorSensorId ? _self.doorSensorId : doorSensorId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,doorNotClosedWarningTime: null == doorNotClosedWarningTime ? _self.doorNotClosedWarningTime : doorNotClosedWarningTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DoorSensorDto].
extension DoorSensorDtoPatterns on DoorSensorDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoorSensorDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoorSensorDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoorSensorDto value)  $default,){
final _that = this;
switch (_that) {
case _DoorSensorDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoorSensorDto value)?  $default,){
final _that = this;
switch (_that) {
case _DoorSensorDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic)  int doorSensorId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'version')  String version, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'number')  String number, @JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic)  int doorNotClosedWarningTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoorSensorDto() when $default != null:
return $default(_that.doorSensorId,_that.name,_that.electricQuantity,_that.version,_that.mac,_that.number,_that.doorNotClosedWarningTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic)  int doorSensorId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'version')  String version, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'number')  String number, @JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic)  int doorNotClosedWarningTime)  $default,) {final _that = this;
switch (_that) {
case _DoorSensorDto():
return $default(_that.doorSensorId,_that.name,_that.electricQuantity,_that.version,_that.mac,_that.number,_that.doorNotClosedWarningTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic)  int doorSensorId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'version')  String version, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'number')  String number, @JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic)  int doorNotClosedWarningTime)?  $default,) {final _that = this;
switch (_that) {
case _DoorSensorDto() when $default != null:
return $default(_that.doorSensorId,_that.name,_that.electricQuantity,_that.version,_that.mac,_that.number,_that.doorNotClosedWarningTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoorSensorDto extends DoorSensorDto {
  const _DoorSensorDto({@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) this.doorSensorId = 0, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'version') this.version = '', @JsonKey(name: 'mac') this.mac = '', @JsonKey(name: 'number') this.number = '', @JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic) this.doorNotClosedWarningTime = 0}): super._();
  factory _DoorSensorDto.fromJson(Map<String, dynamic> json) => _$DoorSensorDtoFromJson(json);

@override@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) final  int doorSensorId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
@override@JsonKey(name: 'version') final  String version;
@override@JsonKey(name: 'mac') final  String mac;
@override@JsonKey(name: 'number') final  String number;
@override@JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic) final  int doorNotClosedWarningTime;

/// Create a copy of DoorSensorDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoorSensorDtoCopyWith<_DoorSensorDto> get copyWith => __$DoorSensorDtoCopyWithImpl<_DoorSensorDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoorSensorDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoorSensorDto&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.version, version) || other.version == version)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.number, number) || other.number == number)&&(identical(other.doorNotClosedWarningTime, doorNotClosedWarningTime) || other.doorNotClosedWarningTime == doorNotClosedWarningTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doorSensorId,name,electricQuantity,version,mac,number,doorNotClosedWarningTime);

@override
String toString() {
  return 'DoorSensorDto(doorSensorId: $doorSensorId, name: $name, electricQuantity: $electricQuantity, version: $version, mac: $mac, number: $number, doorNotClosedWarningTime: $doorNotClosedWarningTime)';
}


}

/// @nodoc
abstract mixin class _$DoorSensorDtoCopyWith<$Res> implements $DoorSensorDtoCopyWith<$Res> {
  factory _$DoorSensorDtoCopyWith(_DoorSensorDto value, $Res Function(_DoorSensorDto) _then) = __$DoorSensorDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doorSensorId', fromJson: intFromDynamic) int doorSensorId,@JsonKey(name: 'name') String name,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'version') String version,@JsonKey(name: 'mac') String mac,@JsonKey(name: 'number') String number,@JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic) int doorNotClosedWarningTime
});




}
/// @nodoc
class __$DoorSensorDtoCopyWithImpl<$Res>
    implements _$DoorSensorDtoCopyWith<$Res> {
  __$DoorSensorDtoCopyWithImpl(this._self, this._then);

  final _DoorSensorDto _self;
  final $Res Function(_DoorSensorDto) _then;

/// Create a copy of DoorSensorDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doorSensorId = null,Object? name = null,Object? electricQuantity = null,Object? version = null,Object? mac = null,Object? number = null,Object? doorNotClosedWarningTime = null,}) {
  return _then(_DoorSensorDto(
doorSensorId: null == doorSensorId ? _self.doorSensorId : doorSensorId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,doorNotClosedWarningTime: null == doorNotClosedWarningTime ? _self.doorNotClosedWarningTime : doorNotClosedWarningTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DoorSensorRecordDto {

@JsonKey(name: 'recordId', fromJson: intFromDynamic) int get recordId;@JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) int get recordTypeFromLock;@JsonKey(name: 'recordType', fromJson: intFromDynamic) int get recordType;@JsonKey(name: 'success', fromJson: boolFromDynamic) bool get success;@JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get lockDate;@JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get serverDate;
/// Create a copy of DoorSensorRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoorSensorRecordDtoCopyWith<DoorSensorRecordDto> get copyWith => _$DoorSensorRecordDtoCopyWithImpl<DoorSensorRecordDto>(this as DoorSensorRecordDto, _$identity);

  /// Serializes this DoorSensorRecordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoorSensorRecordDto&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.recordTypeFromLock, recordTypeFromLock) || other.recordTypeFromLock == recordTypeFromLock)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.success, success) || other.success == success)&&(identical(other.lockDate, lockDate) || other.lockDate == lockDate)&&(identical(other.serverDate, serverDate) || other.serverDate == serverDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recordId,recordTypeFromLock,recordType,success,lockDate,serverDate);

@override
String toString() {
  return 'DoorSensorRecordDto(recordId: $recordId, recordTypeFromLock: $recordTypeFromLock, recordType: $recordType, success: $success, lockDate: $lockDate, serverDate: $serverDate)';
}


}

/// @nodoc
abstract mixin class $DoorSensorRecordDtoCopyWith<$Res>  {
  factory $DoorSensorRecordDtoCopyWith(DoorSensorRecordDto value, $Res Function(DoorSensorRecordDto) _then) = _$DoorSensorRecordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'recordId', fromJson: intFromDynamic) int recordId,@JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) int recordTypeFromLock,@JsonKey(name: 'recordType', fromJson: intFromDynamic) int recordType,@JsonKey(name: 'success', fromJson: boolFromDynamic) bool success,@JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? lockDate,@JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? serverDate
});




}
/// @nodoc
class _$DoorSensorRecordDtoCopyWithImpl<$Res>
    implements $DoorSensorRecordDtoCopyWith<$Res> {
  _$DoorSensorRecordDtoCopyWithImpl(this._self, this._then);

  final DoorSensorRecordDto _self;
  final $Res Function(DoorSensorRecordDto) _then;

/// Create a copy of DoorSensorRecordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recordId = null,Object? recordTypeFromLock = null,Object? recordType = null,Object? success = null,Object? lockDate = freezed,Object? serverDate = freezed,}) {
  return _then(_self.copyWith(
recordId: null == recordId ? _self.recordId : recordId // ignore: cast_nullable_to_non_nullable
as int,recordTypeFromLock: null == recordTypeFromLock ? _self.recordTypeFromLock : recordTypeFromLock // ignore: cast_nullable_to_non_nullable
as int,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as int,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,lockDate: freezed == lockDate ? _self.lockDate : lockDate // ignore: cast_nullable_to_non_nullable
as DateTime?,serverDate: freezed == serverDate ? _self.serverDate : serverDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoorSensorRecordDto].
extension DoorSensorRecordDtoPatterns on DoorSensorRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoorSensorRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoorSensorRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoorSensorRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _DoorSensorRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoorSensorRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _DoorSensorRecordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'recordId', fromJson: intFromDynamic)  int recordId, @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic)  int recordTypeFromLock, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType, @JsonKey(name: 'success', fromJson: boolFromDynamic)  bool success, @JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? lockDate, @JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? serverDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoorSensorRecordDto() when $default != null:
return $default(_that.recordId,_that.recordTypeFromLock,_that.recordType,_that.success,_that.lockDate,_that.serverDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'recordId', fromJson: intFromDynamic)  int recordId, @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic)  int recordTypeFromLock, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType, @JsonKey(name: 'success', fromJson: boolFromDynamic)  bool success, @JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? lockDate, @JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? serverDate)  $default,) {final _that = this;
switch (_that) {
case _DoorSensorRecordDto():
return $default(_that.recordId,_that.recordTypeFromLock,_that.recordType,_that.success,_that.lockDate,_that.serverDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'recordId', fromJson: intFromDynamic)  int recordId, @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic)  int recordTypeFromLock, @JsonKey(name: 'recordType', fromJson: intFromDynamic)  int recordType, @JsonKey(name: 'success', fromJson: boolFromDynamic)  bool success, @JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? lockDate, @JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? serverDate)?  $default,) {final _that = this;
switch (_that) {
case _DoorSensorRecordDto() when $default != null:
return $default(_that.recordId,_that.recordTypeFromLock,_that.recordType,_that.success,_that.lockDate,_that.serverDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoorSensorRecordDto extends DoorSensorRecordDto {
  const _DoorSensorRecordDto({@JsonKey(name: 'recordId', fromJson: intFromDynamic) this.recordId = 0, @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) this.recordTypeFromLock = 0, @JsonKey(name: 'recordType', fromJson: intFromDynamic) this.recordType = 0, @JsonKey(name: 'success', fromJson: boolFromDynamic) this.success = false, @JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.lockDate, @JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.serverDate}): super._();
  factory _DoorSensorRecordDto.fromJson(Map<String, dynamic> json) => _$DoorSensorRecordDtoFromJson(json);

@override@JsonKey(name: 'recordId', fromJson: intFromDynamic) final  int recordId;
@override@JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) final  int recordTypeFromLock;
@override@JsonKey(name: 'recordType', fromJson: intFromDynamic) final  int recordType;
@override@JsonKey(name: 'success', fromJson: boolFromDynamic) final  bool success;
@override@JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? lockDate;
@override@JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? serverDate;

/// Create a copy of DoorSensorRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoorSensorRecordDtoCopyWith<_DoorSensorRecordDto> get copyWith => __$DoorSensorRecordDtoCopyWithImpl<_DoorSensorRecordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoorSensorRecordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoorSensorRecordDto&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.recordTypeFromLock, recordTypeFromLock) || other.recordTypeFromLock == recordTypeFromLock)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.success, success) || other.success == success)&&(identical(other.lockDate, lockDate) || other.lockDate == lockDate)&&(identical(other.serverDate, serverDate) || other.serverDate == serverDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recordId,recordTypeFromLock,recordType,success,lockDate,serverDate);

@override
String toString() {
  return 'DoorSensorRecordDto(recordId: $recordId, recordTypeFromLock: $recordTypeFromLock, recordType: $recordType, success: $success, lockDate: $lockDate, serverDate: $serverDate)';
}


}

/// @nodoc
abstract mixin class _$DoorSensorRecordDtoCopyWith<$Res> implements $DoorSensorRecordDtoCopyWith<$Res> {
  factory _$DoorSensorRecordDtoCopyWith(_DoorSensorRecordDto value, $Res Function(_DoorSensorRecordDto) _then) = __$DoorSensorRecordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'recordId', fromJson: intFromDynamic) int recordId,@JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic) int recordTypeFromLock,@JsonKey(name: 'recordType', fromJson: intFromDynamic) int recordType,@JsonKey(name: 'success', fromJson: boolFromDynamic) bool success,@JsonKey(name: 'lockDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? lockDate,@JsonKey(name: 'serverDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? serverDate
});




}
/// @nodoc
class __$DoorSensorRecordDtoCopyWithImpl<$Res>
    implements _$DoorSensorRecordDtoCopyWith<$Res> {
  __$DoorSensorRecordDtoCopyWithImpl(this._self, this._then);

  final _DoorSensorRecordDto _self;
  final $Res Function(_DoorSensorRecordDto) _then;

/// Create a copy of DoorSensorRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recordId = null,Object? recordTypeFromLock = null,Object? recordType = null,Object? success = null,Object? lockDate = freezed,Object? serverDate = freezed,}) {
  return _then(_DoorSensorRecordDto(
recordId: null == recordId ? _self.recordId : recordId // ignore: cast_nullable_to_non_nullable
as int,recordTypeFromLock: null == recordTypeFromLock ? _self.recordTypeFromLock : recordTypeFromLock // ignore: cast_nullable_to_non_nullable
as int,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as int,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,lockDate: freezed == lockDate ? _self.lockDate : lockDate // ignore: cast_nullable_to_non_nullable
as DateTime?,serverDate: freezed == serverDate ? _self.serverDate : serverDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DoorSensorUpgradeCheckDto {

@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int get needUpgrade;@JsonKey(name: 'firmwareInfo') Object? get firmwareInfo;@JsonKey(name: 'firmwarePackage') String get firmwarePackage;@JsonKey(name: 'version') String get version;
/// Create a copy of DoorSensorUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoorSensorUpgradeCheckDtoCopyWith<DoorSensorUpgradeCheckDto> get copyWith => _$DoorSensorUpgradeCheckDtoCopyWithImpl<DoorSensorUpgradeCheckDto>(this as DoorSensorUpgradeCheckDto, _$identity);

  /// Serializes this DoorSensorUpgradeCheckDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoorSensorUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&const DeepCollectionEquality().equals(other.firmwareInfo, firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,const DeepCollectionEquality().hash(firmwareInfo),firmwarePackage,version);

@override
String toString() {
  return 'DoorSensorUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class $DoorSensorUpgradeCheckDtoCopyWith<$Res>  {
  factory $DoorSensorUpgradeCheckDtoCopyWith(DoorSensorUpgradeCheckDto value, $Res Function(DoorSensorUpgradeCheckDto) _then) = _$DoorSensorUpgradeCheckDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') Object? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});




}
/// @nodoc
class _$DoorSensorUpgradeCheckDtoCopyWithImpl<$Res>
    implements $DoorSensorUpgradeCheckDtoCopyWith<$Res> {
  _$DoorSensorUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final DoorSensorUpgradeCheckDto _self;
  final $Res Function(DoorSensorUpgradeCheckDto) _then;

/// Create a copy of DoorSensorUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_self.copyWith(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo ,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DoorSensorUpgradeCheckDto].
extension DoorSensorUpgradeCheckDtoPatterns on DoorSensorUpgradeCheckDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoorSensorUpgradeCheckDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoorSensorUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoorSensorUpgradeCheckDto value)  $default,){
final _that = this;
switch (_that) {
case _DoorSensorUpgradeCheckDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoorSensorUpgradeCheckDto value)?  $default,){
final _that = this;
switch (_that) {
case _DoorSensorUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  Object? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoorSensorUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  Object? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)  $default,) {final _that = this;
switch (_that) {
case _DoorSensorUpgradeCheckDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  Object? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)?  $default,) {final _that = this;
switch (_that) {
case _DoorSensorUpgradeCheckDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoorSensorUpgradeCheckDto extends DoorSensorUpgradeCheckDto {
  const _DoorSensorUpgradeCheckDto({@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) this.needUpgrade = 0, @JsonKey(name: 'firmwareInfo') this.firmwareInfo, @JsonKey(name: 'firmwarePackage') this.firmwarePackage = '', @JsonKey(name: 'version') this.version = ''}): super._();
  factory _DoorSensorUpgradeCheckDto.fromJson(Map<String, dynamic> json) => _$DoorSensorUpgradeCheckDtoFromJson(json);

@override@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) final  int needUpgrade;
@override@JsonKey(name: 'firmwareInfo') final  Object? firmwareInfo;
@override@JsonKey(name: 'firmwarePackage') final  String firmwarePackage;
@override@JsonKey(name: 'version') final  String version;

/// Create a copy of DoorSensorUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoorSensorUpgradeCheckDtoCopyWith<_DoorSensorUpgradeCheckDto> get copyWith => __$DoorSensorUpgradeCheckDtoCopyWithImpl<_DoorSensorUpgradeCheckDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoorSensorUpgradeCheckDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoorSensorUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&const DeepCollectionEquality().equals(other.firmwareInfo, firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,const DeepCollectionEquality().hash(firmwareInfo),firmwarePackage,version);

@override
String toString() {
  return 'DoorSensorUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class _$DoorSensorUpgradeCheckDtoCopyWith<$Res> implements $DoorSensorUpgradeCheckDtoCopyWith<$Res> {
  factory _$DoorSensorUpgradeCheckDtoCopyWith(_DoorSensorUpgradeCheckDto value, $Res Function(_DoorSensorUpgradeCheckDto) _then) = __$DoorSensorUpgradeCheckDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') Object? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});




}
/// @nodoc
class __$DoorSensorUpgradeCheckDtoCopyWithImpl<$Res>
    implements _$DoorSensorUpgradeCheckDtoCopyWith<$Res> {
  __$DoorSensorUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final _DoorSensorUpgradeCheckDto _self;
  final $Res Function(_DoorSensorUpgradeCheckDto) _then;

/// Create a copy of DoorSensorUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_DoorSensorUpgradeCheckDto(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo ,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
