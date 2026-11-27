// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wireless_keypad_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WirelessKeypadDto {

@JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic) int get wirelessKeypadId;@JsonKey(name: 'wirelessKeypadNumber') String get wirelessKeypadNumber;@JsonKey(name: 'wirelessKeypadName') String get wirelessKeypadName;@JsonKey(name: 'wirelessKeypadMac') String get wirelessKeypadMac;@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int get electricQuantity;/// 键盘类型：1-多功能，2-普通（云端原始值）。
///
/// **不写 `@Default(2)`**：`intFromDynamic(null)` 返回 `0`，`@Default` 只在
/// 「键缺失且无 `fromJson`」时生效，写 2 会给出「键缺失 → 2」的错误暗示。
/// 「默认普通」的语义改由 `toEntity()` 的 `hasSlot == 1` 表达 ——
/// 缺失(0) 与显式 2 都归为普通键盘。
@JsonKey(name: 'hasSlot', fromJson: intFromDynamic) int get hasSlot;@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) int get slotNumber;@JsonKey(name: 'slotLimit', fromJson: intFromDynamic) int get slotLimit;@JsonKey(name: 'featureValue') String get featureValue;
/// Create a copy of WirelessKeypadDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WirelessKeypadDtoCopyWith<WirelessKeypadDto> get copyWith => _$WirelessKeypadDtoCopyWithImpl<WirelessKeypadDto>(this as WirelessKeypadDto, _$identity);

  /// Serializes this WirelessKeypadDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WirelessKeypadDto&&(identical(other.wirelessKeypadId, wirelessKeypadId) || other.wirelessKeypadId == wirelessKeypadId)&&(identical(other.wirelessKeypadNumber, wirelessKeypadNumber) || other.wirelessKeypadNumber == wirelessKeypadNumber)&&(identical(other.wirelessKeypadName, wirelessKeypadName) || other.wirelessKeypadName == wirelessKeypadName)&&(identical(other.wirelessKeypadMac, wirelessKeypadMac) || other.wirelessKeypadMac == wirelessKeypadMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.hasSlot, hasSlot) || other.hasSlot == hasSlot)&&(identical(other.slotNumber, slotNumber) || other.slotNumber == slotNumber)&&(identical(other.slotLimit, slotLimit) || other.slotLimit == slotLimit)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wirelessKeypadId,wirelessKeypadNumber,wirelessKeypadName,wirelessKeypadMac,electricQuantity,hasSlot,slotNumber,slotLimit,featureValue);

@override
String toString() {
  return 'WirelessKeypadDto(wirelessKeypadId: $wirelessKeypadId, wirelessKeypadNumber: $wirelessKeypadNumber, wirelessKeypadName: $wirelessKeypadName, wirelessKeypadMac: $wirelessKeypadMac, electricQuantity: $electricQuantity, hasSlot: $hasSlot, slotNumber: $slotNumber, slotLimit: $slotLimit, featureValue: $featureValue)';
}


}

