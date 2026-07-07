import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_standalone_door_sensor.freezed.dart';
part 'saved_standalone_door_sensor.g.dart';

@freezed
abstract class SavedStandaloneDoorSensor with _$SavedStandaloneDoorSensor {
  const factory SavedStandaloneDoorSensor({
    required String name,
    required String mac,
    String? doorSensorData,
    String? featureValue,
    String? modelNum,
    int? electricQuantity,
    required DateTime initializedAt,
  }) = _SavedStandaloneDoorSensor;

  factory SavedStandaloneDoorSensor.fromJson(Map<String, dynamic> json) =>
      _$SavedStandaloneDoorSensorFromJson(json);
}
