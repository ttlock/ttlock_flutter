import 'package:pigeon/pigeon.dart';

// 在 ttlock_flutter_platform_interface 目录执行：
//   fvm dart run pigeon --input pigeons/messages.dart

// NOTE:
// - This is a Pigeon input file (interface/schema).
// - Pigeon parses the classes/enums and generates host/Flutter bindings.
// - Pigeon does not require a special "@DataClass" annotation for parsing; we
//   also add explicit constructors for convenience/readability.

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'ttlock_flutter',
    dartOut: 'lib/pigeon/messages.g.dart',
    dartOptions: DartOptions(
      copyrightHeader: <String>['pigeons/copyright.txt'],
    ),
    kotlinOut:
        '../ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt',
    kotlinOptions: KotlinOptions(
      package: 'com.ttlock.ttlock_flutter',
    ),
    swiftOut: '../ttlock_flutter_ios/ios/Classes/Messages.swift',
    swiftOptions: SwiftOptions(),
    arkTSOut: '../ttlock_flutter_ohos/ohos/src/main/ets/components/plugin/Messages.ets',
    arkTSOptions: ArkTSOptions(),
  ),
)

// -----------------------------
// Data Models
// -----------------------------

/// 锁版本信息。
class TTLockVersion {
  /// 协议类型。
  final int protocolType;

  /// 协议版本。
  final int protocolVersion;

  /// 场景。
  final int scene;

  /// 组 ID。
  final int groupId;

  /// 组织 ID。
  final int orgId;

  TTLockVersion({
    required this.protocolType,
    required this.protocolVersion,
    required this.scene,
    required this.groupId,
    required this.orgId,
  });
}

/// 锁初始化参数。
class TTLockInitParams {
  /// 锁蓝牙 MAC 地址。
  final String lockMac;

  /// 锁版本信息。
  final TTLockVersion lockVersion;

  /// 是否已初始化。
  final bool isInited;

  /// 客户端参数。
  final String? clientPara;

  /// 酒店信息。
  final String? hotelInfo;

  /// 楼栋号。
  final int? buildingNumber;

  /// 楼层号。
  final int? floorNumber;

  TTLockInitParams({
    required this.lockMac,
    required this.lockVersion,
    required this.isInited,
    this.clientPara,
    this.hotelInfo,
    this.buildingNumber,
    this.floorNumber,
  });
}

/// 网关初始化参数。
class TTGatewayInitParams {
  /// 网关类型。
  final TTGatewayType type;

  /// TTLock 用户 ID。
  final int ttlockUid;

  /// 网关名称。
  final String? gatewayName;

  /// TTLock 登录密码。
  final String? ttlockLoginPassword;

  /// WiFi 名称。
  final String? wifi;

  /// WiFi 密码。
  final String? wifiPassword;

  /// 服务器 IP 地址。
  final String? serverIp;

  /// 服务器端口。
  final String? serverPort;

  /// 公司 ID。
  final int? companyId;

  /// 分店 ID。
  final int? branchId;

  TTGatewayInitParams({
    required this.type,
    required this.ttlockUid,
    this.gatewayName,
    this.ttlockLoginPassword,
    this.wifi,
    this.wifiPassword,
    this.serverIp,
    this.serverPort,
    this.companyId,
    this.branchId,
  });
}

/// IP 设置模型（静态 IP / DHCP）。
class TTIpSetting {
  /// IP 配置类型。
  final int type;

  /// IP 地址。
  final String? ipAddress;

  /// 子网掩码。
  final String? subnetMask;

  /// 默认网关。
  final String? router;

  /// 首选 DNS。
  final String? preferredDns;

  /// 备用 DNS。
  final String? alternateDns;

  TTIpSetting({
    required this.type,
    this.ipAddress,
    this.subnetMask,
    this.router,
    this.preferredDns,
    this.alternateDns,
  });
}

/// 周期时间段（用于凭证有效期中的周期时间设置）。
class TTCycleModel {
  /// 星期几。
  final int weekDay;

  /// 开始时间。
  final int startTime;

  /// 结束时间。
  final int endTime;

  TTCycleModel({
    required this.weekDay,
    required this.startTime,
    required this.endTime,
  });
}

/// [TTEventChannelApi.lockScanWifi] 订阅前通过 [TTLockHostApi.setLockScanWifiParam] 写入。
class TTLockScanWifiEventParam {
  /// 锁初始化后的加密凭证。
  final String lockData;

  TTLockScanWifiEventParam({required this.lockData});
}

/// lockAddCard / lockAddFingerprint / lockAddFace 订阅前写入（含有效期，毫秒时间戳）。
class TTLockCredentialEventParam {
  /// 锁初始化后的加密凭证。
  final String lockData;

  /// 周期时间段列表，见 [TTCycleModel]。
  final List<TTCycleModel>? cycleList;

  /// 有效期起始，毫秒时间戳。
  final int startDate;

  /// 有效期截止，毫秒时间戳。
  final int endDate;

  TTLockCredentialEventParam({
    required this.lockData,
    this.cycleList,
    required this.startDate,
    required this.endDate,
  });
}

/// accessoryAddKeypadFingerprint / accessoryAddKeypadCard 订阅前写入。
class TTKeypadCredentialEventParam {
  /// 键盘蓝牙 MAC 地址。
  final String keypadMac;

  /// 锁初始化后的加密凭证。
  final String lockData;

  /// 是否为多功能键盘。
  final bool isMultifunctional;

  /// 周期时间段列表，见 [TTCycleModel]。
  final List<TTCycleModel>? cycleList;

  /// 有效期起始，毫秒时间戳。
  final int startDate;

  /// 有效期截止，毫秒时间戳。
  final int endDate;

  TTKeypadCredentialEventParam({
    required this.keypadMac,
    required this.lockData,
    required this.isMultifunctional,
    this.cycleList,
    required this.startDate,
    required this.endDate,
  });
}

/// 开关锁操作结果。
class ControlLockResult {
  /// 锁当前时间。
  final int lockTime;

  /// 电量百分比。
  final int electricQuantity;

  /// 操作唯一 ID。
  final int uniqueId;

  /// 锁初始化后的加密凭证（操作后可能更新）。
  final String? lockData;

  ControlLockResult({
    required this.lockTime,
    required this.electricQuantity,
    required this.uniqueId,
    this.lockData,
  });
}

/// 自动闭锁时间配置。
class AutoLockingTime {
  /// 当前自动闭锁时间。
  final int currentTime;

  /// 最小可设置时间。
  final int minTime;

  /// 最大可设置时间。
  final int maxTime;

  AutoLockingTime({
    required this.currentTime,
    required this.minTime,
    required this.maxTime,
  });
}

/// 锁连接的 WiFi 信息。
class TTWifiInfoModel {
  /// WiFi MAC 地址。
  final String wifiMac;

  /// WiFi 信号强度。
  final int wifiRssi;

  TTWifiInfoModel({
    required this.wifiMac,
    required this.wifiRssi,
  });
}

/// 摄像头锁 WiFi 配置结果。
class CameraLockWifiResult {
  /// 序列号。
  final String serialNumber;

  /// WiFi 名称。
  final String wifiName;

  CameraLockWifiResult({
    required this.serialNumber,
    required this.wifiName,
  });
}

/// 锁系统信息。
class TTLockSystemModel {
  /// 型号。
  final String? modelNum;

  /// 硬件版本。
  final String? hardwareRevision;

  /// 固件版本。
  final String? firmwareRevision;

  /// 电量百分比。
  final int? electricQuantity;

  /// NB 运营商。
  final String? nbOperator;

  /// NB 节点 ID。
  final String? nbNodeId;

  /// NB 卡号。
  final String? nbCardNumber;

  /// NB 信号强度。
  final String? nbRssi;

  /// 锁初始化后的加密凭证。
  final String? lockData;

  TTLockSystemModel({
    this.modelNum,
    this.hardwareRevision,
    this.firmwareRevision,
    this.electricQuantity,
    this.nbOperator,
    this.nbNodeId,
    this.nbCardNumber,
    this.nbRssi,
    this.lockData,
  });
}

/// 配件电量查询结果。
class AccessoryElectricQuantityResult {
  /// 电量百分比。
  final int electricQuantity;

  /// 更新时间，毫秒时间戳。
  final int updateDate;

  AccessoryElectricQuantityResult({
    required this.electricQuantity,
    required this.updateDate,
  });
}

// Scan Models
/// 通行模式配置。
class TTPassageModeModel {
  /// 通行模式类型。
  final TTPassageModeType type;

  /// 每周有效的星期列表。
  final List<int>? weekly;

  /// 每月有效的日期列表。
  final List<int>? monthly;

  /// 有效期起始，毫秒时间戳。
  final int startDate;

  /// 有效期截止，毫秒时间戳。
  final int endDate;

  TTPassageModeModel({
    required this.type,
    this.weekly,
    this.monthly,
    required this.startDate,
    required this.endDate,
  });
}

/// 锁扫描结果。
class TTLockScanModel {
  /// 锁名称。
  final String lockName;

  /// 锁蓝牙 MAC 地址。
  final String lockMac;

  /// 是否已初始化。
  final bool isInited;