/// @nodoc
abstract mixin class $WirelessKeypadDtoCopyWith<$Res>  {
  factory $WirelessKeypadDtoCopyWith(WirelessKeypadDto value, $Res Function(WirelessKeypadDto) _then) = _$WirelessKeypadDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic) int wirelessKeypadId,@JsonKey(name: 'wirelessKeypadNumber') String wirelessKeypadNumber,@JsonKey(name: 'wirelessKeypadName') String wirelessKeypadName,@JsonKey(name: 'wirelessKeypadMac') String wirelessKeypadMac,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'hasSlot', fromJson: intFromDynamic) int hasSlot,@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) int slotNumber,@JsonKey(name: 'slotLimit', fromJson: intFromDynamic) int slotLimit,@JsonKey(name: 'featureValue') String featureValue
});




}
/// @nodoc
class _$WirelessKeypadDtoCopyWithImpl<$Res>
    implements $WirelessKeypadDtoCopyWith<$Res> {
  _$WirelessKeypadDtoCopyWithImpl(this._self, this._then);

  final WirelessKeypadDto _self;
  final $Res Function(WirelessKeypadDto) _then;

/// Create a copy of WirelessKeypadDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wirelessKeypadId = null,Object? wirelessKeypadNumber = null,Object? wirelessKeypadName = null,Object? wirelessKeypadMac = null,Object? electricQuantity = null,Object? hasSlot = null,Object? slotNumber = null,Object? slotLimit = null,Object? featureValue = null,}) {
  return _then(_self.copyWith(
wirelessKeypadId: null == wirelessKeypadId ? _self.wirelessKeypadId : wirelessKeypadId // ignore: cast_nullable_to_non_nullable
as int,wirelessKeypadNumber: null == wirelessKeypadNumber ? _self.wirelessKeypadNumber : wirelessKeypadNumber // ignore: cast_nullable_to_non_nullable
as String,wirelessKeypadName: null == wirelessKeypadName ? _self.wirelessKeypadName : wirelessKeypadName // ignore: cast_nullable_to_non_nullable
as String,wirelessKeypadMac: null == wirelessKeypadMac ? _self.wirelessKeypadMac : wirelessKeypadMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,hasSlot: null == hasSlot ? _self.hasSlot : hasSlot // ignore: cast_nullable_to_non_nullable
as int,slotNumber: null == slotNumber ? _self.slotNumber : slotNumber // ignore: cast_nullable_to_non_nullable
as int,slotLimit: null == slotLimit ? _self.slotLimit : slotLimit // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WirelessKeypadDto].
extension WirelessKeypadDtoPatterns on WirelessKeypadDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WirelessKeypadDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WirelessKeypadDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WirelessKeypadDto value)  $default,){
final _that = this;
switch (_that) {
case _WirelessKeypadDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WirelessKeypadDto value)?  $default,){
final _that = this;
switch (_that) {
case _WirelessKeypadDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic)  int wirelessKeypadId, @JsonKey(name: 'wirelessKeypadNumber')  String wirelessKeypadNumber, @JsonKey(name: 'wirelessKeypadName')  String wirelessKeypadName, @JsonKey(name: 'wirelessKeypadMac')  String wirelessKeypadMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'hasSlot', fromJson: intFromDynamic)  int hasSlot, @JsonKey(name: 'slotNumber', fromJson: intFromDynamic)  int slotNumber, @JsonKey(name: 'slotLimit', fromJson: intFromDynamic)  int slotLimit, @JsonKey(name: 'featureValue')  String featureValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WirelessKeypadDto() when $default != null:
return $default(_that.wirelessKeypadId,_that.wirelessKeypadNumber,_that.wirelessKeypadName,_that.wirelessKeypadMac,_that.electricQuantity,_that.hasSlot,_that.slotNumber,_that.slotLimit,_that.featureValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic)  int wirelessKeypadId, @JsonKey(name: 'wirelessKeypadNumber')  String wirelessKeypadNumber, @JsonKey(name: 'wirelessKeypadName')  String wirelessKeypadName, @JsonKey(name: 'wirelessKeypadMac')  String wirelessKeypadMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'hasSlot', fromJson: intFromDynamic)  int hasSlot, @JsonKey(name: 'slotNumber', fromJson: intFromDynamic)  int slotNumber, @JsonKey(name: 'slotLimit', fromJson: intFromDynamic)  int slotLimit, @JsonKey(name: 'featureValue')  String featureValue)  $default,) {final _that = this;
switch (_that) {
case _WirelessKeypadDto():
return $default(_that.wirelessKeypadId,_that.wirelessKeypadNumber,_that.wirelessKeypadName,_that.wirelessKeypadMac,_that.electricQuantity,_that.hasSlot,_that.slotNumber,_that.slotLimit,_that.featureValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic)  int wirelessKeypadId, @JsonKey(name: 'wirelessKeypadNumber')  String wirelessKeypadNumber, @JsonKey(name: 'wirelessKeypadName')  String wirelessKeypadName, @JsonKey(name: 'wirelessKeypadMac')  String wirelessKeypadMac, @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)  int electricQuantity, @JsonKey(name: 'hasSlot', fromJson: intFromDynamic)  int hasSlot, @JsonKey(name: 'slotNumber', fromJson: intFromDynamic)  int slotNumber, @JsonKey(name: 'slotLimit', fromJson: intFromDynamic)  int slotLimit, @JsonKey(name: 'featureValue')  String featureValue)?  $default,) {final _that = this;
switch (_that) {
case _WirelessKeypadDto() when $default != null:
return $default(_that.wirelessKeypadId,_that.wirelessKeypadNumber,_that.wirelessKeypadName,_that.wirelessKeypadMac,_that.electricQuantity,_that.hasSlot,_that.slotNumber,_that.slotLimit,_that.featureValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WirelessKeypadDto extends WirelessKeypadDto {
  const _WirelessKeypadDto({@JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic) this.wirelessKeypadId = 0, @JsonKey(name: 'wirelessKeypadNumber') this.wirelessKeypadNumber = '', @JsonKey(name: 'wirelessKeypadName') this.wirelessKeypadName = '', @JsonKey(name: 'wirelessKeypadMac') this.wirelessKeypadMac = '', @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) this.electricQuantity = 0, @JsonKey(name: 'hasSlot', fromJson: intFromDynamic) this.hasSlot = 0, @JsonKey(name: 'slotNumber', fromJson: intFromDynamic) this.slotNumber = 0, @JsonKey(name: 'slotLimit', fromJson: intFromDynamic) this.slotLimit = 0, @JsonKey(name: 'featureValue') this.featureValue = ''}): super._();
  factory _WirelessKeypadDto.fromJson(Map<String, dynamic> json) => _$WirelessKeypadDtoFromJson(json);

@override@JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic) final  int wirelessKeypadId;
@override@JsonKey(name: 'wirelessKeypadNumber') final  String wirelessKeypadNumber;
@override@JsonKey(name: 'wirelessKeypadName') final  String wirelessKeypadName;
@override@JsonKey(name: 'wirelessKeypadMac') final  String wirelessKeypadMac;
@override@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) final  int electricQuantity;
/// 键盘类型：1-多功能，2-普通（云端原始值）。
///
/// **不写 `@Default(2)`**：`intFromDynamic(null)` 返回 `0`，`@Default` 只在
/// 「键缺失且无 `fromJson`」时生效，写 2 会给出「键缺失 → 2」的错误暗示。
/// 「默认普通」的语义改由 `toEntity()` 的 `hasSlot == 1` 表达 ——
/// 缺失(0) 与显式 2 都归为普通键盘。
@override@JsonKey(name: 'hasSlot', fromJson: intFromDynamic) final  int hasSlot;
@override@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) final  int slotNumber;
@override@JsonKey(name: 'slotLimit', fromJson: intFromDynamic) final  int slotLimit;
@override@JsonKey(name: 'featureValue') final  String featureValue;

