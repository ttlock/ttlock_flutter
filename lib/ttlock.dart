import 'package:flutter/services.dart';
import 'dart:convert' as convert;

import 'package:ttlock_flutter/ttgateway.dart';

class TTLock {
  static MethodChannel _commandChannel =
      MethodChannel("com.ttlock/command/ttlock");
  static EventChannel _listenChannel = EventChannel("com.ttlock/listen/ttlock");

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

  static const String COMMAND_ADD_CARD = "addCard";
  static const String COMMAND_MODIFY_CARD = "modifyIcCard";
  static const String COMMAND_DELETE_CARD = "deleteIcCard";
  static const String COMMAND_CLEAR_ALL_CARD = "clearAllIcCard";

  static const String COMMAND_ADD_FINGERPRINT = "addFingerprint";
  static const String COMMAND_MODIFY_FINGERPRINT = "modifyFingerprint";
  static const String COMMAND_DELETE_FINGERPRINT = "deleteFingerprint";
  static const String COMMAND_CLEAR_ALL_FINGERPRINT = "clearAllFingerprint";
  static const String COMMAND_MODIFY_ADMIN_PASSCODE = "modifyAdminPasscode";

  static const String COMMAND_SET_LOCK_TIME = "setLockTime";
  static const String COMMAND_GET_LOCK_TIME = "getLockTime";
  static const String COMMAND_GET_LOCK_OPERATE_RECORD = "getLockOperateRecord";
  static const String COMMAND_GET_LOCK_POWER = "getLockPower";
  static const String COMMAND_GET_LOCK_SWITCH_STATE = "getLockSwitchState";

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

  static const String COMMAND_ACTIVE_ELEVATOR_FLOORS = "activateElevatorFloors";

  static const String command_SET_ELEVATOR_CONTROLABLE_FLOORS =
      "setElevatorControlableFloors";
  static const String command_SET_ELEVATOR_WORK_MODE = "setElevatorWorkMode";

  static const String command_SET_POWSER_SAVER_WORK_MODE =
      "setPowerSaverWorkMode";
  static const String command_SET_POWSER_SAVER_CONTROLABLE =
      "setPowerSaverControlable";

  static const String command_SET_NB_AWAKE_MODES = "setNBAwakeModes";
  static const String command_GET_NB_AWAKE_MODES = "getNBAwakeModes";
  static const String command_SET_NB_AWAKE_TIMES = "setNBAwakeTimes";
  static const String command_GET_NB_AWAKE_TIMES = "getNBAwakeTimes";

  static const String command_SET_DOOR_SENSOR_SWITCH = "setDoorSensorSwitch";
  static const String command_GET_DOOR_SENSOR_SWITCH = "getDoorSensorSwitch";
  static const String command_GET_DOOR_SENSOR_STATE = "getDoorSensorState";

  static const String command_SET_HOTLE_CARD_SECTOR = "setHotelCardSector";
  static const String command_SET_HOTLE_INOF = "setHotelInfo";

  static Map _callbackMap = Map();
  static Map _failCallbackMap = Map();
  static Map _progressCallbackMap = Map();

  static bool printLog = true;

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
    _callbackMap.remove(COMMAND_START_SCAN_LOCK);
  }

  // ignore: slash_for_doc_comments
