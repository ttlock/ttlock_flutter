import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

class TTWaterMeter {
  static const String COMMAND_CONFIG_SERVER_WATER_METER =
      "waterMeterConfigServer";
  static const String COMMAND_START_SCAN_WATER_METER = "waterMeterStartScan";
  static const String COMMAND_STOP_SCAN_WATER_METER = "waterMeterStopScan";
  static const String COMMAND_WATER_METER_CONNECT = "waterMeterConnect";
  static const String COMMAND_WATER_METER_DISCONNECT = "waterMeterDisconnect";
  static const String COMMAND_WATER_METER_INIT = "waterMeterInit";
  static const String COMMAND_WATER_METER_DELETE = "waterMeterDelete";
  static const String COMMAND_WATER_METER_SET_POWER_ON_OFF =
      "waterMeterSetPowerOnOff";
  static const String COMMAND_WATER_METER_SET_REMAINING_M3 =
      "waterMeterSetRemainingM3";
  static const String COMMAND_WATER_METER_CLEAR_REMAINING_M3 =
      "waterMeterClearRemainingM3";
  static const String COMMAND_WATER_METER_READ_DATA = "waterMeterReadData";
  static const String COMMAND_WATER_METER_SET_PAY_MODE = "waterMeterSetPayMode";
  static const String COMMAND_WATER_METER_CHARGE = "waterMeterCharge";
  static const String COMMAND_WATER_METER_SET_TOTAL_USAGE =
      "waterMeterSetTotalUsage";
  static const String COMMAND_WATER_METER_GET_FEATURE_VALUE =
      "waterMeterGetFeatureValue";
  static const String COMMAND_WATER_METER_ENTER_UPGRADE_MODE =
      "waterMeterEnterUpgradeMode";
  static const String COMMAND_WATER_METER_GET_DEVICE_INFO =
      "waterMeterGetDeviceInfo";
  static const String COMMAND_WATER_METER_SUPPORT_FUNCTION =
      "waterMeterIsSupportFunction";

  static const String COMMAND_WATER_METER_CONFIG_APN = "waterMeterConfigApn";
  static const String COMMAND_WATER_METER_CONFIG_METER_SERVER =
      "waterMeterConfigMeterServer";
  static const String COMMAND_WATER_METER_RESET = "waterMeterReset";

  static void configServer(WaterMeterServerParamMode paramMode) {
    Map map = Map();
    map["url"] = paramMode.url;
    map["clientId"] = paramMode.clientId;
    map["accessToken"] = paramMode.accessToken;
    TTLock.invoke(COMMAND_CONFIG_SERVER_WATER_METER, map, null);
  }

  static void startScan(TTWaterMeterScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_WATER_METER, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_WATER_METER, null, null);
  }

  static void connect(String mac, TTSuccessCallback callback,
      TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_WATER_METER_CONNECT, map, callback,
        fail_callback: failedCallback);
  }

  static void disconnect(String mac) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_WATER_METER_DISCONNECT, map, null);
  }

  /**
   * 
   *  Map paramMap = Map();
      paramMap["mac"] = scanModel.mac;
      paramMap["price"] = scanModel.price;
      paramMap["payMode"] = TTMeterPayMode.postpaid.index;
      paramMap["number"] = scanModel.name;
   */
  static void init(
    Map paramMap,
    TTWaterMeterSuccessResultCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    TTLock.invoke(COMMAND_WATER_METER_INIT, paramMap, successCallback,
        fail_callback: failedCallback);
  }

  static void delete(
    String mac,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_WATER_METER_DELETE, map, successCallback,
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
    TTLock.invoke(COMMAND_WATER_METER_SET_POWER_ON_OFF, map, successCallback,
        fail_callback: failedCallback);
  }

  static void setRemainderM3(
    String mac,
    String remainderM3,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["remainderM3"] = remainderM3;
    TTLock.invoke(COMMAND_WATER_METER_SET_REMAINING_M3, map, successCallback,
        fail_callback: failedCallback);
  }

  static void clearRemainderM3(
    String mac,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;

    TTLock.invoke(COMMAND_WATER_METER_CLEAR_REMAINING_M3, map, successCallback,
        fail_callback: failedCallback);
  }

  static void readData(
    String mac,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_WATER_METER_READ_DATA, map, successCallback,
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
    TTLock.invoke(COMMAND_WATER_METER_SET_PAY_MODE, map, successCallback,
        fail_callback: failedCallback);
  }

  static void recharge(
    String mac,
    String amount,
    String m3,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["m3"] = m3;
    map["chargeAmount"] = amount;
    TTLock.invoke(COMMAND_WATER_METER_CHARGE, map, successCallback,
        fail_callback: failedCallback);
  }

  static void setTotalUsage(
    String mac,
    double totalM3,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["totalM3"] = totalM3.toString();
    TTLock.invoke(COMMAND_WATER_METER_SET_TOTAL_USAGE, map, successCallback,
        fail_callback: failedCallback);
  }

  static void readFeatureValue(
    String mac,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_WATER_METER_GET_FEATURE_VALUE, map, successCallback,
        fail_callback: failedCallback);
  }

  // static void enterUpgradeMode(
  //   String mac,
  //   TTSuccessCallback successCallback,
  //   TTMeterFailedCallback failedCallback,
  // ) {
  //   Map map = Map();
  //   map["mac"] = mac;
  //   TTLock.invoke(
  //       COMMAND_WATER_METER_ENTER_UPGRADE_MODE, map, successCallback,
  //       fail: failedCallback);
  // }

  static void isSupportFunction(
    String featureValue,
    TTWaterMeterFeature waterMeterFeature,
    TTFunctionSupportCallback callback,
  ) {
    Map map = Map();
    map[TTResponse.featureValue] = featureValue;
    map[TTResponse.supportFunction] = waterMeterFeature.index;
    TTLock.invoke(
      COMMAND_WATER_METER_SUPPORT_FUNCTION,
      map,
      callback,
    );
  }

  static void getWaterMeterDeviceInfo(
    String mac,
    TTWaterMeterDeviceInfoCallback callback,
    TTMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    TTLock.invoke(COMMAND_WATER_METER_GET_DEVICE_INFO, map, callback,
        fail_callback: failedCallback);
  }

  static void configApn(String mac, String apn, TTSuccessCallback callback,
      TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.apn] = apn;
    TTLock.invoke(COMMAND_WATER_METER_CONFIG_APN, map, callback,
        fail_callback: failedCallback);
  }

  static void configMeterServer(String mac, String ip, String port,
      TTSuccessCallback callback, TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.ip] = ip;
    map[TTResponse.port] = port;
    TTLock.invoke(COMMAND_WATER_METER_CONFIG_METER_SERVER, map, callback,
        fail_callback: failedCallback);
  }

  static void resetWaterMeter(
      String mac, TTSuccessCallback callback, TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    TTLock.invoke(COMMAND_WATER_METER_RESET, map, callback,
        fail_callback: failedCallback);
  }
}

