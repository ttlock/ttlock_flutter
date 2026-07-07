import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

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
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await api.waterMeterConfigServer(url, clientId, accessToken);
      state = WaterMeterState(result: 'Server configured');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> connect(String mac) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await api.waterMeterConnect(mac);
      state = WaterMeterState(result: 'Connected');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> disconnect(String mac) async {
    final api = TTLock.waterMeter;
    try {
      await api.waterMeterDisconnect(mac);
      state = WaterMeterState(result: 'Disconnected');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> init({
    required String mac,
    String name = '',
    TTMeterPayMode payMode = TTMeterPayMode.postpaid,
    double price = 0,
  }) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      final result = await api.waterMeterInit(TTWaterMeterInitParam(
        mac: mac,
        name: name,
        payMode: payMode,
        price: price,
      ));
      state = WaterMeterState(
        result: 'Init: id=${result.waterMeterId}, feature=${result.featureValue}',
      );
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> readData(String mac) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await api.waterMeterReadData(mac);
      state = WaterMeterState(result: 'Read data requested');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> setPowerOnOff(String mac, bool isOn) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await api.waterMeterSetPowerOnOff(mac, isOn);
      state = WaterMeterState(result: 'Power ${isOn ? "ON" : "OFF"}');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> setPayMode(String mac, TTMeterPayMode mode, {double price = 0}) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await api.waterMeterSetPayMode(mac, mode, price);
      state = WaterMeterState(result: 'Pay mode set to $mode');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> charge(String mac, double amount, {double m3 = 0}) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await api.waterMeterCharge(mac, amount, m3);
      state = WaterMeterState(result: 'Charged $amount');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> getFeatureValue(String mac) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      final value = await api.waterMeterGetFeatureValue(mac);
      state = WaterMeterState(result: 'Feature value: $value');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> getDeviceInfo(String mac) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      final info = await api.waterMeterGetDeviceInfo(mac);
      state = WaterMeterState(result: 'Device: card=${info.catOneCardNumber}, imsi=${info.catOneImsi}');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> delete(String mac) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await api.waterMeterDelete(mac);
      state = WaterMeterState(result: 'Deleted');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }

  Future<void> reset(String mac) async {
    final api = TTLock.waterMeter;
    state = WaterMeterState(isLoading: true, error: null);
    try {
      await api.waterMeterReset(mac);
      state = WaterMeterState(result: 'Reset');
    } on TTRemoteAccessoryException catch (e) {
      state = WaterMeterState(error: e.toString());
    }
  }
}
