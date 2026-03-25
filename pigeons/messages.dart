import 'package:pigeon/pigeon.dart';

// 生成代码（输出路径由 TTLockHostApi 上的 @ConfigurePigeon 指定，无需再传 --dart_out 等）：
//   dart run pigeon --input pigeons/messages.dart
// 若使用 fvm：fvm dart run pigeon --input pigeons/messages.dart

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
        'android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt',
    kotlinOptions: KotlinOptions(
      package: 'com.ttlock.ttlock_flutter',
      // copyrightHeader: <String>['pigeons/copyright.txt'],
    ),
    swiftOut: 'ios/Classes/messages.swift',
    swiftOptions: SwiftOptions(
      // copyrightHeader: <String>['pigeons/copyright.txt'],
    ),
    arkTSOut: 'ohos/src/main/ets/components/plugin/messages.ets',
    arkTSOptions: ArkTSOptions(
      // copyrightHeader: <String>['pigeons/copyright.txt'],
    ),
  ),
)

// -----------------------------
// Data Models
// -----------------------------

class TTLockVersion {
  final int protocolType;
  final int protocolVersion;
  final int scene;
  final int groupId;
  final int orgId;

  TTLockVersion({
    required this.protocolType,
    required this.protocolVersion,
    required this.scene,
    required this.groupId,
    required this.orgId,
  });
}

class TTLockInitParams {
  final String lockMac;
  final TTLockVersion lockVersion;
  final bool isInited;
  final String? clientPara;
  final String? hotelInfo;
  final int? buildingNumber;
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

class TTGatewayInitParams {
  final int type;
  final int ttlockUid;
  final String? gatewayName;
  final String? ttlockLoginPassword;
  final String? wifi;
  final String? wifiPassword;
  final String? serverIp;
  final String? serverPort;
  final int? companyId;
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

class TTIpSetting {
  final int type;
  final String? ipAddress;
  final String? subnetMask;
  final String? router;
  final String? preferredDns;
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

class TTCycleModel {
  final int weekDay;
  final int startTime;
  final int endTime;

  TTCycleModel({
    required this.weekDay,
    required this.startTime,
    required this.endTime,
  });
}

class ControlLockResult {
  final int lockTime;
  final int electricQuantity;
  final int uniqueId;
  final String? lockData;

  ControlLockResult({
    required this.lockTime,
    required this.electricQuantity,
    required this.uniqueId,
    this.lockData,
  });
}

class AutoLockingTime {
  final int currentTime;
  final int minTime;
  final int maxTime;

  AutoLockingTime({
    required this.currentTime,
    required this.minTime,
    required this.maxTime,
  });
}

class TTWifiInfoModel {
  final String wifiMac;
  final int wifiRssi;

  TTWifiInfoModel({
    required this.wifiMac,
    required this.wifiRssi,
  });
}

class CameraLockWifiResult {
  final String serialNumber;
  final String wifiName;

  CameraLockWifiResult({
    required this.serialNumber,
    required this.wifiName,
  });
}

class TTLockSystemModel {
  final String? modelNum;
  final String? hardwareRevision;
  final String? firmwareRevision;
  final int? electricQuantity;
  final String? nbOperator;
  final String? nbNodeId;
  final String? nbCardNumber;
  final String? nbRssi;
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

class AccessoryElectricQuantityResult {
  final int electricQuantity;
  final int updateDate;

  AccessoryElectricQuantityResult({
    required this.electricQuantity,
    required this.updateDate,
  });
}

// Scan Models
class TTLockScanModel {
  final String lockName;
  final String lockMac;
  final bool isInited;
  final bool isAllowUnlock;
  final int electricQuantity;
  final TTLockVersion lockVersion;
  final TTLockSwitchState lockSwitchState;
  final int rssi;
  final int oneMeterRssi;
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

class TTGatewayScanModel {
  final String gatewayName;
  final String gatewayMac;
  final int rssi;
  final bool isDfuMode;
  final TTGatewayType type;

  TTGatewayScanModel({
    required this.gatewayName,
    required this.gatewayMac,
    required this.rssi,
    required this.isDfuMode,
    required this.type,
  });
}

class GatewayDeviceInfo {
    final String modelNum;
    final String hardwareRevision;
    final String firmwareRevision;
    final String networkMac;

