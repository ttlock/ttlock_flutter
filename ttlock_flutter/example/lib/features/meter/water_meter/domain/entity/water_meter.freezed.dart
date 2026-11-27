// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_meter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaterMeterEntity {

 int get waterMeterId; bool get online; int get rssi; MeterOnOff get onOff; String get name; String get number; MeterPayMode get payMode; String get totalM3; String get remainderM3; String get price; int get electricQuantity; String get mac; String get featureValue; String get maxPower; String get modelNum; String get hardwareRevision; String get firmwareRevision; String get syncM3Date; String get groupName; int get groupId;
/// Create a copy of WaterMeterEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterEntityCopyWith<WaterMeterEntity> get copyWith => _$WaterMeterEntityCopyWithImpl<WaterMeterEntity>(this as WaterMeterEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterEntity&&(identical(other.waterMeterId, waterMeterId) || other.waterMeterId == waterMeterId)&&(identical(other.online, online) || other.online == online)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.onOff, onOff) || other.onOff == onOff)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.payMode, payMode) || other.payMode == payMode)&&(identical(other.totalM3, totalM3) || other.totalM3 == totalM3)&&(identical(other.remainderM3, remainderM3) || other.remainderM3 == remainderM3)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.maxPower, maxPower) || other.maxPower == maxPower)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.syncM3Date, syncM3Date) || other.syncM3Date == syncM3Date)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}


@override
int get hashCode => Object.hashAll([runtimeType,waterMeterId,online,rssi,onOff,name,number,payMode,totalM3,remainderM3,price,electricQuantity,mac,featureValue,maxPower,modelNum,hardwareRevision,firmwareRevision,syncM3Date,groupName,groupId]);

@override
String toString() {
  return 'WaterMeterEntity(waterMeterId: $waterMeterId, online: $online, rssi: $rssi, onOff: $onOff, name: $name, number: $number, payMode: $payMode, totalM3: $totalM3, remainderM3: $remainderM3, price: $price, electricQuantity: $electricQuantity, mac: $mac, featureValue: $featureValue, maxPower: $maxPower, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, syncM3Date: $syncM3Date, groupName: $groupName, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class $WaterMeterEntityCopyWith<$Res>  {
  factory $WaterMeterEntityCopyWith(WaterMeterEntity value, $Res Function(WaterMeterEntity) _then) = _$WaterMeterEntityCopyWithImpl;
@useResult
$Res call({
 int waterMeterId, bool online, int rssi, MeterOnOff onOff, String name, String number, MeterPayMode payMode, String totalM3, String remainderM3, String price, int electricQuantity, String mac, String featureValue, String maxPower, String modelNum, String hardwareRevision, String firmwareRevision, String syncM3Date, String groupName, int groupId
});




}
/// @nodoc
class _$WaterMeterEntityCopyWithImpl<$Res>
    implements $WaterMeterEntityCopyWith<$Res> {
  _$WaterMeterEntityCopyWithImpl(this._self, this._then);

  final WaterMeterEntity _self;
  final $Res Function(WaterMeterEntity) _then;

/// Create a copy of WaterMeterEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? waterMeterId = null,Object? online = null,Object? rssi = null,Object? onOff = null,Object? name = null,Object? number = null,Object? payMode = null,Object? totalM3 = null,Object? remainderM3 = null,Object? price = null,Object? electricQuantity = null,Object? mac = null,Object? featureValue = null,Object? maxPower = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? syncM3Date = null,Object? groupName = null,Object? groupId = null,}) {
  return _then(_self.copyWith(
waterMeterId: null == waterMeterId ? _self.waterMeterId : waterMeterId // ignore: cast_nullable_to_non_nullable
as int,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,onOff: null == onOff ? _self.onOff : onOff // ignore: cast_nullable_to_non_nullable
as MeterOnOff,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,payMode: null == payMode ? _self.payMode : payMode // ignore: cast_nullable_to_non_nullable
as MeterPayMode,totalM3: null == totalM3 ? _self.totalM3 : totalM3 // ignore: cast_nullable_to_non_nullable
as String,remainderM3: null == remainderM3 ? _self.remainderM3 : remainderM3 // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,maxPower: null == maxPower ? _self.maxPower : maxPower // ignore: cast_nullable_to_non_nullable
as String,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,syncM3Date: null == syncM3Date ? _self.syncM3Date : syncM3Date // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterEntity].
extension WaterMeterEntityPatterns on WaterMeterEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterEntity value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int waterMeterId,  bool online,  int rssi,  MeterOnOff onOff,  String name,  String number,  MeterPayMode payMode,  String totalM3,  String remainderM3,  String price,  int electricQuantity,  String mac,  String featureValue,  String maxPower,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String syncM3Date,  String groupName,  int groupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterEntity() when $default != null:
return $default(_that.waterMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalM3,_that.remainderM3,_that.price,_that.electricQuantity,_that.mac,_that.featureValue,_that.maxPower,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncM3Date,_that.groupName,_that.groupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int waterMeterId,  bool online,  int rssi,  MeterOnOff onOff,  String name,  String number,  MeterPayMode payMode,  String totalM3,  String remainderM3,  String price,  int electricQuantity,  String mac,  String featureValue,  String maxPower,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String syncM3Date,  String groupName,  int groupId)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterEntity():
return $default(_that.waterMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalM3,_that.remainderM3,_that.price,_that.electricQuantity,_that.mac,_that.featureValue,_that.maxPower,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncM3Date,_that.groupName,_that.groupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int waterMeterId,  bool online,  int rssi,  MeterOnOff onOff,  String name,  String number,  MeterPayMode payMode,  String totalM3,  String remainderM3,  String price,  int electricQuantity,  String mac,  String featureValue,  String maxPower,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String syncM3Date,  String groupName,  int groupId)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterEntity() when $default != null:
return $default(_that.waterMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalM3,_that.remainderM3,_that.price,_that.electricQuantity,_that.mac,_that.featureValue,_that.maxPower,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncM3Date,_that.groupName,_that.groupId);case _:
  return null;

}
}

}

