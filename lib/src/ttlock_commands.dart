/// Lock command and callback key constants for platform channel.
class TTLockCommands {
  TTLockCommands._();

  static const String CALLBACK_SUCCESS = "callback_success";
  static const String CALLBACK_PROGRESS = "callback_progress";
  static const String CALLBACK_FAIL = "callback_fail";
  static const String CALLBACK_OTHER_FAIL = "callback_other_fail";

  static const String COMMAND_START_SCAN_LOCK = "startScanLock";
  static const String COMMAND_STOP_SCAN_LOCK = "stopScanLock";
  static const String COMMAND_GET_BLUETOOTH_STATE = "getBluetoothState";
  static const String COMMAND_INIT_LOCK = "initLock";
  static const String COMMAND_RESET_LOCK = "resetLock";

  static const String COMMAND_CONTROL_LOCK = "controlLock";
  static const String COMMAND_RESET_EKEY = "resetEkey";
  static const String COMMAND_CREATE_CUSTOM_PASSCODE = "createCustomPasscode";
  static const String COMMAND_MODIFY_PASSCODE = "modifyPasscode";
  static const String COMMAND_DELETE_PASSCODE = "deletePasscode";
  static const String COMMAND_RESET_PASSCODE = "resetPasscodes";
  static const String COMMAND_GET_ALL_VALID_PASSCODE = "getAllValidPasscode";
  static const String COMMAND_MODIFY_ADMIN_PASSCODE = "modifyAdminPasscode";
  static const String COMMAND_GET_ADMIN_PASSCODE =
      "getAdminPasscodeWithLockData";
  static const String COMMAND_SET_ADMIN_ERASE_PASSCODE =
      "setAdminErasePasscode";

  static const String COMMAND_GET_PASSCODE_VERIFICATION_PARAMS =
      "getPasscodeVerificationParamsWithLockData";
  static const String COMMAND_RECOVER_PASSCODE =
      "recoverPasscodeWithPasswordType";

  static const String COMMAND_ADD_CARD = "addCard";
  static const String COMMAND_MODIFY_CARD = "modifyIcCard";
  static const String COMMAND_DELETE_CARD = "deleteIcCard";
  static const String COMMAND_CLEAR_ALL_CARD = "clearAllIcCard";
  static const String COMMAND_GET_ALL_VALID_CARD = "getAllValidIcCard";
  static const String COMMAND_RECOVER_CARD = "recoverCardWithCardType";
  static const String COMMAND_REPORT_LOSS_CARD = "reportLossCard";

  static const String COMMAND_ADD_FINGERPRINT = "addFingerprint";
  static const String COMMAND_MODIFY_FINGERPRINT = "modifyFingerprint";
  static const String COMMAND_DELETE_FINGERPRINT = "deleteFingerprint";
  static const String COMMAND_CLEAR_ALL_FINGERPRINT = "clearAllFingerprint";
  static const String COMMAND_GET_ALL_VALID_FINGERPRINT =
      "getAllValidFingerprint";

  static const String COMMAND_SET_LOCK_TIME = "setLockTime";
  static const String COMMAND_GET_LOCK_TIME = "getLockTime";
  static const String COMMAND_GET_LOCK_OPERATE_RECORD = "getLockOperateRecord";
  static const String COMMAND_GET_LOCK_POWER = "getLockPower";
  static const String COMMAND_GET_LOCK_SWITCH_STATE = "getLockSwitchState";
  static const String COMMAND_GET_LOCK_SYSTEM_INFO =
      "getLockSystemInfoWithLockData";
  static const String COMMAND_GET_LOCK_FRETURE_VALUE = "getLockFreatureValue";

  static const String COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME =
      "getLockAutomaticLockingPeriodicTime";
  static const String COMMAND_SET_AUTOMATIC_LOCK_PERIODIC_TIME =
      "setLockAutomaticLockingPeriodicTime";

  static const String COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE =
      "getLockRemoteUnlockSwitchState";
  static const String COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE =
      "setLockRemoteUnlockSwitchState";

  static const String COMMAND_GET_LOCK_CONFIG = "getLockConfig";
  static const String COMMAND_SET_LOCK_CONFIG = "setLockConfig";

