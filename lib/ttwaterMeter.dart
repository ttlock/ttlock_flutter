import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

/// A class for interacting with a TTlock water meter accessory.
///
/// This class provides methods to scan for, connect to, and manage water meters.
class TTWaterMeter {
  /// Command to configure the server for the water meter.
  static const String COMMAND_CONFIG_SERVER_WATER_METER =
      "waterMeterConfigServer";
  /// Command to start scanning for water meters.
  static const String COMMAND_START_SCAN_WATER_METER = "waterMeterStartScan";
  /// Command to stop scanning for water meters.
  static const String COMMAND_STOP_SCAN_WATER_METER = "waterMeterStopScan";
  /// Command to connect to a water meter.
  static const String COMMAND_WATER_METER_CONNECT = "waterMeterConnect";
  /// Command to disconnect from a water meter.
  static const String COMMAND_WATER_METER_DISCONNECT = "waterMeterDisconnect";
  /// Command to initialize a water meter.
  static const String COMMAND_WATER_METER_INIT = "waterMeterInit";
  /// Command to delete a water meter.
  static const String COMMAND_WATER_METER_DELETE = "waterMeterDelete";
  /// Command to set the power on/off for a water meter.
  static const String COMMAND_WATER_METER_SET_POWER_ON_OFF =
      "waterMeterSetPowerOnOff";
  /// Command to set the remaining cubic meters for a water meter.
  static const String COMMAND_WATER_METER_SET_REMAINING_M3 =
      "waterMeterSetRemainingM3";
  /// Command to clear the remaining cubic meters for a water meter.
  static const String COMMAND_WATER_METER_CLEAR_REMAINING_M3 =
      "waterMeterClearRemainingM3";
  /// Command to read data from a water meter.
  static const String COMMAND_WATER_METER_READ_DATA = "waterMeterReadData";
  /// Command to set the pay mode for a water meter.
  static const String COMMAND_WATER_METER_SET_PAY_MODE = "waterMeterSetPayMode";
  /// Command to charge a water meter.
  static const String COMMAND_WATER_METER_CHARGE = "waterMeterCharge";
  /// Command to set the total usage for a water meter.
  static const String COMMAND_WATER_METER_SET_TOTAL_USAGE =
      "waterMeterSetTotalUsage";
  /// Command to get the feature value of a water meter.
  static const String COMMAND_WATER_METER_GET_FEATURE_VALUE =
      "waterMeterGetFeatureValue";
  /// Command to enter upgrade mode for a water meter.
  static const String COMMAND_WATER_METER_ENTER_UPGRADE_MODE =
      "waterMeterEnterUpgradeMode";

  /// Configures the server parameters for the water meter.
  ///
  /// [paramMode] The server parameters to configure.
  static void configServer(WaterMeterServerParamMode paramMode) {
    Map map = Map();
    map["url"] = paramMode.url;
    map["clientId"] = paramMode.clientId;
    map["accessToken"] = paramMode.accessToken;
    TTLock.invoke(COMMAND_CONFIG_SERVER_WATER_METER, map, null);
  }

