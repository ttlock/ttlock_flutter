// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_meter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ElectricMeterEntity {

 int get electricMeterId; bool get online; int get rssi; MeterOnOff get onOff; String get name; String get number; MeterPayMode get payMode; String get totalKwh; String get remainderKwh; String get price; int get electricQuantity; String get maxPower; String get featureValue; String get mac; String get modelNum; String get hardwareRevision; String get firmwareRevision; DateTime? get syncKwhDate; String get groupName; int get groupId;
/// Create a copy of ElectricMeterEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterEntityCopyWith<ElectricMeterEntity> get copyWith => _$ElectricMeterEntityCopyWithImpl<ElectricMeterEntity>(this as ElectricMeterEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterEntity&&(identical(other.electricMeterId, electricMeterId) || other.electricMeterId == electricMeterId)&&(identical(other.online, online) || other.online == online)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.onOff, onOff) || other.onOff == onOff)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.payMode, payMode) || other.payMode == payMode)&&(identical(other.totalKwh, totalKwh) || other.totalKwh == totalKwh)&&(identical(other.remainderKwh, remainderKwh) || other.remainderKwh == remainderKwh)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.maxPower, maxPower) || other.maxPower == maxPower)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.syncKwhDate, syncKwhDate) || other.syncKwhDate == syncKwhDate)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}


@override
int get hashCode => Object.hashAll([runtimeType,electricMeterId,online,rssi,onOff,name,number,payMode,totalKwh,remainderKwh,price,electricQuantity,maxPower,featureValue,mac,modelNum,hardwareRevision,firmwareRevision,syncKwhDate,groupName,groupId]);

