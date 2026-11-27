import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/provider/wireless_keypad_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class WirelessKeypadAddArgs {
  const WirelessKeypadAddArgs({required this.lock, required this.type});
  final LockEntity lock;
  final WirelessKeypadType type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WirelessKeypadAddArgs &&
          other.lock == lock &&
          other.type == type;

  @override
  int get hashCode => Object.hash(lock, type);
}

class WirelessKeypadDetailArgs {
  const WirelessKeypadDetailArgs({required this.lock, required this.item});
  final LockEntity lock;
  final WirelessKeypadEntity item;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WirelessKeypadDetailArgs &&
          other.lock == lock &&
          other.item == item;

  @override
  int get hashCode => Object.hash(lock, item);
}
