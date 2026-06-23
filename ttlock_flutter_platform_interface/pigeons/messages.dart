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

/// [TTEventChannelApi.lockScanWifi] 订阅前通过 [TTLockHostApi.setLockScanWifiParam] 写入。
class TTLockScanWifiEventParam {
  final String lockData;

  TTLockScanWifiEventParam({required this.lockData});
}

/// lockAddCard / lockAddFingerprint / lockAddFace 订阅前写入（含有效期，毫秒时间戳）。
class TTLockCredentialEventParam {
  final String lockData;
  final List<TTCycleModel>? cycleList;
  final int startDate;
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
  final String keypadMac;
  final String lockData;
  final bool isMultifunctional;
  final List<TTCycleModel>? cycleList;
  final int startDate;
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
class TTPassageModeModel {
  final TTPassageModeType type;
  final List<int>? weekly;
  final List<int>? monthly;
  final int startDate;
  final int endDate;

  TTPassageModeModel({
    required this.type,
    this.weekly,
    this.monthly,
    required this.startDate,
    required this.endDate,
  });
}

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

class TTPasscodeModel{
  final String keyboardPwd;
  final String newKeyboardPwd;
  final int startDate;
  final int endDate;
  final int keyboardPwdType;
  final int cycleType;

  TTPasscodeModel({
    required this.keyboardPwd, 
    required this.newKeyboardPwd, 
    required this.startDate, 
    required this.endDate, 
    required this.keyboardPwdType, 
    required this.cycleType
  });
  
}

class TTICCardModel {
    final String cardNumber;
    final int startDate;
    final int endDate;

    TTICCardModel({
      required this.cardNumber,
      required this.startDate,
      required this.endDate,
    });
}

class TTFingerprintModel {
    final String fingerprintNumber;
    final int startDate;
    final int endDate;

    TTFingerprintModel({
      required this.fingerprintNumber,
      required this.startDate,
      required this.endDate,
    });
}

class TTPalmVeinModel {
  final String palmVeinNumber;
  final int startDate;
  final int endDate;

