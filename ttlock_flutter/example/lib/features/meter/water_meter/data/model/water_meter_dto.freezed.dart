// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_meter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WaterMeterDto {

@JsonKey(name: 'waterMeterId', fromJson: intFromDynamic) int get waterMeterId;@JsonKey(name: 'online', fromJson: boolFromDynamic) bool get online;@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi;@JsonKey(name: 'onOff', fromJson: _onOffFromJson) MeterOnOff get onOff;@JsonKey(name: 'name') String get name;@JsonKey(name: 'number') String get number;@JsonKey(name: 'payMode', fromJson: _payModeFromJson) MeterPayMode get payMode;@JsonKey(name: 'totalM3', fromJson: stringFromDynamic) String get totalM3;@JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) String get remainderM3;@JsonKey(name: 'price', fromJson: stringFromDynamic) String get price;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;@JsonKey(name: 'mac') String get mac;@JsonKey(name: 'featureValue') String get featureValue;@JsonKey(name: 'modelNum') String get modelNum;@JsonKey(name: 'hardwareRevision') String get hardwareRevision;@JsonKey(name: 'firmwareRevision') String get firmwareRevision;@JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic) String get syncM3Date;@JsonKey(name: 'maxPower', fromJson: stringFromDynamic) String get maxPower;@JsonKey(name: 'groupName') String get groupName;@JsonKey(name: 'groupId', fromJson: intFromDynamic) int get groupId;
/// Create a copy of WaterMeterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterDtoCopyWith<WaterMeterDto> get copyWith => _$WaterMeterDtoCopyWithImpl<WaterMeterDto>(this as WaterMeterDto, _$identity);

  /// Serializes this WaterMeterDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterDto&&(identical(other.waterMeterId, waterMeterId) || other.waterMeterId == waterMeterId)&&(identical(other.online, online) || other.online == online)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.onOff, onOff) || other.onOff == onOff)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.payMode, payMode) || other.payMode == payMode)&&(identical(other.totalM3, totalM3) || other.totalM3 == totalM3)&&(identical(other.remainderM3, remainderM3) || other.remainderM3 == remainderM3)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.syncM3Date, syncM3Date) || other.syncM3Date == syncM3Date)&&(identical(other.maxPower, maxPower) || other.maxPower == maxPower)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,waterMeterId,online,rssi,onOff,name,number,payMode,totalM3,remainderM3,price,electricQuantity,mac,featureValue,modelNum,hardwareRevision,firmwareRevision,syncM3Date,maxPower,groupName,groupId]);

@override
String toString() {
  return 'WaterMeterDto(waterMeterId: $waterMeterId, online: $online, rssi: $rssi, onOff: $onOff, name: $name, number: $number, payMode: $payMode, totalM3: $totalM3, remainderM3: $remainderM3, price: $price, electricQuantity: $electricQuantity, mac: $mac, featureValue: $featureValue, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, syncM3Date: $syncM3Date, maxPower: $maxPower, groupName: $groupName, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class $WaterMeterDtoCopyWith<$Res>  {
  factory $WaterMeterDtoCopyWith(WaterMeterDto value, $Res Function(WaterMeterDto) _then) = _$WaterMeterDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'waterMeterId', fromJson: intFromDynamic) int waterMeterId,@JsonKey(name: 'online', fromJson: boolFromDynamic) bool online,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'onOff', fromJson: _onOffFromJson) MeterOnOff onOff,@JsonKey(name: 'name') String name,@JsonKey(name: 'number') String number,@JsonKey(name: 'payMode', fromJson: _payModeFromJson) MeterPayMode payMode,@JsonKey(name: 'totalM3', fromJson: stringFromDynamic) String totalM3,@JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) String remainderM3,@JsonKey(name: 'price', fromJson: stringFromDynamic) String price,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'mac') String mac,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'modelNum') String modelNum,@JsonKey(name: 'hardwareRevision') String hardwareRevision,@JsonKey(name: 'firmwareRevision') String firmwareRevision,@JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic) String syncM3Date,@JsonKey(name: 'maxPower', fromJson: stringFromDynamic) String maxPower,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId
});




}
/// @nodoc
class _$WaterMeterDtoCopyWithImpl<$Res>
    implements $WaterMeterDtoCopyWith<$Res> {
  _$WaterMeterDtoCopyWithImpl(this._self, this._then);

  final WaterMeterDto _self;
  final $Res Function(WaterMeterDto) _then;

/// Create a copy of WaterMeterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? waterMeterId = null,Object? online = null,Object? rssi = null,Object? onOff = null,Object? name = null,Object? number = null,Object? payMode = null,Object? totalM3 = null,Object? remainderM3 = null,Object? price = null,Object? electricQuantity = null,Object? mac = null,Object? featureValue = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? syncM3Date = null,Object? maxPower = null,Object? groupName = null,Object? groupId = null,}) {
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
as String,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,syncM3Date: null == syncM3Date ? _self.syncM3Date : syncM3Date // ignore: cast_nullable_to_non_nullable
as String,maxPower: null == maxPower ? _self.maxPower : maxPower // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterDto].
extension WaterMeterDtoPatterns on WaterMeterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'waterMeterId', fromJson: intFromDynamic)  int waterMeterId, @JsonKey(name: 'online', fromJson: boolFromDynamic)  bool online, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'onOff', fromJson: _onOffFromJson)  MeterOnOff onOff, @JsonKey(name: 'name')  String name, @JsonKey(name: 'number')  String number, @JsonKey(name: 'payMode', fromJson: _payModeFromJson)  MeterPayMode payMode, @JsonKey(name: 'totalM3', fromJson: stringFromDynamic)  String totalM3, @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic)  String remainderM3, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision, @JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic)  String syncM3Date, @JsonKey(name: 'maxPower', fromJson: stringFromDynamic)  String maxPower, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterDto() when $default != null:
return $default(_that.waterMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalM3,_that.remainderM3,_that.price,_that.electricQuantity,_that.mac,_that.featureValue,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncM3Date,_that.maxPower,_that.groupName,_that.groupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'waterMeterId', fromJson: intFromDynamic)  int waterMeterId, @JsonKey(name: 'online', fromJson: boolFromDynamic)  bool online, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'onOff', fromJson: _onOffFromJson)  MeterOnOff onOff, @JsonKey(name: 'name')  String name, @JsonKey(name: 'number')  String number, @JsonKey(name: 'payMode', fromJson: _payModeFromJson)  MeterPayMode payMode, @JsonKey(name: 'totalM3', fromJson: stringFromDynamic)  String totalM3, @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic)  String remainderM3, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision, @JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic)  String syncM3Date, @JsonKey(name: 'maxPower', fromJson: stringFromDynamic)  String maxPower, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterDto():
return $default(_that.waterMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalM3,_that.remainderM3,_that.price,_that.electricQuantity,_that.mac,_that.featureValue,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncM3Date,_that.maxPower,_that.groupName,_that.groupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'waterMeterId', fromJson: intFromDynamic)  int waterMeterId, @JsonKey(name: 'online', fromJson: boolFromDynamic)  bool online, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'onOff', fromJson: _onOffFromJson)  MeterOnOff onOff, @JsonKey(name: 'name')  String name, @JsonKey(name: 'number')  String number, @JsonKey(name: 'payMode', fromJson: _payModeFromJson)  MeterPayMode payMode, @JsonKey(name: 'totalM3', fromJson: stringFromDynamic)  String totalM3, @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic)  String remainderM3, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision, @JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic)  String syncM3Date, @JsonKey(name: 'maxPower', fromJson: stringFromDynamic)  String maxPower, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterDto() when $default != null:
return $default(_that.waterMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalM3,_that.remainderM3,_that.price,_that.electricQuantity,_that.mac,_that.featureValue,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncM3Date,_that.maxPower,_that.groupName,_that.groupId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterMeterDto extends WaterMeterDto {
  const _WaterMeterDto({@JsonKey(name: 'waterMeterId', fromJson: intFromDynamic) this.waterMeterId = 0, @JsonKey(name: 'online', fromJson: boolFromDynamic) this.online = false, @JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, @JsonKey(name: 'onOff', fromJson: _onOffFromJson) this.onOff = MeterOnOff.unknown, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'number') this.number = '', @JsonKey(name: 'payMode', fromJson: _payModeFromJson) this.payMode = MeterPayMode.energy, @JsonKey(name: 'totalM3', fromJson: stringFromDynamic) this.totalM3 = '', @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) this.remainderM3 = '', @JsonKey(name: 'price', fromJson: stringFromDynamic) this.price = '', @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'mac') this.mac = '', @JsonKey(name: 'featureValue') this.featureValue = '', @JsonKey(name: 'modelNum') this.modelNum = '', @JsonKey(name: 'hardwareRevision') this.hardwareRevision = '', @JsonKey(name: 'firmwareRevision') this.firmwareRevision = '', @JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic) this.syncM3Date = '', @JsonKey(name: 'maxPower', fromJson: stringFromDynamic) this.maxPower = '', @JsonKey(name: 'groupName') this.groupName = '', @JsonKey(name: 'groupId', fromJson: intFromDynamic) this.groupId = 0}): super._();
  factory _WaterMeterDto.fromJson(Map<String, dynamic> json) => _$WaterMeterDtoFromJson(json);

