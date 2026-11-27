import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';

part 'electric_meter_list_state.freezed.dart';

@freezed
abstract class ElectricMeterListState with _$ElectricMeterListState {
  const ElectricMeterListState._();
  const factory ElectricMeterListState({
    @Default(PageState<ElectricMeterEntity>())
    PageState<ElectricMeterEntity> pageState,
  }) = _ElectricMeterListState;
}
