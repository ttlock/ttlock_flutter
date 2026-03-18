import 'dart:convert' as convert;

import 'package:ttlock_premise_flutter/api/tt_gateway_api.dart';
import 'package:ttlock_premise_flutter/models/enums.dart';
import 'package:ttlock_premise_flutter/models/gateway_models.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/scan_models.dart';
import 'package:ttlock_premise_flutter/src/constants/commands.dart';
import 'package:ttlock_premise_flutter/src/platform/tt_lock_platform.dart';

class TTGatewayImpl implements TTGatewayApi {
  final TTLockPlatform _platform;
  TTGatewayImpl(this._platform);

  @override
  Stream<TTGatewayScanModel> startScan() {
    return _platform
        .eventStream(TTCommands.startScanGateway)
        .map((e) => TTGatewayScanModel.fromMap(e.data));
  }

  @override
  Future<void> stopScan() => _platform.send(TTCommands.stopScanGateway);

  @override
  Future<TTGatewayConnectStatus> connect(String mac) async {
    final data = await _platform.invoke(TTCommands.connectGateway, {'mac': mac});
    return TTGatewayConnectStatus.fromValue(data['status'] as int);
  }

  @override
  Future<void> disconnect(String mac) async {
    await _platform.invoke(TTCommands.disconnectGateway, {'mac': mac});
  }

  @override
  Stream<List<dynamic>> getNearbyWifi() {
    return _platform
        .eventStream(TTCommands.getSurroundWifi)
        .map((e) => e.data['wifiList'] as List<dynamic>);
  }

  @override
  Future<Map<String, dynamic>> init(TTGatewayInitParams params) async {
    final map = params.toMap();
    map['addGatewayJsonStr'] = params.toJsonStr();
    return _platform.invoke(TTCommands.initGateway, map);
  }

  @override
  Future<void> configIp(TTIpSetting ipSetting) async {
    final map = Map<String, dynamic>.from(ipSetting.toMap());
    map['ipSettingJsonStr'] = convert.jsonEncode(ipSetting.toMap());
    await _platform.invoke(TTCommands.gatewayConfigIp, map);
  }

  @override
  Future<void> configApn({required String mac, required String apn}) async {
    await _platform.invoke(TTCommands.gatewayConfigApn, {'mac': mac, 'apn': apn});
  }

  @override
  Future<String?> getNetworkMac() async {
    final data = await _platform.invoke(TTCommands.getNetworkMac);
    return data['networkMac'] as String?;
  }

  @override
  Future<void> enterUpgradeMode(String mac) async {
    await _platform.invoke(TTCommands.upgradeGateway, {'mac': mac});
  }
}
