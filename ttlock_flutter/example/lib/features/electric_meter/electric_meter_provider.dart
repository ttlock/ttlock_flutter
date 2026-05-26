import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../providers/ttlock_providers.dart';

part 'electric_meter_provider.g.dart';

class ElectricMeterState {
  final bool isLoading;
  final String? error;
  final String? result;

  const ElectricMeterState({this.isLoading = false, this.error, this.result});
}

@riverpod
class ElectricMeterNotifier extends _$ElectricMeterNotifier {
  @override
  ElectricMeterState build() => const ElectricMeterState();

  Future<void> configServer(String url, String clientId, String accessToken) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.electricMeterConfigServer(url, clientId, accessToken));
      state = ElectricMeterState(result: 'Server configured');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> connect(String mac) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.electricMeterConnect(mac));
      state = ElectricMeterState(result: 'Connected');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> disconnect(String mac) async {
    final api = ref.read(electricMeterApiProvider);
    try {
      await api.electricMeterDisconnect(mac);
      state = ElectricMeterState(result: 'Disconnected');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> init(Map<String, Object?> params) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      final result = await runRemoteAccessoryApi(() => api.electricMeterInit(params));
      state = ElectricMeterState(result: 'Init: id=${result.electricMeterId}');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> readData(String id) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      final data = await runRemoteAccessoryApi(() => api.electricMeterReadData(id));
      state = ElectricMeterState(result: 'Data: $data');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> setPowerOnOff(String id, bool isOn) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.electricMeterSetPowerOnOff(id, isOn));
      state = ElectricMeterState(result: 'Power ${isOn ? "ON" : "OFF"}');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> setPayMode(String id, int mode) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.electricMeterSetPayMode(id, mode));
      state = ElectricMeterState(result: 'Pay mode set to $mode');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> charge(String id, double amount) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.electricMeterCharge(id, amount));
      state = ElectricMeterState(result: 'Charged $amount');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> setMaxPower(String id, double maxPower) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.electricMeterSetMaxPower(id, maxPower));
      state = ElectricMeterState(result: 'Max power set to $maxPower');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> getFeatureValue(String id) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      final value = await runRemoteAccessoryApi(() => api.electricMeterGetFeatureValue(id));
      state = ElectricMeterState(result: 'Feature value: $value');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> delete(String id) async {
    final api = ref.read(electricMeterApiProvider);
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.electricMeterDelete(id));
      state = ElectricMeterState(result: 'Deleted');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }
}