/// Create a copy of WirelessKeypadDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WirelessKeypadDtoCopyWith<_WirelessKeypadDto> get copyWith => __$WirelessKeypadDtoCopyWithImpl<_WirelessKeypadDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WirelessKeypadDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WirelessKeypadDto&&(identical(other.wirelessKeypadId, wirelessKeypadId) || other.wirelessKeypadId == wirelessKeypadId)&&(identical(other.wirelessKeypadNumber, wirelessKeypadNumber) || other.wirelessKeypadNumber == wirelessKeypadNumber)&&(identical(other.wirelessKeypadName, wirelessKeypadName) || other.wirelessKeypadName == wirelessKeypadName)&&(identical(other.wirelessKeypadMac, wirelessKeypadMac) || other.wirelessKeypadMac == wirelessKeypadMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.hasSlot, hasSlot) || other.hasSlot == hasSlot)&&(identical(other.slotNumber, slotNumber) || other.slotNumber == slotNumber)&&(identical(other.slotLimit, slotLimit) || other.slotLimit == slotLimit)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wirelessKeypadId,wirelessKeypadNumber,wirelessKeypadName,wirelessKeypadMac,electricQuantity,hasSlot,slotNumber,slotLimit,featureValue);

@override
String toString() {
  return 'WirelessKeypadDto(wirelessKeypadId: $wirelessKeypadId, wirelessKeypadNumber: $wirelessKeypadNumber, wirelessKeypadName: $wirelessKeypadName, wirelessKeypadMac: $wirelessKeypadMac, electricQuantity: $electricQuantity, hasSlot: $hasSlot, slotNumber: $slotNumber, slotLimit: $slotLimit, featureValue: $featureValue)';
}


}

