import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

class TTGateway {
  static const String COMMAND_START_SCAN_GATEWAY = "startScanGateway";
  static const String COMMAND_STOP_SCAN_GATEWAY = "stopScanGateway";
  static const String COMMAND_CONNECT_GATEWAY = "connectGateway";
  static const String COMMAND_DISCONNECT_GATEWAY = "disconnectGateway";
  static const String COMMAND_GET_SURROUND_WIFI = "getSurroundWifi";
  static const String COMMAND_INIT_GATEWAY = "initGateway";
  static const String COMMAND_UPGRADE_GATEWAY = "upgradeGateway";

  static void startScan(TTGatewayScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_GATEWAY, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_GATEWAY, null, null);
  }

  static void connect(String mac, TTGatewayConnectCallback callback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_CONNECT_GATEWAY, map, callback);
  }

  static void getNearbyWifi(TTGatewayGetAroundWifiCallback callback,
      TTGatewayFailedCallback failedCallback) {
    TTLock.invoke(COMMAND_GET_SURROUND_WIFI, null, callback,
        fail: failedCallback);
  }

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
    TTLock.invoke(COMMAND_INIT_GATEWAY, map, callback, fail: failedCallback);
  }

  // static void upgrade(String mac, TTSuccessCallback callback,
  //     TTGatewayFailedCallback failedCallback) {
  //   Map map = Map();
  //   map["mac"] = mac;
  //   TTLock.invoke(COMMAND_UPGRADE_GATEWAY, map, callback, fail: failedCallback);
  // }

  static void disconnect(String mac, TTSuccessCallback callback) {
    Map map = Map();
    map["mac"] = mac;
    TTLock.invoke(COMMAND_DISCONNECT_GATEWAY, map, callback);
  }
}
