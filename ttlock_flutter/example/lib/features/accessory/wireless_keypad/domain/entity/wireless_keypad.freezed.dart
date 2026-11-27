// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wireless_keypad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WirelessKeypadEntity {

 int get wirelessKeypadId; String get wirelessKeypadNumber; String get wirelessKeypadName; String get wirelessKeypadMac; int get electricQuantity;/// 多功能键盘（云端 `hasSlot == 1`）。
 bool get isMultifunctionalKeypad;/// **本锁占用的槽位**（云端 `listByLock` 的 `slotNumber`）；普通键盘为 0。
 int get slotNumber;/// 多功能键盘可绑定锁的数量上限（云端 `slotLimit`）。
 int get slotLimit;/// 键盘特征值（云端 `featureValue`）。
 String get featureValue;
/// Create a copy of WirelessKeypadEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WirelessKeypadEntityCopyWith<WirelessKeypadEntity> get copyWith => _$WirelessKeypadEntityCopyWithImpl<WirelessKeypadEntity>(this as WirelessKeypadEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WirelessKeypadEntity&&(identical(other.wirelessKeypadId, wirelessKeypadId) || other.wirelessKeypadId == wirelessKeypadId)&&(identical(other.wirelessKeypadNumber, wirelessKeypadNumber) || other.wirelessKeypadNumber == wirelessKeypadNumber)&&(identical(other.wirelessKeypadName, wirelessKeypadName) || other.wirelessKeypadName == wirelessKeypadName)&&(identical(other.wirelessKeypadMac, wirelessKeypadMac) || other.wirelessKeypadMac == wirelessKeypadMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.isMultifunctionalKeypad, isMultifunctionalKeypad) || other.isMultifunctionalKeypad == isMultifunctionalKeypad)&&(identical(other.slotNumber, slotNumber) || other.slotNumber == slotNumber)&&(identical(other.slotLimit, slotLimit) || other.slotLimit == slotLimit)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue));
}


@override
int get hashCode => Object.hash(runtimeType,wirelessKeypadId,wirelessKeypadNumber,wirelessKeypadName,wirelessKeypadMac,electricQuantity,isMultifunctionalKeypad,slotNumber,slotLimit,featureValue);

@override
String toString() {
  return 'WirelessKeypadEntity(wirelessKeypadId: $wirelessKeypadId, wirelessKeypadNumber: $wirelessKeypadNumber, wirelessKeypadName: $wirelessKeypadName, wirelessKeypadMac: $wirelessKeypadMac, electricQuantity: $electricQuantity, isMultifunctionalKeypad: $isMultifunctionalKeypad, slotNumber: $slotNumber, slotLimit: $slotLimit, featureValue: $featureValue)';
}


}

