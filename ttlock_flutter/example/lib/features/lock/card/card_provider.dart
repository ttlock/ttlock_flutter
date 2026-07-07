import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../core/storage/lock_local_storage_provider.dart';
import '../model/cached_credentials.dart';
import '../model/credential_params.dart';
import '../model/credential_validity.dart';

part 'card_provider.g.dart';

@riverpod
class CardList extends _$CardList {
  @override
  Future<List<TTICCardModel>> build(String lockMac) async {
    final cache = await ref.watch(lockLocalCacheNotifierProvider(lockMac).future);
    if (cache.cards != null) {
      return cache.cards!.map((e) => e.toModel()).toList();
    }
    return refreshFromLock();
  }

  Future<List<TTICCardModel>> refreshFromLock() async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return [];

    final list = await TTLock.lock.getAllValidCards(lock.lockData);
    final cached = list.map(CachedCard.fromModel).toList();
    final now = DateTime.now();

    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
          (c) => c.copyWith(cards: cached, credentialsFetchedAt: now),
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
    await TTLock.lock.clearAllCards(lock.lockData);
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch(
          (c) => c.copyWith(cards: [], credentialsFetchedAt: DateTime.now()),
        );
    ref.invalidateSelf();
  }

  Future<void> delete(String lockMac, String cardNumber) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    await TTLock.lock.deleteCard(cardNumber, lock.lockData);
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch((c) {
      final list = c.cards ?? [];
      return c.copyWith(
        cards: list.where((p) => p.cardNumber != cardNumber).toList(),
      );
    });
    ref.invalidateSelf();
  }

  Future<void> modifyValidity(
    String lockMac,
    String cardNumber,
    CredentialValidity validity,
  ) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final range = validityToDateRange(validity);
    await TTLock.lock.modifyCardValidityPeriod(
      cardNumber,
      range.cycleList,
      range.startDate,
      range.endDate,
      lock.lockData,
    );
    await refreshFromLock();
  }

  Future<void> onCardAdded(String lockMac, String cardNumber, int start, int end) async {
    await ref.read(lockLocalCacheNotifierProvider(lockMac).notifier).patch((c) {
      final list = [...?c.cards];
      list.removeWhere((e) => e.cardNumber == cardNumber);
      list.add(CachedCard(cardNumber: cardNumber, startDate: start, endDate: end));
      return c.copyWith(cards: list, credentialsFetchedAt: DateTime.now());
    });
    ref.invalidateSelf();
  }

  Stream<AddCardEvent> addCardStream(
    String lockMac,
    CredentialValidity validity,
  ) async* {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final range = validityToDateRange(validity);
    final api = TTLock.lock;
    yield* api.lockAddCard(
      lock.lockData,
      cycleList: range.cycleList,
      startDate: range.startDate,
      endDate: range.endDate,
    );
  }
}
