// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_lock_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedLockDevice {
  String get name;
  String get mac;
  String get lockData;
  int get protocolType;
  int get protocolVersion;
  int get scene;
  int get groupId;
  int get orgId;
  DateTime get initializedAt;

  /// Create a copy of SavedLockDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedLockDeviceCopyWith<SavedLockDevice> get copyWith =>
      _$SavedLockDeviceCopyWithImpl<SavedLockDevice>(
          this as SavedLockDevice, _$identity);

  /// Serializes this SavedLockDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedLockDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.lockData, lockData) ||
                other.lockData == lockData) &&
            (identical(other.protocolType, protocolType) ||
                other.protocolType == protocolType) &&
            (identical(other.protocolVersion, protocolVersion) ||
                other.protocolVersion == protocolVersion) &&
            (identical(other.scene, scene) || other.scene == scene) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mac, lockData,
      protocolType, protocolVersion, scene, groupId, orgId, initializedAt);

  @override
  String toString() {
    return 'SavedLockDevice(name: $name, mac: $mac, lockData: $lockData, protocolType: $protocolType, protocolVersion: $protocolVersion, scene: $scene, groupId: $groupId, orgId: $orgId, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedLockDeviceCopyWith<$Res> {
  factory $SavedLockDeviceCopyWith(
          SavedLockDevice value, $Res Function(SavedLockDevice) _then) =
      _$SavedLockDeviceCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String mac,
      String lockData,
      int protocolType,
      int protocolVersion,
      int scene,
      int groupId,
      int orgId,
      DateTime initializedAt});
}

/// @nodoc
class _$SavedLockDeviceCopyWithImpl<$Res>
    implements $SavedLockDeviceCopyWith<$Res> {
  _$SavedLockDeviceCopyWithImpl(this._self, this._then);

  final SavedLockDevice _self;
  final $Res Function(SavedLockDevice) _then;

  /// Create a copy of SavedLockDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? lockData = null,
    Object? protocolType = null,
    Object? protocolVersion = null,
    Object? scene = null,
    Object? groupId = null,
    Object? orgId = null,
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
      lockData: null == lockData
          ? _self.lockData
          : lockData // ignore: cast_nullable_to_non_nullable
              as String,
      protocolType: null == protocolType
          ? _self.protocolType
          : protocolType // ignore: cast_nullable_to_non_nullable
              as int,
      protocolVersion: null == protocolVersion
          ? _self.protocolVersion
          : protocolVersion // ignore: cast_nullable_to_non_nullable
              as int,
      scene: null == scene
          ? _self.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      orgId: null == orgId
          ? _self.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as int,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SavedLockDevice extends SavedLockDevice {
  const _SavedLockDevice(
      {required this.name,
      required this.mac,
      required this.lockData,
      this.protocolType = 5,
      this.protocolVersion = 3,
      this.scene = 2,
      this.groupId = 1,
      this.orgId = 1,
      required this.initializedAt})
      : super._();
  factory _SavedLockDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedLockDeviceFromJson(json);

  @override
  final String name;
  @override
  final String mac;
  @override
  final String lockData;
  @override
  @JsonKey()
  final int protocolType;
  @override
  @JsonKey()
  final int protocolVersion;
  @override
  @JsonKey()
  final int scene;
  @override
  @JsonKey()
  final int groupId;
  @override
  @JsonKey()
  final int orgId;
  @override
  final DateTime initializedAt;

  /// Create a copy of SavedLockDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedLockDeviceCopyWith<_SavedLockDevice> get copyWith =>
      __$SavedLockDeviceCopyWithImpl<_SavedLockDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedLockDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedLockDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.lockData, lockData) ||
                other.lockData == lockData) &&
            (identical(other.protocolType, protocolType) ||
                other.protocolType == protocolType) &&
            (identical(other.protocolVersion, protocolVersion) ||
                other.protocolVersion == protocolVersion) &&
            (identical(other.scene, scene) || other.scene == scene) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mac, lockData,
      protocolType, protocolVersion, scene, groupId, orgId, initializedAt);

  @override
  String toString() {
    return 'SavedLockDevice(name: $name, mac: $mac, lockData: $lockData, protocolType: $protocolType, protocolVersion: $protocolVersion, scene: $scene, groupId: $groupId, orgId: $orgId, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedLockDeviceCopyWith<$Res>
    implements $SavedLockDeviceCopyWith<$Res> {
  factory _$SavedLockDeviceCopyWith(
          _SavedLockDevice value, $Res Function(_SavedLockDevice) _then) =
      __$SavedLockDeviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String mac,
      String lockData,
      int protocolType,
      int protocolVersion,
      int scene,
      int groupId,
      int orgId,
      DateTime initializedAt});
}

/// @nodoc
class __$SavedLockDeviceCopyWithImpl<$Res>
    implements _$SavedLockDeviceCopyWith<$Res> {
  __$SavedLockDeviceCopyWithImpl(this._self, this._then);

  final _SavedLockDevice _self;
  final $Res Function(_SavedLockDevice) _then;

  /// Create a copy of SavedLockDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? lockData = null,
    Object? protocolType = null,
    Object? protocolVersion = null,
    Object? scene = null,
    Object? groupId = null,
    Object? orgId = null,
    Object? initializedAt = null,
  }) {
    return _then(_SavedLockDevice(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _self.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      lockData: null == lockData
          ? _self.lockData
          : lockData // ignore: cast_nullable_to_non_nullable
              as String,
      protocolType: null == protocolType
          ? _self.protocolType
          : protocolType // ignore: cast_nullable_to_non_nullable
              as int,
      protocolVersion: null == protocolVersion
          ? _self.protocolVersion
          : protocolVersion // ignore: cast_nullable_to_non_nullable
              as int,
      scene: null == scene
          ? _self.scene
          : scene // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      orgId: null == orgId
          ? _self.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as int,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