    GatewayDeviceInfo({
      required this.modelNum,
      required this.hardwareRevision,
      required this.firmwareRevision,
      required this.networkMac,
    });
}

class TTRemoteAccessoryScanModel {
  final String name;
  final String mac;
  final int rssi;
  final int? scanTime;
  final bool isMultifunctionalKeypad;
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

class TTStandaloneDoorSensorScanModel {
  final String name;
  final String mac;
  final int rssi;
  final int? scanTime;

  TTStandaloneDoorSensorScanModel({
    required this.name,
    required this.mac,
    required this.rssi,
    this.scanTime,
  });
}

class TTStandaloneDoorSensorInfo {
  final String? doorSensorData;
  final int? electricQuantity;
  final String? featureValue;
  final String? wifiMac;
  final String? modelNum;
  final String? hardwareRevision;
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

class TTMeterScanModel {
  final String name;
  final String mac;
  final int rssi;

  TTMeterScanModel({
    required this.name,
    required this.mac,
    required this.rssi,
  });
}

class TTWaterMeterInitResult {
  final String waterMeterId;
  final String? featureValue;

  TTWaterMeterInitResult({
    required this.waterMeterId,
    this.featureValue,
  });
}

class TTElectricMeterInitResult {
  final String electricMeterId;
  final String? featureValue;

  TTElectricMeterInitResult({
    required this.electricMeterId,
    this.featureValue,
  });
}

// Wifi Scan entry for scanWifi/getNearbyWifi (host decides exact fields)
class TTWifiScanEntry {
  final String? wifiMac;
  final int? wifiRssi;
  final String? bssid;
  final String? ssid;
  final String? wifiName;
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
class RemoteKeypadInitResult {
  final int electricQuantity;
  final String wirelessKeypadFeatureValue;

  RemoteKeypadInitResult({
    required this.electricQuantity,
    required this.wirelessKeypadFeatureValue,
  });
}

class MultifunctionalKeypadInitResult {
  final int electricQuantity;
  final String wirelessKeypadFeatureValue;
  final int slotNumber;
  final int slotLimit;
  final String? modelNum;
  final String? hardwareRevision;
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

class WaterMeterDeviceInfo {
   final String catOneCardNumber;
    final String catOneImsi;
    final String catOneNodeId;
    final String catOneOperator;
    final int catOneRssi;

    WaterMeterDeviceInfo({
      required this.catOneCardNumber,
      required this.catOneImsi,
      required this.catOneNodeId,
      required this.catOneOperator,
      required this.catOneRssi,
    });
}

// Event Models
class AddCardEvent {
  final bool isProgress;
  final String? cardNumber;

  AddCardEvent({
    required this.isProgress,
    this.cardNumber,
  });
}

class AddFingerprintEvent {
  final bool isProgress;
  final int? currentCount;
  final int? totalCount;
  final String? fingerprintNumber;

  AddFingerprintEvent({
    required this.isProgress,
    this.currentCount,
    this.totalCount,
    this.fingerprintNumber,
  });
}

class AddFaceEvent {
  final bool isProgress;
  final TTFaceState? state;
  final TTFaceErrorCode? errorCode;
  final String? faceNumber;

