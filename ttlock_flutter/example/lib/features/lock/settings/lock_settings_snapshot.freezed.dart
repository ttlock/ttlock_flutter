// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lock_settings_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LockSettingsSnapshot {
  bool get audio;
  bool get passcodeVisible;
  bool get freeze;
  bool get tamperAlert;
  bool get passageModeAutoUnlock;
  bool get wifiLockPowerSavingMode;
  bool get doubleAuth;
  bool get publicMode;
  bool get lowBatteryAutoUnlock;
  bool get privacyLock;
  bool get resetButton;
  bool get securityM1Card;
  bool get semiAutomaticModeControl;
  bool get lockSupervision;
  bool get remoteUnlock;
  int get autoLockSeconds;
  int get autoLockMin;
  int get autoLockMax;
  String? get direction;
  String? get soundVolume;

  /// Create a copy of LockSettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LockSettingsSnapshotCopyWith<LockSettingsSnapshot> get copyWith =>
      _$LockSettingsSnapshotCopyWithImpl<LockSettingsSnapshot>(
          this as LockSettingsSnapshot, _$identity);

  /// Serializes this LockSettingsSnapshot to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LockSettingsSnapshot &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.passcodeVisible, passcodeVisible) ||
                other.passcodeVisible == passcodeVisible) &&
            (identical(other.freeze, freeze) || other.freeze == freeze) &&
            (identical(other.tamperAlert, tamperAlert) ||
                other.tamperAlert == tamperAlert) &&
            (identical(other.passageModeAutoUnlock, passageModeAutoUnlock) ||
                other.passageModeAutoUnlock == passageModeAutoUnlock) &&
            (identical(
                    other.wifiLockPowerSavingMode, wifiLockPowerSavingMode) ||
                other.wifiLockPowerSavingMode == wifiLockPowerSavingMode) &&
            (identical(other.doubleAuth, doubleAuth) ||
                other.doubleAuth == doubleAuth) &&
            (identical(other.publicMode, publicMode) ||
                other.publicMode == publicMode) &&
            (identical(other.lowBatteryAutoUnlock, lowBatteryAutoUnlock) ||
                other.lowBatteryAutoUnlock == lowBatteryAutoUnlock) &&
            (identical(other.privacyLock, privacyLock) ||
                other.privacyLock == privacyLock) &&
            (identical(other.resetButton, resetButton) ||
                other.resetButton == resetButton) &&
            (identical(other.securityM1Card, securityM1Card) ||
                other.securityM1Card == securityM1Card) &&
            (identical(
                    other.semiAutomaticModeControl, semiAutomaticModeControl) ||
                other.semiAutomaticModeControl == semiAutomaticModeControl) &&
            (identical(other.lockSupervision, lockSupervision) ||
                other.lockSupervision == lockSupervision) &&
            (identical(other.remoteUnlock, remoteUnlock) ||
                other.remoteUnlock == remoteUnlock) &&
            (identical(other.autoLockSeconds, autoLockSeconds) ||
                other.autoLockSeconds == autoLockSeconds) &&
            (identical(other.autoLockMin, autoLockMin) ||
                other.autoLockMin == autoLockMin) &&
            (identical(other.autoLockMax, autoLockMax) ||
                other.autoLockMax == autoLockMax) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.soundVolume, soundVolume) ||
                other.soundVolume == soundVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        audio,
        passcodeVisible,
        freeze,
        tamperAlert,
        passageModeAutoUnlock,
        wifiLockPowerSavingMode,
        doubleAuth,
        publicMode,
        lowBatteryAutoUnlock,
        privacyLock,
        resetButton,
        securityM1Card,
        semiAutomaticModeControl,
        lockSupervision,
        remoteUnlock,
        autoLockSeconds,
        autoLockMin,
        autoLockMax,
        direction,
        soundVolume
      ]);

  @override
  String toString() {
    return 'LockSettingsSnapshot(audio: $audio, passcodeVisible: $passcodeVisible, freeze: $freeze, tamperAlert: $tamperAlert, passageModeAutoUnlock: $passageModeAutoUnlock, wifiLockPowerSavingMode: $wifiLockPowerSavingMode, doubleAuth: $doubleAuth, publicMode: $publicMode, lowBatteryAutoUnlock: $lowBatteryAutoUnlock, privacyLock: $privacyLock, resetButton: $resetButton, securityM1Card: $securityM1Card, semiAutomaticModeControl: $semiAutomaticModeControl, lockSupervision: $lockSupervision, remoteUnlock: $remoteUnlock, autoLockSeconds: $autoLockSeconds, autoLockMin: $autoLockMin, autoLockMax: $autoLockMax, direction: $direction, soundVolume: $soundVolume)';
  }
}

