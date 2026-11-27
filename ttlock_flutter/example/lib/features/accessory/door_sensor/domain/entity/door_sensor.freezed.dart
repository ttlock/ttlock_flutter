// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'door_sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoorSensorEntity {

 int get doorSensorId; String get name; int get electricQuantity; String get version; String get mac; String get number; int get doorNotClosedWarningTime;
/// Create a copy of DoorSensorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoorSensorEntityCopyWith<DoorSensorEntity> get copyWith => _$DoorSensorEntityCopyWithImpl<DoorSensorEntity>(this as DoorSensorEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoorSensorEntity&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.version, version) || other.version == version)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.number, number) || other.number == number)&&(identical(other.doorNotClosedWarningTime, doorNotClosedWarningTime) || other.doorNotClosedWarningTime == doorNotClosedWarningTime));
}


@override
int get hashCode => Object.hash(runtimeType,doorSensorId,name,electricQuantity,version,mac,number,doorNotClosedWarningTime);

@override
String toString() {
  return 'DoorSensorEntity(doorSensorId: $doorSensorId, name: $name, electricQuantity: $electricQuantity, version: $version, mac: $mac, number: $number, doorNotClosedWarningTime: $doorNotClosedWarningTime)';
}


}

/// @nodoc
abstract mixin class $DoorSensorEntityCopyWith<$Res>  {
  factory $DoorSensorEntityCopyWith(DoorSensorEntity value, $Res Function(DoorSensorEntity) _then) = _$DoorSensorEntityCopyWithImpl;
@useResult
$Res call({
 int doorSensorId, String name, int electricQuantity, String version, String mac, String number, int doorNotClosedWarningTime
});




}
/// @nodoc
class _$DoorSensorEntityCopyWithImpl<$Res>
    implements $DoorSensorEntityCopyWith<$Res> {
  _$DoorSensorEntityCopyWithImpl(this._self, this._then);

  final DoorSensorEntity _self;
  final $Res Function(DoorSensorEntity) _then;

/// Create a copy of DoorSensorEntity
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


/// Adds pattern-matching-related methods to [DoorSensorEntity].
extension DoorSensorEntityPatterns on DoorSensorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoorSensorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoorSensorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoorSensorEntity value)  $default,){
final _that = this;
switch (_that) {
case _DoorSensorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoorSensorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DoorSensorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int doorSensorId,  String name,  int electricQuantity,  String version,  String mac,  String number,  int doorNotClosedWarningTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoorSensorEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int doorSensorId,  String name,  int electricQuantity,  String version,  String mac,  String number,  int doorNotClosedWarningTime)  $default,) {final _that = this;
switch (_that) {
case _DoorSensorEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int doorSensorId,  String name,  int electricQuantity,  String version,  String mac,  String number,  int doorNotClosedWarningTime)?  $default,) {final _that = this;
switch (_that) {
case _DoorSensorEntity() when $default != null:
return $default(_that.doorSensorId,_that.name,_that.electricQuantity,_that.version,_that.mac,_that.number,_that.doorNotClosedWarningTime);case _:
  return null;

}
}

}

/// @nodoc


class _DoorSensorEntity extends DoorSensorEntity {
  const _DoorSensorEntity({this.doorSensorId = 0, this.name = '', this.electricQuantity = 0, this.version = '', this.mac = '', this.number = '', this.doorNotClosedWarningTime = 0}): super._();
  

@override@JsonKey() final  int doorSensorId;
@override@JsonKey() final  String name;
@override@JsonKey() final  int electricQuantity;
@override@JsonKey() final  String version;
@override@JsonKey() final  String mac;
@override@JsonKey() final  String number;
@override@JsonKey() final  int doorNotClosedWarningTime;

/// Create a copy of DoorSensorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoorSensorEntityCopyWith<_DoorSensorEntity> get copyWith => __$DoorSensorEntityCopyWithImpl<_DoorSensorEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoorSensorEntity&&(identical(other.doorSensorId, doorSensorId) || other.doorSensorId == doorSensorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.version, version) || other.version == version)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.number, number) || other.number == number)&&(identical(other.doorNotClosedWarningTime, doorNotClosedWarningTime) || other.doorNotClosedWarningTime == doorNotClosedWarningTime));
}