  static const String COMMAND_ADD_PASSAGE_MODE = "addPassageMode";
  static const String COMMAND_CLEAR_ALL_PASSAGE_MODE = "clearAllPassageModes";
  static const String COMMAND_FUNCTION_SUPPORT = "functionSupport";

  static const String COMMAND_ACTIVE_LIFT_FLOORS = "activateLiftFloors";

  static const String COMMAND_SET_LIFT_CONTROLABLE_FLOORS =
      "setLiftControlableFloors";
  static const String COMMAND_SET_LIFT_WORK_MODE = "setLiftWorkMode";

  static const String COMMAND_SET_POWSER_SAVER_WORK_MODE =
      "setPowerSaverWorkMode";
  static const String COMMAND_SET_POWSER_SAVER_CONTROLABLE =
      "setPowerSaverControlable";

  static const String COMMAND_SET_NB_ADDRESS = "setNBServerAddress";
  static const String COMMAND_SET_NB_AWAKE_MODES = "setNBAwakeModes";
  static const String COMMAND_GET_NB_AWAKE_MODES = "getNBAwakeModes";
  static const String COMMAND_SET_NB_AWAKE_TIMES = "setNBAwakeTimes";
  static const String COMMAND_GET_NB_AWAKE_TIMES = "getNBAwakeTimes";

  static const String COMMAND_SET_DOOR_SENSOR_SWITCH = "setDoorSensorSwitch";
  static const String COMMAND_GET_DOOR_SENSOR_SWITCH = "getDoorSensorSwitch";
  static const String COMMAND_GET_DOOR_SENSOR_STATE = "getDoorSensorState";

  static const String COMMAND_SET_HOTEL_CARD_SECTOR = "setHotelCardSector";
  static const String COMMAND_SET_HOTEL_INFO = "setHotelInfo";

  static const String COMMAND_GET_LOCK_VERSION = "getLockVersion";

  static const String COMMAND_SCAN_WIFI = "scanWifi";
  static const String COMMAND_CONFIG_WIFI = "configWifi";
  static const String COMMAND_CONFIG_SERVER = "configServer";
  static const String COMMAND_GET_WIFI_INFO = "getWifiInfo";
  static const String COMMAND_CONFIG_IP = "configIp";
  static const String COMMAND_CONFIG_CAMERA_LOCK_WIFI = "configCameraLockWifi";

  static const String COMMAND_SET_LOCK_SOUND_WITH_SOUND_VOLUME =
      "setLockSoundWithSoundVolume";
  static const String COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME =
      "getLockSoundWithSoundVolume";

  static const String COMMAND_SET_LOCK_ENTER_UPGRADE_MODE =
      "setLockEnterUpgradeMode";

  static const String COMMAND_ADD_LOCK_REMOTE_KEY = "lockAddRemoteKey";
  static const String COMMAND_DELETE_LOCK_REMOTE_KEY = "lockDeleteRemoteKey";
  static const String COMMAND_SET_LOCK_REMOTE_KEY_VALID_DATE =
      "lockModifyRemoteKeyValidDate";
  static const String COMMAND_CLEAR_REMOTE_KEY = "clearRemoteKey";
  static const String COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY =
      "lockGetRemoteAccessoryElectricQuantity";

  static const String COMMAND_ADD_LOCK_DOOR_SENSORY = "lockAddDoorSensor";
  static const String COMMAND_DELETE_LOCK_DOOR_SENSORY = "lockDeleteDoorSensor";
  static const String COMMAND_SET_LOCK_DOOR_SENSORY_ALERT_TIME =
      "lockSetDoorSensorAlertTime";

  static const String COMMAND_GET_LOCK_DIRECTION = "getLockDirection";
  static const String COMMAND_SET_LOCK_DIRECTION = "setLockDirection";
  static const String COMMAND_RESET_LOCK_BY_CODE = "resetLockByCode";

  static const String COMMAND_VERIFY_LOCK = "verifyLock";

  static const String COMMAND_ADD_FACE = "faceAdd";
  static const String COMMAND_ADD_FACE_DATA = "faceDataAdd";
  static const String COMMAND_MODIFY_FACE = "faceModify";
  static const String COMMAND_DELETE_FACE = "faceDelete";
  static const String COMMAND_CLEAR_FACE = "faceClear";

  static const String COMMAND_SET_SENSITIVITY = "setSensitivity";
}
