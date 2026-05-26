import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/storage/config_provider.dart';
import '../../core/storage/gateway_list_provider.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/storage/meter_list_provider.dart';
import '../../features/settings/model/saved_gateway_device.dart';
import '../../features/settings/model/saved_lock_device.dart';
import '../../features/settings/model/saved_meter_device.dart';

part 'dashboard_provider.freezed.dart';
part 'dashboard_provider.g.dart';

@freezed
abstract class DashboardData with _$DashboardData {
  const factory DashboardData({
    @Default(false) bool hasConfig,
    @Default([]) List<SavedLockDevice> locks,
    @Default([]) List<SavedGatewayDevice> gateways,
    @Default([]) List<SavedMeterDevice> waterMeters,
    @Default([]) List<SavedMeterDevice> electricMeters,
  }) = _DashboardData;
}

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  Future<DashboardData> build() async {
    final config = await ref.watch(configNotifierProvider.future);
    final locks = await ref.watch(lockListNotifierProvider.future);
    final gateways = await ref.watch(gatewayListNotifierProvider.future);
    final waterMeters = await ref.watch(waterMeterListProvider.future);
    final electricMeters = await ref.watch(electricMeterListProvider.future);
    return DashboardData(
      hasConfig: config.isValid,
      locks: locks,
      gateways: gateways,
      waterMeters: waterMeters,
      electricMeters: electricMeters,
    );
  }
}
