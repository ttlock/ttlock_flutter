/// 锁扫描到的周边 WiFi。
class WifiNetwork {
  const WifiNetwork({required this.ssid, required this.rssi});

  final String ssid;

  /// 信号强度（dBm）。未知时为 -127。
  final int rssi;

  @override
  bool operator ==(Object other) =>
      other is WifiNetwork && other.ssid == ssid && other.rssi == rssi;

  @override
  int get hashCode => Object.hash(ssid, rssi);

  @override
  String toString() => 'WifiNetwork($ssid, $rssi)';
}
