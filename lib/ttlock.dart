import 'package:flutter/services.dart';
import 'package:ttlock_flutter/ttdoorSensor.dart';
import 'package:ttlock_flutter/ttelectricMeter.dart';
import 'package:ttlock_flutter/ttremoteKey.dart';
import 'package:ttlock_flutter/ttremoteKeypad.dart';
import 'package:ttlock_flutter/ttwaterMeter.dart';
import 'dart:convert' as convert;
import 'ttgateway.dart';

class TTLock {
  static bool isOnPremise = false;

  static MethodChannel _commandChannel =
      MethodChannel("com.ttlock/command/ttlock");
  static EventChannel _listenChannel = EventChannel("com.ttlock/listen/ttlock");

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

  static const String COMMAND_SET_LIFT_CONTROL_ABLE_FLOORS =
      "setLiftControlableFloors";
  static const String COMMAND_SET_LIFT_WORK_MODE = "setLiftWorkMode";

  static const String COMMAND_SET_POWER_SAVER_WORK_MODE =
      "setPowerSaverWorkMode";
  static const String COMMAND_SET_POWER_SAVER_CONTROL_ABLE =
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
  static const String COMMAND_SET_WORKING_TIME = "setLockWorkingTime";

  // static const String COMMAND_GET_PASSCODE_VERIFICATION_PARAMS = "getPasscodeVerificationParams";

  static Map<String, List<Map>> _commandMap = Map();

  static bool printLog = false;

  // ignore: slash_for_doc_comments
/**
   * Scan the smart lock being broadcast
   */
  static void startScanLock(TTLockScanCallback scanCallback) {
    invoke(COMMAND_START_SCAN_LOCK, null, scanCallback);
  }

  // ignore: slash_for_doc_comments
/**
   * Stop scan the smart lock being broadcast
   */
  static void stopScanLock() {
    invoke(COMMAND_STOP_SCAN_LOCK, null, null);
  }

