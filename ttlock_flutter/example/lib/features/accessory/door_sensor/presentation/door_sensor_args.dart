import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class DoorSensorDetailArgs {
  const DoorSensorDetailArgs({required this.lock, required this.item});

  final LockEntity lock;
  final DoorSensorEntity item;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoorSensorDetailArgs && other.lock == lock && other.item == item;

  @override
  int get hashCode => Object.hash(lock, item);
}
