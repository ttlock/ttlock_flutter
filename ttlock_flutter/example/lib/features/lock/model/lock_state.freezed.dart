// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LockState {
  String? get lockData;
  String? get lockMac;
  String? get lockName;
  bool get isConnected;
  bool get isLoading;
  String? get errorMessage;
  String get lastResult;

  /// Create a copy of LockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LockStateCopyWith<LockState> get copyWith =>
      _$LockStateCopyWithImpl<LockState>(this as LockState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LockState &&
            (identical(other.lockData, lockData) ||
                other.lockData == lockData) &&
            (identical(other.lockMac, lockMac) || other.lockMac == lockMac) &&
            (identical(other.lockName, lockName) ||
                other.lockName == lockName) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.lastResult, lastResult) ||
                other.lastResult == lastResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lockData, lockMac, lockName,
      isConnected, isLoading, errorMessage, lastResult);

  @override
  String toString() {
    return 'LockState(lockData: $lockData, lockMac: $lockMac, lockName: $lockName, isConnected: $isConnected, isLoading: $isLoading, errorMessage: $errorMessage, lastResult: $lastResult)';
  }
}

/// @nodoc
abstract mixin class $LockStateCopyWith<$Res> {
  factory $LockStateCopyWith(LockState value, $Res Function(LockState) _then) =
      _$LockStateCopyWithImpl;
  @useResult
  $Res call(
      {String? lockData,
      String? lockMac,
      String? lockName,
      bool isConnected,
      bool isLoading,
      String? errorMessage,
      String lastResult});
}

/// @nodoc
class _$LockStateCopyWithImpl<$Res> implements $LockStateCopyWith<$Res> {
  _$LockStateCopyWithImpl(this._self, this._then);

  final LockState _self;
  final $Res Function(LockState) _then;

  /// Create a copy of LockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lockData = freezed,
    Object? lockMac = freezed,
    Object? lockName = freezed,
    Object? isConnected = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? lastResult = null,
  }) {
    return _then(_self.copyWith(
      lockData: freezed == lockData
          ? _self.lockData
          : lockData // ignore: cast_nullable_to_non_nullable
              as String?,
      lockMac: freezed == lockMac
          ? _self.lockMac
          : lockMac // ignore: cast_nullable_to_non_nullable
              as String?,
      lockName: freezed == lockName
          ? _self.lockName
          : lockName // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastResult: null == lastResult
          ? _self.lastResult
          : lastResult // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LockState implements LockState {
  const _LockState(
      {this.lockData,
      this.lockMac,
      this.lockName,
      this.isConnected = false,
      this.isLoading = false,
      this.errorMessage,
      this.lastResult = ''});

  @override
  final String? lockData;
  @override
  final String? lockMac;
  @override
  final String? lockName;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final String lastResult;

  /// Create a copy of LockState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LockStateCopyWith<_LockState> get copyWith =>
      __$LockStateCopyWithImpl<_LockState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LockState &&
            (identical(other.lockData, lockData) ||
                other.lockData == lockData) &&
            (identical(other.lockMac, lockMac) || other.lockMac == lockMac) &&
            (identical(other.lockName, lockName) ||
                other.lockName == lockName) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.lastResult, lastResult) ||
                other.lastResult == lastResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lockData, lockMac, lockName,
      isConnected, isLoading, errorMessage, lastResult);

  @override
  String toString() {
    return 'LockState(lockData: $lockData, lockMac: $lockMac, lockName: $lockName, isConnected: $isConnected, isLoading: $isLoading, errorMessage: $errorMessage, lastResult: $lastResult)';
  }
}

/// @nodoc
abstract mixin class _$LockStateCopyWith<$Res>
    implements $LockStateCopyWith<$Res> {
  factory _$LockStateCopyWith(
          _LockState value, $Res Function(_LockState) _then) =
      __$LockStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? lockData,
      String? lockMac,
      String? lockName,
      bool isConnected,
      bool isLoading,
      String? errorMessage,
      String lastResult});
}

/// @nodoc
class __$LockStateCopyWithImpl<$Res> implements _$LockStateCopyWith<$Res> {
  __$LockStateCopyWithImpl(this._self, this._then);

  final _LockState _self;
  final $Res Function(_LockState) _then;

  /// Create a copy of LockState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lockData = freezed,
    Object? lockMac = freezed,
    Object? lockName = freezed,
    Object? isConnected = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? lastResult = null,
  }) {
    return _then(_LockState(
      lockData: freezed == lockData
          ? _self.lockData
          : lockData // ignore: cast_nullable_to_non_nullable
              as String?,
      lockMac: freezed == lockMac
          ? _self.lockMac
          : lockMac // ignore: cast_nullable_to_non_nullable
              as String?,
      lockName: freezed == lockName
          ? _self.lockName
          : lockName // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastResult: null == lastResult
          ? _self.lastResult
          : lastResult // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
