import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_date_type.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';

part 'water_meter_usage_records_state.freezed.dart';

@freezed
abstract class WaterMeterUsageRecordsState with _$WaterMeterUsageRecordsState {
  const factory WaterMeterUsageRecordsState({
    @Default(<WaterMeterRecordEntity>[]) List<WaterMeterRecordEntity> records,
    @Default(MeterDateType.day) MeterDateType dateType,
  }) = _WaterMeterUsageRecordsState;
}
