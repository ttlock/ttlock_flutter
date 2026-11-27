import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';

part 'electric_meter_detail_state.freezed.dart';

@freezed
abstract class ElectricMeterDetailState with _$ElectricMeterDetailState {
  const ElectricMeterDetailState._();
  const factory ElectricMeterDetailState({
    required ElectricMeterEntity item,
    @Default(false) bool operating,
    AppException? error,
  }) = _ElectricMeterDetailState;

  /// 充值入口仅在预付费模式下显示（spec §6.1）。
  bool get canRecharge => item.payMode == MeterPayMode.prepaid;
}
