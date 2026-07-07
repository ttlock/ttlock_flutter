import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/settings/model/saved_gateway_device.dart';
import 'gateway_storage.dart';

part 'gateway_list_provider.g.dart';

final _gatewayStorage = GatewayStorage();

@riverpod
class GatewayListNotifier extends _$GatewayListNotifier {
  @override
  Future<List<SavedGatewayDevice>> build() async => _gatewayStorage.load();

  Future<void> addDevice(SavedGatewayDevice device) async {
    final list = <SavedGatewayDevice>[...?state.valueOrNull];
    final idx = list.indexWhere((d) => d.mac == device.mac);
    if (idx >= 0) {
      list[idx] = device;
    } else {
      list.add(device);
    }
    await _gatewayStorage.save(list);
    ref.invalidateSelf();
  }

  Future<void> removeDevice(String mac) async {
    final list = (state.valueOrNull ?? []).where((d) => d.mac != mac).toList();
    await _gatewayStorage.save(list);
    ref.invalidateSelf();
  }
}

@riverpod
Future<SavedGatewayDevice?> gatewayByMac(Ref ref, String mac) async {
  final gateways = await ref.watch(gatewayListNotifierProvider.future);
  return gateways.where((d) => d.mac == mac).firstOrNull;
}
