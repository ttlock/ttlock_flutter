// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_meter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ElectricMeterDto {

@JsonKey(name: 'electricMeterId', fromJson: intFromDynamic) int get electricMeterId;@JsonKey(name: 'online', fromJson: boolFromDynamic) bool get online;@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi;@JsonKey(name: 'onOff', fromJson: intFromDynamic) int get onOff;@JsonKey(name: 'name') String get name;@JsonKey(name: 'number') String get number;@JsonKey(name: 'payMode', fromJson: intFromDynamic) int get payMode;@JsonKey(name: 'totalKwh', fromJson: stringFromDynamic) String get totalKwh;@JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) String get remainderKwh;@JsonKey(name: 'price', fromJson: stringFromDynamic) String get price;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;@JsonKey(name: 'maxPower', fromJson: stringFromDynamic) String get maxPower;@JsonKey(name: 'mac') String get mac;@JsonKey(name: 'featureValue') String get featureValue;@JsonKey(name: 'modelNum') String get modelNum;@JsonKey(name: 'hardwareRevision') String get hardwareRevision;@JsonKey(name: 'firmwareRevision') String get firmwareRevision;@JsonKey(name: 'syncKwhDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? get syncKwhDate;@JsonKey(name: 'groupName') String get groupName;@JsonKey(name: 'groupId', fromJson: intFromDynamic) int get groupId;
/// Create a copy of ElectricMeterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterDtoCopyWith<ElectricMeterDto> get copyWith => _$ElectricMeterDtoCopyWithImpl<ElectricMeterDto>(this as ElectricMeterDto, _$identity);

  /// Serializes this ElectricMeterDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterDto&&(identical(other.electricMeterId, electricMeterId) || other.electricMeterId == electricMeterId)&&(identical(other.online, online) || other.online == online)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.onOff, onOff) || other.onOff == onOff)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.payMode, payMode) || other.payMode == payMode)&&(identical(other.totalKwh, totalKwh) || other.totalKwh == totalKwh)&&(identical(other.remainderKwh, remainderKwh) || other.remainderKwh == remainderKwh)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.maxPower, maxPower) || other.maxPower == maxPower)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.syncKwhDate, syncKwhDate) || other.syncKwhDate == syncKwhDate)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,electricMeterId,online,rssi,onOff,name,number,payMode,totalKwh,remainderKwh,price,electricQuantity,maxPower,mac,featureValue,modelNum,hardwareRevision,firmwareRevision,syncKwhDate,groupName,groupId]);

@override
String toString() {
  return 'ElectricMeterDto(electricMeterId: $electricMeterId, online: $online, rssi: $rssi, onOff: $onOff, name: $name, number: $number, payMode: $payMode, totalKwh: $totalKwh, remainderKwh: $remainderKwh, price: $price, electricQuantity: $electricQuantity, maxPower: $maxPower, mac: $mac, featureValue: $featureValue, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, syncKwhDate: $syncKwhDate, groupName: $groupName, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterDtoCopyWith<$Res>  {
  factory $ElectricMeterDtoCopyWith(ElectricMeterDto value, $Res Function(ElectricMeterDto) _then) = _$ElectricMeterDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'electricMeterId', fromJson: intFromDynamic) int electricMeterId,@JsonKey(name: 'online', fromJson: boolFromDynamic) bool online,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'onOff', fromJson: intFromDynamic) int onOff,@JsonKey(name: 'name') String name,@JsonKey(name: 'number') String number,@JsonKey(name: 'payMode', fromJson: intFromDynamic) int payMode,@JsonKey(name: 'totalKwh', fromJson: stringFromDynamic) String totalKwh,@JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) String remainderKwh,@JsonKey(name: 'price', fromJson: stringFromDynamic) String price,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'maxPower', fromJson: stringFromDynamic) String maxPower,@JsonKey(name: 'mac') String mac,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'modelNum') String modelNum,@JsonKey(name: 'hardwareRevision') String hardwareRevision,@JsonKey(name: 'firmwareRevision') String firmwareRevision,@JsonKey(name: 'syncKwhDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? syncKwhDate,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId
});




}
/// @nodoc
class _$ElectricMeterDtoCopyWithImpl<$Res>
    implements $ElectricMeterDtoCopyWith<$Res> {
  _$ElectricMeterDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterDto _self;
  final $Res Function(ElectricMeterDto) _then;

/// Create a copy of ElectricMeterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? electricMeterId = null,Object? online = null,Object? rssi = null,Object? onOff = null,Object? name = null,Object? number = null,Object? payMode = null,Object? totalKwh = null,Object? remainderKwh = null,Object? price = null,Object? electricQuantity = null,Object? maxPower = null,Object? mac = null,Object? featureValue = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? syncKwhDate = freezed,Object? groupName = null,Object? groupId = null,}) {
  return _then(_self.copyWith(
electricMeterId: null == electricMeterId ? _self.electricMeterId : electricMeterId // ignore: cast_nullable_to_non_nullable
as int,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,onOff: null == onOff ? _self.onOff : onOff // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,payMode: null == payMode ? _self.payMode : payMode // ignore: cast_nullable_to_non_nullable
as int,totalKwh: null == totalKwh ? _self.totalKwh : totalKwh // ignore: cast_nullable_to_non_nullable
as String,remainderKwh: null == remainderKwh ? _self.remainderKwh : remainderKwh // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,maxPower: null == maxPower ? _self.maxPower : maxPower // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ElectricMeterDto].
extension ElectricMeterDtoPatterns on ElectricMeterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'electricMeterId', fromJson: intFromDynamic)  int electricMeterId, @JsonKey(name: 'online', fromJson: boolFromDynamic)  bool online, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'onOff', fromJson: intFromDynamic)  int onOff, @JsonKey(name: 'name')  String name, @JsonKey(name: 'number')  String number, @JsonKey(name: 'payMode', fromJson: intFromDynamic)  int payMode, @JsonKey(name: 'totalKwh', fromJson: stringFromDynamic)  String totalKwh, @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic)  String remainderKwh, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'maxPower', fromJson: stringFromDynamic)  String maxPower, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision, @JsonKey(name: 'syncKwhDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? syncKwhDate, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterDto() when $default != null:
return $default(_that.electricMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalKwh,_that.remainderKwh,_that.price,_that.electricQuantity,_that.maxPower,_that.mac,_that.featureValue,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncKwhDate,_that.groupName,_that.groupId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'electricMeterId', fromJson: intFromDynamic)  int electricMeterId, @JsonKey(name: 'online', fromJson: boolFromDynamic)  bool online, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'onOff', fromJson: intFromDynamic)  int onOff, @JsonKey(name: 'name')  String name, @JsonKey(name: 'number')  String number, @JsonKey(name: 'payMode', fromJson: intFromDynamic)  int payMode, @JsonKey(name: 'totalKwh', fromJson: stringFromDynamic)  String totalKwh, @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic)  String remainderKwh, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'maxPower', fromJson: stringFromDynamic)  String maxPower, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision, @JsonKey(name: 'syncKwhDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? syncKwhDate, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterDto():
return $default(_that.electricMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalKwh,_that.remainderKwh,_that.price,_that.electricQuantity,_that.maxPower,_that.mac,_that.featureValue,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncKwhDate,_that.groupName,_that.groupId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'electricMeterId', fromJson: intFromDynamic)  int electricMeterId, @JsonKey(name: 'online', fromJson: boolFromDynamic)  bool online, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'onOff', fromJson: intFromDynamic)  int onOff, @JsonKey(name: 'name')  String name, @JsonKey(name: 'number')  String number, @JsonKey(name: 'payMode', fromJson: intFromDynamic)  int payMode, @JsonKey(name: 'totalKwh', fromJson: stringFromDynamic)  String totalKwh, @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic)  String remainderKwh, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'maxPower', fromJson: stringFromDynamic)  String maxPower, @JsonKey(name: 'mac')  String mac, @JsonKey(name: 'featureValue')  String featureValue, @JsonKey(name: 'modelNum')  String modelNum, @JsonKey(name: 'hardwareRevision')  String hardwareRevision, @JsonKey(name: 'firmwareRevision')  String firmwareRevision, @JsonKey(name: 'syncKwhDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson)  DateTime? syncKwhDate, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterDto() when $default != null:
return $default(_that.electricMeterId,_that.online,_that.rssi,_that.onOff,_that.name,_that.number,_that.payMode,_that.totalKwh,_that.remainderKwh,_that.price,_that.electricQuantity,_that.maxPower,_that.mac,_that.featureValue,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.syncKwhDate,_that.groupName,_that.groupId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterDto extends ElectricMeterDto {
  const _ElectricMeterDto({@JsonKey(name: 'electricMeterId', fromJson: intFromDynamic) this.electricMeterId = 0, @JsonKey(name: 'online', fromJson: boolFromDynamic) this.online = false, @JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, @JsonKey(name: 'onOff', fromJson: intFromDynamic) this.onOff = 2, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'number') this.number = '', @JsonKey(name: 'payMode', fromJson: intFromDynamic) this.payMode = 0, @JsonKey(name: 'totalKwh', fromJson: stringFromDynamic) this.totalKwh = '', @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) this.remainderKwh = '', @JsonKey(name: 'price', fromJson: stringFromDynamic) this.price = '', @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'maxPower', fromJson: stringFromDynamic) this.maxPower = '', @JsonKey(name: 'mac') this.mac = '', @JsonKey(name: 'featureValue') this.featureValue = '', @JsonKey(name: 'modelNum') this.modelNum = '', @JsonKey(name: 'hardwareRevision') this.hardwareRevision = '', @JsonKey(name: 'firmwareRevision') this.firmwareRevision = '', @JsonKey(name: 'syncKwhDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) this.syncKwhDate, @JsonKey(name: 'groupName') this.groupName = '', @JsonKey(name: 'groupId', fromJson: intFromDynamic) this.groupId = 0}): super._();
  factory _ElectricMeterDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterDtoFromJson(json);

@override@JsonKey(name: 'electricMeterId', fromJson: intFromDynamic) final  int electricMeterId;
@override@JsonKey(name: 'online', fromJson: boolFromDynamic) final  bool online;
@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey(name: 'onOff', fromJson: intFromDynamic) final  int onOff;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'number') final  String number;
@override@JsonKey(name: 'payMode', fromJson: intFromDynamic) final  int payMode;
@override@JsonKey(name: 'totalKwh', fromJson: stringFromDynamic) final  String totalKwh;
@override@JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) final  String remainderKwh;
@override@JsonKey(name: 'price', fromJson: stringFromDynamic) final  String price;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
@override@JsonKey(name: 'maxPower', fromJson: stringFromDynamic) final  String maxPower;
@override@JsonKey(name: 'mac') final  String mac;
@override@JsonKey(name: 'featureValue') final  String featureValue;
@override@JsonKey(name: 'modelNum') final  String modelNum;
@override@JsonKey(name: 'hardwareRevision') final  String hardwareRevision;
@override@JsonKey(name: 'firmwareRevision') final  String firmwareRevision;
@override@JsonKey(name: 'syncKwhDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) final  DateTime? syncKwhDate;
@override@JsonKey(name: 'groupName') final  String groupName;
@override@JsonKey(name: 'groupId', fromJson: intFromDynamic) final  int groupId;

/// Create a copy of ElectricMeterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterDtoCopyWith<_ElectricMeterDto> get copyWith => __$ElectricMeterDtoCopyWithImpl<_ElectricMeterDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterDto&&(identical(other.electricMeterId, electricMeterId) || other.electricMeterId == electricMeterId)&&(identical(other.online, online) || other.online == online)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.onOff, onOff) || other.onOff == onOff)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.payMode, payMode) || other.payMode == payMode)&&(identical(other.totalKwh, totalKwh) || other.totalKwh == totalKwh)&&(identical(other.remainderKwh, remainderKwh) || other.remainderKwh == remainderKwh)&&(identical(other.price, price) || other.price == price)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.maxPower, maxPower) || other.maxPower == maxPower)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.syncKwhDate, syncKwhDate) || other.syncKwhDate == syncKwhDate)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupId, groupId) || other.groupId == groupId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,electricMeterId,online,rssi,onOff,name,number,payMode,totalKwh,remainderKwh,price,electricQuantity,maxPower,mac,featureValue,modelNum,hardwareRevision,firmwareRevision,syncKwhDate,groupName,groupId]);

@override
String toString() {
  return 'ElectricMeterDto(electricMeterId: $electricMeterId, online: $online, rssi: $rssi, onOff: $onOff, name: $name, number: $number, payMode: $payMode, totalKwh: $totalKwh, remainderKwh: $remainderKwh, price: $price, electricQuantity: $electricQuantity, maxPower: $maxPower, mac: $mac, featureValue: $featureValue, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, syncKwhDate: $syncKwhDate, groupName: $groupName, groupId: $groupId)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterDtoCopyWith<$Res> implements $ElectricMeterDtoCopyWith<$Res> {
  factory _$ElectricMeterDtoCopyWith(_ElectricMeterDto value, $Res Function(_ElectricMeterDto) _then) = __$ElectricMeterDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'electricMeterId', fromJson: intFromDynamic) int electricMeterId,@JsonKey(name: 'online', fromJson: boolFromDynamic) bool online,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'onOff', fromJson: intFromDynamic) int onOff,@JsonKey(name: 'name') String name,@JsonKey(name: 'number') String number,@JsonKey(name: 'payMode', fromJson: intFromDynamic) int payMode,@JsonKey(name: 'totalKwh', fromJson: stringFromDynamic) String totalKwh,@JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) String remainderKwh,@JsonKey(name: 'price', fromJson: stringFromDynamic) String price,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'maxPower', fromJson: stringFromDynamic) String maxPower,@JsonKey(name: 'mac') String mac,@JsonKey(name: 'featureValue') String featureValue,@JsonKey(name: 'modelNum') String modelNum,@JsonKey(name: 'hardwareRevision') String hardwareRevision,@JsonKey(name: 'firmwareRevision') String firmwareRevision,@JsonKey(name: 'syncKwhDate', fromJson: nullableDateTimeMsFromJson, toJson: nullableDateTimeMsToJson) DateTime? syncKwhDate,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId
});




}
/// @nodoc
class __$ElectricMeterDtoCopyWithImpl<$Res>
    implements _$ElectricMeterDtoCopyWith<$Res> {
  __$ElectricMeterDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterDto _self;
  final $Res Function(_ElectricMeterDto) _then;

/// Create a copy of ElectricMeterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? electricMeterId = null,Object? online = null,Object? rssi = null,Object? onOff = null,Object? name = null,Object? number = null,Object? payMode = null,Object? totalKwh = null,Object? remainderKwh = null,Object? price = null,Object? electricQuantity = null,Object? maxPower = null,Object? mac = null,Object? featureValue = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? syncKwhDate = freezed,Object? groupName = null,Object? groupId = null,}) {
  return _then(_ElectricMeterDto(
electricMeterId: null == electricMeterId ? _self.electricMeterId : electricMeterId // ignore: cast_nullable_to_non_nullable
as int,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,onOff: null == onOff ? _self.onOff : onOff // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,payMode: null == payMode ? _self.payMode : payMode // ignore: cast_nullable_to_non_nullable
as int,totalKwh: null == totalKwh ? _self.totalKwh : totalKwh // ignore: cast_nullable_to_non_nullable
as String,remainderKwh: null == remainderKwh ? _self.remainderKwh : remainderKwh // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,maxPower: null == maxPower ? _self.maxPower : maxPower // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
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
mixin _$ElectricMeterUsageRecordDto {

@JsonKey(name: 'dateType', fromJson: intFromDynamic) int get dateType;@JsonKey(name: 'usedKwh', fromJson: stringFromDynamic) String get usedKwh;@JsonKey(name: 'createDate', fromJson: stringFromDynamic) String get createDate;
/// Create a copy of ElectricMeterUsageRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterUsageRecordDtoCopyWith<ElectricMeterUsageRecordDto> get copyWith => _$ElectricMeterUsageRecordDtoCopyWithImpl<ElectricMeterUsageRecordDto>(this as ElectricMeterUsageRecordDto, _$identity);

  /// Serializes this ElectricMeterUsageRecordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterUsageRecordDto&&(identical(other.dateType, dateType) || other.dateType == dateType)&&(identical(other.usedKwh, usedKwh) || other.usedKwh == usedKwh)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateType,usedKwh,createDate);

@override
String toString() {
  return 'ElectricMeterUsageRecordDto(dateType: $dateType, usedKwh: $usedKwh, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterUsageRecordDtoCopyWith<$Res>  {
  factory $ElectricMeterUsageRecordDtoCopyWith(ElectricMeterUsageRecordDto value, $Res Function(ElectricMeterUsageRecordDto) _then) = _$ElectricMeterUsageRecordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dateType', fromJson: intFromDynamic) int dateType,@JsonKey(name: 'usedKwh', fromJson: stringFromDynamic) String usedKwh,@JsonKey(name: 'createDate', fromJson: stringFromDynamic) String createDate
});




}
/// @nodoc
class _$ElectricMeterUsageRecordDtoCopyWithImpl<$Res>
    implements $ElectricMeterUsageRecordDtoCopyWith<$Res> {
  _$ElectricMeterUsageRecordDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterUsageRecordDto _self;
  final $Res Function(ElectricMeterUsageRecordDto) _then;

/// Create a copy of ElectricMeterUsageRecordDto
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


/// Adds pattern-matching-related methods to [ElectricMeterUsageRecordDto].
extension ElectricMeterUsageRecordDtoPatterns on ElectricMeterUsageRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterUsageRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterUsageRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterUsageRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dateType', fromJson: intFromDynamic)  int dateType, @JsonKey(name: 'usedKwh', fromJson: stringFromDynamic)  String usedKwh, @JsonKey(name: 'createDate', fromJson: stringFromDynamic)  String createDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dateType', fromJson: intFromDynamic)  int dateType, @JsonKey(name: 'usedKwh', fromJson: stringFromDynamic)  String usedKwh, @JsonKey(name: 'createDate', fromJson: stringFromDynamic)  String createDate)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dateType', fromJson: intFromDynamic)  int dateType, @JsonKey(name: 'usedKwh', fromJson: stringFromDynamic)  String usedKwh, @JsonKey(name: 'createDate', fromJson: stringFromDynamic)  String createDate)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterUsageRecordDto() when $default != null:
return $default(_that.dateType,_that.usedKwh,_that.createDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterUsageRecordDto extends ElectricMeterUsageRecordDto {
  const _ElectricMeterUsageRecordDto({@JsonKey(name: 'dateType', fromJson: intFromDynamic) this.dateType = 0, @JsonKey(name: 'usedKwh', fromJson: stringFromDynamic) this.usedKwh = '', @JsonKey(name: 'createDate', fromJson: stringFromDynamic) this.createDate = ''}): super._();
  factory _ElectricMeterUsageRecordDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterUsageRecordDtoFromJson(json);

@override@JsonKey(name: 'dateType', fromJson: intFromDynamic) final  int dateType;
@override@JsonKey(name: 'usedKwh', fromJson: stringFromDynamic) final  String usedKwh;
@override@JsonKey(name: 'createDate', fromJson: stringFromDynamic) final  String createDate;

/// Create a copy of ElectricMeterUsageRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterUsageRecordDtoCopyWith<_ElectricMeterUsageRecordDto> get copyWith => __$ElectricMeterUsageRecordDtoCopyWithImpl<_ElectricMeterUsageRecordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterUsageRecordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterUsageRecordDto&&(identical(other.dateType, dateType) || other.dateType == dateType)&&(identical(other.usedKwh, usedKwh) || other.usedKwh == usedKwh)&&(identical(other.createDate, createDate) || other.createDate == createDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateType,usedKwh,createDate);

@override
String toString() {
  return 'ElectricMeterUsageRecordDto(dateType: $dateType, usedKwh: $usedKwh, createDate: $createDate)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterUsageRecordDtoCopyWith<$Res> implements $ElectricMeterUsageRecordDtoCopyWith<$Res> {
  factory _$ElectricMeterUsageRecordDtoCopyWith(_ElectricMeterUsageRecordDto value, $Res Function(_ElectricMeterUsageRecordDto) _then) = __$ElectricMeterUsageRecordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dateType', fromJson: intFromDynamic) int dateType,@JsonKey(name: 'usedKwh', fromJson: stringFromDynamic) String usedKwh,@JsonKey(name: 'createDate', fromJson: stringFromDynamic) String createDate
});




}
/// @nodoc
class __$ElectricMeterUsageRecordDtoCopyWithImpl<$Res>
    implements _$ElectricMeterUsageRecordDtoCopyWith<$Res> {
  __$ElectricMeterUsageRecordDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterUsageRecordDto _self;
  final $Res Function(_ElectricMeterUsageRecordDto) _then;

/// Create a copy of ElectricMeterUsageRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateType = null,Object? usedKwh = null,Object? createDate = null,}) {
  return _then(_ElectricMeterUsageRecordDto(
dateType: null == dateType ? _self.dateType : dateType // ignore: cast_nullable_to_non_nullable
as int,usedKwh: null == usedKwh ? _self.usedKwh : usedKwh // ignore: cast_nullable_to_non_nullable
as String,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ElectricMeterOperationRecordDto {

@JsonKey(name: 'id', fromJson: intFromDynamic) int get id;@JsonKey(name: 'recordType', fromJson: stringFromDynamic) String get recordType;@JsonKey(name: 'title') String get title;@JsonKey(name: 'content') String get content;@JsonKey(name: 'date', fromJson: stringFromDynamic) String get date;@JsonKey(name: 'headUrl') String get headUrl;
/// Create a copy of ElectricMeterOperationRecordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterOperationRecordDtoCopyWith<ElectricMeterOperationRecordDto> get copyWith => _$ElectricMeterOperationRecordDtoCopyWithImpl<ElectricMeterOperationRecordDto>(this as ElectricMeterOperationRecordDto, _$identity);

  /// Serializes this ElectricMeterOperationRecordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterOperationRecordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.date, date) || other.date == date)&&(identical(other.headUrl, headUrl) || other.headUrl == headUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recordType,title,content,date,headUrl);

@override
String toString() {
  return 'ElectricMeterOperationRecordDto(id: $id, recordType: $recordType, title: $title, content: $content, date: $date, headUrl: $headUrl)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterOperationRecordDtoCopyWith<$Res>  {
  factory $ElectricMeterOperationRecordDtoCopyWith(ElectricMeterOperationRecordDto value, $Res Function(ElectricMeterOperationRecordDto) _then) = _$ElectricMeterOperationRecordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'recordType', fromJson: stringFromDynamic) String recordType,@JsonKey(name: 'title') String title,@JsonKey(name: 'content') String content,@JsonKey(name: 'date', fromJson: stringFromDynamic) String date,@JsonKey(name: 'headUrl') String headUrl
});




}
/// @nodoc
class _$ElectricMeterOperationRecordDtoCopyWithImpl<$Res>
    implements $ElectricMeterOperationRecordDtoCopyWith<$Res> {
  _$ElectricMeterOperationRecordDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterOperationRecordDto _self;
  final $Res Function(ElectricMeterOperationRecordDto) _then;

/// Create a copy of ElectricMeterOperationRecordDto
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


/// Adds pattern-matching-related methods to [ElectricMeterOperationRecordDto].
extension ElectricMeterOperationRecordDtoPatterns on ElectricMeterOperationRecordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterOperationRecordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterOperationRecordDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterOperationRecordDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterOperationRecordDto() when $default != null:
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
case _ElectricMeterOperationRecordDto() when $default != null:
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
case _ElectricMeterOperationRecordDto():
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
case _ElectricMeterOperationRecordDto() when $default != null:
return $default(_that.id,_that.recordType,_that.title,_that.content,_that.date,_that.headUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterOperationRecordDto extends ElectricMeterOperationRecordDto {
  const _ElectricMeterOperationRecordDto({@JsonKey(name: 'id', fromJson: intFromDynamic) this.id = 0, @JsonKey(name: 'recordType', fromJson: stringFromDynamic) this.recordType = '', @JsonKey(name: 'title') this.title = '', @JsonKey(name: 'content') this.content = '', @JsonKey(name: 'date', fromJson: stringFromDynamic) this.date = '', @JsonKey(name: 'headUrl') this.headUrl = ''}): super._();
  factory _ElectricMeterOperationRecordDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterOperationRecordDtoFromJson(json);

@override@JsonKey(name: 'id', fromJson: intFromDynamic) final  int id;
@override@JsonKey(name: 'recordType', fromJson: stringFromDynamic) final  String recordType;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'content') final  String content;
@override@JsonKey(name: 'date', fromJson: stringFromDynamic) final  String date;
@override@JsonKey(name: 'headUrl') final  String headUrl;

/// Create a copy of ElectricMeterOperationRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterOperationRecordDtoCopyWith<_ElectricMeterOperationRecordDto> get copyWith => __$ElectricMeterOperationRecordDtoCopyWithImpl<_ElectricMeterOperationRecordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterOperationRecordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterOperationRecordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.date, date) || other.date == date)&&(identical(other.headUrl, headUrl) || other.headUrl == headUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recordType,title,content,date,headUrl);

@override
String toString() {
  return 'ElectricMeterOperationRecordDto(id: $id, recordType: $recordType, title: $title, content: $content, date: $date, headUrl: $headUrl)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterOperationRecordDtoCopyWith<$Res> implements $ElectricMeterOperationRecordDtoCopyWith<$Res> {
  factory _$ElectricMeterOperationRecordDtoCopyWith(_ElectricMeterOperationRecordDto value, $Res Function(_ElectricMeterOperationRecordDto) _then) = __$ElectricMeterOperationRecordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'recordType', fromJson: stringFromDynamic) String recordType,@JsonKey(name: 'title') String title,@JsonKey(name: 'content') String content,@JsonKey(name: 'date', fromJson: stringFromDynamic) String date,@JsonKey(name: 'headUrl') String headUrl
});




}
/// @nodoc
class __$ElectricMeterOperationRecordDtoCopyWithImpl<$Res>
    implements _$ElectricMeterOperationRecordDtoCopyWith<$Res> {
  __$ElectricMeterOperationRecordDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterOperationRecordDto _self;
  final $Res Function(_ElectricMeterOperationRecordDto) _then;

/// Create a copy of ElectricMeterOperationRecordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recordType = null,Object? title = null,Object? content = null,Object? date = null,Object? headUrl = null,}) {
  return _then(_ElectricMeterOperationRecordDto(
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
mixin _$ElectricMeterGroupDto {

@JsonKey(name: 'groupId', fromJson: intFromDynamic) int get groupId;@JsonKey(name: 'groupName') String get groupName;@JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic) int get electricMeterCount;
/// Create a copy of ElectricMeterGroupDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterGroupDtoCopyWith<ElectricMeterGroupDto> get copyWith => _$ElectricMeterGroupDtoCopyWithImpl<ElectricMeterGroupDto>(this as ElectricMeterGroupDto, _$identity);

  /// Serializes this ElectricMeterGroupDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterGroupDto&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.electricMeterCount, electricMeterCount) || other.electricMeterCount == electricMeterCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,electricMeterCount);

@override
String toString() {
  return 'ElectricMeterGroupDto(groupId: $groupId, groupName: $groupName, electricMeterCount: $electricMeterCount)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterGroupDtoCopyWith<$Res>  {
  factory $ElectricMeterGroupDtoCopyWith(ElectricMeterGroupDto value, $Res Function(ElectricMeterGroupDto) _then) = _$ElectricMeterGroupDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic) int electricMeterCount
});




}
/// @nodoc
class _$ElectricMeterGroupDtoCopyWithImpl<$Res>
    implements $ElectricMeterGroupDtoCopyWith<$Res> {
  _$ElectricMeterGroupDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterGroupDto _self;
  final $Res Function(ElectricMeterGroupDto) _then;

/// Create a copy of ElectricMeterGroupDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? groupName = null,Object? electricMeterCount = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,electricMeterCount: null == electricMeterCount ? _self.electricMeterCount : electricMeterCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricMeterGroupDto].
extension ElectricMeterGroupDtoPatterns on ElectricMeterGroupDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterGroupDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterGroupDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterGroupDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterGroupDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterGroupDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterGroupDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic)  int electricMeterCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterGroupDto() when $default != null:
return $default(_that.groupId,_that.groupName,_that.electricMeterCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic)  int electricMeterCount)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterGroupDto():
return $default(_that.groupId,_that.groupName,_that.electricMeterCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'groupId', fromJson: intFromDynamic)  int groupId, @JsonKey(name: 'groupName')  String groupName, @JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic)  int electricMeterCount)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterGroupDto() when $default != null:
return $default(_that.groupId,_that.groupName,_that.electricMeterCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterGroupDto implements ElectricMeterGroupDto {
  const _ElectricMeterGroupDto({@JsonKey(name: 'groupId', fromJson: intFromDynamic) this.groupId = 0, @JsonKey(name: 'groupName') this.groupName = '', @JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic) this.electricMeterCount = 0});
  factory _ElectricMeterGroupDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterGroupDtoFromJson(json);

@override@JsonKey(name: 'groupId', fromJson: intFromDynamic) final  int groupId;
@override@JsonKey(name: 'groupName') final  String groupName;
@override@JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic) final  int electricMeterCount;

