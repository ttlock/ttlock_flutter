import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../providers/ttlock_providers.dart';

part 'water_meter_provider.g.dart';

class WaterMeterState {
  final bool isLoading;
  final String? error;
  final String? result;

  const WaterMeterState({this.isLoading = false, this.error, this.result});
}

@riverpod
class WaterMeterNotifier extends _$WaterMeterNotifier {
  @override
  WaterMeterState build() => const WaterMeterState();

  Future<void> configServer(String url, String clientId, String accessToken) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.waterMeterConfigServer(url, clientId, accessToken));
      state = WaterMeterState(result: 'Server configured');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> connect(String mac) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.waterMeterConnect(mac));
      state = WaterMeterState(result: 'Connected');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> disconnect(String mac) async {
    final api = ref.read(waterMeterApiProvider);
    try {
      await api.waterMeterDisconnect(mac);
      state = WaterMeterState(result: 'Disconnected');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> init(Map<String, Object?> params) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      final result = await runRemoteAccessoryApi(() => api.waterMeterInit(params));
      state = WaterMeterState(result: 'Init: id=${result.waterMeterId}');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> readData(String id) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      final data = await runRemoteAccessoryApi(() => api.waterMeterReadData(id));
      state = WaterMeterState(result: 'Data: $data');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> setPowerOnOff(String id, bool isOn) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.waterMeterSetPowerOnOff(id, isOn));
      state = WaterMeterState(result: 'Power ${isOn ? "ON" : "OFF"}');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> setPayMode(String id, int mode) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.waterMeterSetPayMode(id, mode));
      state = WaterMeterState(result: 'Pay mode set to $mode');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> charge(String id, double amount) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.waterMeterCharge(id, amount));
      state = WaterMeterState(result: 'Charged $amount');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> getFeatureValue(String id) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      final value = await runRemoteAccessoryApi(() => api.waterMeterGetFeatureValue(id));
      state = WaterMeterState(result: 'Feature value: $value');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> getDeviceInfo(String id) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      final info = await runRemoteAccessoryApi(() => api.waterMeterGetDeviceInfo(id));
      state = WaterMeterState(result: 'Device: card=${info.catOneCardNumber}, imsi=${info.catOneImsi}');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> delete(String id) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.waterMeterDelete(id));
      state = WaterMeterState(result: 'Deleted');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> reset(String id) async {
    final api = ref.read(waterMeterApiProvider);
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await runRemoteAccessoryApi(() => api.waterMeterReset(id));
      state = WaterMeterState(result: 'Reset');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }
}
