import 'package:ttlock_premise_flutter/src/tt_response.dart';

// --- Enums (order: base enums first, then those referenced by models) ---
enum TTBluetoothState {
  unknow,
  resetting,
  unsupported,
  unAuthorized,
  turnOff,
  turnOn
}

enum TTPasscodeType { once, permanent, period, cycle }

enum TTOperateRecordType { latest, total }

enum TTControlAction { unlock, lock }

enum TTLockSwitchState { lock, unlock, unknow }

enum TTPassageModeType { weekly, monthly }

enum TTLockReuslt { success, progress, fail }

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
  lowBatteryAutoUnlock
}

enum TTLockDirection { left, right }

enum TTSoundVolumeType {
  firstLevel,
  secondLevel,
  thirdLevel,
  fouthLevel,
  fifthLevel,
  off,
  on
}

enum TTSensitivityValue {
  off(0),
  low(1),
  medium(2),
  high(3);

  final int value;

  const TTSensitivityValue(this.value);
}

enum TTLockError {
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
  wrongWifiPassword
}

enum TTErrorDevice { lock, keyPad, key }

enum TTLiftWorkActivateType { allFloors, specificFloors }

enum TTPowerSaverWorkType { allCards, hotelCard, roomCard }

enum TTNbAwakeMode { keypad, card, fingerprint }

enum TTNbAwakeTimeType { point, interval }

enum TTRemoteAccessory { remoteKey, remoteKeypad, doorSensor }

enum TTGatewayError {
  fail,
  wrongWifi,
  wrongWifiPassword,
  wrongCRC,
  wrongAeskey,
  notConnect,
  disconnect,
  failConfigRouter,
  failConfigServer,
  failConfigAccount,
  noSim,
  invalidCommand,
  failConfigIp,
  failInvalidIp
}

enum TTGatewayType { g1, g2, g3, g4, g5 }

enum TTIpSettingType { STATIC_IP, DHCP }

enum TTGatewayConnectStatus { timeout, success, faile }

enum TTRemoteAccessoryError { fail, wrongCrc, connectTimeout }

enum TTRemoteKeyPadAccessoryError {
  fail,
  wrongCrc,
  connectTimeout,
  factoryDate,
  duplicateFingerprint,
  lackOfStorageSpace
}

enum TTFaceState { canStartAdd, error }

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

// --- Models (depend on TTResponse and/or enums above) ---
class TTLockScanModel {
  String lockName = '';
  String lockMac = '';
  bool isInited = true;
  bool isAllowUnlock = false;
  int electricQuantity = -1;
  String lockVersion = '';
  TTLockSwitchState lockSwitchState = TTLockSwitchState.unknow;
  int rssi = -1;
  int oneMeterRssi = -1;
  int timestamp = 0;

  TTLockScanModel(Map map) {
    lockName = map[TTResponse.lockName];
    lockMac = map[TTResponse.lockMac];
    isInited = map[TTResponse.isInited];
    isAllowUnlock = map[TTResponse.isAllowUnlock];
    electricQuantity = map[TTResponse.electricQuantity];
    lockVersion = map[TTResponse.lockVersion];
    lockSwitchState =
        TTLockSwitchState.values[map[TTResponse.lockSwitchState]];
    rssi = map[TTResponse.rssi];
    oneMeterRssi = map[TTResponse.oneMeterRssi];
    timestamp = map[TTResponse.timestamp];
  }
}

class TTCycleModel {
  int weekDay = 0;
  int startTime = 0;
  int endTime = 0;

  Map toJson() {
    Map map = <String, dynamic>{};
    map["weekDay"] = weekDay;
    map["startTime"] = startTime;
    map["endTime"] = endTime;
    return map;
  }

  TTCycleModel(int weekDay, int startTime, int endTime) {
    this.weekDay = weekDay;
    this.startTime = startTime;
    this.endTime = endTime;
  }
}

