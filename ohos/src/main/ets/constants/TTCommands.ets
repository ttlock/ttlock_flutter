/**
 * 与 Flutter lib/src/constants/commands.dart 保持一致的命令常量，避免直接使用字符串。
 */
export class TTCommands {
  private constructor() {
  }

  // --- Lock: Scan & Bluetooth ---
  static readonly startScanLock: string = 'startScanLock';
  static readonly stopScanLock: string = 'stopScanLock';
  static readonly getBluetoothState: string = 'getBluetoothState';

  // --- Lock: Init & Reset ---
  static readonly initLock: string = 'initLock';
  static readonly resetLock: string = 'resetLock';
  static readonly resetEkey: string = 'resetEkey';
  static readonly resetLockByCode: string = 'resetLockByCode';
  static readonly verifyLock: string = 'verifyLock';

  // --- Lock: Control ---
  static readonly controlLock: string = 'controlLock';
  static readonly getLockSwitchState: string = 'getLockSwitchState';
  static readonly functionSupport: string = 'functionSupport';

  // --- Lock: Passcode ---
  static readonly createCustomPasscode: string = 'createCustomPasscode';
  static readonly modifyPasscode: string = 'modifyPasscode';
  static readonly deletePasscode: string = 'deletePasscode';
  static readonly resetPasscodes: string = 'resetPasscodes';
  static readonly getAllValidPasscode: string = 'getAllValidPasscode';
  static readonly modifyAdminPasscode: string = 'modifyAdminPasscode';
  static readonly getAdminPasscodeWithLockData: string = 'getAdminPasscodeWithLockData';
  static readonly setAdminErasePasscode: string = 'setAdminErasePasscode';
  static readonly recoverPasscodeWithPasswordType: string = 'recoverPasscodeWithPasswordType';

  // --- Lock: Card ---
  static readonly addCard: string = 'addCard';
  static readonly modifyIcCard: string = 'modifyIcCard';
  static readonly deleteIcCard: string = 'deleteIcCard';
  static readonly clearAllIcCard: string = 'clearAllIcCard';
  static readonly getAllValidIcCard: string = 'getAllValidIcCard';
  static readonly recoverCardWithCardType: string = 'recoverCardWithCardType';

  // --- Lock: Fingerprint ---
  static readonly addFingerprint: string = 'addFingerprint';
  static readonly modifyFingerprint: string = 'modifyFingerprint';
  static readonly deleteFingerprint: string = 'deleteFingerprint';
  static readonly clearAllFingerprint: string = 'clearAllFingerprint';
  static readonly getAllValidFingerprint: string = 'getAllValidFingerprint';

  // --- Lock: Face ---
  static readonly faceAdd: string = 'faceAdd';
  static readonly faceDataAdd: string = 'faceDataAdd';
  static readonly faceModify: string = 'faceModify';
  static readonly faceDelete: string = 'faceDelete';
  static readonly faceClear: string = 'faceClear';

  // --- Lock: Time ---
  static readonly setLockTime: string = 'setLockTime';
  static readonly getLockTime: string = 'getLockTime';

  // --- Lock: Records / Power / System ---
  static readonly getLockOperateRecord: string = 'getLockOperateRecord';
  static readonly getLockPower: string = 'getLockPower';
  static readonly getLockSystemInfoWithLockData: string = 'getLockSystemInfoWithLockData';
  static readonly getLockFreatureValue: string = 'getLockFreatureValue';

  // --- Lock: Auto Lock ---
  static readonly getLockAutomaticLockingPeriodicTime: string = 'getLockAutomaticLockingPeriodicTime';
  static readonly setLockAutomaticLockingPeriodicTime: string = 'setLockAutomaticLockingPeriodicTime';

  // --- Lock: Remote Unlock ---
  static readonly getLockRemoteUnlockSwitchState: string = 'getLockRemoteUnlockSwitchState';
  static readonly setLockRemoteUnlockSwitchState: string = 'setLockRemoteUnlockSwitchState';

  // --- Lock: Config ---
  static readonly getLockConfig: string = 'getLockConfig';
  static readonly setLockConfig: string = 'setLockConfig';

  // --- Lock: Direction ---
  static readonly getLockDirection: string = 'getLockDirection';
  static readonly setLockDirection: string = 'setLockDirection';

  // --- Lock: Passage Mode ---
  static readonly addPassageMode: string = 'addPassageMode';
  static readonly clearAllPassageModes: string = 'clearAllPassageModes';

  // --- Lock: Lift ---
  static readonly activateLiftFloors: string = 'activateLiftFloors';
  static readonly setLiftControlableFloors: string = 'setLiftControlableFloors';
  static readonly setLiftWorkMode: string = 'setLiftWorkMode';

  // --- Lock: Power Saver ---
  static readonly setPowerSaverWorkMode: string = 'setPowerSaverWorkMode';
  static readonly setPowerSaverControlable: string = 'setPowerSaverControlable';

