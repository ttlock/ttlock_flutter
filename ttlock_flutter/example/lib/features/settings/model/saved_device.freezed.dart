// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedDevice {
  String get name;
  String get mac;
  String get lockData;
  DateTime get initializedAt;

  /// Create a copy of SavedDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedDeviceCopyWith<SavedDevice> get copyWith =>
      _$SavedDeviceCopyWithImpl<SavedDevice>(this as SavedDevice, _$identity);

  /// Serializes this SavedDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.lockData, lockData) ||
                other.lockData == lockData) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, mac, lockData, initializedAt);

  @override
  String toString() {
    return 'SavedDevice(name: $name, mac: $mac, lockData: $lockData, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedDeviceCopyWith<$Res> {
  factory $SavedDeviceCopyWith(
          SavedDevice value, $Res Function(SavedDevice) _then) =
      _$SavedDeviceCopyWithImpl;
  @useResult
  $Res call({String name, String mac, String lockData, DateTime initializedAt});
}

/// @nodoc
class _$SavedDeviceCopyWithImpl<$Res> implements $SavedDeviceCopyWith<$Res> {
  _$SavedDeviceCopyWithImpl(this._self, this._then);

  final SavedDevice _self;
  final $Res Function(SavedDevice) _then;

  /// Create a copy of SavedDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? lockData = null,
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
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SavedDevice implements SavedDevice {
  const _SavedDevice(
      {required this.name,
      required this.mac,
      required this.lockData,
      required this.initializedAt});
  factory _SavedDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedDeviceFromJson(json);

  @override
  final String name;
  @override
  final String mac;
  @override
  final String lockData;
  @override
  final DateTime initializedAt;

  /// Create a copy of SavedDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedDeviceCopyWith<_SavedDevice> get copyWith =>
      __$SavedDeviceCopyWithImpl<_SavedDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.lockData, lockData) ||
                other.lockData == lockData) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, mac, lockData, initializedAt);

  @override
  String toString() {
    return 'SavedDevice(name: $name, mac: $mac, lockData: $lockData, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedDeviceCopyWith<$Res>
    implements $SavedDeviceCopyWith<$Res> {
  factory _$SavedDeviceCopyWith(
          _SavedDevice value, $Res Function(_SavedDevice) _then) =
      __$SavedDeviceCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String mac, String lockData, DateTime initializedAt});
}

/// @nodoc
class __$SavedDeviceCopyWithImpl<$Res> implements _$SavedDeviceCopyWith<$Res> {
  __$SavedDeviceCopyWithImpl(this._self, this._then);

  final _SavedDevice _self;
  final $Res Function(_SavedDevice) _then;

  /// Create a copy of SavedDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? lockData = null,
    Object? initializedAt = null,
  }) {
    return _then(_SavedDevice(
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
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
