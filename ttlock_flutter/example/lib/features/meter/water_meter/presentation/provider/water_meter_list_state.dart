import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';

part 'water_meter_list_state.freezed.dart';

@freezed
abstract class WaterMeterListState with _$WaterMeterListState {
  const WaterMeterListState._();
  const factory WaterMeterListState({
    @Default(PageState<WaterMeterEntity>())
    PageState<WaterMeterEntity> pageState,
  }) = _WaterMeterListState;
}