/// @nodoc


class _WaterMeterEntity extends WaterMeterEntity {
  const _WaterMeterEntity({this.waterMeterId = 0, this.online = false, this.rssi = 0, this.onOff = MeterOnOff.unknown, this.name = '', this.number = '', this.payMode = MeterPayMode.energy, this.totalM3 = '', this.remainderM3 = '', this.price = '', this.electricQuantity = 0, this.mac = '', this.featureValue = '', this.maxPower = '', this.modelNum = '', this.hardwareRevision = '', this.firmwareRevision = '', this.syncM3Date = '', this.groupName = '', this.groupId = 0}): super._();
  

@override@JsonKey() final  int waterMeterId;
@override@JsonKey() final  bool online;
@override@JsonKey() final  int rssi;
@override@JsonKey() final  MeterOnOff onOff;
@override@JsonKey() final  String name;
@override@JsonKey() final  String number;
@override@JsonKey() final  MeterPayMode payMode;
@override@JsonKey() final  String totalM3;
@override@JsonKey() final  String remainderM3;
@override@JsonKey() final  String price;
@override@JsonKey() final  int electricQuantity;
@override@JsonKey() final  String mac;
@override@JsonKey() final  String featureValue;
@override@JsonKey() final  String maxPower;
@override@JsonKey() final  String modelNum;
@override@JsonKey() final  String hardwareRevision;
@override@JsonKey() final  String firmwareRevision;
@override@JsonKey() final  String syncM3Date;
@override@JsonKey() final  String groupName;
@override@JsonKey() final  int groupId;

/// Create a copy of WaterMeterEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterEntityCopyWith<_WaterMeterEntity> get copyWith => __$WaterMeterEntityCopyWithImpl<_WaterMeterEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterEntity&&(identical(other.waterMeterId, waterMeterId) || other.waterMeterId == waterMeterId)&&(identical(other.online, online) || other.online == online)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.onOff, onOff) || other.onOff == onOff)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.payMode, payMode) || other.payMode == payMode)&&(identical(other.totalM3, totalM3) || other.totalM3 == totalM3)&&(identical(other.remainderM3, remainderM3) || other.remainderM3 == remainderM3)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.maxPower, maxPower) || other.maxPower == maxPower)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.syncM3Date, syncM3Date) || other.syncM3Date == syncM3Date)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}


@override
int get hashCode => Object.hashAll([runtimeType,waterMeterId,online,rssi,onOff,name,number,payMode,totalM3,remainderM3,price,electricQuantity,mac,featureValue,maxPower,modelNum,hardwareRevision,firmwareRevision,syncM3Date,groupName,groupId]);

@override
String toString() {
  return 'WaterMeterEntity(waterMeterId: $waterMeterId, online: $online, rssi: $rssi, onOff: $onOff, name: $name, number: $number, payMode: $payMode, totalM3: $totalM3, remainderM3: $remainderM3, price: $price, electricQuantity: $electricQuantity, mac: $mac, featureValue: $featureValue, maxPower: $maxPower, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, syncM3Date: $syncM3Date, groupName: $groupName, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterEntityCopyWith<$Res> implements $WaterMeterEntityCopyWith<$Res> {
  factory _$WaterMeterEntityCopyWith(_WaterMeterEntity value, $Res Function(_WaterMeterEntity) _then) = __$WaterMeterEntityCopyWithImpl;
@override @useResult
$Res call({
 int waterMeterId, bool online, int rssi, MeterOnOff onOff, String name, String number, MeterPayMode payMode, String totalM3, String remainderM3, String price, int electricQuantity, String mac, String featureValue, String maxPower, String modelNum, String hardwareRevision, String firmwareRevision, String syncM3Date, String groupName, int groupId
});




}
/// @nodoc
class __$WaterMeterEntityCopyWithImpl<$Res>
    implements _$WaterMeterEntityCopyWith<$Res> {
  __$WaterMeterEntityCopyWithImpl(this._self, this._then);

  final _WaterMeterEntity _self;
  final $Res Function(_WaterMeterEntity) _then;

/// Create a copy of WaterMeterEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? waterMeterId = null,Object? online = null,Object? rssi = null,Object? onOff = null,Object? name = null,Object? number = null,Object? payMode = null,Object? totalM3 = null,Object? remainderM3 = null,Object? price = null,Object? electricQuantity = null,Object? mac = null,Object? featureValue = null,Object? maxPower = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? syncM3Date = null,Object? groupName = null,Object? groupId = null,}) {
  return _then(_WaterMeterEntity(
waterMeterId: null == waterMeterId ? _self.waterMeterId : waterMeterId // ignore: cast_nullable_to_non_nullable
as int,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,onOff: null == onOff ? _self.onOff : onOff // ignore: cast_nullable_to_non_nullable
as MeterOnOff,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,payMode: null == payMode ? _self.payMode : payMode // ignore: cast_nullable_to_non_nullable
as MeterPayMode,totalM3: null == totalM3 ? _self.totalM3 : totalM3 // ignore: cast_nullable_to_non_nullable
as String,remainderM3: null == remainderM3 ? _self.remainderM3 : remainderM3 // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,maxPower: null == maxPower ? _self.maxPower : maxPower // ignore: cast_nullable_to_non_nullable
as String,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,syncM3Date: null == syncM3Date ? _self.syncM3Date : syncM3Date // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$WaterMeterRecordEntity {

 int get dateType; String get usedM3; String get createDate;
/// Create a copy of WaterMeterRecordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterRecordEntityCopyWith<WaterMeterRecordEntity> get copyWith => _$WaterMeterRecordEntityCopyWithImpl<WaterMeterRecordEntity>(this as WaterMeterRecordEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterRecordEntity&&(identical(other.dateType, dateType) || other.dateType == dateType)&&(identical(other.usedM3, usedM3) || other.usedM3 == usedM3)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,dateType,usedM3,createDate);

@override
String toString() {
  return 'WaterMeterRecordEntity(dateType: $dateType, usedM3: $usedM3, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $WaterMeterRecordEntityCopyWith<$Res>  {
  factory $WaterMeterRecordEntityCopyWith(WaterMeterRecordEntity value, $Res Function(WaterMeterRecordEntity) _then) = _$WaterMeterRecordEntityCopyWithImpl;
@useResult
$Res call({
 int dateType, String usedM3, String createDate
});




}
/// @nodoc
class _$WaterMeterRecordEntityCopyWithImpl<$Res>
    implements $WaterMeterRecordEntityCopyWith<$Res> {
  _$WaterMeterRecordEntityCopyWithImpl(this._self, this._then);

  final WaterMeterRecordEntity _self;
  final $Res Function(WaterMeterRecordEntity) _then;

/// Create a copy of WaterMeterRecordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateType = null,Object? usedM3 = null,Object? createDate = null,}) {
  return _then(_self.copyWith(
dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as int,usedM3: null == usedM3 ? _self.usedM3 : usedM3 // ignore: cast_nullable_to_non_nullable
as String,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterRecordEntity].
extension WaterMeterRecordEntityPatterns on WaterMeterRecordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterRecordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterRecordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterRecordEntity value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterRecordEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterRecordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterRecordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dateType,  String usedM3,  String createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterRecordEntity() when $default != null:
return $default(_that.dateType,_that.usedM3,_that.createDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dateType,  String usedM3,  String createDate)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterRecordEntity():
return $default(_that.dateType,_that.usedM3,_that.createDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dateType,  String usedM3,  String createDate)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterRecordEntity() when $default != null:
return $default(_that.dateType,_that.usedM3,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc


class _WaterMeterRecordEntity extends WaterMeterRecordEntity {
  const _WaterMeterRecordEntity({this.dateType = 0, this.usedM3 = '', this.createDate = ''}): super._();
  

@override@JsonKey() final  int dateType;
@override@JsonKey() final  String usedM3;
@override@JsonKey() final  String createDate;

/// Create a copy of WaterMeterRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterRecordEntityCopyWith<_WaterMeterRecordEntity> get copyWith => __$WaterMeterRecordEntityCopyWithImpl<_WaterMeterRecordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterRecordEntity&&(identical(other.dateType, dateType) || other.dateType == dateType)&&(identical(other.usedM3, usedM3) || other.usedM3 == usedM3)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,dateType,usedM3,createDate);

@override
String toString() {
  return 'WaterMeterRecordEntity(dateType: $dateType, usedM3: $usedM3, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterRecordEntityCopyWith<$Res> implements $WaterMeterRecordEntityCopyWith<$Res> {
  factory _$WaterMeterRecordEntityCopyWith(_WaterMeterRecordEntity value, $Res Function(_WaterMeterRecordEntity) _then) = __$WaterMeterRecordEntityCopyWithImpl;
@override @useResult
$Res call({
 int dateType, String usedM3, String createDate
});




}
/// @nodoc
class __$WaterMeterRecordEntityCopyWithImpl<$Res>
    implements _$WaterMeterRecordEntityCopyWith<$Res> {
  __$WaterMeterRecordEntityCopyWithImpl(this._self, this._then);

  final _WaterMeterRecordEntity _self;
  final $Res Function(_WaterMeterRecordEntity) _then;

/// Create a copy of WaterMeterRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateType = null,Object? usedM3 = null,Object? createDate = null,}) {
  return _then(_WaterMeterRecordEntity(
dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as int,usedM3: null == usedM3 ? _self.usedM3 : usedM3 // ignore: cast_nullable_to_non_nullable
as String,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
