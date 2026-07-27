import 'wifi_source_result.dart';

enum WifiPlatformKind { android, ios, other }

abstract class WifiSourcePlatform {
  WifiPlatformKind get kind;

  Future<String?> getCurrentSsid();

  Future<List<String>> getNearbySsids();
}

class WifiSourceService {
  const WifiSourceService({required WifiSourcePlatform platform})
      : _platform = platform;

  final WifiSourcePlatform _platform;

  Future<WifiSourceResult> load() async {
    final currentSsid = _normalizeSsid(await _platform.getCurrentSsid());
    final canScan = _platform.kind == WifiPlatformKind.android;

    final availableSsids = <String>[];
    String? errorMessage;

    if (canScan) {
      try {
        availableSsids.addAll(
          _dedupe(_platformSortedSsids(await _platform.getNearbySsids())),
        );
      } catch (error) {
        errorMessage = error.toString();
      }
    }

    if (currentSsid != null) {
      availableSsids.remove(currentSsid);
      availableSsids.insert(0, currentSsid);
    }

    return WifiSourceResult(
      currentSsid: currentSsid,
      availableSsids: availableSsids,
      canScan: canScan,
      errorMessage: errorMessage,
    );
  }

  List<String> _platformSortedSsids(List<String> ssids) {
    return ssids
        .map(_normalizeSsid)
        .whereType<String>()
        .toList(growable: false);
  }

  List<String> _dedupe(List<String> ssids) {
    final result = <String>[];
    final seen = <String>{};
    for (final ssid in ssids) {
      if (seen.add(ssid)) {
        result.add(ssid);
      }
    }
    return result;
  }

  String? _normalizeSsid(String? value) {
    if (value == null) return null;
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    if (trimmed == '<unknown ssid>') return null;
    if (trimmed.startsWith('"') && trimmed.endsWith('"') && trimmed.length >= 2) {
      final unquoted = trimmed.substring(1, trimmed.length - 1).trim();
      return unquoted.isEmpty ? null : unquoted;
    }
    return trimmed;
  }
}