  TTPalmVeinModel({
    required this.palmVeinNumber,
    required this.startDate,
    required this.endDate,
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
  final int waterMeterId;
  final String featureValue;

  TTWaterMeterInitResult({
    required this.waterMeterId,
    required this.featureValue,
  });
}

class TTElectricMeterInitResult {
  final int electricMeterId;
  final String featureValue;

  TTElectricMeterInitResult({
    required this.electricMeterId,
    required this.featureValue,
  });
}

class TTWifiScanResult {
  List<TTWifiScanEntry> wifiList;

  TTWifiScanResult({
    required this.wifiList
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

class ElectricMeterDeviceInfo {
  final String catOneCardNumber;
  final String catOneImsi;
  final String catOneNodeId;
  final String catOneOperator;
  final int catOneRssi;

  ElectricMeterDeviceInfo({
    required this.catOneCardNumber,
    required this.catOneImsi,
    required this.catOneNodeId,
    required this.catOneOperator,
    required this.catOneRssi,
  });
}

class TTWaterMeterInitParam {
  final String mac;
  final String name;
  final TTMeterPayMode payMode;
  final double price;

  TTWaterMeterInitParam({
    required this.mac,
    required this.name,
    required this.payMode,
    required this.price,
  });
}

class TTElectricMeterInitParam {
  final String mac;
  final String name;
  final TTMeterPayMode payMode;
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

class AddCardEvent {
  final TTAddCardPhase phase;
  final String? cardNumber;

  AddCardEvent({
    required this.phase,
    this.cardNumber,
  });
}

class AddFingerprintEvent {
  final TTAddFingerprintPhase phase;
  final int? currentCount;
  final int? totalCount;
  final String? fingerprintNumber;

  AddFingerprintEvent({
    required this.phase,
    this.currentCount,
    this.totalCount,
    this.fingerprintNumber,
  });
}

class AddFaceEvent {
  final TTAddFacePhase phase;
  final TTFaceErrorCode? errorCode;
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

class AddPalmVeinEvent {
  final TTAddPalmVeinPhase phase;
  final TTPalmVeinErrorCode? errorCode;
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
  securityM1Card,
  semiAutomaticModeControl,
  lockSupervision,
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
  pictureFaceDelivery,
  supportSetAlias,
  hideWifiCatOneSleepModeSetting,
  semiAutomaticModeControl,
  supportSetUserAttributes,
  supportSupervision,
}

enum TTFaceState {
  canStartAdd,
  error,
}

enum TTWaterMeterFeature {
  catOne,
}

enum TTElectricMeterFeature {
  catOne,
  telink,
}

enum TTMeterPayMode {
  postpaid,
  prepaid,
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

enum TTPalmVeinErrorCode {
  unknownStatus,
  noPalmVeinDetected,
  palmRectConfLow,
  palmLandmarkConfLow,
  palmAngleRollError,
  palmAngleLeanError,
  palmBlock,
  palmBlur,
  palmBack,
}

// -----------------------------
// Host APIs (called from Flutter)
// -----------------------------
@HostApi()
abstract class TTLockHostApi {
  /// 订阅 [TTEventChannelApi.lockScanWifi] 前调用。
  void setLockScanWifiParam(TTLockScanWifiEventParam param);

  /// 订阅 [TTEventChannelApi.lockAddCard] 前调用。
  void setLockAddCardParam(TTLockCredentialEventParam param);

  /// 订阅 [TTEventChannelApi.lockAddFingerprint] 前调用。
  void setLockAddFingerprintParam(TTLockCredentialEventParam param);

  /// 订阅 [TTEventChannelApi.lockAddFace] 前调用。
  void setLockAddFaceParam(TTLockCredentialEventParam param);

  /// 订阅 [TTEventChannelApi.lockAddPalmVein] 前调用。
  void setLockAddPalmVeinParam(TTLockCredentialEventParam param);

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
  bool supportFunction(TTLockFunction lockFunction, String lockData);

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
  List<TTPasscodeModel> getAllValidPasscodes(String lockData);
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
  List<TTICCardModel> getAllValidCards(String lockData);
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
  List<TTFingerprintModel> getAllValidFingerprints(String lockData);
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
  void modifyPalmVein(
    String palmVeinNumber,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  );
  @async
  void deletePalmVein(String palmVeinNumber, String lockData);
  @async
  void clearPalmVein(String lockData);
  @async
  List<TTPalmVeinModel> getAllValidPalmVeins(String lockData);

  @async
  void setMotorTorqueLevel(int torqueLevel, String lockData);
  @async
  void setLockLatchBolt(int keepTime, String lockData);

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
  int getLightTime(String lockData);
  @async
  void setLightTime(int seconds, String lockData);

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
  List<TTPassageModeModel> getPassageModes(String lockData);

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
  TTSensitivityValue getSensitivity(String lockData);

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
  /// 订阅 [TTEventChannelApi.gatewayGetNearbyWifi] 前调用。
  void setGatewayGetNearbyWifiParam(String gatewayMac);

  @async
  TTGatewayConnectStatus connect(String mac);
  void disconnect(String mac);
  @async
  GatewayDeviceInfo initGateway(TTGatewayInitParams params);
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
  /// 订阅 [TTEventChannelApi.accessoryAddKeypadFingerprint] 前调用。
  void setAccessoryAddKeypadFingerprintParam(TTKeypadCredentialEventParam param);

  /// 订阅 [TTEventChannelApi.accessoryAddKeypadCard] 前调用。
  void setAccessoryAddKeypadCardParam(TTKeypadCredentialEventParam param);

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
  bool standaloneDoorSensorIsSupportFunction(String featureValue, int lockFunction);

  void electricMeterConfigServer(String url, String clientId, String accessToken);
  @async
  void electricMeterConnect(String mac);
  void electricMeterDisconnect(String mac);
  @async
  TTElectricMeterInitResult electricMeterInit(TTElectricMeterInitParam params);
  @async
  void electricMeterDelete(String mac);
  @async
  void electricMeterSetPowerOnOff(String mac, bool isOn);
  @async
  void electricMeterSetRemainderKwh(String mac, double remainderKwh);
  @async
  void electricMeterClearRemainderKwh(String mac);
  @async
  void electricMeterReadData(String mac);
  @async
  void electricMeterSetPayMode(String mac, TTMeterPayMode payMode, double price);
  @async
  void electricMeterCharge(String mac, double amount, double kwh);
  @async
  void electricMeterSetMaxPower(String mac, double maxPower);
  @async
  String electricMeterGetFeatureValue(String mac);
  bool electricMeterIsSupportFunction(String featureValue, TTElectricMeterFeature lockFunction);
  @async
  ElectricMeterDeviceInfo electricMeterGetDeviceInfo(String mac);
  @async
  void electricMeterConfigApn(String mac, String apn);
  @async
  void electricMeterConfigMeterServer(String mac, String ip, String port);
  @async
  void electricMeterReset(String mac);

  void waterMeterConfigServer(String url, String clientId, String accessToken);
  @async
  void waterMeterConnect(String mac);
  void waterMeterDisconnect(String mac);
  @async
  TTWaterMeterInitResult waterMeterInit(TTWaterMeterInitParam params);
  @async
  void waterMeterDelete(String mac);
  @async
  void waterMeterSetPowerOnOff(String mac, bool isOn);
  @async
  void waterMeterSetRemainderM3(String mac, double remainderM3);
  @async
  void waterMeterClearRemainderM3(String mac);
  @async
  void waterMeterReadData(String mac);
  @async
  void waterMeterSetPayMode(String mac, TTMeterPayMode payMode, double price);
  @async
  void waterMeterCharge(String mac, double amount, double m3);
  @async
  void waterMeterSetTotalUsage(String mac, double totalM3);
  @async
  String waterMeterGetFeatureValue(String mac);
  @async
  WaterMeterDeviceInfo waterMeterGetDeviceInfo(String mac);
  bool waterMeterIsSupportFunction(String featureValue, TTWaterMeterFeature lockFunction);
  @async
  void waterMeterConfigApn(String mac, String apn);
  @async
  void waterMeterConfigMeterServer(String mac, String ip, String port);
  @async
  void waterMeterReset(String mac);
}

// -----------------------------
// EventChannel（Pigeon 限制：同一 .dart 输入文件内只能有 1 个 @EventChannelApi）
// 因此将「各路流」拆成多个无参方法；每个方法对应一条独立 EventChannel。
// 启动参数仍由 HostApi 的 startXxx / addXxx（返回 requestId）下发。
// -----------------------------

@EventChannelApi()
abstract class TTEventChannelApi {
  TTLockScanModel lockScanLock();

  TTWifiScanResult lockScanWifi();

  AddCardEvent lockAddCard();

  AddFingerprintEvent lockAddFingerprint();

  AddFaceEvent lockAddFace();

  AddPalmVeinEvent lockAddPalmVein();

  TTGatewayScanModel gatewayStartScan();

  TTWifiScanResult gatewayGetNearbyWifi();

  TTRemoteAccessoryScanModel accessoryStartScanRemoteKey();

  TTRemoteAccessoryScanModel accessoryStartScanRemoteKeypad();

  AddFingerprintEvent accessoryAddKeypadFingerprint();

  AddCardEvent accessoryAddKeypadCard();

  TTRemoteAccessoryScanModel accessoryStartScanDoorSensor();

  TTStandaloneDoorSensorScanModel accessoryStandaloneDoorSensorStartScan();

  TTMeterScanModel accessoryWaterMeterStartScan();

  TTMeterScanModel accessoryElectricMeterStartScan();
}

