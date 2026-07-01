import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/storage/lock_local_storage_provider.dart';
import '../../../providers/ttlock_providers.dart';
import '../model/cached_credentials.dart';

part 'palm_vein_provider.g.dart';

@riverpod
class PalmVeinList extends _$PalmVeinList {
  @override
  Future<List<CachedPalmVein>> build(String lockMac) async {
    final cache = await ref.watch(lockLocalCacheNotifierProvider(lockMac).future);
    return cache.palmVeins;
  }

  Future<void> deleteOnLock(String lockMac, String palmVeinNumber) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final api = ref.read(lockApiProvider);
    await runLockApi(() => api.deletePalmVein(palmVeinNumber, lock.lockData));
    final list = (state.valueOrNull ?? [])
        .where((p) => p.palmVeinNumber != palmVeinNumber).toList();
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
      (c) => c.copyWith(palmVeins: list));
    ref.invalidateSelf();
  }

  Future<void> clearOnLock(String lockMac) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final api = ref.read(lockApiProvider);
    await runLockApi(() => api.clearPalmVein(lock.lockData));
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
      (c) => c.copyWith(palmVeins: <CachedPalmVein>[]));
    ref.invalidateSelf();
  }

  Future<void> onPalmVeinAdded(
    String lockMac, String palmVeinNumber, int startDate, int endDate,
  ) async {
    final list = [...?state.valueOrNull];
    list.removeWhere((p) => p.palmVeinNumber == palmVeinNumber);
    list.add(CachedPalmVein(
      palmVeinNumber: palmVeinNumber, startDate: startDate, endDate: endDate));
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
      (c) => c.copyWith(palmVeins: list));
    ref.invalidateSelf();
  }

  Stream<AddPalmVeinEvent> addPalmVeinStream(
    String lockMac, {
    int? startDate, int? endDate,
  }) async* {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final api = ref.read(lockApiProvider);
    yield* api.lockAddPalmVein(lock.lockData, startDate: startDate, endDate: endDate);
  }
}
