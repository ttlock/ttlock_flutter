// Auto-generated minimal Pigeon host stubs for OHOS. Replace with real SDK wiring.
// Note: current pigeon ArkTS output has no EventChannel streams; Dart Stream APIs will not receive OHOS events until generator supports them.

import {
  AccessoryElectricQuantityResult,
  AutoLockingTime,
  CameraLockWifiResult,
  ControlLockResult,
  MultifunctionalKeypadInitResult,
  RemoteKeypadInitResult,
  TTAccessoryHostApi,
  TTBluetoothState,
  TTControlAction,
  TTCycleModel,
  TTElectricMeterInitResult,
  TTGatewayConnectStatus,
  TTGatewayHostApi,
  TTGatewayInitParams,
  TTIpSetting,
  TTLiftWorkActivateType,
  TTLockConfig,
  TTLockDirection,
  TTLockFunction,
  TTLockHostApi,
  TTLockInitParams,
  TTLockSwitchState,
  TTLockSystemModel,
  TTOperateRecordType,
  TTPassageModeType,
  TTPasscodeType,
  TTPowerSaverWorkType,
  TTSensitivityValue,
  TTSoundVolumeType,
  TTStandaloneDoorSensorInfo,
  TTWaterMeterInitResult,
  TTWifiInfoModel
} from './messages.g.ets';