  AddFaceEvent({
    required this.isProgress,
    this.state,
    this.errorCode,
    this.faceNumber,
  });
}

// -----------------------------
// Enums
// -----------------------------

enum TTBluetoothState {
  unknow,
  resetting,
  unsupported,
  unAuthorized,
  turnOff,
  turnOn,
}

enum TTPasscodeType {
  once,
  permanent,
  period,
  cycle,
}

enum TTOperateRecordType {
  latest,
  total,
}

enum TTControlAction {
  unlock,
  lock,
}

enum TTLockSwitchState {
  lock,
  unlock,
  unknow,
}

enum TTPassageModeType {
  weekly,
  monthly,
}

enum TTLockConfig {
  audio,
  passcodeVisible,
  freeze,
  tamperAlert,
  resetButton,
  privacyLock,
  passageModeAutoUnlock,
  wifiLockPowerSavingMode,
  doubleAuth,
  publicMode,
  lowBatteryAutoUnlock,
}

enum TTLockDirection {
  left,
  right,
}

enum TTSoundVolumeType {
  firstLevel,
  secondLevel,
  thirdLevel,
  fourthLevel,
  fifthLevel,
  off,
  on,
}

enum TTSensitivityValue {
  off,
  low,
  medium,
  high,
}

enum TTLockError {
  success,
  reseted,
  crcError,
  noPermisstion,
  wrongAdminCode,
  noStorageSpace,
  inSettingMode,
  noAdmin,
  notInSettingMode,
  wrongDynamicCode,
  noPower,
  resetPasscode,
  unpdatePasscodeIndex,
  invalidLockFlagPos,
  ekeyExpired,
  passcodeLengthInvalid,
  samePasscodes,
  ekeyInactive,
  aesKey,
  fail,
  passcodeExist,
  passcodeNotExist,
  lackOfStorageSpaceWhenAddingPasscodes,
  invalidParaLength,
  cardNotExist,
  fingerprintDuplication,
  fingerprintNotExist,
  invalidCommand,
  inFreezeMode,
  invalidClientPara,
  lockIsLocked,
  recordNotExist,
  notSupportModifyPasscode,
  bluetoothOff,
  bluetoothConnectTimeount,
  bluetoothDisconnection,
  lockIsBusy,
  invalidLockData,
  invalidParameter,
  wrongWifi,
  wrongWifiPassword,
  scanFailedAlreadyStart,
  scanFailedApplicationRegistrationFailed,
  scanFailedInternalError,
  scanFailedFeatureUnsupported,
  scanFailedOutOfHardwareResources,
  initWirelessKeyboardFailed,
  wirelessKeyboardNoResponse,
  deviceConnectFailed,
  signatureVerificationFailed,
  invalidApplication,
}

enum TTErrorDevice {
  lock,
  keyPad,
  key,
}

enum TTLiftWorkActivateType {
  allFloors,
  specificFloors,
}

enum TTPowerSaverWorkType {
  allCards,
  hotelCard,
  roomCard,
}

enum TTGatewayType {
  g1,
  g2,
  g3,
  g4,
  g5,
}

enum TTGatewayConnectStatus {
  timeout,
  success,
  failed,
}

enum TTGatewayError {
    success,
    failed,
    badWifiName,
    badWifiPassword,
    invalidCommand,
    timeOut,
    noSimCard,
    noCable,
    wrongCRC,
    wrongAesKey,
    failedConfigureRouter,
    failedConfigureServer,
    failedConfigureAccount,
    communicationDisconnected,
    unConnected,
    connectTimeout,
    dataFormatError,
    failedConfigAccount,
    failedConfigIp,
    invalidIp
}

enum TTRemoteAccessoryError {
    success,
    failed,
    noResponse,
    wrongCRC,
    requestFailed,
    connectFailed,
    deviceIsBusy,
    dataFormatError,
}

enum TTMultifunctionalKeypadError {
    success,
    failed,
    duplicateFingerprint,
    noStorageSpace,
    wrongCRC,
    noResponse,
    keypadConnectFailed,
    dataFormatError,
}


enum TTRemoteAccessory {
  remoteKey,
  remoteKeypad,
  doorSensor,
}

enum TTIpSettingType {
  staticIp,
  dhcp,
}

enum TTNbAwakeMode {
  keypad,
  card,
  fingerprint,
}

enum TTNbAwakeTimeType {
  point,
  interval,
}

enum TTLockFunction {
  passcode,
  icCard,
  fingerprint,
  wristband,
  autoLock,
  deletePasscode,
  managePasscode,
  locking,
  passcodeVisible,
  gatewayUnlock,
  lockFreeze,
  cyclePassword,
  unlockSwitch,
  audioSwitch,
  nbIoT,
  getAdminPasscode,
  hotelCard,
  noClock,
  noBroadcastInNormal,
  passageMode,
  turnOffAutoLock,
  wirelessKeypad,
  light,
  hotelCardBlacklist,
  identityCard,
  tamperAlert,
  resetButton,
  privacyLock,
  deadLock,
  cyclicCardOrFingerprint,
  fingerVein,
  ble5G,
  nbAwake,
  recoverCyclePasscode,
  remoteKey,
  getAccessoryElectricQuantity,
  soundVolumeAndLanguageSetting,
  qrCode,
  doorSensorState,
  passageModeAutoUnlockSetting,
  doorSensor,
  doorSensorAlert,
  sensitivity,
  face,
  cpuCard,
  wifiLock,
  wifiLockStaticIP,
  passcodeKeyNumber,
  standAloneActivation,
  doubleAuth,
  authorizedUnlock,
  gatewayAuthorizedUnlock,
  noEkeyUnlock,
  zhiAnPhotoFace,
  palmVein,
  wifiArea,
  xiaoCaoCamera,
  resetLockByCode,
  thirdPartyBluetoothDevice,
  autoSetAngle,
  manualSetAngle,
  controlLatchBolt,
  autoSetUnlockDirection,
  icCardSecuritySetting,
  wifiPowerSavingTime,
  multiFunctionKeypad,
  doNotSupportTurnOffLatchBolt,
  publicMode,
  lowBatteryAutoUnlock,
  motorDriveTime,
  modifyFeatureValue,
  modifyLockNamePrefix,
  authCode,
  unauthorizedAttemptAlarm,
  powerSaverSupportWifi,
  bluetoothAdvertisingSetting,
  workingMode,
  supplierCode,
  catOne,
  forcedOpeningDoorAlarm,
  zhiAnFaceFeatureSecondGeneration,
  supportDeadLocking,
  workingTime,
  customQRCode,
  securityM1Card,
  yiShengPhotoFace,
}

enum TTFaceState {
  canStartAdd,
  error,
}

enum TTFaceErrorCode {
  normal,
  noFaceDetected,
  tooCloseToTheTop,
  tooCloseToTheBottom,
  tooCloseToTheLeft,
  tooCloseToTheRight,
  tooFarAway,
  tooClose,
  eyebrowsCovered,
  eyesCovered,
  faceCovered,
  faceDirection,
  eyeOpeningDetected,
  eyesClosedStatus,
  failedToDetectEye,
  needTurnHeadToLeft,
  needTurnHeadToRight,
  needRaiseHead,
  needLowerHead,
  needTiltHeadToLeft,
  needTiltHeadToRight,
}

// -----------------------------
// Host APIs (called from Flutter)
// -----------------------------
@HostApi()
abstract class TTLockHostApi {
  /// 在订阅锁相关 EventChannel（如 lockScanWifi、lockAddCard）前设置 lockData，比依赖其它接口副作用更可靠。
  void setEventLockData(String lockData);

