// import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

import 'package:ttlock_flutter/ttlock.dart';

/// A class for interacting with a TTlock electric meter accessory.
///
/// This class provides methods to scan for, connect to, and manage electric meters.
class TTElectricMeter {
  /// Command to configure the server for the electric meter.
  static const String COMMAND_CONFIG_SERVER_ELECTRIC_METER =
      "electricMeterConfigServer";
  /// Command to start scanning for electric meters.
  static const String COMMAND_START_SCAN_ELECTRIC_METER =
      "electricMeterStartScan";
  /// Command to stop scanning for electric meters.
  static const String COMMAND_STOP_SCAN_ELECTRIC_METER =
      "electricMeterStopScan";
  /// Command to connect to an electric meter.
  static const String COMMAND_ELECTRIC_METER_CONNECT = "electricMeterConnect";
  /// Command to disconnect from an electric meter.
  static const String COMMAND_ELECTRIC_METER_DISCONNECT =
      "electricMeterDisconnect";
  /// Command to initialize an electric meter.
  static const String COMMAND_ELECTRIC_METER_INIT = "electricMeterInit";
  /// Command to delete an electric meter.
  static const String COMMAND_ELECTRIC_METER_DELETE = "electricMeterDelete";
  /// Command to set the power on/off for an electric meter.
  static const String COMMAND_ELECTRIC_METER_SET_POWER_ON_OFF =
      "electricMeterSetPowerOnOff";
  /// Command to set the remaining electricity for an electric meter.
  static const String COMMAND_ELECTRIC_METER_SET_REMAINING_ELECTRICITY =
      "electricMeterSetRemainingElectricity";
  /// Command to clear the remaining electricity for an electric meter.
  static const String COMMAND_ELECTRIC_METER_CLEAR_REMAINING_ELECTRICITY =
      "electricMeterClearRemainingElectricity";
  /// Command to read data from an electric meter.
  static const String COMMAND_ELECTRIC_METER_READ_DATA =
      "electricMeterReadData";
  /// Command to set the pay mode for an electric meter.
  static const String COMMAND_ELECTRIC_METER_SET_PAY_MODE =
      "electricMeterSetPayMode";
  /// Command to charge an electric meter.
  static const String COMMAND_ELECTRIC_METER_CHARGE = "electricMeterCharg";
  /// Command to set the maximum power for an electric meter.
  static const String COMMAND_ELECTRIC_METER_SET_MAX_POWER =
      "electricMeterSetMaxPower";
  /// Command to get the feature value of an electric meter.
  static const String COMMAND_ELECTRIC_METER_GET_FEATURE_VALUE =
      "electricMeterGetFeatureValue";
  /// Command to enter upgrade mode for an electric meter.
  static const String COMMAND_ELECTRIC_METER_ENTER_UPGRADE_MODE =
      "electricMeterEnterUpgradeMode";

  /// Configures the server parameters for the electric meter.
  ///
  /// [paramMode] The server parameters to configure.
  static void configServer(ElectricMeterServerParamMode paramMode) {
    Map map = Map();
    map["url"] = paramMode.url;
    map["clientId"] = paramMode.clientId;
    map["accessToken"] = paramMode.accessToken;
    TTLock.invoke(COMMAND_CONFIG_SERVER_ELECTRIC_METER, map, null);
  }

