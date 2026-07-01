import 'package:ttlock_flutter/ttlock.dart';
import 'command_category.dart';

enum LockCommand {
  // 基础（无条件）
  controlLock(category: CommandCategory.basic),
  initLock(category: CommandCategory.basic),
  resetLock(category: CommandCategory.basic),
  getLockSwitchState(category: CommandCategory.basic),
  getBluetoothState(category: CommandCategory.basic),
  verifyLock(category: CommandCategory.basic),
  resetEkey(category: CommandCategory.basic),
  resetLockByCode(category: CommandCategory.basic),

  // 系统信息
  getLockPower(category: CommandCategory.basic),
  getLockTime(category: CommandCategory.basic),
  setLockTime(category: CommandCategory.basic),
  getLockSystemInfo(category: CommandCategory.basic),
  getLockFeatureValue(category: CommandCategory.basic),
  getLockOperateRecord(category: CommandCategory.basic),

  // 密码
  createPasscode(requires: [TTLockFunction.passcode], category: CommandCategory.passcode),
  modifyPasscode(requires: [TTLockFunction.managePasscode], category: CommandCategory.passcode),
  deletePasscode(requires: [TTLockFunction.deletePasscode], category: CommandCategory.passcode),
  resetPasscode(requires: [TTLockFunction.passcode], category: CommandCategory.passcode),
  getAdminPasscode(requires: [TTLockFunction.getAdminPasscode], category: CommandCategory.passcode),
  modifyAdminPasscode(requires: [TTLockFunction.managePasscode], category: CommandCategory.passcode),
  setErasePasscode(requires: [TTLockFunction.passcode], category: CommandCategory.passcode),
  recoverPasscode(requires: [TTLockFunction.passcode], category: CommandCategory.passcode),
  getAllValidPasscodes(requires: [TTLockFunction.passcode], category: CommandCategory.passcode),

  // IC 卡
  addCard(requires: [TTLockFunction.icCard], category: CommandCategory.card),
  deleteCard(requires: [TTLockFunction.icCard], category: CommandCategory.card),
  getAllValidCards(requires: [TTLockFunction.icCard], category: CommandCategory.card),
  modifyCardValidity(requires: [TTLockFunction.icCard], category: CommandCategory.card),
  clearAllCards(requires: [TTLockFunction.icCard], category: CommandCategory.card),
  recoverCard(requires: [TTLockFunction.icCard], category: CommandCategory.card),
  reportLossCard(requires: [TTLockFunction.icCard], category: CommandCategory.card),

  // 指纹
  addFingerprint(requires: [TTLockFunction.fingerprint], category: CommandCategory.fingerprint),
  deleteFingerprint(requires: [TTLockFunction.fingerprint], category: CommandCategory.fingerprint),
  getAllValidFingerprints(requires: [TTLockFunction.fingerprint], category: CommandCategory.fingerprint),
  modifyFingerprintValidity(requires: [TTLockFunction.fingerprint], category: CommandCategory.fingerprint),
  clearAllFingerprints(requires: [TTLockFunction.fingerprint], category: CommandCategory.fingerprint),

  // 人脸
  addFace(requires: [TTLockFunction.face], category: CommandCategory.face),
  deleteFace(requires: [TTLockFunction.face], category: CommandCategory.face),
  modifyFace(requires: [TTLockFunction.face], category: CommandCategory.face),
  clearFace(requires: [TTLockFunction.face], category: CommandCategory.face),
  addFaceData(requires: [TTLockFunction.face], category: CommandCategory.face),

  // 掌静脉
  addPalmVein(requires: [TTLockFunction.palmVein], category: CommandCategory.palmVein),
  deletePalmVein(requires: [TTLockFunction.palmVein], category: CommandCategory.palmVein),
  modifyPalmVein(requires: [TTLockFunction.palmVein], category: CommandCategory.palmVein),
  clearPalmVein(requires: [TTLockFunction.palmVein], category: CommandCategory.palmVein),
  getAllValidPalmVeins(requires: [TTLockFunction.palmVein], category: CommandCategory.palmVein),

  // 网络
  scanWifi(requires: [TTLockFunction.wifiLock], category: CommandCategory.network),
  configWifi(requires: [TTLockFunction.wifiLock], category: CommandCategory.network),
  configServer(requires: [TTLockFunction.wifiLock], category: CommandCategory.network),
  configIp(requires: [TTLockFunction.wifiLockStaticIP], category: CommandCategory.network),
  getWifiInfo(requires: [TTLockFunction.wifiLock], category: CommandCategory.network),
  configCameraLockWifi(requires: [TTLockFunction.wifiLock], category: CommandCategory.network),
  setNBServerAddress(requires: [TTLockFunction.nbIoT], category: CommandCategory.network),
  getLockVersion(requires: [TTLockFunction.nbIoT], category: CommandCategory.network),

