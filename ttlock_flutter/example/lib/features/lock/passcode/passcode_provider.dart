import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../core/storage/lock_local_storage_provider.dart';
import '../model/cached_credentials.dart';
import '../model/credential_params.dart';
import '../model/credential_validity.dart';

part 'passcode_provider.g.dart';

@riverpod
class PasscodeList extends _$PasscodeList {
  @override
  Future<List<TTPasscodeModel>> build(String lockMac) async {
    final cache =
        await ref.watch(lockLocalCacheNotifierProvider(lockMac).future);
    if (cache.passcodes != null) {
      return cache.passcodes!.map((e) => e.toModel()).toList();
    }
    return refreshFromLock();
  }

  Future<List<TTPasscodeModel>> refreshFromLock() async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return [];

    try {
      final list = await TTLock.lock.getAllValidPasscodes(lock.lockData);
      final cached = list.map(CachedPasscode.fromModel).toList();
      final now = DateTime.now();

      await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
            (c) => c.copyWith(passcodes: cached, credentialsFetchedAt: now),
          );

      ref.invalidateSelf();
      return list;
    } on TTLockException catch (e) {
      toastification.show(
        title: Text("Get passcodes failed: ${e.message}"),
        type: ToastificationType.error,
      );
      return [];
    }
  }

  Future<void> refresh() async {
    await refreshFromLock();
  }

  Future<void> createCustom(
    String lockMac,
    String passcode,
    CredentialValidity validity,
  ) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final range = validityToDateRange(validity);
    final api = TTLock.lock;
    await api.createCustomPasscode(
      passcode,
      range.startDate,
      range.endDate,
      lock.lockData,
    );
    await refreshFromLock();
  }

  Future<void> modify(
    String lockMac,
    String origin,
    String? newPasscode,
    CredentialValidity validity,
  ) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final range = validityToDateRange(validity);
    final api = TTLock.lock;
    await api.modifyPasscode(
      origin,
      newPasscode?.isEmpty ?? true ? null : newPasscode,
      range.startDate,
      range.endDate,
      lock.lockData,
    );
    await refreshFromLock();
  }

  Future<void> delete(String lockMac, String passcode) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await TTLock.lock.deletePasscode(passcode, lock.lockData);
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch((c) {
      final list = c.passcodes ?? [];
      return c.copyWith(
        passcodes: list.where((p) => p.keyboardPwd != passcode).toList(),
      );
    });
    ref.invalidateSelf();
  }

  Future<String> resetAll(String lockMac) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return '';
    final newData = await TTLock.lock.resetPasscode(lock.lockData);
    await ref.read(lockListNotifierProvider.notifier).updateDevice(
          lock.copyWith(lockData: newData),
        );
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
          (c) =>
              c.copyWith(passcodes: [], credentialsFetchedAt: DateTime.now()),
        );
    ref.invalidateSelf();
    return newData;
  }

  Future<String> getAdminPasscode(String lockMac) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return '';
    return TTLock.lock.getAdminPasscode(lock.lockData);
  }

  Future<void> modifyAdmin(String lockMac, String passcode) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await TTLock.lock.modifyAdminPasscode(passcode, lock.lockData);
  }

  Future<void> setErasePasscode(String lockMac, String passcode) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await TTLock.lock.setErasePasscode(passcode, lock.lockData);
  }
}

@riverpod
Future<String?> adminPasscode(Ref ref, String lockMac) async {
  final lock = await ref.watch(lockByMacProvider(lockMac).future);
  if (lock == null) return null;
  try {
    return await TTLock.lock.getAdminPasscode(lock.lockData);
  } catch (_) {
    return null;
  }
}
