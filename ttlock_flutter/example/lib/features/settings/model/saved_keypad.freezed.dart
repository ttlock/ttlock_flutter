// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_keypad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedKeypad {
  String get name;
  String get mac;
  String get boundLockMac;
  bool get isMultiFunction;
  DateTime get initializedAt;

  /// Create a copy of SavedKeypad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedKeypadCopyWith<SavedKeypad> get copyWith =>
      _$SavedKeypadCopyWithImpl<SavedKeypad>(this as SavedKeypad, _$identity);

  /// Serializes this SavedKeypad to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedKeypad &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.boundLockMac, boundLockMac) ||
                other.boundLockMac == boundLockMac) &&
            (identical(other.isMultiFunction, isMultiFunction) ||
                other.isMultiFunction == isMultiFunction) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, mac, boundLockMac, isMultiFunction, initializedAt);

  @override
  String toString() {
    return 'SavedKeypad(name: $name, mac: $mac, boundLockMac: $boundLockMac, isMultiFunction: $isMultiFunction, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedKeypadCopyWith<$Res> {
  factory $SavedKeypadCopyWith(
          SavedKeypad value, $Res Function(SavedKeypad) _then) =
      _$SavedKeypadCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String mac,
      String boundLockMac,
      bool isMultiFunction,
      DateTime initializedAt});
}

/// @nodoc
class _$SavedKeypadCopyWithImpl<$Res> implements $SavedKeypadCopyWith<$Res> {
  _$SavedKeypadCopyWithImpl(this._self, this._then);

  final SavedKeypad _self;
  final $Res Function(SavedKeypad) _then;

  /// Create a copy of SavedKeypad
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? boundLockMac = null,
    Object? isMultiFunction = null,
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
      isMultiFunction: null == isMultiFunction
          ? _self.isMultiFunction
          : isMultiFunction // ignore: cast_nullable_to_non_nullable
              as bool,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SavedKeypad implements SavedKeypad {
  const _SavedKeypad(
      {required this.name,
      required this.mac,
      required this.boundLockMac,
      this.isMultiFunction = false,
      required this.initializedAt});
  factory _SavedKeypad.fromJson(Map<String, dynamic> json) =>
      _$SavedKeypadFromJson(json);

  @override
  final String name;
  @override
  final String mac;
  @override
  final String boundLockMac;
  @override
  @JsonKey()
  final bool isMultiFunction;
  @override
  final DateTime initializedAt;

  /// Create a copy of SavedKeypad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedKeypadCopyWith<_SavedKeypad> get copyWith =>
      __$SavedKeypadCopyWithImpl<_SavedKeypad>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedKeypadToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedKeypad &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.boundLockMac, boundLockMac) ||
                other.boundLockMac == boundLockMac) &&
            (identical(other.isMultiFunction, isMultiFunction) ||
                other.isMultiFunction == isMultiFunction) &&
            (identical(other.initializedAt, initializedAt) ||
                other.initializedAt == initializedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, mac, boundLockMac, isMultiFunction, initializedAt);

  @override
  String toString() {
    return 'SavedKeypad(name: $name, mac: $mac, boundLockMac: $boundLockMac, isMultiFunction: $isMultiFunction, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedKeypadCopyWith<$Res>
    implements $SavedKeypadCopyWith<$Res> {
  factory _$SavedKeypadCopyWith(
          _SavedKeypad value, $Res Function(_SavedKeypad) _then) =
      __$SavedKeypadCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String mac,
      String boundLockMac,
      bool isMultiFunction,
      DateTime initializedAt});
}

/// @nodoc
class __$SavedKeypadCopyWithImpl<$Res> implements _$SavedKeypadCopyWith<$Res> {
  __$SavedKeypadCopyWithImpl(this._self, this._then);

  final _SavedKeypad _self;
  final $Res Function(_SavedKeypad) _then;

  /// Create a copy of SavedKeypad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? boundLockMac = null,
    Object? isMultiFunction = null,
    Object? initializedAt = null,
  }) {
    return _then(_SavedKeypad(
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
      isMultiFunction: null == isMultiFunction
          ? _self.isMultiFunction
          : isMultiFunction // ignore: cast_nullable_to_non_nullable
              as bool,
      initializedAt: null == initializedAt
          ? _self.initializedAt
          : initializedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
