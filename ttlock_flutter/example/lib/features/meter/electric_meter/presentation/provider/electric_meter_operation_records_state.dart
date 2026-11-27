import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/meter_operation_record_filter.dart';

part 'electric_meter_operation_records_state.freezed.dart';

@freezed
abstract class ElectricMeterOperationRecordsState
    with _$ElectricMeterOperationRecordsState {
  const factory ElectricMeterOperationRecordsState({
    @Default(PageState<MeterOperationRecordEntity>())
    PageState<MeterOperationRecordEntity> pageState,
    /// null ⇒ 「全部」（请求侧不传 `recordType`）。
    MeterOperationRecordFilter? filter,
  }) = _ElectricMeterOperationRecordsState;
}