  /// Starts scanning for nearby water meters.
  ///
  /// [scanCallback] A callback that will be invoked for each water meter found.
  static void startScan(TTWaterMeterScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_WATER_METER, null, scanCallback);
  }

  /// Stops the water meter scan.
  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_WATER_METER, null, null);
  }

  /// Connects to a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [callback] A callback for when the connection is successful.
  /// [failedCallback] A callback for when the connection fails.
  static void connect(String mac, TTSuccessCallback callback,
      TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_WATER_METER_CONNECT, map, callback,
        fail_callback: failedCallback);
  }

  /// Disconnects from a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  static void disconnect(String mac) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_WATER_METER_DISCONNECT, map, null);
  }

  /// Initializes a water meter.
  ///
  /// [paramMap] A map of parameters for initialization, including `mac`, `price`, `payMode`, and `name`.
  /// [successCallback] A callback for when the initialization is successful.
  /// [failedCallback] A callback for when the initialization fails.
  static void init(
    Map paramMap,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    TTLock.invoke(COMMAND_WATER_METER_INIT, paramMap, successCallback,
        fail_callback: failedCallback);
  }

  /// Deletes a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [successCallback] A callback for when the deletion is successful.
  /// [failedCallback] A callback for when the deletion fails.
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

  /// Sets the power on or off for a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [isOn] A boolean indicating whether to turn the power on or off.
  /// [successCallback] A callback for when the power is set successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Sets the remaining cubic meters on a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [remainderM3] The remaining cubic meters to set.
  /// [successCallback] A callback for when the value is set successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Clears the remaining cubic meters on a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [successCallback] A callback for when the value is cleared successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Reads data from a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [successCallback] A callback for when the data is read successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Sets the pay mode for a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [price] The price per cubic meter.
  /// [payMode] The pay mode to set.
  /// [successCallback] A callback for when the pay mode is set successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Recharges a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [amount] The amount to recharge.
  /// [m3] The cubic meters to recharge.
  /// [successCallback] A callback for when the recharge is successful.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Sets the total usage for a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [totalM3] The total cubic meters to set.
  /// [successCallback] A callback for when the value is set successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Reads the feature value of a water meter.
  ///
  /// [mac] The MAC address of the water meter.
  /// [successCallback] A callback for when the feature value is read successfully.
  /// [failedCallback] A callback for when the operation fails.
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

}

/// A data model class for configuring the server parameters for a water meter.
class WaterMeterServerParamMode {
  /// The server URL.
  late String url;
  /// The client ID for the server.
  late String clientId;
  /// The access token for the server.
  late String accessToken;
}

/// A data model class for initializing a water meter.
class WaterMeterInitParamModel {
  /// The MAC address of the water meter.
  late String mac;
  /// The name of the water meter.
  late String name;
  /// The price per cubic meter.
  late String price;
  /// The pay mode of the water meter.
  late TTMeterPayMode payMode;
}

/// A data model class for a water meter discovered during a scan.
class TTWaterMeterScanModel {
  /// The name of the water meter.
  String name = '';
  /// The MAC address of the water meter.
  String mac = '';
  /// A boolean indicating whether the water meter has been initialized.
  bool isInited = true;
  /// The total cubic meters consumed.
  String totalM3 = '';
  /// The remaining cubic meters.
  String remainderM3 = '';
  /// A boolean indicating whether the power is on or off.
  bool onOff = true;
  /// The RSSI of the water meter.
  int rssi = -1;
  /// A value indicating whether there is magnetic interference.
  int magneticInterference = 0;
  /// The battery level of the water meter.
  int electricQuantity = -1;
  /// A value indicating whether there is a water valve failure.
  int waterValveFailure = 0;
  /// The pay mode of the water meter.
  TTMeterPayMode payMode = TTMeterPayMode.postpaid;
  /// The time the scan was performed.
  int scanTime = 0;

  /// Creates an instance of [TTWaterMeterScanModel] from a map.
  TTWaterMeterScanModel(Map map) {
    this.name = map[TTResponse.name];
    this.mac = map[TTResponse.mac];
    this.isInited = map[TTResponse.isInited];
    this.totalM3 = map[TTResponse.totalM3];
    this.remainderM3 = map[TTResponse.remainderM3];
    this.electricQuantity = map[TTResponse.electricQuantity];
    this.waterValveFailure = map[TTResponse.waterValveFailure];
    this.rssi = map[TTResponse.rssi];
    this.onOff = map[TTResponse.onOff];
    this.payMode = map[TTResponse.payMode] == 0
        ? TTMeterPayMode.postpaid
        : TTMeterPayMode.prepaid;
    this.scanTime = map[TTResponse.scanTime];
  }
}