/// @nodoc
abstract mixin class $WirelessKeypadEntityCopyWith<$Res>  {
  factory $WirelessKeypadEntityCopyWith(WirelessKeypadEntity value, $Res Function(WirelessKeypadEntity) _then) = _$WirelessKeypadEntityCopyWithImpl;
@useResult
$Res call({
 int wirelessKeypadId, String wirelessKeypadNumber, String wirelessKeypadName, String wirelessKeypadMac, int electricQuantity, bool isMultifunctionalKeypad, int slotNumber, int slotLimit, String featureValue
});




}
/// @nodoc
class _$WirelessKeypadEntityCopyWithImpl<$Res>
    implements $WirelessKeypadEntityCopyWith<$Res> {
  _$WirelessKeypadEntityCopyWithImpl(this._self, this._then);

  final WirelessKeypadEntity _self;
  final $Res Function(WirelessKeypadEntity) _then;

/// Create a copy of WirelessKeypadEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wirelessKeypadId = null,Object? wirelessKeypadNumber = null,Object? wirelessKeypadName = null,Object? wirelessKeypadMac = null,Object? electricQuantity = null,Object? isMultifunctionalKeypad = null,Object? slotNumber = null,Object? slotLimit = null,Object? featureValue = null,}) {
  return _then(_self.copyWith(
wirelessKeypadId: null == wirelessKeypadId ? _self.wirelessKeypadId : wirelessKeypadId // ignore: cast_nullable_to_non_nullable
as int,wirelessKeypadNumber: null == wirelessKeypadNumber ? _self.wirelessKeypadNumber : wirelessKeypadNumber // ignore: cast_nullable_to_non_nullable
as String,wirelessKeypadName: null == wirelessKeypadName ? _self.wirelessKeypadName : wirelessKeypadName // ignore: cast_nullable_to_non_nullable
as String,wirelessKeypadMac: null == wirelessKeypadMac ? _self.wirelessKeypadMac : wirelessKeypadMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,isMultifunctionalKeypad: null == isMultifunctionalKeypad ? _self.isMultifunctionalKeypad : isMultifunctionalKeypad // ignore: cast_nullable_to_non_nullable
as bool,slotNumber: null == slotNumber ? _self.slotNumber : slotNumber // ignore: cast_nullable_to_non_nullable
as int,slotLimit: null == slotLimit ? _self.slotLimit : slotLimit // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WirelessKeypadEntity].
extension WirelessKeypadEntityPatterns on WirelessKeypadEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WirelessKeypadEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WirelessKeypadEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WirelessKeypadEntity value)  $default,){
final _that = this;
switch (_that) {
case _WirelessKeypadEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WirelessKeypadEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WirelessKeypadEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int wirelessKeypadId,  String wirelessKeypadNumber,  String wirelessKeypadName,  String wirelessKeypadMac,  int electricQuantity,  bool isMultifunctionalKeypad,  int slotNumber,  int slotLimit,  String featureValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WirelessKeypadEntity() when $default != null:
return $default(_that.wirelessKeypadId,_that.wirelessKeypadNumber,_that.wirelessKeypadName,_that.wirelessKeypadMac,_that.electricQuantity,_that.isMultifunctionalKeypad,_that.slotNumber,_that.slotLimit,_that.featureValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int wirelessKeypadId,  String wirelessKeypadNumber,  String wirelessKeypadName,  String wirelessKeypadMac,  int electricQuantity,  bool isMultifunctionalKeypad,  int slotNumber,  int slotLimit,  String featureValue)  $default,) {final _that = this;
switch (_that) {
case _WirelessKeypadEntity():
return $default(_that.wirelessKeypadId,_that.wirelessKeypadNumber,_that.wirelessKeypadName,_that.wirelessKeypadMac,_that.electricQuantity,_that.isMultifunctionalKeypad,_that.slotNumber,_that.slotLimit,_that.featureValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int wirelessKeypadId,  String wirelessKeypadNumber,  String wirelessKeypadName,  String wirelessKeypadMac,  int electricQuantity,  bool isMultifunctionalKeypad,  int slotNumber,  int slotLimit,  String featureValue)?  $default,) {final _that = this;
switch (_that) {
case _WirelessKeypadEntity() when $default != null:
return $default(_that.wirelessKeypadId,_that.wirelessKeypadNumber,_that.wirelessKeypadName,_that.wirelessKeypadMac,_that.electricQuantity,_that.isMultifunctionalKeypad,_that.slotNumber,_that.slotLimit,_that.featureValue);case _:
  return null;

}
}

}

/// @nodoc


class _WirelessKeypadEntity extends WirelessKeypadEntity {
  const _WirelessKeypadEntity({this.wirelessKeypadId = 0, this.wirelessKeypadNumber = '', this.wirelessKeypadName = '', this.wirelessKeypadMac = '', this.electricQuantity = 0, this.isMultifunctionalKeypad = false, this.slotNumber = 0, this.slotLimit = 0, this.featureValue = ''}): super._();
  

@override@JsonKey() final  int wirelessKeypadId;
@override@JsonKey() final  String wirelessKeypadNumber;
@override@JsonKey() final  String wirelessKeypadName;
@override@JsonKey() final  String wirelessKeypadMac;
@override@JsonKey() final  int electricQuantity;
/// 多功能键盘（云端 `hasSlot == 1`）。
@override@JsonKey() final  bool isMultifunctionalKeypad;
/// **本锁占用的槽位**（云端 `listByLock` 的 `slotNumber`）；普通键盘为 0。
@override@JsonKey() final  int slotNumber;
/// 多功能键盘可绑定锁的数量上限（云端 `slotLimit`）。
@override@JsonKey() final  int slotLimit;
/// 键盘特征值（云端 `featureValue`）。
@override@JsonKey() final  String featureValue;

/// Create a copy of WirelessKeypadEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WirelessKeypadEntityCopyWith<_WirelessKeypadEntity> get copyWith => __$WirelessKeypadEntityCopyWithImpl<_WirelessKeypadEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WirelessKeypadEntity&&(identical(other.wirelessKeypadId, wirelessKeypadId) || other.wirelessKeypadId == wirelessKeypadId)&&(identical(other.wirelessKeypadNumber, wirelessKeypadNumber) || other.wirelessKeypadNumber == wirelessKeypadNumber)&&(identical(other.wirelessKeypadName, wirelessKeypadName) || other.wirelessKeypadName == wirelessKeypadName)&&(identical(other.wirelessKeypadMac, wirelessKeypadMac) || other.wirelessKeypadMac == wirelessKeypadMac)&&(identical(other.electricQuantity, electricQuantity) || other.electricQuantity == electricQuantity)&&(identical(other.isMultifunctionalKeypad, isMultifunctionalKeypad) || other.isMultifunctionalKeypad == isMultifunctionalKeypad)&&(identical(other.slotNumber, slotNumber) || other.slotNumber == slotNumber)&&(identical(other.slotLimit, slotLimit) || other.slotLimit == slotLimit)&&(identical(other.featureValue, featureValue) || other.featureValue == featureValue));
}


@override
int get hashCode => Object.hash(runtimeType,wirelessKeypadId,wirelessKeypadNumber,wirelessKeypadName,wirelessKeypadMac,electricQuantity,isMultifunctionalKeypad,slotNumber,slotLimit,featureValue);

@override
String toString() {
  return 'WirelessKeypadEntity(wirelessKeypadId: $wirelessKeypadId, wirelessKeypadNumber: $wirelessKeypadNumber, wirelessKeypadName: $wirelessKeypadName, wirelessKeypadMac: $wirelessKeypadMac, electricQuantity: $electricQuantity, isMultifunctionalKeypad: $isMultifunctionalKeypad, slotNumber: $slotNumber, slotLimit: $slotLimit, featureValue: $featureValue)';
}


}

/// @nodoc
abstract mixin class _$WirelessKeypadEntityCopyWith<$Res> implements $WirelessKeypadEntityCopyWith<$Res> {
  factory _$WirelessKeypadEntityCopyWith(_WirelessKeypadEntity value, $Res Function(_WirelessKeypadEntity) _then) = __$WirelessKeypadEntityCopyWithImpl;
@override @useResult
$Res call({
 int wirelessKeypadId, String wirelessKeypadNumber, String wirelessKeypadName, String wirelessKeypadMac, int electricQuantity, bool isMultifunctionalKeypad, int slotNumber, int slotLimit, String featureValue
});




}
/// @nodoc
class __$WirelessKeypadEntityCopyWithImpl<$Res>
    implements _$WirelessKeypadEntityCopyWith<$Res> {
  __$WirelessKeypadEntityCopyWithImpl(this._self, this._then);

  final _WirelessKeypadEntity _self;
  final $Res Function(_WirelessKeypadEntity) _then;

/// Create a copy of WirelessKeypadEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wirelessKeypadId = null,Object? wirelessKeypadNumber = null,Object? wirelessKeypadName = null,Object? wirelessKeypadMac = null,Object? electricQuantity = null,Object? isMultifunctionalKeypad = null,Object? slotNumber = null,Object? slotLimit = null,Object? featureValue = null,}) {
  return _then(_WirelessKeypadEntity(
wirelessKeypadId: null == wirelessKeypadId ? _self.wirelessKeypadId : wirelessKeypadId // ignore: cast_nullable_to_non_nullable
as int,wirelessKeypadNumber: null == wirelessKeypadNumber ? _self.wirelessKeypadNumber : wirelessKeypadNumber // ignore: cast_nullable_to_non_nullable
as String,wirelessKeypadName: null == wirelessKeypadName ? _self.wirelessKeypadName : wirelessKeypadName // ignore: cast_nullable_to_non_nullable
as String,wirelessKeypadMac: null == wirelessKeypadMac ? _self.wirelessKeypadMac : wirelessKeypadMac // ignore: cast_nullable_to_non_nullable
as String,electricQuantity: null == electricQuantity ? _self.electricQuantity : electricQuantity // ignore: cast_nullable_to_non_nullable
as int,isMultifunctionalKeypad: null == isMultifunctionalKeypad ? _self.isMultifunctionalKeypad : isMultifunctionalKeypad // ignore: cast_nullable_to_non_nullable
as bool,slotNumber: null == slotNumber ? _self.slotNumber : slotNumber // ignore: cast_nullable_to_non_nullable
as int,slotLimit: null == slotLimit ? _self.slotLimit : slotLimit // ignore: cast_nullable_to_non_nullable
as int,featureValue: null == featureValue ? _self.featureValue : featureValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