class TTLockSystemModel {
  String? modelNum;
  String? hardwareRevision;
  String? firmwareRevision;
  int? electricQuantity;
  String? nbOperator;
  String? nbNodeId;
  String? nbCardNumber;
  String? nbRssi;
  String? lockData;

  TTLockSystemModel(Map map) {
    modelNum = map["modelNum"];
    hardwareRevision = map["hardwareRevision"];
    firmwareRevision = map["firmwareRevision"];
    electricQuantity = map["electricQuantity"];
    nbOperator = map["nbOperator"];
    nbNodeId = map["nbNodeId"];
    nbCardNumber = map["nbCardNumber"];
    nbRssi = map["nbRssi"];
    lockData = map["lockData"];
  }
}

class TTRemoteAccessoryScanModel {
  String name = '';
  String mac = '';
  int rssi = -1;
  bool isMultifunctionalKeypad = false;
  Map advertisementData = {};

  TTRemoteAccessoryScanModel(Map map) {
    name = map["name"];
    mac = map["mac"];
    rssi = map["rssi"];
    isMultifunctionalKeypad = map["isMultifunctionalKeypad"] ?? false;
    advertisementData = map["advertisementData"] ?? {};
  }
}

class TTDoorSensorScanModel {
  String name = '';
  String mac = '';
  int rssi = -1;

  TTDoorSensorScanModel(Map map) {
    name = map["name"];
    mac = map["mac"];
    rssi = map["rssi"];
  }
}

class TTGatewayScanModel {
  String gatewayName = '';
  String gatewayMac = '';
  int rssi = -1;
  bool isDfuMode = false;
  TTGatewayType? type;

  TTGatewayScanModel(Map map) {
    gatewayName = map["gatewayName"];
    gatewayMac = map["gatewayMac"];
    rssi = map["rssi"];
    type = TTGatewayType.values[map["type"]];
    isDfuMode = map["isDfuMode"];
  }
}

class TTNbAwakeTimeModel {
  TTNbAwakeTimeType type = TTNbAwakeTimeType.point;
  int minutes = 0;
}

class TTWifiInfoModel {
  String wifiMac = '';
  int wifiRssi = -127;

  TTWifiInfoModel(Map map) {
    wifiMac = map["wifiMac"];
    wifiRssi = map["wifiRssi"];
  }
}