  // ignore: slash_for_doc_comments
/**
   * Current Phone/Pad Bluetooth state
   */
  static void getBluetoothState(TTBluetoothStateCallback stateCallback) {
    invoke(COMMAND_GET_BLUETOOTH_STATE, null, stateCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Initialize the lock
 * map {"lockMac": string, "lockVersion": string, "isInited": bool}
 */
  static void initLock(
      Map map, TTLockDataCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_INIT_LOCK, map, callback, fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Reset the lock
 */
  static void resetLock(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_LOCK, lockData, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Reset all eKeys
 */
  static void resetEkey(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_EKEY, lockData, callback,
        fail_callback: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Function support
 */
  static void supportFunction(TTLockFunction fuction, String lockData,
      TTFunctionSupportCallback callback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.supportFunction] = fuction.index;
    invoke(COMMAND_FUNCTION_SUPPORT, map, callback);
  }

// ignore: slash_for_doc_comments
/**
 * Lock or unlock the lock
 */
  static void controlLock(String lockData, TTControlAction controlAction,
      TTControlLockCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.controlAction] = controlAction.index;
    invoke(COMMAND_CONTROL_LOCK, map, callback, fail_callback: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
   * Create custom passcode
   * 
   * passcode The passcode is limited to 4 - 9 digits
   * startDate The time（millisecond） when it becomes valid
   * endDate The time（millisecond） when it is expired
   * lockData The lock data string used to operate lock
   * callback A callback invoked when passcode is created
   * failedCallback A callback invoked when the operation fails
   */
  static void createCustomPasscode(
      String passcode,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.passcode] = passcode;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_CREATE_CUSTOM_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Moddify passcode or passcode valid date
 * 
 * passcodeOrigin The passcode need to be modified
 * passcodeNew The new passcode is used to replace passcodeOrigin. If you just want to modify valid date, the passcodeNew should be null. The passcodeNew is limited to 4 - 9 digits
 * startDate The time（millisecond） when it becomes valid
 * endDate The time（millisecond） when it is expired
 */
  static void modifyPasscode(
      String passcodeOrigin,
      String? passcodeNew,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.passcodeOrigin] = passcodeOrigin;
    map[TTResponse.passcodeNew] = passcodeNew;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_MODIFY_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Delete passcode
 * 
 * passcode The passcode you want to delete it. 
 * lockData The lock data string used to operate lock
 */
  static void deletePasscode(String passcode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.passcode] = passcode;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_DELETE_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * All passcodes will be invalid except admin passcode
 */
  static void resetPasscode(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_PASSCODE, lockData, callback,
        fail_callback: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Get admin passcode from lock 
 * 
 * lockData The lock data string used to operate lock
 */
  static void getAdminPasscode(String lockData,
      TTGetAdminPasscodeCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_ADMIN_PASSCODE, lockData, callback,
        fail_callback: failedCallback);
  }

  static void setErasePasscode(String erasePasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.erasePasscode] = erasePasscode;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_ADMIN_ERASE_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

  static void getAllValidPasscode(String lockData,
      TTGetAllPasscodeCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_ALL_VALID_PASSCODE, lockData, callback,
        fail_callback: failedCallback);
  }

  static void recoverPasscode(
      String passcode,
      String passcodeNew,
      TTPasscodeType type,
      int startDate,
      int endDate,
      int cycleType,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.passcode] = passcode;
    map[TTResponse.passcodeNew] = passcodeNew;
    map[TTResponse.type] = type.index;
    map["cycleType"] = cycleType;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    invoke(COMMAND_RECOVER_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Get the lock switch state
 * 
 * lockData The lock data string used to operate lock
 */
  static void getLockSwitchState(String lockData,
      TTGetLockStatusCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_SWITCH_STATE, lockData, callback,
        fail_callback: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
   * Add a card
   * 
   * cycleList Optional. Used to set cyclic card. Usually set to null
   * startDate The time（millisecond） when it becomes valid
   * endDate The time（millisecond） when it is expired
   * lockData The lock data string used to operate lock
   */
  static void addCard(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddCardProgressCallback progressCallback,
      TTCardNumberCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    invoke(COMMAND_ADD_CARD, map, callback,
        progress_callback: progressCallback, fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Modify the card valid date
 * 
 * cardNumber The card number you want to modify
 * cycleList Optional. Used to set cyclic card. Usually set to null
 * startDate The time（millisecond） when it becomes valid
 * endDate The time（millisecond） when it is expired
 * lockData The lock data string used to operate lock
 */
  static void modifyCardValidityPeriod(
      String cardNumber,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.cardNumber] = cardNumber;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    invoke(COMMAND_MODIFY_CARD, map, callback, fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Delete the card
 * 
 * cardNumber The card number you want to delete
 * lockData The lock data string used to operate lock
 */
  static void deleteCard(String cardNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.cardNumber] = cardNumber;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_DELETE_CARD, map, callback, fail_callback: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Get all valid cards
 * 
 * lockData The lock data string used to operate lock
 */
  static void getAllValidCards(String lockData, TTGetAllCardsCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_ALL_VALID_CARD, lockData, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all cards
 * 
 * lockData The lock data string used to operate lock
 */
  static void clearAllCards(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_ALL_CARD, lockData, callback,
        fail_callback: failedCallback);
  }

  static void recoverCard(
      String cardNumber,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.cardNumber] = cardNumber;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    invoke(COMMAND_RECOVER_CARD, map, callback, fail_callback: failedCallback);
  }

  static void reportLossCard(String cardNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.cardNumber] = cardNumber;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_REPORT_LOSS_CARD, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
   * Add a fingerprint
   * 
   * cycleList Optional. Used to set cyclic fingerprint. Usually set to null
   * startDate The time（millisecond） when it becomes valid
   * endDate The time（millisecond） when it is expired
   * lockData The lock data string used to operate lock
   */
  static void addFingerprint(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddFingerprintProgressCallback progressCallback,
      TTAddFingerprintCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    invoke(COMMAND_ADD_FINGERPRINT, map, callback,
        progress_callback: progressCallback, fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Modify the fingerprint valid date
 * 
 * cardNumber The fingerprint number you want to modify
 * cycleList Optional. Used to set cyclic card. Usually set to null
 * startDate The time（millisecond） when it becomes valid
 * endDate The time（millisecond） when it is expired
 * lockData The lock data string used to operate lock
 */
  static void modifyFingerprintValidityPeriod(
      String fingerprintNumber,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.fingerprintNumber] = fingerprintNumber;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    invoke(COMMAND_MODIFY_FINGERPRINT, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Delete the fingerprint
 * 
 * cardNumber The fingerprint number you want to delete
 * lockData The lock data string used to operate lock
 */
  static void deleteFingerprint(String fingerprintNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.fingerprintNumber] = fingerprintNumber;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_DELETE_FINGERPRINT, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all fingerprints
 * 
 * lockData The lock data string used to operate lock
 */
  static void clearAllFingerprints(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_ALL_FINGERPRINT, lockData, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get all valid fingerprints
 * 
 * lockData The lock data string used to operate lock
 */
  static void getAllValidFingerprints(String lockData,
      TTGetAllFingerprintsCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_ALL_VALID_FINGERPRINT, lockData, callback,
        fail_callback: failedCallback);
  }

  static void getPasscodeVerificationParams(String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_PASSCODE_VERIFICATION_PARAMS, lockData, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Modify admin passcode
 * 
 * adminPasscode The new admin passcode is limited to 4 - 9 digits
 * lockData The lock data string used to operate lock
 */
  static void modifyAdminPasscode(String adminPasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.adminPasscode] = adminPasscode;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_MODIFY_ADMIN_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock time
 * 
 * timestamp A timestamp（millisecond）
 * lockData The lock data string used to operate lock
 */
  static void setLockTime(int timestamp, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.timestamp] = timestamp;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LOCK_TIME, map, callback, fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock time
 * 
 * lockData The lock data string used to operate lock
 */
  static void getLockTime(String lockData, TTGetLockTimeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_TIME, lockData, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock operate record
 * 
 * type 
 *      latest - Where the record was last read
 *      total - All of records in lock
 * lockData The lock data string used to operate lock
 */
  static void getLockOperateRecord(
      TTOperateRecordType type,
      String lockData,
      TTGetLockOperateRecordCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map["logType"] = type.index;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_GET_LOCK_OPERATE_RECORD, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock power
 * 
 * lockData The lock data string used to operate lock
 */
  static void getLockPower(
      String lockData,
      TTGetLockElectricQuantityCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_POWER, lockData, callback,
        fail_callback: failedCallback);
  }

  static void getLockSystemInfo(String lockData,
      TTGetLockSystemCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_SYSTEM_INFO, lockData, callback,
        fail_callback: failedCallback);
  }

  static void getLockFeatureValue(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_FRETURE_VALUE, lockData, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock automatic locking periodic time
 * 
 * lockData The lock data string used to operate lock
 */
  static void getLockAutomaticLockingPeriodicTime(
      String lockData,
      TTGetLockAutomaticLockingPeriodicTimeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME, lockData, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock automatic locking periodic time
 * 
 * time (sec)
 * lockData The lock data string used to operate lock
 */
  static void setLockAutomaticLockingPeriodicTime(int time, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.currentTime] = time;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_AUTOMATIC_LOCK_PERIODIC_TIME, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock remote unlock switch
 * 
 * lockData The lock data string used to operate lock
 */
  static void getLockRemoteUnlockSwitchState(String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE, lockData, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock remote unlock switch state
 * 
 * lockData The lock data string used to operate lock
 */
  static void setLockRemoteUnlockSwitchState(bool isOn, String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE, map, callback,
        fail_callback: failedCallback);
  }

  static void getLockConfig(TTLockConfig config, String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.index;
    invoke(COMMAND_GET_LOCK_CONFIG, map, callback,
        fail_callback: failedCallback);
  }

  static void setLockConfig(TTLockConfig config, bool isOn, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.index;
    invoke(COMMAND_SET_LOCK_CONFIG, map, callback,
        fail_callback: failedCallback);
  }

  static void setLockDirection(TTLockDirection direction, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.direction] = direction.index;
    invoke(COMMAND_SET_LOCK_DIRECTION, map, callback,
        fail_callback: failedCallback);
  }

  static void getLockDirection(String lockData,
      TTGetLockDirectionCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_DIRECTION, lockData, callback,
        fail_callback: failedCallback);
  }

  static void resetLockByCode(String lockMac, String resetCode,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.resetCode] = resetCode;
    invoke(COMMAND_RESET_LOCK_BY_CODE, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Config the lock passage mode. If config succeed,the lock will always be unlocked
 * 
 * type 
 * weekly Any number 1-7, 1 means Monday，2 means  Tuesday ,...,7 means Sunday, such as [1,3,6,7]. If type == TTPassageModeTypeMonthly, the weekly should be set null
 * monthly Any number from 1 to 31, such as @[@1,@13,@26,@31]. If type == TTPassageModeTypeWeekly, the monthly should be set null
 * startTime  The time when it becomes valid (minutes from 0 clock)
 * endTime The time when it is expired (minutes from 0 clock)
 * lockData The lock data string used to operate lock
 */
  static void addPassageMode(
      TTPassageModeType type,
      List<int>? weekly,
      List<int>? monthly,
      int startTime,
      int endTime,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.passageModeType] = type.index;
    map[TTResponse.startDate] = startTime;
    map[TTResponse.endDate] = endTime;
    map[TTResponse.lockData] = lockData;
    if (type == TTPassageModeType.weekly) {
      map[TTResponse.weekly] = weekly;
    } else {
      map[TTResponse.monthly] = monthly;
    }
    invoke(COMMAND_ADD_PASSAGE_MODE, map, callback,
        fail_callback: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all passage modes
 * 
 * lockData The lock data string used to operate lock
 */
  static void clearAllPassageModes(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_ALL_PASSAGE_MODE, lockData, callback,
        fail_callback: failedCallback);
  }

  static void activateLift(String floors, String lockData,
      TTLiftCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_ACTIVE_LIFT_FLOORS, map, callback,
        fail_callback: failedCallback);
  }

  static void setLiftControlAble(String floors, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LIFT_CONTROL_ABLE_FLOORS, map, callback,
        fail_callback: failedCallback);
  }

  static void setLiftWorkMode(TTLiftWorkActivateType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["liftWorkActiveType"] = type.index;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LIFT_WORK_MODE, map, callback,
        fail_callback: failedCallback);
  }

  static void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["powerSaverType"] = type.index;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_POWER_SAVER_WORK_MODE, map, callback,
        fail_callback: failedCallback);
  }

  static void setPowerSaverControlAbleLock(String lockMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_POWER_SAVER_CONTROL_ABLE, map, callback,
        fail_callback: failedCallback);
  }

  static void setLockNbAddress(
      String ip,
      String port,
      String lockData,
      TTGetLockElectricQuantityCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.ip] = ip;
    map[TTResponse.port] = port;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_NB_ADDRESS, map, callback,
        fail_callback: failedCallback);
  }

  // static void setNbAwakeModes(List<TTNbAwakeMode> modes, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   List list = [];
  //   modes.forEach((element) {
  //     list.add(element.index);
  //   });

  //   Map map = Map();
  //   map[TTResponse.nbAwakeModes] = list;
  //   map[TTResponse.lockData] = lockData;
  //   invoke(COMMAND_SET_NB_AWAKE_MODES, map, callback, fail: failedCallback);
  // }

  // static void getNbAwakeModes(String lockData,
  //     TTGetNbAwakeModesCallback callback, TTFailedCallback failedCallback) {
  //   invoke(COMMAND_GET_NB_AWAKE_MODES, lockData, callback,
  //       fail: failedCallback);
  // }

  // static void setNbAwakeTimes(List<TTNbAwakeTimeModel> times, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   List list = [];
  //   times.forEach((element) {
  //     Map nbAwakeTimeMap = new Map();
  //     nbAwakeTimeMap[TTResponse.minutes] = element.minutes;
  //     nbAwakeTimeMap[TTResponse.type] = element.type.index;
  //     list.add(nbAwakeTimeMap);
  //   });

  //   Map map = Map();
  //   map[TTResponse.nbAwakeTimeList] = list;
  //   map[TTResponse.lockData] = lockData;
  //   invoke(COMMAND_SET_NB_AWAKE_TIMES, map, callback, fail: failedCallback);
  // }

  // static void getNBAwakeTimes(String lockData,
  //     TTGetNbAwakeTimesCallback callback, TTFailedCallback failedCallback) {
  //   invoke(COMMAND_GET_NB_AWAKE_TIMES, lockData, callback,
  //       fail: failedCallback);
  // }

  // static void setDoorSensorLockingSwitchState(bool isOn, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   Map map = Map();
  //   map[TTResponse.isOn] = isOn;
  //   map[TTResponse.lockData] = lockData;
  //   invoke(COMMAND_SET_DOOR_SENSOR_SWITCH, map, callback, fail: failedCallback);
  // }

  // static void getDoorSensorLockingSwitchState(String lockData,
  //     TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
  //   invoke(COMMAND_GET_DOOR_SENSOR_SWITCH, lockData, callback,
  //       fail: failedCallback);
  // }

  static void setHotel(
      String hotelInfo,
      int buildingNumber,
      int floorNumber,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.hotelInfo] = hotelInfo;
    map[TTResponse.buildingNumber] = buildingNumber;
    map[TTResponse.floorNumber] = floorNumber;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_HOTEL_INFO, map, callback,
        fail_callback: failedCallback);
  }

  static void setHotelCardSector(String sector, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.sector] = sector;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_HOTEL_CARD_SECTOR, map, callback,
        fail_callback: failedCallback);
  }

  // static void getDoorSensorState(String lockData,
  //     TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
  //   invoke(COMMAND_GET_DOOR_SENSOR_STATE, lockData, callback,
  //       fail: failedCallback);
  // }

  static void getLockVersion(String lockMac, TTGetLockVersionCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    invoke(COMMAND_GET_LOCK_VERSION, map, callback,
        fail_callback: failedCallback);
  }

  static void scanWifi(String lockData, TTWifiLockScanWifiCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_SCAN_WIFI, lockData, callback,
        fail_callback: failedCallback);
  }