@override
String toString() {
  return 'ElectricMeterEntity(electricMeterId: $electricMeterId, online: $online, rssi: $rssi, onOff: $onOff, name: $name, number: $number, payMode: $payMode, totalKwh: $totalKwh, remainderKwh: $remainderKwh, price: $price, electricQuantity: $electricQuantity, maxPower: $maxPower, featureValue: $featureValue, mac: $mac, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, syncKwhDate: $syncKwhDate, groupName: $groupName, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterEntityCopyWith<$Res>  {
  factory $ElectricMeterEntityCopyWith(ElectricMeterEntity value, $Res Function(ElectricMeterEntity) _then) = _$ElectricMeterEntityCopyWithImpl;
@useResult
$Res call({
 int electricMeterId, bool online, int rssi, MeterOnOff onOff, String name, String number, MeterPayMode payMode, String totalKwh, String remainderKwh, String price, int electricQuantity, String maxPower, String featureValue, String mac, String modelNum, String hardwareRevision, String firmwareRevision, DateTime? syncKwhDate, String groupName, int groupId
});




}
/// @nodoc
class _$ElectricMeterEntityCopyWithImpl<$Res>
    implements $ElectricMeterEntityCopyWith<$Res> {
  _$ElectricMeterEntityCopyWithImpl(this._self, this._then);

  final ElectricMeterEntity _self;
  final $Res Function(ElectricMeterEntity) _then;

/// Create a copy of ElectricMeterEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? electricMeterId = null,Object? online = null,Object? rssi = null,Object? onOff = null,Object? name = null,Object? number = null,Object? payMode = null,Object? totalKwh = null,Object? remainderKwh = null,Object? price = null,Object? electricQuantity = null,Object? maxPower = null,Object? featureValue = null,Object? mac = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? syncKwhDate = freezed,Object? groupName = null,Object? groupId = null,}) {
  return _then(_self.copyWith(
electricMeterId: null == electricMeterId ? _self.electricMeterId : electricMeterId // ignore: cast_nullable_to_non_nullable
as int,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,onOff: null == onOff ? _self.onOff : onOff // ignore: cast_nullable_to_non_nullable
as MeterOnOff,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,payMode: null == payMode ? _self.payMode : payMode // ignore: cast_nullable_to_non_nullable
as MeterPayMode,totalKwh: null == totalKwh ? _self.totalKwh : totalKwh // ignore: cast_nullable_to_non_nullable
as String,remainderKwh: null == remainderKwh ? _self.remainderKwh : remainderKwh // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,maxPower: null == maxPower ? _self.maxPower : maxPower // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,syncKwhDate: freezed == syncKwhDate ? _self.syncKwhDate : syncKwhDate // ignore: cast_nullable_to_non_nullable
as DateTime?,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricMeterEntity].
extension ElectricMeterEntityPatterns on ElectricMeterEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterEntity value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int electricMeterId,  bool online,  int rssi,  MeterOnOff onOff,  String name,  String number,  MeterPayMode payMode,  String totalKwh,  String remainderKwh,  String price,  int electricQuantity,  String maxPower,  String featureValue,  String mac,  String modelNum,  String hardwareRevision,  String firmwareRevision,  DateTime? syncKwhDate,  String groupName,  int groupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterEntity() when $default != null:
return $default(_that.electricMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalKwh,_that.remainderKwh,_that.price,_that.electricQuantity,_that.maxPower,_that.featureValue,_that.mac,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncKwhDate,_that.groupName,_that.groupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int electricMeterId,  bool online,  int rssi,  MeterOnOff onOff,  String name,  String number,  MeterPayMode payMode,  String totalKwh,  String remainderKwh,  String price,  int electricQuantity,  String maxPower,  String featureValue,  String mac,  String modelNum,  String hardwareRevision,  String firmwareRevision,  DateTime? syncKwhDate,  String groupName,  int groupId)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterEntity():
return $default(_that.electricMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalKwh,_that.remainderKwh,_that.price,_that.electricQuantity,_that.maxPower,_that.featureValue,_that.mac,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncKwhDate,_that.groupName,_that.groupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int electricMeterId,  bool online,  int rssi,  MeterOnOff onOff,  String name,  String number,  MeterPayMode payMode,  String totalKwh,  String remainderKwh,  String price,  int electricQuantity,  String maxPower,  String featureValue,  String mac,  String modelNum,  String hardwareRevision,  String firmwareRevision,  DateTime? syncKwhDate,  String groupName,  int groupId)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterEntity() when $default != null:
return $default(_that.electricMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalKwh,_that.remainderKwh,_that.price,_that.electricQuantity,_that.maxPower,_that.featureValue,_that.mac,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncKwhDate,_that.groupName,_that.groupId);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricMeterEntity extends ElectricMeterEntity {
  const _ElectricMeterEntity({this.electricMeterId = 0, this.online = false, this.rssi = 0, this.onOff = MeterOnOff.unknown, this.name = '', this.number = '', this.payMode = MeterPayMode.energy, this.totalKwh = '', this.remainderKwh = '', this.price = '', this.electricQuantity = 0, this.maxPower = '', this.featureValue = '', this.mac = '', this.modelNum = '', this.hardwareRevision = '', this.firmwareRevision = '', this.syncKwhDate, this.groupName = '', this.groupId = 0}): super._();
  

@override@JsonKey() final  int electricMeterId;
@override@JsonKey() final  bool online;
@override@JsonKey() final  int rssi;
@override@JsonKey() final  MeterOnOff onOff;
@override@JsonKey() final  String name;
@override@JsonKey() final  String number;
@override@JsonKey() final  MeterPayMode payMode;
@override@JsonKey() final  String totalKwh;
@override@JsonKey() final  String remainderKwh;
@override@JsonKey() final  String price;
@override@JsonKey() final  int electricQuantity;
@override@JsonKey() final  String maxPower;
@override@JsonKey() final  String featureValue;
@override@JsonKey() final  String mac;
@override@JsonKey() final  String modelNum;
@override@JsonKey() final  String hardwareRevision;
@override@JsonKey() final  String firmwareRevision;
@override final  DateTime? syncKwhDate;
@override@JsonKey() final  String groupName;
@override@JsonKey() final  int groupId;

/// Create a copy of ElectricMeterEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterEntityCopyWith<_ElectricMeterEntity> get copyWith => __$ElectricMeterEntityCopyWithImpl<_ElectricMeterEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterEntity&&(identical(other.electricMeterId, electricMeterId) || other.electricMeterId == electricMeterId)&&(identical(other.online, online) || other.online == online)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.onOff, onOff) || other.onOff == onOff)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.payMode, payMode) || other.payMode == payMode)&&(identical(other.totalKwh, totalKwh) || other.totalKwh == totalKwh)&&(identical(other.remainderKwh, remainderKwh) || other.remainderKwh == remainderKwh)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.maxPower, maxPower) || other.maxPower == maxPower)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.syncKwhDate, syncKwhDate) || other.syncKwhDate == syncKwhDate)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}


@override
int get hashCode => Object.hashAll([runtimeType,electricMeterId,online,rssi,onOff,name,number,payMode,totalKwh,remainderKwh,price,electricQuantity,maxPower,featureValue,mac,modelNum,hardwareRevision,firmwareRevision,syncKwhDate,groupName,groupId]);

@override
String toString() {
  return 'ElectricMeterEntity(electricMeterId: $electricMeterId, online: $online, rssi: $rssi, onOff: $onOff, name: $name, number: $number, payMode: $payMode, totalKwh: $totalKwh, remainderKwh: $remainderKwh, price: $price, electricQuantity: $electricQuantity, maxPower: $maxPower, featureValue: $featureValue, mac: $mac, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, syncKwhDate: $syncKwhDate, groupName: $groupName, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterEntityCopyWith<$Res> implements $ElectricMeterEntityCopyWith<$Res> {
  factory _$ElectricMeterEntityCopyWith(_ElectricMeterEntity value, $Res Function(_ElectricMeterEntity) _then) = __$ElectricMeterEntityCopyWithImpl;
@override @useResult
$Res call({
 int electricMeterId, bool online, int rssi, MeterOnOff onOff, String name, String number, MeterPayMode payMode, String totalKwh, String remainderKwh, String price, int electricQuantity, String maxPower, String featureValue, String mac, String modelNum, String hardwareRevision, String firmwareRevision, DateTime? syncKwhDate, String groupName, int groupId
});




}
/// @nodoc
class __$ElectricMeterEntityCopyWithImpl<$Res>
    implements _$ElectricMeterEntityCopyWith<$Res> {
  __$ElectricMeterEntityCopyWithImpl(this._self, this._then);

  final _ElectricMeterEntity _self;
  final $Res Function(_ElectricMeterEntity) _then;

/// Create a copy of ElectricMeterEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? electricMeterId = null,Object? online = null,Object? rssi = null,Object? onOff = null,Object? name = null,Object? number = null,Object? payMode = null,Object? totalKwh = null,Object? remainderKwh = null,Object? price = null,Object? electricQuantity = null,Object? maxPower = null,Object? featureValue = null,Object? mac = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? syncKwhDate = freezed,Object? groupName = null,Object? groupId = null,}) {
  return _then(_ElectricMeterEntity(
electricMeterId: null == electricMeterId ? _self.electricMeterId : electricMeterId // ignore: cast_nullable_to_non_nullable
as int,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,onOff: null == onOff ? _self.onOff : onOff // ignore: cast_nullable_to_non_nullable
as MeterOnOff,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,payMode: null == payMode ? _self.payMode : payMode // ignore: cast_nullable_to_non_nullable
as MeterPayMode,totalKwh: null == totalKwh ? _self.totalKwh : totalKwh // ignore: cast_nullable_to_non_nullable
as String,remainderKwh: null == remainderKwh ? _self.remainderKwh : remainderKwh // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,maxPower: null == maxPower ? _self.maxPower : maxPower // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,syncKwhDate: freezed == syncKwhDate ? _self.syncKwhDate : syncKwhDate // ignore: cast_nullable_to_non_nullable
as DateTime?,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ElectricMeterUsageRecordEntity {

 int get dateType; String get usedKwh; String get createDate;
/// Create a copy of ElectricMeterUsageRecordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterUsageRecordEntityCopyWith<ElectricMeterUsageRecordEntity> get copyWith => _$ElectricMeterUsageRecordEntityCopyWithImpl<ElectricMeterUsageRecordEntity>(this as ElectricMeterUsageRecordEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterUsageRecordEntity&&(identical(other.dateType, dateType) || other.dateType == dateType)&&(identical(other.usedKwh, usedKwh) || other.usedKwh == usedKwh)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,dateType,usedKwh,createDate);

@override
String toString() {
  return 'ElectricMeterUsageRecordEntity(dateType: $dateType, usedKwh: $usedKwh, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterUsageRecordEntityCopyWith<$Res>  {
  factory $ElectricMeterUsageRecordEntityCopyWith(ElectricMeterUsageRecordEntity value, $Res Function(ElectricMeterUsageRecordEntity) _then) = _$ElectricMeterUsageRecordEntityCopyWithImpl;
@useResult
$Res call({
 int dateType, String usedKwh, String createDate
});




}
/// @nodoc
class _$ElectricMeterUsageRecordEntityCopyWithImpl<$Res>
    implements $ElectricMeterUsageRecordEntityCopyWith<$Res> {
  _$ElectricMeterUsageRecordEntityCopyWithImpl(this._self, this._then);

  final ElectricMeterUsageRecordEntity _self;
  final $Res Function(ElectricMeterUsageRecordEntity) _then;

/// Create a copy of ElectricMeterUsageRecordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateType = null,Object? usedKwh = null,Object? createDate = null,}) {
  return _then(_self.copyWith(
dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as int,usedKwh: null == usedKwh ? _self.usedKwh : usedKwh // ignore: cast_nullable_to_non_nullable
as String,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricMeterUsageRecordEntity].
extension ElectricMeterUsageRecordEntityPatterns on ElectricMeterUsageRecordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterUsageRecordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterUsageRecordEntity value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterUsageRecordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dateType,  String usedKwh,  String createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordEntity() when $default != null:
return $default(_that.dateType,_that.usedKwh,_that.createDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dateType,  String usedKwh,  String createDate)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordEntity():
return $default(_that.dateType,_that.usedKwh,_that.createDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dateType,  String usedKwh,  String createDate)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordEntity() when $default != null:
return $default(_that.dateType,_that.usedKwh,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc


class _ElectricMeterUsageRecordEntity implements ElectricMeterUsageRecordEntity {
  const _ElectricMeterUsageRecordEntity({this.dateType = 0, this.usedKwh = '', this.createDate = ''});
  

@override@JsonKey() final  int dateType;
@override@JsonKey() final  String usedKwh;
@override@JsonKey() final  String createDate;

/// Create a copy of ElectricMeterUsageRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterUsageRecordEntityCopyWith<_ElectricMeterUsageRecordEntity> get copyWith => __$ElectricMeterUsageRecordEntityCopyWithImpl<_ElectricMeterUsageRecordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterUsageRecordEntity&&(identical(other.dateType, dateType) || other.dateType == dateType)&&(identical(other.usedKwh, usedKwh) || other.usedKwh == usedKwh)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}


@override
int get hashCode => Object.hash(runtimeType,dateType,usedKwh,createDate);

@override
String toString() {
  return 'ElectricMeterUsageRecordEntity(dateType: $dateType, usedKwh: $usedKwh, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterUsageRecordEntityCopyWith<$Res> implements $ElectricMeterUsageRecordEntityCopyWith<$Res> {
  factory _$ElectricMeterUsageRecordEntityCopyWith(_ElectricMeterUsageRecordEntity value, $Res Function(_ElectricMeterUsageRecordEntity) _then) = __$ElectricMeterUsageRecordEntityCopyWithImpl;
@override @useResult
$Res call({
 int dateType, String usedKwh, String createDate
});




}
/// @nodoc
class __$ElectricMeterUsageRecordEntityCopyWithImpl<$Res>
    implements _$ElectricMeterUsageRecordEntityCopyWith<$Res> {
  __$ElectricMeterUsageRecordEntityCopyWithImpl(this._self, this._then);

  final _ElectricMeterUsageRecordEntity _self;
  final $Res Function(_ElectricMeterUsageRecordEntity) _then;

/// Create a copy of ElectricMeterUsageRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateType = null,Object? usedKwh = null,Object? createDate = null,}) {
  return _then(_ElectricMeterUsageRecordEntity(
dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as int,usedKwh: null == usedKwh ? _self.usedKwh : usedKwh // ignore: cast_nullable_to_non_nullable
as String,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