export class TtlockStubTTLockHostApi extends TTLockHostApi {
  stopScanLock(): void { }
  startScanLock(): number { return 0; }
  scanWifi(lockData: string ): number { return 0; }
  addCard(cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): number { return 0; }
  addFingerprint(cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): number { return 0; }
  addFace(cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): number { return 0; }
  getBluetoothState(): TTBluetoothState { return TTBluetoothState.UNKNOW; }
  initLock(params: TTLockInitParams ): string { return ""; }
  resetLock(lockData: string ): void { }
  resetEkey(lockData: string ): string { return ""; }
  resetLockByCode(lockMac: string , resetCode: string ): void { }
  verifyLock(lockMac: string ): void { }
  controlLock(lockData: string , action: TTControlAction ): ControlLockResult { return new ControlLockResult(0, 0, 0); }
  getLockSwitchState(lockData: string ): TTLockSwitchState { return TTLockSwitchState.UNKNOW; }
  supportFunction(function: TTLockFunction , lockData: string ): boolean { return false; }
  createCustomPasscode(passcode: string , startDate: number , endDate: number , lockData: string ): void { }
  modifyPasscode(passcodeOrigin: string , passcodeNew: string , startDate: number , endDate: number , lockData: string ): void { }
  deletePasscode(passcode: string , lockData: string ): void { }
  resetPasscode(lockData: string ): string { return ""; }
  getAdminPasscode(lockData: string ): string { return ""; }
  setErasePasscode(erasePasscode: string , lockData: string ): void { }
  getAllValidPasscodes(lockData: string ): Array<Map<string, Object>> { return []; }
  recoverPasscode(passcode: string , passcodeNew: string , type: TTPasscodeType , startDate: number , endDate: number , cycleType: number , lockData: string ): void { }
  modifyAdminPasscode(adminPasscode: string , lockData: string ): string { return ""; }
  getPasscodeVerificationParams(lockData: string ): string { return ""; }
  modifyCardValidityPeriod(cardNumber: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): void { }
  deleteCard(cardNumber: string , lockData: string ): void { }
  getAllValidCards(lockData: string ): Array<Map<string, Object>> { return []; }
  clearAllCards(lockData: string ): void { }
  recoverCard(cardNumber: string , startDate: number , endDate: number , lockData: string ): void { }
  reportLossCard(cardNumber: string , lockData: string ): void { }
  modifyFingerprintValidityPeriod(fingerprintNumber: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): void { }
  deleteFingerprint(fingerprintNumber: string , lockData: string ): void { }
  getAllValidFingerprints(lockData: string ): Array<Map<string, Object>> { return []; }
  clearAllFingerprints(lockData: string ): void { }
  modifyFace(faceNumber: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): void { }
  addFaceData(cycleList: Array<TTCycleModel> , startDate: number , endDate: number , faceFeatureData: string , lockData: string ): string { return ""; }
  deleteFace(faceNumber: string , lockData: string ): void { }
  clearFace(lockData: string ): void { }
  setLockTime(timestamp: number , lockData: string ): void { }
  getLockTime(lockData: string ): number { return 0; }
  setLockWorkingTime(startDate: number , endDate: number , lockData: string ): void { }
  getLockOperateRecord(type: TTOperateRecordType , lockData: string ): string { return ""; }
  getLockPower(lockData: string ): number { return 0; }
  getLockSystemInfo(lockData: string ): TTLockSystemModel { return new TTLockSystemModel(); }
  getLockFeatureValue(lockData: string ): string { return ""; }
  getAutoLockingPeriodicTime(lockData: string ): AutoLockingTime { return new AutoLockingTime(0, 0, 0); }
  setAutoLockingPeriodicTime(seconds: number , lockData: string ): void { }
  getRemoteUnlockSwitchState(lockData: string ): boolean { return false; }
  setRemoteUnlockSwitchState(isOn: boolean , lockData: string ): string { return ""; }
  getLockConfig(config: TTLockConfig , lockData: string ): boolean { return false; }
  setLockConfig(config: TTLockConfig , isOn: boolean , lockData: string ): void { }
  getLockDirection(lockData: string ): TTLockDirection { return TTLockDirection.LEFT; }
  setLockDirection(direction: TTLockDirection , lockData: string ): void { }
  addPassageMode(type: TTPassageModeType , weekly: Array<number> , monthly: Array<number> , startTime: number , endTime: number , lockData: string ): void { }
  clearAllPassageModes(lockData: string ): void { }
  activateLift(floors: string , lockData: string ): ControlLockResult { return new ControlLockResult(0, 0, 0); }
  setLiftControlable(floors: string , lockData: string ): void { }
  setLiftWorkMode(type: TTLiftWorkActivateType , lockData: string ): void { }
  setPowerSaverWorkMode(type: TTPowerSaverWorkType , lockData: string ): void { }
  setPowerSaverControlableLock(lockMac: string , lockData: string ): void { }
  setHotel(hotelInfo: string , buildingNumber: number , floorNumber: number , lockData: string ): void { }
  setHotelCardSector(sector: string , lockData: string ): void { }
  getLockVersion(lockMac: string ): string { return ""; }
  setNBServerAddress(ip: string , port: string , lockData: string ): number { return 0; }
  configWifi(wifiName: string , wifiPassword: string , lockData: string ): void { }
  configServer(ip: string , port: string , lockData: string ): void { }
  getWifiInfo(lockData: string ): TTWifiInfoModel { return new TTWifiInfoModel("", 0); }
  configIp(ipSetting: TTIpSetting , lockData: string ): void { }
  configCameraLockWifi(wifiName: string , wifiPassword: string , lockData: string ): CameraLockWifiResult { return new CameraLockWifiResult("", ""); }
  setSoundVolume(type: TTSoundVolumeType , lockData: string ): void { }
  getSoundVolume(lockData: string ): TTSoundVolumeType { return TTSoundVolumeType.OFF; }
  setSensitivity(value: TTSensitivityValue , lockData: string ): void { }
  setRemoteKeyValidDate(remoteKeyMac: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): void { }
  addRemoteKey(remoteKeyMac: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): void { }
  deleteRemoteKey(remoteKeyMac: string , lockData: string ): void { }
  clearRemoteKey(lockData: string ): void { }
  getRemoteAccessoryElectricQuantity(accessory: number , mac: string , lockData: string ): AccessoryElectricQuantityResult { return new AccessoryElectricQuantityResult(0, 0); }
  addDoorSensor(doorSensorMac: string , lockData: string ): void { }
  deleteDoorSensor(lockData: string ): void { }
  setDoorSensorAlertTime(alertTime: number , lockData: string ): void { }
  setLockEnterUpgradeMode(lockData: string ): void { }
}

export class TtlockStubTTGatewayHostApi extends TTGatewayHostApi {
  setEventGatewayMac(mac: string ): void { }
  stopScan(): void { }
  startScan(): number { return 0; }
  getNearbyWifi(): number { return 0; }
  connect(mac: string ): TTGatewayConnectStatus { return TTGatewayConnectStatus.TIMEOUT; }
  disconnect(mac: string ): void { }
  init(params: TTGatewayInitParams ): Map<string, Object> { return new Map<string, Object>(); }
  configIp(mac: string , ipSetting: TTIpSetting ): void { }
  configApn(mac: string , apn: string ): void { }
  getNetworkMac(): string { return ""; }
  enterUpgradeMode(mac: string ): void { }
}

