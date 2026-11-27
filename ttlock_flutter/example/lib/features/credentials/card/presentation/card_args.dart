import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class CardDetailArgs {
  const CardDetailArgs({required this.lock, required this.item});

  final LockEntity lock;
  final IdentityCardEntity item;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardDetailArgs && other.lock == lock && other.item == item;

  @override
  int get hashCode => Object.hash(lock, item);
}
