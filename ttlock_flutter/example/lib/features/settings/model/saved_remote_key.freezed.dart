// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_remote_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedRemoteKey {
  String get name;
  String get mac;
  String get boundLockMac;
  DateTime get initializedAt;

  /// Create a copy of SavedRemoteKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedRemoteKeyCopyWith<SavedRemoteKey> get copyWith =>
      _$SavedRemoteKeyCopyWithImpl<SavedRemoteKey>(
          this as SavedRemoteKey, _$identity);

  /// Serializes this SavedRemoteKey to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedRemoteKey &&
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
    return 'SavedRemoteKey(name: $name, mac: $mac, boundLockMac: $boundLockMac, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class $SavedRemoteKeyCopyWith<$Res> {
  factory $SavedRemoteKeyCopyWith(
          SavedRemoteKey value, $Res Function(SavedRemoteKey) _then) =
      _$SavedRemoteKeyCopyWithImpl;
  @useResult
  $Res call(
      {String name, String mac, String boundLockMac, DateTime initializedAt});
}

/// @nodoc
class _$SavedRemoteKeyCopyWithImpl<$Res>
    implements $SavedRemoteKeyCopyWith<$Res> {
  _$SavedRemoteKeyCopyWithImpl(this._self, this._then);

  final SavedRemoteKey _self;
  final $Res Function(SavedRemoteKey) _then;

  /// Create a copy of SavedRemoteKey
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
class _SavedRemoteKey implements SavedRemoteKey {
  const _SavedRemoteKey(
      {required this.name,
      required this.mac,
      required this.boundLockMac,
      required this.initializedAt});
  factory _SavedRemoteKey.fromJson(Map<String, dynamic> json) =>
      _$SavedRemoteKeyFromJson(json);

  @override
  final String name;
  @override
  final String mac;
  @override
  final String boundLockMac;
  @override
  final DateTime initializedAt;

  /// Create a copy of SavedRemoteKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedRemoteKeyCopyWith<_SavedRemoteKey> get copyWith =>
      __$SavedRemoteKeyCopyWithImpl<_SavedRemoteKey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedRemoteKeyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedRemoteKey &&
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
    return 'SavedRemoteKey(name: $name, mac: $mac, boundLockMac: $boundLockMac, initializedAt: $initializedAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedRemoteKeyCopyWith<$Res>
    implements $SavedRemoteKeyCopyWith<$Res> {
  factory _$SavedRemoteKeyCopyWith(
          _SavedRemoteKey value, $Res Function(_SavedRemoteKey) _then) =
      __$SavedRemoteKeyCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name, String mac, String boundLockMac, DateTime initializedAt});
}

/// @nodoc
class __$SavedRemoteKeyCopyWithImpl<$Res>
    implements _$SavedRemoteKeyCopyWith<$Res> {
  __$SavedRemoteKeyCopyWithImpl(this._self, this._then);

  final _SavedRemoteKey _self;
  final $Res Function(_SavedRemoteKey) _then;

  /// Create a copy of SavedRemoteKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? mac = null,
    Object? boundLockMac = null,
    Object? initializedAt = null,
  }) {
    return _then(_SavedRemoteKey(
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
