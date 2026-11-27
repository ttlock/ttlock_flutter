import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class QrCodeDetailArgs {
  const QrCodeDetailArgs({required this.lock, required this.qrCode});

  final LockEntity lock;
  final QrCodeEntity qrCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QrCodeDetailArgs && other.lock == lock && other.qrCode == qrCode;

  @override
  int get hashCode => Object.hash(lock, qrCode);
}