  // One-shot lock operations (subset; extend as needed)
  TTBluetoothState getBluetoothState();
  @async
  String initLock(TTLockInitParams params);
  @async
  void resetLock(String lockData);
  @async
  String resetEkey(String lockData);
  @async
  void resetLockByCode(String lockMac, String resetCode);
  @async
  void verifyLock(String lockMac);

  @async
  ControlLockResult controlLock(String lockData, TTControlAction action);
  @async
  TTLockSwitchState getLockSwitchState(String lockData);
  bool supportFunction(TTLockFunction function, String lockData);

  @async
  void createCustomPasscode(String passcode, int startDate, int endDate, String lockData);
  @async
  void modifyPasscode(String passcodeOrigin, String? passcodeNew, int startDate, int endDate, String lockData);
  @async
  void deletePasscode(String passcode, String lockData);

  @async
  String resetPasscode(String lockData);
  @async
  String getAdminPasscode(String lockData);
  void setErasePasscode(String erasePasscode, String lockData);

  @async
  List<Map<String, Object?>> getAllValidPasscodes(String lockData);
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

  @async
  String? modifyAdminPasscode(String adminPasscode, String lockData);
  @async
  String getPasscodeVerificationParams(String lockData);

  @async
  void modifyCardValidityPeriod(
    String cardNumber,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );

  @async
  void deleteCard(String cardNumber, String lockData);
  @async
  List<Map<String, Object?>> getAllValidCards(String lockData);
  @async
  void clearAllCards(String lockData);
  @async
  void recoverCard(String cardNumber, int startDate, int endDate, String lockData);
  @async
  void reportLossCard(String cardNumber, String lockData);

  @async
  void modifyFingerprintValidityPeriod(
    String fingerprintNumber,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );

  @async
  void deleteFingerprint(String fingerprintNumber, String lockData);
  @async
  List<Map<String, Object?>> getAllValidFingerprints(String lockData);
  @async
  void clearAllFingerprints(String lockData);

  @async
  void modifyFace(String faceNumber, List<TTCycleModel>? cycleList, int startDate, int endDate, String lockData);
  @async
  String addFaceData(List<TTCycleModel>? cycleList, int startDate, int endDate, String faceFeatureData, String lockData);
  @async
  void deleteFace(String faceNumber, String lockData);
  @async
  void clearFace(String lockData);

