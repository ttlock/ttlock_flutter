// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_lock_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WifiLockDto {

@JsonKey(name: 'networkName') String get networkName;@JsonKey(name: 'ip') String get ip;@JsonKey(name: 'subnetMask') String get subnetMask;@JsonKey(name: 'defaultGateway') String get defaultGateway;@JsonKey(name: 'wifiMac') String get wifiMac;@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int get rssiGrade;@JsonKey(name: 'isOnline', fromJson: boolFromDynamic) bool get isOnline;@JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic) int get powerSavingMode;@JsonKey(name: 'preferredDns') String get preferredDns;@JsonKey(name: 'alternateDns') String get alternateDns;
/// Create a copy of WifiLockDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiLockDtoCopyWith<WifiLockDto> get copyWith => _$WifiLockDtoCopyWithImpl<WifiLockDto>(this as WifiLockDto, _$identity);

  /// Serializes this WifiLockDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiLockDto&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.subnetMask, subnetMask) || other.subnetMask == subnetMask)&&(identical(other.defaultGateway, defaultGateway) || other.defaultGateway == defaultGateway)&&(identical(other.wifiMac, wifiMac) || other.wifiMac == wifiMac)&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.powerSavingMode, powerSavingMode) || other.powerSavingMode == powerSavingMode)&&(identical(other.preferredDns, preferredDns) || other.preferredDns == preferredDns)&&(identical(other.alternateDns, alternateDns) || other.alternateDns == alternateDns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,networkName,ip,subnetMask,defaultGateway,wifiMac,rssiGrade,isOnline,powerSavingMode,preferredDns,alternateDns);

@override
String toString() {
  return 'WifiLockDto(networkName: $networkName, ip: $ip, subnetMask: $subnetMask, defaultGateway: $defaultGateway, wifiMac: $wifiMac, rssiGrade: $rssiGrade, isOnline: $isOnline, powerSavingMode: $powerSavingMode, preferredDns: $preferredDns, alternateDns: $alternateDns)';
}


}

