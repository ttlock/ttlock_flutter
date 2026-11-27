import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_date_type.dart';

part 'electric_meter_usage_records_state.freezed.dart';

@freezed
abstract class ElectricMeterUsageRecordsState
    with _$ElectricMeterUsageRecordsState {
  const factory ElectricMeterUsageRecordsState({
    @Default(<ElectricMeterUsageRecordEntity>[])
    List<ElectricMeterUsageRecordEntity> records,
    @Default(MeterDateType.day) MeterDateType dateType,
  }) = _ElectricMeterUsageRecordsState;
}
