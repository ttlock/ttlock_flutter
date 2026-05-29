// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_status_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LockStatusState {
  int? get power;
  TTLockSwitchState? get switchState;
  int? get lockTimeSeconds;

  /// Create a copy of LockStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LockStatusStateCopyWith<LockStatusState> get copyWith =>
      _$LockStatusStateCopyWithImpl<LockStatusState>(
          this as LockStatusState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LockStatusState &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.switchState, switchState) ||
                other.switchState == switchState) &&
            (identical(other.lockTimeSeconds, lockTimeSeconds) ||
                other.lockTimeSeconds == lockTimeSeconds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, power, switchState, lockTimeSeconds);

  @override
  String toString() {
    return 'LockStatusState(power: $power, switchState: $switchState, lockTimeSeconds: $lockTimeSeconds)';
  }
}

/// @nodoc
abstract mixin class $LockStatusStateCopyWith<$Res> {
  factory $LockStatusStateCopyWith(
          LockStatusState value, $Res Function(LockStatusState) _then) =
      _$LockStatusStateCopyWithImpl;
  @useResult
  $Res call({int? power, TTLockSwitchState? switchState, int? lockTimeSeconds});
}

/// @nodoc
class _$LockStatusStateCopyWithImpl<$Res>
    implements $LockStatusStateCopyWith<$Res> {
  _$LockStatusStateCopyWithImpl(this._self, this._then);

  final LockStatusState _self;
  final $Res Function(LockStatusState) _then;

  /// Create a copy of LockStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? power = freezed,
    Object? switchState = freezed,
    Object? lockTimeSeconds = freezed,
  }) {
    return _then(_self.copyWith(
      power: freezed == power
          ? _self.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      switchState: freezed == switchState
          ? _self.switchState
          : switchState // ignore: cast_nullable_to_non_nullable
              as TTLockSwitchState?,
      lockTimeSeconds: freezed == lockTimeSeconds
          ? _self.lockTimeSeconds
          : lockTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _LockStatusState implements LockStatusState {
  const _LockStatusState({this.power, this.switchState, this.lockTimeSeconds});

  @override
  final int? power;
  @override
  final TTLockSwitchState? switchState;
  @override
  final int? lockTimeSeconds;

  /// Create a copy of LockStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LockStatusStateCopyWith<_LockStatusState> get copyWith =>
      __$LockStatusStateCopyWithImpl<_LockStatusState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LockStatusState &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.switchState, switchState) ||
                other.switchState == switchState) &&
            (identical(other.lockTimeSeconds, lockTimeSeconds) ||
                other.lockTimeSeconds == lockTimeSeconds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, power, switchState, lockTimeSeconds);

  @override
  String toString() {
    return 'LockStatusState(power: $power, switchState: $switchState, lockTimeSeconds: $lockTimeSeconds)';
  }
}

/// @nodoc
abstract mixin class _$LockStatusStateCopyWith<$Res>
    implements $LockStatusStateCopyWith<$Res> {
  factory _$LockStatusStateCopyWith(
          _LockStatusState value, $Res Function(_LockStatusState) _then) =
      __$LockStatusStateCopyWithImpl;
  @override
  @useResult
  $Res call({int? power, TTLockSwitchState? switchState, int? lockTimeSeconds});
}

/// @nodoc
class __$LockStatusStateCopyWithImpl<$Res>
    implements _$LockStatusStateCopyWith<$Res> {
  __$LockStatusStateCopyWithImpl(this._self, this._then);

  final _LockStatusState _self;
  final $Res Function(_LockStatusState) _then;

  /// Create a copy of LockStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? power = freezed,
    Object? switchState = freezed,
    Object? lockTimeSeconds = freezed,
  }) {
    return _then(_LockStatusState(
      power: freezed == power
          ? _self.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      switchState: freezed == switchState
          ? _self.switchState
          : switchState // ignore: cast_nullable_to_non_nullable
              as TTLockSwitchState?,
      lockTimeSeconds: freezed == lockTimeSeconds
          ? _self.lockTimeSeconds
          : lockTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
