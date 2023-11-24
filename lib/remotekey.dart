import 'package:ttlock_flutter/ttlock.dart';
import 'dart:convert' as convert;

import 'ttlock.dart';

class TTRemote {
  static const String COMMAND_START_SCAN_REMOTE = "startScanRemote";
  static const String COMMAND_STOP_SCAN_REMOTE = "stopScanRemote";
  static const String COMMAND_INIT_REMOTE = "initRemote";


  static void startScan(TTRemoteScanModel scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_REMOTE, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_REMOTE, null, null);
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

  ///[map] {"type":x, "ipAddress": "xxx", "subnetMask": xxx"", "router": "xxx", "preferredDns": "xxx", "alternateDns": "xxx"}
  //type  0 means manual, 1 means automatic
  //  ipAddress (option)  such as 0.0.0.0
  //  subnetMask (option)  such as 255.255.0.0
  //  router (option)  such as 0.0.0.0
  //  preferredDns (option)  such as 0.0.0.0
  //  alternateDns (option)  such as 0.0.0.0
  static void configIp(
    Map map,
    TTSuccessCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(map);
    TTLock.invoke(COMMAND_CONFIG_IP, map, callback, fail: failedCallback);
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
