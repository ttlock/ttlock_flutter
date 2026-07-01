import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../features/lock/model/cached_credentials.dart';
import '../../features/lock/settings/lock_settings_snapshot.dart';

part 'lock_local_cache.freezed.dart';
part 'lock_local_cache.g.dart';

@freezed
abstract class LockLocalCache with _$LockLocalCache {
  const factory LockLocalCache({
    List<String>? supportedFunctions,
    DateTime? capabilitiesProbedAt,
    LockSettingsSnapshot? settings,
    DateTime? settingsFetchedAt,
    List<CachedPasscode>? passcodes,
    List<CachedCard>? cards,
    List<CachedFingerprint>? fingerprints,
    List<CachedFace>? faces,
    @Default([]) List<CachedPalmVein> palmVeins,
    DateTime? credentialsFetchedAt,
  }) = _LockLocalCache;

  factory LockLocalCache.fromJson(Map<String, dynamic> json) =>
      _$LockLocalCacheFromJson(json);

  const LockLocalCache._();

  Set<TTLockFunction> get capabilitiesSet {
    final list = supportedFunctions;
    if (list == null || list.isEmpty) return {};
    return list.map(TTLockFunction.values.byName).toSet();
  }

  bool supports(TTLockFunction f) => capabilitiesSet.contains(f);
}

extension LockCapabilitiesX on Set<TTLockFunction> {
  bool has(TTLockFunction f) => contains(f);
}