@override@JsonKey(name: 'waterMeterId', fromJson: intFromDynamic) final  int waterMeterId;
@override@JsonKey(name: 'online', fromJson: boolFromDynamic) final  bool online;
@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey(name: 'onOff', fromJson: _onOffFromJson) final  MeterOnOff onOff;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'number') final  String number;
@override@JsonKey(name: 'payMode', fromJson: _payModeFromJson) final  MeterPayMode payMode;
@override@JsonKey(name: 'totalM3', fromJson: stringFromDynamic) final  String totalM3;
@override@JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) final  String remainderM3;
@override@JsonKey(name: 'price', fromJson: stringFromDynamic) final  String price;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
@override@JsonKey(name: 'mac') final  String mac;
@override@JsonKey(name: 'featureValue') final  String featureValue;
@override@JsonKey(name: 'modelNum') final  String modelNum;
@override@JsonKey(name: 'hardwareRevision') final  String hardwareRevision;
@override@JsonKey(name: 'firmwareRevision') final  String firmwareRevision;
@override@JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic) final  String syncM3Date;
@override@JsonKey(name: 'maxPower', fromJson: stringFromDynamic) final  String maxPower;
@override@JsonKey(name: 'groupName') final  String groupName;
@override@JsonKey(name: 'groupId', fromJson: intFromDynamic) final  int groupId;

/// Create a copy of WaterMeterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterDtoCopyWith<_WaterMeterDto> get copyWith => __$WaterMeterDtoCopyWithImpl<_WaterMeterDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterMeterDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterDto&&(identical(other.waterMeterId, waterMeterId) || other.waterMeterId == waterMeterId)&&(identical(other.online, online) || other.online == online)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.onOff, onOff) || other.onOff == onOff)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.payMode, payMode) || other.payMode == payMode)&&(identical(other.totalM3, totalM3) || other.totalM3 == totalM3)&&(identical(other.remainderM3, remainderM3) || other.remainderM3 == remainderM3)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.syncM3Date, syncM3Date) || other.syncM3Date == syncM3Date)&&(identical(other.maxPower, maxPower) || other.maxPower == maxPower)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,waterMeterId,online,rssi,onOff,name,number,payMode,totalM3,remainderM3,price,electricQuantity,mac,featureValue,modelNum,hardwareRevision,firmwareRevision,syncM3Date,maxPower,groupName,groupId]);

