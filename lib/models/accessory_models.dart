class RemoteKeypadInitResult {
  final int electricQuantity;
  final String wirelessKeypadFeatureValue;

  const RemoteKeypadInitResult({
    required this.electricQuantity,
    required this.wirelessKeypadFeatureValue,
  });

  factory RemoteKeypadInitResult.fromMap(Map<String, dynamic> map) {
    return RemoteKeypadInitResult(
      electricQuantity: map['electricQuantity'] as int,
      wirelessKeypadFeatureValue: map['wirelessKeypadFeatureValue'] as String,
    );
  }
}

class MultifunctionalKeypadInitResult {
  final int electricQuantity;
  final String wirelessKeypadFeatureValue;
  final int slotNumber;
  final int slotLimit;
  final String? modelNum;
  final String? hardwareRevision;
  final String? firmwareRevision;

  const MultifunctionalKeypadInitResult({
    required this.electricQuantity,
    required this.wirelessKeypadFeatureValue,
    required this.slotNumber,
    required this.slotLimit,
    this.modelNum,
    this.hardwareRevision,
    this.firmwareRevision,
  });

  factory MultifunctionalKeypadInitResult.fromMap(Map<String, dynamic> map) {
    final sysInfo = (map['systemInfoModel'] as Map?)?.cast<String, dynamic>() ?? {};
    return MultifunctionalKeypadInitResult(
      electricQuantity: map['electricQuantity'] as int,
      wirelessKeypadFeatureValue: map['wirelessKeypadFeatureValue'] as String,
      slotNumber: map['slotNumber'] as int,
      slotLimit: map['slotLimit'] as int,
      modelNum: sysInfo['modelNum'] as String?,
      hardwareRevision: sysInfo['hardwareRevision'] as String?,
      firmwareRevision: sysInfo['firmwareRevision'] as String?,
    );
  }
}
