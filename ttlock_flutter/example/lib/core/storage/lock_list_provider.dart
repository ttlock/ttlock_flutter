import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/model/saved_lock_device.dart';
import 'lock_local_storage.dart';
import 'lock_storage.dart';

part 'lock_list_provider.g.dart';

final _lockLocalStorage = LockLocalStorage();
final _lockStorage = LockStorage();

@riverpod
class LockListNotifier extends _$LockListNotifier {
  @override
  Future<List<SavedLockDevice>> build() async => _lockStorage.load();

  Future<void> addDevice(SavedLockDevice device) async {
    final list = <SavedLockDevice>[...?state.valueOrNull];
    final idx = list.indexWhere((d) => d.mac == device.mac);
    if (idx >= 0) {
      list[idx] = device;
    } else {
      list.add(device);
    }
    await _lockStorage.save(list);
    ref.invalidateSelf();
  }

  Future<void> removeDevice(String mac) async {
    final list = (state.valueOrNull ?? []).where((d) => d.mac != mac).toList();
    await _lockStorage.save(list);
    await _lockLocalStorage.delete(mac);
    ref.invalidateSelf();
  }

  Future<void> updateDevice(SavedLockDevice device) async {
    final list = (state.valueOrNull ?? [])
        .map((d) => d.mac == device.mac ? device : d)
        .toList();
    await _lockStorage.save(list);
    ref.invalidateSelf();
  }
}

@riverpod
Future<SavedLockDevice?> lockByMac(Ref ref, String mac) async {
  final locks = await ref.watch(lockListNotifierProvider.future);
  return locks.where((d) => d.mac == mac).firstOrNull;
}
