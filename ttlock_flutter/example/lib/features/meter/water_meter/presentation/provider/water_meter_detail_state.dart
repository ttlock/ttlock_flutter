import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';

part 'water_meter_detail_state.freezed.dart';

@freezed
abstract class WaterMeterDetailState with _$WaterMeterDetailState {
  const WaterMeterDetailState._();
  const factory WaterMeterDetailState({
    required WaterMeterEntity item,
    @Default(false) bool operating,
    AppException? error,
  }) = _WaterMeterDetailState;

  /// 充值入口仅在预付费模式下显示（spec §6.1）。
  bool get canRecharge => item.payMode == MeterPayMode.prepaid;
}
