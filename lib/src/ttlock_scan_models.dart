import 'package:ttlock_premise_flutter/src/tt_response.dart';
import 'package:ttlock_premise_flutter/src/ttlock_enums.dart';

/// Scan / system / accessory data models. Depend on TTResponse and enums.
class TTLockScanModel {
  String lockName = '';
  String lockMac = '';
  bool isInited = true;
  bool isAllowUnlock = false;
  int electricQuantity = -1;
  String lockVersion = '';
  TTLockSwitchState lockSwitchState = TTLockSwitchState.unknow;
  int rssi = -1;
  int oneMeterRssi = -1;
  int timestamp = 0;

  TTLockScanModel(Map map) {
    lockName = map[TTResponse.lockName];
    lockMac = map[TTResponse.lockMac];
    isInited = map[TTResponse.isInited];
    isAllowUnlock = map[TTResponse.isAllowUnlock];
    electricQuantity = map[TTResponse.electricQuantity];
    lockVersion = map[TTResponse.lockVersion];
    lockSwitchState =
        TTLockSwitchState.values[map[TTResponse.lockSwitchState]];
    rssi = map[TTResponse.rssi];
    oneMeterRssi = map[TTResponse.oneMeterRssi];
    timestamp = map[TTResponse.timestamp];
  }
}

class TTCycleModel {
  int weekDay = 0;
  int startTime = 0;
  int endTime = 0;

  Map toJson() {
    Map map = <String, dynamic>{};
    map["weekDay"] = weekDay;
    map["startTime"] = startTime;
    map["endTime"] = endTime;
    return map;
  }

  TTCycleModel(int weekDay, int startTime, int endTime) {
    this.weekDay = weekDay;
    this.startTime = startTime;
    this.endTime = endTime;
  }
}

class TTLockSystemModel {
  String? modelNum;
  String? hardwareRevision;
  String? firmwareRevision;
  int? electricQuantity;
  String? nbOperator;
  String? nbNodeId;
  String? nbCardNumber;
  String? nbRssi;
  String? lockData;

  TTLockSystemModel(Map map) {
    modelNum = map["modelNum"];
    hardwareRevision = map["hardwareRevision"];
    firmwareRevision = map["firmwareRevision"];
    electricQuantity = map["electricQuantity"];
    nbOperator = map["nbOperator"];
    nbNodeId = map["nbNodeId"];
    nbCardNumber = map["nbCardNumber"];
    nbRssi = map["nbRssi"];
    lockData = map["lockData"];
  }
}

class TTRemoteAccessoryScanModel {
  String name = '';
  String mac = '';
  int rssi = -1;
  bool isMultifunctionalKeypad = false;
  Map advertisementData = {};

  TTRemoteAccessoryScanModel(Map map) {
    name = map["name"];
    mac = map["mac"];
    rssi = map["rssi"];
    isMultifunctionalKeypad = map["isMultifunctionalKeypad"] ?? false;
    advertisementData = map["advertisementData"] ?? {};
  }
}

class TTDoorSensorScanModel {
  String name = '';
  String mac = '';
  int rssi = -1;

  TTDoorSensorScanModel(Map map) {
    name = map["name"];
    mac = map["mac"];
    rssi = map["rssi"];
  }
}

class TTGatewayScanModel {
  String gatewayName = '';
  String gatewayMac = '';
  int rssi = -1;
  bool isDfuMode = false;
  TTGatewayType? type;

  TTGatewayScanModel(Map map) {
    gatewayName = map["gatewayName"];
    gatewayMac = map["gatewayMac"];
    rssi = map["rssi"];
    type = TTGatewayType.values[map["type"]];
    isDfuMode = map["isDfuMode"];
  }
}

class TTNbAwakeTimeModel {
  TTNbAwakeTimeType type = TTNbAwakeTimeType.point;
  int minutes = 0;
}

class TTWifiInfoModel {
  String wifiMac = '';
  int wifiRssi = -127;

  TTWifiInfoModel(Map map) {
    wifiMac = map["wifiMac"];
    wifiRssi = map["wifiRssi"];
  }
}