  // 安全配置
  audioSwitch(requires: [TTLockFunction.audioSwitch], category: CommandCategory.security),
  lockFreezeSwitch(requires: [TTLockFunction.lockFreeze], category: CommandCategory.security),
  remoteUnlockSwitch(requires: [TTLockFunction.unlockSwitch], category: CommandCategory.security),
  doubleAuthSwitch(requires: [TTLockFunction.doubleAuth], category: CommandCategory.security),
  tamperAlertSwitch(requires: [TTLockFunction.tamperAlert], category: CommandCategory.security),
  privacyLockSwitch(requires: [TTLockFunction.privacyLock], category: CommandCategory.security),
  resetButtonSwitch(requires: [TTLockFunction.resetButton], category: CommandCategory.security),
  passageModeAutoUnlock(requires: [TTLockFunction.passageModeAutoUnlockSetting], category: CommandCategory.security),
  wifiPowerSavingSwitch(requires: [TTLockFunction.wifiPowerSavingTime], category: CommandCategory.security),
  publicModeSwitch(requires: [TTLockFunction.publicMode], category: CommandCategory.security),
  lowBatteryAutoUnlockSwitch(requires: [TTLockFunction.lowBatteryAutoUnlock], category: CommandCategory.security),
  semiAutomaticMode(requires: [TTLockFunction.semiAutomaticModeControl], category: CommandCategory.security),
  securityM1Card(requires: [TTLockFunction.securityM1Card], category: CommandCategory.security),
  lockSupervision(requires: [TTLockFunction.supportSupervision], category: CommandCategory.security),

  // 配置
  setAutoLock(requires: [TTLockFunction.autoLock], category: CommandCategory.behavior),
  setLockDirection(category: CommandCategory.behavior),
  setSoundVolume(requires: [TTLockFunction.soundVolumeAndLanguageSetting], category: CommandCategory.behavior),
  setSensitivity(requires: [TTLockFunction.sensitivity], category: CommandCategory.behavior),
  setMotorTorque(category: CommandCategory.advanced),
  setLockLatchBolt(requires: [TTLockFunction.controlLatchBolt], category: CommandCategory.advanced),
  getLightTime(category: CommandCategory.advanced),
  setLightTime(category: CommandCategory.advanced),
  setLockWorkingTime(category: CommandCategory.advanced),
  setPowerSaverWorkMode(requires: [TTLockFunction.powerSaverSupportWifi], category: CommandCategory.advanced),

  // 通行模式
  addPassageMode(requires: [TTLockFunction.passageMode], category: CommandCategory.passageMode),
  clearPassageModes(requires: [TTLockFunction.passageMode], category: CommandCategory.passageMode),
  getPassageModes(requires: [TTLockFunction.passageMode], category: CommandCategory.passageMode),

  // 电梯
  activateLift(requires: [TTLockFunction.passageMode], category: CommandCategory.lift),
  setLiftControlable(requires: [TTLockFunction.passageMode], category: CommandCategory.lift),
  setLiftWorkMode(requires: [TTLockFunction.passageMode], category: CommandCategory.lift),

  // 酒店
  setHotel(requires: [TTLockFunction.hotelCard], category: CommandCategory.hotel),
  setHotelCardSector(requires: [TTLockFunction.hotelCard], category: CommandCategory.hotel),

  // 配件关联
  addDoorSensor(requires: [TTLockFunction.doorSensor], category: CommandCategory.accessory),
  deleteDoorSensor(requires: [TTLockFunction.doorSensor], category: CommandCategory.accessory),
  setDoorSensorAlertTime(requires: [TTLockFunction.doorSensor], category: CommandCategory.accessory),
  addRemoteKey(requires: [TTLockFunction.remoteKey], category: CommandCategory.accessory),
  deleteRemoteKey(requires: [TTLockFunction.remoteKey], category: CommandCategory.accessory),
  clearRemoteKey(requires: [TTLockFunction.remoteKey], category: CommandCategory.accessory),
  setRemoteKeyValidDate(requires: [TTLockFunction.remoteKey], category: CommandCategory.accessory),
  ;

  const LockCommand({this.requires, required this.category});

  final List<TTLockFunction>? requires;
  final CommandCategory category;

  /// 能力门控：检查当前能力集下该命令是否可见
  bool isVisibleFor(Set<TTLockFunction> caps) {
    if (requires == null || requires!.isEmpty) return true;
    return requires!.every(caps.contains);
  }
}