/// @nodoc
abstract mixin class $WifiLockDtoCopyWith<$Res>  {
  factory $WifiLockDtoCopyWith(WifiLockDto value, $Res Function(WifiLockDto) _then) = _$WifiLockDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'networkName') String networkName,@JsonKey(name: 'ip') String ip,@JsonKey(name: 'subnetMask') String subnetMask,@JsonKey(name: 'defaultGateway') String defaultGateway,@JsonKey(name: 'wifiMac') String wifiMac,@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int rssiGrade,@JsonKey(name: 'isOnline', fromJson: boolFromDynamic) bool isOnline,@JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic) int powerSavingMode,@JsonKey(name: 'preferredDns') String preferredDns,@JsonKey(name: 'alternateDns') String alternateDns
});




}
/// @nodoc
class _$WifiLockDtoCopyWithImpl<$Res>
    implements $WifiLockDtoCopyWith<$Res> {
  _$WifiLockDtoCopyWithImpl(this._self, this._then);

  final WifiLockDto _self;
  final $Res Function(WifiLockDto) _then;

/// Create a copy of WifiLockDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? networkName = null,Object? ip = null,Object? subnetMask = null,Object? defaultGateway = null,Object? wifiMac = null,Object? rssiGrade = null,Object? isOnline = null,Object? powerSavingMode = null,Object? preferredDns = null,Object? alternateDns = null,}) {
  return _then(_self.copyWith(
networkName: null == networkName ? _self.networkName : networkName // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,subnetMask: null == subnetMask ? _self.subnetMask : subnetMask // ignore: cast_nullable_to_non_nullable
as String,defaultGateway: null == defaultGateway ? _self.defaultGateway : defaultGateway // ignore: cast_nullable_to_non_nullable
as String,wifiMac: null == wifiMac ? _self.wifiMac : wifiMac // ignore: cast_nullable_to_non_nullable
as String,rssiGrade: null == rssiGrade ? _self.rssiGrade : rssiGrade // ignore: cast_nullable_to_non_nullable
as int,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,powerSavingMode: null == powerSavingMode ? _self.powerSavingMode : powerSavingMode // ignore: cast_nullable_to_non_nullable
as int,preferredDns: null == preferredDns ? _self.preferredDns : preferredDns // ignore: cast_nullable_to_non_nullable
as String,alternateDns: null == alternateDns ? _self.alternateDns : alternateDns // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WifiLockDto].
extension WifiLockDtoPatterns on WifiLockDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiLockDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiLockDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiLockDto value)  $default,){
final _that = this;
switch (_that) {
case _WifiLockDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiLockDto value)?  $default,){
final _that = this;
switch (_that) {
case _WifiLockDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'networkName')  String networkName, @JsonKey(name: 'ip')  String ip, @JsonKey(name: 'subnetMask')  String subnetMask, @JsonKey(name: 'defaultGateway')  String defaultGateway, @JsonKey(name: 'wifiMac')  String wifiMac, @JsonKey(name: 'rssiGrade', fromJson: intFromDynamic)  int rssiGrade, @JsonKey(name: 'isOnline', fromJson: boolFromDynamic)  bool isOnline, @JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic)  int powerSavingMode, @JsonKey(name: 'preferredDns')  String preferredDns, @JsonKey(name: 'alternateDns')  String alternateDns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiLockDto() when $default != null:
return $default(_that.networkName,_that.ip,_that.subnetMask,_that.defaultGateway,_that.wifiMac,_that.rssiGrade,_that.isOnline,_that.powerSavingMode,_that.preferredDns,_that.alternateDns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'networkName')  String networkName, @JsonKey(name: 'ip')  String ip, @JsonKey(name: 'subnetMask')  String subnetMask, @JsonKey(name: 'defaultGateway')  String defaultGateway, @JsonKey(name: 'wifiMac')  String wifiMac, @JsonKey(name: 'rssiGrade', fromJson: intFromDynamic)  int rssiGrade, @JsonKey(name: 'isOnline', fromJson: boolFromDynamic)  bool isOnline, @JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic)  int powerSavingMode, @JsonKey(name: 'preferredDns')  String preferredDns, @JsonKey(name: 'alternateDns')  String alternateDns)  $default,) {final _that = this;
switch (_that) {
case _WifiLockDto():
return $default(_that.networkName,_that.ip,_that.subnetMask,_that.defaultGateway,_that.wifiMac,_that.rssiGrade,_that.isOnline,_that.powerSavingMode,_that.preferredDns,_that.alternateDns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'networkName')  String networkName, @JsonKey(name: 'ip')  String ip, @JsonKey(name: 'subnetMask')  String subnetMask, @JsonKey(name: 'defaultGateway')  String defaultGateway, @JsonKey(name: 'wifiMac')  String wifiMac, @JsonKey(name: 'rssiGrade', fromJson: intFromDynamic)  int rssiGrade, @JsonKey(name: 'isOnline', fromJson: boolFromDynamic)  bool isOnline, @JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic)  int powerSavingMode, @JsonKey(name: 'preferredDns')  String preferredDns, @JsonKey(name: 'alternateDns')  String alternateDns)?  $default,) {final _that = this;
switch (_that) {
case _WifiLockDto() when $default != null:
return $default(_that.networkName,_that.ip,_that.subnetMask,_that.defaultGateway,_that.wifiMac,_that.rssiGrade,_that.isOnline,_that.powerSavingMode,_that.preferredDns,_that.alternateDns);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WifiLockDto extends WifiLockDto {
  const _WifiLockDto({@JsonKey(name: 'networkName') this.networkName = '', @JsonKey(name: 'ip') this.ip = '', @JsonKey(name: 'subnetMask') this.subnetMask = '', @JsonKey(name: 'defaultGateway') this.defaultGateway = '', @JsonKey(name: 'wifiMac') this.wifiMac = '', @JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) this.rssiGrade = 0, @JsonKey(name: 'isOnline', fromJson: boolFromDynamic) this.isOnline = false, @JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic) this.powerSavingMode = 0, @JsonKey(name: 'preferredDns') this.preferredDns = '', @JsonKey(name: 'alternateDns') this.alternateDns = ''}): super._();
  factory _WifiLockDto.fromJson(Map<String, dynamic> json) => _$WifiLockDtoFromJson(json);

@override@JsonKey(name: 'networkName') final  String networkName;
@override@JsonKey(name: 'ip') final  String ip;
@override@JsonKey(name: 'subnetMask') final  String subnetMask;
@override@JsonKey(name: 'defaultGateway') final  String defaultGateway;
@override@JsonKey(name: 'wifiMac') final  String wifiMac;
@override@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) final  int rssiGrade;
@override@JsonKey(name: 'isOnline', fromJson: boolFromDynamic) final  bool isOnline;
@override@JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic) final  int powerSavingMode;
@override@JsonKey(name: 'preferredDns') final  String preferredDns;
@override@JsonKey(name: 'alternateDns') final  String alternateDns;

