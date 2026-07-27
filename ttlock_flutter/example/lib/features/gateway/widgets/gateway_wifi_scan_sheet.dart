import 'package:flutter/material.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/widgets/wifi_picker_sheet.dart';

class GatewayWifiScanSheet {
  const GatewayWifiScanSheet._();

  static String entrySsid(TTWifiScanEntry entry) =>
      entry.ssid ?? entry.wifiName ?? entry.name ?? '';

  static Future<GatewayWifiScanResult?> show(
    BuildContext context, {
    required String gatewayMac,
    String? selectedSsid,
    List<String> initialWifiList = const [],
  }) {
    return WifiPickerSheet.show(
      context,
      selectedSsid: selectedSsid,
      initialWifiList: initialWifiList,
      loadWifiList: () => _loadGatewayWifiList(gatewayMac),
    ).then((result) {
      if (result == null) return null;
      return GatewayWifiScanResult(
        selectedSsid: result.selectedSsid,
        wifiList: result.wifiList,
      );
    });
  }

}

Future<List<String>> _loadGatewayWifiList(String gatewayMac) async {
  final seen = <String>{};
  final ssids = <String>[];
  await for (final result
      in TTLock.gateway.gatewayGetNearbyWifi(gatewayMac: gatewayMac)) {
    for (final entry in result.wifiList) {
      final ssid = GatewayWifiScanSheet.entrySsid(entry);
      if (ssid.isNotEmpty && seen.add(ssid)) {
        ssids.add(ssid);
      }
    }
  }
  return ssids;
}

class GatewayWifiScanResult {
  final String? selectedSsid;
  final List<String> wifiList;

  const GatewayWifiScanResult({
    this.selectedSsid,
    required this.wifiList,
  });
}
