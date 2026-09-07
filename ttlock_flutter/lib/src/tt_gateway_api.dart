import 'package:flutter/services.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    as pigeon;

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

  Stream<pigeon.TTGatewayScanModel> gatewayStartScan() =>
      Stream<void>.fromFuture(runBleGate(TTBleOperation.scanDevice))
          .asyncExpand(
              (_) => mapGatewayStreamErrors(pigeon.gatewayStartScan()));

  /// 订阅前会先调用 [setGatewayGetNearbyWifiParam]；[gatewayMac] 不能为空字符串。
  Stream<pigeon.TTWifiScanResult> gatewayGetNearbyWifi(
      {required String gatewayMac}) {
    if (gatewayMac.isEmpty) {
      throw ArgumentError.value(gatewayMac, 'gatewayMac', 'must not be empty');
    }
    return Stream<void>.fromFuture(runBleGate(TTBleOperation.deviceOperation))
        .asyncExpand(
      (_) => Stream<void>.fromFuture(
        runGatewayApi(() => _host.setGatewayGetNearbyWifiParam(gatewayMac),
            method: 'setGatewayGetNearbyWifiParam'),
      ).asyncExpand(
          (_) => mapGatewayStreamErrors(pigeon.gatewayGetNearbyWifi())),
    );
  }

  Future<pigeon.TTGatewayConnectStatus> connect(String mac,
          {Duration? timeout}) =>
      runGatewayApi(() => _host.connect(mac),
          timeout: timeout, method: 'connect');

  Future<void> disconnect(String mac, {Duration? timeout}) =>
      runGatewayApi(() => _host.disconnect(mac),
          timeout: timeout, method: 'disconnect');

  Future<pigeon.GatewayDeviceInfo> init(pigeon.TTGatewayInitParams params,
          {Duration? timeout}) =>
      runGatewayApi(() => _host.initGateway(params),
          timeout: timeout, method: 'init');

  Future<void> configIp(String mac, pigeon.TTIpSetting ipSetting,
          {Duration? timeout}) =>
      runGatewayApi(() => _host.configIp(mac, ipSetting),
          timeout: timeout, method: 'configIp');

  Future<void> configApn(String mac, String apn, {Duration? timeout}) =>
      runGatewayApi(() => _host.configApn(mac, apn),
          timeout: timeout, method: 'configApn');

  Future<String?> getNetworkMac({Duration? timeout}) =>
      runGatewayApi(() => _host.getNetworkMac(),
          timeout: timeout, method: 'getNetworkMac');

  Future<void> enterUpgradeMode(String mac, {Duration? timeout}) =>
      runGatewayApi(() => _host.enterUpgradeMode(mac),
          timeout: timeout, method: 'enterUpgradeMode');
}
