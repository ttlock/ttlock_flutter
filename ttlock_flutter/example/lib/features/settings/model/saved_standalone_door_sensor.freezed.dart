// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_standalone_door_sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedStandaloneDoorSensor {
  String get name;
  String get mac;
  String? get doorSensorData;
  String? get featureValue;
  String? get modelNum;
  int? get electricQuantity;
  DateTime get initializedAt;

  /// Create a copy of SavedStandaloneDoorSensor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedStandaloneDoorSensorCopyWith<SavedStandaloneDoorSensor> get copyWith =>
      _$SavedStandaloneDoorSensorCopyWithImpl<SavedStandaloneDoorSensor>(
          this as SavedStandaloneDoorSensor, _$identity);

  /// Serializes this SavedStandaloneDoorSensor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedStandaloneDoorSensor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.doorSensorData, doorSensorData) ||
                other.doorSensorData == doorSensorData) &&
            (identical(other.featureValue, featureValue) ||
                other.featureValue == featureValue) &&
            (identical(other.modelNum, modelNum) ||
                other.modelNum == modelNum) &&
            (identical(other.electricQuantity, electricQuantity) ||
                other.electricQuantity == electricQuantity) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mac, doorSensorData,
      featureValue, modelNum, electricQuantity, initializedAt);

  @override
  String toString() {
    return 'SavedStandaloneDoorSensor(name: $name, mac: $mac, doorSensorData: $doorSensorData, featureValue: $featureValue, modelNum: $modelNum, electricQuantity: $electricQuantity, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedStandaloneDoorSensorCopyWith<$Res> {
  factory $SavedStandaloneDoorSensorCopyWith(SavedStandaloneDoorSensor value,
          $Res Function(SavedStandaloneDoorSensor) _then) =
      _$SavedStandaloneDoorSensorCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String mac,
      String? doorSensorData,
      String? featureValue,
      String? modelNum,
      int? electricQuantity,
      DateTime initializedAt});
}

/// @nodoc
class _$SavedStandaloneDoorSensorCopyWithImpl<$Res>
    implements $SavedStandaloneDoorSensorCopyWith<$Res> {
  _$SavedStandaloneDoorSensorCopyWithImpl(this._self, this._then);

  final SavedStandaloneDoorSensor _self;
  final $Res Function(SavedStandaloneDoorSensor) _then;

  /// Create a copy of SavedStandaloneDoorSensor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? doorSensorData = freezed,
    Object? featureValue = freezed,
    Object? modelNum = freezed,
    Object? electricQuantity = freezed,
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
      doorSensorData: freezed == doorSensorData
          ? _self.doorSensorData
          : doorSensorData // ignore: cast_nullable_to_non_nullable
              as String?,
      featureValue: freezed == featureValue
          ? _self.featureValue
          : featureValue // ignore: cast_nullable_to_non_nullable
              as String?,
      modelNum: freezed == modelNum
          ? _self.modelNum
          : modelNum // ignore: cast_nullable_to_non_nullable
              as String?,
      electricQuantity: freezed == electricQuantity
          ? _self.electricQuantity
          : electricQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SavedStandaloneDoorSensor implements SavedStandaloneDoorSensor {
  const _SavedStandaloneDoorSensor(
      {required this.name,
      required this.mac,
      this.doorSensorData,
      this.featureValue,
      this.modelNum,
      this.electricQuantity,
      required this.initializedAt});
  factory _SavedStandaloneDoorSensor.fromJson(Map<String, dynamic> json) =>
      _$SavedStandaloneDoorSensorFromJson(json);

  @override
  final String name;
  @override
  final String mac;
  @override
  final String? doorSensorData;
  @override
  final String? featureValue;
  @override
  final String? modelNum;
  @override
  final int? electricQuantity;
  @override
  final DateTime initializedAt;

  /// Create a copy of SavedStandaloneDoorSensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedStandaloneDoorSensorCopyWith<_SavedStandaloneDoorSensor>
      get copyWith =>
          __$SavedStandaloneDoorSensorCopyWithImpl<_SavedStandaloneDoorSensor>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedStandaloneDoorSensorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedStandaloneDoorSensor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.doorSensorData, doorSensorData) ||
                other.doorSensorData == doorSensorData) &&
            (identical(other.featureValue, featureValue) ||
                other.featureValue == featureValue) &&
            (identical(other.modelNum, modelNum) ||
                other.modelNum == modelNum) &&
            (identical(other.electricQuantity, electricQuantity) ||
                other.electricQuantity == electricQuantity) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, mac, doorSensorData,
      featureValue, modelNum, electricQuantity, initializedAt);

  @override
  String toString() {
    return 'SavedStandaloneDoorSensor(name: $name, mac: $mac, doorSensorData: $doorSensorData, featureValue: $featureValue, modelNum: $modelNum, electricQuantity: $electricQuantity, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedStandaloneDoorSensorCopyWith<$Res>
    implements $SavedStandaloneDoorSensorCopyWith<$Res> {
  factory _$SavedStandaloneDoorSensorCopyWith(_SavedStandaloneDoorSensor value,
          $Res Function(_SavedStandaloneDoorSensor) _then) =
      __$SavedStandaloneDoorSensorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String mac,
      String? doorSensorData,
      String? featureValue,
      String? modelNum,
      int? electricQuantity,
      DateTime initializedAt});
}

/// @nodoc
class __$SavedStandaloneDoorSensorCopyWithImpl<$Res>
    implements _$SavedStandaloneDoorSensorCopyWith<$Res> {
  __$SavedStandaloneDoorSensorCopyWithImpl(this._self, this._then);

  final _SavedStandaloneDoorSensor _self;
  final $Res Function(_SavedStandaloneDoorSensor) _then;

  /// Create a copy of SavedStandaloneDoorSensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? doorSensorData = freezed,
    Object? featureValue = freezed,
    Object? modelNum = freezed,
    Object? electricQuantity = freezed,
    Object? initializedAt = null,
  }) {
    return _then(_SavedStandaloneDoorSensor(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mac: null == mac
          ? _self.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String,
      doorSensorData: freezed == doorSensorData
          ? _self.doorSensorData
          : doorSensorData // ignore: cast_nullable_to_non_nullable
              as String?,
      featureValue: freezed == featureValue
          ? _self.featureValue
          : featureValue // ignore: cast_nullable_to_non_nullable
              as String?,
      modelNum: freezed == modelNum
          ? _self.modelNum
          : modelNum // ignore: cast_nullable_to_non_nullable
              as String?,
      electricQuantity: freezed == electricQuantity
          ? _self.electricQuantity
          : electricQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