// --- TTLockFuction (large enum with constructor) ---
enum TTLockFuction {
  passcode(0, androidName: 'PASSCODE', iosName: 'TTLockFeatureValuePasscode'),
  icCard(1, androidName: 'IC', iosName: 'TTLockFeatureValueICCard'),
  fingerprint(2, androidName: 'FINGER_PRINT', iosName: 'TTLockFeatureValueFingerprint'),
  wristband(3, androidName: 'WRIST_BAND', iosName: 'TTLockFeatureValueWristband'),
  autoLock(4, androidName: 'AUTO_LOCK', iosName: 'TTLockFeatureValueAutoLock'),
  deletePasscode(5, androidName: 'PASSCODE_WITH_DELETE_FUNCTION', iosName: 'TTLockFeatureValueDeletePasscode'),
  managePasscode(7, androidName: 'MODIFY_PASSCODE_FUNCTION', iosName: 'TTLockFeatureValueManagePasscode'),
  locking(8, androidName: 'MANUAL_LOCK', iosName: 'TTLockFeatureValueLocking'),
  passcodeVisible(9, androidName: 'PASSWORD_DISPLAY_OR_HIDE', iosName: 'TTLockFeatureValuePasscodeVisible'),
  gatewayUnlock(10, androidName: 'GATEWAY_UNLOCK', iosName: 'TTLockFeatureValueGatewayUnlock'),
  lockFreeze(11, androidName: 'FREEZE_LOCK', iosName: 'TTLockFeatureValueLockFreeze'),
  cyclePassword(12, androidName: 'CYCLIC_PASSWORD', iosName: 'TTLockFeatureValueCyclePassword'),
  unlockSwicth(14, androidName: 'CONFIG_GATEWAY_UNLOCK', iosName: 'TTLockFeatureValueRemoteUnlockSwicth'),
  audioSwitch(15, androidName: 'AUDIO_MANAGEMENT', iosName: 'TTLockFeatureValueAudioSwitch'),
  nbIoT(16, androidName: 'NB_LOCK', iosName: 'TTLockFeatureValueNBIoT'),
  getAdminPasscode(18, androidName: 'GET_ADMIN_CODE', iosName: 'TTLockFeatureValueGetAdminPasscode'),
  hotelCard(19, androidName: 'HOTEL_LOCK', iosName: 'TTLockFeatureValueHotelCard'),
  noClock(20, androidName: 'LOCK_NO_CLOCK_CHIP', iosName: 'TTLockFeatureValueNoClock'),
  noBroadcastInNormal(21, androidName: 'SUPPORT_CLOSE_BLUETOOTH_ADVERTISING', iosName: 'TTLockFeatureValueNoBroadcastInNormal'),
  passageMode(22, androidName: 'PASSAGE_MODE', iosName: 'TTLockFeatureValuePassageMode'),
  turnOffAutoLock(23, androidName: 'PASSAGE_MODE_AND_AUTO_LOCK_AND_CAN_CLOSE', iosName: 'TTLockFeatureValueTurnOffAutoLock'),
  wirelessKeypad(24, androidName: 'WIRELESS_KEYBOARD', iosName: 'TTLockFeatureValueWirelessKeypad'),
  light(25, androidName: 'LAMP', iosName: 'TTLockFeatureValueLight'),
  hotelCardBlacklist(26, androidName: null, iosName: 'TTLockFeatureValueHotelCardBlacklist'),
  identityCard(27, androidName: null, iosName: 'TTLockFeatureValueIdentityCard'),
  tamperAlert(28, androidName: 'TAMPER_ALERT', iosName: 'TTLockFeatureValueTamperAlert'),
  resetButton(29, androidName: 'RESET_BUTTON', iosName: 'TTLockFeatureValueResetButton'),
  privacyLock(30, androidName: 'PRIVACY_LOCK', iosName: 'TTLockFeatureValuePrivacyLock'),
  deadLock(32, androidName: 'DEAD_LOCK', iosName: 'TTLockFeatureValueDeadLock'),
  cyclicCardOrFingerprint(34, androidName: 'CYCLIC_IC_OR_FINGER_PRINT', iosName: 'TTLockFeatureValueCyclicCardOrFingerprint'),
  fingerVein(37, androidName: 'FINGER_VEIN', iosName: 'TTLockFeatureValueFingerVein'),
  ble5G(38, androidName: 'TELINK_CHIP', iosName: 'TTLockFeatureValueBle5G'),
  nbAwake(39, androidName: 'NB_ACTIVITE_CONFIGURATION', iosName: 'TTLockFeatureValueNBAwake'),
  recoverCyclePasscode(40, androidName: 'CYCLIC_PASSCODE_CAN_RECOVERY', iosName: 'TTLockFeatureValueRecoverCyclePasscode'),
  remoteKey(41, androidName: 'REMOTE', iosName: 'TTLockFeatureValueWirelessKeyFob'),
  getAccessoryElectricQuantity(42, androidName: 'ACCESSORY_BATTERY', iosName: 'TTLockFeatureValueGetAccessoryElectricQuantity'),
  soundVolumeAndLanguageSetting(43, androidName: 'SOUND_VOLUME_AND_LANGUAGE_SETTING', iosName: 'TTLockFeatureValueSoundVolume'),
  qrCode(44, androidName: 'QR_CODE', iosName: 'TTLockFeatureValueQRCode'),
  doorSensorState(45, androidName: 'DOOR_SENSOR', iosName: 'TTLockFeatureValueSensorState'),
  passageModeAutoUnlockSetting(46, androidName: 'PASSAGE_MODE_AUTO_UNLOCK_SETTING', iosName: 'TTLockFeatureValuePassageModeAutoUnlock'),
  doorSensor(50, androidName: 'WIRELESS_DOOR_SENSOR', iosName: 'TTLockFeatureValueDoorSensor'),
  doorSensorAlert(51, androidName: 'DOOR_OPEN_ALARM', iosName: 'TTLockFeatureValueDoorSensorAlert'),
  sensitivity(52, androidName: 'SENSITIVITY', iosName: 'TTLockFeatureValueSensitivity'),
  face(53, androidName: 'FACE_3D', iosName: 'TTLockFeatureValueFace'),
  cpuCard(55, androidName: 'CPU_CARD', iosName: 'TTLockFeatureValueCpuCard'),
  wifiLock(56, androidName: 'WIFI_LOCK', iosName: 'TTLockFeatureValueWifiLock'),
  wifiLockStaticIP(58, androidName: 'WIFI_LOCK_SUPPORT_STATIC_IP', iosName: 'TTLockFeatureValueWifiLockStaticIP'),
  passcodeKeyNumber(60, androidName: 'INCOMPLETE_PASSCODE', iosName: 'TTLockFeatureValuePasscodeKeyNumber'),
  standAloneActivation(62, androidName: null, iosName: 'TTLockFeatureValueStandAloneActivation'),
  doubleAuth(63, androidName: 'SUPPORT_DOUBLE_CHECK', iosName: 'TTLockFeatureValueDoubleAuth'),
  authorizedUnlock(64, androidName: 'APP_AUTH_UNLOCK', iosName: 'TTLockFeatureValueAuthorizedUnlock'),
  gatewayAuthorizedUnlock(65, androidName: 'GATEWAY_AUTH_UNLOCK', iosName: 'TTLockFeatureValueGatewayAuthorizedUnlock'),
  noEkeyUnlock(66, androidName: 'DO_NOT_SUPPORT_APP_AND_GATEWAY_UNLOCK', iosName: 'TTLockFeatureValueNoEkeyUnlock'),
  zhiAnPhotoFace(69, androidName: 'ZHI_AN_FACE_DELIVERY', iosName: 'TTLockFeatureValueZhiAnPhotoFace'),
  palmVein(70, androidName: 'PALM_VEIN', iosName: 'TTLockFeatureValuePalmVein'),
  wifiArea(71, androidName: null, iosName: 'TTLockFeatureValueWifiArea'),
  xiaoCaoCamera(75, androidName: 'SUPPORT_GRASS', iosName: 'TTLockFeatureValueXiaoCaoCamera'),
  resetLockByCode(76, androidName: 'RESET_LOCK_BY_CODE', iosName: 'TTLockFeatureValueResetLockByCode'),
  thirdPartyBluetoothDevice(77, androidName: 'SUPPORT_THIRD_PARTY_BLUETOOTH_DEVICE', iosName: null),
  autoSetAngle(78, androidName: 'AUTO_SET_ANGLE', iosName: 'TTLockFeatureValueAutoSetAngle'),
  manualSetAngle(79, androidName: 'MANUAL_SET_ANGLE', iosName: 'TTLockFeatureValueManualSetAngle'),
  controlLatchBolt(80, androidName: 'CONTROL_LATCH_BOLT', iosName: 'TTLockFeatureValueControlLatchBolt'),
  autoSetUnlockDirection(81, androidName: 'AUTO_SET_UNLOCK_DIRECTION', iosName: 'TTLockFeatureValueAutoSetUnlockDirection'),
  icCardSecuritySetting(82, androidName: 'SUPPORT_IC_CARD_SECURITY_SETTING', iosName: null),
  wifiPowerSavingTime(83, androidName: 'SUPPORT_WIFI_SLEEP_MODE_TIMES_SETTING', iosName: 'TTLockFeatureValueWifiPowerSavingTime'),
  multiFunctionKeypad(84, androidName: 'SUPPORT_MULTI_FUNCTION_KEYPAD', iosName: 'TTLockFeatureValueMultifunctionalKeypad'),
  doNotSupportTurnOffLatchBolt(85, androidName: 'DO_NOT_SUPPORT_TURN_OFF_LATCH_BOLT', iosName: null),
  publicMode(86, androidName: 'SUPPORT_PUBLIC_MODE_SETTING', iosName: 'TTLockFeatureValuePublicMode'),
  lowBatteryAutoUnlock(87, androidName: 'SUPPORT_LOW_BATTERY_UNLOCK_SETTING', iosName: 'TTLockFeatureValueLowBatteryAutoUnlock'),
  motorDriveTime(88, androidName: 'SUPPORT_MOTOR_DRIVE_TIME_SETTING', iosName: 'TTLockFeatureValueMotorDriveTime'),
  modifyFeatureValue(89, androidName: 'SUPPORT_MODIFY_FEATURE_VALUE', iosName: 'TTLockFeatureValueModifyFeatureValue'),
  modifyLockNamePrefix(90, androidName: 'SUPPORT_MODIFY_LOCK_NAME_PREFIX', iosName: 'TTLockFeatureValueModifyLockNamePrefix'),
  authCode(92, androidName: 'SUPPORT_AUTH_CODE', iosName: 'TTLockFeatureValueAuthCode'),
  unauthorizedAttemptAlarm(93, androidName: 'UNAUTHORIZED_ATTEMPT_ALARM', iosName: null),
  powerSaverSupportWifi(96, androidName: 'POWER_SAVER_SUPPORT_WIFI', iosName: 'TTLockFeatureValuePowerSaverSupportWifi'),
  bluetoothAdvertisingSetting(97, androidName: 'SUPPORT_BLUETOOTH_ADVERTISING_SETTING', iosName: null),
  workingMode(98, androidName: 'SUPPORT_WORKING_TIMES', iosName: 'TTLockFeatureValueWorkingMode'),
  supplierCode(99, androidName: 'SUPPORT_SUPPLIER_CODE', iosName: null),
  catOne(100, androidName: 'SUPPORT_CAT_ONE', iosName: null),
  forcedOpeningDoorAlarm(102, androidName: 'SUPPORT_FORCED_OPENING_DOOR_ALARM', iosName: null),
  zhiAnFaceFeatureSecondGeneration(103, androidName: 'ZHI_AN_FACE_FEATURE_SECOND_GENERATION', iosName: null),
  supportDeadLocking(106, androidName: 'SUPPORT_DEAD_LOCKING', iosName: null),
  workingTime(107, androidName: null, iosName: 'TTLockFeatureValueWorkingTime'),
  customQRCode(108, androidName: 'SUPPORT_CUSTOM_QR_CODE', iosName: 'TTLockFeatureValueCustomQRCode'),
  securityM1Card(109, androidName: 'SUPPORT_SAFE_M1_CARD', iosName: 'TTLockFeatureValueSecurityM1Card'),
  yiShengPhotoFace(110, androidName: null, iosName: 'TTLockFeatureValueYiShengPhotoFace');

