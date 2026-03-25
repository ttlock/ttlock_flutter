import 'package:flutter/services.dart';
import 'package:ttlock_premise_flutter/pigeon/messages.g.dart' as pigeon;

import 'pigeon_errors.dart';

/// 网关 Pigeon API：将 [PlatformException] 转为 [TTGatewayException]。
class TTGatewayApi {
  TTGatewayApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : _host = pigeon.TTGatewayHostApi(
          binaryMessenger: binaryMessenger,
          messageChannelSuffix: messageChannelSuffix,
        );

  final pigeon.TTGatewayHostApi _host;

  pigeon.TTGatewayHostApi get host => _host;

  // Future<void> setEventGatewayMac(String mac) =>
  //     runGatewayApi(() => _host.setEventGatewayMac(mac));

  Stream<pigeon.TTGatewayScanModel> gatewayStartScan() => pigeon.gatewayStartScan();

  /// 订阅前会先调用 [setEventGatewayMac]；[gatewayMac] 不能为空字符串。
  Stream<pigeon.TTWifiScanResult> gatewayGetNearbyWifi({required String gatewayMac}) {
    if (gatewayMac.isEmpty) {
      throw ArgumentError.value(gatewayMac, 'gatewayMac', 'must not be empty');
    }
    return Stream<void>.fromFuture(
      runGatewayApi(() => _host.setEventGatewayMac(gatewayMac)),
    ).asyncExpand((_) => pigeon.gatewayGetNearbyWifi());
  }

  Future<pigeon.TTGatewayConnectStatus> connect(String mac) =>
      runGatewayApi(() => _host.connect(mac));

  Future<void> disconnect(String mac) =>
      runGatewayApi(() => _host.disconnect(mac));

  Future<pigeon.GatewayDeviceInfo> init(pigeon.TTGatewayInitParams params) =>
      runGatewayApi(() => _host.init(params));

  Future<void> configIp(String mac, pigeon.TTIpSetting ipSetting) =>
      runGatewayApi(() => _host.configIp(mac, ipSetting));

  Future<void> configApn(String mac, String apn) =>
      runGatewayApi(() => _host.configApn(mac, apn));

  Future<String?> getNetworkMac() => runGatewayApi(() => _host.getNetworkMac());

  Future<void> enterUpgradeMode(String mac) =>
      runGatewayApi(() => _host.enterUpgradeMode(mac));
}
