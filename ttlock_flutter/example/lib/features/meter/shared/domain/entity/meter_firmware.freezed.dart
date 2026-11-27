// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_firmware.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeterFirmwareEntity {

 bool get needUpgrade; String get modelNum; String get hardwareRevision; String get firmwareRevision; String get version;
/// Create a copy of MeterFirmwareEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeterFirmwareEntityCopyWith<MeterFirmwareEntity> get copyWith => _$MeterFirmwareEntityCopyWithImpl<MeterFirmwareEntity>(this as MeterFirmwareEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeterFirmwareEntity&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,needUpgrade,modelNum,hardwareRevision,firmwareRevision,version);

@override
String toString() {
  return 'MeterFirmwareEntity(needUpgrade: $needUpgrade, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, version: $version)';
}


}

/// @nodoc
abstract mixin class $MeterFirmwareEntityCopyWith<$Res>  {
  factory $MeterFirmwareEntityCopyWith(MeterFirmwareEntity value, $Res Function(MeterFirmwareEntity) _then) = _$MeterFirmwareEntityCopyWithImpl;
@useResult
$Res call({
 bool needUpgrade, String modelNum, String hardwareRevision, String firmwareRevision, String version
});




}
/// @nodoc
class _$MeterFirmwareEntityCopyWithImpl<$Res>
    implements $MeterFirmwareEntityCopyWith<$Res> {
  _$MeterFirmwareEntityCopyWithImpl(this._self, this._then);

  final MeterFirmwareEntity _self;
  final $Res Function(MeterFirmwareEntity) _then;

/// Create a copy of MeterFirmwareEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? needUpgrade = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? version = null,}) {
  return _then(_self.copyWith(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as bool,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MeterFirmwareEntity].
extension MeterFirmwareEntityPatterns on MeterFirmwareEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeterFirmwareEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeterFirmwareEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeterFirmwareEntity value)  $default,){
final _that = this;
switch (_that) {
case _MeterFirmwareEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeterFirmwareEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MeterFirmwareEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool needUpgrade,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeterFirmwareEntity() when $default != null:
return $default(_that.needUpgrade,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool needUpgrade,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String version)  $default,) {final _that = this;
switch (_that) {
case _MeterFirmwareEntity():
return $default(_that.needUpgrade,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool needUpgrade,  String modelNum,  String hardwareRevision,  String firmwareRevision,  String version)?  $default,) {final _that = this;
switch (_that) {
case _MeterFirmwareEntity() when $default != null:
return $default(_that.needUpgrade,_that.modelNum,_that.hardwareRevision,_that.firmwareRevision,_that.version);case _:
  return null;

}
}

}

/// @nodoc


class _MeterFirmwareEntity extends MeterFirmwareEntity {
  const _MeterFirmwareEntity({this.needUpgrade = false, this.modelNum = '', this.hardwareRevision = '', this.firmwareRevision = '', this.version = ''}): super._();
  

@override@JsonKey() final  bool needUpgrade;
@override@JsonKey() final  String modelNum;
@override@JsonKey() final  String hardwareRevision;
@override@JsonKey() final  String firmwareRevision;
@override@JsonKey() final  String version;

/// Create a copy of MeterFirmwareEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeterFirmwareEntityCopyWith<_MeterFirmwareEntity> get copyWith => __$MeterFirmwareEntityCopyWithImpl<_MeterFirmwareEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeterFirmwareEntity&&(identical(other.needUpgrade, needUpgrade) || other.needUpgrade == needUpgrade)&&(identical(other.modelNum, modelNum) || other.modelNum == modelNum)&&(identical(other.hardwareRevision, hardwareRevision) || other.hardwareRevision == hardwareRevision)&&(identical(other.firmwareRevision, firmwareRevision) || other.firmwareRevision == firmwareRevision)&&(identical(other.version, version) || other.version == version));
}


@override
int get hashCode => Object.hash(runtimeType,needUpgrade,modelNum,hardwareRevision,firmwareRevision,version);

@override
String toString() {
  return 'MeterFirmwareEntity(needUpgrade: $needUpgrade, modelNum: $modelNum, hardwareRevision: $hardwareRevision, firmwareRevision: $firmwareRevision, version: $version)';
}


}

/// @nodoc
abstract mixin class _$MeterFirmwareEntityCopyWith<$Res> implements $MeterFirmwareEntityCopyWith<$Res> {
  factory _$MeterFirmwareEntityCopyWith(_MeterFirmwareEntity value, $Res Function(_MeterFirmwareEntity) _then) = __$MeterFirmwareEntityCopyWithImpl;
@override @useResult
$Res call({
 bool needUpgrade, String modelNum, String hardwareRevision, String firmwareRevision, String version
});




}
/// @nodoc
class __$MeterFirmwareEntityCopyWithImpl<$Res>
    implements _$MeterFirmwareEntityCopyWith<$Res> {
  __$MeterFirmwareEntityCopyWithImpl(this._self, this._then);

  final _MeterFirmwareEntity _self;
  final $Res Function(_MeterFirmwareEntity) _then;

/// Create a copy of MeterFirmwareEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? needUpgrade = null,Object? modelNum = null,Object? hardwareRevision = null,Object? firmwareRevision = null,Object? version = null,}) {
  return _then(_MeterFirmwareEntity(
needUpgrade: null == needUpgrade ? _self.needUpgrade : needUpgrade // ignore: cast_nullable_to_non_nullable
as bool,modelNum: null == modelNum ? _self.modelNum : modelNum // ignore: cast_nullable_to_non_nullable
as String,hardwareRevision: null == hardwareRevision ? _self.hardwareRevision : hardwareRevision // ignore: cast_nullable_to_non_nullable
as String,firmwareRevision: null == firmwareRevision ? _self.firmwareRevision : firmwareRevision // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