  static void configWifi(String wifiName, String wifiPassword, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.wifiName] = wifiName;
    map[TTResponse.wifiPassword] = wifiPassword;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_CONFIG_WIFI, map, callback, fail_callback: failedCallback);
  }

  static void configServer(String ip, String port, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.ip] = ip;
    map[TTResponse.port] = port;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_CONFIG_SERVER, map, callback, fail_callback: failedCallback);
  }

  static void getWifiInfo(String lockData,
      TTWifiLockGetWifiInfoCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_WIFI_INFO, lockData, callback,
        fail_callback: failedCallback);
  }

  static void configIp(
    Map map,
    String lockData,
    TTSuccessCallback callback,
    TTFailedCallback failedCallback,
  ) {
    map[TTResponse.lockData] = lockData;
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(map);
    TTLock.invoke(COMMAND_CONFIG_IP, map, callback,
        fail_callback: failedCallback);
  }

  static void setLockSoundWithSoundVolume(
      TTSoundVolumeType type,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map["soundVolumeType"] = type.index;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LOCK_SOUND_WITH_SOUND_VOLUME, map, callback,
        fail_callback: failedCallback);
  }

  static void getLockSoundWithSoundVolume(
      String lockData,
      TTGetLockSoundWithSoundVolumeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME, lockData, callback,
        fail_callback: failedCallback);
  }

  // static void setNBServerInfo(String nbServerAddress, int nbServerPort, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   Map map = Map();
  //   map[TTResponse.nbServerAddress] = nbServerAddress;
  //   map[TTResponse.nbServerPort] = nbServerPort;
  //   map[TTResponse.lockData] = lockData;
  //   invoke(COMMAND_SET_NB_SERVER_INFO, map, callback, fail: failedCallback);
  // }

  // static void getAdminPasscode(String lockData, TTGetAdminPasscodeCallback callback, TTFailedCallback failedCallback) {
  //   invoke(COMMAND_GET_ADMIN_PASSCODE, lockData, callback,
  //       fail: failedCallback);
  // }
  //
  // static void getLockSystemInfo(String lockData, TTGetLockSystemInfoCallback callback, TTFailedCallback failedCallback) {
  //   invoke(COMMAND_GET_LOCK_SYSTEM_INFO, lockData, callback,
  //       fail: failedCallback);
  // }
  //
  // static void getPasscodeVerificationParams(String lockData, TTGetPasscodeVerificationParamsCallback callback, TTFailedCallback failedCallback) {
  //   invoke(COMMAND_GET_PASSCODE_VERIFICATION_PARAMS, lockData, callback,
  //       fail: failedCallback);
  // }

  static void addRemoteKey(
      String remoteKeyMac,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = remoteKeyMac;
    map[TTResponse.cycleJsonList] =
        cycleList == null ? null : convert.jsonEncode(cycleList);
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_ADD_LOCK_REMOTE_KEY, map, callback,
        fail_callback: failedCallback);
  }

  static void deleteRemoteKey(String remoteKeyMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = remoteKeyMac;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_DELETE_LOCK_REMOTE_KEY, map, callback,
        fail_callback: failedCallback);
  }

  static void clearRemoteKey(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_REMOTE_KEY, lockData, callback,
        fail_callback: failedCallback);
  }

  static void setRemoteKeyValidDate(
      String remoteKeyMac,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = remoteKeyMac;
    map[TTResponse.cycleJsonList] =
        cycleList == null ? null : convert.jsonEncode(cycleList);
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LOCK_REMOTE_KEY_VALID_DATE, map, callback,
        fail_callback: failedCallback);
  }

  static void getRemoteAccessoryElectricQuantity(
      TTRemoteAccessory remoteAccessory,
      String remoteAccessoryMac,
      String lockData,
      TTGetLockAccessoryElectricQuantity callback,
      TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.remoteAccessory] = remoteAccessory.index;
    map[TTResponse.mac] = remoteAccessoryMac;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY, map, callback,
        fail_callback: failedCallback);
  }

  static void addDoorSensor(String doorSensorMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = doorSensorMac;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_ADD_LOCK_DOOR_SENSORY, map, callback,
        fail_callback: failedCallback);
  }

  static void deleteDoorSensor(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_DELETE_LOCK_DOOR_SENSORY, lockData, callback,
        fail_callback: failedCallback);
  }

  static void setDoorSensorAlertTime(String lockData, int alertTime,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.alertTime] = alertTime;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LOCK_DOOR_SENSORY_ALERT_TIME, map, callback,
        fail_callback: failedCallback);
  }

  static void setLockEnterUpgradeMode(String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_SET_LOCK_ENTER_UPGRADE_MODE, lockData, callback,
        fail_callback: failedCallback);
  }

  static void verifyLock(String lockMac, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.lockMac] = lockMac;
    invoke(COMMAND_VERIFY_LOCK, map, callback, fail_callback: failedCallback);
  }

  static void addFace(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddFaceProgressCallback progressCallback,
      TTAddFaceSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    invoke(COMMAND_ADD_FACE, map, callback,
        progress_callback: progressCallback, fail_callback: failedCallback);
  }

  static void addFaceData(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String faceFeatureData,
      String lockData,
      TTAddFaceSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.faceFeatureData] = faceFeatureData;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    invoke(COMMAND_ADD_FACE_DATA, map, callback, fail_callback: failedCallback);
  }

  static void modifyFace(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String faceNumber,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.faceNumber] = faceNumber;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    invoke(COMMAND_MODIFY_FACE, map, callback, fail_callback: failedCallback);
  }

  static void clearFace(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_CLEAR_FACE, map, callback, fail_callback: failedCallback);
  }

  static void deleteFace(String faceNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.faceNumber] = faceNumber;
    invoke(COMMAND_DELETE_FACE, map, callback, fail_callback: failedCallback);
  }

  static void setLockWorkingTime(int startDate, int endDate, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    invoke(COMMAND_SET_WORKING_TIME, map, callback,
        fail_callback: failedCallback);
  }

