// import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

import 'package:ttlock_flutter/ttlock.dart';

class TTElectricMeter {
  static const String COMMAND_CONFIG_SERVER_ELECTRIC_METER =
      "electricMeterConfigServer";
  static const String COMMAND_START_SCAN_ELECTRIC_METER =
      "electricMeterStartScan";
  static const String COMMAND_STOP_SCAN_ELECTRIC_METER =
      "electricMeterStopScan";
  static const String COMMAND_ELECTRIC_METER_CONNECT = "electricMeterConnect";
  static const String COMMAND_ELECTRIC_METER_DISCONNECT =
      "electricMeterDisconnect";
  static const String COMMAND_ELECTRIC_METER_INIT = "electricMeterInit";
  static const String COMMAND_ELECTRIC_METER_DELETE = "electricMeterDelete";
  static const String COMMAND_ELECTRIC_METER_SET_POWER_ON_OFF =
      "electricMeterSetPowerOnOff";
  static const String COMMAND_ELECTRIC_METER_SET_REMAINING_ELECTRICITY =
      "electricMeterSetRemainingElectricity";
  static const String COMMAND_ELECTRIC_METER_CLEAR_REMAINING_ELECTRICITY =
      "electricMeterClearRemainingElectricity";
  static const String COMMAND_ELECTRIC_METER_READ_DATA =
      "electricMeterReadData";
  static const String COMMAND_ELECTRIC_METER_SET_PAY_MODE =
      "electricMeterSetPayMode";
  static const String COMMAND_ELECTRIC_METER_CHARGE = "electricMeterCharg";
  static const String COMMAND_ELECTRIC_METER_SET_MAX_POWER =
      "electricMeterSetMaxPower";
  static const String COMMAND_ELECTRIC_METER_GET_FEATURE_VALUE =
      "electricMeterGetFeatureValue";
  static const String COMMAND_ELECTRIC_METER_ENTER_UPGRADE_MODE =
      "electricMeterEnterUpgradeMode";

  static const String COMMAND_ELECTRIC_METER_GET_DEVICE_INFO =
      "electricMeterGetDeviceInfo";
  static const String COMMAND_ELECTRIC_METER_SUPPORT_FUNCTION =
      "electricMeterIsSupportFunction";

  static const String COMMAND_ELECTRIC_METER_CONFIG_APN =
      "electricMeterConfigApn";
  static const String COMMAND_ELECTRIC_METER_CONFIG_METER_SERVER =
      "electricMeterConfigMeterServer";
  static const String COMMAND_ELECTRIC_METER_RESET = "electricMeterReset";

  static void configServer(ElectricMeterServerParamMode paramMode) {
    Map map = Map();
    map["url"] = paramMode.url;
    map["clientId"] = paramMode.clientId;
    map["accessToken"] = paramMode.accessToken;
    TTLock.invoke(COMMAND_CONFIG_SERVER_ELECTRIC_METER, map, null);
  }

