import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../core/storage/lock_local_storage_provider.dart';
import '../../../providers/ttlock_providers.dart';
import 'lock_settings_fetch.dart';
import 'lock_settings_snapshot.dart';
import 'lock_settings_state.dart';

part 'lock_settings_provider.g.dart';

@riverpod
class LockSettings extends _$LockSettings {
  @override
  Future<LockSettingsState> build(String lockMac) async {
    final cache = await ref.watch(lockLocalCacheNotifierProvider(lockMac).future);
    if (cache.settings != null) {
      return cache.settings!.toState();
    }

    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return const LockSettingsState();
    return refreshSettingsFromLock();
  }

  Future<LockSettingsState> refreshSettingsFromLock() async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return const LockSettingsState();

    final api = ref.read(lockApiProvider);
    final snapshot = await fetchLockSettingsSnapshot(api, lock.lockData);
    final now = DateTime.now();

    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
          (c) => c.copyWith(settings: snapshot, settingsFetchedAt: now),
        );

    ref.invalidateSelf();
    return snapshot.toState();
  }

  Future<String> _lockData() async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) throw StateError('Lock not found');
    return lock.lockData;
  }

  Future<void> _patchSnapshot(
    LockSettingsSnapshot Function(LockSettingsSnapshot) update,
  ) async {
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch((c) {
      final current = c.settings ?? const LockSettingsSnapshot();
      return c.copyWith(settings: update(current));
    });
    ref.invalidateSelf();
  }

  Future<void> setConfig(TTLockConfig config, bool value) async {
    final data = await _lockData();
    await ref.read(lockApiProvider).setLockConfig(config, value, data);
    await _patchSnapshot((s) {
      switch (config) {
        case TTLockConfig.audio:
          return s.copyWith(audio: value);
        case TTLockConfig.passcodeVisible:
          return s.copyWith(passcodeVisible: value);
        case TTLockConfig.freeze:
          return s.copyWith(freeze: value);
        case TTLockConfig.tamperAlert:
          return s.copyWith(tamperAlert: value);
        case TTLockConfig.passageModeAutoUnlock:
          return s.copyWith(passageModeAutoUnlock: value);
        case TTLockConfig.wifiLockPowerSavingMode:
          return s.copyWith(wifiLockPowerSavingMode: value);
        case TTLockConfig.doubleAuth:
          return s.copyWith(doubleAuth: value);
        case TTLockConfig.publicMode:
          return s.copyWith(publicMode: value);
        case TTLockConfig.lowBatteryAutoUnlock:
          return s.copyWith(lowBatteryAutoUnlock: value);
        case TTLockConfig.privacyLock:
          return s.copyWith(privacyLock: value);
        case TTLockConfig.resetButton:
          return s.copyWith(resetButton: value);
      }
    });
  }

  Future<void> setRemoteUnlock(bool value) async {
    final data = await _lockData();
    await ref.read(lockApiProvider).setRemoteUnlockSwitchState(value, data);
    await _patchSnapshot((s) => s.copyWith(remoteUnlock: value));
  }

  Future<void> setAutoLock(int seconds) async {
    final data = await _lockData();
    await ref.read(lockApiProvider).setAutoLockingPeriodicTime(seconds, data);
    await _patchSnapshot((s) => s.copyWith(autoLockSeconds: seconds));
  }

  Future<void> setDirection(TTLockDirection direction) async {
    final data = await _lockData();
    await ref.read(lockApiProvider).setLockDirection(direction, data);
    await _patchSnapshot((s) => s.copyWith(direction: direction.name));
  }

  Future<void> setSoundVolume(TTSoundVolumeType volume) async {
    final data = await _lockData();
    await ref.read(lockApiProvider).setSoundVolume(volume, data);
    await _patchSnapshot((s) => s.copyWith(soundVolume: volume.name));
  }
}
