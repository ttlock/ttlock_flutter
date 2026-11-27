// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_lock_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiLockConfigState {

 List<WifiNetwork> get networks; bool get isScanning; bool get submitting; String? get selectedSsid;/// 是否支持 configIP（`TTLockFunction.wifiLockStaticIP`）；决定高级设置中静态 IP / DNS UI。
 bool get supportsStaticIp;/// 云端记载的当前已配 SSID（`WifiLockEntity.networkName`）；空串表示从未配过。
 String get configuredSsid;/// 云端记载的 WiFi MAC（只读摘要行用）。
 String get configuredWifiMac;/// 云端记载的在线状态（只读摘要行用）。
 bool get configuredOnline;/// 云端记载的省电模式：0=未知、1=开启、2=关闭
/// （与 `setWifiPowerSaving(on: ...)` 的写入约定一致）。
 int get configuredPowerSavingMode;/// 云端记载的静态 IP 配置（空串 = 未配置）。表单据此回显，
/// 避免每次保存都把静态锁误写成 DHCP（`useStaticIp=false`）。
 String get configuredIp; String get configuredSubnetMask; String get configuredDefaultGateway;/// 云端记载的首选 / 备用 DNS（空串 = 未配置）。
 String get configuredPreferredDns; String get configuredAlternateDns;/// 云端信息载入失败（区别于提交/扫描失败，页面单独以常驻横幅展示）。
 AppException? get loadError; AppException? get error;
/// Create a copy of WifiLockConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiLockConfigStateCopyWith<WifiLockConfigState> get copyWith => _$WifiLockConfigStateCopyWithImpl<WifiLockConfigState>(this as WifiLockConfigState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiLockConfigState&&const DeepCollectionEquality().equals(other.networks, networks)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.selectedSsid, selectedSsid) || other.selectedSsid == selectedSsid)&&(identical(other.supportsStaticIp, supportsStaticIp) || other.supportsStaticIp == supportsStaticIp)&&(identical(other.configuredSsid, configuredSsid) || other.configuredSsid == configuredSsid)&&(identical(other.configuredWifiMac, configuredWifiMac) || other.configuredWifiMac == configuredWifiMac)&&(identical(other.configuredOnline, configuredOnline) || other.configuredOnline == configuredOnline)&&(identical(other.configuredPowerSavingMode, configuredPowerSavingMode) || other.configuredPowerSavingMode == configuredPowerSavingMode)&&(identical(other.configuredIp, configuredIp) || other.configuredIp == configuredIp)&&(identical(other.configuredSubnetMask, configuredSubnetMask) || other.configuredSubnetMask == configuredSubnetMask)&&(identical(other.configuredDefaultGateway, configuredDefaultGateway) || other.configuredDefaultGateway == configuredDefaultGateway)&&(identical(other.configuredPreferredDns, configuredPreferredDns) || other.configuredPreferredDns == configuredPreferredDns)&&(identical(other.configuredAlternateDns, configuredAlternateDns) || other.configuredAlternateDns == configuredAlternateDns)&&(identical(other.loadError, loadError) || other.loadError == loadError)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(networks),isScanning,submitting,selectedSsid,supportsStaticIp,configuredSsid,configuredWifiMac,configuredOnline,configuredPowerSavingMode,configuredIp,configuredSubnetMask,configuredDefaultGateway,configuredPreferredDns,configuredAlternateDns,loadError,error);

@override
String toString() {
  return 'WifiLockConfigState(networks: $networks, isScanning: $isScanning, submitting: $submitting, selectedSsid: $selectedSsid, supportsStaticIp: $supportsStaticIp, configuredSsid: $configuredSsid, configuredWifiMac: $configuredWifiMac, configuredOnline: $configuredOnline, configuredPowerSavingMode: $configuredPowerSavingMode, configuredIp: $configuredIp, configuredSubnetMask: $configuredSubnetMask, configuredDefaultGateway: $configuredDefaultGateway, configuredPreferredDns: $configuredPreferredDns, configuredAlternateDns: $configuredAlternateDns, loadError: $loadError, error: $error)';
}


}

