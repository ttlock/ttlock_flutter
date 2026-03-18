import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_gateway_exception.dart';
import 'package:ttlock_premise_flutter/models/gateway_models.dart';

/// Legacy gateway API. Prefer [new_ttlock.TTLock.gateway] instead.
@Deprecated('Use TTLock.gateway for scan, connect, init, configIp, configApn, enterUpgradeMode, disconnect instead.')
class TTGateway {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN_GATEWAY = 'startScanGateway';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN_GATEWAY = 'stopScanGateway';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_CONNECT_GATEWAY = 'connectGateway';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_DISCONNECT_GATEWAY = 'disconnectGateway';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_GET_SURROUND_WIFI = 'getSurroundWifi';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_GATEWAY = 'initGateway';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_UPGRADE_GATEWAY = 'upgradeGateway';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_CONFIG_IP = 'gatewayConfigIp';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_CONFIG_APN = 'gatewayConfigApn';

  @Deprecated('Use TTLock.gateway.startScan() and listen to the stream instead.')
  static void startScan(TTGatewayScanCallback scanCallback) {
    new_ttlock.TTLock.gateway.startScan().listen((model) {
      final legacyMap = {
        'gatewayName': model.gatewayName,
        'gatewayMac': model.gatewayMac,
        'rssi': model.rssi,
        'type': model.type.value,
        'isDfuMode': model.isDfuMode,
      };
      scanCallback(TTGatewayScanModel.fromMap(Map<String, dynamic>.from(legacyMap)));
    });
  }

  @Deprecated('Use TTLock.gateway.stopScan() instead.')
  static void stopScan() {
    new_ttlock.TTLock.gateway.stopScan();
  }

  @Deprecated('Use TTLock.gateway.connect(mac) instead.')
  static void connect(String mac, TTGatewayConnectCallback callback) {
    new_ttlock.TTLock.gateway.connect(mac).then((status) {
      final classicStatus = status.value < TTGatewayConnectStatus.values.length
          ? TTGatewayConnectStatus.values[status.value]
          : TTGatewayConnectStatus.faile;
      callback(classicStatus);
    }).catchError((e, _) {
      // connect has no failedCallback in legacy API; caller only gets success callback
      // So we ignore error or could call callback(TTGatewayConnectStatus.faile)
      callback(TTGatewayConnectStatus.faile);
    });
  }

  @Deprecated('Use TTLock.gateway.getNearbyWifi() and listen to the stream instead.')
  static void getNearbyWifi(
    TTGatewayGetAroundWifiCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.gateway.getNearbyWifi().listen(
      (wifiList) => callback(false, wifiList),
      onDone: () => callback(true, []),
      onError: (e, _) {
        if (e is TTGatewayException) {
          final err = e.error.value < TTGatewayError.values.length
              ? TTGatewayError.values[e.error.value]
              : TTGatewayError.fail;
          failedCallback(err, e.message);
        } else {
          failedCallback(TTGatewayError.fail, e.toString());
        }
      },
    );
  }

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
    new_ttlock.TTLock.gateway.init(params).then(callback).catchError((e, _) {
      if (e is TTGatewayException) {
        final err = e.error.value < TTGatewayError.values.length
            ? TTGatewayError.values[e.error.value]
            : TTGatewayError.fail;
        failedCallback(err, e.message);
      } else {
        failedCallback(TTGatewayError.fail, e.toString());
      }
    });
  }

  /// [map] {"type":x, "ipAddress": "xxx", "subnetMask": "xxx", "router": "xxx", "preferredDns": "xxx", "alternateDns": "xxx"}
  @Deprecated('Use TTLock.gateway.configIp(TTIpSetting(...)) instead.')
  static void configIp(
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
    new_ttlock.TTLock.gateway.configIp(ipSetting).then((_) => callback()).catchError((e, _) {
      if (e is TTGatewayException) {
        final err = e.error.value < TTGatewayError.values.length
            ? TTGatewayError.values[e.error.value]
            : TTGatewayError.fail;
        failedCallback(err, e.message);
      } else {
        failedCallback(TTGatewayError.fail, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.gateway.configApn(mac: mac, apn: apn) instead.')
  static void configApn(
    String mac,
    String apn,
    TTSuccessCallback callback,
    TTGatewayFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.gateway.configApn(mac: mac, apn: apn).then((_) => callback()).catchError((e, _) {
      if (e is TTGatewayException) {
        final err = e.error.value < TTGatewayError.values.length
            ? TTGatewayError.values[e.error.value]
            : TTGatewayError.fail;
        failedCallback(err, e.message);
      } else {
        failedCallback(TTGatewayError.fail, e.toString());
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
        final err = e.error.value < TTGatewayError.values.length
            ? TTGatewayError.values[e.error.value]
            : TTGatewayError.fail;
        failedCallback(err, e.message);
      } else {
        failedCallback(TTGatewayError.fail, e.toString());
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