@override
String toString() {
  return 'WaterMeterDto(waterMeterId: $waterMeterId, online: $online, rssi: $rssi, onOff: $onOff, name: $name, number: $number, payMode: $payMode, totalM3: $totalM3, remainderM3: $remainderM3, price: $price, electricQuantity: $electricQuantity, mac: $mac, featureValue: $featureValue, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, syncM3Date: $syncM3Date, maxPower: $maxPower, groupName: $groupName, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterDtoCopyWith<$Res> implements $WaterMeterDtoCopyWith<$Res> {
  factory _$WaterMeterDtoCopyWith(_WaterMeterDto value, $Res Function(_WaterMeterDto) _then) = __$WaterMeterDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'waterMeterId', fromJson: intFromDynamic) int waterMeterId,@JsonKey(name: 'online', fromJson: boolFromDynamic) bool online,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'onOff', fromJson: _onOffFromJson) MeterOnOff onOff,@JsonKey(name: 'name') String name,@JsonKey(name: 'number') String number,@JsonKey(name: 'payMode', fromJson: _payModeFromJson) MeterPayMode payMode,@JsonKey(name: 'totalM3', fromJson: stringFromDynamic) String totalM3,@JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) String remainderM3,@JsonKey(name: 'price', fromJson: stringFromDynamic) String price,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'mac') String mac,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'modelNum') String modelNum,@JsonKey(name: 'hardwareRevision') String hardwareRevision,@JsonKey(name: 'firmwareRevision') String firmwareRevision,@JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic) String syncM3Date,@JsonKey(name: 'maxPower', fromJson: stringFromDynamic) String maxPower,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId
});




}
/// @nodoc
class __$WaterMeterDtoCopyWithImpl<$Res>
    implements _$WaterMeterDtoCopyWith<$Res> {
  __$WaterMeterDtoCopyWithImpl(this._self, this._then);

  final _WaterMeterDto _self;
  final $Res Function(_WaterMeterDto) _then;

/// Create a copy of WaterMeterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? waterMeterId = null,Object? online = null,Object? rssi = null,Object? onOff = null,Object? name = null,Object? number = null,Object? payMode = null,Object? totalM3 = null,Object? remainderM3 = null,Object? price = null,Object? electricQuantity = null,Object? mac = null,Object? featureValue = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? syncM3Date = null,Object? maxPower = null,Object? groupName = null,Object? groupId = null,}) {
  return _then(_WaterMeterDto(
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
as String,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,syncM3Date: null == syncM3Date ? _self.syncM3Date : syncM3Date // ignore: cast_nullable_to_non_nullable
as String,maxPower: null == maxPower ? _self.maxPower : maxPower // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WaterMeterRecordDto {

@JsonKey(name: 'dateType', fromJson: intFromDynamic) int get dateType;@JsonKey(name: 'usedM3', fromJson: stringFromDynamic) String get usedM3;@JsonKey(name: 'createDate', fromJson: stringFromDynamic) String get createDate;
/// Create a copy of WaterMeterRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterRecordDtoCopyWith<WaterMeterRecordDto> get copyWith => _$WaterMeterRecordDtoCopyWithImpl<WaterMeterRecordDto>(this as WaterMeterRecordDto, _$identity);

  /// Serializes this WaterMeterRecordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterRecordDto&&(identical(other.dateType, dateType) || other.dateType == dateType)&&(identical(other.usedM3, usedM3) || other.usedM3 == usedM3)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateType,usedM3,createDate);

@override
String toString() {
  return 'WaterMeterRecordDto(dateType: $dateType, usedM3: $usedM3, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $WaterMeterRecordDtoCopyWith<$Res>  {
  factory $WaterMeterRecordDtoCopyWith(WaterMeterRecordDto value, $Res Function(WaterMeterRecordDto) _then) = _$WaterMeterRecordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dateType', fromJson: intFromDynamic) int dateType,@JsonKey(name: 'usedM3', fromJson: stringFromDynamic) String usedM3,@JsonKey(name: 'createDate', fromJson: stringFromDynamic) String createDate
});




}
/// @nodoc
class _$WaterMeterRecordDtoCopyWithImpl<$Res>
    implements $WaterMeterRecordDtoCopyWith<$Res> {
  _$WaterMeterRecordDtoCopyWithImpl(this._self, this._then);

  final WaterMeterRecordDto _self;
  final $Res Function(WaterMeterRecordDto) _then;

/// Create a copy of WaterMeterRecordDto
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


/// Adds pattern-matching-related methods to [WaterMeterRecordDto].
extension WaterMeterRecordDtoPatterns on WaterMeterRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterRecordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dateType', fromJson: intFromDynamic)  int dateType, @JsonKey(name: 'usedM3', fromJson: stringFromDynamic)  String usedM3, @JsonKey(name: 'createDate', fromJson: stringFromDynamic)  String createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterRecordDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dateType', fromJson: intFromDynamic)  int dateType, @JsonKey(name: 'usedM3', fromJson: stringFromDynamic)  String usedM3, @JsonKey(name: 'createDate', fromJson: stringFromDynamic)  String createDate)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterRecordDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dateType', fromJson: intFromDynamic)  int dateType, @JsonKey(name: 'usedM3', fromJson: stringFromDynamic)  String usedM3, @JsonKey(name: 'createDate', fromJson: stringFromDynamic)  String createDate)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterRecordDto() when $default != null:
return $default(_that.dateType,_that.usedM3,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterMeterRecordDto extends WaterMeterRecordDto {
  const _WaterMeterRecordDto({@JsonKey(name: 'dateType', fromJson: intFromDynamic) this.dateType = 0, @JsonKey(name: 'usedM3', fromJson: stringFromDynamic) this.usedM3 = '', @JsonKey(name: 'createDate', fromJson: stringFromDynamic) this.createDate = ''}): super._();
  factory _WaterMeterRecordDto.fromJson(Map<String, dynamic> json) => _$WaterMeterRecordDtoFromJson(json);

@override@JsonKey(name: 'dateType', fromJson: intFromDynamic) final  int dateType;
@override@JsonKey(name: 'usedM3', fromJson: stringFromDynamic) final  String usedM3;
@override@JsonKey(name: 'createDate', fromJson: stringFromDynamic) final  String createDate;

/// Create a copy of WaterMeterRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterRecordDtoCopyWith<_WaterMeterRecordDto> get copyWith => __$WaterMeterRecordDtoCopyWithImpl<_WaterMeterRecordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterMeterRecordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterRecordDto&&(identical(other.dateType, dateType) || other.dateType == dateType)&&(identical(other.usedM3, usedM3) || other.usedM3 == usedM3)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateType,usedM3,createDate);

@override
String toString() {
  return 'WaterMeterRecordDto(dateType: $dateType, usedM3: $usedM3, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterRecordDtoCopyWith<$Res> implements $WaterMeterRecordDtoCopyWith<$Res> {
  factory _$WaterMeterRecordDtoCopyWith(_WaterMeterRecordDto value, $Res Function(_WaterMeterRecordDto) _then) = __$WaterMeterRecordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dateType', fromJson: intFromDynamic) int dateType,@JsonKey(name: 'usedM3', fromJson: stringFromDynamic) String usedM3,@JsonKey(name: 'createDate', fromJson: stringFromDynamic) String createDate
});




}
/// @nodoc
class __$WaterMeterRecordDtoCopyWithImpl<$Res>
    implements _$WaterMeterRecordDtoCopyWith<$Res> {
  __$WaterMeterRecordDtoCopyWithImpl(this._self, this._then);

  final _WaterMeterRecordDto _self;
  final $Res Function(_WaterMeterRecordDto) _then;

/// Create a copy of WaterMeterRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateType = null,Object? usedM3 = null,Object? createDate = null,}) {
  return _then(_WaterMeterRecordDto(
dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as int,usedM3: null == usedM3 ? _self.usedM3 : usedM3 // ignore: cast_nullable_to_non_nullable
as String,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WaterMeterGroupDto {

@JsonKey(name: 'groupId', fromJson: intFromDynamic) int get groupId;@JsonKey(name: 'groupName') String get groupName;@JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic) int get waterMeterCount;
/// Create a copy of WaterMeterGroupDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterGroupDtoCopyWith<WaterMeterGroupDto> get copyWith => _$WaterMeterGroupDtoCopyWithImpl<WaterMeterGroupDto>(this as WaterMeterGroupDto, _$identity);

  /// Serializes this WaterMeterGroupDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterGroupDto&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.waterMeterCount, waterMeterCount) || other.waterMeterCount == waterMeterCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,waterMeterCount);

@override
String toString() {
  return 'WaterMeterGroupDto(groupId: $groupId, groupName: $groupName, waterMeterCount: $waterMeterCount)';
}


}

/// @nodoc
abstract mixin class $WaterMeterGroupDtoCopyWith<$Res>  {
  factory $WaterMeterGroupDtoCopyWith(WaterMeterGroupDto value, $Res Function(WaterMeterGroupDto) _then) = _$WaterMeterGroupDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic) int waterMeterCount
});




}
/// @nodoc
class _$WaterMeterGroupDtoCopyWithImpl<$Res>
    implements $WaterMeterGroupDtoCopyWith<$Res> {
  _$WaterMeterGroupDtoCopyWithImpl(this._self, this._then);

  final WaterMeterGroupDto _self;
  final $Res Function(WaterMeterGroupDto) _then;

/// Create a copy of WaterMeterGroupDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? groupName = null,Object? waterMeterCount = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,waterMeterCount: null == waterMeterCount ? _self.waterMeterCount : waterMeterCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterGroupDto].
extension WaterMeterGroupDtoPatterns on WaterMeterGroupDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterGroupDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterGroupDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterGroupDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterGroupDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterGroupDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterGroupDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic)  int waterMeterCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterGroupDto() when $default != null:
return $default(_that.groupId,_that.groupName,_that.waterMeterCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic)  int waterMeterCount)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterGroupDto():
return $default(_that.groupId,_that.groupName,_that.waterMeterCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic)  int waterMeterCount)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterGroupDto() when $default != null:
return $default(_that.groupId,_that.groupName,_that.waterMeterCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterMeterGroupDto extends WaterMeterGroupDto {
  const _WaterMeterGroupDto({@JsonKey(name: 'groupId', fromJson: intFromDynamic) this.groupId = 0, @JsonKey(name: 'groupName') this.groupName = '', @JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic) this.waterMeterCount = 0}): super._();
  factory _WaterMeterGroupDto.fromJson(Map<String, dynamic> json) => _$WaterMeterGroupDtoFromJson(json);

@override@JsonKey(name: 'groupId', fromJson: intFromDynamic) final  int groupId;
@override@JsonKey(name: 'groupName') final  String groupName;
@override@JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic) final  int waterMeterCount;

/// Create a copy of WaterMeterGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterGroupDtoCopyWith<_WaterMeterGroupDto> get copyWith => __$WaterMeterGroupDtoCopyWithImpl<_WaterMeterGroupDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterMeterGroupDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterGroupDto&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.waterMeterCount, waterMeterCount) || other.waterMeterCount == waterMeterCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,waterMeterCount);