/// @nodoc
abstract mixin class $WifiLockConfigStateCopyWith<$Res>  {
  factory $WifiLockConfigStateCopyWith(WifiLockConfigState value, $Res Function(WifiLockConfigState) _then) = _$WifiLockConfigStateCopyWithImpl;
@useResult
$Res call({
 List<WifiNetwork> networks, bool isScanning, bool submitting, String? selectedSsid, bool supportsStaticIp, String configuredSsid, String configuredWifiMac, bool configuredOnline, int configuredPowerSavingMode, String configuredIp, String configuredSubnetMask, String configuredDefaultGateway, String configuredPreferredDns, String configuredAlternateDns, AppException? loadError, AppException? error
});


$AppExceptionCopyWith<$Res>? get loadError;$AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class _$WifiLockConfigStateCopyWithImpl<$Res>
    implements $WifiLockConfigStateCopyWith<$Res> {
  _$WifiLockConfigStateCopyWithImpl(this._self, this._then);

  final WifiLockConfigState _self;
  final $Res Function(WifiLockConfigState) _then;

/// Create a copy of WifiLockConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? networks = null,Object? isScanning = null,Object? submitting = null,Object? selectedSsid = freezed,Object? supportsStaticIp = null,Object? configuredSsid = null,Object? configuredWifiMac = null,Object? configuredOnline = null,Object? configuredPowerSavingMode = null,Object? configuredIp = null,Object? configuredSubnetMask = null,Object? configuredDefaultGateway = null,Object? configuredPreferredDns = null,Object? configuredAlternateDns = null,Object? loadError = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
networks: null == networks ? _self.networks : networks // ignore: cast_nullable_to_non_nullable
as List<WifiNetwork>,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,selectedSsid: freezed == selectedSsid ? _self.selectedSsid : selectedSsid // ignore: cast_nullable_to_non_nullable
as String?,supportsStaticIp: null == supportsStaticIp ? _self.supportsStaticIp : supportsStaticIp // ignore: cast_nullable_to_non_nullable
as bool,configuredSsid: null == configuredSsid ? _self.configuredSsid : configuredSsid // ignore: cast_nullable_to_non_nullable
as String,configuredWifiMac: null == configuredWifiMac ? _self.configuredWifiMac : configuredWifiMac // ignore: cast_nullable_to_non_nullable
as String,configuredOnline: null == configuredOnline ? _self.configuredOnline : configuredOnline // ignore: cast_nullable_to_non_nullable
as bool,configuredPowerSavingMode: null == configuredPowerSavingMode ? _self.configuredPowerSavingMode : configuredPowerSavingMode // ignore: cast_nullable_to_non_nullable
as int,configuredIp: null == configuredIp ? _self.configuredIp : configuredIp // ignore: cast_nullable_to_non_nullable
as String,configuredSubnetMask: null == configuredSubnetMask ? _self.configuredSubnetMask : configuredSubnetMask // ignore: cast_nullable_to_non_nullable
as String,configuredDefaultGateway: null == configuredDefaultGateway ? _self.configuredDefaultGateway : configuredDefaultGateway // ignore: cast_nullable_to_non_nullable
as String,configuredPreferredDns: null == configuredPreferredDns ? _self.configuredPreferredDns : configuredPreferredDns // ignore: cast_nullable_to_non_nullable
as String,configuredAlternateDns: null == configuredAlternateDns ? _self.configuredAlternateDns : configuredAlternateDns // ignore: cast_nullable_to_non_nullable
as String,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as AppException?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}
/// Create a copy of WifiLockConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get loadError {
    if (_self.loadError == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.loadError!, (value) {
    return _then(_self.copyWith(loadError: value));
  });
}/// Create a copy of WifiLockConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [WifiLockConfigState].
extension WifiLockConfigStatePatterns on WifiLockConfigState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiLockConfigState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiLockConfigState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiLockConfigState value)  $default,){
final _that = this;
switch (_that) {
case _WifiLockConfigState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiLockConfigState value)?  $default,){
final _that = this;
switch (_that) {
case _WifiLockConfigState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WifiNetwork> networks,  bool isScanning,  bool submitting,  String? selectedSsid,  bool supportsStaticIp,  String configuredSsid,  String configuredWifiMac,  bool configuredOnline,  int configuredPowerSavingMode,  String configuredIp,  String configuredSubnetMask,  String configuredDefaultGateway,  String configuredPreferredDns,  String configuredAlternateDns,  AppException? loadError,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiLockConfigState() when $default != null:
return $default(_that.networks,_that.isScanning,_that.submitting,_that.selectedSsid,_that.supportsStaticIp,_that.configuredSsid,_that.configuredWifiMac,_that.configuredOnline,_that.configuredPowerSavingMode,_that.configuredIp,_that.configuredSubnetMask,_that.configuredDefaultGateway,_that.configuredPreferredDns,_that.configuredAlternateDns,_that.loadError,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WifiNetwork> networks,  bool isScanning,  bool submitting,  String? selectedSsid,  bool supportsStaticIp,  String configuredSsid,  String configuredWifiMac,  bool configuredOnline,  int configuredPowerSavingMode,  String configuredIp,  String configuredSubnetMask,  String configuredDefaultGateway,  String configuredPreferredDns,  String configuredAlternateDns,  AppException? loadError,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _WifiLockConfigState():
return $default(_that.networks,_that.isScanning,_that.submitting,_that.selectedSsid,_that.supportsStaticIp,_that.configuredSsid,_that.configuredWifiMac,_that.configuredOnline,_that.configuredPowerSavingMode,_that.configuredIp,_that.configuredSubnetMask,_that.configuredDefaultGateway,_that.configuredPreferredDns,_that.configuredAlternateDns,_that.loadError,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WifiNetwork> networks,  bool isScanning,  bool submitting,  String? selectedSsid,  bool supportsStaticIp,  String configuredSsid,  String configuredWifiMac,  bool configuredOnline,  int configuredPowerSavingMode,  String configuredIp,  String configuredSubnetMask,  String configuredDefaultGateway,  String configuredPreferredDns,  String configuredAlternateDns,  AppException? loadError,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _WifiLockConfigState() when $default != null:
return $default(_that.networks,_that.isScanning,_that.submitting,_that.selectedSsid,_that.supportsStaticIp,_that.configuredSsid,_that.configuredWifiMac,_that.configuredOnline,_that.configuredPowerSavingMode,_that.configuredIp,_that.configuredSubnetMask,_that.configuredDefaultGateway,_that.configuredPreferredDns,_that.configuredAlternateDns,_that.loadError,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WifiLockConfigState extends WifiLockConfigState {
  const _WifiLockConfigState({final  List<WifiNetwork> networks = const <WifiNetwork>[], this.isScanning = false, this.submitting = false, this.selectedSsid, this.supportsStaticIp = false, this.configuredSsid = '', this.configuredWifiMac = '', this.configuredOnline = false, this.configuredPowerSavingMode = 0, this.configuredIp = '', this.configuredSubnetMask = '', this.configuredDefaultGateway = '', this.configuredPreferredDns = '', this.configuredAlternateDns = '', this.loadError, this.error}): _networks = networks,super._();
  

 final  List<WifiNetwork> _networks;
@override@JsonKey() List<WifiNetwork> get networks {
  if (_networks is EqualUnmodifiableListView) return _networks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_networks);
}

@override@JsonKey() final  bool isScanning;
@override@JsonKey() final  bool submitting;
@override final  String? selectedSsid;
/// 是否支持 configIP（`TTLockFunction.wifiLockStaticIP`）；决定高级设置中静态 IP / DNS UI。
@override@JsonKey() final  bool supportsStaticIp;
/// 云端记载的当前已配 SSID（`WifiLockEntity.networkName`）；空串表示从未配过。
@override@JsonKey() final  String configuredSsid;
/// 云端记载的 WiFi MAC（只读摘要行用）。
@override@JsonKey() final  String configuredWifiMac;
/// 云端记载的在线状态（只读摘要行用）。
@override@JsonKey() final  bool configuredOnline;
/// 云端记载的省电模式：0=未知、1=开启、2=关闭
/// （与 `setWifiPowerSaving(on: ...)` 的写入约定一致）。
@override@JsonKey() final  int configuredPowerSavingMode;
/// 云端记载的静态 IP 配置（空串 = 未配置）。表单据此回显，
/// 避免每次保存都把静态锁误写成 DHCP（`useStaticIp=false`）。
@override@JsonKey() final  String configuredIp;
@override@JsonKey() final  String configuredSubnetMask;
@override@JsonKey() final  String configuredDefaultGateway;
/// 云端记载的首选 / 备用 DNS（空串 = 未配置）。
@override@JsonKey() final  String configuredPreferredDns;
@override@JsonKey() final  String configuredAlternateDns;
/// 云端信息载入失败（区别于提交/扫描失败，页面单独以常驻横幅展示）。
@override final  AppException? loadError;
@override final  AppException? error;

/// Create a copy of WifiLockConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiLockConfigStateCopyWith<_WifiLockConfigState> get copyWith => __$WifiLockConfigStateCopyWithImpl<_WifiLockConfigState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiLockConfigState&&const DeepCollectionEquality().equals(other._networks, _networks)&&(identical(other.isScanning, isScanning) || other.isScanning == isScanning)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.selectedSsid, selectedSsid) || other.selectedSsid == selectedSsid)&&(identical(other.supportsStaticIp, supportsStaticIp) || other.supportsStaticIp == supportsStaticIp)&&(identical(other.configuredSsid, configuredSsid) || other.configuredSsid == configuredSsid)&&(identical(other.configuredWifiMac, configuredWifiMac) || other.configuredWifiMac == configuredWifiMac)&&(identical(other.configuredOnline, configuredOnline) || other.configuredOnline == configuredOnline)&&(identical(other.configuredPowerSavingMode, configuredPowerSavingMode) || other.configuredPowerSavingMode == configuredPowerSavingMode)&&(identical(other.configuredIp, configuredIp) || other.configuredIp == configuredIp)&&(identical(other.configuredSubnetMask, configuredSubnetMask) || other.configuredSubnetMask == configuredSubnetMask)&&(identical(other.configuredDefaultGateway, configuredDefaultGateway) || other.configuredDefaultGateway == configuredDefaultGateway)&&(identical(other.configuredPreferredDns, configuredPreferredDns) || other.configuredPreferredDns == configuredPreferredDns)&&(identical(other.configuredAlternateDns, configuredAlternateDns) || other.configuredAlternateDns == configuredAlternateDns)&&(identical(other.loadError, loadError) || other.loadError == loadError)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_networks),isScanning,submitting,selectedSsid,supportsStaticIp,configuredSsid,configuredWifiMac,configuredOnline,configuredPowerSavingMode,configuredIp,configuredSubnetMask,configuredDefaultGateway,configuredPreferredDns,configuredAlternateDns,loadError,error);

@override
String toString() {
  return 'WifiLockConfigState(networks: $networks, isScanning: $isScanning, submitting: $submitting, selectedSsid: $selectedSsid, supportsStaticIp: $supportsStaticIp, configuredSsid: $configuredSsid, configuredWifiMac: $configuredWifiMac, configuredOnline: $configuredOnline, configuredPowerSavingMode: $configuredPowerSavingMode, configuredIp: $configuredIp, configuredSubnetMask: $configuredSubnetMask, configuredDefaultGateway: $configuredDefaultGateway, configuredPreferredDns: $configuredPreferredDns, configuredAlternateDns: $configuredAlternateDns, loadError: $loadError, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WifiLockConfigStateCopyWith<$Res> implements $WifiLockConfigStateCopyWith<$Res> {
  factory _$WifiLockConfigStateCopyWith(_WifiLockConfigState value, $Res Function(_WifiLockConfigState) _then) = __$WifiLockConfigStateCopyWithImpl;
@override @useResult
$Res call({
 List<WifiNetwork> networks, bool isScanning, bool submitting, String? selectedSsid, bool supportsStaticIp, String configuredSsid, String configuredWifiMac, bool configuredOnline, int configuredPowerSavingMode, String configuredIp, String configuredSubnetMask, String configuredDefaultGateway, String configuredPreferredDns, String configuredAlternateDns, AppException? loadError, AppException? error
});


@override $AppExceptionCopyWith<$Res>? get loadError;@override $AppExceptionCopyWith<$Res>? get error;

}
/// @nodoc
class __$WifiLockConfigStateCopyWithImpl<$Res>
    implements _$WifiLockConfigStateCopyWith<$Res> {
  __$WifiLockConfigStateCopyWithImpl(this._self, this._then);

  final _WifiLockConfigState _self;
  final $Res Function(_WifiLockConfigState) _then;

/// Create a copy of WifiLockConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? networks = null,Object? isScanning = null,Object? submitting = null,Object? selectedSsid = freezed,Object? supportsStaticIp = null,Object? configuredSsid = null,Object? configuredWifiMac = null,Object? configuredOnline = null,Object? configuredPowerSavingMode = null,Object? configuredIp = null,Object? configuredSubnetMask = null,Object? configuredDefaultGateway = null,Object? configuredPreferredDns = null,Object? configuredAlternateDns = null,Object? loadError = freezed,Object? error = freezed,}) {
  return _then(_WifiLockConfigState(
networks: null == networks ? _self._networks : networks // ignore: cast_nullable_to_non_nullable
as List<WifiNetwork>,isScanning: null == isScanning ? _self.isScanning : isScanning // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,selectedSsid: freezed == selectedSsid ? _self.selectedSsid : selectedSsid // ignore: cast_nullable_to_non_nullable
as String?,supportsStaticIp: null == supportsStaticIp ? _self.supportsStaticIp : supportsStaticIp // ignore: cast_nullable_to_non_nullable
as bool,configuredSsid: null == configuredSsid ? _self.configuredSsid : configuredSsid // ignore: cast_nullable_to_non_nullable
as String,configuredWifiMac: null == configuredWifiMac ? _self.configuredWifiMac : configuredWifiMac // ignore: cast_nullable_to_non_nullable
as String,configuredOnline: null == configuredOnline ? _self.configuredOnline : configuredOnline // ignore: cast_nullable_to_non_nullable
as bool,configuredPowerSavingMode: null == configuredPowerSavingMode ? _self.configuredPowerSavingMode : configuredPowerSavingMode // ignore: cast_nullable_to_non_nullable
as int,configuredIp: null == configuredIp ? _self.configuredIp : configuredIp // ignore: cast_nullable_to_non_nullable
as String,configuredSubnetMask: null == configuredSubnetMask ? _self.configuredSubnetMask : configuredSubnetMask // ignore: cast_nullable_to_non_nullable
as String,configuredDefaultGateway: null == configuredDefaultGateway ? _self.configuredDefaultGateway : configuredDefaultGateway // ignore: cast_nullable_to_non_nullable
as String,configuredPreferredDns: null == configuredPreferredDns ? _self.configuredPreferredDns : configuredPreferredDns // ignore: cast_nullable_to_non_nullable
as String,configuredAlternateDns: null == configuredAlternateDns ? _self.configuredAlternateDns : configuredAlternateDns // ignore: cast_nullable_to_non_nullable
as String,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as AppException?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

/// Create a copy of WifiLockConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get loadError {
    if (_self.loadError == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.loadError!, (value) {
    return _then(_self.copyWith(loadError: value));
  });
}/// Create a copy of WifiLockConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppExceptionCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
