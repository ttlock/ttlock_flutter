// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_lock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiLockEntity {

 String get networkName; String get ip; String get subnetMask; String get defaultGateway; String get wifiMac; int get rssiGrade; bool get isOnline; int get powerSavingMode; String get preferredDns; String get alternateDns;
/// Create a copy of WifiLockEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiLockEntityCopyWith<WifiLockEntity> get copyWith => _$WifiLockEntityCopyWithImpl<WifiLockEntity>(this as WifiLockEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiLockEntity&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.subnetMask, subnetMask) || other.subnetMask == subnetMask)&&(identical(other.defaultGateway, defaultGateway) || other.defaultGateway == defaultGateway)&&(identical(other.wifiMac, wifiMac) || other.wifiMac == wifiMac)&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.powerSavingMode, powerSavingMode) || other.powerSavingMode == powerSavingMode)&&(identical(other.preferredDns, preferredDns) || other.preferredDns == preferredDns)&&(identical(other.alternateDns, alternateDns) || other.alternateDns == alternateDns));
}


@override
int get hashCode => Object.hash(runtimeType,networkName,ip,subnetMask,defaultGateway,wifiMac,rssiGrade,isOnline,powerSavingMode,preferredDns,alternateDns);

@override
String toString() {
  return 'WifiLockEntity(networkName: $networkName, ip: $ip, subnetMask: $subnetMask, defaultGateway: $defaultGateway, wifiMac: $wifiMac, rssiGrade: $rssiGrade, isOnline: $isOnline, powerSavingMode: $powerSavingMode, preferredDns: $preferredDns, alternateDns: $alternateDns)';
}


}

/// @nodoc
abstract mixin class $WifiLockEntityCopyWith<$Res>  {
  factory $WifiLockEntityCopyWith(WifiLockEntity value, $Res Function(WifiLockEntity) _then) = _$WifiLockEntityCopyWithImpl;
@useResult
$Res call({
 String networkName, String ip, String subnetMask, String defaultGateway, String wifiMac, int rssiGrade, bool isOnline, int powerSavingMode, String preferredDns, String alternateDns
});




}
/// @nodoc
class _$WifiLockEntityCopyWithImpl<$Res>
    implements $WifiLockEntityCopyWith<$Res> {
  _$WifiLockEntityCopyWithImpl(this._self, this._then);

  final WifiLockEntity _self;
  final $Res Function(WifiLockEntity) _then;

/// Create a copy of WifiLockEntity
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


/// Adds pattern-matching-related methods to [WifiLockEntity].
extension WifiLockEntityPatterns on WifiLockEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiLockEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiLockEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiLockEntity value)  $default,){
final _that = this;
switch (_that) {
case _WifiLockEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiLockEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WifiLockEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String networkName,  String ip,  String subnetMask,  String defaultGateway,  String wifiMac,  int rssiGrade,  bool isOnline,  int powerSavingMode,  String preferredDns,  String alternateDns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiLockEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String networkName,  String ip,  String subnetMask,  String defaultGateway,  String wifiMac,  int rssiGrade,  bool isOnline,  int powerSavingMode,  String preferredDns,  String alternateDns)  $default,) {final _that = this;
switch (_that) {
case _WifiLockEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String networkName,  String ip,  String subnetMask,  String defaultGateway,  String wifiMac,  int rssiGrade,  bool isOnline,  int powerSavingMode,  String preferredDns,  String alternateDns)?  $default,) {final _that = this;
switch (_that) {
case _WifiLockEntity() when $default != null:
return $default(_that.networkName,_that.ip,_that.subnetMask,_that.defaultGateway,_that.wifiMac,_that.rssiGrade,_that.isOnline,_that.powerSavingMode,_that.preferredDns,_that.alternateDns);case _:
  return null;

}
}

}

/// @nodoc


class _WifiLockEntity extends WifiLockEntity {
  const _WifiLockEntity({this.networkName = '', this.ip = '', this.subnetMask = '', this.defaultGateway = '', this.wifiMac = '', this.rssiGrade = 0, this.isOnline = false, this.powerSavingMode = 0, this.preferredDns = '', this.alternateDns = ''}): super._();
  

@override@JsonKey() final  String networkName;
@override@JsonKey() final  String ip;
@override@JsonKey() final  String subnetMask;
@override@JsonKey() final  String defaultGateway;
@override@JsonKey() final  String wifiMac;
@override@JsonKey() final  int rssiGrade;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  int powerSavingMode;
@override@JsonKey() final  String preferredDns;
@override@JsonKey() final  String alternateDns;

/// Create a copy of WifiLockEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiLockEntityCopyWith<_WifiLockEntity> get copyWith => __$WifiLockEntityCopyWithImpl<_WifiLockEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiLockEntity&&(identical(other.networkName, networkName) || other.networkName == networkName)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.subnetMask, subnetMask) || other.subnetMask == subnetMask)&&(identical(other.defaultGateway, defaultGateway) || other.defaultGateway == defaultGateway)&&(identical(other.wifiMac, wifiMac) || other.wifiMac == wifiMac)&&(identical(other.rssiGrade, rssiGrade) || other.rssiGrade == rssiGrade)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.powerSavingMode, powerSavingMode) || other.powerSavingMode == powerSavingMode)&&(identical(other.preferredDns, preferredDns) || other.preferredDns == preferredDns)&&(identical(other.alternateDns, alternateDns) || other.alternateDns == alternateDns));
}


@override
int get hashCode => Object.hash(runtimeType,networkName,ip,subnetMask,defaultGateway,wifiMac,rssiGrade,isOnline,powerSavingMode,preferredDns,alternateDns);

@override
String toString() {
  return 'WifiLockEntity(networkName: $networkName, ip: $ip, subnetMask: $subnetMask, defaultGateway: $defaultGateway, wifiMac: $wifiMac, rssiGrade: $rssiGrade, isOnline: $isOnline, powerSavingMode: $powerSavingMode, preferredDns: $preferredDns, alternateDns: $alternateDns)';
}


}

/// @nodoc
abstract mixin class _$WifiLockEntityCopyWith<$Res> implements $WifiLockEntityCopyWith<$Res> {
  factory _$WifiLockEntityCopyWith(_WifiLockEntity value, $Res Function(_WifiLockEntity) _then) = __$WifiLockEntityCopyWithImpl;
@override @useResult
$Res call({
 String networkName, String ip, String subnetMask, String defaultGateway, String wifiMac, int rssiGrade, bool isOnline, int powerSavingMode, String preferredDns, String alternateDns
});




}
/// @nodoc
class __$WifiLockEntityCopyWithImpl<$Res>
    implements _$WifiLockEntityCopyWith<$Res> {
  __$WifiLockEntityCopyWithImpl(this._self, this._then);

  final _WifiLockEntity _self;
  final $Res Function(_WifiLockEntity) _then;

/// Create a copy of WifiLockEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? networkName = null,Object? ip = null,Object? subnetMask = null,Object? defaultGateway = null,Object? wifiMac = null,Object? rssiGrade = null,Object? isOnline = null,Object? powerSavingMode = null,Object? preferredDns = null,Object? alternateDns = null,}) {
  return _then(_WifiLockEntity(
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
