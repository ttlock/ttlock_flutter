/// Unified command constants for all device types.
class TTCommands {
  TTCommands._();

  // --- Lock: Scan & Bluetooth ---
  static const startScanLock = 'startScanLock';
  static const stopScanLock = 'stopScanLock';
  static const getBluetoothState = 'getBluetoothState';

  // --- Lock: Init & Reset ---
  static const initLock = 'initLock';
  static const resetLock = 'resetLock';
  static const resetEkey = 'resetEkey';
  static const resetLockByCode = 'resetLockByCode';
  static const verifyLock = 'verifyLock';

  // --- Lock: Control ---
  static const controlLock = 'controlLock';
  static const getLockSwitchState = 'getLockSwitchState';
  static const functionSupport = 'functionSupport';

  // --- Lock: Passcode ---
  static const createCustomPasscode = 'createCustomPasscode';
  static const modifyPasscode = 'modifyPasscode';
  static const deletePasscode = 'deletePasscode';
  static const resetPasscodes = 'resetPasscodes';
  static const getAllValidPasscode = 'getAllValidPasscode';
  static const modifyAdminPasscode = 'modifyAdminPasscode';
  static const getAdminPasscode = 'getAdminPasscodeWithLockData';
  static const setAdminErasePasscode = 'setAdminErasePasscode';
  static const recoverPasscode = 'recoverPasscodeWithPasswordType';

  // --- Lock: Card ---
  static const addCard = 'addCard';
  static const modifyCard = 'modifyIcCard';
  static const deleteCard = 'deleteIcCard';
  static const clearAllCards = 'clearAllIcCard';
  static const getAllValidCards = 'getAllValidIcCard';
  static const recoverCard = 'recoverCardWithCardType';

  // --- Lock: Fingerprint ---
  static const addFingerprint = 'addFingerprint';
  static const modifyFingerprint = 'modifyFingerprint';
  static const deleteFingerprint = 'deleteFingerprint';
  static const clearAllFingerprints = 'clearAllFingerprint';
  static const getAllValidFingerprints = 'getAllValidFingerprint';

  // --- Lock: Face ---
  static const addFace = 'faceAdd';
  static const addFaceData = 'faceDataAdd';
  static const modifyFace = 'faceModify';
  static const deleteFace = 'faceDelete';
  static const clearFace = 'faceClear';

  // --- Lock: Time ---
  static const setLockTime = 'setLockTime';
  static const getLockTime = 'getLockTime';

  // --- Lock: Records / Power / System ---
  static const getLockOperateRecord = 'getLockOperateRecord';
  static const getLockPower = 'getLockPower';
  static const getLockSystemInfo = 'getLockSystemInfoWithLockData';
  static const getLockFeatureValue = 'getLockFreatureValue';

  // --- Lock: Auto Lock ---
  static const getAutoLockTime = 'getLockAutomaticLockingPeriodicTime';
  static const setAutoLockTime = 'setLockAutomaticLockingPeriodicTime';

  // --- Lock: Remote Unlock ---
  static const getRemoteUnlockSwitch = 'getLockRemoteUnlockSwitchState';
  static const setRemoteUnlockSwitch = 'setLockRemoteUnlockSwitchState';

  // --- Lock: Config ---
  static const getLockConfig = 'getLockConfig';
  static const setLockConfig = 'setLockConfig';

  // --- Lock: Direction ---
  static const getLockDirection = 'getLockDirection';
  static const setLockDirection = 'setLockDirection';

  // --- Lock: Passage Mode ---
  static const addPassageMode = 'addPassageMode';
  static const clearAllPassageModes = 'clearAllPassageModes';

  // --- Lock: Lift ---
  static const activateLift = 'activateLiftFloors';
  static const setLiftControlable = 'setLiftControlableFloors';
  static const setLiftWorkMode = 'setLiftWorkMode';

  // --- Lock: Power Saver ---
  static const setPowerSaverWorkMode = 'setPowerSaverWorkMode';
  static const setPowerSaverControlable = 'setPowerSaverControlable';

  // --- Lock: Hotel ---
  static const setHotelInfo = 'setHotelInfo';
  static const setHotelCardSector = 'setHotelCardSector';

  // --- Lock: Version ---
  static const getLockVersion = 'getLockVersion';

  // --- Lock: WiFi ---
  static const scanWifi = 'scanWifi';
  static const configWifi = 'configWifi';
  static const configServer = 'configServer';
  static const getWifiInfo = 'getWifiInfo';
  static const configIp = 'configIp';
  static const configCameraLockWifi = 'configCameraLockWifi';

