// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_gateway_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedGatewayDevice {
  String get name;
  String get mac;
  String get gatewayModel;
  int get gatewayType;
  String? get wifiSsid;
  bool get useStaticIp;
  String? get ipAddress;
  String? get subnetMask;
  String? get router;
  String? get preferredDns;
  bool get apnEnabled;
  String? get apn;
  DateTime get initializedAt;

  /// Create a copy of SavedGatewayDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedGatewayDeviceCopyWith<SavedGatewayDevice> get copyWith =>
      _$SavedGatewayDeviceCopyWithImpl<SavedGatewayDevice>(
          this as SavedGatewayDevice, _$identity);

  /// Serializes this SavedGatewayDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedGatewayDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.gatewayModel, gatewayModel) ||
                other.gatewayModel == gatewayModel) &&
            (identical(other.gatewayType, gatewayType) ||
                other.gatewayType == gatewayType) &&
            (identical(other.wifiSsid, wifiSsid) ||
                other.wifiSsid == wifiSsid) &&
            (identical(other.useStaticIp, useStaticIp) ||
                other.useStaticIp == useStaticIp) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.subnetMask, subnetMask) ||
                other.subnetMask == subnetMask) &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.preferredDns, preferredDns) ||
                other.preferredDns == preferredDns) &&
            (identical(other.apnEnabled, apnEnabled) ||
                other.apnEnabled == apnEnabled) &&
            (identical(other.apn, apn) || other.apn == apn) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      mac,
      gatewayModel,
      gatewayType,
      wifiSsid,
      useStaticIp,
      ipAddress,
      subnetMask,
      router,
      preferredDns,
      apnEnabled,
      apn,
      initializedAt);

  @override
  String toString() {
    return 'SavedGatewayDevice(name: $name, mac: $mac, gatewayModel: $gatewayModel, gatewayType: $gatewayType, wifiSsid: $wifiSsid, useStaticIp: $useStaticIp, ipAddress: $ipAddress, subnetMask: $subnetMask, router: $router, preferredDns: $preferredDns, apnEnabled: $apnEnabled, apn: $apn, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedGatewayDeviceCopyWith<$Res> {
  factory $SavedGatewayDeviceCopyWith(
          SavedGatewayDevice value, $Res Function(SavedGatewayDevice) _then) =
      _$SavedGatewayDeviceCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String mac,
      String gatewayModel,
      int gatewayType,
      String? wifiSsid,
      bool useStaticIp,
      String? ipAddress,
      String? subnetMask,
      String? router,
      String? preferredDns,
      bool apnEnabled,
      String? apn,
      DateTime initializedAt});
}

