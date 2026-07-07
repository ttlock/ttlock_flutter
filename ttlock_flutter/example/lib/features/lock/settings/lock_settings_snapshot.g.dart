// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_settings_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LockSettingsSnapshot _$LockSettingsSnapshotFromJson(
        Map<String, dynamic> json) =>
    _LockSettingsSnapshot(
      audio: json['audio'] as bool? ?? false,
      passcodeVisible: json['passcode_visible'] as bool? ?? false,
      freeze: json['freeze'] as bool? ?? false,
      tamperAlert: json['tamper_alert'] as bool? ?? false,
      passageModeAutoUnlock: json['passage_mode_auto_unlock'] as bool? ?? false,
      wifiLockPowerSavingMode:
          json['wifi_lock_power_saving_mode'] as bool? ?? false,
      doubleAuth: json['double_auth'] as bool? ?? false,
      publicMode: json['public_mode'] as bool? ?? false,
      lowBatteryAutoUnlock: json['low_battery_auto_unlock'] as bool? ?? false,
      privacyLock: json['privacy_lock'] as bool? ?? false,
      resetButton: json['reset_button'] as bool? ?? false,
      securityM1Card: json['security_m1_card'] as bool? ?? false,
      semiAutomaticModeControl:
          json['semi_automatic_mode_control'] as bool? ?? false,
      lockSupervision: json['lock_supervision'] as bool? ?? false,
      remoteUnlock: json['remote_unlock'] as bool? ?? false,
      autoLockSeconds: (json['auto_lock_seconds'] as num?)?.toInt() ?? 0,
      autoLockMin: (json['auto_lock_min'] as num?)?.toInt() ?? 5,
      autoLockMax: (json['auto_lock_max'] as num?)?.toInt() ?? 900,
      direction: json['direction'] as String?,
      soundVolume: json['sound_volume'] as String?,
    );

Map<String, dynamic> _$LockSettingsSnapshotToJson(
        _LockSettingsSnapshot instance) =>
    <String, dynamic>{
      'audio': instance.audio,
      'passcode_visible': instance.passcodeVisible,
      'freeze': instance.freeze,
      'tamper_alert': instance.tamperAlert,
      'passage_mode_auto_unlock': instance.passageModeAutoUnlock,
      'wifi_lock_power_saving_mode': instance.wifiLockPowerSavingMode,
      'double_auth': instance.doubleAuth,
      'public_mode': instance.publicMode,
      'low_battery_auto_unlock': instance.lowBatteryAutoUnlock,
      'privacy_lock': instance.privacyLock,
      'reset_button': instance.resetButton,
      'security_m1_card': instance.securityM1Card,
      'semi_automatic_mode_control': instance.semiAutomaticModeControl,
      'lock_supervision': instance.lockSupervision,
      'remote_unlock': instance.remoteUnlock,
      'auto_lock_seconds': instance.autoLockSeconds,
      'auto_lock_min': instance.autoLockMin,
      'auto_lock_max': instance.autoLockMax,
      'direction': instance.direction,
      'sound_volume': instance.soundVolume,
    };
