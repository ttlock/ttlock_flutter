import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class FingerprintDetailArgs {
  const FingerprintDetailArgs({required this.lock, required this.item});

  final LockEntity lock;
  final FingerprintEntity item;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FingerprintDetailArgs &&
          other.lock == lock &&
          other.item == item;

  @override
  int get hashCode => Object.hash(lock, item);
}