  @async
  void setLockTime(int timestamp, String lockData);
  @async
  int getLockTime(String lockData);
  @async
  void setLockWorkingTime(int startDate, int endDate, String lockData);

  @async
  String getLockOperateRecord(TTOperateRecordType type, String lockData);
  @async
  int getLockPower(String lockData);
  @async
  TTLockSystemModel getLockSystemInfo(String lockData);
  @async
  String getLockFeatureValue(String lockData);

  @async
  AutoLockingTime getAutoLockingPeriodicTime(String lockData);
  @async
  void setAutoLockingPeriodicTime(int seconds, String lockData);

  @async
  bool getRemoteUnlockSwitchState(String lockData);
  @async
  String setRemoteUnlockSwitchState(bool isOn, String lockData);

  @async
  bool getLockConfig(TTLockConfig config, String lockData);
  @async
  void setLockConfig(TTLockConfig config, bool isOn, String lockData);

  @async
  TTLockDirection getLockDirection(String lockData);
  @async
  void setLockDirection(TTLockDirection direction, String lockData);

  @async
  void addPassageMode(
    TTPassageModeType type,
    List<int>? weekly,
    List<int>? monthly,
    int startTime,
    int endTime,
    String lockData,
  );
  @async
  void clearAllPassageModes(String lockData);

  @async
  ControlLockResult activateLift(String floors, String lockData);
  @async
  void setLiftControlable(String floors, String lockData);
  @async
  void setLiftWorkMode(TTLiftWorkActivateType type, String lockData);

  @async
  void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData);
  @async
  void setPowerSaverControlableLock(String lockMac, String lockData);

  @async
  void setHotel(String hotelInfo, int buildingNumber, int floorNumber, String lockData);
  @async
  void setHotelCardSector(String sector, String lockData);

  @async
  TTLockVersion getLockVersion(String lockMac);
  @async
  int setNBServerAddress(String ip, String port, String lockData);

  @async
  void configWifi(String wifiName, String wifiPassword, String lockData);
  @async
  void configServer(String ip, String port, String lockData);
  @async
  TTWifiInfoModel getWifiInfo(String lockData);
  @async
  void configIp(TTIpSetting ipSetting, String lockData);
  @async
  CameraLockWifiResult configCameraLockWifi(String wifiName, String wifiPassword, String lockData);

  @async
  void setSoundVolume(TTSoundVolumeType type, String lockData);
  @async
  TTSoundVolumeType getSoundVolume(String lockData);
  @async
  void setSensitivity(TTSensitivityValue value, String lockData);

  @async
  void setRemoteKeyValidDate(String remoteKeyMac, List<TTCycleModel>? cycleList, int startDate, int endDate, String lockData);

  @async
  void addRemoteKey(
    String remoteKeyMac,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );

  @async
  void deleteRemoteKey(String remoteKeyMac, String lockData);
  @async
  void clearRemoteKey(String lockData);

  @async
  AccessoryElectricQuantityResult getRemoteAccessoryElectricQuantity(
    TTRemoteAccessory accessory,
    String mac,
    String lockData,
  );

  @async
  void addDoorSensor(String doorSensorMac, String lockData);
  @async
  void deleteDoorSensor(String lockData);
  @async
  void setDoorSensorAlertTime(int alertTime, String lockData);
}

@HostApi()
abstract class TTGatewayHostApi {
  /// 在订阅 gatewayGetNearbyWifi 等流前设置网关 MAC。
  void setEventGatewayMac(String mac);

  @async
  TTGatewayConnectStatus connect(String mac);
  void disconnect(String mac);
  @async
  GatewayDeviceInfo init(TTGatewayInitParams params);
  @async
  void configIp(String mac, TTIpSetting ipSetting);
  @async
  void configApn(String mac, String apn);
  @async
  String? getNetworkMac();
  void enterUpgradeMode(String mac);
}

@HostApi()
abstract class TTAccessoryHostApi {
  /// 在订阅键盘相关 EventChannel（accessoryAddKeypadFingerprint / accessoryAddKeypadCard）前设置键盘 MAC 及是否为多功能键盘。
  void setEventKeypadMac(String mac, bool isMultifunctional);

  @async
  TTLockSystemModel initRemoteKey(String mac, String lockData);

