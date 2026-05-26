// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gateway_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GatewayState {
  String? get mac;
  bool get isConnected;
  bool get isLoading;
  String? get wifiSsid;
  String? get errorMessage;
  String get lastResult;

  /// Create a copy of GatewayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GatewayStateCopyWith<GatewayState> get copyWith =>
      _$GatewayStateCopyWithImpl<GatewayState>(
          this as GatewayState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GatewayState &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.wifiSsid, wifiSsid) ||
                other.wifiSsid == wifiSsid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.lastResult, lastResult) ||
                other.lastResult == lastResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mac, isConnected, isLoading,
      wifiSsid, errorMessage, lastResult);

  @override
  String toString() {
    return 'GatewayState(mac: $mac, isConnected: $isConnected, isLoading: $isLoading, wifiSsid: $wifiSsid, errorMessage: $errorMessage, lastResult: $lastResult)';
  }
}

/// @nodoc
abstract mixin class $GatewayStateCopyWith<$Res> {
  factory $GatewayStateCopyWith(
          GatewayState value, $Res Function(GatewayState) _then) =
      _$GatewayStateCopyWithImpl;
  @useResult
  $Res call(
      {String? mac,
      bool isConnected,
      bool isLoading,
      String? wifiSsid,
      String? errorMessage,
      String lastResult});
}

/// @nodoc
class _$GatewayStateCopyWithImpl<$Res> implements $GatewayStateCopyWith<$Res> {
  _$GatewayStateCopyWithImpl(this._self, this._then);

  final GatewayState _self;
  final $Res Function(GatewayState) _then;

  /// Create a copy of GatewayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mac = freezed,
    Object? isConnected = null,
    Object? isLoading = null,
    Object? wifiSsid = freezed,
    Object? errorMessage = freezed,
    Object? lastResult = null,
  }) {
    return _then(_self.copyWith(
      mac: freezed == mac
          ? _self.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wifiSsid: freezed == wifiSsid
          ? _self.wifiSsid
          : wifiSsid // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _GatewayState implements GatewayState {
  const _GatewayState(
      {this.mac,
      this.isConnected = false,
      this.isLoading = false,
      this.wifiSsid,
      this.errorMessage,
      this.lastResult = ''});

  @override
  final String? mac;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? wifiSsid;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final String lastResult;

  /// Create a copy of GatewayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GatewayStateCopyWith<_GatewayState> get copyWith =>
      __$GatewayStateCopyWithImpl<_GatewayState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GatewayState &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.wifiSsid, wifiSsid) ||
                other.wifiSsid == wifiSsid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.lastResult, lastResult) ||
                other.lastResult == lastResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mac, isConnected, isLoading,
      wifiSsid, errorMessage, lastResult);

  @override
  String toString() {
    return 'GatewayState(mac: $mac, isConnected: $isConnected, isLoading: $isLoading, wifiSsid: $wifiSsid, errorMessage: $errorMessage, lastResult: $lastResult)';
  }
}

/// @nodoc
abstract mixin class _$GatewayStateCopyWith<$Res>
    implements $GatewayStateCopyWith<$Res> {
  factory _$GatewayStateCopyWith(
          _GatewayState value, $Res Function(_GatewayState) _then) =
      __$GatewayStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? mac,
      bool isConnected,
      bool isLoading,
      String? wifiSsid,
      String? errorMessage,
      String lastResult});
}

/// @nodoc
class __$GatewayStateCopyWithImpl<$Res>
    implements _$GatewayStateCopyWith<$Res> {
  __$GatewayStateCopyWithImpl(this._self, this._then);

  final _GatewayState _self;
  final $Res Function(_GatewayState) _then;

  /// Create a copy of GatewayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mac = freezed,
    Object? isConnected = null,
    Object? isLoading = null,
    Object? wifiSsid = freezed,
    Object? errorMessage = freezed,
    Object? lastResult = null,
  }) {
    return _then(_GatewayState(
      mac: freezed == mac
          ? _self.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String?,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wifiSsid: freezed == wifiSsid
          ? _self.wifiSsid
          : wifiSsid // ignore: cast_nullable_to_non_nullable
              as String?,
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
