import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_local_storage_provider.dart';
import '../../../providers/ttlock_providers.dart';
import '../model/cached_credentials.dart';
import '../model/credential_params.dart';
import '../model/credential_validity.dart';
import '../../../core/storage/lock_list_provider.dart';

part 'fingerprint_provider.g.dart';

@riverpod
class FingerprintList extends _$FingerprintList {
  @override
  Future<List<TTFingerprintModel>> build(String lockMac) async {
    final cache = await ref.watch(lockLocalCacheNotifierProvider(lockMac).future);
    if (cache.fingerprints != null) {
      return cache.fingerprints!.map((e) => e.toModel()).toList();
    }
    return refreshFromLock();
  }

  Future<List<TTFingerprintModel>> refreshFromLock() async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return [];

    final list =
        await ref.read(lockApiProvider).getAllValidFingerprints(lock.lockData);
    final cached = list.map(CachedFingerprint.fromModel).toList();
    final now = DateTime.now();

    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
          (c) => c.copyWith(fingerprints: cached, credentialsFetchedAt: now),
        );

    ref.invalidateSelf();
    return list;
  }

  Future<void> refresh() async {
    await refreshFromLock();
  }

  Future<void> clearAll(String lockMac) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await ref.read(lockApiProvider).clearAllFingerprints(lock.lockData);
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
          (c) => c.copyWith(fingerprints: [], credentialsFetchedAt: DateTime.now()),
        );
    ref.invalidateSelf();
  }

  Future<void> delete(String lockMac, String fingerprintNumber) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await ref.read(lockApiProvider).deleteFingerprint(fingerprintNumber, lock.lockData);
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch((c) {
      final list = c.fingerprints ?? [];
      return c.copyWith(
        fingerprints:
            list.where((p) => p.fingerprintNumber != fingerprintNumber).toList(),
      );
    });
    ref.invalidateSelf();
  }

  Future<void> modifyValidity(
    String lockMac,
    String fingerprintNumber,
    CredentialValidity validity,
  ) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final range = validityToDateRange(validity);
    await ref.read(lockApiProvider).modifyFingerprintValidityPeriod(
      fingerprintNumber,
      range.cycleList,
      range.startDate,
      range.endDate,
      lock.lockData,
    );
    await refreshFromLock();
  }

  Future<void> onFingerprintAdded(
    String lockMac,
    String fingerprintNumber,
    int start,
    int end,
  ) async {
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch((c) {
      final list = [...?c.fingerprints];
      list.removeWhere((e) => e.fingerprintNumber == fingerprintNumber);
      list.add(CachedFingerprint(
        fingerprintNumber: fingerprintNumber,
        startDate: start,
        endDate: end,
      ));
      return c.copyWith(fingerprints: list, credentialsFetchedAt: DateTime.now());
    });
    ref.invalidate(fingerprintListProvider(lockMac));
  }

  Stream<AddFingerprintEvent> addFingerprintStream(
    String lockMac,
    CredentialValidity validity,
  ) async* {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final range = validityToDateRange(validity);
    final api = ref.read(lockApiProvider);
    yield* api.lockAddFingerprint(
      lock.lockData,
      cycleList: range.cycleList,
      startDate: range.startDate,
      endDate: range.endDate,
    );
  }
}
