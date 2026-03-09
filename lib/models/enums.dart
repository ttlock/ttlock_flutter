enum TTBluetoothState {
  unknow(0),
  resetting(1),
  unsupported(2),
  unAuthorized(3),
  turnOff(4),
  turnOn(5);

  final int value;
  const TTBluetoothState(this.value);
  static TTBluetoothState fromValue(int v) =>
      TTBluetoothState.values.firstWhere((e) => e.value == v);
}

enum TTPasscodeType {
  once(0),
  permanent(1),
  period(2),
  cycle(3);

  final int value;
  const TTPasscodeType(this.value);
  static TTPasscodeType fromValue(int v) =>
      TTPasscodeType.values.firstWhere((e) => e.value == v);
}

enum TTOperateRecordType {
  latest(0),
  total(1);

  final int value;
  const TTOperateRecordType(this.value);
  static TTOperateRecordType fromValue(int v) =>
      TTOperateRecordType.values.firstWhere((e) => e.value == v);
}

enum TTControlAction {
  unlock(0),
  lock(1);

  final int value;
  const TTControlAction(this.value);
  static TTControlAction fromValue(int v) =>
      TTControlAction.values.firstWhere((e) => e.value == v);
}

enum TTLockSwitchState {
  lock(0),
  unlock(1),
  unknow(2);

  final int value;
  const TTLockSwitchState(this.value);
  static TTLockSwitchState fromValue(int v) =>
      TTLockSwitchState.values.firstWhere((e) => e.value == v);
}

enum TTPassageModeType {
  weekly(0),
  monthly(1);

  final int value;
  const TTPassageModeType(this.value);
  static TTPassageModeType fromValue(int v) =>
      TTPassageModeType.values.firstWhere((e) => e.value == v);
}

enum TTLockConfig {
  audio(0),
  passcodeVisible(1),
  freeze(2),
  tamperAlert(3),
  resetButton(4),
  privacyLock(5),
  passageModeAutoUnlock(6),
  wifiLockPowerSavingMode(7),
  doubleAuth(8),
  publicMode(9),
  lowBatteryAutoUnlock(10);

  final int value;
  const TTLockConfig(this.value);
  static TTLockConfig fromValue(int v) =>
      TTLockConfig.values.firstWhere((e) => e.value == v);
}

enum TTLockDirection {
  left(0),
  right(1);

  final int value;
  const TTLockDirection(this.value);
  static TTLockDirection fromValue(int v) =>
      TTLockDirection.values.firstWhere((e) => e.value == v);
}

enum TTSoundVolumeType {
  firstLevel(0),
  secondLevel(1),
  thirdLevel(2),
  fourthLevel(3),
  fifthLevel(4),
  off(5),
  on(6);

  final int value;
  const TTSoundVolumeType(this.value);
  static TTSoundVolumeType fromValue(int v) =>
      TTSoundVolumeType.values.firstWhere((e) => e.value == v);
}

enum TTSensitivityValue {
  off(0),
  low(1),
  medium(2),
  high(3);

  final int value;
  const TTSensitivityValue(this.value);
  static TTSensitivityValue fromValue(int v) =>
      TTSensitivityValue.values.firstWhere((e) => e.value == v);
}

enum TTLockError {
  reseted(0),
  crcError(1),
  noPermisstion(2),
  wrongAdminCode(3),
  noStorageSpace(4),
  inSettingMode(5),
  noAdmin(6),
  notInSettingMode(7),
  wrongDynamicCode(8),
  noPower(9),
  resetPasscode(10),
  unpdatePasscodeIndex(11),
  invalidLockFlagPos(12),
  ekeyExpired(13),
  passcodeLengthInvalid(14),
  samePasscodes(15),
  ekeyInactive(16),
  aesKey(17),
  fail(18),
  passcodeExist(19),
  passcodeNotExist(20),
  lackOfStorageSpaceWhenAddingPasscodes(21),
  invalidParaLength(22),
  cardNotExist(23),
  fingerprintDuplication(24),
  fingerprintNotExist(25),
  invalidCommand(26),
  inFreezeMode(27),
  invalidClientPara(28),
  lockIsLocked(29),
  recordNotExist(30),
  notSupportModifyPasscode(31),
  bluetoothOff(32),
  bluetoothConnectTimeount(33),
  bluetoothDisconnection(34),
  lockIsBusy(35),
  invalidLockData(36),
  invalidParameter(37),
  wrongWifi(38),
  wrongWifiPassword(39);

  final int value;
  const TTLockError(this.value);
  static TTLockError fromValue(int v) =>
      TTLockError.values.firstWhere((e) => e.value == v);
}

enum TTErrorDevice {
  lock(0),
  keyPad(1),
  key(2);

  final int value;
  const TTErrorDevice(this.value);
  static TTErrorDevice fromValue(int v) =>
      TTErrorDevice.values.firstWhere((e) => e.value == v);
}

enum TTLiftWorkActivateType {
  allFloors(0),
  specificFloors(1);

  final int value;
  const TTLiftWorkActivateType(this.value);
  static TTLiftWorkActivateType fromValue(int v) =>
      TTLiftWorkActivateType.values.firstWhere((e) => e.value == v);
}