/// @nodoc
abstract mixin class $LockSettingsSnapshotCopyWith<$Res> {
  factory $LockSettingsSnapshotCopyWith(LockSettingsSnapshot value,
          $Res Function(LockSettingsSnapshot) _then) =
      _$LockSettingsSnapshotCopyWithImpl;
  @useResult
  $Res call(
      {bool audio,
      bool passcodeVisible,
      bool freeze,
      bool tamperAlert,
      bool passageModeAutoUnlock,
      bool wifiLockPowerSavingMode,
      bool doubleAuth,
      bool publicMode,
      bool lowBatteryAutoUnlock,
      bool privacyLock,
      bool resetButton,
      bool securityM1Card,
      bool semiAutomaticModeControl,
      bool lockSupervision,
      bool remoteUnlock,
      int autoLockSeconds,
      int autoLockMin,
      int autoLockMax,
      String? direction,
      String? soundVolume});
}

/// @nodoc
class _$LockSettingsSnapshotCopyWithImpl<$Res>
    implements $LockSettingsSnapshotCopyWith<$Res> {
  _$LockSettingsSnapshotCopyWithImpl(this._self, this._then);

  final LockSettingsSnapshot _self;
  final $Res Function(LockSettingsSnapshot) _then;

  /// Create a copy of LockSettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = null,
    Object? passcodeVisible = null,
    Object? freeze = null,
    Object? tamperAlert = null,
    Object? passageModeAutoUnlock = null,
    Object? wifiLockPowerSavingMode = null,
    Object? doubleAuth = null,
    Object? publicMode = null,
    Object? lowBatteryAutoUnlock = null,
    Object? privacyLock = null,
    Object? resetButton = null,
    Object? securityM1Card = null,
    Object? semiAutomaticModeControl = null,
    Object? lockSupervision = null,
    Object? remoteUnlock = null,
    Object? autoLockSeconds = null,
    Object? autoLockMin = null,
    Object? autoLockMax = null,
    Object? direction = freezed,
    Object? soundVolume = freezed,
  }) {
    return _then(_self.copyWith(
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as bool,
      passcodeVisible: null == passcodeVisible
          ? _self.passcodeVisible
          : passcodeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      freeze: null == freeze
          ? _self.freeze
          : freeze // ignore: cast_nullable_to_non_nullable
              as bool,
      tamperAlert: null == tamperAlert
          ? _self.tamperAlert
          : tamperAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      passageModeAutoUnlock: null == passageModeAutoUnlock
          ? _self.passageModeAutoUnlock
          : passageModeAutoUnlock // ignore: cast_nullable_to_non_nullable
              as bool,
      wifiLockPowerSavingMode: null == wifiLockPowerSavingMode
          ? _self.wifiLockPowerSavingMode
          : wifiLockPowerSavingMode // ignore: cast_nullable_to_non_nullable
              as bool,
      doubleAuth: null == doubleAuth
          ? _self.doubleAuth
          : doubleAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      publicMode: null == publicMode
          ? _self.publicMode
          : publicMode // ignore: cast_nullable_to_non_nullable
              as bool,
      lowBatteryAutoUnlock: null == lowBatteryAutoUnlock
          ? _self.lowBatteryAutoUnlock
          : lowBatteryAutoUnlock // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyLock: null == privacyLock
          ? _self.privacyLock
          : privacyLock // ignore: cast_nullable_to_non_nullable
              as bool,
      resetButton: null == resetButton
          ? _self.resetButton
          : resetButton // ignore: cast_nullable_to_non_nullable
              as bool,
      securityM1Card: null == securityM1Card
          ? _self.securityM1Card
          : securityM1Card // ignore: cast_nullable_to_non_nullable
              as bool,
      semiAutomaticModeControl: null == semiAutomaticModeControl
          ? _self.semiAutomaticModeControl
          : semiAutomaticModeControl // ignore: cast_nullable_to_non_nullable
              as bool,
      lockSupervision: null == lockSupervision
          ? _self.lockSupervision
          : lockSupervision // ignore: cast_nullable_to_non_nullable
              as bool,
      remoteUnlock: null == remoteUnlock
          ? _self.remoteUnlock
          : remoteUnlock // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLockSeconds: null == autoLockSeconds
          ? _self.autoLockSeconds
          : autoLockSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      autoLockMin: null == autoLockMin
          ? _self.autoLockMin
          : autoLockMin // ignore: cast_nullable_to_non_nullable
              as int,
      autoLockMax: null == autoLockMax
          ? _self.autoLockMax
          : autoLockMax // ignore: cast_nullable_to_non_nullable
              as int,
      direction: freezed == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      soundVolume: freezed == soundVolume
          ? _self.soundVolume
          : soundVolume // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LockSettingsSnapshot extends LockSettingsSnapshot {
  const _LockSettingsSnapshot(
      {this.audio = false,
      this.passcodeVisible = false,
      this.freeze = false,
      this.tamperAlert = false,
      this.passageModeAutoUnlock = false,
      this.wifiLockPowerSavingMode = false,
      this.doubleAuth = false,
      this.publicMode = false,
      this.lowBatteryAutoUnlock = false,
      this.privacyLock = false,
      this.resetButton = false,
      this.securityM1Card = false,
      this.semiAutomaticModeControl = false,
      this.lockSupervision = false,
      this.remoteUnlock = false,
      this.autoLockSeconds = 0,
      this.autoLockMin = 5,
      this.autoLockMax = 900,
      this.direction,
      this.soundVolume})
      : super._();
  factory _LockSettingsSnapshot.fromJson(Map<String, dynamic> json) =>
      _$LockSettingsSnapshotFromJson(json);

  @override
  @JsonKey()
  final bool audio;
  @override
  @JsonKey()
  final bool passcodeVisible;
  @override
  @JsonKey()
  final bool freeze;
  @override
  @JsonKey()
  final bool tamperAlert;
  @override
  @JsonKey()
  final bool passageModeAutoUnlock;
  @override
  @JsonKey()
  final bool wifiLockPowerSavingMode;
  @override
  @JsonKey()
  final bool doubleAuth;
  @override
  @JsonKey()
  final bool publicMode;
  @override
  @JsonKey()
  final bool lowBatteryAutoUnlock;
  @override
  @JsonKey()
  final bool privacyLock;
  @override
  @JsonKey()
  final bool resetButton;
  @override
  @JsonKey()
  final bool securityM1Card;
  @override
  @JsonKey()
  final bool semiAutomaticModeControl;
  @override
  @JsonKey()
  final bool lockSupervision;
  @override
  @JsonKey()
  final bool remoteUnlock;
  @override
  @JsonKey()
  final int autoLockSeconds;
  @override
  @JsonKey()
  final int autoLockMin;
  @override
  @JsonKey()
  final int autoLockMax;
  @override
  final String? direction;
  @override
  final String? soundVolume;

  /// Create a copy of LockSettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LockSettingsSnapshotCopyWith<_LockSettingsSnapshot> get copyWith =>
      __$LockSettingsSnapshotCopyWithImpl<_LockSettingsSnapshot>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LockSettingsSnapshotToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LockSettingsSnapshot &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.passcodeVisible, passcodeVisible) ||
                other.passcodeVisible == passcodeVisible) &&
            (identical(other.freeze, freeze) || other.freeze == freeze) &&
            (identical(other.tamperAlert, tamperAlert) ||
                other.tamperAlert == tamperAlert) &&
            (identical(other.passageModeAutoUnlock, passageModeAutoUnlock) ||
                other.passageModeAutoUnlock == passageModeAutoUnlock) &&
            (identical(
                    other.wifiLockPowerSavingMode, wifiLockPowerSavingMode) ||
                other.wifiLockPowerSavingMode == wifiLockPowerSavingMode) &&
            (identical(other.doubleAuth, doubleAuth) ||
                other.doubleAuth == doubleAuth) &&
            (identical(other.publicMode, publicMode) ||
                other.publicMode == publicMode) &&
            (identical(other.lowBatteryAutoUnlock, lowBatteryAutoUnlock) ||
                other.lowBatteryAutoUnlock == lowBatteryAutoUnlock) &&
            (identical(other.privacyLock, privacyLock) ||
                other.privacyLock == privacyLock) &&
            (identical(other.resetButton, resetButton) ||
                other.resetButton == resetButton) &&
            (identical(other.securityM1Card, securityM1Card) ||
                other.securityM1Card == securityM1Card) &&
            (identical(
                    other.semiAutomaticModeControl, semiAutomaticModeControl) ||
                other.semiAutomaticModeControl == semiAutomaticModeControl) &&
            (identical(other.lockSupervision, lockSupervision) ||
                other.lockSupervision == lockSupervision) &&
            (identical(other.remoteUnlock, remoteUnlock) ||
                other.remoteUnlock == remoteUnlock) &&
            (identical(other.autoLockSeconds, autoLockSeconds) ||
                other.autoLockSeconds == autoLockSeconds) &&
            (identical(other.autoLockMin, autoLockMin) ||
                other.autoLockMin == autoLockMin) &&
            (identical(other.autoLockMax, autoLockMax) ||
                other.autoLockMax == autoLockMax) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.soundVolume, soundVolume) ||
                other.soundVolume == soundVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        audio,
        passcodeVisible,
        freeze,
        tamperAlert,
        passageModeAutoUnlock,
        wifiLockPowerSavingMode,
        doubleAuth,
        publicMode,
        lowBatteryAutoUnlock,
        privacyLock,
        resetButton,
        securityM1Card,
        semiAutomaticModeControl,
        lockSupervision,
        remoteUnlock,
        autoLockSeconds,
        autoLockMin,
        autoLockMax,
        direction,
        soundVolume
      ]);

  @override
  String toString() {
    return 'LockSettingsSnapshot(audio: $audio, passcodeVisible: $passcodeVisible, freeze: $freeze, tamperAlert: $tamperAlert, passageModeAutoUnlock: $passageModeAutoUnlock, wifiLockPowerSavingMode: $wifiLockPowerSavingMode, doubleAuth: $doubleAuth, publicMode: $publicMode, lowBatteryAutoUnlock: $lowBatteryAutoUnlock, privacyLock: $privacyLock, resetButton: $resetButton, securityM1Card: $securityM1Card, semiAutomaticModeControl: $semiAutomaticModeControl, lockSupervision: $lockSupervision, remoteUnlock: $remoteUnlock, autoLockSeconds: $autoLockSeconds, autoLockMin: $autoLockMin, autoLockMax: $autoLockMax, direction: $direction, soundVolume: $soundVolume)';
  }
}