class WaterMeterServerParamMode {
  late String url;
  late String clientId;
  late String accessToken;
}

class WaterMeterInitParamModel {
  late String mac;
  late String name;
  late String price;
  late TTMeterPayMode payMode;
}

class TTWaterMeterScanModel {
  String name = '';
  String mac = '';
  bool isInited = true;
  String totalM3 = '';
  String remainderM3 = '';
  bool onOff = true;
  int rssi = -1;
  int magneticInterference = 0;
  int electricQuantity = -1;
  int waterValveFailure = 0;
  TTMeterPayMode payMode = TTMeterPayMode.postpaid;
  int scanTime = 0;

  String executeResponse = '';

  TTWaterMeterScanModel(Map map) {
    this.name = map[TTResponse.name];
    this.mac = map[TTResponse.mac];
    this.isInited = map[TTResponse.isInited] ?? true;
    this.totalM3 = map[TTResponse.totalM3] ?? "";
    this.remainderM3 = map[TTResponse.remainderM3] ?? "";
    this.electricQuantity = map[TTResponse.electricQuantity] ?? -1;
    this.waterValveFailure = map[TTResponse.waterValveFailure] ?? 0;
    this.rssi = map[TTResponse.rssi] ?? -1;
    this.onOff = map[TTResponse.onOff] ?? true;
    this.payMode = map[TTResponse.payMode] == 0
        ? TTMeterPayMode.postpaid
        : TTMeterPayMode.prepaid;
    this.scanTime =
        map[TTResponse.scanTime] ?? DateTime.now().millisecondsSinceEpoch;
    this.executeResponse = map[TTResponse.executeResponse] ?? "";
  }
}

class TTWaterDeviceInfoModel {
  String modelNum = '';
  String hardwareRevision = '';
  String firmwareRevision = '';
  String catOneOperator = '';
  String catOneNodeId = '';
  String catOneCardNumber = '';
  String catOneRssi = '';
  String catOneImsi = '';

  TTWaterDeviceInfoModel(Map map) {
    this.modelNum = map[TTResponse.modelNum]??'';
    this.hardwareRevision = map[TTResponse.hardwareRevision]??'';
    this.firmwareRevision = map[TTResponse.firmwareRevision]??'';
    this.catOneOperator = map[TTResponse.catOneOperator]??'';
    this.catOneNodeId = map[TTResponse.catOneNodeId]??'';
    this.catOneCardNumber = map[TTResponse.catOneCardNumber]??'';
    this.catOneRssi = map[TTResponse.catOneRssi]??'';
    this.catOneImsi = map[TTResponse.catOneImsi]??'';
  }
}

enum TTWaterMeterFeature { TTWaterMeterFeatureCatOne }
