import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

/// A class for interacting with a TTlock gateway accessory.
///
/// This class provides methods to scan for, connect to, and manage gateways.
class TTGateway {
  /// Command to start scanning for gateways.
  static const String COMMAND_START_SCAN_GATEWAY = "startScanGateway";
  /// Command to stop scanning for gateways.
  static const String COMMAND_STOP_SCAN_GATEWAY = "stopScanGateway";
  /// Command to connect to a gateway.
  static const String COMMAND_CONNECT_GATEWAY = "connectGateway";
  /// Command to disconnect from a gateway.
  static const String COMMAND_DISCONNECT_GATEWAY = "disconnectGateway";
  /// Command to get the surrounding Wi-Fi networks of a gateway.
  static const String COMMAND_GET_SURROUND_WIFI = "getSurroundWifi";
  /// Command to initialize a gateway.
  static const String COMMAND_INIT_GATEWAY = "initGateway";
  /// Command to upgrade a gateway.
  static const String COMMAND_UPGRADE_GATEWAY = "upgradeGateway";

  /// Command to configure the IP address of a gateway.
  static const String COMMAND_CONFIG_IP = "gatewayConfigIp";
  /// Command to configure the APN of a gateway.
  static const String COMMAND_CONFIG_APN = "gatewayConfigApn";

  /// Starts scanning for nearby gateways.
  ///
  /// [scanCallback] A callback that will be invoked for each gateway found.
  static void startScan(TTGatewayScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_GATEWAY, null, scanCallback);
  }

  /// Stops the gateway scan.
  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_GATEWAY, null, null);
  }

  /// Connects to a gateway.
  ///
  /// [mac] The MAC address of the gateway.
  /// [callback] A callback for when the connection is successful.
  static void connect(String mac, TTGatewayConnectCallback callback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_CONNECT_GATEWAY, map, callback);
  }

  /// Gets the nearby Wi-Fi networks of a gateway.
  ///
  /// [callback] A callback that will be invoked with the list of Wi-Fi networks.
  /// [failedCallback] A callback for when the operation fails.
  static void getNearbyWifi(TTGatewayGetAroundWifiCallback callback,
      TTGatewayFailedCallback failedCallback) {
    TTLock.invoke(COMMAND_GET_SURROUND_WIFI, null, callback,
        fail_callback: failedCallback);
  }

  /// Initializes a gateway.
  ///
  /// [map] A map of parameters for initialization.
  /// [callback] A callback for when the initialization is successful.
  /// [failedCallback] A callback for when the initialization fails.
  static void init(
    Map map,
    TTGatewayInitCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    if (map["uid"] != null) {
      map["ttlockUid"] = map["uid"];
    }
    if (map["ttlockLoginPassword"] == null) {
      map["ttlockLoginPassword"] = "123456";
    }

    map[TTResponse.addGatewayJsonStr] = convert.jsonEncode(map);
    TTLock.invoke(COMMAND_INIT_GATEWAY, map, callback, fail_callback: failedCallback);
  }

  /// Configures the IP address of a gateway.
  ///
  /// [map] A map of parameters for IP configuration.
  /// [callback] A callback for when the configuration is successful.
  /// [failedCallback] A callback for when the configuration fails.
  static void configIp(
    Map map,
    TTSuccessCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(map);
    TTLock.invoke(COMMAND_CONFIG_IP, map, callback, fail_callback: failedCallback);
  }

  /// Sets a gateway to enter upgrade mode.
  ///
  /// [mac] The MAC address of the gateway.
  /// [callback] A callback for when the gateway enters upgrade mode successfully.
  /// [failedCallback] A callback for when the operation fails.
  static void setGatewayEnterUpgradeMode(String mac, TTSuccessCallback callback,
      TTGatewayFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_UPGRADE_GATEWAY, map, callback, fail_callback: failedCallback);
  }

  /// Disconnects from a gateway.
  ///
  /// [mac] The MAC address of the gateway.
  /// [callback] A callback for when the disconnection is successful.
  static void disconnect(String mac, TTSuccessCallback callback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_DISCONNECT_GATEWAY, map, callback);
  }

  /// Configures the APN of a gateway.
  ///
  /// [mac] The MAC address of the gateway.
  /// [apn] The APN to configure.
  /// [callback] A callback for when the configuration is successful.
  /// [failedCallback] A callback for when the configuration fails.
  static void configApn(String mac, String apn, TTSuccessCallback callback,
      TTGatewayFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    map["apn"] = apn;
    TTLock.invoke(COMMAND_CONFIG_APN, map, callback, fail_callback: failedCallback);
  }
}