/// Create a copy of WifiLockDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiLockDtoCopyWith<_WifiLockDto> get copyWith => __$WifiLockDtoCopyWithImpl<_WifiLockDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WifiLockDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiLockDto&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.subnetMask, subnetMask) || other.subnetMask == subnetMask)&&(identical(other.defaultGateway, defaultGateway) || other.defaultGateway == defaultGateway)&&(identical(other.wifiMac, wifiMac) || other.wifiMac == wifiMac)&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.powerSavingMode, powerSavingMode) || other.powerSavingMode == powerSavingMode)&&(identical(other.preferredDns, preferredDns) || other.preferredDns == preferredDns)&&(identical(other.alternateDns, alternateDns) || other.alternateDns == alternateDns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,networkName,ip,subnetMask,defaultGateway,wifiMac,rssiGrade,isOnline,powerSavingMode,preferredDns,alternateDns);

@override
String toString() {
  return 'WifiLockDto(networkName: $networkName, ip: $ip, subnetMask: $subnetMask, defaultGateway: $defaultGateway, wifiMac: $wifiMac, rssiGrade: $rssiGrade, isOnline: $isOnline, powerSavingMode: $powerSavingMode, preferredDns: $preferredDns, alternateDns: $alternateDns)';
}


}

/// @nodoc
abstract mixin class _$WifiLockDtoCopyWith<$Res> implements $WifiLockDtoCopyWith<$Res> {
  factory _$WifiLockDtoCopyWith(_WifiLockDto value, $Res Function(_WifiLockDto) _then) = __$WifiLockDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'networkName') String networkName,@JsonKey(name: 'ip') String ip,@JsonKey(name: 'subnetMask') String subnetMask,@JsonKey(name: 'defaultGateway') String defaultGateway,@JsonKey(name: 'wifiMac') String wifiMac,@JsonKey(name: 'rssiGrade', fromJson: intFromDynamic) int rssiGrade,@JsonKey(name: 'isOnline', fromJson: boolFromDynamic) bool isOnline,@JsonKey(name: 'powerSavingMode', fromJson: intFromDynamic) int powerSavingMode,@JsonKey(name: 'preferredDns') String preferredDns,@JsonKey(name: 'alternateDns') String alternateDns
});




}
/// @nodoc
class __$WifiLockDtoCopyWithImpl<$Res>
    implements _$WifiLockDtoCopyWith<$Res> {
  __$WifiLockDtoCopyWithImpl(this._self, this._then);

  final _WifiLockDto _self;
  final $Res Function(_WifiLockDto) _then;

/// Create a copy of WifiLockDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? networkName = null,Object? ip = null,Object? subnetMask = null,Object? defaultGateway = null,Object? wifiMac = null,Object? rssiGrade = null,Object? isOnline = null,Object? powerSavingMode = null,Object? preferredDns = null,Object? alternateDns = null,}) {
  return _then(_WifiLockDto(
networkName: null == networkName ? _self.networkName : networkName // ignore: cast_nullable_to_non_nullable
as String,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,subnetMask: null == subnetMask ? _self.subnetMask : subnetMask // ignore: cast_nullable_to_non_nullable
as String,defaultGateway: null == defaultGateway ? _self.defaultGateway : defaultGateway // ignore: cast_nullable_to_non_nullable
as String,wifiMac: null == wifiMac ? _self.wifiMac : wifiMac // ignore: cast_nullable_to_non_nullable
as String,rssiGrade: null == rssiGrade ? _self.rssiGrade : rssiGrade // ignore: cast_nullable_to_non_nullable
as int,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,powerSavingMode: null == powerSavingMode ? _self.powerSavingMode : powerSavingMode // ignore: cast_nullable_to_non_nullable
as int,preferredDns: null == preferredDns ? _self.preferredDns : preferredDns // ignore: cast_nullable_to_non_nullable
as String,alternateDns: null == alternateDns ? _self.alternateDns : alternateDns // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
