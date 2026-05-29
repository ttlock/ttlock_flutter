import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../core/storage/lock_list_provider.dart';
import '../../providers/ttlock_providers.dart';

part 'lock_status_provider.freezed.dart';
part 'lock_status_provider.g.dart';

@freezed
abstract class LockStatusState with _$LockStatusState {
  const factory LockStatusState({
    int? power,
    TTLockSwitchState? switchState,
    int? lockTimeSeconds,
  }) = _LockStatusState;
}

@riverpod
class LockStatus extends _$LockStatus {
  @override
  Future<LockStatusState> build(String lockMac) async => _fetch();

  Future<LockStatusState> refreshFromLock() async {
    final next = await _fetch();
    state = AsyncData(next);
    return next;
  }

  Future<LockStatusState> _fetch() async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return const LockStatusState();

    final api = ref.read(lockApiProvider);
    final data = lock.lockData;

    int? power;
    TTLockSwitchState? switchState;
    int? lockTime;

    try {
      power = await api.getLockPower(data);
    } catch (_) {}
    try {
      switchState = await api.getLockSwitchState(data);
    } catch (_) {}
    try {
      lockTime = await api.getLockTime(data);
    } catch (_) {}

    return LockStatusState(
      power: power,
      switchState: switchState,
      lockTimeSeconds: lockTime,
    );
  }
}
