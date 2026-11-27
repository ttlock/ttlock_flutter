import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class EkeyDetailArgs {
  const EkeyDetailArgs({required this.lock, required this.key});

  final LockEntity lock;
  final KeyEntity key;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EkeyDetailArgs && other.lock == lock && other.key == key;

  @override
  int get hashCode => Object.hash(lock, key);
}
