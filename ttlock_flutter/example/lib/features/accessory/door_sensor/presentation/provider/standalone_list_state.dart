import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';

part 'standalone_list_state.freezed.dart';

@freezed
abstract class StandaloneDoorSensorListState
    with _$StandaloneDoorSensorListState {
  const StandaloneDoorSensorListState._();

  const factory StandaloneDoorSensorListState({
    @Default(PageState<StandaloneDoorSensorEntity>())
    PageState<StandaloneDoorSensorEntity> pageState,
  }) = _StandaloneDoorSensorListState;
}