@override
int get hashCode => Object.hash(runtimeType,doorSensorId,name,electricQuantity,version,mac,number,doorNotClosedWarningTime);

@override
String toString() {
  return 'DoorSensorEntity(doorSensorId: $doorSensorId, name: $name, electricQuantity: $electricQuantity, version: $version, mac: $mac, number: $number, doorNotClosedWarningTime: $doorNotClosedWarningTime)';
}


}

/// @nodoc
abstract mixin class _$DoorSensorEntityCopyWith<$Res> implements $DoorSensorEntityCopyWith<$Res> {
  factory _$DoorSensorEntityCopyWith(_DoorSensorEntity value, $Res Function(_DoorSensorEntity) _then) = __$DoorSensorEntityCopyWithImpl;
@override @useResult
$Res call({
 int doorSensorId, String name, int electricQuantity, String version, String mac, String number, int doorNotClosedWarningTime
});




}
/// @nodoc
class __$DoorSensorEntityCopyWithImpl<$Res>
    implements _$DoorSensorEntityCopyWith<$Res> {
  __$DoorSensorEntityCopyWithImpl(this._self, this._then);

  final _DoorSensorEntity _self;
  final $Res Function(_DoorSensorEntity) _then;

/// Create a copy of DoorSensorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doorSensorId = null,Object? name = null,Object? electricQuantity = null,Object? version = null,Object? mac = null,Object? number = null,Object? doorNotClosedWarningTime = null,}) {
  return _then(_DoorSensorEntity(
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
mixin _$DoorSensorRecordEntity {

 int get recordId; int get recordTypeFromLock; int get recordType; bool get success; DateTime? get lockDate; DateTime? get serverDate;
/// Create a copy of DoorSensorRecordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoorSensorRecordEntityCopyWith<DoorSensorRecordEntity> get copyWith => _$DoorSensorRecordEntityCopyWithImpl<DoorSensorRecordEntity>(this as DoorSensorRecordEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoorSensorRecordEntity&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.recordTypeFromLock, recordTypeFromLock) || other.recordTypeFromLock == recordTypeFromLock)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.success, success) || other.success == success)&&(identical(other.lockDate, lockDate) || other.lockDate == lockDate)&&(identical(other.serverDate, serverDate) || other.serverDate == serverDate));
}


@override
int get hashCode => Object.hash(runtimeType,recordId,recordTypeFromLock,recordType,success,lockDate,serverDate);

@override
String toString() {
  return 'DoorSensorRecordEntity(recordId: $recordId, recordTypeFromLock: $recordTypeFromLock, recordType: $recordType, success: $success, lockDate: $lockDate, serverDate: $serverDate)';
}


}

/// @nodoc
abstract mixin class $DoorSensorRecordEntityCopyWith<$Res>  {
  factory $DoorSensorRecordEntityCopyWith(DoorSensorRecordEntity value, $Res Function(DoorSensorRecordEntity) _then) = _$DoorSensorRecordEntityCopyWithImpl;
@useResult
$Res call({
 int recordId, int recordTypeFromLock, int recordType, bool success, DateTime? lockDate, DateTime? serverDate
});




}
/// @nodoc
class _$DoorSensorRecordEntityCopyWithImpl<$Res>
    implements $DoorSensorRecordEntityCopyWith<$Res> {
  _$DoorSensorRecordEntityCopyWithImpl(this._self, this._then);

  final DoorSensorRecordEntity _self;
  final $Res Function(DoorSensorRecordEntity) _then;

/// Create a copy of DoorSensorRecordEntity
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


/// Adds pattern-matching-related methods to [DoorSensorRecordEntity].
extension DoorSensorRecordEntityPatterns on DoorSensorRecordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoorSensorRecordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoorSensorRecordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoorSensorRecordEntity value)  $default,){
final _that = this;
switch (_that) {
case _DoorSensorRecordEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoorSensorRecordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DoorSensorRecordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int recordId,  int recordTypeFromLock,  int recordType,  bool success,  DateTime? lockDate,  DateTime? serverDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoorSensorRecordEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int recordId,  int recordTypeFromLock,  int recordType,  bool success,  DateTime? lockDate,  DateTime? serverDate)  $default,) {final _that = this;
switch (_that) {
case _DoorSensorRecordEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int recordId,  int recordTypeFromLock,  int recordType,  bool success,  DateTime? lockDate,  DateTime? serverDate)?  $default,) {final _that = this;
switch (_that) {
case _DoorSensorRecordEntity() when $default != null:
return $default(_that.recordId,_that.recordTypeFromLock,_that.recordType,_that.success,_that.lockDate,_that.serverDate);case _:
  return null;

}
}

}