  final int value;
  final String? androidName;
  final String? iosName;
  const TTLockFuction(this.value, {this.androidName, this.iosName});
}

// --- Typedefs ---
typedef TTSuccessCallback = void Function();
typedef TTFailedCallback = void Function(
    TTLockError errorCode, String errorMsg);
typedef TTLockScanCallback = void Function(TTLockScanModel scanModel);
typedef TTBluetoothStateCallback = void Function(TTBluetoothState state);
typedef TTBluetoothScanStateCallback = void Function(bool isScanning);
typedef TTLockDataCallback = void Function(String lockData);
typedef TTControlLockCallback = void Function(
    int lockTime, int electricQuantity, int uniqueId);
typedef TTGetAdminPasscodeCallback = void Function(String adminPasscode);
typedef TTGetLockElectricQuantityCallback = void Function(int electricQuantity);
typedef TTGetLockOperateRecordCallback = void Function(String records);
typedef TTGetLockSpecialValueCallback = void Function(int specialValue);
typedef TTGetLockTimeCallback = void Function(int timestamp);
typedef TTGetLockSystemCallback = void Function(
    TTLockSystemModel lockSystemModel);

typedef TTGetLockPasscodeDataCallback = void Function(String passcodeData);
typedef TTGetLockAutomaticLockingPeriodicTimeCallback = void Function(
    int currentTime, int minTime, int maxTime);