@override
String toString() {
  return 'WaterMeterGroupDto(groupId: $groupId, groupName: $groupName, waterMeterCount: $waterMeterCount)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterGroupDtoCopyWith<$Res> implements $WaterMeterGroupDtoCopyWith<$Res> {
  factory _$WaterMeterGroupDtoCopyWith(_WaterMeterGroupDto value, $Res Function(_WaterMeterGroupDto) _then) = __$WaterMeterGroupDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic) int waterMeterCount
});




}
/// @nodoc
class __$WaterMeterGroupDtoCopyWithImpl<$Res>
    implements _$WaterMeterGroupDtoCopyWith<$Res> {
  __$WaterMeterGroupDtoCopyWithImpl(this._self, this._then);

  final _WaterMeterGroupDto _self;
  final $Res Function(_WaterMeterGroupDto) _then;

/// Create a copy of WaterMeterGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? groupName = null,Object? waterMeterCount = null,}) {
  return _then(_WaterMeterGroupDto(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,waterMeterCount: null == waterMeterCount ? _self.waterMeterCount : waterMeterCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WaterMeterOperationRecordDto {

@JsonKey(name: 'id', fromJson: intFromDynamic) int get id;@JsonKey(name: 'recordType', fromJson: stringFromDynamic) String get recordType;@JsonKey(name: 'title') String get title;@JsonKey(name: 'content') String get content;@JsonKey(name: 'date', fromJson: stringFromDynamic) String get date;@JsonKey(name: 'headUrl') String get headUrl;
/// Create a copy of WaterMeterOperationRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterOperationRecordDtoCopyWith<WaterMeterOperationRecordDto> get copyWith => _$WaterMeterOperationRecordDtoCopyWithImpl<WaterMeterOperationRecordDto>(this as WaterMeterOperationRecordDto, _$identity);

  /// Serializes this WaterMeterOperationRecordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterOperationRecordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.date, date) || other.date == date)&&(identical(other.headUrl, headUrl) || other.headUrl == headUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recordType,title,content,date,headUrl);

@override
String toString() {
  return 'WaterMeterOperationRecordDto(id: $id, recordType: $recordType, title: $title, content: $content, date: $date, headUrl: $headUrl)';
}


}

/// @nodoc
abstract mixin class $WaterMeterOperationRecordDtoCopyWith<$Res>  {
  factory $WaterMeterOperationRecordDtoCopyWith(WaterMeterOperationRecordDto value, $Res Function(WaterMeterOperationRecordDto) _then) = _$WaterMeterOperationRecordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'recordType', fromJson: stringFromDynamic) String recordType,@JsonKey(name: 'title') String title,@JsonKey(name: 'content') String content,@JsonKey(name: 'date', fromJson: stringFromDynamic) String date,@JsonKey(name: 'headUrl') String headUrl
});




}
/// @nodoc
class _$WaterMeterOperationRecordDtoCopyWithImpl<$Res>
    implements $WaterMeterOperationRecordDtoCopyWith<$Res> {
  _$WaterMeterOperationRecordDtoCopyWithImpl(this._self, this._then);

  final WaterMeterOperationRecordDto _self;
  final $Res Function(WaterMeterOperationRecordDto) _then;

/// Create a copy of WaterMeterOperationRecordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recordType = null,Object? title = null,Object? content = null,Object? date = null,Object? headUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,headUrl: null == headUrl ? _self.headUrl : headUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterOperationRecordDto].
extension WaterMeterOperationRecordDtoPatterns on WaterMeterOperationRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterOperationRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterOperationRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterOperationRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterOperationRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterOperationRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterOperationRecordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'recordType', fromJson: stringFromDynamic)  String recordType, @JsonKey(name: 'title')  String title, @JsonKey(name: 'content')  String content, @JsonKey(name: 'date', fromJson: stringFromDynamic)  String date, @JsonKey(name: 'headUrl')  String headUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterOperationRecordDto() when $default != null:
return $default(_that.id,_that.recordType,_that.title,_that.content,_that.date,_that.headUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'recordType', fromJson: stringFromDynamic)  String recordType, @JsonKey(name: 'title')  String title, @JsonKey(name: 'content')  String content, @JsonKey(name: 'date', fromJson: stringFromDynamic)  String date, @JsonKey(name: 'headUrl')  String headUrl)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterOperationRecordDto():
return $default(_that.id,_that.recordType,_that.title,_that.content,_that.date,_that.headUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'recordType', fromJson: stringFromDynamic)  String recordType, @JsonKey(name: 'title')  String title, @JsonKey(name: 'content')  String content, @JsonKey(name: 'date', fromJson: stringFromDynamic)  String date, @JsonKey(name: 'headUrl')  String headUrl)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterOperationRecordDto() when $default != null:
return $default(_that.id,_that.recordType,_that.title,_that.content,_that.date,_that.headUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterMeterOperationRecordDto extends WaterMeterOperationRecordDto {
  const _WaterMeterOperationRecordDto({@JsonKey(name: 'id', fromJson: intFromDynamic) this.id = 0, @JsonKey(name: 'recordType', fromJson: stringFromDynamic) this.recordType = '', @JsonKey(name: 'title') this.title = '', @JsonKey(name: 'content') this.content = '', @JsonKey(name: 'date', fromJson: stringFromDynamic) this.date = '', @JsonKey(name: 'headUrl') this.headUrl = ''}): super._();
  factory _WaterMeterOperationRecordDto.fromJson(Map<String, dynamic> json) => _$WaterMeterOperationRecordDtoFromJson(json);

@override@JsonKey(name: 'id', fromJson: intFromDynamic) final  int id;
@override@JsonKey(name: 'recordType', fromJson: stringFromDynamic) final  String recordType;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'content') final  String content;
@override@JsonKey(name: 'date', fromJson: stringFromDynamic) final  String date;
@override@JsonKey(name: 'headUrl') final  String headUrl;

/// Create a copy of WaterMeterOperationRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterOperationRecordDtoCopyWith<_WaterMeterOperationRecordDto> get copyWith => __$WaterMeterOperationRecordDtoCopyWithImpl<_WaterMeterOperationRecordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterMeterOperationRecordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterOperationRecordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.date, date) || other.date == date)&&(identical(other.headUrl, headUrl) || other.headUrl == headUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recordType,title,content,date,headUrl);

@override
String toString() {
  return 'WaterMeterOperationRecordDto(id: $id, recordType: $recordType, title: $title, content: $content, date: $date, headUrl: $headUrl)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterOperationRecordDtoCopyWith<$Res> implements $WaterMeterOperationRecordDtoCopyWith<$Res> {
  factory _$WaterMeterOperationRecordDtoCopyWith(_WaterMeterOperationRecordDto value, $Res Function(_WaterMeterOperationRecordDto) _then) = __$WaterMeterOperationRecordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'recordType', fromJson: stringFromDynamic) String recordType,@JsonKey(name: 'title') String title,@JsonKey(name: 'content') String content,@JsonKey(name: 'date', fromJson: stringFromDynamic) String date,@JsonKey(name: 'headUrl') String headUrl
});




}
/// @nodoc
class __$WaterMeterOperationRecordDtoCopyWithImpl<$Res>
    implements _$WaterMeterOperationRecordDtoCopyWith<$Res> {
  __$WaterMeterOperationRecordDtoCopyWithImpl(this._self, this._then);

  final _WaterMeterOperationRecordDto _self;
  final $Res Function(_WaterMeterOperationRecordDto) _then;

/// Create a copy of WaterMeterOperationRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recordType = null,Object? title = null,Object? content = null,Object? date = null,Object? headUrl = null,}) {
  return _then(_WaterMeterOperationRecordDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,recordType: null == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,headUrl: null == headUrl ? _self.headUrl : headUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WaterMeterTaskDto {

@JsonKey(name: 'id', fromJson: intFromDynamic) int get id;@JsonKey(name: 'taskType', fromJson: intFromDynamic) int get taskType;@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi; double get rechargeAmount;@JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) String get remainderM3; double get rechargeM3;@JsonKey(name: 'usedFlag', fromJson: intFromDynamic) int get usedFlag;@JsonKey(name: 'price', fromJson: stringFromDynamic) String get price;@JsonKey(name: 'executeToken') String get executeToken;
/// Create a copy of WaterMeterTaskDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterTaskDtoCopyWith<WaterMeterTaskDto> get copyWith => _$WaterMeterTaskDtoCopyWithImpl<WaterMeterTaskDto>(this as WaterMeterTaskDto, _$identity);

  /// Serializes this WaterMeterTaskDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterTaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.taskType, taskType) || other.taskType == taskType)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.rechargeAmount, rechargeAmount) || other.rechargeAmount == rechargeAmount)&&(identical(other.remainderM3, remainderM3) || other.remainderM3 == remainderM3)&&(identical(other.rechargeM3, rechargeM3) || other.rechargeM3 == rechargeM3)&&(identical(other.usedFlag, usedFlag) || other.usedFlag == usedFlag)&&(identical(other.price, price) || other.price == price)&&(identical(other.executeToken, executeToken) || other.executeToken == executeToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskType,rssi,rechargeAmount,remainderM3,rechargeM3,usedFlag,price,executeToken);

@override
String toString() {
  return 'WaterMeterTaskDto(id: $id, taskType: $taskType, rssi: $rssi, rechargeAmount: $rechargeAmount, remainderM3: $remainderM3, rechargeM3: $rechargeM3, usedFlag: $usedFlag, price: $price, executeToken: $executeToken)';
}


}

/// @nodoc
abstract mixin class $WaterMeterTaskDtoCopyWith<$Res>  {
  factory $WaterMeterTaskDtoCopyWith(WaterMeterTaskDto value, $Res Function(WaterMeterTaskDto) _then) = _$WaterMeterTaskDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'taskType', fromJson: intFromDynamic) int taskType,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi, double rechargeAmount,@JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) String remainderM3, double rechargeM3,@JsonKey(name: 'usedFlag', fromJson: intFromDynamic) int usedFlag,@JsonKey(name: 'price', fromJson: stringFromDynamic) String price,@JsonKey(name: 'executeToken') String executeToken
});




}
/// @nodoc
class _$WaterMeterTaskDtoCopyWithImpl<$Res>
    implements $WaterMeterTaskDtoCopyWith<$Res> {
  _$WaterMeterTaskDtoCopyWithImpl(this._self, this._then);

  final WaterMeterTaskDto _self;
  final $Res Function(WaterMeterTaskDto) _then;

/// Create a copy of WaterMeterTaskDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskType = null,Object? rssi = null,Object? rechargeAmount = null,Object? remainderM3 = null,Object? rechargeM3 = null,Object? usedFlag = null,Object? price = null,Object? executeToken = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,taskType: null == taskType ? _self.taskType : taskType // ignore: cast_nullable_to_non_nullable
as int,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,rechargeAmount: null == rechargeAmount ? _self.rechargeAmount : rechargeAmount // ignore: cast_nullable_to_non_nullable
as double,remainderM3: null == remainderM3 ? _self.remainderM3 : remainderM3 // ignore: cast_nullable_to_non_nullable
as String,rechargeM3: null == rechargeM3 ? _self.rechargeM3 : rechargeM3 // ignore: cast_nullable_to_non_nullable
as double,usedFlag: null == usedFlag ? _self.usedFlag : usedFlag // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,executeToken: null == executeToken ? _self.executeToken : executeToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterTaskDto].
extension WaterMeterTaskDtoPatterns on WaterMeterTaskDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterTaskDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterTaskDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterTaskDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterTaskDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterTaskDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterTaskDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'taskType', fromJson: intFromDynamic)  int taskType, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi,  double rechargeAmount, @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic)  String remainderM3,  double rechargeM3, @JsonKey(name: 'usedFlag', fromJson: intFromDynamic)  int usedFlag, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'executeToken')  String executeToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterTaskDto() when $default != null:
return $default(_that.id,_that.taskType,_that.rssi,_that.rechargeAmount,_that.remainderM3,_that.rechargeM3,_that.usedFlag,_that.price,_that.executeToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'taskType', fromJson: intFromDynamic)  int taskType, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi,  double rechargeAmount, @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic)  String remainderM3,  double rechargeM3, @JsonKey(name: 'usedFlag', fromJson: intFromDynamic)  int usedFlag, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'executeToken')  String executeToken)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterTaskDto():
return $default(_that.id,_that.taskType,_that.rssi,_that.rechargeAmount,_that.remainderM3,_that.rechargeM3,_that.usedFlag,_that.price,_that.executeToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'taskType', fromJson: intFromDynamic)  int taskType, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi,  double rechargeAmount, @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic)  String remainderM3,  double rechargeM3, @JsonKey(name: 'usedFlag', fromJson: intFromDynamic)  int usedFlag, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'executeToken')  String executeToken)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterTaskDto() when $default != null:
return $default(_that.id,_that.taskType,_that.rssi,_that.rechargeAmount,_that.remainderM3,_that.rechargeM3,_that.usedFlag,_that.price,_that.executeToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterMeterTaskDto extends WaterMeterTaskDto {
  const _WaterMeterTaskDto({@JsonKey(name: 'id', fromJson: intFromDynamic) this.id = 0, @JsonKey(name: 'taskType', fromJson: intFromDynamic) this.taskType = 0, @JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, this.rechargeAmount = 0, @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) this.remainderM3 = '', this.rechargeM3 = 0, @JsonKey(name: 'usedFlag', fromJson: intFromDynamic) this.usedFlag = 0, @JsonKey(name: 'price', fromJson: stringFromDynamic) this.price = '', @JsonKey(name: 'executeToken') this.executeToken = ''}): super._();
  factory _WaterMeterTaskDto.fromJson(Map<String, dynamic> json) => _$WaterMeterTaskDtoFromJson(json);

@override@JsonKey(name: 'id', fromJson: intFromDynamic) final  int id;
@override@JsonKey(name: 'taskType', fromJson: intFromDynamic) final  int taskType;
@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey() final  double rechargeAmount;
@override@JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) final  String remainderM3;
@override@JsonKey() final  double rechargeM3;
@override@JsonKey(name: 'usedFlag', fromJson: intFromDynamic) final  int usedFlag;
@override@JsonKey(name: 'price', fromJson: stringFromDynamic) final  String price;
@override@JsonKey(name: 'executeToken') final  String executeToken;

