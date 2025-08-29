package com.ttlock.ttlock_flutter.constant;

/**
 * Created by TTLock on 2020/8/21.
 */
public class TTLockCommand {
    public static final String METHOD_CHANNEL_NAME = "com.ttlock/command/ttlock";
    public static final String EVENT_CHANNEL_NAME = "com.ttlock/listen/ttlock";


    public static final String COMMAND_SETUP_PUGIN = "setupPlugin";
    public static final String COMMAND_START_SCAN_LOCK = "startScanLock";
    public static final String COMMAND_STOP_SCAN_LOCK = "stopScanLock";
    public static final String COMMAND_GET_BLUETOOTH_STATE = "getBluetoothState";
    public static final String COMMAND_GET_BLUETOOTH_SCAN_STATE =
            "getBluetoothScanState";
    public static final String COMMAND_INIT_LOCK = "initLock";
    public static final String COMMAND_RESET_LOCK = "resetLock";

    public static final String COMMAND_CONTROL_LOCK = "controlLock";
    public static final String COMMAND_RESET_EKEY = "resetEkey";
    public static final String COMMAND_CREATE_CUSTOM_PASSCODE = "createCustomPasscode";
    public static final String COMMAND_MODIFY_PASSCODE = "modifyPasscode";
    public static final String COMMAND_DELETE_PASSCODE = "deletePasscode";
    public static final String COMMAND_RESET_PASSCODE = "resetPasscodes";

    public static final String COMMAND_ADD_CARD = "addCard";
    public static final String COMMAND_MODIFY_CARD = "modifyIcCard";
    public static final String COMMAND_DELETE_CARD = "deleteIcCard";
    public static final String COMMAND_CLEAR_ALL_CARD = "clearAllIcCard";

    public static final String COMMAND_ADD_FINGERPRINT = "addFingerprint";
    public static final String COMMAND_MODIFY_FINGERPRINT = "modifyFingerprint";
    public static final String COMMAND_DELETE_FINGERPRINT = "deleteFingerprint";
    public static final String COMMAND_CLEAR_ALL_FINGERPRINT = "clearAllFingerprint";
    public static final String COMMAND_GET_ADMIN_PASSCODE = "getAdminPasscodeWithLockData";
    public static final String COMMAND_MODIFY_ADMIN_PASSCODE = "modifyAdminPasscode";
    public static final String COMMAND_SET_ADMIN_ERASE_PASSCODE =
            "setAdminErasePasscode";

    public static final String COMMAND_SET_LOCK_TIME = "setLockTime";
    public static final String COMMAND_GET_LOCK_TIME = "getLockTime";
    public static final String COMMAND_GET_LOCK_OPERATE_RECORD = "getLockOperateRecord";
    public static final String COMMAND_GET_LOCK_POWER = "getLockPower";
    public static final String COMMAND_GET_LOCK_SWITCH_STATE = "getLockSwitchState";

    public static final String COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME =
            "getLockAutomaticLockingPeriodicTime";
    public static final String COMMAND_SET_AUTOMATIC_LOCK_PERIODIC_TIME =
            "setLockAutomaticLockingPeriodicTime";

    public static final String COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE =
            "getLockRemoteUnlockSwitchState";
    public static final String COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE =
            "setLockRemoteUnlockSwitchState";

    public static final String COMMAND_GET_LOCK_AUDIO_SWITCH_STATE =
            "getLockAudioSwitchState";
    public static final String COMMAND_SET_LOCK_AUDIO_SWITCH_STATE =
            "setLockAudioSwitchState";

    public static final String COMMAND_ADD_PASSAGE_MODE = "addPassageMode";
    public static final String COMMAND_DELETE_PASSAGE_MODE = "deletePassageMode";
    public static final String COMMAND_CLEAR_ALL_PASSAGE_MODE = "clearAllPassageModes";

    public static final String COMMAND_SET_LOCK_CONFIG = "setLockConfig";
    public static final String COMMAND_GET_LOCK_CONFIG = "getLockConfig";

    public static final String COMMAND_SUPPORT_FEATURE = "functionSupport";

    public static final String COMMAND_ACTIVE_LIFT_FLOORS = "activateLiftFloors";

    public static final String COMMAND_SET_LIFT_CONTROLABLE_FLOORS =
            "setLiftControlableFloors";
    public static final String COMMAND_SET_LIFT_WORK_MODE = "setLiftWorkMode";