/// Create a copy of ElectricMeterGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterGroupDtoCopyWith<_ElectricMeterGroupDto> get copyWith => __$ElectricMeterGroupDtoCopyWithImpl<_ElectricMeterGroupDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterGroupDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterGroupDto&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.electricMeterCount, electricMeterCount) || other.electricMeterCount == electricMeterCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,groupName,electricMeterCount);

@override
String toString() {
  return 'ElectricMeterGroupDto(groupId: $groupId, groupName: $groupName, electricMeterCount: $electricMeterCount)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterGroupDtoCopyWith<$Res> implements $ElectricMeterGroupDtoCopyWith<$Res> {
  factory _$ElectricMeterGroupDtoCopyWith(_ElectricMeterGroupDto value, $Res Function(_ElectricMeterGroupDto) _then) = __$ElectricMeterGroupDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'groupId', fromJson: intFromDynamic) int groupId,@JsonKey(name: 'groupName') String groupName,@JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic) int electricMeterCount
});




}
/// @nodoc
class __$ElectricMeterGroupDtoCopyWithImpl<$Res>
    implements _$ElectricMeterGroupDtoCopyWith<$Res> {
  __$ElectricMeterGroupDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterGroupDto _self;
  final $Res Function(_ElectricMeterGroupDto) _then;

/// Create a copy of ElectricMeterGroupDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? groupName = null,Object? electricMeterCount = null,}) {
  return _then(_ElectricMeterGroupDto(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,electricMeterCount: null == electricMeterCount ? _self.electricMeterCount : electricMeterCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ElectricMeterTaskDto {

@JsonKey(name: 'id', fromJson: intFromDynamic) int get id;@JsonKey(name: 'taskType', fromJson: intFromDynamic) int get taskType;@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi;@JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic) String get rechargeAmount;@JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) String get remainderKwh;@JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic) String get rechargeKwh;@JsonKey(name: 'usedFlag', fromJson: intFromDynamic) int get usedFlag;@JsonKey(name: 'price', fromJson: stringFromDynamic) String get price;@JsonKey(name: 'executeToken') String get executeToken;
/// Create a copy of ElectricMeterTaskDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterTaskDtoCopyWith<ElectricMeterTaskDto> get copyWith => _$ElectricMeterTaskDtoCopyWithImpl<ElectricMeterTaskDto>(this as ElectricMeterTaskDto, _$identity);

  /// Serializes this ElectricMeterTaskDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterTaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.taskType, taskType) || other.taskType == taskType)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.rechargeAmount, rechargeAmount) || other.rechargeAmount == rechargeAmount)&&(identical(other.remainderKwh, remainderKwh) || other.remainderKwh == remainderKwh)&&(identical(other.rechargeKwh, rechargeKwh) || other.rechargeKwh == rechargeKwh)&&(identical(other.usedFlag, usedFlag) || other.usedFlag == usedFlag)&&(identical(other.price, price) || other.price == price)&&(identical(other.executeToken, executeToken) || other.executeToken == executeToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskType,rssi,rechargeAmount,remainderKwh,rechargeKwh,usedFlag,price,executeToken);

@override
String toString() {
  return 'ElectricMeterTaskDto(id: $id, taskType: $taskType, rssi: $rssi, rechargeAmount: $rechargeAmount, remainderKwh: $remainderKwh, rechargeKwh: $rechargeKwh, usedFlag: $usedFlag, price: $price, executeToken: $executeToken)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterTaskDtoCopyWith<$Res>  {
  factory $ElectricMeterTaskDtoCopyWith(ElectricMeterTaskDto value, $Res Function(ElectricMeterTaskDto) _then) = _$ElectricMeterTaskDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'taskType', fromJson: intFromDynamic) int taskType,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic) String rechargeAmount,@JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) String remainderKwh,@JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic) String rechargeKwh,@JsonKey(name: 'usedFlag', fromJson: intFromDynamic) int usedFlag,@JsonKey(name: 'price', fromJson: stringFromDynamic) String price,@JsonKey(name: 'executeToken') String executeToken
});




}
/// @nodoc
class _$ElectricMeterTaskDtoCopyWithImpl<$Res>
    implements $ElectricMeterTaskDtoCopyWith<$Res> {
  _$ElectricMeterTaskDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterTaskDto _self;
  final $Res Function(ElectricMeterTaskDto) _then;

/// Create a copy of ElectricMeterTaskDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskType = null,Object? rssi = null,Object? rechargeAmount = null,Object? remainderKwh = null,Object? rechargeKwh = null,Object? usedFlag = null,Object? price = null,Object? executeToken = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,taskType: null == taskType ? _self.taskType : taskType // ignore: cast_nullable_to_non_nullable
as int,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,rechargeAmount: null == rechargeAmount ? _self.rechargeAmount : rechargeAmount // ignore: cast_nullable_to_non_nullable
as String,remainderKwh: null == remainderKwh ? _self.remainderKwh : remainderKwh // ignore: cast_nullable_to_non_nullable
as String,rechargeKwh: null == rechargeKwh ? _self.rechargeKwh : rechargeKwh // ignore: cast_nullable_to_non_nullable
as String,usedFlag: null == usedFlag ? _self.usedFlag : usedFlag // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,executeToken: null == executeToken ? _self.executeToken : executeToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricMeterTaskDto].
extension ElectricMeterTaskDtoPatterns on ElectricMeterTaskDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterTaskDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterTaskDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterTaskDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterTaskDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterTaskDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterTaskDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'taskType', fromJson: intFromDynamic)  int taskType, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic)  String rechargeAmount, @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic)  String remainderKwh, @JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic)  String rechargeKwh, @JsonKey(name: 'usedFlag', fromJson: intFromDynamic)  int usedFlag, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'executeToken')  String executeToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterTaskDto() when $default != null:
return $default(_that.id,_that.taskType,_that.rssi,_that.rechargeAmount,_that.remainderKwh,_that.rechargeKwh,_that.usedFlag,_that.price,_that.executeToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'taskType', fromJson: intFromDynamic)  int taskType, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic)  String rechargeAmount, @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic)  String remainderKwh, @JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic)  String rechargeKwh, @JsonKey(name: 'usedFlag', fromJson: intFromDynamic)  int usedFlag, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'executeToken')  String executeToken)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterTaskDto():
return $default(_that.id,_that.taskType,_that.rssi,_that.rechargeAmount,_that.remainderKwh,_that.rechargeKwh,_that.usedFlag,_that.price,_that.executeToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: intFromDynamic)  int id, @JsonKey(name: 'taskType', fromJson: intFromDynamic)  int taskType, @JsonKey(name: 'rssi', fromJson: intFromDynamic)  int rssi, @JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic)  String rechargeAmount, @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic)  String remainderKwh, @JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic)  String rechargeKwh, @JsonKey(name: 'usedFlag', fromJson: intFromDynamic)  int usedFlag, @JsonKey(name: 'price', fromJson: stringFromDynamic)  String price, @JsonKey(name: 'executeToken')  String executeToken)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterTaskDto() when $default != null:
return $default(_that.id,_that.taskType,_that.rssi,_that.rechargeAmount,_that.remainderKwh,_that.rechargeKwh,_that.usedFlag,_that.price,_that.executeToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterTaskDto implements ElectricMeterTaskDto {
  const _ElectricMeterTaskDto({@JsonKey(name: 'id', fromJson: intFromDynamic) this.id = 0, @JsonKey(name: 'taskType', fromJson: intFromDynamic) this.taskType = 0, @JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, @JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic) this.rechargeAmount = '', @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) this.remainderKwh = '', @JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic) this.rechargeKwh = '', @JsonKey(name: 'usedFlag', fromJson: intFromDynamic) this.usedFlag = 0, @JsonKey(name: 'price', fromJson: stringFromDynamic) this.price = '', @JsonKey(name: 'executeToken') this.executeToken = ''});
  factory _ElectricMeterTaskDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterTaskDtoFromJson(json);