/// Create a copy of WaterMeterTaskDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterTaskDtoCopyWith<_WaterMeterTaskDto> get copyWith => __$WaterMeterTaskDtoCopyWithImpl<_WaterMeterTaskDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterMeterTaskDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterTaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.taskType, taskType) || other.taskType == taskType)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.rechargeAmount, rechargeAmount) || other.rechargeAmount == rechargeAmount)&&(identical(other.remainderM3, remainderM3) || other.remainderM3 == remainderM3)&&(identical(other.rechargeM3, rechargeM3) || other.rechargeM3 == rechargeM3)&&(identical(other.usedFlag, usedFlag) || other.usedFlag == usedFlag)&&(identical(other.price, price) || other.price == price)&&(identical(other.executeToken, executeToken) || other.executeToken == executeToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskType,rssi,rechargeAmount,remainderM3,rechargeM3,usedFlag,price,executeToken);

@override
String toString() {
  return 'WaterMeterTaskDto(id: $id, taskType: $taskType, rssi: $rssi, rechargeAmount: $rechargeAmount, remainderM3: $remainderM3, rechargeM3: $rechargeM3, usedFlag: $usedFlag, price: $price, executeToken: $executeToken)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterTaskDtoCopyWith<$Res> implements $WaterMeterTaskDtoCopyWith<$Res> {
  factory _$WaterMeterTaskDtoCopyWith(_WaterMeterTaskDto value, $Res Function(_WaterMeterTaskDto) _then) = __$WaterMeterTaskDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'taskType', fromJson: intFromDynamic) int taskType,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi, double rechargeAmount,@JsonKey(name: 'remainderM3', fromJson: stringFromDynamic) String remainderM3, double rechargeM3,@JsonKey(name: 'usedFlag', fromJson: intFromDynamic) int usedFlag,@JsonKey(name: 'price', fromJson: stringFromDynamic) String price,@JsonKey(name: 'executeToken') String executeToken
});




}
/// @nodoc
class __$WaterMeterTaskDtoCopyWithImpl<$Res>
    implements _$WaterMeterTaskDtoCopyWith<$Res> {
  __$WaterMeterTaskDtoCopyWithImpl(this._self, this._then);

  final _WaterMeterTaskDto _self;
  final $Res Function(_WaterMeterTaskDto) _then;

/// Create a copy of WaterMeterTaskDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskType = null,Object? rssi = null,Object? rechargeAmount = null,Object? remainderM3 = null,Object? rechargeM3 = null,Object? usedFlag = null,Object? price = null,Object? executeToken = null,}) {
  return _then(_WaterMeterTaskDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,taskType: null == taskType ? _self.taskType : taskType // ignore: cast_nullable_to_non_nullable
as int,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,rechargeAmount: null == rechargeAmount ? _self.rechargeAmount : rechargeAmount // ignore: cast_nullable_to_non_nullable
as double,remainderM3: null == remainderM3 ? _self.remainderM3 : remainderM3 // ignore: cast_nullable_to_non_nullable
as String,rechargeM3: null == rechargeM3 ? _self.rechargeM3 : rechargeM3 // ignore: cast_nullable_to_non_nullable
as double,usedFlag: null == usedFlag ? _self.usedFlag : usedFlag // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,executeToken: null == executeToken ? _self.executeToken : executeToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WaterMeterGatewayDto {

@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi;@JsonKey(name: 'gatewayName') String get gatewayName;@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int get gatewayVersion;
/// Create a copy of WaterMeterGatewayDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterGatewayDtoCopyWith<WaterMeterGatewayDto> get copyWith => _$WaterMeterGatewayDtoCopyWithImpl<WaterMeterGatewayDto>(this as WaterMeterGatewayDto, _$identity);

  /// Serializes this WaterMeterGatewayDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterGatewayDto&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.gatewayVersion, gatewayVersion) || other.gatewayVersion == gatewayVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rssi,gatewayName,gatewayVersion);

@override
String toString() {
  return 'WaterMeterGatewayDto(rssi: $rssi, gatewayName: $gatewayName, gatewayVersion: $gatewayVersion)';
}


}

/// @nodoc
abstract mixin class $WaterMeterGatewayDtoCopyWith<$Res>  {
  factory $WaterMeterGatewayDtoCopyWith(WaterMeterGatewayDto value, $Res Function(WaterMeterGatewayDto) _then) = _$WaterMeterGatewayDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'gatewayName') String gatewayName,@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int gatewayVersion
});




}
/// @nodoc
class _$WaterMeterGatewayDtoCopyWithImpl<$Res>
    implements $WaterMeterGatewayDtoCopyWith<$Res> {
  _$WaterMeterGatewayDtoCopyWithImpl(this._self, this._then);

  final WaterMeterGatewayDto _self;
  final $Res Function(WaterMeterGatewayDto) _then;

/// Create a copy of WaterMeterGatewayDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rssi = null,Object? gatewayName = null,Object? gatewayVersion = null,}) {
  return _then(_self.copyWith(
rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,gatewayVersion: null == gatewayVersion ? _self.gatewayVersion : gatewayVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterGatewayDto].
extension WaterMeterGatewayDtoPatterns on WaterMeterGatewayDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterGatewayDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterGatewayDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterGatewayDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterGatewayDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterGatewayDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterGatewayDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)  int gatewayVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterGatewayDto() when $default != null:
return $default(_that.rssi,_that.gatewayName,_that.gatewayVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)  int gatewayVersion)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterGatewayDto():
return $default(_that.rssi,_that.gatewayName,_that.gatewayVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'gatewayName')  String gatewayName, @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)  int gatewayVersion)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterGatewayDto() when $default != null:
return $default(_that.rssi,_that.gatewayName,_that.gatewayVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterMeterGatewayDto extends WaterMeterGatewayDto {
  const _WaterMeterGatewayDto({@JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, @JsonKey(name: 'gatewayName') this.gatewayName = '', @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) this.gatewayVersion = 0}): super._();
  factory _WaterMeterGatewayDto.fromJson(Map<String, dynamic> json) => _$WaterMeterGatewayDtoFromJson(json);

@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey(name: 'gatewayName') final  String gatewayName;
@override@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) final  int gatewayVersion;

