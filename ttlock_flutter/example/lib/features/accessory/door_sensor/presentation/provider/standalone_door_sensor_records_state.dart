import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';

part 'standalone_door_sensor_records_state.freezed.dart';

@freezed
abstract class StandaloneDoorSensorRecordsState
    with _$StandaloneDoorSensorRecordsState {
  const StandaloneDoorSensorRecordsState._();
  const factory StandaloneDoorSensorRecordsState({
    @Default(PageState<StandaloneDoorSensorRecordEntity>())
    PageState<StandaloneDoorSensorRecordEntity> pageState,
  }) = _StandaloneDoorSensorRecordsState;
}
