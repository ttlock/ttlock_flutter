import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';

part 'water_meter_cat_one_state.freezed.dart';

/// 4G 网络页的三态（spec §6.3）。
///
/// **网络类失败必须与「未配置」分开** —— 否则网络超时会把「配置服务器」
/// 按钮错误地推给一台已配好的表。
@freezed
sealed class WaterMeterCatOneStep with _$WaterMeterCatOneStep {
  /// 网络类失败：显示**重试**，不给配置按钮。
  const factory WaterMeterCatOneStep.unavailable({
    required AppException error,
  }) = WaterMeterCatOneStepUnavailable;

  /// 未配置：说明文案 + 「配置服务器」按钮。
  const factory WaterMeterCatOneStep.unconfigured() =
      WaterMeterCatOneStepUnconfigured;

  /// 已配置：信息区 + 「重新配置」按钮。
  const factory WaterMeterCatOneStep.configured({
    required MeterCatOneInfoEntity info,
  }) = WaterMeterCatOneStepConfigured;
}

@freezed
abstract class WaterMeterCatOneState with _$WaterMeterCatOneState {
  const WaterMeterCatOneState._();
  const factory WaterMeterCatOneState({
    required WaterMeterCatOneStep step,
    /// 是否为海外站点 —— 决定「配置服务器」前是否先弹 APN sheet。
    @Default(false) bool needsApn,
    @Default(false) bool configuring,
    AppException? error,
  }) = _WaterMeterCatOneState;
}
