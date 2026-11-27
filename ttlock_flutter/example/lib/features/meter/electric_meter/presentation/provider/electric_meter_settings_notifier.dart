import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/provider/electric_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/presentation/provider/electric_meter_settings_state.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';

part 'electric_meter_settings_notifier.g.dart';

/// 设备设置页（spec §6.2）：操作 + 设备信息 + 固件展示（4G 入口在 T10 接入）。
@Riverpod()
class ElectricMeterSettingsNotifier extends _$ElectricMeterSettingsNotifier {
  ElectricMeterDomain get _domain =>
      ref.read(electricMeterDomainProvider.notifier);

  @override
  Future<ElectricMeterSettingsState> build(int meterId) async {
    final item = await _run(_domain.detail(meterId));
    // 固件检查失败 → null（该区显示「暂不可用」），不影响其余部分。
    final firmware = await _tryFirmware(meterId);
    // isCatOne 读服务端特征值（spec §5.3，添加完成后唯一来源）。
    final isCatOne = await _domain.isCatOne(item.featureValue);
    return ElectricMeterSettingsState(
      item: item,
      firmware: firmware,
      isCatOne: isCatOne,
    );
  }

  Future<T> _run<T>(TaskEither<AppException, T> task) async {
    final r = await task.run();
    return r.fold((err) => throw err, (v) => v);
  }

  Future<MeterFirmwareEntity?> _tryFirmware(int meterId) async {
    final r = await _domain.firmwareInfo(meterId).run();
    return r.fold((_) => null, (v) => v);
  }

  void clearError() {
    final current = state.value;
    if (current != null) {
      state = AsyncValue.data(current.copyWith(error: null));
    }
  }

  Future<bool> setMaxPower(int maxPower) =>
      _write(() => _domain.setMaxPower(state.value!.item, maxPower: maxPower));

  Future<bool> setPrice(double price) =>
      _write(() => _domain.setPrice(state.value!.item, price: price));

  Future<bool> setPayMode(MeterPayMode mode, {double? price}) => _write(
    () => _domain.setPayMode(state.value!.item, mode: mode, price: price),
  );

  Future<bool> clear() => _write(() => _domain.clearRemainder(state.value!.item));

  Future<bool> readMeter() => _write(() => _domain.readMeter(state.value!.item));

  Future<bool> setRemainder(double remainderKwh) => _write(
    () => _domain.setRemainder(state.value!.item, remainderKwh: remainderKwh),
  );

  Future<bool> resetMeter() =>
      _write(() => _domain.resetMeter(state.value!.item));

  Future<bool> refreshFeatureValue() => _write(
    () => _domain.readFeatureValue(state.value!.item).map((_) => unit),
  );


  /// 写操作统一收口：置 operating → 执行 → 成功刷新三端 / 失败留 error。
  Future<bool> _write(TaskEither<AppException, Unit> Function() action) async {
    final current = state.value;
    if (current == null) return false;
    state = AsyncValue.data(current.copyWith(operating: true, error: null));
    final r = await action().runWithLoading(
      status: ref.read(l10nProvider).loading,
    );
    return r.fold(
      (err) {
        final latest = state.value;
        if (latest != null) {
          state = AsyncValue.data(
            latest.copyWith(operating: false, error: err),
          );
        }
        return false;
      },
      (_) {
        _refresh();
        return true;
      },
    );
  }

  /// 写操作成功后刷新列表、详情（**整个 family**）与自身（spec §6.1）。
  ///
  /// 用 invalidate 而非就地改 state：BLE 通道的最终状态由 SDK 自动上报决定，
  /// 本地拼出的新状态未必与设备一致，重拉更诚实。
  /// 不带参数的 `ref.invalidate` 会失效该 family 的所有实例，详情页在栈中时
  /// 会随之重拉。
  void _refresh() {
    ref.invalidate(electricMeterListProvider);
    ref.invalidate(electricMeterDetailProvider);
    ref.invalidateSelf();
  }
}
