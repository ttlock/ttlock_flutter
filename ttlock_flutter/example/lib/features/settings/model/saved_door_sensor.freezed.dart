// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_door_sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedDoorSensor {
  String get name;
  String get mac;
  String get boundLockMac;
  DateTime get initializedAt;

  /// Create a copy of SavedDoorSensor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedDoorSensorCopyWith<SavedDoorSensor> get copyWith =>
      _$SavedDoorSensorCopyWithImpl<SavedDoorSensor>(
          this as SavedDoorSensor, _$identity);

  /// Serializes this SavedDoorSensor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedDoorSensor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.boundLockMac, boundLockMac) ||
                other.boundLockMac == boundLockMac) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, mac, boundLockMac, initializedAt);

  @override
  String toString() {
    return 'SavedDoorSensor(name: $name, mac: $mac, boundLockMac: $boundLockMac, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedDoorSensorCopyWith<$Res> {
  factory $SavedDoorSensorCopyWith(
          SavedDoorSensor value, $Res Function(SavedDoorSensor) _then) =
      _$SavedDoorSensorCopyWithImpl;
  @useResult
  $Res call(
      {String name, String mac, String boundLockMac, DateTime initializedAt});
}

/// @nodoc
class _$SavedDoorSensorCopyWithImpl<$Res>
    implements $SavedDoorSensorCopyWith<$Res> {
  _$SavedDoorSensorCopyWithImpl(this._self, this._then);

  final SavedDoorSensor _self;
  final $Res Function(SavedDoorSensor) _then;

  /// Create a copy of SavedDoorSensor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? boundLockMac = null,
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
      boundLockMac: null == boundLockMac
          ? _self.boundLockMac
          : boundLockMac // ignore: cast_nullable_to_non_nullable
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
class _SavedDoorSensor implements SavedDoorSensor {
  const _SavedDoorSensor(
      {required this.name,
      required this.mac,
      required this.boundLockMac,
      required this.initializedAt});
  factory _SavedDoorSensor.fromJson(Map<String, dynamic> json) =>
      _$SavedDoorSensorFromJson(json);

  @override
  final String name;
  @override
  final String mac;
  @override
  final String boundLockMac;
  @override
  final DateTime initializedAt;

  /// Create a copy of SavedDoorSensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedDoorSensorCopyWith<_SavedDoorSensor> get copyWith =>
      __$SavedDoorSensorCopyWithImpl<_SavedDoorSensor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedDoorSensorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedDoorSensor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.boundLockMac, boundLockMac) ||
                other.boundLockMac == boundLockMac) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, mac, boundLockMac, initializedAt);

  @override
  String toString() {
    return 'SavedDoorSensor(name: $name, mac: $mac, boundLockMac: $boundLockMac, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedDoorSensorCopyWith<$Res>
    implements $SavedDoorSensorCopyWith<$Res> {
  factory _$SavedDoorSensorCopyWith(
          _SavedDoorSensor value, $Res Function(_SavedDoorSensor) _then) =
      __$SavedDoorSensorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name, String mac, String boundLockMac, DateTime initializedAt});
}

/// @nodoc
class __$SavedDoorSensorCopyWithImpl<$Res>
    implements _$SavedDoorSensorCopyWith<$Res> {
  __$SavedDoorSensorCopyWithImpl(this._self, this._then);

  final _SavedDoorSensor _self;
  final $Res Function(_SavedDoorSensor) _then;

  /// Create a copy of SavedDoorSensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? boundLockMac = null,
    Object? initializedAt = null,
  }) {
    return _then(_SavedDoorSensor(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _self.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      boundLockMac: null == boundLockMac
          ? _self.boundLockMac
          : boundLockMac // ignore: cast_nullable_to_non_nullable
              as String,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
