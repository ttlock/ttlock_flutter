/// 开放平台通道参数：`addType` / `changeType` / `deleteType` / `type`。
///
/// `cloudOnly(0)` 仅用于部分删除接口（如二维码 `deleteType=0` 仅云端删除）。
enum ChannelType {
  cloudOnly(0, '仅云端删除（不同步设备）'),
  bleSynced(1, '已由 BLE 完成，仅同步云端'),
  gatewayWifi(2, '经网关/WiFi 远程下发'),
  nbIot(3, 'NB-IoT'),
  wifiPowerSaveAsync(4, 'WiFi 省电异步');

  const ChannelType(this.value, this.label);

  final int value;
  final String label;

  static ChannelType fromValue(int? v) => values.firstWhere(
    (e) => e.value == v,
    orElse: () => ChannelType.bleSynced,
  );
}
