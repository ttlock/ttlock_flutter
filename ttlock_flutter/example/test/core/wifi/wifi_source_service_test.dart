import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_example/core/wifi/wifi_source_service.dart';

void main() {
  group('WifiSourceService', () {
    test('ios returns current ssid as only candidate', () async {
      final service = WifiSourceService(
        platform: FakeWifiPlatform(
          kind: WifiPlatformKind.ios,
          currentSsid: 'Office WiFi',
        ),
      );

      final result = await service.load();

      expect(result.currentSsid, 'Office WiFi');
      expect(result.availableSsids, ['Office WiFi']);
      expect(result.canScan, isFalse);
      expect(result.errorMessage, isNull);
    });

    test('android deduplicates scan results and prioritizes current ssid', () async {
      final service = WifiSourceService(
        platform: FakeWifiPlatform(
          kind: WifiPlatformKind.android,
          currentSsid: '"Home WiFi"',
          scannedSsids: ['Guest', 'Home WiFi', 'Guest', ''],
        ),
      );

      final result = await service.load();

      expect(result.currentSsid, 'Home WiFi');
      expect(result.availableSsids, ['Home WiFi', 'Guest']);
      expect(result.canScan, isTrue);
      expect(result.errorMessage, isNull);
    });

    test('android keeps current ssid when scanning fails', () async {
      final service = WifiSourceService(
        platform: FakeWifiPlatform(
          kind: WifiPlatformKind.android,
          currentSsid: 'Office WiFi',
          scanError: Exception('scan failed'),
        ),
      );

      final result = await service.load();

      expect(result.currentSsid, 'Office WiFi');
      expect(result.availableSsids, ['Office WiFi']);
      expect(result.canScan, isTrue);
      expect(result.errorMessage, contains('scan failed'));
    });

    test('sanitizes unusable ssid values', () async {
      final service = WifiSourceService(
        platform: FakeWifiPlatform(
          kind: WifiPlatformKind.ios,
          currentSsid: '<unknown ssid>',
        ),
      );

      final result = await service.load();

      expect(result.currentSsid, isNull);
      expect(result.availableSsids, isEmpty);
    });
  });
}

class FakeWifiPlatform implements WifiSourcePlatform {
  FakeWifiPlatform({
    required this.kind,
    this.currentSsid,
    this.scannedSsids = const [],
    this.scanError,
  });

  @override
  final WifiPlatformKind kind;

  final String? currentSsid;
  final List<String> scannedSsids;
  final Object? scanError;

  @override
  Future<String?> getCurrentSsid() async => currentSsid;

  @override
  Future<List<String>> getNearbySsids() async {
    if (scanError != null) throw scanError!;
    return scannedSsids;
  }
}