/// @nodoc


class _DoorSensorRecordEntity extends DoorSensorRecordEntity {
  const _DoorSensorRecordEntity({this.recordId = 0, this.recordTypeFromLock = 0, this.recordType = 0, this.success = false, this.lockDate, this.serverDate}): super._();
  

@override@JsonKey() final  int recordId;
@override@JsonKey() final  int recordTypeFromLock;
@override@JsonKey() final  int recordType;
@override@JsonKey() final  bool success;
@override final  DateTime? lockDate;
@override final  DateTime? serverDate;

/// Create a copy of DoorSensorRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoorSensorRecordEntityCopyWith<_DoorSensorRecordEntity> get copyWith => __$DoorSensorRecordEntityCopyWithImpl<_DoorSensorRecordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoorSensorRecordEntity&&(identical(other.recordId, recordId) || other.recordId == recordId)&&(identical(other.recordTypeFromLock, recordTypeFromLock) || other.recordTypeFromLock == recordTypeFromLock)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.success, success) || other.success == success)&&(identical(other.lockDate, lockDate) || other.lockDate == lockDate)&&(identical(other.serverDate, serverDate) || other.serverDate == serverDate));
}


@override
int get hashCode => Object.hash(runtimeType,recordId,recordTypeFromLock,recordType,success,lockDate,serverDate);

@override
String toString() {
  return 'DoorSensorRecordEntity(recordId: $recordId, recordTypeFromLock: $recordTypeFromLock, recordType: $recordType, success: $success, lockDate: $lockDate, serverDate: $serverDate)';
}


}

/// @nodoc
abstract mixin class _$DoorSensorRecordEntityCopyWith<$Res> implements $DoorSensorRecordEntityCopyWith<$Res> {
  factory _$DoorSensorRecordEntityCopyWith(_DoorSensorRecordEntity value, $Res Function(_DoorSensorRecordEntity) _then) = __$DoorSensorRecordEntityCopyWithImpl;
@override @useResult
$Res call({
 int recordId, int recordTypeFromLock, int recordType, bool success, DateTime? lockDate, DateTime? serverDate
});




}
/// @nodoc
class __$DoorSensorRecordEntityCopyWithImpl<$Res>
    implements _$DoorSensorRecordEntityCopyWith<$Res> {
  __$DoorSensorRecordEntityCopyWithImpl(this._self, this._then);

  final _DoorSensorRecordEntity _self;
  final $Res Function(_DoorSensorRecordEntity) _then;

/// Create a copy of DoorSensorRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recordId = null,Object? recordTypeFromLock = null,Object? recordType = null,Object? success = null,Object? lockDate = freezed,Object? serverDate = freezed,}) {
  return _then(_DoorSensorRecordEntity(
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

// dart format on
