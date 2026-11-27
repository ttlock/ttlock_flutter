import 'package:mocktail/mocktail.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';

/// mocktail mock of [TTLockApi] for tests that call [TTLock.lock] via setImplementations.
class MockTTLockApi extends Mock implements TTLockApi {}

/// mocktail mock of [TTRemoteKeyApi] for tests that call [TTLock.remoteKey].
class MockTTRemoteKeyApi extends Mock implements TTRemoteKeyApi {}

/// mocktail mock of [TTRemoteKeypadApi] for tests that call [TTLock.remoteKeypad].
class MockTTRemoteKeypadApi extends Mock implements TTRemoteKeypadApi {}

/// mocktail mock of [TTDoorSensorApi] for tests that call [TTLock.doorSensor].
class MockTTDoorSensorApi extends Mock implements TTDoorSensorApi {}

/// mocktail mock of [TTGatewayApi] for tests that call [TTLock.gateway].
class MockTTGatewayApi extends Mock implements TTGatewayApi {}

TTLockVersion testLockVersion({int scene = 1}) => TTLockVersion(
  protocolType: 1,
  protocolVersion: 3,
  scene: scene,
  groupId: 0,
  orgId: 0,
);

TTLockScanModel testScan({
  String mac = 'AA:BB',
  bool isInited = false,
  int scene = 1,
  int rssi = -40,
  int timestamp = 1,
  String? lockName,
}) => TTLockScanModel(
  lockName: lockName ?? 'BT-$mac',
  lockMac: mac,
  isInited: isInited,
  isAllowUnlock: true,
  electricQuantity: 80,
  lockVersion: testLockVersion(scene: scene),
  lockSwitchState: TTLockSwitchState.lock,
  rssi: rssi,
  oneMeterRssi: -50,
  timestamp: timestamp,
);

/// 配件（遥控 / 键盘 / 门磁）扫描模型 builder。
TTRemoteAccessoryScanModel testAccessoryScan({
  String name = 'ACC',
  String mac = 'AA:01',
  String? connectAddress,
  int rssi = -40,
  bool isMultifunctionalKeypad = false,
}) => TTRemoteAccessoryScanModel(
  name: name,
  mac: mac,
  connectAddress: connectAddress,
  rssi: rssi,
  isMultifunctionalKeypad: isMultifunctionalKeypad,
  advertisementData: const {},
);

/// 锁 / 遥控 / 门磁 init 返回的系统模型 builder。
TTLockSystemModel testSystemModel({
  String? modelNum,
  String? hardwareRevision,
  String? firmwareRevision,
  int? electricQuantity,
}) => TTLockSystemModel(
  modelNum: modelNum,
  hardwareRevision: hardwareRevision,
  firmwareRevision: firmwareRevision,
  electricQuantity: electricQuantity,
);

void registerTtLockFallbacks() {
  registerFallbackValue(testLockVersion());
  registerFallbackValue(
    TTLockInitParams(
      lockMac: 'AA:BB',
      isInited: false,
      lockVersion: testLockVersion(),
    ),
  );
  registerFallbackValue(TTControlAction.unlock);
  registerFallbackValue(TTLockFunction.autoLock);
  registerFallbackValue(TTLockConfig.audio);
  registerFallbackValue(TTSoundVolumeType.on);
  registerFallbackValue(TTLockDirection.left);
  registerFallbackValue(TTPassageModeType.weekly);
  registerFallbackValue(TTOperateRecordType.total);
  registerFallbackValue(TTLiftWorkActivateType.allFloors);
  registerFallbackValue(testScan());
}

/// 配件类测试额外需要的 fallback（remote/keypad/doorSensor 相关 value types）。
void registerAccessoryFallbacks() {
  registerFallbackValue(const <TTCycleModel>[]);
  registerFallbackValue(TTCycleModel(weekDay: 1, startTime: 0, endTime: 1));
  registerFallbackValue(TTLockFunction.wirelessKeypad);
  registerFallbackValue(TTLockFunction.multiFunctionKeypad);
  registerFallbackValue(testAccessoryScan());
  registerFallbackValue(testSystemModel());
  registerFallbackValue(
    RemoteKeypadInitResult(
      electricQuantity: 80,
      wirelessKeypadFeatureValue: 'fv',
    ),
  );
  registerFallbackValue(
    MultifunctionalKeypadInitResult(
      electricQuantity: 80,
      wirelessKeypadFeatureValue: 'fv',
      slotNumber: 1,
      slotLimit: 5,
    ),
  );
}

/// 设置页 / 详情页常用 stub；测间请配合 [installMockLockApi] / [resetTtLockTestHooks]。
void stubLockApiDefaults(
  MockTTLockApi api, {
  bool Function(TTLockFunction)? supports,
}) {
  when(
    () => api.supportFunction(any(), any(), timeout: any(named: 'timeout')),
  ).thenAnswer((inv) async {
    final f = inv.positionalArguments[0] as TTLockFunction;
    return supports?.call(f) ?? true;
  });
  when(
    () => api.getLockConfig(any(), any(), timeout: any(named: 'timeout')),
  ).thenAnswer((_) async => true);
  when(
    () => api.getRemoteUnlockSwitchState(any(), timeout: any(named: 'timeout')),
  ).thenAnswer((_) async => false);
}

/// 网关蓝牙扫描结果 builder。
TTGatewayScanModel testGatewayScan({
  String gatewayName = 'GW',
  String gatewayMac = 'AA:BB',
  int rssi = -50,
  bool isDfuMode = false,
  TTGatewayType type = TTGatewayType.g2,
}) => TTGatewayScanModel(
  gatewayName: gatewayName,
  gatewayMac: gatewayMac,
  rssi: rssi,
  isDfuMode: isDfuMode,
  type: type,
);

/// 网关附近 WiFi 扫描结果 builder。
TTWifiScanResult testWifiScan({List<TTWifiScanEntry> wifiList = const []}) =>
    TTWifiScanResult(wifiList: wifiList);

/// 网关类测试额外需要的 fallback（gateway 相关 value types）。
void registerGatewayFallbacks() {
  registerFallbackValue(
    TTGatewayInitParams(type: TTGatewayType.g2, ttlockUid: 0),
  );
}

void installMockLockApi(MockTTLockApi api) {
  TTLock.setImplementations(lockApi: api);
}

/// 批量注入配件相关 SDK 实现（仅注入非空项）。
void installMockAccessoryApis({
  MockTTLockApi? lockApi,
  MockTTRemoteKeyApi? remoteKeyApi,
  MockTTRemoteKeypadApi? remoteKeypadApi,
  MockTTDoorSensorApi? doorSensorApi,
}) {
  TTLock.setImplementations(
    lockApi: lockApi,
    remoteKeyApi: remoteKeyApi,
    remoteKeypadApi: remoteKeypadApi,
    doorSensorApi: doorSensorApi,
  );
}

void resetTtLockTestHooks() {
  BleGuard.reset();
  TTLock.configurePigeon();
}