/// Create a copy of WaterMeterGatewayDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterGatewayDtoCopyWith<_WaterMeterGatewayDto> get copyWith => __$WaterMeterGatewayDtoCopyWithImpl<_WaterMeterGatewayDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterMeterGatewayDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterGatewayDto&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.gatewayVersion, gatewayVersion) || other.gatewayVersion == gatewayVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rssi,gatewayName,gatewayVersion);

@override
String toString() {
  return 'WaterMeterGatewayDto(rssi: $rssi, gatewayName: $gatewayName, gatewayVersion: $gatewayVersion)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterGatewayDtoCopyWith<$Res> implements $WaterMeterGatewayDtoCopyWith<$Res> {
  factory _$WaterMeterGatewayDtoCopyWith(_WaterMeterGatewayDto value, $Res Function(_WaterMeterGatewayDto) _then) = __$WaterMeterGatewayDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'gatewayName') String gatewayName,@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int gatewayVersion
});




}
/// @nodoc
class __$WaterMeterGatewayDtoCopyWithImpl<$Res>
    implements _$WaterMeterGatewayDtoCopyWith<$Res> {
  __$WaterMeterGatewayDtoCopyWithImpl(this._self, this._then);

  final _WaterMeterGatewayDto _self;
  final $Res Function(_WaterMeterGatewayDto) _then;

/// Create a copy of WaterMeterGatewayDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rssi = null,Object? gatewayName = null,Object? gatewayVersion = null,}) {
  return _then(_WaterMeterGatewayDto(
rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,gatewayVersion: null == gatewayVersion ? _self.gatewayVersion : gatewayVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WaterMeterCatOneDetailDto {

@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int get rssiGrade;@JsonKey(name: 'catOneNodeId') String get catOneNodeId;@JsonKey(name: 'catOneCardNumber') String get catOneCardNumber;@JsonKey(name: 'catOneOperator') String get catOneOperator;@JsonKey(name: 'catOneImsi') String get catOneImsi;@JsonKey(name: 'catOneApn') String get catOneApn;@JsonKey(name: 'overseaCard', fromJson: intFromDynamic) int get overseaCard;
/// Create a copy of WaterMeterCatOneDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterCatOneDetailDtoCopyWith<WaterMeterCatOneDetailDto> get copyWith => _$WaterMeterCatOneDetailDtoCopyWithImpl<WaterMeterCatOneDetailDto>(this as WaterMeterCatOneDetailDto, _$identity);

  /// Serializes this WaterMeterCatOneDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterCatOneDetailDto&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.catOneNodeId, catOneNodeId) || other.catOneNodeId == catOneNodeId)&&(identical(other.catOneCardNumber, catOneCardNumber) || other.catOneCardNumber == catOneCardNumber)&&(identical(other.catOneOperator, catOneOperator) || other.catOneOperator == catOneOperator)&&(identical(other.catOneImsi, catOneImsi) || other.catOneImsi == catOneImsi)&&(identical(other.catOneApn, catOneApn) || other.catOneApn == catOneApn)&&(identical(other.overseaCard, overseaCard) || other.overseaCard == overseaCard));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rssiGrade,catOneNodeId,catOneCardNumber,catOneOperator,catOneImsi,catOneApn,overseaCard);

@override
String toString() {
  return 'WaterMeterCatOneDetailDto(rssiGrade: $rssiGrade, catOneNodeId: $catOneNodeId, catOneCardNumber: $catOneCardNumber, catOneOperator: $catOneOperator, catOneImsi: $catOneImsi, catOneApn: $catOneApn, overseaCard: $overseaCard)';
}


}

/// @nodoc
abstract mixin class $WaterMeterCatOneDetailDtoCopyWith<$Res>  {
  factory $WaterMeterCatOneDetailDtoCopyWith(WaterMeterCatOneDetailDto value, $Res Function(WaterMeterCatOneDetailDto) _then) = _$WaterMeterCatOneDetailDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int rssiGrade,@JsonKey(name: 'catOneNodeId') String catOneNodeId,@JsonKey(name: 'catOneCardNumber') String catOneCardNumber,@JsonKey(name: 'catOneOperator') String catOneOperator,@JsonKey(name: 'catOneImsi') String catOneImsi,@JsonKey(name: 'catOneApn') String catOneApn,@JsonKey(name: 'overseaCard', fromJson: intFromDynamic) int overseaCard
});




}
/// @nodoc
class _$WaterMeterCatOneDetailDtoCopyWithImpl<$Res>
    implements $WaterMeterCatOneDetailDtoCopyWith<$Res> {
  _$WaterMeterCatOneDetailDtoCopyWithImpl(this._self, this._then);

  final WaterMeterCatOneDetailDto _self;
  final $Res Function(WaterMeterCatOneDetailDto) _then;

/// Create a copy of WaterMeterCatOneDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rssiGrade = null,Object? catOneNodeId = null,Object? catOneCardNumber = null,Object? catOneOperator = null,Object? catOneImsi = null,Object? catOneApn = null,Object? overseaCard = null,}) {
  return _then(_self.copyWith(
rssiGrade: null == rssiGrade ? _self.rssiGrade : rssiGrade // ignore: cast_nullable_to_non_nullable
as int,catOneNodeId: null == catOneNodeId ? _self.catOneNodeId : catOneNodeId // ignore: cast_nullable_to_non_nullable
as String,catOneCardNumber: null == catOneCardNumber ? _self.catOneCardNumber : catOneCardNumber // ignore: cast_nullable_to_non_nullable
as String,catOneOperator: null == catOneOperator ? _self.catOneOperator : catOneOperator // ignore: cast_nullable_to_non_nullable
as String,catOneImsi: null == catOneImsi ? _self.catOneImsi : catOneImsi // ignore: cast_nullable_to_non_nullable
as String,catOneApn: null == catOneApn ? _self.catOneApn : catOneApn // ignore: cast_nullable_to_non_nullable
as String,overseaCard: null == overseaCard ? _self.overseaCard : overseaCard // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterCatOneDetailDto].
extension WaterMeterCatOneDetailDtoPatterns on WaterMeterCatOneDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterCatOneDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterCatOneDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterCatOneDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterCatOneDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterCatOneDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterCatOneDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic)  int rssiGrade, @JsonKey(name: 'catOneNodeId')  String catOneNodeId, @JsonKey(name: 'catOneCardNumber')  String catOneCardNumber, @JsonKey(name: 'catOneOperator')  String catOneOperator, @JsonKey(name: 'catOneImsi')  String catOneImsi, @JsonKey(name: 'catOneApn')  String catOneApn, @JsonKey(name: 'overseaCard', fromJson: intFromDynamic)  int overseaCard)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterCatOneDetailDto() when $default != null:
return $default(_that.rssiGrade,_that.catOneNodeId,_that.catOneCardNumber,_that.catOneOperator,_that.catOneImsi,_that.catOneApn,_that.overseaCard);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic)  int rssiGrade, @JsonKey(name: 'catOneNodeId')  String catOneNodeId, @JsonKey(name: 'catOneCardNumber')  String catOneCardNumber, @JsonKey(name: 'catOneOperator')  String catOneOperator, @JsonKey(name: 'catOneImsi')  String catOneImsi, @JsonKey(name: 'catOneApn')  String catOneApn, @JsonKey(name: 'overseaCard', fromJson: intFromDynamic)  int overseaCard)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterCatOneDetailDto():
return $default(_that.rssiGrade,_that.catOneNodeId,_that.catOneCardNumber,_that.catOneOperator,_that.catOneImsi,_that.catOneApn,_that.overseaCard);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic)  int rssiGrade, @JsonKey(name: 'catOneNodeId')  String catOneNodeId, @JsonKey(name: 'catOneCardNumber')  String catOneCardNumber, @JsonKey(name: 'catOneOperator')  String catOneOperator, @JsonKey(name: 'catOneImsi')  String catOneImsi, @JsonKey(name: 'catOneApn')  String catOneApn, @JsonKey(name: 'overseaCard', fromJson: intFromDynamic)  int overseaCard)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterCatOneDetailDto() when $default != null:
return $default(_that.rssiGrade,_that.catOneNodeId,_that.catOneCardNumber,_that.catOneOperator,_that.catOneImsi,_that.catOneApn,_that.overseaCard);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterMeterCatOneDetailDto extends WaterMeterCatOneDetailDto {
  const _WaterMeterCatOneDetailDto({@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) this.rssiGrade = 0, @JsonKey(name: 'catOneNodeId') this.catOneNodeId = '', @JsonKey(name: 'catOneCardNumber') this.catOneCardNumber = '', @JsonKey(name: 'catOneOperator') this.catOneOperator = '', @JsonKey(name: 'catOneImsi') this.catOneImsi = '', @JsonKey(name: 'catOneApn') this.catOneApn = '', @JsonKey(name: 'overseaCard', fromJson: intFromDynamic) this.overseaCard = 0}): super._();
  factory _WaterMeterCatOneDetailDto.fromJson(Map<String, dynamic> json) => _$WaterMeterCatOneDetailDtoFromJson(json);

