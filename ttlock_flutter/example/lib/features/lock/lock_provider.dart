import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../providers/ttlock_providers.dart';
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
    final api = ref.read(lockApiProvider);
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final lockData = await runLockApi(() => api.initLock(params));
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
    final api = ref.read(lockApiProvider);
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final result = await runLockApi(() => api.controlLock(lockData, action));
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
      final result = await runLockApi(fn);
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
