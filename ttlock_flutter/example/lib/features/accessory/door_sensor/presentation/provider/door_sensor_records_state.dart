import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';

part 'door_sensor_records_state.freezed.dart';

@freezed
abstract class DoorSensorRecordsState with _$DoorSensorRecordsState {
  const DoorSensorRecordsState._();
  const factory DoorSensorRecordsState({
    @Default(PageState<DoorSensorRecordEntity>())
    PageState<DoorSensorRecordEntity> pageState,
  }) = _DoorSensorRecordsState;
}
