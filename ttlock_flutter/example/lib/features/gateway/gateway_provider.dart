import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../core/storage/gateway_list_provider.dart';
import '../../features/settings/model/saved_gateway_device.dart';
import '../../providers/ttlock_providers.dart';
import 'model/gateway_state.dart';

part 'gateway_provider.g.dart';

@riverpod
class GatewayNotifier extends _$GatewayNotifier {
  @override
  GatewayState build() => const GatewayState();

  Future<bool> connect(String mac) async {
    final api = ref.read(gatewayApiProvider);
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final status = await runGatewayApi(() => api.connect(mac));
      state = state.copyWith(
          mac: mac,
          isConnected: status == TTGatewayConnectStatus.success,
          isLoading: false);
      return status == TTGatewayConnectStatus.success;
    } on TTGatewayException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }

  Future<void> init(TTGatewayInitParams params) async {
    final api = ref.read(gatewayApiProvider);
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final result = await runGatewayApi(() => api.init(params));
      final mac = state.mac;
      if (mac != null) {
        final existing = await ref.read(gatewayListNotifierProvider.future);
        if (!existing.any((g) => g.mac == mac)) {
          await ref.read(gatewayListNotifierProvider.notifier).addDevice(
                SavedGatewayDevice(
                  name: params.gatewayName ?? 'Gateway',
                  mac: mac,
                  gatewayModel: result.modelNum,
                  initializedAt: DateTime.now(),
                ),
              );
        }
      }
      state = state.copyWith(
          isLoading: false,
          lastResult:
              'model=${result.modelNum}, hw=${result.hardwareRevision}');
    } on TTGatewayException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> disconnect() async {
    if (state.mac == null) return;
    final api = ref.read(gatewayApiProvider);
    await api.disconnect(state.mac!);
    state = const GatewayState();
  }
}
