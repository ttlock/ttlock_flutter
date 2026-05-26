import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_door_sensor.freezed.dart';
part 'saved_door_sensor.g.dart';

@freezed
abstract class SavedDoorSensor with _$SavedDoorSensor {
  const factory SavedDoorSensor({
    required String name,
    required String mac,
    required String boundLockMac,
    required DateTime initializedAt,
  }) = _SavedDoorSensor;

  factory SavedDoorSensor.fromJson(Map<String, dynamic> json) =>
      _$SavedDoorSensorFromJson(json);
}
