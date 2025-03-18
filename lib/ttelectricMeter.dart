import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

typedef TTElectricMeterScanCallback = void Function(
    TTElectricMeterScanModel scanModel);

typedef TTElectricMeterFailedCallback = void Function(
    TTElectricMeterErrorCode errorCode, String message);

class TTElectricmeter {
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
  static const String COMMAND_ELECTRIC_METER_CHARG = "electricMeterCharg";
  static const String COMMAND_ELECTRIC_METER_SET_MAX_POWER =
      "electricMeterSetMaxPower";
  static const String COMMAND_ELECTRIC_METER_GET_FEATURE_VALUE =
      "electricMeterGetFeatureValue";
  static const String COMMAND_ELECTRIC_METER_ENTER_UPGRADE_MODE =
      "electricMeterEnterUpgradeMode";

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

  static void connect(String mac, TTSuccessCallback callback,TTElectricMeterFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_CONNECT, map, callback, fail_callback: failedCallback);
  }

  static void disconnect(String mac) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_DISCONNECT, map, null);
  }

  /**
   * 
   *  Map paramMap = Map();
      paramMap["mac"] = sacnModel.mac;
      paramMap["price"] = sacnModel.price;
      paramMap["payMode"] = TTElectricMeterPayMode.postpaid.index;
      paramMap["name"] = sacnModel.name;
   */
  static void init(
    Map paramMap,
    TTSuccessCallback successCallback,
    TTElectricMeterFailedCallback failedCallback,
  ) {
    TTLock.invoke(COMMAND_ELECTRIC_METER_INIT, paramMap, successCallback,
        fail_callback: failedCallback);
  }

  static void delete(
    String mac,
    TTSuccessCallback successCallback,
    TTElectricMeterFailedCallback failedCallback,
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
    TTElectricMeterFailedCallback failedCallback,
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
    TTElectricMeterFailedCallback failedCallback,
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
    TTElectricMeterFailedCallback failedCallback,
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
    TTElectricMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_READ_DATA, map, successCallback,
        fail_callback: failedCallback);
  }

  static void setPayMode(
    String mac,
    String price,
    TTElectricMeterPayMode payMode,
    TTSuccessCallback successCallback,
    TTElectricMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["price"] = price;
    map["payMode"] = payMode.index;
    TTLock.invoke(COMMAND_ELECTRIC_METER_SET_PAY_MODE, map, successCallback,
        fail_callback: failedCallback);
  }

  static void recharg(
    String mac,
    String amount,
    String kwh,
    TTSuccessCallback successCallback,
    TTElectricMeterFailedCallback failedCallback,
  ) {
    Map map = Map();
    map["mac"] = mac;
    map["chargeKwh"] = kwh;
    map["chargeAmount"] = amount;
    TTLock.invoke(COMMAND_ELECTRIC_METER_CHARG, map, successCallback,
        fail_callback: failedCallback);
  }

  static void setMaxPower(
    String mac,
    int maxPower,
    TTSuccessCallback successCallback,
    TTElectricMeterFailedCallback failedCallback,
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
    TTElectricMeterFailedCallback failedCallback,
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
  late TTElectricMeterPayMode payMode;
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
  TTElectricMeterPayMode payMode = TTElectricMeterPayMode.postpaid;
  int scanTime = 0;

  TTElectricMeterScanModel(Map map) {
    this.name = map[TTResponse.name];
    this.mac = map[TTResponse.mac];
    this.isInited = map[TTResponse.isInited];
    this.totalKwh = map[TTResponse.totalKwh];
    this.remainderKwh = map[TTResponse.remainderKwh];
    this.voltage = map[TTResponse.voltage];
    this.electricCurrent = map[TTResponse.electricCurrent];
    this.rssi = map[TTResponse.rssi];
    this.onOff = map[TTResponse.onOff];
    this.payMode = map[TTResponse.payMode] == 0
        ? TTElectricMeterPayMode.postpaid
        : TTElectricMeterPayMode.prepaid;
    this.scanTime = map[TTResponse.scanTime];
  }
}

enum TTElectricMeterPayMode { postpaid, prepaid }

enum TTElectricMeterErrorCode {
  bluetoothPowerOff,
  connectTimeout,
  disconnect,
  netError,
  serverError,
  meterExistedInServer
}
