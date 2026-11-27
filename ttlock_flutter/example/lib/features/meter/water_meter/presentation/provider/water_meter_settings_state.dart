import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';

part 'water_meter_settings_state.freezed.dart';

@freezed
abstract class WaterMeterSettingsState with _$WaterMeterSettingsState {
  const WaterMeterSettingsState._();
  const factory WaterMeterSettingsState({
    required WaterMeterEntity item,
    /// null ⇒ 固件信息不可用（spec §9 风险 12），该区显示占位。
    MeterFirmwareEntity? firmware,
    /// 服务端 `detail.featureValue` 判定（spec §5.3），决定 4G 网络入口显隐。
    @Default(false) bool isCatOne,
    @Default(false) bool operating,
    AppException? error,
  }) = _WaterMeterSettingsState;

  /// 电价调整仅在预付费模式显示（spec §6.2）。
  bool get canEditPrice => item.payMode == MeterPayMode.prepaid;

  /// 清零＝清除剩余水量，仅预付费模式可用（spec §6.2、§9 风险 1）。
  bool get canClear => item.payMode == MeterPayMode.prepaid;
}