/**
   * Current iPhone/iPoad Bluetooth state
   */
  static void getBluetoothState(TTBluetoothStateCallback stateCallback) {
    invoke(COMMAND_GET_BLUETOOTH_STATE, null, stateCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Initialize the lock
 * map {"lockMac": xxx, "lockVersion": xxx, "isInited": bool}
 */
  static void initLock(
      Map map, TTLockDataCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_INIT_LOCK, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Reset the lock
 */
  static void resetLock(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_LOCK, lockData, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Reset all eKeys
 */
  static void resetEkey(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_EKEY, lockData, callback, fail: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Function support
 */
  static void supportFunction(TTLockFuction fuction, String lockData,
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
    invoke(COMMAND_CONTROL_LOCK, map, callback, fail: failedCallback);
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
    invoke(COMMAND_CREATE_CUSTOM_PASSCODE, map, callback, fail: failedCallback);
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
      String passcodeNew,
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
    invoke(COMMAND_MODIFY_PASSCODE, map, callback, fail: failedCallback);
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
    invoke(COMMAND_DELETE_PASSCODE, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * All passcodes will be invalid except admin passcode
 */
  static void resetPasscode(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_PASSCODE, lockData, callback, fail: failedCallback);
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
        fail: failedCallback);
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
      List<TTCycleModel> cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddCardProgressCallback progressCallback,
      TTAddCardCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    invoke(COMMAND_ADD_CARD, map, callback,
        progress: progressCallback, fail: failedCallback);
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
      List<TTCycleModel> cycleList,
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
    invoke(COMMAND_MODIFY_CARD, map, callback, fail: failedCallback);
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
    invoke(COMMAND_DELETE_CARD, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all cards
 * 
 * lockData The lock data string used to operate lock
 */
  static void clearAllCards(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_ALL_CARD, lockData, callback, fail: failedCallback);
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
      List<TTCycleModel> cycleList,
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
        progress: progressCallback, fail: failedCallback);
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
      List<TTCycleModel> cycleList,
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
    invoke(COMMAND_MODIFY_FINGERPRINT, map, callback, fail: failedCallback);
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
    invoke(COMMAND_DELETE_FINGERPRINT, map, callback, fail: failedCallback);
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
        fail: failedCallback);
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
    invoke(COMMAND_MODIFY_ADMIN_PASSCODE, map, callback, fail: failedCallback);
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
    invoke(COMMAND_SET_LOCK_TIME, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock time
 * 
 * lockData The lock data string used to operate lock
 */
  static void getLockTime(String lockData, TTGetLockTimeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_TIME, lockData, callback, fail: failedCallback);
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
    invoke(COMMAND_GET_LOCK_OPERATE_RECORD, lockData, callback,
        fail: failedCallback);
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
    invoke(COMMAND_GET_LOCK_POWER, lockData, callback, fail: failedCallback);
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
        fail: failedCallback);
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
        fail: failedCallback);
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
        fail: failedCallback);
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
        fail: failedCallback);
  }

  static void getLockConfig(TTLockConfig config, String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_CONFIG, lockData, callback, fail: failedCallback);
  }

  static void setLockConfig(TTLockConfig config, bool isOn, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.index;
    invoke(COMMAND_SET_LOCK_CONFIG, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Config the lock passage mode. If config succeed,the lock will always be unlocked
 * 
 * type 
 * weekly Any number 1-7, 1 means Monday，2 means  Tuesday ,...,7 means Sunday, such as [1,3,6,7]. If type == TTPassageModeTypeMonthly, the weekly should be set null
 * monthly Any number from 1 to 31, such as @[@1,@13,@26,@31]. If type == TTPassageModeTypeWeekly, the monthly should be set null
 * startDate The time（millisecond） when it becomes valid
 * endDate The time（millisecond） when it is expired
 * lockData The lock data string used to operate lock
 */
  static void addPassageMode(
      TTPassageModeType type,
      List<int> weekly,
      List<int> monthly,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.passageModeType] = type.index;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    if (type == TTPassageModeType.weekly) {
      map[TTResponse.weekly] = weekly;
    } else {
      map[TTResponse.monthly] = monthly;
    }
    invoke(COMMAND_ADD_PASSAGE_MODE, map, callback, fail: failedCallback);
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
        fail: failedCallback);
  }

  static void activateElevatorFloors(String floors, String lockData,
      TTElevatorCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_ACTIVE_ELEVATOR_FLOORS, map, callback, fail: failedCallback);
  }

  static void setElevatorControlable(String floors, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_ELEVATOR_CONTROLABLE_FLOORS, map, callback,
        fail: failedCallback);
  }

  static void setElevatorWorkMode(
      TTElevatorWorkActivateType type,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map["elevatorWorkActiveType"] = type.index;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_ELEVATOR_WORK_MODE, map, callback, fail: failedCallback);
  }

  static void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["savePowerType"] = type;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_POWSER_SAVER_WORK_MODE, map, callback,
        fail: failedCallback);
  }

  static void setPowerSaverControlable(String lockMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();

    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_POWSER_SAVER_CONTROLABLE, map, callback,
        fail: failedCallback);
  }

  static void setNbAwakeModes(List<TTNbAwakeMode> modes, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    List list = new List();
    modes.forEach((element) {
      list.add(element.index);
    });

    Map map = Map();
    map[TTResponse.nbAwakeModes] = list;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_NB_AWAKE_MODES, map, callback, fail: failedCallback);
  }

  static void getNbAwakeModes(String lockData,
      TTGetNbAwakeModesCallback callback, TTFailedCallback failedCallback) {
    invoke(command_GET_NB_AWAKE_MODES, lockData, callback,
        fail: failedCallback);
  }

  static void setNbAwakeTimes(List<TTNbAwakeTimeModel> times, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    List list = new List();
    times.forEach((element) {
      Map map = new Map();
      map[TTResponse.minutes] = element.minutes;
      map[TTResponse.type] = element.type.index + 1;
      list.add(map);
    });

    Map map = Map();
    map[TTResponse.nbAwakeTimeList] = list;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_NB_AWAKE_TIMES, map, callback, fail: failedCallback);
  }

  static void getNBAwakeTimes(String lockData,
      TTGetNbAwakeTimesCallback callback, TTFailedCallback failedCallback) {
    invoke(command_GET_NB_AWAKE_TIMES, lockData, callback,
        fail: failedCallback);
  }

  static void setDoorSensorLockingSwitchState(bool isOn, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_DOOR_SENSOR_SWITCH, map, callback, fail: failedCallback);
  }

  static void getDoorSensorLockingSwitchState(String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    invoke(command_GET_DOOR_SENSOR_SWITCH, lockData, callback,
        fail: failedCallback);
  }

  static void setHotel(
      String hotelData,
      int building,
      int floor,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.hotelData] = hotelData;
    map[TTResponse.building] = building;
    map[TTResponse.floor] = floor;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_HOTLE_INOF, map, callback, fail: failedCallback);
  }

  static void setHotelCardSector(String sector, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.sector] = sector;
    map[TTResponse.lockData] = lockData;
    invoke(command_SET_HOTLE_CARD_SECTOR, map, callback, fail: failedCallback);
  }

  static void getDoorSensorState(String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    invoke(command_GET_DOOR_SENSOR_STATE, lockData, callback,
        fail: failedCallback);
  }

  static bool isListenEvent = false;

  static void invoke(String command, Object parameter, Object success,
      {Object progress, Object fail}) {
    if (!isListenEvent) {
      isListenEvent = true;
      _listenChannel
          .receiveBroadcastStream("TTLockListen")
          .listen(_onEvent, onError: _onError);
    }

    _callbackMap[command] = success;
    if (progress != null) {
      _progressCallbackMap[command] = progress;
    }
    if (fail != null) {
      _failCallbackMap[command] = fail;
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
    Object callBack = _callbackMap[command];
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

      case COMMAND_INIT_LOCK:
      case COMMAND_RESET_EKEY:
      case COMMAND_RESET_PASSCODE:
      case COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE:
        TTLockDataCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.lockData]);
        break;

      case COMMAND_CONTROL_LOCK:
      case COMMAND_ACTIVE_ELEVATOR_FLOORS:
        TTControlLockCallback controlLockCallback = callBack;
        controlLockCallback(data[TTResponse.lockTime],
            data[TTResponse.electricQuantity], data[TTResponse.uniqueId]);
        break;

      case COMMAND_RESET_PASSCODE:
        TTLockDataCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.lockData]);
        break;

      case COMMAND_ADD_CARD:
        TTAddCardCallback addCardCallback = callBack;
        addCardCallback(data[TTResponse.cardNumber]);
        break;

      case COMMAND_ADD_FINGERPRINT:
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
        getLockTimeCallback(data[TTResponse.lockTime]);
        break;

      case COMMAND_GET_LOCK_OPERATE_RECORD:
        TTGetLockOperateRecordCallback getLockOperateRecordCallback = callBack;
        getLockOperateRecordCallback(data[TTResponse.records]);
        break;

      case COMMAND_GET_LOCK_POWER:
        TTGetLockElectricQuantityCallback getLockElectricQuantityCallback =
            callBack;
        getLockElectricQuantityCallback(data[TTResponse.electricQuantity]);
        break;

      case COMMAND_FUNCTION_SUPPORT:
        TTFunctionSupportCallback functionSupportCallback = callBack;
        functionSupportCallback(data[TTResponse.isSupport]);
        break;
      case command_GET_NB_AWAKE_MODES:
        TTGetNbAwakeModesCallback getNbAwakeModesCallback = callBack;
        getNbAwakeModesCallback(data[TTResponse.nbAwakeModes]);
        break;

      case command_GET_NB_AWAKE_TIMES:
        TTGetNbAwakeTimesCallback getNbAwakeTimesCallback = callBack;
        List<Map> nbAwakeTimeList = data[TTResponse.nbAwakeTimeList];
        List<TTNbAwakeTimeModel> list = new List();

        nbAwakeTimeList.forEach((element) {
          TTNbAwakeTimeModel model = new TTNbAwakeTimeModel();
          model.minutes = element[TTResponse.minutes];
          model.type = TTNbAwakeTimeType.values[element[TTResponse.type]];
          list.add(model);
        });
        getNbAwakeTimesCallback(list);
        break;

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
        if (finished == false) {
          return;
        }
        break;

      case TTGateway.COMMAND_INIT_GATEWAY:
        TTGatewayInitCallback gatewayInitCallback = callBack;
        gatewayInitCallback(data);
        break;
      default:
        TTSuccessCallback successCallback = callBack;
        successCallback();
    }
    _progressCallbackMap.remove(command);
    _failCallbackMap.remove(command);
    if (command != COMMAND_START_SCAN_LOCK &&
        command != TTGateway.COMMAND_START_SCAN_GATEWAY) {
      _callbackMap.remove(command);
    }
  }

  static void _progressCallback(String command, Map data) {
    Object callBack = _progressCallbackMap[command];
    switch (command) {
      case COMMAND_ADD_CARD:
        TTAddCardProgressCallback progressCallback = callBack;
        progressCallback();
        break;
      case COMMAND_ADD_FINGERPRINT:
        TTAddFingerprintProgressCallback progressCallback = callBack;
        progressCallback(
            data[TTResponse.currentCount], data[TTResponse.totalCount]);
        break;
      default:
    }
  }

  static void _errorCallback(
      String command, int errorCode, String errorMessage) {
    if (errorCode == TTLockError.sdkIsBusy.index) {
      errorMessage =
          "The TTLock SDK can only communicate with one lock at a time";
    }

    if (command == TTGateway.COMMAND_GET_SURROUND_WIFI ||
        command == TTGateway.COMMAND_INIT_GATEWAY) {
      TTGatewayFailedCallback failedCallback = _failCallbackMap[command];
      TTGatewayError error = TTGatewayError.values[errorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    } else {
      TTFailedCallback failedCallback = _failCallbackMap[command];
      TTLockError error = TTLockError.values[errorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    }

    _failCallbackMap.remove(command);
    _callbackMap.remove(command);
    _progressCallbackMap.remove(command);
  }

  // 数据接收
  static void _onEvent(Object value) {
    if (printLog) {
      print('TTLock listen: $value');
    }

    Map map = value;

    String command = map[TTResponse.command];
    Map data = map[TTResponse.data];

    int resultState = map[TTResponse.resultState];

    if (resultState == TTLockReuslt.fail.index) {
      int errorCode = map[TTResponse.errorCode];
      String errorMessage = map[TTResponse.errorMessage];
      _errorCallback(command, errorCode, errorMessage);
    } else if (resultState == TTLockReuslt.progress.index) {
      //中间状态的回调（��加 IC卡、指��）
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

  static const String minTime = "minTime";
  static const String currentTime = "currentTime";
  static const String isOn = "isOn";
  static const String passageModeType = "passageModeType";
  static const String weekly = "weekly";
  static const String monthly = "monthly";

  static const String isSupport = "isSupport";
  static const String supportFunction = "supportFunction";

  static const String nbAwakeModes = "nbAwakeModes";
  static const String nbAwakeTimeList = "nbAwakeTimeList";
  static const String minutes = "minutes";
  static const String type = "type";
  static const String hotelData = "hotelData";
  static const String building = "building";
  static const String floor = "floor";
  static const String sector = "sector";
}

class TTLockScanModel {
  String lockName;
  String lockMac;
  bool isInited;
  bool isAllowUnlock;
  bool isDfuMode;
  int electricQuantity;
  String lockVersion;
  TTLockSwitchState lockSwitchState;
  int rssi;
  int oneMeterRssi;
  int timestamp;

  TTLockScanModel(Map map) {
    this.lockName = map[TTResponse.lockName];
    this.lockMac = map[TTResponse.lockMac];
    this.isInited = map[TTResponse.isInited];
    this.isAllowUnlock = map[TTResponse.isAllowUnlock];
    this.isDfuMode = map[TTResponse.isDfuMode];
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
  int weekDay;
  int startTime;
  int endTime;

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

enum TTBluetoothState {
  unknow,
  resetting,
  unsupported,
  unAuthorized,
  turnOff,
  turnOn
}

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
  privacyLock
}

enum TTLockError {
  reseted, //0
  crcError, //1
  noPermisstion,
  wrongAdminCode,
  noStorageSpace,
  inSettingMode, //5
  noAdmin,
  notInSettingMode,
  wrongDynamicCode,
  noPower,
  resetPasscode, //10
  unpdatePasscodeIndex,
  invalidLockFlagPos,
  ekeyExpired,
  passcodeLengthInvalid,
  samePasscodes, //15
  ekeyInactive,
  aesKey,
  fail,
  passcodeExist,
  passcodeNotExist, //20
  lackOfStorageSpaceWhenAddingPasscodes,
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
  bluetoothConnectTimeount,
  bluetoothDisconnection,
  sdkIsBusy, //35
  invalidLockData,
  invalidParameter,
  lockIsBusy
}

enum TTElevatorWorkActivateType { allFloors, specificFloors }

enum TTPowerSaverWorkType { allCards, hotelCard, roomCard }

enum TTNbAwakeMode { keypad, card, fingerprint }

enum TTNbAwakeTimeType { point, interval }

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
typedef TTGetLockTimeCallback = void Function(int lockTimestamp);

typedef TTGetLockPasscodeDataCallback = void Function(String passcodeData);
typedef TTGetLockAutomaticLockingPeriodicTimeCallback = void Function(
    int currentTime, int minTime, int maxTime);

typedef TTAddCardProgressCallback = void Function();
typedef TTAddCardCallback = void Function(String cardNumber);
typedef TTGetAllCardsCallback = void Function(List<Map> cardList);

typedef TTAddFingerprintProgressCallback = void Function(
    int currentCount, int totalCount);
typedef TTAddFingerprintCallback = void Function(String fingerprintNumber);
typedef TTGetAllFingerprintsCallback = void Function(
    List<String> fingerprintList);
typedef TTGetSwitchStateCallback = void Function(bool isOn);
typedef TTGetLockStatusCallback = void Function(TTLockSwitchState state);

typedef TTGatewayFailedCallback = void Function(
    TTGatewayError errorCode, String errorMsg);
typedef TTGatewayScanCallback = void Function(TTGatewayScanModel scanModel);
typedef TTGatewayConnectCallback = void Function(TTGatewayConnectStatus status);
typedef TTGatewayDisconnectCallback = void Function();
typedef TTGatewayGetAroundWifiCallback = void Function(
    bool finished, List wifiList);
typedef TTGatewayInitCallback = void Function(Map map);
typedef TTFunctionSupportCallback = void Function(bool isSupport);

typedef TTElevatorCallback = void Function(
    int lockTime, int electricQuantity, int uniqueId);

typedef TTGetNbAwakeModesCallback = void Function(List<TTNbAwakeMode> list);
typedef TTGetNbAwakeTimesCallback = void Function(
    List<TTNbAwakeTimeModel> list);

class TTGatewayScanModel {
  String gatewayName;
  String gatewayMac;
  int rssi;
  bool isDfuMode;

  TTGatewayScanModel(Map map) {
    this.gatewayName = map["gatewayName"];
    this.gatewayMac = map["gatewayMac"];
    this.rssi = map["rssi"];
    this.isDfuMode = map["isDfuMode"];
  }
}

class TTNbAwakeTimeModel {
  TTNbAwakeTimeType type;
  int minutes;
}

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
}

enum TTGatewayConnectStatus { timeout, success, faile }

enum TTLockFuction {
  passcode,
  icCard,
  fingerprint,
  wristband,
  autoLock,
  deletePasscode,
  // 6
  managePasscode,
  locking,
  passcodeVisible,
  gatewayUnlock,
  lockFreeze,
  cyclePassword,
  doorSensor,
  unlockSwicth,
  audioSwitch,
  nbIoT,
  //17
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
  //31
  deadLock,
  //33
  cyclicCardOrFingerprint
}
