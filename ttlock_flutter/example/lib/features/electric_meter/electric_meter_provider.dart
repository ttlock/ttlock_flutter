import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

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
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await api.electricMeterConfigServer(url, clientId, accessToken);
      state = ElectricMeterState(result: 'Server configured');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> connect(String mac) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await api.electricMeterConnect(mac);
      state = ElectricMeterState(result: 'Connected');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> disconnect(String mac) async {
    final api = TTLock.electricMeter;
    try {
      await api.electricMeterDisconnect(mac);
      state = ElectricMeterState(result: 'Disconnected');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> init({
    required String mac,
    String name = '',
    TTMeterPayMode payMode = TTMeterPayMode.postpaid,
    double price = 0,
  }) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      final result = await api.electricMeterInit(TTElectricMeterInitParam(
        mac: mac,
        name: name,
        payMode: payMode,
        price: price,
      ));
      state = ElectricMeterState(
        result: 'Init: id=${result.electricMeterId}, feature=${result.featureValue}',
      );
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> readData(String mac) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await api.electricMeterReadData(mac);
      state = ElectricMeterState(result: 'Read data requested');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> setPowerOnOff(String mac, bool isOn) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await api.electricMeterSetPowerOnOff(mac, isOn);
      state = ElectricMeterState(result: 'Power ${isOn ? "ON" : "OFF"}');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> setPayMode(String mac, TTMeterPayMode mode, {double price = 0}) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await api.electricMeterSetPayMode(mac, mode, price);
      state = ElectricMeterState(result: 'Pay mode set to $mode');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> charge(String mac, double amount, {double kwh = 0}) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await api.electricMeterCharge(mac, amount, kwh);
      state = ElectricMeterState(result: 'Charged $amount');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> setMaxPower(String mac, double maxPower) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await api.electricMeterSetMaxPower(mac, maxPower);
      state = ElectricMeterState(result: 'Max power set to $maxPower');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> getFeatureValue(String mac) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      final value = await api.electricMeterGetFeatureValue(mac);
      state = ElectricMeterState(result: 'Feature value: $value');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }

  Future<void> delete(String mac) async {
    final api = TTLock.electricMeter;
    state = ElectricMeterState(isLoading: true, error: null);
    try {
      await api.electricMeterDelete(mac);
      state = ElectricMeterState(result: 'Deleted');
    } on TTRemoteAccessoryException catch (e) {
      state = ElectricMeterState(error: e.toString());
    }
  }
}
