import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../providers/ttlock_providers.dart';

part 'remote_key_provider.g.dart';

class RemoteKeyState {
  final bool isLoading;
  final String? error;
  final String? result;

  const RemoteKeyState({this.isLoading = false, this.error, this.result});
}

@riverpod
class RemoteKeyNotifier extends _$RemoteKeyNotifier {
  @override
  RemoteKeyState build() => const RemoteKeyState();

  Future<void> initRemoteKey(String mac, String lockData) async {
    final api = ref.read(remoteKeyApiProvider);
    state = RemoteKeyState(isLoading: true, error: null);
    try {
      final result = await runRemoteAccessoryApi(() => api.initRemoteKey(mac, lockData));
      state = RemoteKeyState(result: 'Init success: model=${result.modelNum}');
    } on TTRemoteAccessoryException catch (e) {
      state = RemoteKeyState(error: e.toString());
    }
  }

  Future<void> getStoredLocks(String mac) async {
    final api = ref.read(remoteKeyApiProvider);
    state = RemoteKeyState(isLoading: true, error: null);
    try {
      final locks = await runRemoteAccessoryApi(() => api.getStoredLocks(mac));
      state = RemoteKeyState(result: 'Stored locks: ${locks.join(", ")}');
    } on TTRemoteAccessoryException catch (e) {
      state = RemoteKeyState(error: e.toString());
    }
  }

  Future<void> deleteStoredLock(String mac, int slotNumber) async {
    final api = ref.read(remoteKeyApiProvider);
    state = RemoteKeyState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.deleteStoredLock(mac, slotNumber));
      state = RemoteKeyState(result: 'Deleted lock at slot $slotNumber');
    } on TTRemoteAccessoryException catch (e) {
      state = RemoteKeyState(error: e.toString());
    }
  }
}
