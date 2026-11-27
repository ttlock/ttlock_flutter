import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'water_meter_add_state.freezed.dart';

/// 水表添加状态机（spec §6.5）：
/// form → scanning → connecting →（弹窗确认）→ submitting → success
/// →（Cat.1：configuring）→ done。
///
/// 表单在最前（设备尚未选定），**只含计费模式**（需求 1、2 去掉了名称与单价
/// 输入）。`apnNeeded` 步骤已删除 —— APN 输入并入 `success`。
@freezed
sealed class WaterMeterAddStep with _$WaterMeterAddStep {
  const factory WaterMeterAddStep.form() = WaterMeterAddStepForm;

  const factory WaterMeterAddStep.scanning({
    @Default(<String, TTMeterScanModel>{})
    Map<String, TTMeterScanModel> devices,
  }) = WaterMeterAddStepScanning;

  /// 正在 BLE 连接（setClientParam + connect）。
  const factory WaterMeterAddStep.connecting({
    required TTMeterScanModel scan,
  }) = WaterMeterAddStepConnecting;

  /// 已连接，等待用户在弹窗确认设备指示灯。
  const factory WaterMeterAddStep.confirmConnection({
    required TTMeterScanModel scan,
  }) = WaterMeterAddStepConfirmConnection;

  const factory WaterMeterAddStep.submitting({
    required TTMeterScanModel scan,
  }) = WaterMeterAddStepSubmitting;

  /// 已入网（表已在云端注册）：补名称（非必填）与 APN（仅 Cat.1 海外）。
  ///
  /// 这一步**仍是同一屏内的状态机步骤，不新开路由** —— `configureCatOne`
  /// 依赖添加流程那条长活的 BLE 连接（spec §6.5）。
  const factory WaterMeterAddStep.success({
    required TTMeterScanModel scan,
    required int meterId,
    required bool isCatOne,
    required bool needsApn,
  }) = WaterMeterAddStepSuccess;

  /// 正在下发服务器端点并回传模块网络信息。
  const factory WaterMeterAddStep.configuring({
    required TTMeterScanModel scan,
    required int meterId,
  }) = WaterMeterAddStepConfiguring;

  /// [catOneFailed] 为真表示 `configureCatOne` 失败但仍按添加成功结束
  /// （spec §6.5：表已在云端注册，4G 配置失败不该让用户以为整次添加白做）。
  const factory WaterMeterAddStep.done({
    required int meterId,
    @Default(false) bool catOneFailed,
  }) = WaterMeterAddStepDone;

  const factory WaterMeterAddStep.failure({required AppException error}) =
      WaterMeterAddStepFailure;
}

@freezed
abstract class WaterMeterAddState with _$WaterMeterAddState {
  const WaterMeterAddState._();
  const factory WaterMeterAddState({
    @Default(WaterMeterAddStep.form()) WaterMeterAddStep step,
  }) = _WaterMeterAddState;
}
