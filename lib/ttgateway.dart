import 'dart:async';

import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_gateway_exception.dart';

/// Legacy gateway API. Prefer [new_ttlock.TTLock.gateway] instead.
@Deprecated('Use TTLock.gateway for scan, connect, init, configIp, configApn, enterUpgradeMode, disconnect instead.')
class TTGateway {
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_START_SCAN_GATEWAY = 'startScanGateway';
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_STOP_SCAN_GATEWAY = 'stopScanGateway';
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_CONNECT_GATEWAY = 'connectGateway';
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_DISCONNECT_GATEWAY = 'disconnectGateway';
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_GET_SURROUND_WIFI = 'getSurroundWifi';
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_INIT_GATEWAY = 'initGateway';
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_UPGRADE_GATEWAY = 'upgradeGateway';
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_CONFIG_IP = 'gatewayConfigIp';
  @Deprecated('Replaced by Pigeon TTGatewayHostApi channel names')
  static const String COMMAND_CONFIG_APN = 'gatewayConfigApn';

  static StreamSubscription<TTGatewayScanModel>? _scanSub;
  
  @Deprecated('Use TTLock.gateway.gatewayStartScan() and listen to the stream instead.')
  static void startScan(TTGatewayScanCallback scanCallback) {
    _scanSub?.cancel();
    _scanSub = new_ttlock.TTLock.gateway.gatewayStartScan().listen(scanCallback);
  }

  @Deprecated('Cancel the subscription from gatewayStartScan().')
  static void stopScan() {
    _scanSub?.cancel();
    _scanSub = null;
  }

  @Deprecated('Use TTLock.gateway.connect(mac) instead.')
  static void connect(String mac, TTGatewayConnectCallback callback) {
    new_ttlock.TTLock.gateway.connect(mac).then(callback).catchError((_, __) {
      callback(TTGatewayConnectStatus.failed);
    });
  }

  /// [gatewayMac] 当前已连接网关 MAC，用于 [TTGatewayApi.gatewayGetNearbyWifi]。
  @Deprecated('Use TTLock.gateway.gatewayGetNearbyWifi(gatewayMac: ...) and listen to the stream instead.')
  static void getNearbyWifi(
    String gatewayMac,
    TTGatewayGetAroundWifiCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    final List allWifiList = [];
    final Set<String> seen = <String>{};

    String wifiKey(dynamic item) {
      if (item is TTWifiScanEntry) {
        final mapKey = item.wifiMac ??
            item.bssid ??
            item.ssid ??
            item.wifiName ??
            item.name;
        if (mapKey != null) return mapKey.toString();
      }
      if (item is Map) {
        final dynamic mapKey = item['wifiMac'] ??
            item['bssid'] ??
            item['BSSID'] ??
            item['mac'] ??
            item['ssid'] ??
            item['wifiName'] ??
            item['name'];
        if (mapKey != null) return mapKey.toString();
      }
      return item?.toString() ?? '';
    }

    new_ttlock.TTLock.gateway.gatewayGetNearbyWifi(gatewayMac: gatewayMac).listen(
      (wifiList) {
        for (final item in wifiList) {
          final key = wifiKey(item);
          if (seen.add(key)) {
            allWifiList.add(item);
          }
        }
        callback(false, allWifiList);
      },
      onDone: () => callback(true, allWifiList),
      onError: (e, _) {
        if (e is TTGatewayException) {
          failedCallback(e.code, e.message ?? '');
        } else {
          failedCallback(TTGatewayError.failed, e.toString());
        }
      },
    );
  }

  static Map _gatewayDeviceInfoToMap(GatewayDeviceInfo m) => <String, Object?>{
        'modelNum': m.modelNum,
        'hardwareRevision': m.hardwareRevision,
        'firmwareRevision': m.firmwareRevision,
        'networkMac': m.networkMac,
      };

  @Deprecated('Use TTLock.gateway.init(TTGatewayInitParams(...)) instead.')
  static void init(
    Map map,
    TTGatewayInitCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    if (map['uid'] != null) {
      map['ttlockUid'] = map['uid'];
    }
    if (map['ttlockLoginPassword'] == null) {
      map['ttlockLoginPassword'] = '123456';
    }
    final params = TTGatewayInitParams(
      type: map['type'] as int,
      ttlockUid: map['ttlockUid'] as int,
      gatewayName: map['gatewayName'] as String?,
      ttlockLoginPassword: (map['ttlockLoginPassword'] as String?) ?? '123456',
      wifi: map['wifi'] as String?,
      wifiPassword: map['wifiPassword'] as String?,
      serverIp: map['serverIp'] as String?,
      serverPort: map['serverPort'] as String?,
      companyId: map['companyId'] as int?,
      branchId: map['branchId'] as int?,
    );
    new_ttlock.TTLock.gateway.init(params).then((m) => callback(_gatewayDeviceInfoToMap(m))).catchError((e, _) {
      if (e is TTGatewayException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTGatewayError.failed, e.toString());
      }
    });
  }

  /// [map] {"type":x, "ipAddress": "xxx", "subnetMask": "xxx", "router": "xxx", "preferredDns": "xxx", "alternateDns": "xxx"}
  @Deprecated('Use TTLock.gateway.configIp(mac, TTIpSetting(...)) instead.')
  static void configIp(
    String mac,
    Map map,
    TTSuccessCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    final ipSetting = TTIpSetting(
      type: map['type'] as int,
      ipAddress: map['ipAddress'] as String?,
      subnetMask: map['subnetMask'] as String?,
      router: map['router'] as String?,
      preferredDns: map['preferredDns'] as String?,
      alternateDns: map['alternateDns'] as String?,
    );
    new_ttlock.TTLock.gateway.configIp(mac, ipSetting).then((_) => callback()).catchError((e, _) {
      if (e is TTGatewayException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTGatewayError.failed, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.gateway.configApn(mac, apn) instead.')
  static void configApn(
    String mac,
    String apn,
    TTSuccessCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.gateway.configApn(mac, apn).then((_) => callback()).catchError((e, _) {
      if (e is TTGatewayException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTGatewayError.failed, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.gateway.enterUpgradeMode(mac) instead.')
  static void setGatewayEnterUpgradeMode(
    String mac,
    TTSuccessCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.gateway.enterUpgradeMode(mac).then((_) => callback()).catchError((e, _) {
      if (e is TTGatewayException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTGatewayError.failed, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.gateway.disconnect(mac) instead.')
  static void disconnect(String mac, TTSuccessCallback callback) {
    new_ttlock.TTLock.gateway.disconnect(mac).then((_) => callback()).catchError((_, __) {
      // legacy has no fail callback for disconnect
    });
  }
}