  @async
  RemoteKeypadInitResult initRemoteKeypad(String mac, String lockMac);
  @async
  MultifunctionalKeypadInitResult initMultifunctionalKeypad(String mac, String lockData);
  @async
  List<String> getStoredLocks(String mac);
  @async
  void deleteStoredLock(String mac, int slotNumber);

  @async
  TTLockSystemModel initDoorSensor(String mac, String lockData);

  @async
  TTStandaloneDoorSensorInfo standaloneDoorSensorInit(String mac, Map<String, Object?> info);
  @async
  String standaloneDoorSensorReadFeatureValue(String mac);
  bool standaloneDoorSensorIsSupportFunction(String featureValue, int function);

  void waterMeterConfigServer(String url, String clientId, String accessToken);
  @async
  void waterMeterConnect(String mac);
  void waterMeterDisconnect(String mac);
  @async
  TTWaterMeterInitResult waterMeterInit(Map<String, Object?> params);
  @async
  void waterMeterDelete(String waterMeterId);
  @async
  void waterMeterSetPowerOnOff(String waterMeterId, bool isOn);
  @async
  void waterMeterSetRemainderM3(String waterMeterId, double remainderM3);
  @async
  void waterMeterClearRemainderM3(String waterMeterId);
  @async
  Map<String, Object?> waterMeterReadData(String waterMeterId);
  @async
  void waterMeterSetPayMode(String waterMeterId, int payMode);
  @async
  void waterMeterCharge(String waterMeterId, double amount);
  @async
  void waterMeterSetTotalUsage(String waterMeterId, double totalM3);
  @async
  String waterMeterGetFeatureValue(String waterMeterId);
  @async
  WaterMeterDeviceInfo waterMeterGetDeviceInfo(String waterMeterId);
  bool waterMeterIsSupportFunction(String featureValue, int function);
  @async
  void waterMeterConfigApn(String apn);
  @async
  void waterMeterConfigMeterServer(String ip, String port);
  @async
  void waterMeterReset(String waterMeterId);

  void electricMeterConfigServer(String url, String clientId, String accessToken);
  @async
  void electricMeterConnect(String mac);
  void electricMeterDisconnect(String mac);
  @async
  TTElectricMeterInitResult electricMeterInit(Map<String, Object?> params);
  @async
  void electricMeterDelete(String electricMeterId);
  @async
  void electricMeterSetPowerOnOff(String electricMeterId, bool isOn);
  @async
  void electricMeterSetRemainderKwh(String electricMeterId, double remainderKwh);
  @async
  void electricMeterClearRemainderKwh(String electricMeterId);
  @async
  Map<String, Object?> electricMeterReadData(String electricMeterId);
  @async
  void electricMeterSetPayMode(String electricMeterId, int payMode);
  @async
  void electricMeterCharge(String electricMeterId, double amount);
  @async
  void electricMeterSetMaxPower(String electricMeterId, double maxPower);
  @async
  String electricMeterGetFeatureValue(String electricMeterId);
  bool electricMeterIsSupportFunction(String featureValue, int function);
}

// -----------------------------
// EventChannel（Pigeon 限制：同一 .dart 输入文件内只能有 1 个 @EventChannelApi）
// 因此将「各路流」拆成多个无参方法；每个方法对应一条独立 EventChannel。
// 启动参数仍由 HostApi 的 startXxx / addXxx（返回 requestId）下发。
// -----------------------------

@EventChannelApi()
abstract class TTEventChannelApi {
  TTLockScanModel lockScanLock();

  List<TTWifiScanEntry> lockScanWifi();

  AddCardEvent lockAddCard();

  AddFingerprintEvent lockAddFingerprint();

  AddFaceEvent lockAddFace();

  TTGatewayScanModel gatewayStartScan();

  List<TTWifiScanEntry> gatewayGetNearbyWifi();

  TTRemoteAccessoryScanModel accessoryStartScanRemoteKey();

  TTRemoteAccessoryScanModel accessoryStartScanRemoteKeypad();

  AddFingerprintEvent accessoryAddKeypadFingerprint();

  AddCardEvent accessoryAddKeypadCard();

  TTRemoteAccessoryScanModel accessoryStartScanDoorSensor();

  TTStandaloneDoorSensorScanModel accessoryStandaloneDoorSensorStartScan();

  TTMeterScanModel accessoryWaterMeterStartScan();

  TTMeterScanModel accessoryElectricMeterStartScan();
}

