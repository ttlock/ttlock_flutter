import 'package:ttlock_premise_flutter/models/enums.dart';

class TTLockScanModel {
  final String lockName;
  final String lockMac;
  final bool isInited;
  final bool isAllowUnlock;
  final int electricQuantity;
  final String lockVersion;
  final TTLockSwitchState lockSwitchState;
  final int rssi;
  final int oneMeterRssi;
  final int timestamp;

  const TTLockScanModel({
    required this.lockName,
    required this.lockMac,
    required this.isInited,
    required this.isAllowUnlock,
    required this.electricQuantity,
    required this.lockVersion,
    required this.lockSwitchState,
    required this.rssi,
    required this.oneMeterRssi,
    required this.timestamp,
  });

  factory TTLockScanModel.fromMap(Map<String, dynamic> map) {
    return TTLockScanModel(
      lockName: map['lockName'] as String,
      lockMac: map['lockMac'] as String,
      isInited: map['isInited'] as bool,
      isAllowUnlock: map['isAllowUnlock'] as bool,
      electricQuantity: map['electricQuantity'] as int,
      lockVersion: map['lockVersion'] as String,
      lockSwitchState: TTLockSwitchState.fromValue(map['lockSwitchState'] as int),
      rssi: map['rssi'] as int,
      oneMeterRssi: map['oneMeterRssi'] as int,
      timestamp: map['timestamp'] as int,
    );
  }
}

class TTGatewayScanModel {
  final String gatewayName;
  final String gatewayMac;
  final int rssi;
  final bool isDfuMode;
  final TTGatewayType type;

  const TTGatewayScanModel({
    required this.gatewayName,
    required this.gatewayMac,
    required this.rssi,
    required this.isDfuMode,
    required this.type,
  });

  factory TTGatewayScanModel.fromMap(Map<String, dynamic> map) {
    return TTGatewayScanModel(
      gatewayName: map['gatewayName'] as String,
      gatewayMac: map['gatewayMac'] as String,
      rssi: map['rssi'] as int,
      isDfuMode: map['isDfuMode'] as bool,
      type: TTGatewayType.fromValue(map['type'] as int),
    );
  }
}

class TTRemoteAccessoryScanModel {
  final String name;
  final String mac;
  final int rssi;
  final bool isMultifunctionalKeypad;
  final Map<String, dynamic> advertisementData;

  const TTRemoteAccessoryScanModel({
    required this.name,
    required this.mac,
    required this.rssi,
    this.isMultifunctionalKeypad = false,
    this.advertisementData = const {},
  });

  factory TTRemoteAccessoryScanModel.fromMap(Map<String, dynamic> map) {
    return TTRemoteAccessoryScanModel(
      name: map['name'] as String,
      mac: map['mac'] as String,
      rssi: map['rssi'] as int,
      isMultifunctionalKeypad: (map['isMultifunctionalKeypad'] as bool?) ?? false,
      advertisementData: (map['advertisementData'] as Map?)?.cast<String, dynamic>() ?? {},
    );
  }
}