  /// 是否允许开锁。
  final bool isAllowUnlock;

  /// 电量百分比。
  final int electricQuantity;

  /// 锁版本信息。
  final TTLockVersion lockVersion;

  /// 锁开关状态。
  final TTLockSwitchState lockSwitchState;

  /// 蓝牙信号强度。
  final int rssi;

  /// 一米处参考信号强度。
  final int oneMeterRssi;

  /// 扫描时间戳。
  final int timestamp;

  TTLockScanModel({
    required this.lockName,
    required this.lockMac,
    required this.isInited,
    required this.isAllowUnlock,
    required this.electricQuantity,
    required this.lockVersion,
    required this.lockSwitchState,
    required this.rssi,
    required this.oneMeterRssi,
    required this.timestamp,
  });
}

/// 密码信息。
class TTPasscodeModel{
  /// 当前密码。
  final String keyboardPwd;

  /// 新密码（修改时使用）。
  final String newKeyboardPwd;

  /// 有效期起始，毫秒时间戳。
  final int startDate;

  /// 有效期截止，毫秒时间戳。
  final int endDate;

  /// 密码类型。
  final int keyboardPwdType;

  /// 周期类型；非周期密码可能为空。
  final int? cycleType;

  TTPasscodeModel({
    required this.keyboardPwd, 
    required this.newKeyboardPwd, 
    required this.startDate, 
    required this.endDate, 
    required this.keyboardPwdType, 
    this.cycleType,
  });
  
}

/// IC 卡信息。
class TTICCardModel {
    /// IC 卡号。
    final String cardNumber;

    /// 有效期起始，毫秒时间戳。
    final int startDate;

    /// 有效期截止，毫秒时间戳。
    final int endDate;

    TTICCardModel({
      required this.cardNumber,
      required this.startDate,
      required this.endDate,
    });
}

/// 指纹信息。
class TTFingerprintModel {
    /// 指纹编号。
    final String fingerprintNumber;

    /// 有效期起始，毫秒时间戳。
    final int startDate;

    /// 有效期截止，毫秒时间戳。
    final int endDate;

    TTFingerprintModel({
      required this.fingerprintNumber,
      required this.startDate,
      required this.endDate,
    });
}

/// 掌静脉信息。
class TTPalmVeinModel {
  /// 掌静脉编号。
  final String palmVeinNumber;

  /// 有效期起始，毫秒时间戳。
  final int startDate;

  /// 有效期截止，毫秒时间戳。
  final int endDate;

  TTPalmVeinModel({
    required this.palmVeinNumber,
    required this.startDate,
    required this.endDate,
  });
}

/// 网关扫描结果。
class TTGatewayScanModel {
  /// 网关名称。
  final String gatewayName;

  /// 网关蓝牙 MAC 地址。
  final String gatewayMac;

  /// 蓝牙信号强度。
  final int rssi;

  /// 是否处于 DFU 升级模式。
  final bool isDfuMode;

  /// 网关类型。
  final TTGatewayType type;

  TTGatewayScanModel({
    required this.gatewayName,
    required this.gatewayMac,
    required this.rssi,
    required this.isDfuMode,
    required this.type,
  });
}

/// 网关设备信息。
class GatewayDeviceInfo {
    /// 型号。
    final String modelNum;

    /// 硬件版本。
    final String hardwareRevision;

    /// 固件版本。
    final String firmwareRevision;

    /// 网络 MAC 地址。
    final String networkMac;

    GatewayDeviceInfo({
      required this.modelNum,
      required this.hardwareRevision,
      required this.firmwareRevision,
      required this.networkMac,
    });
}

/// 遥控配件（遥控器、键盘）扫描结果。
class TTRemoteAccessoryScanModel {
  /// 设备名称。
  final String name;

  /// 蓝牙 MAC 地址。
  final String mac;

  /// 蓝牙信号强度。
  final int rssi;

  /// 扫描时间戳。
  final int? scanTime;

  /// 是否为多功能键盘。
  final bool isMultifunctionalKeypad;

  /// 蓝牙广播数据。
  final Map<String, Object?> advertisementData;

  TTRemoteAccessoryScanModel({
    required this.name,
    required this.mac,
    required this.rssi,
    this.scanTime,
    required this.isMultifunctionalKeypad,
    required this.advertisementData,
  });
}

/// 独立门磁初始化参数。
class TTStandaloneDoorSensorInitParams {
  /// 设备蓝牙 MAC 地址。
  final String mac;

  /// 门磁名称
  final String doorSensorName;

  /// WiFi 名称。
  final String wifiName;

  /// WiFi 密码。
  final String wifiPassword;

  /// 服务器地址。
  final String serverAddress;

  /// 端口号。
  final int portNumber;
  
  TTStandaloneDoorSensorInitParams({
    required this.mac,
    required this.doorSensorName,
    required this.wifiName,
    required this.wifiPassword,
    required this.serverAddress,
    required this.portNumber,
  });
}

/// 独立门磁扫描结果。
class TTStandaloneDoorSensorScanModel {
  /// 设备名称。
  final String name;

  /// 蓝牙 MAC 地址。
  final String mac;

  /// 蓝牙信号强度。
  final int rssi;

  /// 扫描时间戳。
  final int? scanTime;

  TTStandaloneDoorSensorScanModel({
    required this.name,
    required this.mac,
    required this.rssi,
    this.scanTime,
  });
}



/// 独立门磁设备信息。
class TTStandaloneDoorSensorInfo {
  /// 门磁数据。
  final String? doorSensorData;

  /// 电量百分比。
  final int? electricQuantity;

  /// 设备能力位字符串，需按位解析。
  final String? featureValue;

  /// WiFi MAC 地址。
  final String? wifiMac;

  /// 型号。
  final String? modelNum;

  /// 硬件版本。
  final String? hardwareRevision;

  /// 固件版本。
  final String? firmwareRevision;

  TTStandaloneDoorSensorInfo({
    this.doorSensorData,
    this.electricQuantity,
    this.featureValue,
    this.wifiMac,
    this.modelNum,
    this.hardwareRevision,
    this.firmwareRevision,
  });
}

/// 水电表扫描结果（通用）。
class TTMeterScanModel {
  /// 设备名称。
  final String name;

  /// 蓝牙 MAC 地址。
  final String mac;

  /// 蓝牙信号强度。
  final int rssi;

  TTMeterScanModel({
    required this.name,
    required this.mac,
    required this.rssi,
  });
}

/// 水表初始化结果。
class TTWaterMeterInitResult {
  /// 水表 ID。
  final int waterMeterId;

  /// 设备能力位字符串，需按位解析。
  final String featureValue;

  TTWaterMeterInitResult({
    required this.waterMeterId,
    required this.featureValue,
  });
}

/// 电表初始化结果。
class TTElectricMeterInitResult {
  /// 电表 ID。
  final int electricMeterId;

  /// 设备能力位字符串，需按位解析。
  final String featureValue;

  TTElectricMeterInitResult({
    required this.electricMeterId,
    required this.featureValue,
  });
}

/// WiFi 扫描结果列表。
class TTWifiScanResult {
  /// WiFi 扫描条目列表。
  List<TTWifiScanEntry> wifiList;

  TTWifiScanResult({
    required this.wifiList
  });
}

/// WiFi 扫描条目（全可选字段，兼容不同场景）。
class TTWifiScanEntry {
  /// WiFi MAC 地址。
  final String? wifiMac;

  /// WiFi 信号强度。
  final int? wifiRssi;

  /// BSSID。
  final String? bssid;

  /// SSID。
  final String? ssid;

  /// WiFi 名称。
  final String? wifiName;

  /// 名称（兼容字段）。
  final String? name;

  TTWifiScanEntry({
    this.wifiMac,
    this.wifiRssi,
    this.bssid,
    this.ssid,
    this.wifiName,
    this.name,
  });
}

// Accessory init results
/// 无线键盘初始化结果。
class RemoteKeypadInitResult {
  /// 电量百分比。
  final int electricQuantity;

  /// 无线键盘设备能力位字符串，需按位解析。
  final String wirelessKeypadFeatureValue;

  RemoteKeypadInitResult({
    required this.electricQuantity,
    required this.wirelessKeypadFeatureValue,
  });
}

/// 多功能键盘初始化结果。
class MultifunctionalKeypadInitResult {
  /// 电量百分比。
  final int electricQuantity;

  /// 无线键盘设备能力位字符串，需按位解析。
  final String wirelessKeypadFeatureValue;

  /// 当前槽位编号。
  final int slotNumber;

  /// 槽位上限。
  final int slotLimit;

  /// 型号。
  final String? modelNum;

  /// 硬件版本。
  final String? hardwareRevision;

  /// 固件版本。
  final String? firmwareRevision;

  MultifunctionalKeypadInitResult({
    required this.electricQuantity,
    required this.wirelessKeypadFeatureValue,
    required this.slotNumber,
    required this.slotLimit,
    this.modelNum,
    this.hardwareRevision,
    this.firmwareRevision,
  });
}

/// 水表 Cat.1 设备信息。
class WaterMeterDeviceInfo {
  /// Cat.1 卡号。
  final String catOneCardNumber;

  /// Cat.1 IMSI。
  final String catOneImsi;