export class TtlockStubTTAccessoryHostApi extends TTAccessoryHostApi {
  startScanRemoteKey(): number { return 0; }
  stopScanRemoteKey(): void { }
  initRemoteKey(mac: string , lockData: string ): TTLockSystemModel { return new TTLockSystemModel(); }
  startScanRemoteKeypad(): number { return 0; }
  stopScanRemoteKeypad(): void { }
  initRemoteKeypad(mac: string , lockMac: string ): RemoteKeypadInitResult { return new RemoteKeypadInitResult(0, ""); }
  initMultifunctionalKeypad(mac: string , lockData: string ): MultifunctionalKeypadInitResult { return new MultifunctionalKeypadInitResult(0, "", 0, 0); }
  getStoredLocks(mac: string ): Array<string> { return []; }
  deleteStoredLock(mac: string , slotNumber: number ): void { }
  addKeypadFingerprint(mac: string , cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): number { return 0; }
  addKeypadCard(cycleList: Array<TTCycleModel> , startDate: number , endDate: number , lockData: string ): number { return 0; }
  startScanDoorSensor(): number { return 0; }
  stopScanDoorSensor(): void { }
  initDoorSensor(mac: string , lockData: string ): TTLockSystemModel { return new TTLockSystemModel(); }
  standaloneDoorSensorStartScan(): number { return 0; }
  standaloneDoorSensorStopScan(): void { }
  standaloneDoorSensorInit(mac: string , info: Map<string, Object> ): TTStandaloneDoorSensorInfo { return new TTStandaloneDoorSensorInfo(); }
  standaloneDoorSensorReadFeatureValue(mac: string ): string { return ""; }
  standaloneDoorSensorIsSupportFunction(featureValue: string , function: number ): boolean { return false; }
  waterMeterConfigServer(url: string , clientId: string , accessToken: string ): void { }
  waterMeterStartScan(): number { return 0; }
  waterMeterStopScan(): void { }
  waterMeterConnect(mac: string ): void { }
  waterMeterDisconnect(mac: string ): void { }
  waterMeterInit(params: Map<string, Object> ): TTWaterMeterInitResult { return new TTWaterMeterInitResult("", undefined); }
  waterMeterDelete(waterMeterId: string ): void { }
  waterMeterSetPowerOnOff(waterMeterId: string , isOn: boolean ): void { }
  waterMeterSetRemainderM3(waterMeterId: string , remainderM3: number ): void { }
  waterMeterClearRemainderM3(waterMeterId: string ): void { }
  waterMeterReadData(waterMeterId: string ): Map<string, Object> { return new Map<string, Object>(); }
  waterMeterSetPayMode(waterMeterId: string , payMode: number ): void { }
  waterMeterCharge(waterMeterId: string , amount: number ): void { }
  waterMeterSetTotalUsage(waterMeterId: string , totalM3: number ): void { }
  waterMeterGetFeatureValue(waterMeterId: string ): string { return ""; }
  waterMeterGetDeviceInfo(waterMeterId: string ): Map<string, Object> { return new Map<string, Object>(); }
  waterMeterIsSupportFunction(featureValue: string , function: number ): boolean { return false; }
  waterMeterConfigApn(apn: string ): void { }
  waterMeterConfigMeterServer(ip: string , port: string ): void { }
  waterMeterReset(waterMeterId: string ): void { }
  electricMeterConfigServer(url: string , clientId: string , accessToken: string ): void { }
  electricMeterStartScan(): number { return 0; }
  electricMeterStopScan(): void { }
  electricMeterConnect(mac: string ): void { }
  electricMeterDisconnect(mac: string ): void { }
  electricMeterInit(params: Map<string, Object> ): TTElectricMeterInitResult { return new TTElectricMeterInitResult("", undefined); }
  electricMeterDelete(electricMeterId: string ): void { }
  electricMeterSetPowerOnOff(electricMeterId: string , isOn: boolean ): void { }
  electricMeterSetRemainderKwh(electricMeterId: string , remainderKwh: number ): void { }
  electricMeterClearRemainderKwh(electricMeterId: string ): void { }
  electricMeterReadData(electricMeterId: string ): Map<string, Object> { return new Map<string, Object>(); }
  electricMeterSetPayMode(electricMeterId: string , payMode: number ): void { }
  electricMeterCharge(electricMeterId: string , amount: number ): void { }
  electricMeterSetMaxPower(electricMeterId: string , maxPower: number ): void { }
  electricMeterGetFeatureValue(electricMeterId: string ): string { return ""; }
  electricMeterIsSupportFunction(featureValue: string , function: number ): boolean { return false; }
}
