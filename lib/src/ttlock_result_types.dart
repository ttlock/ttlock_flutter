import 'package:ttlock_premise_flutter/src/tt_response.dart';

/// Result of controlLock / activateLiftFloors.
class ControlLockResult {
  ControlLockResult({
    required this.lockTime,
    required this.electricQuantity,
    required this.uniqueId,
  });

  final int lockTime;
  final int electricQuantity;
  final int uniqueId;

  static ControlLockResult fromMap(Map<dynamic, dynamic> map) {
    return ControlLockResult(
      lockTime: map[TTResponse.lockTime] as int,
      electricQuantity: map[TTResponse.electricQuantity] as int,
      uniqueId: map[TTResponse.uniqueId] as int,
    );
  }
}

/// Result of getLockRemoteAccessoryElectricQuantity.
class AccessoryElectricQuantityResult {
  AccessoryElectricQuantityResult({
    required this.electricQuantity,
    required this.updateDate,
  });

  final int electricQuantity;
  final int updateDate;

  static AccessoryElectricQuantityResult fromMap(Map<dynamic, dynamic> map) {
    return AccessoryElectricQuantityResult(
      electricQuantity: map[TTResponse.electricQuantity] as int,
      updateDate: map[TTResponse.updateDate] as int,
    );
  }
}