  /// Cat.1 节点 ID。
  final String catOneNodeId;

  /// Cat.1 运营商。
  final String catOneOperator;

  /// Cat.1 信号强度。
  final int catOneRssi;

  WaterMeterDeviceInfo({
    required this.catOneCardNumber,
    required this.catOneImsi,
    required this.catOneNodeId,
    required this.catOneOperator,
    required this.catOneRssi,
  });
}

/// 电表 Cat.1 设备信息。
class ElectricMeterDeviceInfo {
  /// Cat.1 卡号。
  final String catOneCardNumber;

  /// Cat.1 IMSI。
  final String catOneImsi;

  /// Cat.1 节点 ID。
  final String catOneNodeId;

  /// Cat.1 运营商。
  final String catOneOperator;

  /// Cat.1 信号强度。
  final int catOneRssi;

  ElectricMeterDeviceInfo({
    required this.catOneCardNumber,
    required this.catOneImsi,
    required this.catOneNodeId,
    required this.catOneOperator,
    required this.catOneRssi,
  });
}

/// 水表初始化参数。
class TTWaterMeterInitParam {
  /// 设备蓝牙 MAC 地址。
  final String mac;

  /// 设备名称。
  final String name;

  /// 计费模式。
  final TTMeterPayMode payMode;

  /// 单价。
  final double price;

  TTWaterMeterInitParam({
    required this.mac,
    required this.name,
    required this.payMode,
    required this.price,
  });
}

/// 电表初始化参数。
class TTElectricMeterInitParam {
  /// 设备蓝牙 MAC 地址。
  final String mac;

  /// 设备名称。
  final String name;

  /// 计费模式。
  final TTMeterPayMode payMode;

  /// 单价。
  final double price;

  TTElectricMeterInitParam({
    required this.mac,
    required this.name,
    required this.payMode,
    required this.price,
  });
}

// Event Models

/// 刷卡录入流阶段。
enum TTAddCardPhase {
  /// 已进入刷卡模式，等待用户刷卡。
  waiting,

  /// 刷卡成功，[AddCardEvent.cardNumber] 有效。
  success,
}

/// 指纹录入流阶段。
enum TTAddFingerprintPhase {
  /// 已进入录入模式，等待首次按压。
  waiting,

  /// 采集中，见 [AddFingerprintEvent.currentCount] / [totalCount]。
  collecting,

  /// 录入成功，[AddFingerprintEvent.fingerprintNumber] 有效。
  success,
}

/// 人脸录入流阶段。
enum TTAddFacePhase {
  /// 可开始人脸采集。
  canStartAdd,

  /// 采集中，见 [AddFaceEvent.errorCode] 获取实时反馈。
  collecting,

  /// 采集异常，见 [AddFaceEvent.errorCode]。
  error,

  /// 录入成功，[AddFaceEvent.faceNumber] 有效。
  success,
}

/// 刷卡录入流事件。
class AddCardEvent {
  /// 录入阶段。
  final TTAddCardPhase phase;

  /// IC 卡号，[TTAddCardPhase.success] 时有效。
  final String? cardNumber;

  AddCardEvent({
    required this.phase,
    this.cardNumber,
  });
}

/// 指纹录入流事件。
class AddFingerprintEvent {
  /// 录入阶段。
  final TTAddFingerprintPhase phase;

  /// 当前采集次数。
  final int? currentCount;

  /// 总采集次数。
  final int? totalCount;

  /// 指纹编号，[TTAddFingerprintPhase.success] 时有效。
  final String? fingerprintNumber;

  AddFingerprintEvent({
    required this.phase,
    this.currentCount,
    this.totalCount,
    this.fingerprintNumber,
  });
}

/// 人脸录入流事件。
class AddFaceEvent {
  /// 录入阶段。
  final TTAddFacePhase phase;

  /// 人脸录入错误码。
  final TTFaceErrorCode? errorCode;

  /// 人脸编号，[TTAddFacePhase.success] 时有效。
  final String? faceNumber;

  AddFaceEvent({
    required this.phase,
    this.errorCode,
    this.faceNumber,
  });
}

/// 掌静脉录入流阶段。
enum TTAddPalmVeinPhase {
  /// 可开始掌静脉采集。
  canStartAdd,

  /// 采集异常，见 [AddPalmVeinEvent.errorCode]。
  error,

  /// 录入成功，[AddPalmVeinEvent.palmVeinNumber] 有效。
  success,
}

/// 掌静脉录入流事件。
class AddPalmVeinEvent {
  /// 录入阶段。
  final TTAddPalmVeinPhase phase;

  /// 掌静脉录入错误码。
  final TTPalmVeinErrorCode? errorCode;

  /// 掌静脉编号，[TTAddPalmVeinPhase.success] 时有效。
  final String? palmVeinNumber;

  AddPalmVeinEvent({
    required this.phase,
    this.errorCode,
    this.palmVeinNumber,
  });
}

// -----------------------------
// Enums
// -----------------------------

/// 蓝牙适配器状态。
enum TTBluetoothState {
  /// 未知。
  unknow,

  /// 重置中。
  resetting,

  /// 不支持。
  unsupported,

  /// 未授权。
  unAuthorized,

  /// 已关闭。
  turnOff,

  /// 已开启。
  turnOn,
}

/// 密码类型。
enum TTPasscodeType {
  /// 一次性。
  once,

  /// 永久。
  permanent,

  /// 限期。
  period,

  /// 周期。
  cycle,
}

/// 操作记录查询类型。
enum TTOperateRecordType {
  /// 最新。
  latest,

  /// 全部。
  total,
}

/// 锁控制动作。
enum TTControlAction {
  /// 开锁。
  unlock,

  /// 关锁。
  lock,
}

/// 锁开关状态。
enum TTLockSwitchState {
  /// 已关锁。
  lock,

  /// 已开锁。
  unlock,

  /// 未知。
  unknow,
}

/// 通行模式类型。
enum TTPassageModeType {
  /// 按周。
  weekly,

  /// 按月。
  monthly,
}

/// 锁配置项。
enum TTLockConfig {
  /// 声音。
  audio,

  /// 密码可见。
  passcodeVisible,

  /// 冻结。
  freeze,

  /// 防撬警报。
  tamperAlert,

  /// 重置按钮。
  resetButton,

  /// 隐私锁。
  privacyLock,

  /// 通行模式自动开锁。
  passageModeAutoUnlock,

  /// WiFi 锁省电模式。
  wifiLockPowerSavingMode,

  /// 双重认证。
  doubleAuth,

  /// 公共模式。
  publicMode,

  /// 低电量自动开锁。
  lowBatteryAutoUnlock,

  /// 安全 M1 卡。
  securityM1Card,

  /// 半自动模式控制。
  semiAutomaticModeControl,

  /// 锁监管。
  lockSupervision,
}

/// 锁安装方向。
enum TTLockDirection {
  /// 左开。
  left,

  /// 右开。
  right,
}

/// 音量档位。
enum TTSoundVolumeType {
  /// 一档。
  firstLevel,

  /// 二档。
  secondLevel,

  /// 三档。
  thirdLevel,

  /// 四档。
  fourthLevel,

  /// 五档。
  fifthLevel,

  /// 关闭。
  off,

  /// 开启。
  on,
}

/// 灵敏度档位。
enum TTSensitivityValue {
  /// 关闭。
  off,

  /// 低。
  low,

  /// 中。
  medium,

  /// 高。
  high,
}

/// 锁操作错误码。
enum TTLockError {
  /// 成功。
  success,

  /// 锁已重置。
  reseted,

  /// CRC 校验错误。
  crcError,

  /// 无权限。
  noPermisstion,

  /// 管理员密码错误。
  wrongAdminCode,

  /// 存储空间不足。
  noStorageSpace,

  /// 正在设置模式。
  inSettingMode,

  /// 无管理员。
  noAdmin,

  /// 不在设置模式。
  notInSettingMode,

  /// 动态码错误。
  wrongDynamicCode,

  /// 电量不足。
  noPower,

  /// 重置密码。
  resetPasscode,

  /// 更新密码索引。
  unpdatePasscodeIndex,

  /// 无效锁标识位置。
  invalidLockFlagPos,

  /// 电子钥匙已过期。
  ekeyExpired,

  /// 密码长度无效。
  passcodeLengthInvalid,

  /// 密码相同。
  samePasscodes,

  /// 电子钥匙未激活。
  ekeyInactive,

  /// AES 密钥错误。
  aesKey,

  /// 通用失败。
  fail,

  /// 密码已存在。
  passcodeExist,

  /// 密码不存在。
  passcodeNotExist,

  /// 添加密码时存储空间不足。
  lackOfStorageSpaceWhenAddingPasscodes,

  /// 参数长度无效。
  invalidParaLength,

  /// 卡不存在。
  cardNotExist,

  /// 指纹重复。
  fingerprintDuplication,

  /// 指纹不存在。
  fingerprintNotExist,

  /// 无效指令。
  invalidCommand,

  /// 处于冻结模式。
  inFreezeMode,

  /// 客户端参数无效。
  invalidClientPara,

  /// 锁已锁定。
  lockIsLocked,

  /// 记录不存在。
  recordNotExist,