@override@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) final  int rssiGrade;
@override@JsonKey(name: 'catOneNodeId') final  String catOneNodeId;
@override@JsonKey(name: 'catOneCardNumber') final  String catOneCardNumber;
@override@JsonKey(name: 'catOneOperator') final  String catOneOperator;
@override@JsonKey(name: 'catOneImsi') final  String catOneImsi;
@override@JsonKey(name: 'catOneApn') final  String catOneApn;
@override@JsonKey(name: 'overseaCard', fromJson: intFromDynamic) final  int overseaCard;

/// Create a copy of WaterMeterCatOneDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterCatOneDetailDtoCopyWith<_WaterMeterCatOneDetailDto> get copyWith => __$WaterMeterCatOneDetailDtoCopyWithImpl<_WaterMeterCatOneDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterMeterCatOneDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterCatOneDetailDto&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.catOneNodeId, catOneNodeId) || other.catOneNodeId == catOneNodeId)&&(identical(other.catOneCardNumber, catOneCardNumber) || other.catOneCardNumber == catOneCardNumber)&&(identical(other.catOneOperator, catOneOperator) || other.catOneOperator == catOneOperator)&&(identical(other.catOneImsi, catOneImsi) || other.catOneImsi == catOneImsi)&&(identical(other.catOneApn, catOneApn) || other.catOneApn == catOneApn)&&(identical(other.overseaCard, overseaCard) || other.overseaCard == overseaCard));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rssiGrade,catOneNodeId,catOneCardNumber,catOneOperator,catOneImsi,catOneApn,overseaCard);