typedef TTGetAllPasscodeCallback = void Function(List passcodeList);

typedef TTAddCardProgressCallback = void Function();
typedef TTCardNumberCallback = void Function(String cardNumber);
typedef TTGetAllCardsCallback = void Function(List cardList);

typedef TTAddFingerprintProgressCallback = void Function(
    int currentCount, int totalCount);
typedef TTAddFingerprintCallback = void Function(String fingerprintNumber);
typedef TTGetAllFingerprintsCallback = void Function(List fingerprintList);
typedef TTGetSwitchStateCallback = void Function(bool isOn);
typedef TTGetLockStatusCallback = void Function(TTLockSwitchState state);
typedef TTGetLockDirectionCallback = void Function(TTLockDirection direction);

typedef TTGatewayFailedCallback = void Function(
    TTGatewayError errorCode, String errorMsg);
typedef TTGatewayScanCallback = void Function(TTGatewayScanModel scanModel);
typedef TTGatewayConnectCallback = void Function(TTGatewayConnectStatus status);
typedef TTGatewayDisconnectCallback = void Function();
typedef TTGatewayGetAroundWifiCallback = void Function(
    bool finished, List wifiList);
typedef TTGatewayInitCallback = void Function(Map map);
typedef TTFunctionSupportCallback = void Function(bool isSupport);