//执行方法
  static bool isListenEvent = false;
  static void invoke(
      String command, Object? parameter, Object? success_callback,
      {Object? progress_callback,
      Object? fail_callback,
      Object? other_fail_callback}) {
    if (!isListenEvent) {
      isListenEvent = true;
      _listenChannel
          .receiveBroadcastStream("TTLockListen")
          .listen(_onEvent, onError: _onError);
    }

    //开始、停止扫描的时候  清空之前所有的扫描回调
    if (command.contains("Scan")) {
      List<String> removeKeyList = [];
      _commandMap.keys.forEach((key) {
        if (key.contains("Scan")) {
          removeKeyList.add(key);
        }
      });
      removeKeyList.forEach((key) {
        _commandMap.remove(key);
      });
    }

    //只要有回调就加入队列，等待清除
    if (success_callback != null) {
      Map callbackMap = new Map();
      callbackMap[CALLBACK_SUCCESS] = success_callback;
      callbackMap[CALLBACK_PROGRESS] = progress_callback;
      callbackMap[CALLBACK_FAIL] = fail_callback;
      callbackMap[CALLBACK_OTHER_FAIL] = other_fail_callback;

      List<Map> commandList = _commandMap[command] ?? [];
      commandList.add(callbackMap);
      _commandMap[command] = commandList;
    }

    _commandChannel.invokeMethod(command, parameter);

    // if (printLog) {
    //   print(
    //       '----------------------------------------------------------------------------------------------------------');
    //   print('TTLock command: $command  parameter:$parameter');
    //   print(
    //       '----------------------------------------------------------------------------------------------------------');
    // }
  }

  static void _successCallback(String command, Map data) {
    //获取队列里面能匹配到最前一个回调指令
    List<Map> commandList = _commandMap[command] ?? [];
    dynamic callBack =
        commandList.length > 0 ? commandList.first[CALLBACK_SUCCESS] : null;
    //如果是 网关扫描、锁扫描、网关获取附近wifi 需要特殊处理
    bool removeCommand = true;
    if (callBack == null) {
      removeCommand = false;
    } else {
      if (command == COMMAND_START_SCAN_LOCK ||
          command == TTGateway.COMMAND_START_SCAN_GATEWAY ||
          command == TTRemoteKey.COMMAND_START_SCAN_REMOTE_KEY ||
          command == TTRemoteKeypad.COMMAND_START_SCAN_REMOTE_KEYPAD ||
          command == TTDoorSensor.COMMAND_START_SCAN_DOOR_SENSOR ||
          command == TTWaterMeter.COMMAND_START_SCAN_WATER_METER ||
          command == TTElectricMeter.COMMAND_START_SCAN_ELECTRIC_METER) {
        removeCommand = false;
      }
      if (command == COMMAND_SCAN_WIFI && data[TTResponse.finished] == false) {
        removeCommand = false;
      }
      if (command == TTGateway.COMMAND_GET_SURROUND_WIFI &&
          data[TTResponse.finished] == false) {
        removeCommand = false;
      }
    }
    if (removeCommand && commandList.length > 0) {
      commandList.removeAt(0);
    }

    if (callBack == null) {
      if (printLog) {
        print(
            "********************************************  $command callback null *********************************************");
      }
      return;
    }
    switch (command) {
      case COMMAND_GET_BLUETOOTH_STATE:
        int stateValue = data[TTResponse.state];
        TTBluetoothState state = TTBluetoothState.values[stateValue];
        TTBluetoothStateCallback stateCallback = callBack;
        stateCallback(state);
        break;

      case COMMAND_START_SCAN_LOCK:
        TTLockScanCallback scanCallback = callBack;
        scanCallback(TTLockScanModel(data));
        break;

      case TTGateway.COMMAND_START_SCAN_GATEWAY:
        TTGatewayScanCallback scanCallback = callBack;
        scanCallback(TTGatewayScanModel(data));
        break;

      case TTRemoteKey.COMMAND_START_SCAN_REMOTE_KEY:
      case TTRemoteKeypad.COMMAND_START_SCAN_REMOTE_KEYPAD:
      case TTDoorSensor.COMMAND_START_SCAN_DOOR_SENSOR:
        TTRemoteAccessoryScanCallback scanCallback = callBack;
        scanCallback(TTRemoteAccessoryScanModel(data));
        break;
      case TTElectricMeter.COMMAND_START_SCAN_ELECTRIC_METER:
        TTElectricMeterScanCallback scanCallback = callBack;
        scanCallback(TTElectricMeterScanModel(data));
        break;
      case TTWaterMeter.COMMAND_START_SCAN_WATER_METER:
        TTWaterMeterScanCallback scanCallback = callBack;
        scanCallback(TTWaterMeterScanModel(data));
        break;
      case COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME:
        TTGetLockAutomaticLockingPeriodicTimeCallback
            getLockAutomaticLockingPeriodicTimeCallback = callBack;
        getLockAutomaticLockingPeriodicTimeCallback(
            data[TTResponse.currentTime],
            data[TTResponse.minTime],
            data[TTResponse.maxTime]);
        break;

      case COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE:
      case COMMAND_GET_LOCK_CONFIG:
        TTGetSwitchStateCallback switchStateCallback = callBack;
        switchStateCallback(data[TTResponse.isOn]);
        break;
      case COMMAND_GET_LOCK_DIRECTION:
        TTGetLockDirectionCallback lockDirectionCallback = callBack;
        int direction = data[TTResponse.direction];
        lockDirectionCallback(TTLockDirection.values[direction]);
        break;
      case COMMAND_GET_LOCK_SYSTEM_INFO:
      case TTRemoteKey.COMMAND_INIT_REMOTE_KEY:
      case TTDoorSensor.COMMAND_INIT_DOOR_SENSOR:
        TTGetLockSystemCallback getLockSystemCallback = callBack;
        getLockSystemCallback(TTLockSystemModel(data));
        break;

      case COMMAND_INIT_LOCK:
      case COMMAND_RESET_EKEY:
      case COMMAND_RESET_PASSCODE:
      case COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE:
      case COMMAND_GET_PASSCODE_VERIFICATION_PARAMS:
        TTLockDataCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.lockData]);
        break;

      case COMMAND_CONTROL_LOCK:
        TTControlLockCallback controlLockCallback = callBack;
        controlLockCallback(
            data[TTResponse.lockTime],
            data[TTResponse.electricQuantity],
            data[TTResponse.uniqueId],
            data[TTResponse.lockData]);
        break;

      case COMMAND_ACTIVE_LIFT_FLOORS:
        TTLiftCallback liftCallback = callBack;
        liftCallback(data[TTResponse.lockTime],
            data[TTResponse.electricQuantity], data[TTResponse.uniqueId]);
        break;

      case COMMAND_MODIFY_ADMIN_PASSCODE:
        if (isOnPremise) {
          TTLockDataCallback lockDataCallback = callBack;
          lockDataCallback(data[TTResponse.lockData]);
        } else {
          TTSuccessCallback successCallback = callBack;
          successCallback();
        }
        break;

      case COMMAND_GET_ADMIN_PASSCODE:
        TTGetAdminPasscodeCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.adminPasscode]);
        break;

      case COMMAND_ADD_CARD:
      case TTRemoteKeypad.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD:
        TTCardNumberCallback addCardCallback = callBack;
        addCardCallback(data[TTResponse.cardNumber]);
        break;

      case COMMAND_ADD_FINGERPRINT:
      case TTRemoteKeypad.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT:
        TTAddFingerprintCallback addFingerprintCallback = callBack;
        addFingerprintCallback(data[TTResponse.fingerprintNumber]);
        break;

      case COMMAND_GET_LOCK_SWITCH_STATE:
        TTGetLockStatusCallback getLockStatusCallback = callBack;
        int lockSwitchState = data[TTResponse.lockSwitchState];
        getLockStatusCallback(TTLockSwitchState.values[lockSwitchState]);
        break;

      case COMMAND_GET_LOCK_TIME:
        TTGetLockTimeCallback getLockTimeCallback = callBack;
        getLockTimeCallback(data[TTResponse.timestamp]);
        break;

      case COMMAND_GET_LOCK_OPERATE_RECORD:
        TTGetLockOperateRecordCallback getLockOperateRecordCallback = callBack;
        getLockOperateRecordCallback(data[TTResponse.records] ?? "");
        break;

      case COMMAND_GET_LOCK_POWER:
      case COMMAND_SET_NB_ADDRESS:
        TTGetLockElectricQuantityCallback getLockElectricQuantityCallback =
            callBack;
        getLockElectricQuantityCallback(data[TTResponse.electricQuantity]);
        break;

      case COMMAND_FUNCTION_SUPPORT:
        TTFunctionSupportCallback functionSupportCallback = callBack;
        functionSupportCallback(data[TTResponse.isSupport]);
        break;
      case COMMAND_GET_NB_AWAKE_MODES:
        TTGetNbAwakeModesCallback getNbAwakeModesCallback = callBack;
        getNbAwakeModesCallback(data[TTResponse.nbAwakeModes]);
        break;
      case COMMAND_GET_ALL_VALID_PASSCODE:
        TTGetAllPasscodeCallback getAllPasscodeCallback = callBack;
        List passcodeList = [];
        String? passcodeListString = data[TTResponse.passcodeListString];
        if (passcodeListString != null) {
          passcodeList = convert.jsonDecode(passcodeListString);
        }
        getAllPasscodeCallback(passcodeList);
        break;
      case COMMAND_GET_ALL_VALID_CARD:
        TTGetAllCardsCallback getAllCardsCallback = callBack;

        List cardList = [];
        String? cardListString = data[TTResponse.cardListString];
        if (cardListString != null) {
          cardList = convert.jsonDecode(cardListString);
        }
        getAllCardsCallback(cardList);
        break;
      case COMMAND_GET_ALL_VALID_FINGERPRINT:
        TTGetAllFingerprintsCallback getAllFingerprintsCallback = callBack;
        List fingerprintList = [];
        String? fingerprintListString = data[TTResponse.fingerprintListString];
        if (fingerprintListString != null) {
          fingerprintList = convert.jsonDecode(fingerprintListString);
        }
        getAllFingerprintsCallback(fingerprintList);
        break;
      case COMMAND_GET_NB_AWAKE_TIMES:
        TTGetNbAwakeTimesCallback getNbAwakeTimesCallback = callBack;
        List<Map> nbAwakeTimeList = data[TTResponse.nbAwakeTimeList];
        List<TTNbAwakeTimeModel> list = [];

        nbAwakeTimeList.forEach((element) {
          TTNbAwakeTimeModel model = new TTNbAwakeTimeModel();
          model.minutes = element[TTResponse.minutes];
          model.type = TTNbAwakeTimeType.values[element[TTResponse.type]];
          list.add(model);
        });
        getNbAwakeTimesCallback(list);
        break;

      case COMMAND_GET_ADMIN_PASSCODE:
        TTGetAdminPasscodeCallback getAdminPasscodeCallback = callBack;
        getAdminPasscodeCallback(data[TTResponse.adminPasscode]);
        break;
      case COMMAND_GET_LOCK_VERSION:
        TTGetLockVersionCallback getLockVersionCallback = callBack;
        getLockVersionCallback(data[TTResponse.lockVersion]);
        break;
      case COMMAND_SCAN_WIFI:
        TTWifiLockScanWifiCallback scanWifiCallback = callBack;
        bool finished = data[TTResponse.finished];
        List wifiList = data[TTResponse.wifiList];
        scanWifiCallback(finished, wifiList);
        break;
      case COMMAND_GET_WIFI_INFO:
        TTWifiLockGetWifiInfoCallback getWifiInfoCallback = callBack;
        getWifiInfoCallback(TTWifiInfoModel(data));
        break;
      case COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME:
        int soundVolumeValue = data[TTResponse.soundVolumeType];
        TTSoundVolumeType type = TTSoundVolumeType.values[soundVolumeValue];

        TTGetLockSoundWithSoundVolumeCallback getLockSoundCallback = callBack;
        getLockSoundCallback(type);
        break;

      case COMMAND_GET_LOCK_FRETURE_VALUE:
        TTLockDataCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.lockData]);
        break;

      // case COMMAND_GET_LOCK_SYSTEM_INFO:
      //   TTGetLockSystemInfoCallback getLockSystemInfoCallback = callBack;
      //   getLockSystemInfoCallback(TTLockSystemInfoModel(data));
      //   break;

      // case COMMAND_GET_PASSCODE_VERIFICATION_PARAMS:
      //   TTGetPasscodeVerificationParamsCallback getPasscodeVerificationParamsCallback = callBack;
      //   getPasscodeVerificationParamsCallback(data[TTResponse.lockData]);
      //   break;

      case TTGateway.COMMAND_CONNECT_GATEWAY:
        TTGatewayConnectCallback connectCallback = callBack;
        TTGatewayConnectStatus status =
            TTGatewayConnectStatus.values[data[TTResponse.status]];
        connectCallback(status);
        break;

      case TTGateway.COMMAND_GET_SURROUND_WIFI:
        TTGatewayGetAroundWifiCallback getAroundWifiCallback = callBack;
        bool finished = data[TTResponse.finished];
        List wifiList = data[TTResponse.wifiList];
        getAroundWifiCallback(finished, wifiList);
        break;

      case TTGateway.COMMAND_INIT_GATEWAY:
        TTGatewayInitCallback gatewayInitCallback = callBack;
        gatewayInitCallback(data);
        break;
      case COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY:
        TTGetLockAccessoryElectricQuantity getLockAccessoryElectricQuantity =
            callBack;
        getLockAccessoryElectricQuantity(
            data[TTResponse.electricQuantity], data[TTResponse.updateDate]);
        break;
      case TTRemoteKeypad.COMMAND_INIT_REMOTE_KEYPAD:
        TTRemoteKeypadInitSuccessCallback remoteKeypadInitSuccessCallback =
            callBack;
        remoteKeypadInitSuccessCallback(data[TTResponse.electricQuantity],
            data[TTResponse.wirelessKeypadFeatureValue]);
        break;
      case TTRemoteKeypad.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK:
        TTRemoteKeypadGetStoredLockSuccessCallback getStoredLocks = callBack;
        getStoredLocks(data["lockMacs"]);
        break;
      case TTRemoteKeypad.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD:
        print(data["systemInfoModel"]);
        TTMultifunctionalRemoteKeypadInitSuccessCallback initSuccessCallback =
            callBack;
        initSuccessCallback(
            data["electricQuantity"],
            data["wirelessKeypadFeatureValue"],
            data["slotNumber"],
            data["slotLimit"]);
        break;
      case COMMAND_ADD_FACE:
      case COMMAND_ADD_FACE_DATA:
        TTAddFaceSuccessCallback addFaceSuccessCallback = callBack;
        addFaceSuccessCallback(data[TTResponse.faceNumber]);
        break;

      default:
        TTSuccessCallback successCallback = callBack;
        successCallback();
    }
  }

  static void _progressCallback(String command, Map data) {
    List<Map> commandList = _commandMap[command] ?? [];
    dynamic callBack =
        commandList.length > 0 ? commandList.first[CALLBACK_PROGRESS] : null;
    switch (command) {
      case COMMAND_ADD_CARD:
      case TTRemoteKeypad.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD:
        TTAddCardProgressCallback progressCallback = callBack;
        progressCallback();
        break;
      case COMMAND_ADD_FINGERPRINT:
      case TTRemoteKeypad.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT:
        TTAddFingerprintProgressCallback progressCallback = callBack;
        progressCallback(
            data[TTResponse.currentCount], data[TTResponse.totalCount]);
        break;
      case COMMAND_ADD_FACE:
        TTAddFaceProgressCallback progressCallback = callBack;
        progressCallback(TTFaceState.values[data[TTResponse.state]],
            TTFaceErrorCode.values[data[TTResponse.errorCode]]);
        break;
      default:
    }
  }

  static void _errorCallback(
      String command, int errorCode, String errorMessage, Map data) {
    if (errorCode == TTLockError.lockIsBusy.index) {
      errorMessage =
          "The TTLock SDK can only communicate with one lock at a time";
    }
    if (errorCode > TTLockError.wrongWifiPassword.index) {
      errorCode = TTLockError.fail.index;
    }

    List<Map> commandList = _commandMap[command] ?? [];
    dynamic callBack =
        commandList.length > 0 ? commandList.first[CALLBACK_FAIL] : null;
    dynamic otherCallBack =
        commandList.length > 0 ? commandList.first[CALLBACK_OTHER_FAIL] : null;
    //多功能键盘添加指纹时返回重复指纹失败时，不移除
    if (commandList.length > 0 &&
        !(command == TTRemoteKeypad.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT &&
            data["errorDevice"] == TTErrorDevice.keyPad.index
            && errorCode == TTRemoteKeyPadAccessoryError.duplicateFingerprint.index)
    ) {
      commandList.removeAt(0);
    }
    //网关失败处理
    if (command == TTGateway.COMMAND_GET_SURROUND_WIFI ||
        command == TTGateway.COMMAND_INIT_GATEWAY ||
        command == TTGateway.COMMAND_CONFIG_IP ||
        command == TTGateway.COMMAND_UPGRADE_GATEWAY) {
      TTGatewayFailedCallback? failedCallback = callBack;
      TTGatewayError error = TTGatewayError.values[errorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    }
    //普通键盘和遥控钥匙失败处理
    else if (command == TTRemoteKey.COMMAND_INIT_REMOTE_KEY ||
        command == TTDoorSensor.COMMAND_INIT_DOOR_SENSOR ||
        command == TTRemoteKeypad.COMMAND_INIT_REMOTE_KEYPAD) {
      TTRemoteFailedCallback? failedCallback = callBack;
      TTRemoteAccessoryError error =
      TTRemoteAccessoryError.values[0];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    }
    // 多功能键盘失败处理
    else if ((command ==
            TTRemoteKeypad.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD) ||
        command ==
            TTRemoteKeypad
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK ||
        command ==
            TTRemoteKeypad
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK ||
        command ==
            TTRemoteKeypad
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT ||
        command ==
            TTRemoteKeypad.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD) {
      if (data["errorDevice"] == TTErrorDevice.keyPad.index) {
        TTRemoteKeypadFailedCallback? failedCallback = otherCallBack;
        TTRemoteKeyPadAccessoryError error =
            TTRemoteKeyPadAccessoryError.values[errorCode];
        if (failedCallback != null) {
          failedCallback(error, errorMessage);
        }
      } else {
        if (errorCode < 0) {
          errorCode = 0;
        }
        callBack?.call(TTLockError.values[errorCode], errorMessage);
      }
    }

    //蓝牙水电表失败处理
    else if (command.contains('electricMeter') ||
        command.contains('waterMeter')) {
      TTMeterFailedCallback? failedCallback = callBack;
      TTMeterErrorCode error = TTMeterErrorCode.values[errorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    }

    //锁失败处理
    else {
      TTFailedCallback? failedCallback = callBack;
      TTLockError error = TTLockError.values[errorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    }
  }

  // 数据接收
  static void _onEvent(dynamic value) {
    if (printLog) {
      print('TTLock listen: $value');
    }

    // print("当前队列：" + _commandMap.keys.toString());

    Map map = value;
    String command = map[TTResponse.command];
    Map data = map[TTResponse.data] == null ? {} : map[TTResponse.data];
    int resultState = map[TTResponse.resultState];

    if (resultState == TTLockResult.fail.index) {
      int errorCode = map[TTResponse.errorCode];
      String errorMessage = map[TTResponse.errorMessage] == null
          ? ""
          : map[TTResponse.errorMessage];
      _errorCallback(command, errorCode, errorMessage, data);
    } else if (resultState == TTLockResult.progress.index) {
      //中间状态的回调（添加 IC卡、指纹）
      _progressCallback(command, data);
    } else {
      //成功的回调
      _successCallback(command, data);
    }
  }

  // 错误处理
  static void _onError(Object value) {
    if (printLog) {
      print('TTLockPlugin Error: $value');
    }
  }
}

class TTResponse {
  static const String command = "command";
  static const String data = "data";
  static const String resultState = "resultState";
  static const String errorCode = "errorCode";
  static const String errorMessage = "errorMessage";
  static const String state = "state";
  static const String status = "status";
  static const String wifiList = "wifiList";
  static const String finished = "finished";

  static const String lockName = "lockName";
  static const String lockMac = "lockMac";
  static const String isInited = "isInited";
  static const String isAllowUnlock = "isAllowUnlock";
  static const String isDfuMode = "isDfuMode";
  static const String electricQuantity = "electricQuantity";
  static const String lockVersion = "lockVersion";
  static const String lockSwitchState = "lockSwitchState";
  static const String rssi = "rssi";
  static const String oneMeterRssi = "oneMeterRssi";
  static const String timestamp = "timestamp";
  static const String specialValue = "specialValue";
  static const String lockData = "lockData";
  static const String lockConfig = "lockConfig";
  static const String scanState = "scanState";
  static const String passcodeInfo = "passcodeInfo";
  static const String controlAction = "controlAction";
  static const String lockTime = "lockTime";
  static const String uniqueId = "uniqueId";
  static const String passcode = "passcode";
  static const String startDate = "startDate";
  static const String endDate = "endDate";
  static const String passcodeOrigin = "passcodeOrigin";
  static const String passcodeNew = "passcodeNew";
  static const String cardNumber = "cardNumber";
  static const String fingerprintNumber = "fingerprintNumber";
  static const String adminPasscode = "adminPasscode";
  static const String erasePasscode = "erasePasscode";
  static const String totalCount = "totalCount";
  static const String currentCount = "currentCount";
  static const String records = "records";
  static const String maxTime = "maxTime";
  static const String cycleJsonList = "cycleJsonList";
  static const String faceFeatureData = "faceFeatureData";
  static const String faceNumber = "faceNumber";

  static const String minTime = "minTime";
  static const String currentTime = "currentTime";
  static const String isOn = "isOn";
  static const String passageModeType = "passageModeType";
  static const String weekly = "weekly";
  static const String monthly = "monthly";

  static const String direction = "direction";

  static const String isSupport = "isSupport";
  static const String supportFunction = "supportFunction";

  static const String nbAwakeModes = "nbAwakeModes";
  static const String nbAwakeTimeList = "nbAwakeTimeList";
  static const String minutes = "minutes";
  static const String type = "type";
  static const String hotelInfo = "hotelInfo";
  static const String buildingNumber = "buildingNumber";
  static const String floorNumber = "floorNumber";
  static const String sector = "sector";

  static const String passcodeListString = "passcodeListString";
  static const String cardListString = "cardListString";
  static const String fingerprintListString = "fingerprintListString";

  static const String nbServerAddress = "nbServerAddress";
  static const String nbServerPort = "nbServerPort";

  static const String modelNum = "modelNum";
  static const String hardwareRevision = "hardwareRevision";
  static const String firmwareRevision = "firmwareRevision";
  static const String nbNodeId = "nbNodeId";
  static const String nbOperator = "nbOperator";
  static const String nbCardNumber = "nbCardNumber";
  static const String nbRssi = "nbRssi";

  static const String addGatewayJsonStr = "addGatewayJsonStr";
  static const String ip = "ip";
  static const String port = "port";

  static const String ipSettingJsonStr = "ipSettingJsonStr";
  static const String wifiName = "wifiName";
  static const String wifiPassword = "wifiPassword";

  static const String mac = "mac";
  static const String name = "name";

  static const String remoteAccessory = "remoteAccessory";

  static const String soundVolumeType = "soundVolumeType";

  static const String updateDate = "updateDate";
  static const String alertTime = "alertTime";
  static const String wirelessKeypadFeatureValue = "wirelessKeypadFeatureValue";
  static const String resetCode = "resetCode";

  static const String totalKwh = "totalKwh";
  static const String remainderKwh = "remainderKwh";
  static const String voltage = "voltage";
  static const String electricCurrent = "electricCurrent";

  static const String onOff = "onOff";
  static const String payMode = "payMode";
  static const String scanTime = "scanTime";
  static const String slotNumber = "slotNumber";

  static const String totalM3 = "totalM3";
  static const String remainderM3 = "remainderM3";
  static const String magneticInterference = "magneticInterference";
  static const String waterValveFailure = "waterValveFailure";
}

class TTLockScanModel {
  String lockName = '';
  String lockMac = '';
  bool isInited = true;
  bool isAllowUnlock = false;
  // bool isDfuMode;
  int electricQuantity = -1;
  String lockVersion = '';
  TTLockSwitchState lockSwitchState = TTLockSwitchState.unknown;
  int rssi = -1;
  int oneMeterRssi = -1;
  int timestamp = 0;

  TTLockScanModel(Map map) {
    this.lockName = map[TTResponse.lockName];
    this.lockMac = map[TTResponse.lockMac];
    this.isInited = map[TTResponse.isInited];
    this.isAllowUnlock = map[TTResponse.isAllowUnlock];
    // this.isDfuMode = map[TTResponse.isDfuMode];
    this.electricQuantity = map[TTResponse.electricQuantity];
    this.lockVersion = map[TTResponse.lockVersion];
    this.lockSwitchState =
        TTLockSwitchState.values[map[TTResponse.lockSwitchState]];
    this.rssi = map[TTResponse.rssi];
    this.oneMeterRssi = map[TTResponse.oneMeterRssi];
    this.timestamp = map[TTResponse.timestamp];
  }
}

class TTCycleModel {
  // weekDay  1-7,1 means Monday，2 means  Tuesday ,...,7 means Sunday
  int weekDay = 0;
  // startTime The time when it becomes valid (minutes from 0 clock)
  int startTime = 0;
  // endTime  The time when it is expired (minutes from 0 clock)
  int endTime = 0;

  /// jsonDecode(jsonStr) 方法中会调用实体类的这个方法。如果实体类中没有这个方法，会报错。
  Map toJson() {
    Map map = new Map();
    map["weekDay"] = this.weekDay;
    map["startTime"] = this.startTime;
    map["endTime"] = this.endTime;
    return map;
  }

// weekDay  1-7,1 means Monday，2 means  Tuesday ,...,7 means Sunday
//startTime The time when it becomes valid (minutes from 0 clock)
//endTime  The time when it is expired (minutes from 0 clock)
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

  // NB IOT LOCK
  String? nbOperator;
  String? nbNodeId;
  String? nbCardNumber;
  String? nbRssi;

  //support TTLockFeatureValuePasscodeKeyNumber
  String? passcodeKeyNumber;

  String? lockData;

  // ignore: non_constant_identifier_names
  TTLockSystemModel(Map map) {
    this.modelNum = map["modelNum"];
    this.hardwareRevision = map["hardwareRevision"];
    this.firmwareRevision = map["firmwareRevision"];
    this.electricQuantity = map["electricQuantity"];

    this.nbOperator = map["nbOperator"];
    this.nbNodeId = map["nbNodeId"];
    this.nbCardNumber = map["nbCardNumber"];
    this.nbRssi = map["nbRssi"];

    this.passcodeKeyNumber = map["passcodeKeyNumber"]?.toString();

    this.lockData = map["lockData"];
  }
}

enum TTBluetoothState {
  unknown,
  resetting,
  unsupported,
  unAuthorized,
  turnOff,
  turnOn
}

enum TTPasscodeType { once, permanent, period, cycle }

enum TTOperateRecordType { latest, total }

enum TTControlAction { unlock, lock }

enum TTLockSwitchState { lock, unlock, unknown }

enum TTPassageModeType { weekly, monthly }

enum TTLockResult { success, progress, fail }

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
  fourthLevel,
  fifthLevel,
  off,
  on
}

enum TTLockError {
  reset, //0
  crcError, //1
  noPermission,
  wrongAdminCode,
  noStorageSpace,
  inSettingMode, //5
  noAdmin,
  notInSettingMode,
  wrongDynamicCode,
  noPower,
  resetPasscode, //10
  updatePasscodeIndex,
  invalidLockFlagPos,
  eKeyExpired,
  passcodeLengthInvalid,
  samePasscode, //15
  eKeyInactive,
  aesKey,
  fail,
  passcodeExist,
  passcodeNotExist, //20
  lackOfStorageSpaceWhenAddingPasscode,
  invalidParaLength,
  cardNotExist,
  fingerprintDuplication,
  fingerprintNotExist, //25
  invalidCommand,
  inFreezeMode,
  invalidClientPara,
  lockIsLocked,
  recordNotExist, //30

  notSupportModifyPasscode,
  bluetoothOff,
  bluetoothConnectTimeout,
  bluetoothDisconnection,
  lockIsBusy, //35
  invalidLockData,
  invalidParameter,
  wrongWifi, //38
  wrongWifiPassword
}

enum TTLiftWorkActivateType { allFloors, specificFloors }

enum TTPowerSaverWorkType { allCards, hotelCard, roomCard }

enum TTNbAwakeMode { keypad, card, fingerprint }

enum TTNbAwakeTimeType { point, interval }

enum TTRemoteAccessory { remoteKey, remoteKeypad, doorSensor }

typedef TTSuccessCallback = void Function();
typedef TTFailedCallback = void Function(
    TTLockError errorCode, String errorMsg);
typedef TTLockScanCallback = void Function(TTLockScanModel scanModel);
typedef TTBluetoothStateCallback = void Function(TTBluetoothState state);
typedef TTBluetoothScanStateCallback = void Function(bool isScanning);
typedef TTLockDataCallback = void Function(String lockData);
typedef TTControlLockCallback = void Function(
    int lockTime, int electricQuantity, int uniqueId, String lockData);
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

typedef TTGetLockSoundWithSoundVolumeCallback = void Function(
    TTSoundVolumeType ttLockSoundVolumeType);
// typedef TTGetPasscodeVerificationParamsCallback = void Function(String lockData);

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
    int slotLimit);

