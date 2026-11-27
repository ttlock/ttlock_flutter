import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';

/// 独立门磁详情页参数。
class StandaloneDoorSensorDetailArgs {
  const StandaloneDoorSensorDetailArgs({required this.item});

  final StandaloneDoorSensorEntity item;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StandaloneDoorSensorDetailArgs && other.item == item;

  @override
  int get hashCode => item.hashCode;
}
