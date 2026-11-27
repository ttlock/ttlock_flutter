import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class RemoteDetailArgs {
  const RemoteDetailArgs({required this.lock, required this.item});

  final LockEntity lock;
  final RemoteEntity item;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RemoteDetailArgs && other.lock == lock && other.item == item;

  @override
  int get hashCode => Object.hash(lock, item);
}
