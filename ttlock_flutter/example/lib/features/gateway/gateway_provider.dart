import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';

import 'model/gateway_state.dart';

part 'gateway_provider.g.dart';

@riverpod
class GatewayNotifier extends _$GatewayNotifier {
  @override
  GatewayState build() {
    return const GatewayState();
  }

  void setMac(String mac) {
    state = state.copyWith(mac: mac);
  }

  Future<void> getNetworkMac() async {
    final api = TTLock.gateway;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final mac = await api.getNetworkMac();
      state = state.copyWith(isLoading: false, lastResult: 'Network MAC: $mac');
    } on TTGatewayException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> enterUpgradeMode() async {
    final mac = state.mac;
    if (mac == null) return;
    final api = TTLock.gateway;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await api.enterUpgradeMode(mac);
      state = state.copyWith(isLoading: false, lastResult: 'Upgrade mode entered');
    } on TTGatewayException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