typedef TTLiftCallback = void Function(
    int lockTime, int electricQuantity, int uniqueId);

typedef TTGetNbAwakeModesCallback = void Function(List<TTNbAwakeMode> list);
typedef TTGetNbAwakeTimesCallback = void Function(
    List<TTNbAwakeTimeModel> list);

typedef TTGetLockVersionCallback = void Function(String lockVersion);

typedef TTWifiLockScanWifiCallback = void Function(
    bool finished, List wifiList);

typedef TTWifiLockGetWifiInfoCallback = void Function(TTWifiInfoModel wifiInfo);

typedef TTCameraLockConfigWifiCallback = void Function(String serialNumber, String wifiName);

typedef TTGetLockSoundWithSoundVolumeCallback = void Function(
    TTSoundVolumeType ttLocksoundVolumeType);

typedef TTRemoteFailedCallback = void Function(
    TTRemoteAccessoryError errorCode, String errorMsg);
typedef TTRemoteAccessoryScanCallback = void Function(
    TTRemoteAccessoryScanModel scanModel);

typedef TTGetLockAccessoryElectricQuantity = void Function(
    int electricQuantity, int updateDate);

typedef TTRemoteKeypadSuccessCallback = void Function();

typedef TTRemoteKeypadInitSuccessCallback = void Function(
    int electricQuantity, String wirelessKeypadFeatureValue);

typedef TTMultifunctionalRemoteKeypadInitSuccessCallback = void Function(
    int electricQuantity,
    String wirelessKeypadFeatureValue,
    int slotNumber,
    int slotLimit,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision);

typedef TTRemoteKeypadGetStoredLockSuccessCallback = void Function(
    List lockMacs);

typedef TTRemoteKeypadFailedCallback = void Function(
    TTRemoteKeyPadAccessoryError errorCode, String errorMsg);

typedef TTAddFaceProgressCallback = void Function(
    TTFaceState state, TTFaceErrorCode faceErrorCode);

typedef TTAddFaceSuccessCallback = void Function(String faceNumber);
