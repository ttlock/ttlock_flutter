import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import 'lock_settings_state.dart';

part 'lock_settings_snapshot.freezed.dart';
part 'lock_settings_snapshot.g.dart';

@freezed
abstract class LockSettingsSnapshot with _$LockSettingsSnapshot {
  const factory LockSettingsSnapshot({
    @Default(false) bool audio,
    @Default(false) bool passcodeVisible,
    @Default(false) bool freeze,
    @Default(false) bool tamperAlert,
    @Default(false) bool passageModeAutoUnlock,
    @Default(false) bool wifiLockPowerSavingMode,
    @Default(false) bool doubleAuth,
    @Default(false) bool publicMode,
    @Default(false) bool lowBatteryAutoUnlock,
    @Default(false) bool privacyLock,
    @Default(false) bool resetButton,
    @Default(false) bool securityM1Card,
    @Default(false) bool semiAutomaticModeControl,
    @Default(false) bool lockSupervision,
    @Default(false) bool remoteUnlock,
    @Default(0) int autoLockSeconds,
    @Default(5) int autoLockMin,
    @Default(900) int autoLockMax,
    String? direction,
    String? soundVolume,
  }) = _LockSettingsSnapshot;

  factory LockSettingsSnapshot.fromJson(Map<String, dynamic> json) =>
      _$LockSettingsSnapshotFromJson(json);

  const LockSettingsSnapshot._();

  LockSettingsState toState() => LockSettingsState(
        audio: audio,
        passcodeVisible: passcodeVisible,
        freeze: freeze,
        tamperAlert: tamperAlert,
        passageModeAutoUnlock: passageModeAutoUnlock,
        wifiLockPowerSavingMode: wifiLockPowerSavingMode,
        doubleAuth: doubleAuth,
        publicMode: publicMode,
        lowBatteryAutoUnlock: lowBatteryAutoUnlock,
        privacyLock: privacyLock,
        resetButton: resetButton,
        securityM1Card: securityM1Card,
        semiAutomaticModeControl: semiAutomaticModeControl,
        lockSupervision: lockSupervision,
        remoteUnlock: remoteUnlock,
        autoLockSeconds: autoLockSeconds,
        autoLockMin: autoLockMin,
        autoLockMax: autoLockMax,
        direction: direction == null
            ? null
            : TTLockDirection.values.byName(direction!),
        soundVolume: soundVolume == null
            ? null
            : TTSoundVolumeType.values.byName(soundVolume!),
      );

  static LockSettingsSnapshot fromState(LockSettingsState s) =>
      LockSettingsSnapshot(
        audio: s.audio,
        passcodeVisible: s.passcodeVisible,
        freeze: s.freeze,
        tamperAlert: s.tamperAlert,
        passageModeAutoUnlock: s.passageModeAutoUnlock,
        wifiLockPowerSavingMode: s.wifiLockPowerSavingMode,
        doubleAuth: s.doubleAuth,
        publicMode: s.publicMode,
        lowBatteryAutoUnlock: s.lowBatteryAutoUnlock,
        privacyLock: s.privacyLock,
        resetButton: s.resetButton,
        securityM1Card: s.securityM1Card,
        semiAutomaticModeControl: s.semiAutomaticModeControl,
        lockSupervision: s.lockSupervision,
        remoteUnlock: s.remoteUnlock,
        autoLockSeconds: s.autoLockSeconds,
        autoLockMin: s.autoLockMin,
        autoLockMax: s.autoLockMax,
        direction: s.direction?.name,
        soundVolume: s.soundVolume?.name,
      );
}