  // --- Lock: Sound & Sensitivity ---
  static const setSoundVolume = 'setLockSoundWithSoundVolume';
  static const getSoundVolume = 'getLockSoundWithSoundVolume';
  static const setSensitivity = 'setSensitivity';

  // --- Lock: Remote Accessory (on lock) ---
  static const addRemoteKey = 'lockAddRemoteKey';
  static const deleteRemoteKey = 'lockDeleteRemoteKey';
  static const setRemoteKeyValidDate = 'lockModifyRemoteKeyValidDate';
  static const clearRemoteKey = 'clearRemoteKey';
  static const getAccessoryElectricQuantity = 'lockGetRemoteAccessoryElectricQuantity';
  static const addDoorSensor = 'lockAddDoorSensor';
  static const deleteDoorSensor = 'lockDeleteDoorSensor';
  static const setDoorSensorAlertTime = 'lockSetDoorSensorAlertTime';

  // --- Lock: Upgrade ---
  static const setLockEnterUpgradeMode = 'setLockEnterUpgradeMode';

  // --- Gateway ---
  static const startScanGateway = 'startScanGateway';
  static const stopScanGateway = 'stopScanGateway';
  static const connectGateway = 'connectGateway';
  static const disconnectGateway = 'disconnectGateway';
  static const getSurroundWifi = 'getSurroundWifi';
  static const initGateway = 'initGateway';
  static const upgradeGateway = 'upgradeGateway';
  static const gatewayConfigIp = 'gatewayConfigIp';
  static const gatewayConfigApn = 'gatewayConfigApn';

  // --- Remote Key ---
  static const startScanRemoteKey = 'startScanRemoteKey';
  static const stopScanRemoteKey = 'stopScanRemoteKey';
  static const initRemoteKey = 'initRemoteKey';

  // --- Remote Keypad ---
  static const startScanRemoteKeypad = 'remoteKeypadStartScan';
  static const stopScanRemoteKeypad = 'remoteKeypadStopScan';
  static const initRemoteKeypad = 'remoteKeypadInit';
  static const initMultifunctionalKeypad = 'multifunctionalRemoteKeypadInit';
  static const multifunctionalKeypadDeleteLock = 'multifunctionalRemoteKeypadDeleteLock';
  static const multifunctionalKeypadGetLocks = 'multifunctionalRemoteKeypadGetLocks';
  static const multifunctionalKeypadAddFingerprint = 'multifunctionalRemoteKeypadAddFingerprint';
  static const multifunctionalKeypadAddCard = 'multifunctionalRemoteKeypadAddCard';

  // --- Door Sensor ---
  static const startScanDoorSensor = 'doorSensorStartScan';
  static const stopScanDoorSensor = 'doorSensorStopScan';
  static const initDoorSensor = 'doorSensorInit';

  // --- Command sets ---
  static const scanStartCommands = {
    startScanLock,
    startScanGateway,
    startScanRemoteKey,
    startScanRemoteKeypad,
    startScanDoorSensor,
  };

  static const scanStopToStartMap = {
    stopScanLock: startScanLock,
    stopScanGateway: startScanGateway,
    stopScanRemoteKey: startScanRemoteKey,
    stopScanRemoteKeypad: startScanRemoteKeypad,
    stopScanDoorSensor: startScanDoorSensor,
  };

  static const streamCommands = {
    startScanLock,
    startScanGateway,
    startScanRemoteKey,
    startScanRemoteKeypad,
    startScanDoorSensor,
    scanWifi,
    getSurroundWifi,
  };

  static const progressCommands = {
    addCard,
    addFingerprint,
    addFace,
    multifunctionalKeypadAddFingerprint,
    multifunctionalKeypadAddCard,
  };

  static const gatewayErrorCommands = {
    getSurroundWifi,
    initGateway,
    gatewayConfigIp,
    upgradeGateway,
    gatewayConfigApn,
  };

  static const remoteErrorCommands = {
    initRemoteKey,
    initDoorSensor,
    initRemoteKeypad,
  };

  static const multifunctionalKeypadErrorCommands = {
    initMultifunctionalKeypad,
    multifunctionalKeypadDeleteLock,
    multifunctionalKeypadGetLocks,
    multifunctionalKeypadAddFingerprint,
    multifunctionalKeypadAddCard,
  };
}