/// @nodoc
class _$SavedGatewayDeviceCopyWithImpl<$Res>
    implements $SavedGatewayDeviceCopyWith<$Res> {
  _$SavedGatewayDeviceCopyWithImpl(this._self, this._then);

  final SavedGatewayDevice _self;
  final $Res Function(SavedGatewayDevice) _then;

  /// Create a copy of SavedGatewayDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? gatewayModel = null,
    Object? gatewayType = null,
    Object? wifiSsid = freezed,
    Object? useStaticIp = null,
    Object? ipAddress = freezed,
    Object? subnetMask = freezed,
    Object? router = freezed,
    Object? preferredDns = freezed,
    Object? apnEnabled = null,
    Object? apn = freezed,
    Object? initializedAt = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _self.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      gatewayModel: null == gatewayModel
          ? _self.gatewayModel
          : gatewayModel // ignore: cast_nullable_to_non_nullable
              as String,
      gatewayType: null == gatewayType
          ? _self.gatewayType
          : gatewayType // ignore: cast_nullable_to_non_nullable
              as int,
      wifiSsid: freezed == wifiSsid
          ? _self.wifiSsid
          : wifiSsid // ignore: cast_nullable_to_non_nullable
              as String?,
      useStaticIp: null == useStaticIp
          ? _self.useStaticIp
          : useStaticIp // ignore: cast_nullable_to_non_nullable
              as bool,
      ipAddress: freezed == ipAddress
          ? _self.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      subnetMask: freezed == subnetMask
          ? _self.subnetMask
          : subnetMask // ignore: cast_nullable_to_non_nullable
              as String?,
      router: freezed == router
          ? _self.router
          : router // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredDns: freezed == preferredDns
          ? _self.preferredDns
          : preferredDns // ignore: cast_nullable_to_non_nullable
              as String?,
      apnEnabled: null == apnEnabled
          ? _self.apnEnabled
          : apnEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      apn: freezed == apn
          ? _self.apn
          : apn // ignore: cast_nullable_to_non_nullable
              as String?,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SavedGatewayDevice implements SavedGatewayDevice {
  const _SavedGatewayDevice(
      {required this.name,
      required this.mac,
      this.gatewayModel = '',
      this.gatewayType = 0,
      this.wifiSsid,
      this.useStaticIp = false,
      this.ipAddress,
      this.subnetMask,
      this.router,
      this.preferredDns,
      this.apnEnabled = false,
      this.apn,
      required this.initializedAt});
  factory _SavedGatewayDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedGatewayDeviceFromJson(json);

  @override
  final String name;
  @override
  final String mac;
  @override
  @JsonKey()
  final String gatewayModel;
  @override
  @JsonKey()
  final int gatewayType;
  @override
  final String? wifiSsid;
  @override
  @JsonKey()
  final bool useStaticIp;
  @override
  final String? ipAddress;
  @override
  final String? subnetMask;
  @override
  final String? router;
  @override
  final String? preferredDns;
  @override
  @JsonKey()
  final bool apnEnabled;
  @override
  final String? apn;
  @override
  final DateTime initializedAt;

  /// Create a copy of SavedGatewayDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedGatewayDeviceCopyWith<_SavedGatewayDevice> get copyWith =>
      __$SavedGatewayDeviceCopyWithImpl<_SavedGatewayDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedGatewayDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedGatewayDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.gatewayModel, gatewayModel) ||
                other.gatewayModel == gatewayModel) &&
            (identical(other.gatewayType, gatewayType) ||
                other.gatewayType == gatewayType) &&
            (identical(other.wifiSsid, wifiSsid) ||
                other.wifiSsid == wifiSsid) &&
            (identical(other.useStaticIp, useStaticIp) ||
                other.useStaticIp == useStaticIp) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.subnetMask, subnetMask) ||
                other.subnetMask == subnetMask) &&
            (identical(other.router, router) || other.router == router) &&
            (identical(other.preferredDns, preferredDns) ||
                other.preferredDns == preferredDns) &&
            (identical(other.apnEnabled, apnEnabled) ||
                other.apnEnabled == apnEnabled) &&
            (identical(other.apn, apn) || other.apn == apn) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      mac,
      gatewayModel,
      gatewayType,
      wifiSsid,
      useStaticIp,
      ipAddress,
      subnetMask,
      router,
      preferredDns,
      apnEnabled,
      apn,
      initializedAt);

  @override
  String toString() {
    return 'SavedGatewayDevice(name: $name, mac: $mac, gatewayModel: $gatewayModel, gatewayType: $gatewayType, wifiSsid: $wifiSsid, useStaticIp: $useStaticIp, ipAddress: $ipAddress, subnetMask: $subnetMask, router: $router, preferredDns: $preferredDns, apnEnabled: $apnEnabled, apn: $apn, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedGatewayDeviceCopyWith<$Res>
    implements $SavedGatewayDeviceCopyWith<$Res> {
  factory _$SavedGatewayDeviceCopyWith(
          _SavedGatewayDevice value, $Res Function(_SavedGatewayDevice) _then) =
      __$SavedGatewayDeviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String mac,
      String gatewayModel,
      int gatewayType,
      String? wifiSsid,
      bool useStaticIp,
      String? ipAddress,
      String? subnetMask,
      String? router,
      String? preferredDns,
      bool apnEnabled,
      String? apn,
      DateTime initializedAt});
}

/// @nodoc
class __$SavedGatewayDeviceCopyWithImpl<$Res>
    implements _$SavedGatewayDeviceCopyWith<$Res> {
  __$SavedGatewayDeviceCopyWithImpl(this._self, this._then);

  final _SavedGatewayDevice _self;
  final $Res Function(_SavedGatewayDevice) _then;

  /// Create a copy of SavedGatewayDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? gatewayModel = null,
    Object? gatewayType = null,
    Object? wifiSsid = freezed,
    Object? useStaticIp = null,
    Object? ipAddress = freezed,
    Object? subnetMask = freezed,
    Object? router = freezed,
    Object? preferredDns = freezed,
    Object? apnEnabled = null,
    Object? apn = freezed,
    Object? initializedAt = null,
  }) {
    return _then(_SavedGatewayDevice(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _self.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      gatewayModel: null == gatewayModel
          ? _self.gatewayModel
          : gatewayModel // ignore: cast_nullable_to_non_nullable
              as String,
      gatewayType: null == gatewayType
          ? _self.gatewayType
          : gatewayType // ignore: cast_nullable_to_non_nullable
              as int,
      wifiSsid: freezed == wifiSsid
          ? _self.wifiSsid
          : wifiSsid // ignore: cast_nullable_to_non_nullable
              as String?,
      useStaticIp: null == useStaticIp
          ? _self.useStaticIp
          : useStaticIp // ignore: cast_nullable_to_non_nullable
              as bool,
      ipAddress: freezed == ipAddress
          ? _self.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      subnetMask: freezed == subnetMask
          ? _self.subnetMask
          : subnetMask // ignore: cast_nullable_to_non_nullable
              as String?,
      router: freezed == router
          ? _self.router
          : router // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredDns: freezed == preferredDns
          ? _self.preferredDns
          : preferredDns // ignore: cast_nullable_to_non_nullable
              as String?,
      apnEnabled: null == apnEnabled
          ? _self.apnEnabled
          : apnEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      apn: freezed == apn
          ? _self.apn
          : apn // ignore: cast_nullable_to_non_nullable
              as String?,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
