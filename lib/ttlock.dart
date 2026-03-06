import 'dart:convert' as convert;

import 'package:ttlock_premise_flutter/src/ttlock_channel.dart';
import 'package:ttlock_premise_flutter/src/ttlock_commands.dart';
import 'package:ttlock_premise_flutter/src/tt_response.dart';
import 'package:ttlock_premise_flutter/src/ttlock_types.dart';
import 'package:ttlock_premise_flutter/ttlock_models.dart';

export 'package:ttlock_premise_flutter/src/tt_response.dart';
export 'package:ttlock_premise_flutter/src/ttlock_types.dart';

class TTLock {
  static bool get isOnPremise => TTLockChannel.isOnPremise;
  static set isOnPremise(bool v) => TTLockChannel.isOnPremise = v;

  static bool get printLog => TTLockChannel.printLog;
  static set printLog(bool v) => TTLockChannel.printLog = v;

  // ignore: slash_for_doc_comments
/**
   * Scan the smart lock being broadcast
   */
  static void startScanLock(TTLockScanCallback scanCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_START_SCAN_LOCK, null, scanCallback);
  }

  // ignore: slash_for_doc_comments
/**
   * Stop scan the smart lock being broadcast
   */
  static void stopScanLock() {
    TTLockChannel.invoke(TTLockCommands.COMMAND_STOP_SCAN_LOCK, null, null);
  }

  // ignore: slash_for_doc_comments