  /// Starts scanning for nearby electric meters.
  ///
  /// [scanCallback] A callback that will be invoked for each electric meter found.
  static void startScan(TTElectricMeterScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_ELECTRIC_METER, null, scanCallback);
  }

  /// Stops the electric meter scan.
  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_ELECTRIC_METER, null, null);
  }

  /// Connects to an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [callback] A callback for when the connection is successful.
  /// [failedCallback] A callback for when the connection fails.
  static void connect(String mac, TTSuccessCallback callback,
      TTMeterFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_CONNECT, map, callback,
        fail_callback: failedCallback);
  }

  /// Disconnects from an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  static void disconnect(String mac) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_ELECTRIC_METER_DISCONNECT, map, null);
  }

  /// Initializes an electric meter.
  ///
  /// [paramMap] A map of parameters for initialization, including `mac`, `price`, `payMode`, and `name`.
  /// [successCallback] A callback for when the initialization is successful.
  /// [failedCallback] A callback for when the initialization fails.
  static void init(
    Map paramMap,
    TTSuccessCallback successCallback,
    TTMeterFailedCallback failedCallback,
  ) {
    TTLock.invoke(COMMAND_ELECTRIC_METER_INIT, paramMap, successCallback,
        fail_callback: failedCallback);
  }

  /// Deletes an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [successCallback] A callback for when the deletion is successful.
  /// [failedCallback] A callback for when the deletion fails.
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

  /// Sets the power on or off for an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
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
    TTLock.invoke(COMMAND_ELECTRIC_METER_SET_POWER_ON_OFF, map, successCallback,
        fail_callback: failedCallback);
  }

  /// Sets the remaining kilowatt-hours on an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [remainderKwh] The remaining kilowatt-hours to set.
  /// [successCallback] A callback for when the value is set successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Clears the remaining kilowatt-hours on an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [successCallback] A callback for when the value is cleared successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Reads data from an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [successCallback] A callback for when the data is read successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Sets the pay mode for an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [price] The price per kilowatt-hour.
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
    TTLock.invoke(COMMAND_ELECTRIC_METER_SET_PAY_MODE, map, successCallback,
        fail_callback: failedCallback);
  }

  /// Recharges an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [amount] The amount to recharge.
  /// [kwh] The kilowatt-hours to recharge.
  /// [successCallback] A callback for when the recharge is successful.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Sets the maximum power for an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [maxPower] The maximum power to set.
  /// [successCallback] A callback for when the maximum power is set successfully.
  /// [failedCallback] A callback for when the operation fails.
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

  /// Reads the feature value of an electric meter.
  ///
  /// [mac] The MAC address of the electric meter.
  /// [successCallback] A callback for when the feature value is read successfully.
  /// [failedCallback] A callback for when the operation fails.
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

}

/// A data model class for configuring the server parameters for an electric meter.
class ElectricMeterServerParamMode {
  /// The server URL.
  late String url;
  /// The client ID for the server.
  late String clientId;
  /// The access token for the server.
  late String accessToken;
}

/// A data model class for initializing an electric meter.
class ElectricMeterInitParamModel {
  /// The MAC address of the electric meter.
  late String mac;
  /// The name of the electric meter.
  late String name;
  /// The price per kilowatt-hour.
  late String price;
  /// The pay mode of the electric meter.
  late TTMeterPayMode payMode;
}

/// A data model class for an electric meter discovered during a scan.
class TTElectricMeterScanModel {
  /// The name of the electric meter.
  String name = '';
  /// The MAC address of the electric meter.
  String mac = '';
  /// A boolean indicating whether the electric meter has been initialized.
  bool isInited = true;
  /// The total kilowatt-hours consumed.
  String totalKwh = '';
  /// The remaining kilowatt-hours.
  String remainderKwh = '';
  /// The current voltage.
  String voltage = '';
  /// The current electric current.
  String electricCurrent = '';
  /// A boolean indicating whether the power is on or off.
  bool onOff = true;
  /// The RSSI of the electric meter.
  int rssi = -1;
  /// The pay mode of the electric meter.
  TTMeterPayMode payMode = TTMeterPayMode.postpaid;
  /// The time the scan was performed.
  int scanTime = 0;

  /// Creates an instance of [TTElectricMeterScanModel] from a map.
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
        ? TTMeterPayMode.postpaid
        : TTMeterPayMode.prepaid;
    this.scanTime = map[TTResponse.scanTime];
  }
}
