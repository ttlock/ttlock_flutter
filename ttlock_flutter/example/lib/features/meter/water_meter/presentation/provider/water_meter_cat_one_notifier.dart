import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/provider/water_meter_domain.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_cat_one_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/presentation/provider/water_meter_settings_notifier.dart';

part 'water_meter_cat_one_notifier.g.dart';

/// 4G 网络页（spec §6.3）。信息读取是**纯云**、不走通道判定（spec §4.2）。
@Riverpod()
class WaterMeterCatOneNotifier extends _$WaterMeterCatOneNotifier {
  /// 真实 entity —— `configureCatOneFromSettings` 要用它的 `mac` 下发指令。
  late WaterMeterEntity _meter;

  WaterMeterDomain get _domain => ref.read(waterMeterDomainProvider.notifier);

  @override
  Future<WaterMeterCatOneState> build(int meterId) async {
    // 详情必须成功（拿 `mac` 供 BLE 指令用）；失败经 AsyncError 到界面。
    _meter = await _run(_domain.detail(meterId));
    final apn = await _domain.catOneNeedsApn().run();
    return WaterMeterCatOneState(
      step: await _loadStep(meterId),
      needsApn: apn.fold((_) => false, (v) => v),
    );
  }

  Future<T> _run<T>(TaskEither<AppException, T> task) async {
    final r = await task.run();
    return r.fold((err) => throw err, (v) => v);
  }

  Future<WaterMeterCatOneStep> _loadStep(int meterId) async {
    final r = await _domain.catOneInfo(meterId).run();
    return r.fold(
      (err) {
        // 网络类失败与「未配置」必须分开（spec §6.3）。
        if (err.isNetworkException) {
          return WaterMeterCatOneStep.unavailable(error: err);
        }
        // 判据 2：非网络类业务失败 → 未配置（spec §6.3）。
        return const WaterMeterCatOneStep.unconfigured();
      },
      // 判据 1：字段全空 ⇒ 未配置（首选，不依赖失败语义）。
      (info) => info.isEmpty
          ? const WaterMeterCatOneStep.unconfigured()
          : WaterMeterCatOneStep.configured(info: info),
    );
  }

  /// 重新拉取（重试态与下拉刷新共用）。
  Future<void> refresh() async {
    final step = await withGlobalLoading(
      () => _loadStep(_meter.waterMeterId),
      status: ref.read(l10nProvider).loading,
    );
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(current.copyWith(step: step, error: null));
  }

  /// 配置服务器：重设 BLE 凭证走完整链路，成功后重拉 `catOneDetail`。
  ///
  /// [apn] 仅海外站点非空（国内直接执行，不弹页）。
  /// 该动作需处于 BLE 范围内 —— 远程用户无法配置（spec §9 风险 9）。
  Future<bool> configure({String? apn}) async {
    final current = state.value;
    if (current == null) return false;
    state = AsyncValue.data(current.copyWith(configuring: true, error: null));

    final result = await _domain
        .configureCatOneFromSettings(_meter, apn: apn)
        .runWithLoading(status: ref.read(l10nProvider).loading);

    // fold 拿到的是同步值，而成功分支需要 await 重拉，故先取出错误再分流。
    final error = result.fold<AppException?>((err) => err, (_) => null);
    final latest = state.value;
    if (error != null) {
      if (latest != null) {
        state = AsyncValue.data(
          latest.copyWith(configuring: false, error: error),
        );
      }
      return false;
    }
    if (latest != null) {
      state = AsyncValue.data(
        latest.copyWith(
          step: await _loadStep(_meter.waterMeterId),
          configuring: false,
        ),
      );
    }
    // 4G 信息变了 —— 让设置页重拉。
    ref.invalidate(waterMeterSettingsProvider);
    return true;
  }

  void clearError() {
    final current = state.value;
    if (current != null) {
      state = AsyncValue.data(current.copyWith(error: null));
    }
  }
}