  /// 不支持修改密码。
  notSupportModifyPasscode,

  /// 蓝牙已关闭。
  bluetoothOff,

  /// 蓝牙连接超时。
  bluetoothConnectTimeount,

  /// 蓝牙断开连接。
  bluetoothDisconnection,

  /// 锁正忙。
  lockIsBusy,

  /// 无效的锁数据。
  invalidLockData,

  /// 无效参数。
  invalidParameter,

  /// WiFi 错误。
  wrongWifi,

  /// WiFi 密码错误。
  wrongWifiPassword,

  /// 扫描已经开始。
  scanFailedAlreadyStart,

  /// 应用注册失败。
  scanFailedApplicationRegistrationFailed,

  /// 扫描内部错误。
  scanFailedInternalError,

  /// 功能不支持。
  scanFailedFeatureUnsupported,

  /// 硬件资源不足。
  scanFailedOutOfHardwareResources,

  /// 无线键盘初始化失败。
  initWirelessKeyboardFailed,

  /// 无线键盘无响应。
  wirelessKeyboardNoResponse,

  /// 设备连接失败。
  deviceConnectFailed,

  /// 签名验证失败。
  signatureVerificationFailed,

  /// 无效的应用。
  invalidApplication,
}

/// 错误所属设备类型。
enum TTErrorDevice {
  /// 锁。
  lock,

  /// 键盘。
  keyPad,

  /// 钥匙。
  key,
}

/// 电梯联动激活类型。
enum TTLiftWorkActivateType {
  /// 全部楼层。
  allFloors,

  /// 指定楼层。
  specificFloors,
}

/// 省电模式工作类型。
enum TTPowerSaverWorkType {
  /// 全部卡。
  allCards,

  /// 酒店卡。
  hotelCard,

  /// 房卡。
  roomCard,
}

/// 网关型号。
enum TTGatewayType {
  /// G2 网关。
  g2,

  /// G3 网关。
  g3,

  /// G4 网关。
  g4,

  /// G5 网关。
  g5,

  /// G6 网关。
  g6,
}

/// 网关连接状态。
enum TTGatewayConnectStatus {
  /// 超时。
  timeout,

  /// 成功。
  success,

  /// 失败。
  failed,
}

/// 网关操作错误码。
enum TTGatewayError {
  /// 成功。
  success,

  /// 失败。
  failed,

  /// WiFi 名称错误。
  badWifiName,

  /// WiFi 密码错误。
  badWifiPassword,

  /// 无效指令。
  invalidCommand,

  /// 超时。
  timeOut,

  /// 无 SIM 卡。
  noSimCard,

  /// 无网线。
  noCable,

  /// CRC 校验错误。
  wrongCRC,

  /// AES 密钥错误。
  wrongAesKey,

  /// 配置路由器失败。
  failedConfigureRouter,

  /// 配置服务器失败。
  failedConfigureServer,

  /// 配置账号失败。
  failedConfigureAccount,

  /// 通信断开。
  communicationDisconnected,

  /// 未连接。
  unConnected,

  /// 连接超时。
  connectTimeout,

  /// 数据格式错误。
  dataFormatError,

  /// 配置账号失败。
  failedConfigAccount,

  /// 配置 IP 失败。
  failedConfigIp,

  /// 无效 IP。
  invalidIp,
}

/// 远程配件操作错误码。
enum TTRemoteAccessoryError {
  /// 成功。
  success,

  /// 失败。
  failed,

  /// 无响应。
  noResponse,

  /// CRC 校验错误。
  wrongCRC,

  /// 请求失败。
  requestFailed,

  /// 连接失败。
  connectFailed,

  /// 设备正忙。
  deviceIsBusy,

  /// 数据格式错误。
  dataFormatError,
}

/// 多功能键盘操作错误码。
enum TTMultifunctionalKeypadError {
  /// 成功。
  success,

  /// 失败。
  failed,

  /// 指纹重复。
  duplicateFingerprint,

  /// 存储空间不足。
  noStorageSpace,

  /// CRC 校验错误。
  wrongCRC,

  /// 无响应。
  noResponse,

  /// 键盘连接失败。
  keypadConnectFailed,

  /// 数据格式错误。
  dataFormatError,
}

/// 远程配件类型。
enum TTRemoteAccessory {
  /// 遥控器。
  remoteKey,

  /// 无线键盘。
  remoteKeypad,

  /// 门磁。
  doorSensor,
}

/// IP 设置类型。
enum TTIpSettingType {
  /// 静态 IP。
  staticIp,

  /// 动态 IP（DHCP）。
  dhcp,
}

/// NB 唤醒模式。
enum TTNbAwakeMode {
  /// 键盘。
  keypad,

  /// 卡。
  card,

  /// 指纹。
  fingerprint,
}

/// NB 唤醒时间类型。
enum TTNbAwakeTimeType {
  /// 定点。
  point,

  /// 间隔。
  interval,
}

/// 锁功能能力位。
enum TTLockFunction {
  /// 密码。
  passcode,

  /// IC 卡。
  icCard,

  /// 指纹。
  fingerprint,

  /// 手环。
  wristband,

  /// 自动闭锁。
  autoLock,

  /// 删除密码。
  deletePasscode,

  /// 管理密码。
  managePasscode,

  /// 锁定。
  locking,

  /// 密码可见。
  passcodeVisible,

  /// 网关开锁。
  gatewayUnlock,

  /// 锁冻结。
  lockFreeze,

  /// 周期密码。
  cyclePassword,

  /// 开锁开关。
  unlockSwitch,

  /// 声音开关。
  audioSwitch,

  /// NB-IoT。
  nbIoT,

  /// 获取管理员密码。
  getAdminPasscode,

  /// 酒店卡。
  hotelCard,

  /// 无时钟。
  noClock,

  /// 正常模式不广播。
  noBroadcastInNormal,

  /// 通行模式。
  passageMode,

  /// 关闭自动闭锁。
  turnOffAutoLock,

  /// 无线键盘。
  wirelessKeypad,

  /// 灯光。
  light,

  /// 酒店卡黑名单。
  hotelCardBlacklist,

  /// 身份证。
  identityCard,

  /// 防撬警报。
  tamperAlert,

  /// 重置按钮。
  resetButton,

  /// 隐私锁。
  privacyLock,

  /// 死锁。
  deadLock,

  /// 周期卡或指纹。
  cyclicCardOrFingerprint,

  /// 指静脉。
  fingerVein,

  /// BLE 5.0。
  ble5G,

  /// NB 唤醒。
  nbAwake,

  /// 恢复周期密码。
  recoverCyclePasscode,

  /// 遥控钥匙。
  remoteKey,

  /// 获取配件电量。
  getAccessoryElectricQuantity,

  /// 音量和语言设置。
  soundVolumeAndLanguageSetting,

  /// 二维码。
  qrCode,

  /// 门磁状态。
  doorSensorState,

  /// 通行模式自动开锁设置。
  passageModeAutoUnlockSetting,

  /// 门磁。
  doorSensor,

  /// 门磁警报。
  doorSensorAlert,

  /// 灵敏度。
  sensitivity,

  /// 人脸。
  face,

  /// CPU 卡。
  cpuCard,

  /// WiFi 锁。
  wifiLock,

  /// WiFi 锁静态 IP。
  wifiLockStaticIP,

  /// 密码按键数量。
  passcodeKeyNumber,

  /// 独立激活。
  standAloneActivation,

  /// 双重认证。
  doubleAuth,

  /// 授权开锁。
  authorizedUnlock,

  /// 网关授权开锁。
  gatewayAuthorizedUnlock,

  /// 无电子钥匙开锁。
  noEkeyUnlock,

  /// 指安拍照人脸。
  zhiAnPhotoFace,

  /// 掌静脉。
  palmVein,

  /// WiFi 区域。
  wifiArea,

  /// 小草摄像头。
  xiaoCaoCamera,

  /// 通过编码重置锁。
  resetLockByCode,

  /// 第三方蓝牙设备。
  thirdPartyBluetoothDevice,

  /// 自动设置角度。
  autoSetAngle,

  /// 手动设置角度。
  manualSetAngle,

  /// 控制斜舌。
  controlLatchBolt,

  /// 自动设置开锁方向。
  autoSetUnlockDirection,

  /// IC 卡安全设置。
  icCardSecuritySetting,

  /// WiFi 省电时间。
  wifiPowerSavingTime,

  /// 多功能键盘。
  multiFunctionKeypad,

  /// 不支持关闭斜舌。
  doNotSupportTurnOffLatchBolt,

  /// 公共模式。
  publicMode,

  /// 低电量自动开锁。
  lowBatteryAutoUnlock,

  /// 电机驱动时间。
  motorDriveTime,

  /// 修改特征值。
  modifyFeatureValue,

  /// 修改锁名前缀。
  modifyLockNamePrefix,

  /// 授权码。
  authCode,

  /// 未授权尝试警报。
  unauthorizedAttemptAlarm,

  /// 省电模式支持 WiFi。
  powerSaverSupportWifi,

  /// 蓝牙广播设置。
  bluetoothAdvertisingSetting,

  /// 工作模式。
  workingMode,

  /// 供应商代码。
  supplierCode,

