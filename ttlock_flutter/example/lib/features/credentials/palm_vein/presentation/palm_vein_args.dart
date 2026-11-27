import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class PalmVeinDetailArgs {
  const PalmVeinDetailArgs({required this.lock, required this.item});

  final LockEntity lock;
  final PalmVeinEntity item;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PalmVeinDetailArgs && other.lock == lock && other.item == item;

  @override
  int get hashCode => Object.hash(lock, item);
}