/// @nodoc
abstract mixin class _$LockSettingsSnapshotCopyWith<$Res>
    implements $LockSettingsSnapshotCopyWith<$Res> {
  factory _$LockSettingsSnapshotCopyWith(_LockSettingsSnapshot value,
          $Res Function(_LockSettingsSnapshot) _then) =
      __$LockSettingsSnapshotCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool audio,
      bool passcodeVisible,
      bool freeze,
      bool tamperAlert,
      bool passageModeAutoUnlock,
      bool wifiLockPowerSavingMode,
      bool doubleAuth,
      bool publicMode,
      bool lowBatteryAutoUnlock,
      bool privacyLock,
      bool resetButton,
      bool securityM1Card,
      bool semiAutomaticModeControl,
      bool lockSupervision,
      bool remoteUnlock,
      int autoLockSeconds,
      int autoLockMin,
      int autoLockMax,
      String? direction,
      String? soundVolume});
}

/// @nodoc
class __$LockSettingsSnapshotCopyWithImpl<$Res>
    implements _$LockSettingsSnapshotCopyWith<$Res> {
  __$LockSettingsSnapshotCopyWithImpl(this._self, this._then);

  final _LockSettingsSnapshot _self;
  final $Res Function(_LockSettingsSnapshot) _then;

  /// Create a copy of LockSettingsSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? audio = null,
    Object? passcodeVisible = null,
    Object? freeze = null,
    Object? tamperAlert = null,
    Object? passageModeAutoUnlock = null,
    Object? wifiLockPowerSavingMode = null,
    Object? doubleAuth = null,
    Object? publicMode = null,
    Object? lowBatteryAutoUnlock = null,
    Object? privacyLock = null,
    Object? resetButton = null,
    Object? securityM1Card = null,
    Object? semiAutomaticModeControl = null,
    Object? lockSupervision = null,
    Object? remoteUnlock = null,
    Object? autoLockSeconds = null,
    Object? autoLockMin = null,
    Object? autoLockMax = null,
    Object? direction = freezed,
    Object? soundVolume = freezed,
  }) {
    return _then(_LockSettingsSnapshot(
      audio: null == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as bool,
      passcodeVisible: null == passcodeVisible
          ? _self.passcodeVisible
          : passcodeVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      freeze: null == freeze
          ? _self.freeze
          : freeze // ignore: cast_nullable_to_non_nullable
              as bool,
      tamperAlert: null == tamperAlert
          ? _self.tamperAlert
          : tamperAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      passageModeAutoUnlock: null == passageModeAutoUnlock
          ? _self.passageModeAutoUnlock
          : passageModeAutoUnlock // ignore: cast_nullable_to_non_nullable
              as bool,
      wifiLockPowerSavingMode: null == wifiLockPowerSavingMode
          ? _self.wifiLockPowerSavingMode
          : wifiLockPowerSavingMode // ignore: cast_nullable_to_non_nullable
              as bool,
      doubleAuth: null == doubleAuth
          ? _self.doubleAuth
          : doubleAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      publicMode: null == publicMode
          ? _self.publicMode
          : publicMode // ignore: cast_nullable_to_non_nullable
              as bool,
      lowBatteryAutoUnlock: null == lowBatteryAutoUnlock
          ? _self.lowBatteryAutoUnlock
          : lowBatteryAutoUnlock // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyLock: null == privacyLock
          ? _self.privacyLock
          : privacyLock // ignore: cast_nullable_to_non_nullable
              as bool,
      resetButton: null == resetButton
          ? _self.resetButton
          : resetButton // ignore: cast_nullable_to_non_nullable
              as bool,
      securityM1Card: null == securityM1Card
          ? _self.securityM1Card
          : securityM1Card // ignore: cast_nullable_to_non_nullable
              as bool,
      semiAutomaticModeControl: null == semiAutomaticModeControl
          ? _self.semiAutomaticModeControl
          : semiAutomaticModeControl // ignore: cast_nullable_to_non_nullable
              as bool,
      lockSupervision: null == lockSupervision
          ? _self.lockSupervision
          : lockSupervision // ignore: cast_nullable_to_non_nullable
              as bool,
      remoteUnlock: null == remoteUnlock
          ? _self.remoteUnlock
          : remoteUnlock // ignore: cast_nullable_to_non_nullable
              as bool,
      autoLockSeconds: null == autoLockSeconds
          ? _self.autoLockSeconds
          : autoLockSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      autoLockMin: null == autoLockMin
          ? _self.autoLockMin
          : autoLockMin // ignore: cast_nullable_to_non_nullable
              as int,
      autoLockMax: null == autoLockMax
          ? _self.autoLockMax
          : autoLockMax // ignore: cast_nullable_to_non_nullable
              as int,
      direction: freezed == direction
          ? _self.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      soundVolume: freezed == soundVolume
          ? _self.soundVolume
          : soundVolume // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
