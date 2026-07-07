import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

part 'keypad_provider.g.dart';

class KeypadState {
  final bool isLoading;
  final String? error;
  final String? result;

  const KeypadState({this.isLoading = false, this.error, this.result});
}

@riverpod
class KeypadNotifier extends _$KeypadNotifier {
  @override
  KeypadState build() => const KeypadState();

  Future<void> initKeypad(String mac, String lockMac) async {
    final api = TTLock.remoteKeypad;
    state = KeypadState(isLoading: true, error: null);
    try {
      final result = await api.initRemoteKeypad(mac, lockMac);
      state = KeypadState(result: 'Init success: electricQuantity=${result.electricQuantity}, feature=${result.wirelessKeypadFeatureValue}');
    } on TTRemoteAccessoryException catch (e) {
      state = KeypadState(error: e.toString());
    }
  }

  Future<void> initMultifunctional(String mac, String lockData) async {
    final api = TTLock.remoteKeypad;
    state = KeypadState(isLoading: true, error: null);
    try {
      final result = await api.initMultifunctionalKeypad(mac, lockData);
      state = KeypadState(result: 'Init multifunctional: electricQuantity=${result.electricQuantity}, slotNumber=${result.slotNumber}, slotLimit=${result.slotLimit}');
    } on TTRemoteAccessoryException catch (e) {
      state = KeypadState(error: e.toString());
    } on TTMultifunctionalKeypadException catch (e) {
      state = KeypadState(error: e.toString());
    } on TTLockException catch (e) {
      state = KeypadState(error: e.toString());
    }
  }

  Future<void> deleteStoredLock(String mac, int slotNumber) async {
    final api = TTLock.remoteKeypad;
    state = KeypadState(isLoading: true, error: null);
    try {
      await api.deleteStoredLock(mac, slotNumber);
      state = KeypadState(result: 'Deleted lock at slot $slotNumber');
    } on TTMultifunctionalKeypadException catch (e) {
      state = KeypadState(error: e.toString());
    }
  }
}