@override@JsonKey(name: 'id', fromJson: intFromDynamic) final  int id;
@override@JsonKey(name: 'taskType', fromJson: intFromDynamic) final  int taskType;
@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic) final  String rechargeAmount;
@override@JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) final  String remainderKwh;
@override@JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic) final  String rechargeKwh;
@override@JsonKey(name: 'usedFlag', fromJson: intFromDynamic) final  int usedFlag;
@override@JsonKey(name: 'price', fromJson: stringFromDynamic) final  String price;
@override@JsonKey(name: 'executeToken') final  String executeToken;

/// Create a copy of ElectricMeterTaskDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterTaskDtoCopyWith<_ElectricMeterTaskDto> get copyWith => __$ElectricMeterTaskDtoCopyWithImpl<_ElectricMeterTaskDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterTaskDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterTaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.taskType, taskType) || other.taskType == taskType)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.rechargeAmount, rechargeAmount) || other.rechargeAmount == rechargeAmount)&&(identical(other.remainderKwh, remainderKwh) || other.remainderKwh == remainderKwh)&&(identical(other.rechargeKwh, rechargeKwh) || other.rechargeKwh == rechargeKwh)&&(identical(other.usedFlag, usedFlag) || other.usedFlag == usedFlag)&&(identical(other.price, price) || other.price == price)&&(identical(other.executeToken, executeToken) || other.executeToken == executeToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskType,rssi,rechargeAmount,remainderKwh,rechargeKwh,usedFlag,price,executeToken);

