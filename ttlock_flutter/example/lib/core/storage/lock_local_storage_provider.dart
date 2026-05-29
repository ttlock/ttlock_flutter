import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'lock_local_cache.dart';
import 'lock_local_storage.dart';

part 'lock_local_storage_provider.g.dart';

final _storage = LockLocalStorage();

@riverpod
class LockLocalCacheNotifier extends _$LockLocalCacheNotifier {
  @override
  Future<LockLocalCache> build(String lockMac) async =>
      await _storage.loadOrEmpty(lockMac);

  Future<void> patch(LockLocalCache Function(LockLocalCache) update) async {
    final next = update(await future);
    await _storage.save(lockMac, next);
    state = AsyncData(next);
  }

  Future<void> replace(LockLocalCache cache) async {
    await _storage.save(lockMac, cache);
    state = AsyncData(cache);
  }

  Future<void> clear() async {
    await _storage.delete(lockMac);
    state = const AsyncData(LockLocalCache());
  }
}

LockLocalStorage get lockLocalStorageInstance => _storage;