  /// Cat.1。
  catOne,

  /// 强制开门警报。
  forcedOpeningDoorAlarm,

  /// 指安人脸特征第二代。
  zhiAnFaceFeatureSecondGeneration,

  /// 支持死锁。
  supportDeadLocking,

  /// 工作时间。
  workingTime,

  /// 自定义二维码。
  customQRCode,

  /// 安全 M1 卡。
  securityM1Card,

  /// 易盛人脸。
  yiShengPhotoFace,

  /// 图片人脸传输。
  pictureFaceDelivery,

  /// 支持设置别名。
  supportSetAlias,

  /// 隐藏 WiFi/Cat.1 休眠模式设置。
  hideWifiCatOneSleepModeSetting,

  /// 半自动模式控制。
  semiAutomaticModeControl,

  /// 支持设置用户属性。
  supportSetUserAttributes,

  /// 支持监管。
  supportSupervision,
}

/// 人脸录入状态。
enum TTFaceState {
  /// 可开始添加。
  canStartAdd,

  /// 错误。
  error,
}

/// 水表功能特性。
enum TTWaterMeterFeature {
  /// Cat.1。
  catOne,
}

/// 电表功能特性。
enum TTElectricMeterFeature {
  /// Cat.1。
  catOne,

  /// Telink。
  telink,
}

/// 独立门磁操作错误码。
enum TTStandaloneDoorSensorError {
  /// 成功。
  success,

  /// 失败。
  failed,

  /// CRC 校验错误。
  wrongCRC,

  /// Wi-Fi 名称错误。
  wrongSSID,

  /// Wi-Fi 密码错误。
  wrongWifiPassword,

  /// MAC 地址错误。
  badMacAddress,

  /// Token 错误。
  badToken,

  /// 蓝牙未开启。
  bluetoothPowerOff,

  /// 连接超时。
  connectTimeout,

  /// 连接断开。
  disconnect,

  /// 设备无响应。
  noResponse,

  /// 连接失败。
  connectFailed,

  /// 设备正忙。
  deviceIsBusy,

  /// 数据格式错误。
  dataFormatError,
}

/// 独立门磁功能特性。
enum TTStandaloneDoorSensorFeature {
  /// 2.4G Wi-Fi。
  wifi24G,

  /// 5G Wi-Fi。
  wifi5G,

  /// 授权码。
  authCode,

  /// 告警。
  alarm,
}

/// 水电表付费模式。
enum TTMeterPayMode {
  /// 后付费。
  postpaid,

  /// 预付费。
  prepaid,
}

/// 人脸采集错误码。
enum TTFaceErrorCode {
  /// 正常。
  normal,

  /// 未检测到人脸。
  noFaceDetected,

  /// 距离顶部过近。
  tooCloseToTheTop,

  /// 距离底部过近。
  tooCloseToTheBottom,

  /// 距离左侧过近。
  tooCloseToTheLeft,

  /// 距离右侧过近。
  tooCloseToTheRight,

  /// 距离过远。
  tooFarAway,

  /// 距离过近。
  tooClose,

  /// 眉毛被遮挡。
  eyebrowsCovered,

  /// 眼睛被遮挡。
  eyesCovered,

  /// 面部被遮挡。
  faceCovered,

  /// 人脸方向不正确。
  faceDirection,

  /// 检测到睁眼。
  eyeOpeningDetected,

  /// 眼睛闭合状态。
  eyesClosedStatus,

  /// 检测眼睛失败。
  failedToDetectEye,

  /// 需要将头转向左侧。
  needTurnHeadToLeft,

  /// 需要将头转向右侧。
  needTurnHeadToRight,

  /// 需要抬头。
  needRaiseHead,

  /// 需要低头。
  needLowerHead,

  /// 需要将头向左倾斜。
  needTiltHeadToLeft,

  /// 需要将头向右倾斜。
  needTiltHeadToRight,
}

/// 掌静脉采集错误码。
enum TTPalmVeinErrorCode {
  /// 未知状态。
  unknownStatus,

  /// 未检测到掌静脉。
  noPalmVeinDetected,

  /// 掌部矩形置信度低。
  palmRectConfLow,

  /// 掌部关键点置信度低。
  palmLandmarkConfLow,

  /// 掌部旋转角度错误。
  palmAngleRollError,

  /// 掌部倾斜角度错误。
  palmAngleLeanError,

  /// 掌部被遮挡。
  palmBlock,

  /// 掌部模糊。
  palmBlur,

  /// 手背朝上。
  palmBack,
}

// -----------------------------
// Host APIs (called from Flutter)
// -----------------------------
@HostApi()
abstract class TTLockHostApi {
  /// 订阅 [TTEventChannelApi.lockScanWifi] 前调用。
  ///
  /// [param] WiFi 扫描事件参数。
  void setLockScanWifiParam(TTLockScanWifiEventParam param);

  /// 订阅 [TTEventChannelApi.lockAddCard] 前调用。
  ///
  /// [param] 刷卡录入事件参数。
  void setLockAddCardParam(TTLockCredentialEventParam param);

  /// 订阅 [TTEventChannelApi.lockAddFingerprint] 前调用。
  ///
  /// [param] 指纹录入事件参数。
  void setLockAddFingerprintParam(TTLockCredentialEventParam param);

  /// 订阅 [TTEventChannelApi.lockAddFace] 前调用。
  ///
  /// [param] 人脸录入事件参数。
  void setLockAddFaceParam(TTLockCredentialEventParam param);

  /// 订阅 [TTEventChannelApi.lockAddPalmVein] 前调用。
  ///
  /// [param] 掌静脉录入事件参数。
  void setLockAddPalmVeinParam(TTLockCredentialEventParam param);

  /// 获取蓝牙状态。
  TTBluetoothState getBluetoothState();

  /// 初始化锁。
  ///
  /// 返回加密后的 [lockData] 凭证，后续操作均依赖此凭证。
  ///
  /// [params] 初始化参数。
  @async
  String initLock(TTLockInitParams params);

  /// 重置锁。
  ///
  /// [lockData] 锁凭证。
  @async
  void resetLock(String lockData);

  /// 重置电子钥匙。
  ///
  /// 返回新的 [lockData] 凭证。
  ///
  /// [lockData] 当前锁凭证。
  @async
  String resetEkey(String lockData);

  /// 通过编码重置锁。
  ///
  /// [lockMac] 锁蓝牙 MAC 地址。
  /// [resetCode] 重置码。
  @async
  void resetLockByCode(String lockMac, String resetCode);

  /// 验证锁。
  ///
  /// [lockMac] 锁蓝牙 MAC 地址。
  @async
  void verifyLock(String lockMac);

  /// 控制锁开/关。
  ///
  /// [lockData] 锁凭证。
  /// [action] 开锁或关锁动作。
  @async
  ControlLockResult controlLock(String lockData, TTControlAction action);

  /// 获取锁开关状态。
  ///
  /// [lockData] 锁凭证。
  @async
  TTLockSwitchState getLockSwitchState(String lockData);

  /// 查询锁是否支持某功能。
  ///
  /// [lockFunction] 待查询的功能项。
  /// [lockData] 锁凭证。
  bool supportFunction(TTLockFunction lockFunction, String lockData);

  /// 创建自定义密码。
  ///
  /// [passcode] 密码内容。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void createCustomPasscode(String passcode, int startDate, int endDate, String lockData);

  /// 修改密码。
  ///
  /// [passcodeOrigin] 原密码。
  /// [passcodeNew] 新密码，为 null 时仅修改有效期。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void modifyPasscode(String passcodeOrigin, String? passcodeNew, int startDate, int endDate, String lockData);

  /// 删除密码。
  ///
  /// [passcode] 待删除的密码。
  /// [lockData] 锁凭证。
  @async
  void deletePasscode(String passcode, String lockData);

  /// 重置密码。
  ///
  /// 返回新生成的密码。
  ///
  /// [lockData] 锁凭证。
  @async
  String resetPasscode(String lockData);

  /// 获取管理员密码。
  ///
  /// [lockData] 锁凭证。
  @async
  String getAdminPasscode(String lockData);

  /// 设置擦除密码。
  ///
  /// [erasePasscode] 擦除密码。
  /// [lockData] 锁凭证。
  void setErasePasscode(String erasePasscode, String lockData);

  /// 获取所有有效密码。
  ///
  /// [lockData] 锁凭证。
  @async
  List<TTPasscodeModel> getAllValidPasscodes(String lockData);

  /// 恢复密码。
  ///
  /// [passcode] 原密码。
  /// [passcodeNew] 新密码。
  /// [type] 密码类型。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [cycleType] 周期类型。
  /// [lockData] 锁凭证。
  @async
  void recoverPasscode(
    String passcode,
    String passcodeNew,
    TTPasscodeType type,
    int startDate,
    int endDate,
    int cycleType,
    String lockData,
  );

  /// 修改管理员密码。
  ///
  /// [adminPasscode] 新管理员密码。
  /// [lockData] 锁凭证。
  @async
  String? modifyAdminPasscode(String adminPasscode, String lockData);

  /// 获取密码验证参数。
  ///
  /// [lockData] 锁凭证。
  @async
  String getPasscodeVerificationParams(String lockData);

