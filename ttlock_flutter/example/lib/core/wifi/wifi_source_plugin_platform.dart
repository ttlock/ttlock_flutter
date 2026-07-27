import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

import 'wifi_source_service.dart';

class WifiSourcePluginPlatform implements WifiSourcePlatform {
  const WifiSourcePluginPlatform();

  @override
  WifiPlatformKind get kind {
    if (Platform.isAndroid) return WifiPlatformKind.android;
    if (Platform.isIOS) return WifiPlatformKind.ios;
    return WifiPlatformKind.other;
  }

  @override
  Future<String?> getCurrentSsid() async {
    await _ensureLocationPermission();
    return WiFiForIoTPlugin.getSSID();
  }

  @override
  Future<List<String>> getNearbySsids() async {
    if (kind != WifiPlatformKind.android) return const [];

    await _ensureLocationPermission();

    final canStart = await WiFiScan.instance.canStartScan(askPermissions: true);
    if (canStart == CanStartScan.yes) {
      await WiFiScan.instance.startScan();
    }

    final canGet = await WiFiScan.instance.canGetScannedResults(
      askPermissions: true,
    );
    if (canGet != CanGetScannedResults.yes) {
      return const [];
    }

    final results = await WiFiScan.instance.getScannedResults();
    return results.map((entry) => entry.ssid).toList(growable: false);
  }

  Future<void> _ensureLocationPermission() async {
    if (kind == WifiPlatformKind.other) return;

    final status = await Permission.locationWhenInUse.status;
    if (status.isGranted || status.isLimited || status.isProvisional) return;

    await Permission.locationWhenInUse.request();
  }
}
