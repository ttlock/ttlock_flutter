import 'package:ttlock_flutter/ttlock.dart';

import '../../core/storage/lock_local_cache.dart';
import '../../core/storage/lock_local_storage.dart';
import 'capabilities/lock_capabilities_probe.dart';
import 'model/cached_credentials.dart';
import 'settings/lock_settings_fetch.dart';

final lockLocalStorage = LockLocalStorage();

/// Fills [LockLocalCache] after init or on first lazy load.
Future<LockLocalCache> initializeLockLocalCache({
  required TTLockApi api,
  required String lockMac,
  required String lockData,
  bool fetchCredentials = true,
}) async {
  final capabilities = await probeLockCapabilities(api, lockData);
  final settings = await fetchLockSettingsSnapshot(api, lockData);
  final now = DateTime.now();

  List<CachedPasscode>? passcodes;
  List<CachedCard>? cards;
  List<CachedFingerprint>? fingerprints;

  if (fetchCredentials) {
    if (capabilities.contains(TTLockFunction.passcode) ||
        capabilities.contains(TTLockFunction.managePasscode)) {
      try {
        passcodes = (await api.getAllValidPasscodes(lockData))
            .map(CachedPasscode.fromModel)
            .toList();
      } catch (_) {}
    }
    if (capabilities.contains(TTLockFunction.icCard)) {
      try {
        cards = (await api.getAllValidCards(lockData))
            .map(CachedCard.fromModel)
            .toList();
      } catch (_) {}
    }
    if (capabilities.contains(TTLockFunction.fingerprint)) {
      try {
        fingerprints = (await api.getAllValidFingerprints(lockData))
            .map(CachedFingerprint.fromModel)
            .toList();
      } catch (_) {}
    }
  }

  final cache = LockLocalCache(
    supportedFunctions: capabilitiesToJson(capabilities),
    capabilitiesProbedAt: now,
    settings: settings,
    settingsFetchedAt: now,
    passcodes: passcodes,
    cards: cards,
    fingerprints: fingerprints,
    faces: const [],
    credentialsFetchedAt:
        passcodes != null || cards != null || fingerprints != null ? now : null,
  );

  await lockLocalStorage.save(lockMac, cache);
  return cache;
}
