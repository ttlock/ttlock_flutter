import 'package:ttlock_flutter/ttlock.dart';

import 'lock_settings_snapshot.dart';
import 'lock_settings_state.dart';

Future<LockSettingsState> fetchLockSettingsFromDevice(
  TTLockApi api,
  String lockData,
) async {
  Future<bool?> config(TTLockConfig c) async {
    try {
      return await api.getLockConfig(c, lockData);
    } catch (_) {
      return null;
    }
  }

  Future<T?> tryLoad<T>(Future<T> Function() loader) async {
    try {
      return await loader();
    } catch (_) {
      return null;
    }
  }

  final autoLock = await tryLoad(() => api.getAutoLockingPeriodicTime(lockData));

  return LockSettingsState(
    audio: await config(TTLockConfig.audio) ?? false,
    passcodeVisible: await config(TTLockConfig.passcodeVisible) ?? false,
    freeze: await config(TTLockConfig.freeze) ?? false,
    tamperAlert: await config(TTLockConfig.tamperAlert) ?? false,
    passageModeAutoUnlock:
        await config(TTLockConfig.passageModeAutoUnlock) ?? false,
    wifiLockPowerSavingMode:
        await config(TTLockConfig.wifiLockPowerSavingMode) ?? false,
    doubleAuth: await config(TTLockConfig.doubleAuth) ?? false,
    publicMode: await config(TTLockConfig.publicMode) ?? false,
    lowBatteryAutoUnlock:
        await config(TTLockConfig.lowBatteryAutoUnlock) ?? false,
    privacyLock: await config(TTLockConfig.privacyLock) ?? false,
    resetButton: await config(TTLockConfig.resetButton) ?? false,
    remoteUnlock: await tryLoad(() => api.getRemoteUnlockSwitchState(lockData)) ??
        false,
    autoLockSeconds: autoLock?.currentTime ?? 0,
    autoLockMin: autoLock?.minTime ?? 5,
    autoLockMax: autoLock?.maxTime ?? 900,
    direction: await tryLoad(() => api.getLockDirection(lockData)),
    soundVolume: await tryLoad(() => api.getSoundVolume(lockData)),
  );
}

Future<LockSettingsSnapshot> fetchLockSettingsSnapshot(
  TTLockApi api,
  String lockData,
) async {
  final state = await fetchLockSettingsFromDevice(api, lockData);
  return LockSettingsSnapshot.fromState(state);
}
