import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/features/power_switch/domain/provider/power_switch_domain.dart';
import 'package:ttlock_flutter_demo/features/power_switch/presentation/provider/power_switch_state.dart';

part 'power_switch_notifier.g.dart';

/// 取电开关页面状态机：工作模式、关联门锁。
///
/// BLE 写配置成功 → [PowerSwitchState.configOutcome]；失败 → [PowerSwitchState.error]。
@Riverpod()
class PowerSwitchNotifier extends _$PowerSwitchNotifier {
  @override
  PowerSwitchState build() => const PowerSwitchState();

  void clearError() => state = state.copyWith(error: null);

  void clearConfigOutcome() => state = state.copyWith(configOutcome: null);

  Future<void> setWorkMode({
    required TTPowerSaverWorkType type,
    required String lockData,
  }) async {
    if (state.operating) return;
    state = state.copyWith(operating: true, error: null, configOutcome: null);
    final r = await ref
        .read(powerSwitchDomainProvider.notifier)
        .setWorkMode(type: type, lockData: lockData)
        .run();
    state = r.fold(
      (err) => state.copyWith(operating: false, error: err),
      (_) => state.copyWith(
        operating: false,
        configOutcome: PowerSwitchConfigOutcome.workModeSaved,
      ),
    );
  }

  Future<void> setControlableLock({
    required String lockMac,
    required String lockData,
  }) async {
    if (lockMac.isEmpty || state.operating) return;
    state = state.copyWith(operating: true, error: null, configOutcome: null);
    final r = await ref
        .read(powerSwitchDomainProvider.notifier)
        .setControlableLock(lockMac: lockMac, lockData: lockData)
        .run();
    state = r.fold(
      (err) => state.copyWith(operating: false, error: err),
      (_) => state.copyWith(
        operating: false,
        configOutcome: PowerSwitchConfigOutcome.controlableLockSaved,
      ),
    );
  }
}