@override
String toString() {
  return 'ElectricMeterTaskDto(id: $id, taskType: $taskType, rssi: $rssi, rechargeAmount: $rechargeAmount, remainderKwh: $remainderKwh, rechargeKwh: $rechargeKwh, usedFlag: $usedFlag, price: $price, executeToken: $executeToken)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterTaskDtoCopyWith<$Res> implements $ElectricMeterTaskDtoCopyWith<$Res> {
  factory _$ElectricMeterTaskDtoCopyWith(_ElectricMeterTaskDto value, $Res Function(_ElectricMeterTaskDto) _then) = __$ElectricMeterTaskDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: intFromDynamic) int id,@JsonKey(name: 'taskType', fromJson: intFromDynamic) int taskType,@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic) String rechargeAmount,@JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic) String remainderKwh,@JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic) String rechargeKwh,@JsonKey(name: 'usedFlag', fromJson: intFromDynamic) int usedFlag,@JsonKey(name: 'price', fromJson: stringFromDynamic) String price,@JsonKey(name: 'executeToken') String executeToken
});




}
/// @nodoc
class __$ElectricMeterTaskDtoCopyWithImpl<$Res>
    implements _$ElectricMeterTaskDtoCopyWith<$Res> {
  __$ElectricMeterTaskDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterTaskDto _self;
  final $Res Function(_ElectricMeterTaskDto) _then;

/// Create a copy of ElectricMeterTaskDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskType = null,Object? rssi = null,Object? rechargeAmount = null,Object? remainderKwh = null,Object? rechargeKwh = null,Object? usedFlag = null,Object? price = null,Object? executeToken = null,}) {
  return _then(_ElectricMeterTaskDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,taskType: null == taskType ? _self.taskType : taskType // ignore: cast_nullable_to_non_nullable
as int,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,rechargeAmount: null == rechargeAmount ? _self.rechargeAmount : rechargeAmount // ignore: cast_nullable_to_non_nullable
as String,remainderKwh: null == remainderKwh ? _self.remainderKwh : remainderKwh // ignore: cast_nullable_to_non_nullable
as String,rechargeKwh: null == rechargeKwh ? _self.rechargeKwh : rechargeKwh // ignore: cast_nullable_to_non_nullable
as String,usedFlag: null == usedFlag ? _self.usedFlag : usedFlag // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,executeToken: null == executeToken ? _self.executeToken : executeToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ElectricMeterGatewayDto {

@JsonKey(name: 'rssi', fromJson: intFromDynamic) int get rssi;@JsonKey(name: 'gatewayName') String get gatewayName;@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int get gatewayVersion;
/// Create a copy of ElectricMeterGatewayDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterGatewayDtoCopyWith<ElectricMeterGatewayDto> get copyWith => _$ElectricMeterGatewayDtoCopyWithImpl<ElectricMeterGatewayDto>(this as ElectricMeterGatewayDto, _$identity);

  /// Serializes this ElectricMeterGatewayDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterGatewayDto&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.gatewayVersion, gatewayVersion) || other.gatewayVersion == gatewayVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rssi,gatewayName,gatewayVersion);

@override
String toString() {
  return 'ElectricMeterGatewayDto(rssi: $rssi, gatewayName: $gatewayName, gatewayVersion: $gatewayVersion)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterGatewayDtoCopyWith<$Res>  {
  factory $ElectricMeterGatewayDtoCopyWith(ElectricMeterGatewayDto value, $Res Function(ElectricMeterGatewayDto) _then) = _$ElectricMeterGatewayDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'gatewayName') String gatewayName,@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int gatewayVersion
});




}
/// @nodoc
class _$ElectricMeterGatewayDtoCopyWithImpl<$Res>
    implements $ElectricMeterGatewayDtoCopyWith<$Res> {
  _$ElectricMeterGatewayDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterGatewayDto _self;
  final $Res Function(ElectricMeterGatewayDto) _then;

/// Create a copy of ElectricMeterGatewayDto
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


/// Adds pattern-matching-related methods to [ElectricMeterGatewayDto].
extension ElectricMeterGatewayDtoPatterns on ElectricMeterGatewayDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterGatewayDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterGatewayDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterGatewayDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterGatewayDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterGatewayDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterGatewayDto() when $default != null:
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
case _ElectricMeterGatewayDto() when $default != null:
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
case _ElectricMeterGatewayDto():
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
case _ElectricMeterGatewayDto() when $default != null:
return $default(_that.rssi,_that.gatewayName,_that.gatewayVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterGatewayDto implements ElectricMeterGatewayDto {
  const _ElectricMeterGatewayDto({@JsonKey(name: 'rssi', fromJson: intFromDynamic) this.rssi = 0, @JsonKey(name: 'gatewayName') this.gatewayName = '', @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) this.gatewayVersion = 0});
  factory _ElectricMeterGatewayDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterGatewayDtoFromJson(json);

@override@JsonKey(name: 'rssi', fromJson: intFromDynamic) final  int rssi;
@override@JsonKey(name: 'gatewayName') final  String gatewayName;
@override@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) final  int gatewayVersion;

/// Create a copy of ElectricMeterGatewayDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterGatewayDtoCopyWith<_ElectricMeterGatewayDto> get copyWith => __$ElectricMeterGatewayDtoCopyWithImpl<_ElectricMeterGatewayDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterGatewayDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterGatewayDto&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.gatewayName, gatewayName) || other.gatewayName == gatewayName)&&(identical(other.gatewayVersion, gatewayVersion) || other.gatewayVersion == gatewayVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rssi,gatewayName,gatewayVersion);

@override
String toString() {
  return 'ElectricMeterGatewayDto(rssi: $rssi, gatewayName: $gatewayName, gatewayVersion: $gatewayVersion)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterGatewayDtoCopyWith<$Res> implements $ElectricMeterGatewayDtoCopyWith<$Res> {
  factory _$ElectricMeterGatewayDtoCopyWith(_ElectricMeterGatewayDto value, $Res Function(_ElectricMeterGatewayDto) _then) = __$ElectricMeterGatewayDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rssi', fromJson: intFromDynamic) int rssi,@JsonKey(name: 'gatewayName') String gatewayName,@JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic) int gatewayVersion
});




}
/// @nodoc
class __$ElectricMeterGatewayDtoCopyWithImpl<$Res>
    implements _$ElectricMeterGatewayDtoCopyWith<$Res> {
  __$ElectricMeterGatewayDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterGatewayDto _self;
  final $Res Function(_ElectricMeterGatewayDto) _then;

/// Create a copy of ElectricMeterGatewayDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rssi = null,Object? gatewayName = null,Object? gatewayVersion = null,}) {
  return _then(_ElectricMeterGatewayDto(
rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,gatewayName: null == gatewayName ? _self.gatewayName : gatewayName // ignore: cast_nullable_to_non_nullable
as String,gatewayVersion: null == gatewayVersion ? _self.gatewayVersion : gatewayVersion // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ElectricMeterUpgradeCheckDto {

@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int get needUpgrade;@JsonKey(name: 'firmwareInfo') Map<String, dynamic>? get firmwareInfo;@JsonKey(name: 'firmwarePackage') String get firmwarePackage;@JsonKey(name: 'version') String get version;
/// Create a copy of ElectricMeterUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterUpgradeCheckDtoCopyWith<ElectricMeterUpgradeCheckDto> get copyWith => _$ElectricMeterUpgradeCheckDtoCopyWithImpl<ElectricMeterUpgradeCheckDto>(this as ElectricMeterUpgradeCheckDto, _$identity);

  /// Serializes this ElectricMeterUpgradeCheckDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&const DeepCollectionEquality().equals(other.firmwareInfo, firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,const DeepCollectionEquality().hash(firmwareInfo),firmwarePackage,version);

@override
String toString() {
  return 'ElectricMeterUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterUpgradeCheckDtoCopyWith<$Res>  {
  factory $ElectricMeterUpgradeCheckDtoCopyWith(ElectricMeterUpgradeCheckDto value, $Res Function(ElectricMeterUpgradeCheckDto) _then) = _$ElectricMeterUpgradeCheckDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') Map<String, dynamic>? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});




}
/// @nodoc
class _$ElectricMeterUpgradeCheckDtoCopyWithImpl<$Res>
    implements $ElectricMeterUpgradeCheckDtoCopyWith<$Res> {
  _$ElectricMeterUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterUpgradeCheckDto _self;
  final $Res Function(ElectricMeterUpgradeCheckDto) _then;

/// Create a copy of ElectricMeterUpgradeCheckDto
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


/// Adds pattern-matching-related methods to [ElectricMeterUpgradeCheckDto].
extension ElectricMeterUpgradeCheckDtoPatterns on ElectricMeterUpgradeCheckDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterUpgradeCheckDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterUpgradeCheckDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterUpgradeCheckDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterUpgradeCheckDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterUpgradeCheckDto() when $default != null:
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
case _ElectricMeterUpgradeCheckDto() when $default != null:
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
case _ElectricMeterUpgradeCheckDto():
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
case _ElectricMeterUpgradeCheckDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterUpgradeCheckDto extends ElectricMeterUpgradeCheckDto {
  const _ElectricMeterUpgradeCheckDto({@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) this.needUpgrade = 0, @JsonKey(name: 'firmwareInfo') final  Map<String, dynamic>? firmwareInfo, @JsonKey(name: 'firmwarePackage') this.firmwarePackage = '', @JsonKey(name: 'version') this.version = ''}): _firmwareInfo = firmwareInfo,super._();
  factory _ElectricMeterUpgradeCheckDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterUpgradeCheckDtoFromJson(json);

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

/// Create a copy of ElectricMeterUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterUpgradeCheckDtoCopyWith<_ElectricMeterUpgradeCheckDto> get copyWith => __$ElectricMeterUpgradeCheckDtoCopyWithImpl<_ElectricMeterUpgradeCheckDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterUpgradeCheckDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&const DeepCollectionEquality().equals(other._firmwareInfo, _firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,const DeepCollectionEquality().hash(_firmwareInfo),firmwarePackage,version);

@override
String toString() {
  return 'ElectricMeterUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterUpgradeCheckDtoCopyWith<$Res> implements $ElectricMeterUpgradeCheckDtoCopyWith<$Res> {
  factory _$ElectricMeterUpgradeCheckDtoCopyWith(_ElectricMeterUpgradeCheckDto value, $Res Function(_ElectricMeterUpgradeCheckDto) _then) = __$ElectricMeterUpgradeCheckDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') Map<String, dynamic>? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});




}
/// @nodoc
class __$ElectricMeterUpgradeCheckDtoCopyWithImpl<$Res>
    implements _$ElectricMeterUpgradeCheckDtoCopyWith<$Res> {
  __$ElectricMeterUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterUpgradeCheckDto _self;
  final $Res Function(_ElectricMeterUpgradeCheckDto) _then;

/// Create a copy of ElectricMeterUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_ElectricMeterUpgradeCheckDto(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self._firmwareInfo : firmwareInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ElectricMeterCatOneDetailDto {

@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int get rssiGrade;@JsonKey(name: 'catOneNodeId') String get catOneNodeId;@JsonKey(name: 'catOneCardNumber') String get catOneCardNumber;@JsonKey(name: 'catOneOperator') String get catOneOperator;@JsonKey(name: 'catOneImsi') String get catOneImsi;@JsonKey(name: 'catOneApn') String get catOneApn;@JsonKey(name: 'overseaCard', fromJson: intFromDynamic) int get overseaCard;
/// Create a copy of ElectricMeterCatOneDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterCatOneDetailDtoCopyWith<ElectricMeterCatOneDetailDto> get copyWith => _$ElectricMeterCatOneDetailDtoCopyWithImpl<ElectricMeterCatOneDetailDto>(this as ElectricMeterCatOneDetailDto, _$identity);

  /// Serializes this ElectricMeterCatOneDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterCatOneDetailDto&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.catOneNodeId, catOneNodeId) || other.catOneNodeId == catOneNodeId)&&(identical(other.catOneCardNumber, catOneCardNumber) || other.catOneCardNumber == catOneCardNumber)&&(identical(other.catOneOperator, catOneOperator) || other.catOneOperator == catOneOperator)&&(identical(other.catOneImsi, catOneImsi) || other.catOneImsi == catOneImsi)&&(identical(other.catOneApn, catOneApn) || other.catOneApn == catOneApn)&&(identical(other.overseaCard, overseaCard) || other.overseaCard == overseaCard));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rssiGrade,catOneNodeId,catOneCardNumber,catOneOperator,catOneImsi,catOneApn,overseaCard);

@override
String toString() {
  return 'ElectricMeterCatOneDetailDto(rssiGrade: $rssiGrade, catOneNodeId: $catOneNodeId, catOneCardNumber: $catOneCardNumber, catOneOperator: $catOneOperator, catOneImsi: $catOneImsi, catOneApn: $catOneApn, overseaCard: $overseaCard)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterCatOneDetailDtoCopyWith<$Res>  {
  factory $ElectricMeterCatOneDetailDtoCopyWith(ElectricMeterCatOneDetailDto value, $Res Function(ElectricMeterCatOneDetailDto) _then) = _$ElectricMeterCatOneDetailDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int rssiGrade,@JsonKey(name: 'catOneNodeId') String catOneNodeId,@JsonKey(name: 'catOneCardNumber') String catOneCardNumber,@JsonKey(name: 'catOneOperator') String catOneOperator,@JsonKey(name: 'catOneImsi') String catOneImsi,@JsonKey(name: 'catOneApn') String catOneApn,@JsonKey(name: 'overseaCard', fromJson: intFromDynamic) int overseaCard
});




}
/// @nodoc
class _$ElectricMeterCatOneDetailDtoCopyWithImpl<$Res>
    implements $ElectricMeterCatOneDetailDtoCopyWith<$Res> {
  _$ElectricMeterCatOneDetailDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterCatOneDetailDto _self;
  final $Res Function(ElectricMeterCatOneDetailDto) _then;

/// Create a copy of ElectricMeterCatOneDetailDto
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


/// Adds pattern-matching-related methods to [ElectricMeterCatOneDetailDto].
extension ElectricMeterCatOneDetailDtoPatterns on ElectricMeterCatOneDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterCatOneDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterCatOneDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterCatOneDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterCatOneDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterCatOneDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterCatOneDetailDto() when $default != null:
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
case _ElectricMeterCatOneDetailDto() when $default != null:
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
case _ElectricMeterCatOneDetailDto():
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
case _ElectricMeterCatOneDetailDto() when $default != null:
return $default(_that.rssiGrade,_that.catOneNodeId,_that.catOneCardNumber,_that.catOneOperator,_that.catOneImsi,_that.catOneApn,_that.overseaCard);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterCatOneDetailDto extends ElectricMeterCatOneDetailDto {
  const _ElectricMeterCatOneDetailDto({@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) this.rssiGrade = 0, @JsonKey(name: 'catOneNodeId') this.catOneNodeId = '', @JsonKey(name: 'catOneCardNumber') this.catOneCardNumber = '', @JsonKey(name: 'catOneOperator') this.catOneOperator = '', @JsonKey(name: 'catOneImsi') this.catOneImsi = '', @JsonKey(name: 'catOneApn') this.catOneApn = '', @JsonKey(name: 'overseaCard', fromJson: intFromDynamic) this.overseaCard = 0}): super._();
  factory _ElectricMeterCatOneDetailDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterCatOneDetailDtoFromJson(json);

@override@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) final  int rssiGrade;
@override@JsonKey(name: 'catOneNodeId') final  String catOneNodeId;
@override@JsonKey(name: 'catOneCardNumber') final  String catOneCardNumber;
@override@JsonKey(name: 'catOneOperator') final  String catOneOperator;
@override@JsonKey(name: 'catOneImsi') final  String catOneImsi;
@override@JsonKey(name: 'catOneApn') final  String catOneApn;
@override@JsonKey(name: 'overseaCard', fromJson: intFromDynamic) final  int overseaCard;

/// Create a copy of ElectricMeterCatOneDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterCatOneDetailDtoCopyWith<_ElectricMeterCatOneDetailDto> get copyWith => __$ElectricMeterCatOneDetailDtoCopyWithImpl<_ElectricMeterCatOneDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterCatOneDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterCatOneDetailDto&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.catOneNodeId, catOneNodeId) || other.catOneNodeId == catOneNodeId)&&(identical(other.catOneCardNumber, catOneCardNumber) || other.catOneCardNumber == catOneCardNumber)&&(identical(other.catOneOperator, catOneOperator) || other.catOneOperator == catOneOperator)&&(identical(other.catOneImsi, catOneImsi) || other.catOneImsi == catOneImsi)&&(identical(other.catOneApn, catOneApn) || other.catOneApn == catOneApn)&&(identical(other.overseaCard, overseaCard) || other.overseaCard == overseaCard));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rssiGrade,catOneNodeId,catOneCardNumber,catOneOperator,catOneImsi,catOneApn,overseaCard);

@override
String toString() {
  return 'ElectricMeterCatOneDetailDto(rssiGrade: $rssiGrade, catOneNodeId: $catOneNodeId, catOneCardNumber: $catOneCardNumber, catOneOperator: $catOneOperator, catOneImsi: $catOneImsi, catOneApn: $catOneApn, overseaCard: $overseaCard)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterCatOneDetailDtoCopyWith<$Res> implements $ElectricMeterCatOneDetailDtoCopyWith<$Res> {
  factory _$ElectricMeterCatOneDetailDtoCopyWith(_ElectricMeterCatOneDetailDto value, $Res Function(_ElectricMeterCatOneDetailDto) _then) = __$ElectricMeterCatOneDetailDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int rssiGrade,@JsonKey(name: 'catOneNodeId') String catOneNodeId,@JsonKey(name: 'catOneCardNumber') String catOneCardNumber,@JsonKey(name: 'catOneOperator') String catOneOperator,@JsonKey(name: 'catOneImsi') String catOneImsi,@JsonKey(name: 'catOneApn') String catOneApn,@JsonKey(name: 'overseaCard', fromJson: intFromDynamic) int overseaCard
});




}
/// @nodoc
class __$ElectricMeterCatOneDetailDtoCopyWithImpl<$Res>
    implements _$ElectricMeterCatOneDetailDtoCopyWith<$Res> {
  __$ElectricMeterCatOneDetailDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterCatOneDetailDto _self;
  final $Res Function(_ElectricMeterCatOneDetailDto) _then;

/// Create a copy of ElectricMeterCatOneDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rssiGrade = null,Object? catOneNodeId = null,Object? catOneCardNumber = null,Object? catOneOperator = null,Object? catOneImsi = null,Object? catOneApn = null,Object? overseaCard = null,}) {
  return _then(_ElectricMeterCatOneDetailDto(
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
mixin _$ElectricMeterExecuteTokenDto {

@JsonKey(name: 'executeToken', fromJson: stringFromDynamic) String get executeToken;
/// Create a copy of ElectricMeterExecuteTokenDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricMeterExecuteTokenDtoCopyWith<ElectricMeterExecuteTokenDto> get copyWith => _$ElectricMeterExecuteTokenDtoCopyWithImpl<ElectricMeterExecuteTokenDto>(this as ElectricMeterExecuteTokenDto, _$identity);

  /// Serializes this ElectricMeterExecuteTokenDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricMeterExecuteTokenDto&&(identical(other.executeToken, executeToken) || other.executeToken == executeToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,executeToken);

@override
String toString() {
  return 'ElectricMeterExecuteTokenDto(executeToken: $executeToken)';
}


}

/// @nodoc
abstract mixin class $ElectricMeterExecuteTokenDtoCopyWith<$Res>  {
  factory $ElectricMeterExecuteTokenDtoCopyWith(ElectricMeterExecuteTokenDto value, $Res Function(ElectricMeterExecuteTokenDto) _then) = _$ElectricMeterExecuteTokenDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'executeToken', fromJson: stringFromDynamic) String executeToken
});




}
/// @nodoc
class _$ElectricMeterExecuteTokenDtoCopyWithImpl<$Res>
    implements $ElectricMeterExecuteTokenDtoCopyWith<$Res> {
  _$ElectricMeterExecuteTokenDtoCopyWithImpl(this._self, this._then);

  final ElectricMeterExecuteTokenDto _self;
  final $Res Function(ElectricMeterExecuteTokenDto) _then;

/// Create a copy of ElectricMeterExecuteTokenDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? executeToken = null,}) {
  return _then(_self.copyWith(
executeToken: null == executeToken ? _self.executeToken : executeToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricMeterExecuteTokenDto].
extension ElectricMeterExecuteTokenDtoPatterns on ElectricMeterExecuteTokenDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricMeterExecuteTokenDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricMeterExecuteTokenDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricMeterExecuteTokenDto value)  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterExecuteTokenDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricMeterExecuteTokenDto value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricMeterExecuteTokenDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'executeToken', fromJson: stringFromDynamic)  String executeToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricMeterExecuteTokenDto() when $default != null:
return $default(_that.executeToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'executeToken', fromJson: stringFromDynamic)  String executeToken)  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterExecuteTokenDto():
return $default(_that.executeToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'executeToken', fromJson: stringFromDynamic)  String executeToken)?  $default,) {final _that = this;
switch (_that) {
case _ElectricMeterExecuteTokenDto() when $default != null:
return $default(_that.executeToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricMeterExecuteTokenDto implements ElectricMeterExecuteTokenDto {
  const _ElectricMeterExecuteTokenDto({@JsonKey(name: 'executeToken', fromJson: stringFromDynamic) this.executeToken = ''});
  factory _ElectricMeterExecuteTokenDto.fromJson(Map<String, dynamic> json) => _$ElectricMeterExecuteTokenDtoFromJson(json);

@override@JsonKey(name: 'executeToken', fromJson: stringFromDynamic) final  String executeToken;

/// Create a copy of ElectricMeterExecuteTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricMeterExecuteTokenDtoCopyWith<_ElectricMeterExecuteTokenDto> get copyWith => __$ElectricMeterExecuteTokenDtoCopyWithImpl<_ElectricMeterExecuteTokenDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricMeterExecuteTokenDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricMeterExecuteTokenDto&&(identical(other.executeToken, executeToken) || other.executeToken == executeToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,executeToken);

@override
String toString() {
  return 'ElectricMeterExecuteTokenDto(executeToken: $executeToken)';
}


}

/// @nodoc
abstract mixin class _$ElectricMeterExecuteTokenDtoCopyWith<$Res> implements $ElectricMeterExecuteTokenDtoCopyWith<$Res> {
  factory _$ElectricMeterExecuteTokenDtoCopyWith(_ElectricMeterExecuteTokenDto value, $Res Function(_ElectricMeterExecuteTokenDto) _then) = __$ElectricMeterExecuteTokenDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'executeToken', fromJson: stringFromDynamic) String executeToken
});




}
/// @nodoc
class __$ElectricMeterExecuteTokenDtoCopyWithImpl<$Res>
    implements _$ElectricMeterExecuteTokenDtoCopyWith<$Res> {
  __$ElectricMeterExecuteTokenDtoCopyWithImpl(this._self, this._then);

  final _ElectricMeterExecuteTokenDto _self;
  final $Res Function(_ElectricMeterExecuteTokenDto) _then;

/// Create a copy of ElectricMeterExecuteTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? executeToken = null,}) {
  return _then(_ElectricMeterExecuteTokenDto(
executeToken: null == executeToken ? _self.executeToken : executeToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