enum TTPowerSaverWorkType {
  allCards(0),
  hotelCard(1),
  roomCard(2);

  final int value;
  const TTPowerSaverWorkType(this.value);
  static TTPowerSaverWorkType fromValue(int v) =>
      TTPowerSaverWorkType.values.firstWhere((e) => e.value == v);
}

enum TTNbAwakeMode {
  keypad(0),
  card(1),
  fingerprint(2);

  final int value;
  const TTNbAwakeMode(this.value);
  static TTNbAwakeMode fromValue(int v) =>
      TTNbAwakeMode.values.firstWhere((e) => e.value == v);
}

enum TTNbAwakeTimeType {
  point(0),
  interval(1);

  final int value;
  const TTNbAwakeTimeType(this.value);
  static TTNbAwakeTimeType fromValue(int v) =>
      TTNbAwakeTimeType.values.firstWhere((e) => e.value == v);
}

enum TTRemoteAccessory {
  remoteKey(0),
  remoteKeypad(1),
  doorSensor(2);

  final int value;
  const TTRemoteAccessory(this.value);
  static TTRemoteAccessory fromValue(int v) =>
      TTRemoteAccessory.values.firstWhere((e) => e.value == v);
}

enum TTGatewayError {
  fail(0),
  wrongWifi(1),
  wrongWifiPassword(2),
  wrongCRC(3),
  wrongAeskey(4),
  notConnect(5),
  disconnect(6),
  failConfigRouter(7),
  failConfigServer(8),
  failConfigAccount(9),
  noSim(10),
  invalidCommand(11),
  failConfigIp(12),
  failInvalidIp(13);

  final int value;
  const TTGatewayError(this.value);
  static TTGatewayError fromValue(int v) =>
      TTGatewayError.values.firstWhere((e) => e.value == v);
}

enum TTGatewayType {
  g1(0),
  g2(1),
  g3(2),
  g4(3),
  g5(4);

  final int value;
  const TTGatewayType(this.value);
  static TTGatewayType fromValue(int v) =>
      TTGatewayType.values.firstWhere((e) => e.value == v);
}

enum TTIpSettingType {
  staticIp(0),
  dhcp(1);

  final int value;
  const TTIpSettingType(this.value);
  static TTIpSettingType fromValue(int v) =>
      TTIpSettingType.values.firstWhere((e) => e.value == v);
}

enum TTGatewayConnectStatus {
  timeout(0),
  success(1),
  faile(2);

  final int value;
  const TTGatewayConnectStatus(this.value);
  static TTGatewayConnectStatus fromValue(int v) =>
      TTGatewayConnectStatus.values.firstWhere((e) => e.value == v);
}

enum TTRemoteAccessoryError {
  fail(0),
  wrongCrc(1),
  connectTimeout(2);

  final int value;
  const TTRemoteAccessoryError(this.value);
  static TTRemoteAccessoryError fromValue(int v) =>
      TTRemoteAccessoryError.values.firstWhere((e) => e.value == v);
}

enum TTRemoteKeyPadAccessoryError {
  fail(0),
  wrongCrc(1),
  connectTimeout(2),
  factoryDate(3),
  duplicateFingerprint(4),
  lackOfStorageSpace(5);

  final int value;
  const TTRemoteKeyPadAccessoryError(this.value);
  static TTRemoteKeyPadAccessoryError fromValue(int v) =>
      TTRemoteKeyPadAccessoryError.values.firstWhere((e) => e.value == v);
}

enum TTFaceState {
  canStartAdd(0),
  error(1);

  final int value;
  const TTFaceState(this.value);
  static TTFaceState fromValue(int v) =>
      TTFaceState.values.firstWhere((e) => e.value == v);
}

enum TTFaceErrorCode {
  normal(0),
  noFaceDetected(1),
  tooCloseToTheTop(2),
  tooCloseToTheBottom(3),
  tooCloseToTheLeft(4),
  tooCloseToTheRight(5),
  tooFarAway(6),
  tooClose(7),
  eyebrowsCovered(8),
  eyesCovered(9),
  faceCovered(10),
  faceDirection(11),
  eyeOpeningDetected(12),
  eyesClosedStatus(13),
  failedToDetectEye(14),
  needTurnHeadToLeft(15),
  needTurnHeadToRight(16),
  needRaiseHead(17),
  needLowerHead(18),
  needTiltHeadToLeft(19),
  needTiltHeadToRight(20);

  final int value;
  const TTFaceErrorCode(this.value);
  static TTFaceErrorCode fromValue(int v) =>
      TTFaceErrorCode.values.firstWhere((e) => e.value == v);
}

enum TTLockFunction {
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
  unlockSwitch(14, androidName: 'CONFIG_GATEWAY_UNLOCK', iosName: 'TTLockFeatureValueRemoteUnlockSwicth'),
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
  const TTLockFunction(this.value, {this.androidName, this.iosName});
  static TTLockFunction fromValue(int v) =>
      TTLockFunction.values.firstWhere((e) => e.value == v);
}
