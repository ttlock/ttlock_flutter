// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_meter_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedMeterDevice {
  String get name;
  String get mac;
  String get meterId;
  String get meterType;
  DateTime get initializedAt;

  /// Create a copy of SavedMeterDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedMeterDeviceCopyWith<SavedMeterDevice> get copyWith =>
      _$SavedMeterDeviceCopyWithImpl<SavedMeterDevice>(
          this as SavedMeterDevice, _$identity);

  /// Serializes this SavedMeterDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedMeterDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.meterId, meterId) || other.meterId == meterId) &&
            (identical(other.meterType, meterType) ||
                other.meterType == meterType) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, mac, meterId, meterType, initializedAt);

  @override
  String toString() {
    return 'SavedMeterDevice(name: $name, mac: $mac, meterId: $meterId, meterType: $meterType, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedMeterDeviceCopyWith<$Res> {
  factory $SavedMeterDeviceCopyWith(
          SavedMeterDevice value, $Res Function(SavedMeterDevice) _then) =
      _$SavedMeterDeviceCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String mac,
      String meterId,
      String meterType,
      DateTime initializedAt});
}

/// @nodoc
class _$SavedMeterDeviceCopyWithImpl<$Res>
    implements $SavedMeterDeviceCopyWith<$Res> {
  _$SavedMeterDeviceCopyWithImpl(this._self, this._then);

  final SavedMeterDevice _self;
  final $Res Function(SavedMeterDevice) _then;

  /// Create a copy of SavedMeterDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? meterId = null,
    Object? meterType = null,
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
      meterId: null == meterId
          ? _self.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String,
      meterType: null == meterType
          ? _self.meterType
          : meterType // ignore: cast_nullable_to_non_nullable
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
class _SavedMeterDevice extends SavedMeterDevice {
  const _SavedMeterDevice(
      {required this.name,
      required this.mac,
      required this.meterId,
      required this.meterType,
      required this.initializedAt})
      : super._();
  factory _SavedMeterDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedMeterDeviceFromJson(json);

  @override
  final String name;
  @override
  final String mac;
  @override
  final String meterId;
  @override
  final String meterType;
  @override
  final DateTime initializedAt;

  /// Create a copy of SavedMeterDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedMeterDeviceCopyWith<_SavedMeterDevice> get copyWith =>
      __$SavedMeterDeviceCopyWithImpl<_SavedMeterDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedMeterDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedMeterDevice &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.meterId, meterId) || other.meterId == meterId) &&
            (identical(other.meterType, meterType) ||
                other.meterType == meterType) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, mac, meterId, meterType, initializedAt);

  @override
  String toString() {
    return 'SavedMeterDevice(name: $name, mac: $mac, meterId: $meterId, meterType: $meterType, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedMeterDeviceCopyWith<$Res>
    implements $SavedMeterDeviceCopyWith<$Res> {
  factory _$SavedMeterDeviceCopyWith(
          _SavedMeterDevice value, $Res Function(_SavedMeterDevice) _then) =
      __$SavedMeterDeviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String mac,
      String meterId,
      String meterType,
      DateTime initializedAt});
}

/// @nodoc
class __$SavedMeterDeviceCopyWithImpl<$Res>
    implements _$SavedMeterDeviceCopyWith<$Res> {
  __$SavedMeterDeviceCopyWithImpl(this._self, this._then);

  final _SavedMeterDevice _self;
  final $Res Function(_SavedMeterDevice) _then;

  /// Create a copy of SavedMeterDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? meterId = null,
    Object? meterType = null,
    Object? initializedAt = null,
  }) {
    return _then(_SavedMeterDevice(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _self.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      meterId: null == meterId
          ? _self.meterId
          : meterId // ignore: cast_nullable_to_non_nullable
              as String,
      meterType: null == meterType
          ? _self.meterType
          : meterType // ignore: cast_nullable_to_non_nullable
              as String,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