  /// 修改卡有效期。
  ///
  /// [cardNumber] 卡号。
  /// [cycleList] 周期时间段列表。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void modifyCardValidityPeriod(
    String cardNumber,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );

  /// 删除卡。
  ///
  /// [cardNumber] 卡号。
  /// [lockData] 锁凭证。
  @async
  void deleteCard(String cardNumber, String lockData);

  /// 获取所有有效卡。
  ///
  /// [lockData] 锁凭证。
  @async
  List<TTICCardModel> getAllValidCards(String lockData);

  /// 清除所有卡。
  ///
  /// [lockData] 锁凭证。
  @async
  void clearAllCards(String lockData);

  /// 恢复卡。
  ///
  /// [cardNumber] 卡号。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void recoverCard(String cardNumber, int startDate, int endDate, String lockData);

  /// 挂失卡。
  ///
  /// [cardNumber] 卡号。
  /// [lockData] 锁凭证。
  @async
  void reportLossCard(String cardNumber, String lockData);

  /// 修改指纹有效期。
  ///
  /// [fingerprintNumber] 指纹编号。
  /// [cycleList] 周期时间段列表。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void modifyFingerprintValidityPeriod(
    String fingerprintNumber,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );

  /// 删除指纹。
  ///
  /// [fingerprintNumber] 指纹编号。
  /// [lockData] 锁凭证。
  @async
  void deleteFingerprint(String fingerprintNumber, String lockData);

  /// 获取所有有效指纹。
  ///
  /// [lockData] 锁凭证。
  @async
  List<TTFingerprintModel> getAllValidFingerprints(String lockData);

  /// 清除所有指纹。
  ///
  /// [lockData] 锁凭证。
  @async
  void clearAllFingerprints(String lockData);

  /// 修改人脸有效期。
  ///
  /// [faceNumber] 人脸编号。
  /// [cycleList] 周期时间段列表。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void modifyFace(String faceNumber, List<TTCycleModel>? cycleList, int startDate, int endDate, String lockData);

  /// 添加人脸数据。
  ///
  /// 返回人脸编号。
  ///
  /// [cycleList] 周期时间段列表。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [faceFeatureData] 人脸特征数据。
  /// [lockData] 锁凭证。
  @async
  String addFaceData(List<TTCycleModel>? cycleList, int startDate, int endDate, String faceFeatureData, String lockData);

  /// 删除人脸。
  ///
  /// [faceNumber] 人脸编号。
  /// [lockData] 锁凭证。
  @async
  void deleteFace(String faceNumber, String lockData);

  /// 清除所有人脸。
  ///
  /// [lockData] 锁凭证。
  @async
  void clearFace(String lockData);

  /// 修改掌静脉有效期。
  ///
  /// [palmVeinNumber] 掌静脉编号。
  /// [cycleList] 周期时间段列表。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void modifyPalmVein(
    String palmVeinNumber,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );

  /// 删除掌静脉。
  ///
  /// [palmVeinNumber] 掌静脉编号。
  /// [lockData] 锁凭证。
  @async
  void deletePalmVein(String palmVeinNumber, String lockData);

  /// 清除所有掌静脉。
  ///
  /// [lockData] 锁凭证。
  @async
  void clearPalmVein(String lockData);

  /// 获取所有有效掌静脉。
  ///
  /// [lockData] 锁凭证。
  @async
  List<TTPalmVeinModel> getAllValidPalmVeins(String lockData);

  /// 设置电机扭矩等级。
  ///
  /// [torqueLevel] 扭矩等级。
  /// [lockData] 锁凭证。
  @async
  void setMotorTorqueLevel(int torqueLevel, String lockData);

  /// 设置锁斜舌保持时间。
  ///
  /// [keepTime] 斜舌保持时间（秒）。
  /// [lockData] 锁凭证。
  @async
  void setLockLatchBolt(int keepTime, String lockData);

  /// 设置锁时间。
  ///
  /// [timestamp] 目标时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void setLockTime(int timestamp, String lockData);

  /// 获取锁时间。
  ///
  /// 返回锁当前时间，毫秒时间戳。
  ///
  /// [lockData] 锁凭证。
  @async
  int getLockTime(String lockData);

  /// 设置锁工作时间。
  ///
  /// [startDate] 工作时段起始时间。
  /// [endDate] 工作时段结束时间。
  /// [lockData] 锁凭证。
  @async
  void setLockWorkingTime(int startDate, int endDate, String lockData);

  /// 获取锁操作记录。
  ///
  /// [type] 操作记录类型。
  /// [lockData] 锁凭证。
  @async
  String getLockOperateRecord(TTOperateRecordType type, String lockData);

  /// 获取锁电量。
  ///
  /// 返回电量百分比。
  ///
  /// [lockData] 锁凭证。
  @async
  int getLockPower(String lockData);

  /// 获取锁系统信息。
  ///
  /// [lockData] 锁凭证。
  @async
  TTLockSystemModel getLockSystemInfo(String lockData);

  /// 获取锁特征值。
  ///
  /// [lockData] 锁凭证。
  @async
  String getLockFeatureValue(String lockData);

  /// 获取自动闭锁周期时间。
  ///
  /// [lockData] 锁凭证。
  @async
  AutoLockingTime getAutoLockingPeriodicTime(String lockData);

  /// 设置自动闭锁周期时间。
  ///
  /// [seconds] 自动闭锁周期（秒）。
  /// [lockData] 锁凭证。
  @async
  void setAutoLockingPeriodicTime(int seconds, String lockData);

  /// 获取远程开锁开关状态。
  ///
  /// [lockData] 锁凭证。
  @async
  bool getRemoteUnlockSwitchState(String lockData);

  /// 设置远程开锁开关。
  ///
  /// [isOn] 是否开启远程开锁。
  /// [lockData] 锁凭证。
  @async
  String setRemoteUnlockSwitchState(bool isOn, String lockData);

  /// 获取锁配置项。
  ///
  /// [config] 配置项类型。
  /// [lockData] 锁凭证。
  @async
  bool getLockConfig(TTLockConfig config, String lockData);

  /// 设置锁配置项。
  ///
  /// [config] 配置项类型。
  /// [isOn] 是否开启。
  /// [lockData] 锁凭证。
  @async
  void setLockConfig(TTLockConfig config, bool isOn, String lockData);

  /// 获取灯光时间。
  ///
  /// [lockData] 锁凭证。
  @async
  int getLightTime(String lockData);

  /// 设置灯光时间。
  ///
  /// [seconds] 灯光持续时间（秒）。
  /// [lockData] 锁凭证。
  @async
  void setLightTime(int seconds, String lockData);

  /// 获取锁方向。
  ///
  /// [lockData] 锁凭证。
  @async
  TTLockDirection getLockDirection(String lockData);

  /// 设置锁方向。
  ///
  /// [direction] 锁安装方向。
  /// [lockData] 锁凭证。
  @async
  void setLockDirection(TTLockDirection direction, String lockData);

  /// 添加通行模式。
  ///
  /// [type] 通行模式类型。
  /// [weekly] 每周生效日列表。
  /// [monthly] 每月生效日列表。
  /// [startTime] 每日起始时间。
  /// [endTime] 每日结束时间。
  /// [lockData] 锁凭证。
  @async
  void addPassageMode(
    TTPassageModeType type,
    List<int>? weekly,
    List<int>? monthly,
    int startTime,
    int endTime,
    String lockData,
  );

  /// 清除所有通行模式。
  ///
  /// [lockData] 锁凭证。
  @async
  void clearAllPassageModes(String lockData);

  /// 获取通行模式列表。
  ///
  /// [lockData] 锁凭证。
  @async
  List<TTPassageModeModel> getPassageModes(String lockData);

  /// 激活电梯楼层。
  ///
  /// [floors] 待激活的楼层。
  /// [lockData] 锁凭证。
  @async
  ControlLockResult activateLift(String floors, String lockData);

  /// 设置电梯可控楼层。
  ///
  /// [floors] 可控楼层列表。
  /// [lockData] 锁凭证。
  @async
  void setLiftControlable(String floors, String lockData);

  /// 设置电梯工作模式。
  ///
  /// [type] 电梯工作模式类型。
  /// [lockData] 锁凭证。
  @async
  void setLiftWorkMode(TTLiftWorkActivateType type, String lockData);

  /// 设置省电工作模式。
  ///
  /// [type] 省电工作模式类型。
  /// [lockData] 锁凭证。
  @async
  void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData);

  /// 设置省电可控锁。
  ///
  /// [lockMac] 可控锁 MAC 地址。
  /// [lockData] 锁凭证。
  @async
  void setPowerSaverControlableLock(String lockMac, String lockData);

  /// 设置酒店信息。
  ///
  /// [hotelInfo] 酒店信息。
  /// [buildingNumber] 楼栋号。
  /// [floorNumber] 楼层号。
  /// [lockData] 锁凭证。
  @async
  void setHotel(String hotelInfo, int buildingNumber, int floorNumber, String lockData);

  /// 设置酒店卡扇区。
  ///
  /// [sector] 卡扇区。
  /// [lockData] 锁凭证。
  @async
  void setHotelCardSector(String sector, String lockData);

  /// 获取锁版本。
  ///
  /// [lockMac] 锁蓝牙 MAC 地址。
  @async
  TTLockVersion getLockVersion(String lockMac);

  /// 设置 NB 服务器地址。
  ///
  /// [ip] 服务器 IP。
  /// [port] 服务器端口。
  /// [lockData] 锁凭证。
  @async
  int setNBServerAddress(String ip, String port, String lockData);

  /// 配置 WiFi。
  ///
  /// [wifiName] WiFi 名称。
  /// [wifiPassword] WiFi 密码。
  /// [lockData] 锁凭证。
  @async
  void configWifi(String wifiName, String wifiPassword, String lockData);

  /// 配置服务器。
  ///
  /// [ip] 服务器 IP。
  /// [port] 服务器端口。
  /// [lockData] 锁凭证。
  @async
  void configServer(String ip, String port, String lockData);

  /// 获取 WiFi 信息。
  ///
  /// [lockData] 锁凭证。
  @async
  TTWifiInfoModel getWifiInfo(String lockData);

  /// 配置 IP。
  ///
  /// [ipSetting] IP 设置参数。
  /// [lockData] 锁凭证。
  @async
  void configIp(TTIpSetting ipSetting, String lockData);

  /// 配置摄像头锁 WiFi。
  ///
  /// [wifiName] WiFi 名称。
  /// [wifiPassword] WiFi 密码。
  /// [lockData] 锁凭证。
  @async
  CameraLockWifiResult configCameraLockWifi(String wifiName, String wifiPassword, String lockData);

  /// 设置音量。
  ///
  /// [type] 音量类型。
  /// [lockData] 锁凭证。
  @async
  void setSoundVolume(TTSoundVolumeType type, String lockData);

  /// 获取音量。
  ///
  /// [lockData] 锁凭证。
  @async
  TTSoundVolumeType getSoundVolume(String lockData);

  /// 设置灵敏度。
  ///
  /// [value] 灵敏度值。
  /// [lockData] 锁凭证。
  @async
  void setSensitivity(TTSensitivityValue value, String lockData);

  /// 获取灵敏度。
  ///
  /// [lockData] 锁凭证。
  @async
  TTSensitivityValue getSensitivity(String lockData);

  /// 设置遥控钥匙有效期。
  ///
  /// [remoteKeyMac] 遥控钥匙 MAC 地址。
  /// [cycleList] 周期时间段列表。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void setRemoteKeyValidDate(String remoteKeyMac, List<TTCycleModel>? cycleList, int startDate, int endDate, String lockData);

  /// 添加遥控钥匙。
  ///
  /// [remoteKeyMac] 遥控钥匙 MAC 地址。
  /// [cycleList] 周期时间段列表。
  /// [startDate] 有效期起始时间，毫秒时间戳。
  /// [endDate] 有效期结束时间，毫秒时间戳。
  /// [lockData] 锁凭证。
  @async
  void addRemoteKey(
    String remoteKeyMac,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );

  /// 删除遥控钥匙。
  ///
  /// [remoteKeyMac] 遥控钥匙 MAC 地址。
  /// [lockData] 锁凭证。
  @async
  void deleteRemoteKey(String remoteKeyMac, String lockData);

  /// 清除所有遥控钥匙。
  ///
  /// [lockData] 锁凭证。
  @async
  void clearRemoteKey(String lockData);

  /// 获取遥控配件电量。
  ///
  /// [accessory] 配件类型。
  /// [mac] 配件 MAC 地址。
  /// [lockData] 锁凭证。
  @async
  AccessoryElectricQuantityResult getRemoteAccessoryElectricQuantity(
    TTRemoteAccessory accessory,
    String mac,
    String lockData,
  );

  /// 添加门磁。
  ///
  /// [doorSensorMac] 门磁 MAC 地址。
  /// [lockData] 锁凭证。
  @async
  void addDoorSensor(String doorSensorMac, String lockData);

  /// 删除门磁。
  ///
  /// [lockData] 锁凭证。
  @async
  void deleteDoorSensor(String lockData);

  /// 设置门磁警报时间。
  ///
  /// [alertTime] 警报时间（秒）。
  /// [lockData] 锁凭证。
  @async
  void setDoorSensorAlertTime(int alertTime, String lockData);
}

