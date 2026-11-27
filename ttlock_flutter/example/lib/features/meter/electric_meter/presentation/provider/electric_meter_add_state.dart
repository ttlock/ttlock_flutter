import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'electric_meter_add_state.freezed.dart';

/// 电表添加状态机（spec §6.5）：
/// form → scanning → connecting →（弹窗确认）→ submitting → success
/// →（Cat.1：configuring）→ done。
///
/// 表单在最前（设备尚未选定），**只含计费模式**（需求 1、2 去掉了名称与单价
/// 输入）。`apnNeeded` 步骤已删除 —— APN 输入并入 `success`。
@freezed
sealed class ElectricMeterAddStep with _$ElectricMeterAddStep {
  const factory ElectricMeterAddStep.form() = ElectricMeterAddStepForm;

  const factory ElectricMeterAddStep.scanning({
    @Default(<String, TTMeterScanModel>{})
    Map<String, TTMeterScanModel> devices,
  }) = ElectricMeterAddStepScanning;

  /// 正在 BLE 连接（setClientParam + connect）。
  const factory ElectricMeterAddStep.connecting({
    required TTMeterScanModel scan,
  }) = ElectricMeterAddStepConnecting;

  /// 已连接，等待用户在弹窗确认设备指示灯。
  const factory ElectricMeterAddStep.confirmConnection({
    required TTMeterScanModel scan,
  }) = ElectricMeterAddStepConfirmConnection;

  const factory ElectricMeterAddStep.submitting({
    required TTMeterScanModel scan,
  }) = ElectricMeterAddStepSubmitting;

  /// 已入网（表已在云端注册）：补名称（非必填）与 APN（仅 Cat.1 海外）。
  ///
  /// 这一步**仍是同一屏内的状态机步骤，不新开路由** —— `configureCatOne`
  /// 依赖添加流程那条长活的 BLE 连接（spec §6.5）。
  const factory ElectricMeterAddStep.success({
    required TTMeterScanModel scan,
    required int meterId,
    required bool isCatOne,
    required bool needsApn,
  }) = ElectricMeterAddStepSuccess;

  /// 正在下发服务器端点并回传模块网络信息。
  const factory ElectricMeterAddStep.configuring({
    required TTMeterScanModel scan,
    required int meterId,
  }) = ElectricMeterAddStepConfiguring;

  /// [catOneFailed] 为真表示 `configureCatOne` 失败但仍按添加成功结束
  /// （spec §6.5：表已在云端注册，4G 配置失败不该让用户以为整次添加白做）。
  const factory ElectricMeterAddStep.done({
    required int meterId,
    @Default(false) bool catOneFailed,
  }) = ElectricMeterAddStepDone;

  const factory ElectricMeterAddStep.failure({required AppException error}) =
      ElectricMeterAddStepFailure;
}

@freezed
abstract class ElectricMeterAddState with _$ElectricMeterAddState {
  const ElectricMeterAddState._();
  const factory ElectricMeterAddState({
    @Default(ElectricMeterAddStep.form()) ElectricMeterAddStep step,
  }) = _ElectricMeterAddState;
}