  static void startScan(TTElectricMeterScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_ELECTRIC_METER, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_ELECTRIC_METER, null, null);
  }

  static void connect(String mac, TTSuccessCallback callback,
      TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_CONNECT, map, callback,
        fail_callback: failedCallback);
  }

  static void disconnect(String mac) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_DISCONNECT, map, null);
  }

  /**
   * 
   *  Map paramMap = Map();
      paramMap["mac"] = scanModel.mac;
      paramMap["price"] = scanModel.price;
      paramMap["payMode"] = TTElectricMeterPayMode.postpaid.index;
      paramMap["number"] = scanModel.name;
   */
  static void init(
    Map paramMap,
    TTElectricMeterSuccessResultCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    TTLock.invoke(COMMAND_ELECTRIC_METER_INIT, paramMap, successCallback,
        fail_callback: failedCallback);
  }

  static void delete(
    String mac,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_DELETE, map, successCallback,
        fail_callback: failedCallback);
  }

  static void setPowerOnOff(
    String mac,
    bool isOn,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["isOn"] = isOn;
    TTLock.invoke(COMMAND_ELECTRIC_METER_SET_POWER_ON_OFF, map, successCallback,
        fail_callback: failedCallback);
  }

  static void setRemainderKwh(
    String mac,
    String remainderKwh,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["remainderKwh"] = remainderKwh;
    TTLock.invoke(
        COMMAND_ELECTRIC_METER_SET_REMAINING_ELECTRICITY, map, successCallback,
        fail_callback: failedCallback);
  }

  static void clearRemainderKwh(
    String mac,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;

    TTLock.invoke(COMMAND_ELECTRIC_METER_CLEAR_REMAINING_ELECTRICITY, map,
        successCallback,
        fail_callback: failedCallback);
  }

  static void readData(
    String mac,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_READ_DATA, map, successCallback,
        fail_callback: failedCallback);
  }

  static void setPayMode(
    String mac,
    String price,
    TTMeterPayMode payMode,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["price"] = price;
    map["payMode"] = payMode.index;
    TTLock.invoke(COMMAND_ELECTRIC_METER_SET_PAY_MODE, map, successCallback,
        fail_callback: failedCallback);
  }

  static void recharge(
    String mac,
    String amount,
    String kwh,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["chargeKwh"] = kwh;
    map["chargeAmount"] = amount;
    TTLock.invoke(COMMAND_ELECTRIC_METER_CHARGE, map, successCallback,
        fail_callback: failedCallback);
  }

  static void setMaxPower(
    String mac,
    int maxPower,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["maxPower"] = maxPower;
    TTLock.invoke(COMMAND_ELECTRIC_METER_SET_MAX_POWER, map, successCallback,
        fail_callback: failedCallback);
  }

  static void readFeatureValue(
    String mac,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(
        COMMAND_ELECTRIC_METER_GET_FEATURE_VALUE, map, successCallback,
        fail_callback: failedCallback);
  }

  // static void enterUpgradeMode(
  //   String mac,
  //   TTSuccessCallback successCallback,
  //   TTElectricMeterFailedCallback failedCallback,
  // ) {
  //   Map map = Map();
  //   map["mac"] = mac;
  //   TTLock.invoke(
  //       COMMAND_ELECTRIC_METER_ENTER_UPGRADE_MODE, map, successCallback,
  //       fail: failedCallback);
  // }

  static void isSupportFunction(
    String featureValue,
    TTElectricMeterFeature electricMeterFeature,
    TTFunctionSupportCallback callback,
  ) {
    Map map = Map();
    map[TTResponse.featureValue] = featureValue;
    map[TTResponse.supportFunction] = electricMeterFeature.index;
    TTLock.invoke(
      COMMAND_ELECTRIC_METER_SUPPORT_FUNCTION,
      map,
      callback,
    );
  }

  static void getElectricMeterDeviceInfo(
    String mac,
    TTElectricMeterDeviceInfoCallback callback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_GET_DEVICE_INFO, map, callback,
        fail_callback: failedCallback);
  }

  static void configApn(String mac, String apn, TTSuccessCallback callback,
      TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.apn] = apn;
    TTLock.invoke(COMMAND_ELECTRIC_METER_CONFIG_APN, map, callback,
        fail_callback: failedCallback);
  }

  static void configElectricMeterServer(String mac, String ip, String port,
      TTSuccessCallback callback, TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.ip] = ip;
    map[TTResponse.port] = port;
    TTLock.invoke(COMMAND_ELECTRIC_METER_CONFIG_METER_SERVER, map, callback,
        fail_callback: failedCallback);
  }

  static void resetElectricMeter(String mac, TTSuccessCallback callback,
      TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_RESET, map, callback,
        fail_callback: failedCallback);
  }
}

class ElectricMeterServerParamMode {
  late String url;
  late String clientId;
  late String accessToken;
}

class ElectricMeterInitParamModel {
  late String mac;
  late String name;
  late String price;
  late TTMeterPayMode payMode;
}

class TTElectricMeterScanModel {
  String name = '';
  String mac = '';
  bool isInited = true;
  String totalKwh = '';
  String remainderKwh = '';
  String voltage = '';
  String electricCurrent = '';
  bool onOff = true;
  int rssi = -1;
  TTMeterPayMode payMode = TTMeterPayMode.postpaid;
  int scanTime = 0;
  String executeResponse = '';

  TTElectricMeterScanModel(Map map) {
    this.name = map[TTResponse.name];
    this.mac = map[TTResponse.mac];
    this.isInited = map[TTResponse.isInited];
    this.totalKwh = map[TTResponse.totalKwh] ?? '';
    this.remainderKwh = map[TTResponse.remainderKwh] ?? '';
    this.voltage = map[TTResponse.voltage] ?? '';
    this.electricCurrent = map[TTResponse.electricCurrent] ?? '';
    this.rssi = map[TTResponse.rssi] ?? -1;
    this.onOff = map[TTResponse.onOff] ?? true;
    this.payMode = map[TTResponse.payMode] == 0
        ? TTMeterPayMode.postpaid
        : TTMeterPayMode.prepaid;
    this.scanTime = map[TTResponse.scanTime] ?? 0;
    this.executeResponse = map[TTResponse.executeResponse] ?? '';
  }
}

enum TTElectricMeterFeature {
  TTElectricMeterFeatureCatOne,
  TTElectricMeterFeatureTelink
}

class TTElectricMeterDeviceInfoModel {
  String modelNum = '';
  String hardwareRevision = '';
  String firmwareRevision = '';
  String catOneOperator = '';
  String catOneNodeId = '';
  String catOneCardNumber = '';
  String catOneRssi = '';
  String catOneImsi = '';

  TTElectricMeterDeviceInfoModel(Map map) {
    this.modelNum = map[TTResponse.modelNum] ?? '';
    this.hardwareRevision = map[TTResponse.hardwareRevision] ?? '';
    this.firmwareRevision = map[TTResponse.firmwareRevision] ?? '';
    this.catOneOperator = map[TTResponse.catOneOperator] ?? '';
    this.catOneNodeId = map[TTResponse.catOneNodeId] ?? '';
    this.catOneCardNumber = map[TTResponse.catOneCardNumber] ?? '';
    this.catOneRssi = (map[TTResponse.catOneRssi] ?? '').toString();
    this.catOneImsi = map[TTResponse.catOneImsi] ?? '';
  }
}
