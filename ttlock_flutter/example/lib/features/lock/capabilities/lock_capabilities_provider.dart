import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../core/storage/lock_local_storage_provider.dart';
import 'lock_capabilities_probe.dart';

part 'lock_capabilities_provider.g.dart';

@riverpod
class LockCapabilities extends _$LockCapabilities {
  @override
  Future<Set<TTLockFunction>> build(String lockMac) async {
    final cache = await ref.watch(lockLocalCacheNotifierProvider(lockMac).future);
    final set = cache.capabilitiesSet;
    if (set.isNotEmpty) return set;

    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return {};
    return refreshFromLock();
  }

  Future<Set<TTLockFunction>> refreshFromLock() async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return {};

    final api = TTLock.lock;
    final supported = await probeLockCapabilities(api, lock.lockData);
    final now = DateTime.now();

    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
          (c) => c.copyWith(
            supportedFunctions: capabilitiesToJson(supported),
            capabilitiesProbedAt: now,
          ),
        );
    return supported;
  }

  Future<void> refresh() async {
    await refreshFromLock();
    ref.invalidateSelf();
  }
}


