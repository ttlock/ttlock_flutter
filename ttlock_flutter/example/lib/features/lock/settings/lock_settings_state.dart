import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

part 'lock_settings_state.freezed.dart';

@freezed
abstract class LockSettingsState with _$LockSettingsState {
  const factory LockSettingsState({
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
    TTLockDirection? direction,
    TTSoundVolumeType? soundVolume,
  }) = _LockSettingsState;
}
