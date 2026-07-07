import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../core/storage/gateway_list_provider.dart';
import '../../features/settings/model/saved_gateway_device.dart';
import 'model/gateway_state.dart';

part 'gateway_init_provider.g.dart';

class GatewayNetworkConfig {
  final bool useStaticIp;
  final String? ipAddress;
  final String? subnetMask;
  final String? router;
  final String? preferredDns;
  final bool apnEnabled;
  final String? apn;

  const GatewayNetworkConfig({
    this.useStaticIp = false,
    this.ipAddress,
    this.subnetMask,
    this.router,
    this.preferredDns,
    this.apnEnabled = false,
    this.apn,
  });
}

@riverpod
class GatewayInitNotifier extends _$GatewayInitNotifier {
  @override
  GatewayState build() {
    ref.onCancel(() {
      disconnect();
    });
    return const GatewayState();
  }

  Future<bool> connect(String mac) async {
    final api = TTLock.gateway;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final status = await api.connect(mac);
      state = state.copyWith(
        mac: mac,
        isConnected: status == TTGatewayConnectStatus.success,
        isLoading: false,
      );
      return status == TTGatewayConnectStatus.success;
    } on TTGatewayException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }

  Future<void> configIp(String mac, TTIpSetting ipSetting) async {
    final api = TTLock.gateway;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await api.configIp(mac, ipSetting);
      state = state.copyWith(isLoading: false);
    } on TTGatewayException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      rethrow;
    }
  }

  Future<void> configApn(String mac, String apn) async {
    final api = TTLock.gateway;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await api.configApn(mac, apn);
      state = state.copyWith(isLoading: false);
    } on TTGatewayException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      rethrow;
    }
  }

  Future<bool> init(
    TTGatewayInitParams params, {
    required String deviceMac,
    required String deviceName,
    GatewayNetworkConfig network = const GatewayNetworkConfig(),
  }) async {
    final api = TTLock.gateway;
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final result = await api.init(params);
      await ref.read(gatewayListNotifierProvider.notifier).addDevice(
            SavedGatewayDevice(
              name: params.gatewayName ?? deviceName,
              mac: deviceMac,
              gatewayModel: result.modelNum,
              gatewayType: params.type.index,
              wifiSsid: params.wifi,
              useStaticIp: network.useStaticIp,
              ipAddress: network.ipAddress,
              subnetMask: network.subnetMask,
              router: network.router,
              preferredDns: network.preferredDns,
              apnEnabled: network.apnEnabled,
              apn: network.apn,
              initializedAt: DateTime.now(),
            ),
          );
      state = state.copyWith(
        isLoading: false,
        lastResult: 'model=${result.modelNum}, hw=${result.hardwareRevision}',
      );
      return true;
    } on TTGatewayException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }

  Future<void> disconnect() async {
    if (state.mac == null) return;
    final api = TTLock.gateway;
    await api.disconnect(state.mac!);
    state = const GatewayState();
  }
}