  // --- Lock: Hotel ---
  static readonly setHotelInfo: string = 'setHotelInfo';
  static readonly setHotelCardSector: string = 'setHotelCardSector';

  // --- Lock: Version ---
  static readonly getLockVersion: string = 'getLockVersion';

  // --- Lock: WiFi ---
  static readonly scanWifi: string = 'scanWifi';
  static readonly configWifi: string = 'configWifi';
  static readonly configServer: string = 'configServer';
  static readonly getWifiInfo: string = 'getWifiInfo';
  static readonly configIp: string = 'configIp';
  static readonly configCameraLockWifi: string = 'configCameraLockWifi';

  // --- Lock: Sound & Sensitivity ---
  static readonly setLockSoundWithSoundVolume: string = 'setLockSoundWithSoundVolume';
  static readonly getLockSoundWithSoundVolume: string = 'getLockSoundWithSoundVolume';
  static readonly setSensitivity: string = 'setSensitivity';
  static readonly getSensitivity: string = 'getSensitivity';

  // --- Lock: Remote Accessory (on lock) ---
  static readonly lockAddRemoteKey: string = 'lockAddRemoteKey';
  static readonly lockDeleteRemoteKey: string = 'lockDeleteRemoteKey';
  static readonly lockModifyRemoteKeyValidDate: string = 'lockModifyRemoteKeyValidDate';
  static readonly clearRemoteKey: string = 'clearRemoteKey';
  static readonly lockGetRemoteAccessoryElectricQuantity: string = 'lockGetRemoteAccessoryElectricQuantity';
  static readonly lockAddDoorSensor: string = 'lockAddDoorSensor';
  static readonly lockDeleteDoorSensor: string = 'lockDeleteDoorSensor';
  static readonly lockSetDoorSensorAlertTime: string = 'lockSetDoorSensorAlertTime';

  // --- Lock: Upgrade ---
  static readonly setLockEnterUpgradeMode: string = 'setLockEnterUpgradeMode';

  // --- Gateway ---
  static readonly startScanGateway: string = 'startScanGateway';
  static readonly stopScanGateway: string = 'stopScanGateway';
  static readonly connectGateway: string = 'connectGateway';
  static readonly disconnectGateway: string = 'disconnectGateway';
  static readonly getSurroundWifi: string = 'getSurroundWifi';
  static readonly initGateway: string = 'initGateway';
  static readonly upgradeGateway: string = 'upgradeGateway';
  static readonly gatewayConfigIp: string = 'gatewayConfigIp';
  static readonly gatewayConfigApn: string = 'gatewayConfigApn';

  // --- Remote Key ---
  static readonly startScanRemoteKey: string = 'startScanRemoteKey';
  static readonly stopScanRemoteKey: string = 'stopScanRemoteKey';
  static readonly initRemoteKey: string = 'initRemoteKey';

  // --- Remote Keypad ---
  static readonly remoteKeypadStartScan: string = 'remoteKeypadStartScan';
  static readonly remoteKeypadStopScan: string = 'remoteKeypadStopScan';
  static readonly remoteKeypadInit: string = 'remoteKeypadInit';
  static readonly multifunctionalRemoteKeypadInit: string = 'multifunctionalRemoteKeypadInit';
  static readonly multifunctionalRemoteKeypadDeleteLock: string = 'multifunctionalRemoteKeypadDeleteLock';
  static readonly multifunctionalRemoteKeypadGetLocks: string = 'multifunctionalRemoteKeypadGetLocks';
  static readonly multifunctionalRemoteKeypadAddFingerprint: string = 'multifunctionalRemoteKeypadAddFingerprint';
  static readonly multifunctionalRemoteKeypadAddCard: string = 'multifunctionalRemoteKeypadAddCard';
  static readonly multifunctionalKeyPadDeleteLockAtSpecifiedSlot: string = 'multifunctionalKeyPadDeleteLockAtSpecifiedSlot';
  static readonly multifunctionalKeyPadGetAllStoredLocks: string = 'multifunctionalKeyPadGetAllStoredLocks';
  static readonly multifunctionalKeyPadAddFingerprint: string = 'multifunctionalKeyPadAddFingerprint';
  static readonly multifunctionalKeyPadAddCard: string = 'multifunctionalKeyPadAddCard';

  // --- Door Sensor ---
  static readonly doorSensorStartScan: string = 'doorSensorStartScan';
  static readonly doorSensorStopScan: string = 'doorSensorStopScan';
  static readonly doorSensorInit: string = 'doorSensorInit';

  /** 仅发送、不等待结果的停止/断开类命令（执行后直接 result.success(null)） */
  static getSendOnlyCommands(): string[] {
    return [
      TTCommands.stopScanLock,
      TTCommands.stopScanGateway,
      TTCommands.stopScanRemoteKey,
      TTCommands.remoteKeypadStopScan,
      TTCommands.doorSensorStopScan,
      TTCommands.disconnectGateway,
    ];
  }
}
