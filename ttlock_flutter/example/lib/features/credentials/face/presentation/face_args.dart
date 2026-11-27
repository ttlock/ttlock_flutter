import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class FaceDetailArgs {
  const FaceDetailArgs({required this.lock, required this.item});

  final LockEntity lock;
  final FaceEntity item;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaceDetailArgs && other.lock == lock && other.item == item;

  @override
  int get hashCode => Object.hash(lock, item);
}
