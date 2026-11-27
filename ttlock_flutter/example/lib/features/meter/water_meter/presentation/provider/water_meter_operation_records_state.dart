import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_operation_record_filter.dart';

part 'water_meter_operation_records_state.freezed.dart';

@freezed
abstract class WaterMeterOperationRecordsState
    with _$WaterMeterOperationRecordsState {
  const factory WaterMeterOperationRecordsState({
    @Default(PageState<MeterOperationRecordEntity>())
    PageState<MeterOperationRecordEntity> pageState,
    /// null ⇒ 「全部」（请求侧不传 `recordType`）。
    MeterOperationRecordFilter? filter,
  }) = _WaterMeterOperationRecordsState;
}
