class TTMeterScanModel {
  final String name;
  final String mac;
  final int rssi;

  const TTMeterScanModel({
    required this.name,
    required this.mac,
    required this.rssi,
  });

  factory TTMeterScanModel.fromMap(Map<String, dynamic> map) {
    return TTMeterScanModel(
      name: map['name'] as String,
      mac: map['mac'] as String,
      rssi: map['rssi'] as int,
    );
  }
}

class TTWaterMeterInitResult {
  final String waterMeterId;
  final String? featureValue;

  const TTWaterMeterInitResult({
    required this.waterMeterId,
    this.featureValue,
  });

  factory TTWaterMeterInitResult.fromMap(Map<String, dynamic> map) {
    return TTWaterMeterInitResult(
      waterMeterId: map['waterMeterId'] as String,
      featureValue: map['featureValue'] as String?,
    );
  }
}

class TTElectricMeterInitResult {
  final String electricMeterId;
  final String? featureValue;

  const TTElectricMeterInitResult({
    required this.electricMeterId,
    this.featureValue,
  });

  factory TTElectricMeterInitResult.fromMap(Map<String, dynamic> map) {
    return TTElectricMeterInitResult(
      electricMeterId: map['electricMeterId'] as String,
      featureValue: map['featureValue'] as String?,
    );
  }
}

