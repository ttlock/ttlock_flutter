class TTStandaloneDoorSensorScanModel {
  final String name;
  final String mac;
  final int rssi;
  final int? scanTime;

  const TTStandaloneDoorSensorScanModel({
    required this.name,
    required this.mac,
    required this.rssi,
    this.scanTime,
  });

  factory TTStandaloneDoorSensorScanModel.fromMap(Map<String, dynamic> map) {
    return TTStandaloneDoorSensorScanModel(
      name: map['name'] as String,
      mac: map['mac'] as String,
      rssi: map['rssi'] as int,
      scanTime: map['scanTime'] as int?,
    );
  }
}

class TTStandaloneDoorSensorInfo {
  final String? doorSensorData;
  final int? electricQuantity;
  final String? featureValue;
  final String? wifiMac;
  final String? modelNum;
  final String? hardwareRevision;
  final String? firmwareRevision;

  const TTStandaloneDoorSensorInfo({
    this.doorSensorData,
    this.electricQuantity,
    this.featureValue,
    this.wifiMac,
    this.modelNum,
    this.hardwareRevision,
    this.firmwareRevision,
  });

  factory TTStandaloneDoorSensorInfo.fromMap(Map<String, dynamic> map) {
    return TTStandaloneDoorSensorInfo(
      doorSensorData: map['doorSensorData'] as String?,
      electricQuantity: map['electricQuantity'] as int?,
      featureValue: map['featureValue'] as String?,
      wifiMac: map['wifiMac'] as String?,
      modelNum: map['modelNum'] as String?,
      hardwareRevision: map['hardwareRevision'] as String?,
      firmwareRevision: map['firmwareRevision'] as String?,
    );
  }
}