typedef TTRemoteKeypadGetStoredLockSuccessCallback = void Function(
    List lockMacs);

typedef TTRemoteKeypadFailedCallback = void Function(
    TTRemoteKeyPadAccessoryError errorCode, String errorMsg);

typedef TTAddFaceProgressCallback = void Function(
    TTFaceState state, TTFaceErrorCode faceErrorCode);

typedef TTAddFaceSuccessCallback = void Function(String faceNumber);

typedef TTElectricMeterScanCallback = void Function(
    TTElectricMeterScanModel scanModel);

typedef TTMeterFailedCallback = void Function(
    TTMeterErrorCode errorCode, String message);

typedef TTWaterMeterScanCallback = void Function(
    TTWaterMeterScanModel scanModel);

class TTRemoteAccessoryScanModel {
  String name = '';
  String mac = '';
  int rssi = -1;
  bool isMultifunctionalKeypad = false;
  Map advertisementData = {};

  TTRemoteAccessoryScanModel(Map map) {
    this.name = map["name"];
    this.mac = map["mac"];
    this.rssi = map["rssi"];
    this.isMultifunctionalKeypad = map["isMultifunctionalKeypad"] ?? false;
    this.advertisementData = map["advertisementData"] ?? {};
  }
}

class TTDoorSensorScanModel {
  String name = '';
  String mac = '';
  int rssi = -1;

