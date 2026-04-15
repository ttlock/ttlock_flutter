import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

class TTStandaloneDoorSensor {
  static const String COMMAND_START_SCAN_STANDALONE_DOOR_SENSOR =
      "standaloneDoorSensorStartScan";
  static const String COMMAND_STOP_SCAN_STANDALONE_DOOR_SENSOR =
      "standaloneDoorSensorStopScan";
  static const String COMMAND_INIT_STANDALONE_DOOR_SENSOR =
      "standaloneDoorSensorInit";
  static const String COMMAND_STANDALONE_DOOR_GET_FEATURE_VALUE =
      "standaloneDoorGetFeatureValue";
  static const String COMMAND_STANDALONE_DOOR_SUPPORT_FUNCTION =
      "standaloneDoorIsSupportFunction";

  static void startScan(TTDoorSensorScanCallback scanCallback) {
    TTLock.invoke(
        COMMAND_START_SCAN_STANDALONE_DOOR_SENSOR, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_STANDALONE_DOOR_SENSOR, null, null);
  }

  static void init(
    String mac,
    Map info,
    TTStandaloneDoorSensorInitSuccessResultCallback callback,
    TTStandaloneDoorSensorFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.standaloneInfoStr] = convert.jsonEncode(info);
    TTLock.invoke(COMMAND_INIT_STANDALONE_DOOR_SENSOR, map, callback,
        fail_callback: failedCallback);
  }

  static void readFeatureValue(
    String mac,
    TTStandaloneDoorSensorGetFeatureValueCallback successCallback,
    TTStandaloneDoorSensorFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(
        COMMAND_STANDALONE_DOOR_GET_FEATURE_VALUE, map, successCallback,
        fail_callback: failedCallback);
  }

  static void isSupportFunction(
    String featureValue,
    TTStandaloneDoorSensorFeature standaloneDoorSensorFeature,
    TTFunctionSupportCallback callback,
  ) {
    Map map = Map();
    map[TTResponse.standaloneDoorFeature] = featureValue;
    map[TTResponse.supportFunction] = standaloneDoorSensorFeature.index;
    TTLock.invoke(
      COMMAND_STANDALONE_DOOR_SUPPORT_FUNCTION,
      map,
      callback,
    );
  }
}

class TTStandaloneDoorSensorInfo {
  String doorSensorData = '';
  int electricQuantity = 0;
  String featureValue = '';
  String wifiMac = '';
  String modelNum = '';
  String hardwareRevision = '';
  String firmwareRevision = '';

  TTStandaloneDoorSensorInfo(Map map) {
    this.doorSensorData = map[TTResponse.doorSensorData];
    this.electricQuantity = map[TTResponse.electricQuantity] ?? -1;
    this.featureValue = map[TTResponse.featureValue];
    this.wifiMac = map[TTResponse.wifiMac];
    this.modelNum = map[TTResponse.modelNum] ?? '';
    this.hardwareRevision = map[TTResponse.hardwareRevision] ?? '';
    this.firmwareRevision = map[TTResponse.firmwareRevision] ?? '';
  }
}
