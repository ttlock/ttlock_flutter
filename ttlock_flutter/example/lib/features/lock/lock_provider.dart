import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import 'model/lock_state.dart';

part 'lock_provider.g.dart';

@riverpod
class LockNotifier extends _$LockNotifier {
  @override
  LockState build() => const LockState();

  void setContext(String lockData, {String? lockMac, String? lockName}) {
    state = state.copyWith(
      lockData: lockData,
      lockMac: lockMac,
      lockName: lockName,
      errorMessage: null,
    );
  }

  Future<void> initLock(TTLockInitParams params) async {
    final api = TTLock.lock;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final lockData = await api.initLock(params);
      state = state.copyWith(
        lockData: lockData,
        isConnected: true,
        isLoading: false,
      );
    } on TTLockException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<String?> controlLock(String lockData, TTControlAction action) async {
    final api = TTLock.lock;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final result = await api.controlLock(lockData, action);
      state = state.copyWith(
        isLoading: false,
        lastResult:
            'lockTime=${result.lockTime}, electricQuantity=${result.electricQuantity}',
      );
      return null;
    } on TTLockException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return e.toString();
    }
  }

  Future<T?> callApi<T>(Future<T> Function() fn, {String? operation}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final result = await fn();
      state = state.copyWith(
        isLoading: false,
        lastResult: result?.toString() ?? 'success',
      );
      return result;
    } on TTLockException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return null;
    }
  }
}