  TTDoorSensorScanModel(Map map) {
    this.name = map["name"];
    this.mac = map["mac"];
    this.rssi = map["rssi"];
  }
}

class TTGatewayScanModel {
  String gatewayName = '';
  String gatewayMac = '';
  int rssi = -1;
  bool isDfuMode = false;
  TTGatewayType? type;

  TTGatewayScanModel(Map map) {
    this.gatewayName = map["gatewayName"];
    this.gatewayMac = map["gatewayMac"];
    this.rssi = map["rssi"];
    this.type = TTGatewayType.values[map["type"]];
    this.isDfuMode = map["isDfuMode"];
  }
}

class TTNbAwakeTimeModel {
  TTNbAwakeTimeType type = TTNbAwakeTimeType.point;
  int minutes = 0;
}

class TTWifiInfoModel {
  String wifiMac = '';
  int wifiRssi = -127;
  // ignore: non_constant_identifier_names
  TTWifiInfoModel(Map map) {
    this.wifiMac = map["wifiMac"];
    this.wifiRssi = map["wifiRssi"];
  }
}

enum TTGatewayError {
  fail,
  wrongWifi,
  wrongWifiPassword,
  wrongCRC,
  wrongAesKey,
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

enum TTGatewayConnectStatus { timeout, success, fail }

enum TTRemoteAccessoryError { fail, wrongCrc, connectTimeout }

enum TTRemoteKeyPadAccessoryError {
  fail,
  wrongCrc,
  connectTimeout,
  factoryDate,
  duplicateFingerprint,
  lackOfStorageSpace
}

enum TTLockFunction {
  passcode,
  icCard,
  fingerprint,
  wristband,
  autoLock,
  deletePasscode, //5
  // 6
  managePasscode,
  locking,
  passcodeVisible,
  gatewayUnlock,
  lockFreeze,
  cyclePassword,
  unlockSwitch,
  audioSwitch,
  nbIoT, //15

  getAdminPasscode, //17
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
  privacyLock, //28
  //31
  deadLock, //29
  //33
  cyclicCardOrFingerprint, //30
  //35
  //36
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
  doorSensor, //50
  doorSensorAlert,
  sensitivity,
  face,
  cpuCard,
  wifiLock,
  wifiLockStaticIP,
  passcodeKeyNumber,

  meariCamera,
  standAloneActivation,
  doubleAuth,
  authorizedUnlock,
  gatewayAuthorizedUnlock,
  noEkeyUnlock,
  xiongMaiCamera,
  zhiAnPhotoFace,
  palmVein,
  wifiArea,
  xiaoCaoCamera,
  resetLockByCode,
  workingTime
}

enum TTFaceState { canStartAdd, error }

enum TTErrorDevice { lock, keyPad, key }

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

enum TTMeterPayMode { postpaid, prepaid }

enum TTMeterErrorCode {
  bluetoothPowerOff,
  connectTimeout,
  disconnect,
  netError,
  serverError,
  meterExistedInServer
}
