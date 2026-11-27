/// 设备操作通道。
enum MeterChannel { cloud, ble }

/// 通道判定。
///
/// `detail.online` 一个字段就编码了全部情形——因为**网关会替蓝牙表上报状态**
/// （`userGuide/waterAndEletricMeter.md:17`）：
/// - Cat.1 表配好 server 后自己上报 → `online == true`
/// - 蓝牙表被网关覆盖，网关替它上报 → `online == true`
/// - 蓝牙表无网关覆盖，无人上报 → `online == false`，只能走 BLE
///
/// 因此不需要判 `isCatOne`，也不需要 `gatewayList`（spec §4.1）。
MeterChannel resolveMeterChannel({required bool online}) =>
    online ? MeterChannel.cloud : MeterChannel.ble;