/// @nodoc
abstract mixin class _$WirelessKeypadDtoCopyWith<$Res> implements $WirelessKeypadDtoCopyWith<$Res> {
  factory _$WirelessKeypadDtoCopyWith(_WirelessKeypadDto value, $Res Function(_WirelessKeypadDto) _then) = __$WirelessKeypadDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic) int wirelessKeypadId,@JsonKey(name: 'wirelessKeypadNumber') String wirelessKeypadNumber,@JsonKey(name: 'wirelessKeypadName') String wirelessKeypadName,@JsonKey(name: 'wirelessKeypadMac') String wirelessKeypadMac,@JsonKey(name: 'electricQuantity', fromJson: intFromDynamic) int electricQuantity,@JsonKey(name: 'hasSlot', fromJson: intFromDynamic) int hasSlot,@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) int slotNumber,@JsonKey(name: 'slotLimit', fromJson: intFromDynamic) int slotLimit,@JsonKey(name: 'featureValue') String featureValue
});




}
/// @nodoc
class __$WirelessKeypadDtoCopyWithImpl<$Res>
    implements _$WirelessKeypadDtoCopyWith<$Res> {
  __$WirelessKeypadDtoCopyWithImpl(this._self, this._then);

  final _WirelessKeypadDto _self;
  final $Res Function(_WirelessKeypadDto) _then;

/// Create a copy of WirelessKeypadDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wirelessKeypadId = null,Object? wirelessKeypadNumber = null,Object? wirelessKeypadName = null,Object? wirelessKeypadMac = null,Object? electricQuantity = null,Object? hasSlot = null,Object? slotNumber = null,Object? slotLimit = null,Object? featureValue = null,}) {
  return _then(_WirelessKeypadDto(
wirelessKeypadId: null == wirelessKeypadId ? _self.wirelessKeypadId : wirelessKeypadId // ignore: cast_nullable_to_non_nullable
as int,wirelessKeypadNumber: null == wirelessKeypadNumber ? _self.wirelessKeypadNumber : wirelessKeypadNumber // ignore: cast_nullable_to_non_nullable
as String,wirelessKeypadName: null == wirelessKeypadName ? _self.wirelessKeypadName : wirelessKeypadName // ignore: cast_nullable_to_non_nullable
as String,wirelessKeypadMac: null == wirelessKeypadMac ? _self.wirelessKeypadMac : wirelessKeypadMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,hasSlot: null == hasSlot ? _self.hasSlot : hasSlot // ignore: cast_nullable_to_non_nullable
as int,slotNumber: null == slotNumber ? _self.slotNumber : slotNumber // ignore: cast_nullable_to_non_nullable
as int,slotLimit: null == slotLimit ? _self.slotLimit : slotLimit // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WirelessKeypadUpgradeCheckDto {

@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int get needUpgrade;@JsonKey(name: 'firmwareInfo') Object? get firmwareInfo;@JsonKey(name: 'firmwarePackage') String get firmwarePackage;@JsonKey(name: 'version') String get version;
/// Create a copy of WirelessKeypadUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WirelessKeypadUpgradeCheckDtoCopyWith<WirelessKeypadUpgradeCheckDto> get copyWith => _$WirelessKeypadUpgradeCheckDtoCopyWithImpl<WirelessKeypadUpgradeCheckDto>(this as WirelessKeypadUpgradeCheckDto, _$identity);

  /// Serializes this WirelessKeypadUpgradeCheckDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WirelessKeypadUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&const DeepCollectionEquality().equals(other.firmwareInfo, firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,const DeepCollectionEquality().hash(firmwareInfo),firmwarePackage,version);

@override
String toString() {
  return 'WirelessKeypadUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class $WirelessKeypadUpgradeCheckDtoCopyWith<$Res>  {
  factory $WirelessKeypadUpgradeCheckDtoCopyWith(WirelessKeypadUpgradeCheckDto value, $Res Function(WirelessKeypadUpgradeCheckDto) _then) = _$WirelessKeypadUpgradeCheckDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') Object? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});




}
/// @nodoc
class _$WirelessKeypadUpgradeCheckDtoCopyWithImpl<$Res>
    implements $WirelessKeypadUpgradeCheckDtoCopyWith<$Res> {
  _$WirelessKeypadUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final WirelessKeypadUpgradeCheckDto _self;
  final $Res Function(WirelessKeypadUpgradeCheckDto) _then;

/// Create a copy of WirelessKeypadUpgradeCheckDto
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


/// Adds pattern-matching-related methods to [WirelessKeypadUpgradeCheckDto].
extension WirelessKeypadUpgradeCheckDtoPatterns on WirelessKeypadUpgradeCheckDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WirelessKeypadUpgradeCheckDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheckDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WirelessKeypadUpgradeCheckDto value)  $default,){
final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheckDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WirelessKeypadUpgradeCheckDto value)?  $default,){
final _that = this;
switch (_that) {
case _WirelessKeypadUpgradeCheckDto() when $default != null:
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
case _WirelessKeypadUpgradeCheckDto() when $default != null:
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
case _WirelessKeypadUpgradeCheckDto():
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
case _WirelessKeypadUpgradeCheckDto() when $default != null:
return $default(_that.needUpgrade,_that.firmwareInfo,_that.firmwarePackage,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WirelessKeypadUpgradeCheckDto extends WirelessKeypadUpgradeCheckDto {
  const _WirelessKeypadUpgradeCheckDto({@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) this.needUpgrade = 0, @JsonKey(name: 'firmwareInfo') this.firmwareInfo, @JsonKey(name: 'firmwarePackage') this.firmwarePackage = '', @JsonKey(name: 'version') this.version = ''}): super._();
  factory _WirelessKeypadUpgradeCheckDto.fromJson(Map<String, dynamic> json) => _$WirelessKeypadUpgradeCheckDtoFromJson(json);

@override@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) final  int needUpgrade;
@override@JsonKey(name: 'firmwareInfo') final  Object? firmwareInfo;
@override@JsonKey(name: 'firmwarePackage') final  String firmwarePackage;
@override@JsonKey(name: 'version') final  String version;

/// Create a copy of WirelessKeypadUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WirelessKeypadUpgradeCheckDtoCopyWith<_WirelessKeypadUpgradeCheckDto> get copyWith => __$WirelessKeypadUpgradeCheckDtoCopyWithImpl<_WirelessKeypadUpgradeCheckDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WirelessKeypadUpgradeCheckDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WirelessKeypadUpgradeCheckDto&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&const DeepCollectionEquality().equals(other.firmwareInfo, firmwareInfo)&&(identical(other.firmwarePackage, firmwarePackage) || other.firmwarePackage == firmwarePackage)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,needUpgrade,const DeepCollectionEquality().hash(firmwareInfo),firmwarePackage,version);

@override
String toString() {
  return 'WirelessKeypadUpgradeCheckDto(needUpgrade: $needUpgrade, firmwareInfo: $firmwareInfo, firmwarePackage: $firmwarePackage, version: $version)';
}


}

/// @nodoc
abstract mixin class _$WirelessKeypadUpgradeCheckDtoCopyWith<$Res> implements $WirelessKeypadUpgradeCheckDtoCopyWith<$Res> {
  factory _$WirelessKeypadUpgradeCheckDtoCopyWith(_WirelessKeypadUpgradeCheckDto value, $Res Function(_WirelessKeypadUpgradeCheckDto) _then) = __$WirelessKeypadUpgradeCheckDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'needUpgrade', fromJson: intFromDynamic) int needUpgrade,@JsonKey(name: 'firmwareInfo') Object? firmwareInfo,@JsonKey(name: 'firmwarePackage') String firmwarePackage,@JsonKey(name: 'version') String version
});




}
/// @nodoc
class __$WirelessKeypadUpgradeCheckDtoCopyWithImpl<$Res>
    implements _$WirelessKeypadUpgradeCheckDtoCopyWith<$Res> {
  __$WirelessKeypadUpgradeCheckDtoCopyWithImpl(this._self, this._then);

  final _WirelessKeypadUpgradeCheckDto _self;
  final $Res Function(_WirelessKeypadUpgradeCheckDto) _then;

/// Create a copy of WirelessKeypadUpgradeCheckDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? firmwareInfo = freezed,Object? firmwarePackage = null,Object? version = null,}) {
  return _then(_WirelessKeypadUpgradeCheckDto(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as int,firmwareInfo: freezed == firmwareInfo ? _self.firmwareInfo : firmwareInfo ,firmwarePackage: null == firmwarePackage ? _self.firmwarePackage : firmwarePackage // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$KeypadSlotDto {

@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) int get slotNumber;@JsonKey(name: 'lockAlias') String get lockAlias;
/// Create a copy of KeypadSlotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeypadSlotDtoCopyWith<KeypadSlotDto> get copyWith => _$KeypadSlotDtoCopyWithImpl<KeypadSlotDto>(this as KeypadSlotDto, _$identity);

  /// Serializes this KeypadSlotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeypadSlotDto&&(identical(other.slotNumber, slotNumber) || other.slotNumber == slotNumber)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slotNumber,lockAlias);

@override
String toString() {
  return 'KeypadSlotDto(slotNumber: $slotNumber, lockAlias: $lockAlias)';
}


}

/// @nodoc
abstract mixin class $KeypadSlotDtoCopyWith<$Res>  {
  factory $KeypadSlotDtoCopyWith(KeypadSlotDto value, $Res Function(KeypadSlotDto) _then) = _$KeypadSlotDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) int slotNumber,@JsonKey(name: 'lockAlias') String lockAlias
});




}
/// @nodoc
class _$KeypadSlotDtoCopyWithImpl<$Res>
    implements $KeypadSlotDtoCopyWith<$Res> {
  _$KeypadSlotDtoCopyWithImpl(this._self, this._then);

  final KeypadSlotDto _self;
  final $Res Function(KeypadSlotDto) _then;

/// Create a copy of KeypadSlotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slotNumber = null,Object? lockAlias = null,}) {
  return _then(_self.copyWith(
slotNumber: null == slotNumber ? _self.slotNumber : slotNumber // ignore: cast_nullable_to_non_nullable
as int,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KeypadSlotDto].
extension KeypadSlotDtoPatterns on KeypadSlotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeypadSlotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeypadSlotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeypadSlotDto value)  $default,){
final _that = this;
switch (_that) {
case _KeypadSlotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeypadSlotDto value)?  $default,){
final _that = this;
switch (_that) {
case _KeypadSlotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'slotNumber', fromJson: intFromDynamic)  int slotNumber, @JsonKey(name: 'lockAlias')  String lockAlias)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeypadSlotDto() when $default != null:
return $default(_that.slotNumber,_that.lockAlias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'slotNumber', fromJson: intFromDynamic)  int slotNumber, @JsonKey(name: 'lockAlias')  String lockAlias)  $default,) {final _that = this;
switch (_that) {
case _KeypadSlotDto():
return $default(_that.slotNumber,_that.lockAlias);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'slotNumber', fromJson: intFromDynamic)  int slotNumber, @JsonKey(name: 'lockAlias')  String lockAlias)?  $default,) {final _that = this;
switch (_that) {
case _KeypadSlotDto() when $default != null:
return $default(_that.slotNumber,_that.lockAlias);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KeypadSlotDto extends KeypadSlotDto {
  const _KeypadSlotDto({@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) this.slotNumber = 0, @JsonKey(name: 'lockAlias') this.lockAlias = ''}): super._();
  factory _KeypadSlotDto.fromJson(Map<String, dynamic> json) => _$KeypadSlotDtoFromJson(json);

@override@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) final  int slotNumber;
@override@JsonKey(name: 'lockAlias') final  String lockAlias;

/// Create a copy of KeypadSlotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeypadSlotDtoCopyWith<_KeypadSlotDto> get copyWith => __$KeypadSlotDtoCopyWithImpl<_KeypadSlotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KeypadSlotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeypadSlotDto&&(identical(other.slotNumber, slotNumber) || other.slotNumber == slotNumber)&&(identical(other.lockAlias, lockAlias) || other.lockAlias == lockAlias));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slotNumber,lockAlias);

@override
String toString() {
  return 'KeypadSlotDto(slotNumber: $slotNumber, lockAlias: $lockAlias)';
}


}

/// @nodoc
abstract mixin class _$KeypadSlotDtoCopyWith<$Res> implements $KeypadSlotDtoCopyWith<$Res> {
  factory _$KeypadSlotDtoCopyWith(_KeypadSlotDto value, $Res Function(_KeypadSlotDto) _then) = __$KeypadSlotDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'slotNumber', fromJson: intFromDynamic) int slotNumber,@JsonKey(name: 'lockAlias') String lockAlias
});




}
/// @nodoc
class __$KeypadSlotDtoCopyWithImpl<$Res>
    implements _$KeypadSlotDtoCopyWith<$Res> {
  __$KeypadSlotDtoCopyWithImpl(this._self, this._then);

  final _KeypadSlotDto _self;
  final $Res Function(_KeypadSlotDto) _then;

/// Create a copy of KeypadSlotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slotNumber = null,Object? lockAlias = null,}) {
  return _then(_KeypadSlotDto(
slotNumber: null == slotNumber ? _self.slotNumber : slotNumber // ignore: cast_nullable_to_non_nullable
as int,lockAlias: null == lockAlias ? _self.lockAlias : lockAlias // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
