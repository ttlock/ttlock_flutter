import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/storage/gateway_list_provider.dart';
import '../../core/storage/meter_list_provider.dart';
import '../../features/settings/model/saved_lock_device.dart';
import '../../features/settings/model/saved_gateway_device.dart';
import '../../features/settings/model/saved_meter_device.dart';

part 'dashboard_provider.freezed.dart';
part 'dashboard_provider.g.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required List<SavedLockDevice> locks,
    required List<SavedGatewayDevice> gateways,
    required List<SavedMeterDevice> waterMeters,
    required List<SavedMeterDevice> electricMeters,
    @Default(false) bool isLoading,
  }) = _DashboardState;

  factory DashboardState.empty() => const DashboardState(
    locks: [],
    gateways: [],
    waterMeters: [],
    electricMeters: [],
  );
}

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  Future<DashboardState> build() async {
    final locks = await ref.watch(lockListNotifierProvider.future);
    final gateways = await ref.watch(gatewayListNotifierProvider.future);
    final allMeters = await ref.watch(meterListNotifierProvider.future);
    return DashboardState(
      locks: locks,
      gateways: gateways,
      waterMeters: allMeters.where((m) => m.isWater).toList(),
      electricMeters: allMeters.where((m) => m.isElectric).toList(),
    );
  }
}