@override
String toString() {
  return 'WaterMeterCatOneDetailDto(rssiGrade: $rssiGrade, catOneNodeId: $catOneNodeId, catOneCardNumber: $catOneCardNumber, catOneOperator: $catOneOperator, catOneImsi: $catOneImsi, catOneApn: $catOneApn, overseaCard: $overseaCard)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterCatOneDetailDtoCopyWith<$Res> implements $WaterMeterCatOneDetailDtoCopyWith<$Res> {
  factory _$WaterMeterCatOneDetailDtoCopyWith(_WaterMeterCatOneDetailDto value, $Res Function(_WaterMeterCatOneDetailDto) _then) = __$WaterMeterCatOneDetailDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int rssiGrade,@JsonKey(name: 'catOneNodeId') String catOneNodeId,@JsonKey(name: 'catOneCardNumber') String catOneCardNumber,@JsonKey(name: 'catOneOperator') String catOneOperator,@JsonKey(name: 'catOneImsi') String catOneImsi,@JsonKey(name: 'catOneApn') String catOneApn,@JsonKey(name: 'overseaCard', fromJson: intFromDynamic) int overseaCard
});




}
/// @nodoc
class __$WaterMeterCatOneDetailDtoCopyWithImpl<$Res>
    implements _$WaterMeterCatOneDetailDtoCopyWith<$Res> {
  __$WaterMeterCatOneDetailDtoCopyWithImpl(this._self, this._then);

  final _WaterMeterCatOneDetailDto _self;
  final $Res Function(_WaterMeterCatOneDetailDto) _then;

/// Create a copy of WaterMeterCatOneDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rssiGrade = null,Object? catOneNodeId = null,Object? catOneCardNumber = null,Object? catOneOperator = null,Object? catOneImsi = null,Object? catOneApn = null,Object? overseaCard = null,}) {
  return _then(_WaterMeterCatOneDetailDto(
rssiGrade: null == rssiGrade ? _self.rssiGrade : rssiGrade // ignore: cast_nullable_to_non_nullable
as int,catOneNodeId: null == catOneNodeId ? _self.catOneNodeId : catOneNodeId // ignore: cast_nullable_to_non_nullable
as String,catOneCardNumber: null == catOneCardNumber ? _self.catOneCardNumber : catOneCardNumber // ignore: cast_nullable_to_non_nullable
as String,catOneOperator: null == catOneOperator ? _self.catOneOperator : catOneOperator // ignore: cast_nullable_to_non_nullable
as String,catOneImsi: null == catOneImsi ? _self.catOneImsi : catOneImsi // ignore: cast_nullable_to_non_nullable
as String,catOneApn: null == catOneApn ? _self.catOneApn : catOneApn // ignore: cast_nullable_to_non_nullable
as String,overseaCard: null == overseaCard ? _self.overseaCard : overseaCard // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WaterMeterUpgradeCheckDto {

@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int get needUpgrade;@JsonKey(name: 'firmwareInfo') Map<String, dynamic>? get firmwareInfo;@JsonKey(name: 'firmwarePackage') String get firmwarePackage;@JsonKey(name: 'version') String get version;
/// Create a copy of WaterMeterUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterMeterUpgradeCheckDtoCopyWith<WaterMeterUpgradeCheckDto> get copyWith => _$WaterMeterUpgradeCheckDtoCopyWithImpl<WaterMeterUpgradeCheckDto>(this as WaterMeterUpgradeCheckDto, _$identity);

  /// Serializes this WaterMeterUpgradeCheckDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterMeterUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&const DeepCollectionEquality().equals(other.firmwareInfo, firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,const DeepCollectionEquality().hash(firmwareInfo),firmwarePackage,version);

@override
String toString() {
  return 'WaterMeterUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class $WaterMeterUpgradeCheckDtoCopyWith<$Res>  {
  factory $WaterMeterUpgradeCheckDtoCopyWith(WaterMeterUpgradeCheckDto value, $Res Function(WaterMeterUpgradeCheckDto) _then) = _$WaterMeterUpgradeCheckDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') Map<String, dynamic>? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});




}
/// @nodoc
class _$WaterMeterUpgradeCheckDtoCopyWithImpl<$Res>
    implements $WaterMeterUpgradeCheckDtoCopyWith<$Res> {
  _$WaterMeterUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final WaterMeterUpgradeCheckDto _self;
  final $Res Function(WaterMeterUpgradeCheckDto) _then;

/// Create a copy of WaterMeterUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_self.copyWith(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterMeterUpgradeCheckDto].
extension WaterMeterUpgradeCheckDtoPatterns on WaterMeterUpgradeCheckDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterMeterUpgradeCheckDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterMeterUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterMeterUpgradeCheckDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterMeterUpgradeCheckDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterMeterUpgradeCheckDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterMeterUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  Map<String, dynamic>? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterMeterUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  Map<String, dynamic>? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)  $default,) {final _that = this;
switch (_that) {
case _WaterMeterUpgradeCheckDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)  int needUpgrade, @JsonKey(name: 'firmwareInfo')  Map<String, dynamic>? firmwareInfo, @JsonKey(name: 'firmwarePackage')  String firmwarePackage, @JsonKey(name: 'version')  String version)?  $default,) {final _that = this;
switch (_that) {
case _WaterMeterUpgradeCheckDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterMeterUpgradeCheckDto extends WaterMeterUpgradeCheckDto {
  const _WaterMeterUpgradeCheckDto({@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) this.needUpgrade = 0, @JsonKey(name: 'firmwareInfo') final  Map<String, dynamic>? firmwareInfo, @JsonKey(name: 'firmwarePackage') this.firmwarePackage = '', @JsonKey(name: 'version') this.version = ''}): _firmwareInfo = firmwareInfo,super._();
  factory _WaterMeterUpgradeCheckDto.fromJson(Map<String, dynamic> json) => _$WaterMeterUpgradeCheckDtoFromJson(json);

@override@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) final  int needUpgrade;
 final  Map<String, dynamic>? _firmwareInfo;
@override@JsonKey(name: 'firmwareInfo') Map<String, dynamic>? get firmwareInfo {
  final value = _firmwareInfo;
  if (value == null) return null;
  if (_firmwareInfo is EqualUnmodifiableMapView) return _firmwareInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'firmwarePackage') final  String firmwarePackage;
@override@JsonKey(name: 'version') final  String version;

/// Create a copy of WaterMeterUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterMeterUpgradeCheckDtoCopyWith<_WaterMeterUpgradeCheckDto> get copyWith => __$WaterMeterUpgradeCheckDtoCopyWithImpl<_WaterMeterUpgradeCheckDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterMeterUpgradeCheckDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterMeterUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&const DeepCollectionEquality().equals(other._firmwareInfo, _firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,const DeepCollectionEquality().hash(_firmwareInfo),firmwarePackage,version);

@override
String toString() {
  return 'WaterMeterUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class _$WaterMeterUpgradeCheckDtoCopyWith<$Res> implements $WaterMeterUpgradeCheckDtoCopyWith<$Res> {
  factory _$WaterMeterUpgradeCheckDtoCopyWith(_WaterMeterUpgradeCheckDto value, $Res Function(_WaterMeterUpgradeCheckDto) _then) = __$WaterMeterUpgradeCheckDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') Map<String, dynamic>? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});




}
/// @nodoc
class __$WaterMeterUpgradeCheckDtoCopyWithImpl<$Res>
    implements _$WaterMeterUpgradeCheckDtoCopyWith<$Res> {
  __$WaterMeterUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final _WaterMeterUpgradeCheckDto _self;
  final $Res Function(_WaterMeterUpgradeCheckDto) _then;

/// Create a copy of WaterMeterUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_WaterMeterUpgradeCheckDto(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self._firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