@HostApi()
abstract class TTGatewayHostApi {
  /// 订阅 [TTEventChannelApi.gatewayGetNearbyWifi] 前调用。
  ///
  /// [gatewayMac] 网关 MAC 地址。
  void setGatewayGetNearbyWifiParam(String gatewayMac);

  /// 连接网关。
  ///
  /// [mac] 网关 MAC 地址。
  @async
  TTGatewayConnectStatus connect(String mac);

  /// 断开网关连接。
  ///
  /// [mac] 网关 MAC 地址。
  void disconnect(String mac);

  /// 初始化网关。
  ///
  /// [params] 网关初始化参数。
  @async
  GatewayDeviceInfo initGateway(TTGatewayInitParams params);

  /// 配置网关 IP。
  ///
  /// [mac] 网关 MAC 地址。
  /// [ipSetting] IP 设置参数。
  @async
  void configIp(String mac, TTIpSetting ipSetting);

  /// 配置网关 APN。
  ///
  /// [mac] 网关 MAC 地址。
  /// [apn] APN 接入点名称。
  @async
  void configApn(String mac, String apn);

  /// 获取网关网络 MAC。
  @async
  String? getNetworkMac();

  /// 进入升级模式。
  ///
  /// [mac] 网关 MAC 地址。
  void enterUpgradeMode(String mac);
}

@HostApi()
abstract class TTAccessoryHostApi {
  /// 订阅 [TTEventChannelApi.accessoryAddKeypadFingerprint] 前调用。
  ///
  /// [param] 键盘指纹录入事件参数。
  void setAccessoryAddKeypadFingerprintParam(TTKeypadCredentialEventParam param);

  /// 订阅 [TTEventChannelApi.accessoryAddKeypadCard] 前调用。
  ///
  /// [param] 键盘刷卡录入事件参数。
  void setAccessoryAddKeypadCardParam(TTKeypadCredentialEventParam param);

  /// 初始化遥控器。
  ///
  /// [mac] 遥控器 MAC 地址。
  /// [lockData] 关联锁凭证。
  @async
  TTLockSystemModel initRemoteKey(String mac, String lockData);

  /// 初始化无线键盘。
  ///
  /// [mac] 键盘 MAC 地址。
  /// [lockMac] 关联锁 MAC 地址。
  @async
  RemoteKeypadInitResult initRemoteKeypad(String mac, String lockMac);

  /// 初始化多功能键盘。
  ///
  /// [mac] 键盘 MAC 地址。
  /// [lockData] 关联锁凭证。
  @async
  MultifunctionalKeypadInitResult initMultifunctionalKeypad(String mac, String lockData);

  /// 获取已存储的锁列表。
  ///
  /// [mac] 配件 MAC 地址。
  @async
  List<String> getStoredLocks(String mac);

  /// 删除已存储的锁。
  ///
  /// [mac] 配件 MAC 地址。
  /// [slotNumber] 存储槽位编号。
  @async
  void deleteStoredLock(String mac, int slotNumber);

  /// 初始化门磁。
  ///
  /// [mac] 门磁 MAC 地址。
  /// [lockData] 关联锁凭证。
  @async
  TTLockSystemModel initDoorSensor(String mac, String lockData);

  /// 独立门磁初始化。
  ///
  /// [params] 初始化参数。
  @async
  TTStandaloneDoorSensorInfo standaloneDoorSensorInit(TTStandaloneDoorSensorInitParams params);

  /// 读取独立门磁特征值。
  ///
  /// [mac] 门磁 MAC 地址。
  @async
  String standaloneDoorSensorReadFeatureValue(String mac);

  /// 查询独立门磁是否支持某功能。
  ///
  /// [featureValue] 设备特征值。
  /// [lockFunction] 待查询的功能项。
  bool standaloneDoorSensorIsSupportFunction(
    String featureValue,
    TTStandaloneDoorSensorFeature lockFunction,
  );

  /// 配置电表服务器。
  ///
  /// [url] 服务器地址。
  /// [clientId] 客户端 ID。
  /// [accessToken] 访问令牌。
  void electricMeterConfigServer(String url, String clientId, String accessToken);

  /// 连接电表。
  ///
  /// [mac] 电表 MAC 地址。
  @async
  void electricMeterConnect(String mac);

  /// 断开电表连接。
  ///
  /// [mac] 电表 MAC 地址。
  void electricMeterDisconnect(String mac);

  /// 初始化电表。
  ///
  /// [params] 电表初始化参数。
  @async
  TTElectricMeterInitResult electricMeterInit(TTElectricMeterInitParam params);

  /// 删除电表。
  ///
  /// [mac] 电表 MAC 地址。
  @async
  void electricMeterDelete(String mac);

  /// 设置电表通断电。
  ///
  /// [mac] 电表 MAC 地址。
  /// [isOn] 是否通电。
  @async
  void electricMeterSetPowerOnOff(String mac, bool isOn);

