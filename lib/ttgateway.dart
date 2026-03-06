import 'dart:convert' as convert;

import 'package:ttlock_premise_flutter/src/ttlock_channel.dart';
import 'package:ttlock_premise_flutter/src/ttgateway_commands.dart';
import 'package:ttlock_premise_flutter/ttlock.dart';
import 'package:ttlock_premise_flutter/ttlock_models.dart';

class TTGateway {
  static void startScan(TTGatewayScanCallback scanCallback) {
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_START_SCAN_GATEWAY, null, scanCallback);
  }

  static void stopScan() {
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_STOP_SCAN_GATEWAY, null, null);
  }

  static void connect(String mac, TTGatewayConnectCallback callback) {
    Map map = Map();
    map["mac"] = mac;
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_CONNECT_GATEWAY, map, callback);
  }

  static void getNearbyWifi(TTGatewayGetAroundWifiCallback callback,
      TTGatewayFailedCallback failedCallback) {
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_GET_SURROUND_WIFI, null, callback,
        fail: failedCallback);
  }

  @Deprecated('Use initWithParams(TTGatewayInitParams params, ...) instead')
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
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_INIT_GATEWAY, map, callback, fail: failedCallback);
  }

  /// Initialize gateway with typed parameters.
  static void initWithParams(
    TTGatewayInitParams params,
    TTGatewayInitCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    final map = params.toMap();
    map[TTResponse.addGatewayJsonStr] = convert.jsonEncode(map);
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_INIT_GATEWAY, map, callback, fail: failedCallback);
  }

  ///[map] {"type":x, "ipAddress": "xxx", "subnetMask": xxx"", "router": "xxx", "preferredDns": "xxx", "alternateDns": "xxx"}
  //type  0 means manual, 1 means automatic
  @Deprecated('Use configIpWithParams(TTIpSetting ipSetting, ...) instead')
  static void configIp(
    Map map,
    TTSuccessCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(map);
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_CONFIG_IP, map, callback, fail: failedCallback);
  }

  /// Configure gateway IP with typed parameters.
  static void configIpWithParams(
    TTIpSetting ipSetting,
    TTSuccessCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    final map = Map<String, dynamic>.from(ipSetting.toMap());
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(ipSetting.toMap());
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_CONFIG_IP, map, callback, fail: failedCallback);
  }

  static void configApn(String mac, String apn, TTSuccessCallback callback, TTGatewayFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    map["apn"] = apn;
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_CONFIG_APN, map, callback, fail: failedCallback);
  }

  static void setGatewayEnterUpgradeMode(String mac, TTSuccessCallback callback,
      TTGatewayFailedCallback failedCallback) {
    Map map = Map();
    map["mac"] = mac;
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_UPGRADE_GATEWAY, map, callback, fail: failedCallback);
  }

  static void disconnect(String mac, TTSuccessCallback callback) {
    Map map = Map();
    map["mac"] = mac;
    TTLockChannel.invoke(TTGatewayCommands.COMMAND_DISCONNECT_GATEWAY, map, callback);
  }
}