/**
   * Current Phone/Pad Bluetooth state
   */
  static void getBluetoothState(TTBluetoothStateCallback stateCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_BLUETOOTH_STATE, null, stateCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Initialize the lock
 * map {"lockMac": string, "lockVersion": string, "isInited": bool}
 */
  @Deprecated('Use initLockWithParams(TTLockInitParams params, ...) instead')
  static void initLock(
      Map map, TTLockDataCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_INIT_LOCK, map, callback, fail: failedCallback);
  }

  /// Initialize the lock with typed parameters.
  static void initLockWithParams(
      TTLockInitParams params, TTLockDataCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_INIT_LOCK, params.toMap(), callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Reset the lock
 */
  static void resetLock(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_RESET_LOCK, lockData, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Reset all eKeys
 */
  static void resetEkey(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_RESET_EKEY, lockData, callback, fail: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Function support
 */
  static void supportFunction(TTLockFuction fuction, String lockData,
      TTFunctionSupportCallback callback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.supportFunction] = fuction.value;
    TTLockChannel.invoke(TTLockCommands.COMMAND_FUNCTION_SUPPORT, map, callback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_CONTROL_LOCK, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_CREATE_CUSTOM_PASSCODE, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_MODIFY_PASSCODE, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_DELETE_PASSCODE, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * All passcodes will be invalid except admin passcode
 */
  static void resetPasscode(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_RESET_PASSCODE, lockData, callback, fail: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Get addmin passcode from lock 
 * 
 * lockData The lock data string used to operate lock
 */
  static void getAdminPasscode(String lockData,
      TTGetAdminPasscodeCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_ADMIN_PASSCODE, lockData, callback,
        fail: failedCallback);
  }

  static void setErasePasscode(String erasePasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.erasePasscode] = erasePasscode;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_ADMIN_ERASE_PASSCODE, map, callback,
        fail: failedCallback);
  }

  static void getAllValidPasscode(String lockData,
      TTGetAllPasscodeCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_ALL_VALID_PASSCODE, lockData, callback,
        fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_RECOVER_PASSCODE, map, callback, fail: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Get the lock switch state
 * 
 * lockData The lock data string used to operate lock
 */
  static void getLockSwitchState(String lockData,
      TTGetLockStatusCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_SWITCH_STATE, lockData, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_ADD_CARD, map, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_MODIFY_CARD, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_DELETE_CARD, map, callback, fail: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Get all valid cards
 * 
 * lockData The lock data string used to operate lock
 */
  static void getAllValidCards(String lockData, TTGetAllCardsCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_ALL_VALID_CARD, lockData, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all cards
 * 
 * lockData The lock data string used to operate lock
 */
  static void clearAllCards(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_CLEAR_ALL_CARD, lockData, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_RECOVER_CARD, map, callback, fail: failedCallback);
  }

  // static void reportLossCard(String cardNumber, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   Map map = Map();
  //   map[TTResponse.cardNumber] = cardNumber;
  //   map[TTResponse.lockData] = lockData;
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_REPORT_LOSS_CARD, map, callback, fail: failedCallback);
  // }

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
    TTLockChannel.invoke(TTLockCommands.COMMAND_ADD_FINGERPRINT, map, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_MODIFY_FINGERPRINT, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_DELETE_FINGERPRINT, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all fingerprints
 * 
 * lockData The lock data string used to operate lock
 */
  static void clearAllFingerprints(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_CLEAR_ALL_FINGERPRINT, lockData, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get all valid fingerprints
 * 
 * lockData The lock data string used to operate lock
 */
  static void getAllValidFingerprints(String lockData,
      TTGetAllFingerprintsCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_ALL_VALID_FINGERPRINT, lockData, callback,
        fail: failedCallback);
  }

  // static void getPasscodeVerificationParams(String lockData,
  //     TTLockDataCallback callback, TTFailedCallback failedCallback) {
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_GET_PASSCODE_VERIFICATION_PARAMS, lockData, callback,
  //       fail: failedCallback);
  // }

// ignore: slash_for_doc_comments
/**
 * Modify admin passcode
 * 
 * adminPasscode The new admin passcode is limited to 4 - 9 digits
 * lockData The lock data string used to operate lock
 */
  static void modifyAdminPasscode(String adminPasscode, String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.adminPasscode] = adminPasscode;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_MODIFY_ADMIN_PASSCODE, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LOCK_TIME, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock time
 * 
 * lockData The lock data string used to operate lock
 */
  static void getLockTime(String lockData, TTGetLockTimeCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_TIME, lockData, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_OPERATE_RECORD, map, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_POWER, lockData, callback, fail: failedCallback);
  }

  static void getLockSystemInfo(String lockData,
      TTGetLockSystemCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_SYSTEM_INFO, lockData, callback,
        fail: failedCallback);
  }

  static void getLockFeatureValue(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_FRETURE_VALUE, lockData, callback,
        fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME, lockData, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_AUTOMATIC_LOCK_PERIODIC_TIME, map, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE, lockData, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE, map, callback,
        fail: failedCallback);
  }

  static void getLockConfig(TTLockConfig config, String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.index;
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_CONFIG, map, callback, fail: failedCallback);
  }

  static void setLockConfig(TTLockConfig config, bool isOn, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.index;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LOCK_CONFIG, map, callback, fail: failedCallback);
  }

  static void setLockDirection(TTLockDirection direction, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.direction] = direction.index;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LOCK_DIRECTION, map, callback, fail: failedCallback);
  }

  static void getLockDirection(String lockData,
      TTGetLockDirectionCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_DIRECTION, lockData, callback,
        fail: failedCallback);
  }

  static void resetLockByCode(String lockMac, String resetCode,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.resetCode] = resetCode;
    TTLockChannel.invoke(TTLockCommands.COMMAND_RESET_LOCK_BY_CODE, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_ADD_PASSAGE_MODE, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all passage modes
 * 
 * lockData The lock data string used to operate lock
 */
  static void clearAllPassageModes(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_CLEAR_ALL_PASSAGE_MODE, lockData, callback,
        fail: failedCallback);
  }

  static void activateLift(String floors, String lockData,
      TTLiftCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_ACTIVE_LIFT_FLOORS, map, callback, fail: failedCallback);
  }

  static void setLiftControlable(String floors, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LIFT_CONTROLABLE_FLOORS, map, callback,
        fail: failedCallback);
  }

  static void setLiftWorkMode(TTLiftWorkActivateType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["liftWorkActiveType"] = type.index;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LIFT_WORK_MODE, map, callback, fail: failedCallback);
  }

  static void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["powerSaverType"] = type.index;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_POWSER_SAVER_WORK_MODE, map, callback,
        fail: failedCallback);
  }

  static void setPowerSaverControlableLock(String lockMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_POWSER_SAVER_CONTROLABLE, map, callback,
        fail: failedCallback);
  }

  // static void setLockNbAddress(
  //     String ip,
  //     String port,
  //     String lockData,
  //     TTGetLockElectricQuantityCallback callback,
  //     TTFailedCallback failedCallback) {
  //   Map map = Map();
  //   map[TTResponse.ip] = ip;
  //   map[TTResponse.port] = port;
  //   map[TTResponse.lockData] = lockData;
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_SET_NB_ADDRESS, map, callback, fail: failedCallback);
  // }

  // static void setNbAwakeModes(List<TTNbAwakeMode> modes, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   List list = [];
  //   modes.forEach((element) {
  //     list.add(element.index);
  //   });

  //   Map map = Map();
  //   map[TTResponse.nbAwakeModes] = list;
  //   map[TTResponse.lockData] = lockData;
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_SET_NB_AWAKE_MODES, map, callback, fail: failedCallback);
  // }

  // static void getNbAwakeModes(String lockData,
  //     TTGetNbAwakeModesCallback callback, TTFailedCallback failedCallback) {
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_GET_NB_AWAKE_MODES, lockData, callback,
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
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_SET_NB_AWAKE_TIMES, map, callback, fail: failedCallback);
  // }

  // static void getNBAwakeTimes(String lockData,
  //     TTGetNbAwakeTimesCallback callback, TTFailedCallback failedCallback) {
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_GET_NB_AWAKE_TIMES, lockData, callback,
  //       fail: failedCallback);
  // }

  // static void setDoorSensorLockingSwitchState(bool isOn, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   Map map = Map();
  //   map[TTResponse.isOn] = isOn;
  //   map[TTResponse.lockData] = lockData;
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_SET_DOOR_SENSOR_SWITCH, map, callback, fail: failedCallback);
  // }

  // static void getDoorSensorLockingSwitchState(String lockData,
  //     TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_GET_DOOR_SENSOR_SWITCH, lockData, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_HOTEL_INFO, map, callback, fail: failedCallback);
  }

  static void setHotelCardSector(String sector, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.sector] = sector;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_HOTEL_CARD_SECTOR, map, callback, fail: failedCallback);
  }

  // static void getDoorSensorState(String lockData,
  //     TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_GET_DOOR_SENSOR_STATE, lockData, callback,
  //       fail: failedCallback);
  // }

  static void getLockVersion(String lockMac, TTGetLockVersionCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_VERSION, map, callback, fail: failedCallback);
  }

  static void scanWifi(String lockData, TTWifiLockScanWifiCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_SCAN_WIFI, lockData, callback, fail: failedCallback);
  }

  static void configWifi(String wifiName, String wifiPassword, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.wifiName] = wifiName;
    map[TTResponse.wifiPassword] = wifiPassword;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_CONFIG_WIFI, map, callback, fail: failedCallback);
  }

  static void configServer(String ip, String port, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.ip] = ip;
    map[TTResponse.port] = port;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_CONFIG_SERVER, map, callback, fail: failedCallback);
  }

  static void getWifiInfo(String lockData,
      TTWifiLockGetWifiInfoCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_WIFI_INFO, lockData, callback, fail: failedCallback);
  }

  @Deprecated('Use configIpWithParams(TTIpSetting ipSetting, String lockData, ...) instead')
  static void configIp(
    Map map,
    String lockData,
    TTSuccessCallback callback,
    TTFailedCallback failedCallback,
  ) {
    map[TTResponse.lockData] = lockData;
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(map);
    TTLockChannel.invoke(TTLockCommands.COMMAND_CONFIG_IP, map, callback, fail: failedCallback);
  }

  /// Configure lock IP with typed parameters.
  static void configIpWithParams(
    TTIpSetting ipSetting,
    String lockData,
    TTSuccessCallback callback,
    TTFailedCallback failedCallback,
  ) {
    final map = Map<String, dynamic>.from(ipSetting.toMap());
    map[TTResponse.lockData] = lockData;
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(ipSetting.toMap());
    TTLockChannel.invoke(TTLockCommands.COMMAND_CONFIG_IP, map, callback, fail: failedCallback);
  }

  static void configCameraLockWifi(
    String wifiName, String wifiPassword, String lockData,
    TTCameraLockConfigWifiCallback callback,
    TTFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.wifiName] = wifiName;
    map[TTResponse.wifiPassword] = wifiPassword;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_CONFIG_CAMERA_LOCK_WIFI, map, callback, fail: failedCallback);
  }

  static void setLockSoundWithSoundVolume(
      TTSoundVolumeType type,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map["soundVolumeType"] = type.index;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LOCK_SOUND_WITH_SOUND_VOLUME, map, callback,
        fail: failedCallback);
  }

  static void getLockSoundWithSoundVolume(
      String lockData,
      TTGetLockSoundWithSoundVolumeCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME, lockData, callback,
        fail: failedCallback);
  }

  // static void setNBServerInfo(String nbServerAddress, int nbServerPort, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   Map map = Map();
  //   map[TTResponse.nbServerAddress] = nbServerAddress;
  //   map[TTResponse.nbServerPort] = nbServerPort;
  //   map[TTResponse.lockData] = lockData;
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_SET_NB_SERVER_INFO, map, callback, fail: failedCallback);
  // }

  // static void getAdminPasscode(String lockData, TTGetAdminPasscodeCallback callback, TTFailedCallback failedCallback) {
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_GET_ADMIN_PASSCODE, lockData, callback,
  //       fail: failedCallback);
  // }
  //
  // static void getLockSystemInfo(String lockData, TTGetLockSystemInfoCallback callback, TTFailedCallback failedCallback) {
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_SYSTEM_INFO, lockData, callback,
  //       fail: failedCallback);
  // }
  //
  // static void getPasscodeVerificationParams(String lockData, TTGetPasscodeVerificationParamsCallback callback, TTFailedCallback failedCallback) {
  //   TTLockChannel.invoke(TTLockCommands.COMMAND_GET_PASSCODE_VERIFICATION_PARAMS, lockData, callback,
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_ADD_LOCK_REMOTE_KEY, map, callback, fail: failedCallback);
  }

  static void deleteRemoteKey(String remoteKeyMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = remoteKeyMac;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_DELETE_LOCK_REMOTE_KEY, map, callback, fail: failedCallback);
  }

  static void clearRemoteKey(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_CLEAR_REMOTE_KEY, lockData, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LOCK_REMOTE_KEY_VALID_DATE, map, callback,
        fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY, map, callback,
        fail: failedCallback);
  }

  static void addDoorSensor(String doorSensorMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = doorSensorMac;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_ADD_LOCK_DOOR_SENSORY, map, callback, fail: failedCallback);
  }

  static void deleteDoorSensor(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_DELETE_LOCK_DOOR_SENSORY, lockData, callback,
        fail: failedCallback);
  }

  static void setDoorSensorAlertTime(String lockData, int alertTime,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.alertTime] = alertTime;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LOCK_DOOR_SENSORY_ALERT_TIME, map, callback,
        fail: failedCallback);
  }

  static void setLockEnterUpgradeMode(String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_LOCK_ENTER_UPGRADE_MODE, lockData, callback,
        fail: failedCallback);
  }

  static void verifyLock(String lockMac, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.lockMac] = lockMac;
    TTLockChannel.invoke(TTLockCommands.COMMAND_VERIFY_LOCK, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_ADD_FACE, map, callback,
        progress: progressCallback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_ADD_FACE_DATA, map, callback, fail: failedCallback);
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
    TTLockChannel.invoke(TTLockCommands.COMMAND_MODIFY_FACE, map, callback, fail: failedCallback);
  }

  static void clearFace(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTLockCommands.COMMAND_CLEAR_FACE, map, callback, fail: failedCallback);
  }

  static void deleteFace(String faceNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.faceNumber] = faceNumber;
    TTLockChannel.invoke(TTLockCommands.COMMAND_DELETE_FACE, map, callback, fail: failedCallback);
  }
  
  static void setSensitivity(String lockData, TTSensitivityValue value, TTSuccessCallback callback,
      TTFailedCallback failedCallback)
  {
    Map map = new Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.sensitivityValue] = value.value;
    TTLockChannel.invoke(TTLockCommands.COMMAND_SET_SENSITIVITY, map, callback, fail: failedCallback);
  }

}