  /// 设置电表剩余电量。
  ///
  /// [mac] 电表 MAC 地址。
  /// [remainderKwh] 剩余电量（kWh）。
  @async
  void electricMeterSetRemainderKwh(String mac, double remainderKwh);

  /// 清除电表剩余电量。
  ///
  /// [mac] 电表 MAC 地址。
  @async
  void electricMeterClearRemainderKwh(String mac);

  /// 读取电表数据。
  ///
  /// [mac] 电表 MAC 地址。
  @async
  void electricMeterReadData(String mac);

  /// 设置电表付费模式。
  ///
  /// [mac] 电表 MAC 地址。
  /// [payMode] 付费模式。
  /// [price] 单价。
  @async
  void electricMeterSetPayMode(String mac, TTMeterPayMode payMode, double price);

  /// 电表充值。
  ///
  /// [mac] 电表 MAC 地址。
  /// [amount] 充值金额。
  /// [kwh] 充值电量（kWh）。
  @async
  void electricMeterCharge(String mac, double amount, double kwh);

  /// 设置电表最大功率。
  ///
  /// [mac] 电表 MAC 地址。
  /// [maxPower] 最大功率。
  @async
  void electricMeterSetMaxPower(String mac, double maxPower);

  /// 获取电表特征值。
  ///
  /// [mac] 电表 MAC 地址。
  @async
  String electricMeterGetFeatureValue(String mac);

  /// 查询电表是否支持某功能。
  ///
  /// [featureValue] 设备特征值。
  /// [lockFunction] 待查询的功能项。
  bool electricMeterIsSupportFunction(String featureValue, TTElectricMeterFeature lockFunction);

  /// 获取电表设备信息。
  ///
  /// [mac] 电表 MAC 地址。
  @async
  ElectricMeterDeviceInfo electricMeterGetDeviceInfo(String mac);

  /// 配置电表 APN。
  ///
  /// [mac] 电表 MAC 地址。
  /// [apn] APN 接入点名称。
  @async
  void electricMeterConfigApn(String mac, String apn);

  /// 配置电表计量服务器。
  ///
  /// [mac] 电表 MAC 地址。
  /// [ip] 服务器 IP。
  /// [port] 服务器端口。
  @async
  void electricMeterConfigMeterServer(String mac, String ip, String port);

  /// 重置电表。
  ///
  /// [mac] 电表 MAC 地址。
  @async
  void electricMeterReset(String mac);

  /// 配置水表服务器。
  ///
  /// [url] 服务器地址。
  /// [clientId] 客户端 ID。
  /// [accessToken] 访问令牌。
  void waterMeterConfigServer(String url, String clientId, String accessToken);

  /// 连接水表。
  ///
  /// [mac] 水表 MAC 地址。
  @async
  void waterMeterConnect(String mac);

  /// 断开水表连接。
  ///
  /// [mac] 水表 MAC 地址。
  void waterMeterDisconnect(String mac);

  /// 初始化水表。
  ///
  /// [params] 水表初始化参数。
  @async
  TTWaterMeterInitResult waterMeterInit(TTWaterMeterInitParam params);

  /// 删除水表。
  ///
  /// [mac] 水表 MAC 地址。
  @async
  void waterMeterDelete(String mac);

  /// 设置水表通断水。
  ///
  /// [mac] 水表 MAC 地址。
  /// [isOn] 是否通水。
  @async
  void waterMeterSetPowerOnOff(String mac, bool isOn);

  /// 设置水表剩余水量。
  ///
  /// [mac] 水表 MAC 地址。
  /// [remainderM3] 剩余水量（m³）。
  @async
  void waterMeterSetRemainderM3(String mac, double remainderM3);

  /// 清除水表剩余水量。
  ///
  /// [mac] 水表 MAC 地址。
  @async
  void waterMeterClearRemainderM3(String mac);

  /// 读取水表数据。
  ///
  /// [mac] 水表 MAC 地址。
  @async
  void waterMeterReadData(String mac);

  /// 设置水表付费模式。
  ///
  /// [mac] 水表 MAC 地址。
  /// [payMode] 付费模式。
  /// [price] 单价。
  @async
  void waterMeterSetPayMode(String mac, TTMeterPayMode payMode, double price);

  /// 水表充值。
  ///
  /// [mac] 水表 MAC 地址。
  /// [amount] 充值金额。
  /// [m3] 充值水量（m³）。
  @async
  void waterMeterCharge(String mac, double amount, double m3);

  /// 设置水表总用量。
  ///
  /// [mac] 水表 MAC 地址。
  /// [totalM3] 总用量（m³）。
  @async
  void waterMeterSetTotalUsage(String mac, double totalM3);

  /// 获取水表特征值。
  ///
  /// [mac] 水表 MAC 地址。
  @async
  String waterMeterGetFeatureValue(String mac);

  /// 获取水表设备信息。
  ///
  /// [mac] 水表 MAC 地址。
  @async
  WaterMeterDeviceInfo waterMeterGetDeviceInfo(String mac);

  /// 查询水表是否支持某功能。
  ///
  /// [featureValue] 设备特征值。
  /// [lockFunction] 待查询的功能项。
  bool waterMeterIsSupportFunction(String featureValue, TTWaterMeterFeature lockFunction);

  /// 配置水表 APN。
  ///
  /// [mac] 水表 MAC 地址。
  /// [apn] APN 接入点名称。
  @async
  void waterMeterConfigApn(String mac, String apn);

  /// 配置水表计量服务器。
  ///
  /// [mac] 水表 MAC 地址。
  /// [ip] 服务器 IP。
  /// [port] 服务器端口。
  @async
  void waterMeterConfigMeterServer(String mac, String ip, String port);

  /// 重置水表。
  ///
  /// [mac] 水表 MAC 地址。
  @async
  void waterMeterReset(String mac);
}

// -----------------------------
// EventChannel（Pigeon 限制：同一 .dart 输入文件内只能有 1 个 @EventChannelApi）
// 因此将「各路流」拆成多个无参方法；每个方法对应一条独立 EventChannel。
// 启动参数仍由 HostApi 的 startXxx / addXxx（返回 requestId）下发。
// -----------------------------

/// 持续事件流接口。
///
/// 订阅任一流方法前，须通过对应 [TTLockHostApi] / [TTGatewayHostApi] /
/// [TTAccessoryHostApi] 的 `set*Param` 方法写入上下文参数。
@EventChannelApi()
abstract class TTEventChannelApi {
  /// 扫描附近智能锁，持续推送 [TTLockScanModel]。
  TTLockScanModel lockScanLock();

  /// 扫描锁可连接的 WiFi 列表。
  ///
  /// 订阅前须调用 [TTLockHostApi.setLockScanWifiParam]。
  TTWifiScanResult lockScanWifi();

  /// 刷卡录入进度流。
  ///
  /// 订阅前须调用 [TTLockHostApi.setLockAddCardParam]。
  AddCardEvent lockAddCard();

  /// 指纹录入进度流。
  ///
  /// 订阅前须调用 [TTLockHostApi.setLockAddFingerprintParam]。
  AddFingerprintEvent lockAddFingerprint();

  /// 人脸录入进度流。
  ///
  /// 订阅前须调用 [TTLockHostApi.setLockAddFaceParam]。
  AddFaceEvent lockAddFace();

  /// 掌静脉录入进度流。
  ///
  /// 订阅前须调用 [TTLockHostApi.setLockAddPalmVeinParam]。
  AddPalmVeinEvent lockAddPalmVein();

  /// 扫描附近网关，持续推送 [TTGatewayScanModel]。
  TTGatewayScanModel gatewayStartScan();

  /// 获取网关附近 WiFi 列表。
  ///
  /// 订阅前须调用 [TTGatewayHostApi.setGatewayGetNearbyWifiParam]。
  TTWifiScanResult gatewayGetNearbyWifi();

  /// 扫描附近遥控器，持续推送 [TTRemoteAccessoryScanModel]。
  TTRemoteAccessoryScanModel accessoryStartScanRemoteKey();

  /// 扫描附近无线键盘，持续推送 [TTRemoteAccessoryScanModel]。
  TTRemoteAccessoryScanModel accessoryStartScanRemoteKeypad();

  /// 无线键盘指纹录入进度流。
  ///
  /// 订阅前须调用 [TTAccessoryHostApi.setAccessoryAddKeypadFingerprintParam]。
  AddFingerprintEvent accessoryAddKeypadFingerprint();

  /// 无线键盘刷卡录入进度流。
  ///
  /// 订阅前须调用 [TTAccessoryHostApi.setAccessoryAddKeypadCardParam]。
  AddCardEvent accessoryAddKeypadCard();

  /// 扫描附近门磁，持续推送 [TTRemoteAccessoryScanModel]。
  TTRemoteAccessoryScanModel accessoryStartScanDoorSensor();

  /// 扫描附近独立门磁，持续推送 [TTStandaloneDoorSensorScanModel]。
  TTStandaloneDoorSensorScanModel accessoryStandaloneDoorSensorStartScan();

  /// 扫描附近水表，持续推送 [TTMeterScanModel]。
  TTMeterScanModel accessoryWaterMeterStartScan();

  /// 扫描附近电表，持续推送 [TTMeterScanModel]。
  TTMeterScanModel accessoryElectricMeterStartScan();
}