    public static final String COMMAND_SET_POWSER_SAVER_WORK_MODE =
            "setPowerSaverWorkMode";
    public static final String COMMAND_SET_POWSER_SAVER_CONTROLABLE =
            "setPowerSaverControlable";

    public static final String COMMAND_SET_NB_AWAKE_MODES = "setNBAwakeModes";
    public static final String COMMAND_GET_NB_AWAKE_MODES = "getNBAwakeModes";
    public static final String COMMAND_SET_NB_AWAKE_TIMES = "setNBAwakeTimes";
    public static final String COMMAND_GET_NB_AWAKE_TIMES = "getNBAwakeTimes";

    public static final String COMMAND_SET_DOOR_SENSOR_SWITCH = "setDoorSensorSwitch";
    public static final String COMMAND_GET_DOOR_SENSOR_SWITCH = "getDoorSensorSwitch";
    public static final String COMMAND_GET_DOOR_SENSOR_STATE = "getDoorSensorState";

    public static final String COMMAND_SET_HOTEL_CARD_SECTOR = "setHotelCardSector";
    public static final String COMMAND_SET_HOTEL_INFO = "setHotelInfo";

    public static final String COMMAND_GET_ALL_VALID_PASSCODE = "getAllValidPasscode";;
    public static final String COMMAND_GET_ALL_VALID_CARD = "getAllValidIcCard";
    public static final String COMMAND_GET_ALL_VALID_FINGERPRINT = "getAllValidFingerprint";

    public static final String COMMAND_SET_NB_SERVER_INFO = "setNBServerAddress";
    public static final String COMMAND_GET_LOCK_SYSTEM_INFO = "getLockSystemInfoWithLockData";
    public static final String COMMAND_GET_PASSCODE_VERIFICATION_PARAMS = "getPasscodeVerificationParamsWithLockData";

    public static final String COMMAND_REPORT_LOSS_CARD = "reportLossCard";

    public static final String COMMAND_RECOVER_PASSCODE = "recoverPasscodeWithPasswordType";

    public static final String COMMAND_RECOVER_CARD = "recoverCardWithCardType";

    public static final String COMMAND_GET_LOCK_VERSION = "getLockVersion";


    public static final String COMMAND_SCAN_WIFI = "scanWifi";
    public static final String COMMAND_CONFIG_WIFI = "configWifi";
    public static final String COMMAND_CONFIG_SERVER = "configServer";
    public static final String COMMAND_GET_WIFI_INFO = "getWifiInfo";
    public static final String COMMAND_CONFIG_IP = "configIp";

    public static final String COMMAND_SET_LOCK_SOUND_WITH_SOUND_VOLUME = "setLockSoundWithSoundVolume";
    public static final String COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME = "getLockSoundWithSoundVolume";

    public static final String COMMAND_ADD_LOCK_DOOR_SENSORY =
            "lockAddDoorSensor";
    public static final String COMMAND_DELETE_LOCK_DOOR_SENSORY =
            "lockDeleteDoorSensor";
    public static final String COMMAND_SET_LOCK_DOOR_SENSORY_ALERT_TIME =
            "lockSetDoorSensorAlertTime";

    public static final String COMMAND_ADD_LOCK_REMOTE_KEY = "lockAddRemoteKey";
    public static final String COMMAND_DELETE_LOCK_REMOTE_KEY = "lockDeleteRemoteKey";
    public static final String COMMAND_SET_LOCK_REMOTE_KEY_VALID_DATE =
            "lockModifyRemoteKeyValidDate";
    public static final String COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY =
            "lockGetRemoteAccessoryElectricQuantity";

    public static final String COMMAND_CLEAR_REMOTE_KEY = "clearRemoteKey";

    public static final String COMMAND_GET_LOCK_DIRECTION = "getLockDirection";
    public static final String COMMAND_SET_LOCK_DIRECTION = "setLockDirection";

    public static final String COMMAND_RESET_LOCK_BY_CODE = "resetLockByCode";

    public static final String COMMAND_VERIFY_LOCK = "verifyLock";

    public static final String COMMAND_ADD_FACE = "faceAdd";
    public static final String COMMAND_ADD_FACE_DATA = "faceDataAdd";
    public static final String COMMAND_DELETE_FACE = "faceDelete";
    public static final String COMMAND_MODIFY_FACE = "faceModify";
    public static final String COMMAND_CLEAR_FACE = "faceClear";

    public static final String COMMAND_SET_WORKING_TIME = "setLockWorkingTime";


}
