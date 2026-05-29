import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../core/storage/lock_local_storage_provider.dart';
import '../../../providers/ttlock_providers.dart';
import '../model/cached_credentials.dart';
import '../model/credential_params.dart';
import '../model/credential_validity.dart';

part 'face_provider.g.dart';

String faceErrorMessage(TTFaceErrorCode? code) => code?.name ?? 'Face error';

@riverpod
class FaceList extends _$FaceList {
  @override
  Future<List<CachedFace>> build(String lockMac) async {
    final cache = await ref.watch(lockLocalCacheNotifierProvider(lockMac).future);
    return cache.faces ?? [];
  }

  Future<void> addFace(
    String lockMac, {
    required String faceNumber,
    required int startDate,
    required int endDate,
  }) async {
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch((c) {
      final list = [...?c.faces];
      list.removeWhere((e) => e.faceNumber == faceNumber);
      list.add(CachedFace(
        faceNumber: faceNumber,
        startDate: startDate,
        endDate: endDate,
      ));
      return c.copyWith(faces: list, credentialsFetchedAt: DateTime.now());
    });
    ref.invalidateSelf();
  }

  Future<void> clearOnLock(String lockMac) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await ref.read(lockApiProvider).clearFace(lock.lockData);
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
          (c) => c.copyWith(faces: [], credentialsFetchedAt: DateTime.now()),
        );
    ref.invalidateSelf();
  }

  Future<void> deleteOnLock(String lockMac, String faceNumber) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await ref.read(lockApiProvider).deleteFace(faceNumber, lock.lockData);
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch((c) {
      final list = c.faces ?? [];
      return c.copyWith(
        faces: list.where((e) => e.faceNumber != faceNumber).toList(),
      );
    });
    ref.invalidateSelf();
  }

  Stream<AddFaceEvent> addFaceStream(
    String lockMac,
    CredentialValidity validity,
  ) async* {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final range = validityToDateRange(validity);
    yield* ref.read(lockApiProvider).lockAddFace(
          lock.lockData,
          cycleList: range.cycleList,
          startDate: range.startDate,
          endDate: range.endDate,
        );
  }
}
