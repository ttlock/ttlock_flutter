import 'package:flutter/services.dart';
import 'package:ttlock_premise_flutter/src/constants/commands.dart';
import 'package:ttlock_premise_flutter/models/scan_models.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/enums.dart';
import 'dart:convert' as convert;

// 供仅 import ttlock_classic 的调用方使用
export 'package:ttlock_premise_flutter/models/scan_models.dart';
export 'package:ttlock_premise_flutter/models/lock_models.dart';
export 'package:ttlock_premise_flutter/models/enums.dart';

@Deprecated('Use TTLock from package:ttlock_premise_flutter/ttlock.dart and TTLock.lock / TTLock.gateway / TTLock.accessory instead.')
class TTLock {
  static bool isOnPremise = true;

  static MethodChannel _commandChannel =
      MethodChannel("com.ttlock/command/ttlock");
  static EventChannel _listenChannel = EventChannel("com.ttlock/listen/ttlock");

  static const String CALLBACK_SUCCESS = "callback_success";
  static const String CALLBACK_PROGRESS = "callback_progress";
  static const String CALLBACK_FAIL = "callback_fail";
  static const String CALLBACK_OTHER_FAIL = "callback_other_fail";

  static List _commandQueue = [];

  static bool printLog = true;

  static T _safeFromValue<T>(List<T> values, int code, T defaultVal) {
    for (final e in values) {
      if ((e as dynamic).value == code) return e;
    }
    return defaultVal;
  }

  /// Scan the smart lock being broadcast
  @Deprecated('Use TTLock.lock.startScanLock() and listen to the stream instead.')
  static void startScanLock(TTLockScanCallback scanCallback) {
    invoke(TTCommands.startScanLock, null, scanCallback);
  }

  /// Stop scan the smart lock being broadcast
  @Deprecated('Use TTLock.lock.stopScanLock() instead.')
  static void stopScanLock() {
    invoke(TTCommands.stopScanLock, null, null);
  }

  /// Current Phone/Pad Bluetooth state
  @Deprecated('Use TTLock.lock.getBluetoothState() instead.')
  static void getBluetoothState(TTBluetoothStateCallback stateCallback) {
    invoke(TTCommands.getBluetoothState, null, stateCallback);
  }

  /// Initialize the lock. map {"lockMac": string, "lockVersion": string, "isInited": bool}
  @Deprecated('Use TTLock.lock.initLock(TTLockInitParams) instead.')
  static void initLock(
      Map map, TTLockDataCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.initLock, map, callback, fail: failedCallback);
  }

  /// Reset the lock
  @Deprecated('Use TTLock.lock.resetLock(lockData) instead.')
  static void resetLock(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.resetLock, lockData, callback, fail: failedCallback);
  }

  /// Reset all eKeys
  @Deprecated('Use TTLock.lock.resetEkey(lockData) instead.')
  static void resetEkey(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.resetEkey, lockData, callback, fail: failedCallback);
  }

  /// Function support
  @Deprecated('Use TTLock.lock.supportFunction(function, lockData) instead.')
  static void supportFunction(TTLockFuction fuction, String lockData,
      TTFunctionSupportCallback callback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.supportFunction] = fuction.value;
    invoke(TTCommands.functionSupport, map, callback);
  }

  /// Lock or unlock the lock
  @Deprecated('Use TTLock.lock.controlLock(lockData, action) instead.')
  static void controlLock(String lockData, TTControlAction controlAction,
      TTControlLockCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.controlAction] = controlAction.value;
    invoke(TTCommands.controlLock, map, callback, fail: failedCallback);
  }

  /// Create custom passcode (4-9 digits). startDate/endDate in millisecond.
  @Deprecated('Use TTLock.lock.createCustomPasscode(...) instead.')
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
    invoke(TTCommands.createCustomPasscode, map, callback, fail: failedCallback);
  }

  /// Modify passcode or passcode valid date
  @Deprecated('Use TTLock.lock.modifyPasscode(...) instead.')
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
    invoke(TTCommands.modifyPasscode, map, callback, fail: failedCallback);
  }

  /// Delete passcode
  @Deprecated('Use TTLock.lock.deletePasscode(passcode: passcode, lockData: lockData) instead.')
  static void deletePasscode(String passcode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.passcode] = passcode;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.deletePasscode, map, callback, fail: failedCallback);
  }

  /// All passcodes will be invalid except admin passcode
  @Deprecated('Use TTLock.lock.resetPasscode(lockData) instead.')
  static void resetPasscode(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.resetPasscodes, lockData, callback, fail: failedCallback);
  }

  /// Get admin passcode from lock
  @Deprecated('Use TTLock.lock.getAdminPasscode(lockData) instead.')
  static void getAdminPasscode(String lockData,
      TTGetAdminPasscodeCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.getAdminPasscode, lockData, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setErasePasscode(erasePasscode: ..., lockData: ...) instead.')
  static void setErasePasscode(String erasePasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.erasePasscode] = erasePasscode;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setAdminErasePasscode, map, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.getAllValidPasscodes(lockData) instead.')
  static void getAllValidPasscode(String lockData,
      TTGetAllPasscodeCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.getAllValidPasscode, lockData, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.recoverPasscode(...) instead.')
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
    map[TTResponse.type] = type.value;
    map["cycleType"] = cycleType;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    invoke(TTCommands.recoverPasscode, map, callback, fail: failedCallback);
  }

  /// Get the lock switch state
  @Deprecated('Use TTLock.lock.getLockSwitchState(lockData) instead.')
  static void getLockSwitchState(String lockData,
      TTGetLockStatusCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.getLockSwitchState, lockData, callback,
        fail: failedCallback);
  }

  /// Add a card. cycleList optional for cyclic card.
  @Deprecated('Use TTLock.lock.addCard(...) and listen to the stream instead.')
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
      map[TTResponse.cycleJsonList] = TTCycleModel.encodeList(cycleList);
    }
    invoke(TTCommands.addCard, map, callback,
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
  @Deprecated('Use TTLock.lock.modifyCardValidityPeriod(...) instead.')
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
      map[TTResponse.cycleJsonList] = TTCycleModel.encodeList(cycleList);
    }
    invoke(TTCommands.modifyCard, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Delete the card
 * 
 * cardNumber The card number you want to delete
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.deleteCard(cardNumber: ..., lockData: ...) instead.')
  static void deleteCard(String cardNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.cardNumber] = cardNumber;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.deleteCard, map, callback, fail: failedCallback);
  }

  // ignore: slash_for_doc_comments
/**
 * Get all valid cards
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.getAllValidCards(lockData) instead.')
  static void getAllValidCards(String lockData, TTGetAllCardsCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.getAllValidCards, lockData, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all cards
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.clearAllCards(lockData) instead.')
  static void clearAllCards(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.clearAllCards, lockData, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.recoverCard(...) instead.')
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
    invoke(TTCommands.recoverCard, map, callback, fail: failedCallback);
  }

  // static void reportLossCard(String cardNumber, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   Map map = Map();
  //   map[TTResponse.cardNumber] = cardNumber;
  //   map[TTResponse.lockData] = lockData;
  //   invoke(TTCommands.reportLossCard, map, callback, fail: failedCallback);
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
  @Deprecated('Use TTLock.lock.addFingerprint(...) and listen to the stream instead.')
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
      map[TTResponse.cycleJsonList] = TTCycleModel.encodeList(cycleList);
    }
    invoke(TTCommands.addFingerprint, map, callback,
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
  @Deprecated('Use TTLock.lock.modifyFingerprintValidityPeriod(...) instead.')
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
      map[TTResponse.cycleJsonList] = TTCycleModel.encodeList(cycleList);
    }
    invoke(TTCommands.modifyFingerprint, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Delete the fingerprint
 * 
 * cardNumber The fingerprint number you want to delete
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.deleteFingerprint(fingerprintNumber: ..., lockData: ...) instead.')
  static void deleteFingerprint(String fingerprintNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.fingerprintNumber] = fingerprintNumber;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.deleteFingerprint, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all fingerprints
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.clearAllFingerprints(lockData) instead.')
  static void clearAllFingerprints(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.clearAllFingerprints, lockData, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get all valid fingerprints
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.getAllValidFingerprints(lockData) instead.')
  static void getAllValidFingerprints(String lockData,
      TTGetAllFingerprintsCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.getAllValidFingerprints, lockData, callback,
        fail: failedCallback);
  }

  // static void getPasscodeVerificationParams(String lockData,
  //     TTLockDataCallback callback, TTFailedCallback failedCallback) {
  //   invoke(TTCommands.getPasscodeVerificationParams, lockData, callback,
  //       fail: failedCallback);
  // }

// ignore: slash_for_doc_comments
/**
 * Modify admin passcode
 * 
 * adminPasscode The new admin passcode is limited to 4 - 9 digits
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.modifyAdminPasscode(adminPasscode: ..., lockData: ...) instead.')
  static void modifyAdminPasscode(String adminPasscode, String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.adminPasscode] = adminPasscode;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.modifyAdminPasscode, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock time
 * 
 * timestamp A timestamp（millisecond）
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.setLockTime(timestamp: ..., lockData: ...) instead.')
  static void setLockTime(int timestamp, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.timestamp] = timestamp;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setLockTime, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock time
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.getLockTime(lockData) instead.')
  static void getLockTime(String lockData, TTGetLockTimeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.getLockTime, lockData, callback, fail: failedCallback);
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
  @Deprecated('Use TTLock.lock.getLockOperateRecord(type: ..., lockData: ...) instead.')
  static void getLockOperateRecord(
      TTOperateRecordType type,
      String lockData,
      TTGetLockOperateRecordCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map["logType"] = type.value;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.getLockOperateRecord, map, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock power
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.getLockPower(lockData) instead.')
  static void getLockPower(
      String lockData,
      TTGetLockElectricQuantityCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.getLockPower, lockData, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.getLockSystemInfo(lockData) instead.')
  static void getLockSystemInfo(String lockData,
      TTGetLockSystemCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.getLockSystemInfo, lockData, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.getLockFeatureValue(lockData) instead.')
  static void getLockFeatureValue(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.getLockFeatureValue, lockData, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock automatic locking periodic time
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.getAutoLockingPeriodicTime(lockData) instead.')
  static void getLockAutomaticLockingPeriodicTime(
      String lockData,
      TTGetLockAutomaticLockingPeriodicTimeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.getAutoLockTime, lockData, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock automatic locking periodic time
 * 
 * time (sec)
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.setAutoLockingPeriodicTime(seconds: ..., lockData: ...) instead.')
  static void setLockAutomaticLockingPeriodicTime(int time, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.currentTime] = time;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setAutoLockTime, map, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock remote unlock switch
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.getRemoteUnlockSwitchState(lockData) instead.')
  static void getLockRemoteUnlockSwitchState(String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.getRemoteUnlockSwitch, lockData, callback,
        fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock remote unlock switch state
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.setRemoteUnlockSwitchState(isOn: ..., lockData: ...) instead.')
  static void setLockRemoteUnlockSwitchState(bool isOn, String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setRemoteUnlockSwitch, map, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.getLockConfig(config: ..., lockData: ...) instead.')
  static void getLockConfig(TTLockConfig config, String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.value;
    invoke(TTCommands.getLockConfig, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setLockConfig(config: ..., isOn: ..., lockData: ...) instead.')
  static void setLockConfig(TTLockConfig config, bool isOn, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.value;
    invoke(TTCommands.setLockConfig, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setLockDirection(direction: ..., lockData: ...) instead.')
  static void setLockDirection(TTLockDirection direction, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.direction] = direction.value;
    invoke(TTCommands.setLockDirection, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.getLockDirection(lockData) instead.')
  static void getLockDirection(String lockData,
      TTGetLockDirectionCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.getLockDirection, lockData, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.resetLockByCode(lockMac: ..., resetCode: ...) instead.')
  static void resetLockByCode(String lockMac, String resetCode,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.resetCode] = resetCode;
    invoke(TTCommands.resetLockByCode, map, callback, fail: failedCallback);
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
  @Deprecated('Use TTLock.lock.addPassageMode(...) instead.')
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
    map[TTResponse.passageModeType] = type.value;
    map[TTResponse.startDate] = startTime;
    map[TTResponse.endDate] = endTime;
    map[TTResponse.lockData] = lockData;
    if (type == TTPassageModeType.weekly) {
      map[TTResponse.weekly] = weekly;
    } else {
      map[TTResponse.monthly] = monthly;
    }
    invoke(TTCommands.addPassageMode, map, callback, fail: failedCallback);
  }

// ignore: slash_for_doc_comments
/**
 * Clear all passage modes
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.clearAllPassageModes(lockData) instead.')
  static void clearAllPassageModes(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.clearAllPassageModes, lockData, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.activateLift(floors: ..., lockData: ...) instead.')
  static void activateLift(String floors, String lockData,
      TTLiftCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.activateLift, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setLiftControlable(floors: ..., lockData: ...) instead.')
  static void setLiftControlable(String floors, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setLiftControlable, map, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setLiftWorkMode(type: ..., lockData: ...) instead.')
  static void setLiftWorkMode(TTLiftWorkActivateType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["liftWorkActiveType"] = type.value;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setLiftWorkMode, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setPowerSaverWorkMode(type: ..., lockData: ...) instead.')
  static void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["powerSaverType"] = type.value;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setPowerSaverWorkMode, map, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setPowerSaverControlableLock(lockMac: ..., lockData: ...) instead.')
  static void setPowerSaverControlableLock(String lockMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setPowerSaverControlable, map, callback,
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
  //   invoke(TTCommands.setNBServerAddress, map, callback, fail: failedCallback);
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
  //   invoke(TTCommands.setNBAwakeModes, map, callback, fail: failedCallback);
  // }

  // static void getNbAwakeModes(String lockData,
  //     TTGetNbAwakeModesCallback callback, TTFailedCallback failedCallback) {
  //   invoke(TTCommands.getNBAwakeModes, lockData, callback,
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
  //   invoke(TTCommands.setNBAwakeTimes, map, callback, fail: failedCallback);
  // }

  // static void getNBAwakeTimes(String lockData,
  //     TTGetNbAwakeTimesCallback callback, TTFailedCallback failedCallback) {
  //   invoke(TTCommands.getNBAwakeTimes, lockData, callback,
  //       fail: failedCallback);
  // }

  // static void setDoorSensorLockingSwitchState(bool isOn, String lockData,
  //     TTSuccessCallback callback, TTFailedCallback failedCallback) {
  //   Map map = Map();
  //   map[TTResponse.isOn] = isOn;
  //   map[TTResponse.lockData] = lockData;
  //   invoke(TTCommands.setDoorSensorSwitch, map, callback, fail: failedCallback);
  // }

  // static void getDoorSensorLockingSwitchState(String lockData,
  //     TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
  //   invoke(TTCommands.getDoorSensorSwitch, lockData, callback,
  //       fail: failedCallback);
  // }

  @Deprecated('Use TTLock.lock.setHotel(...) instead.')
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
    invoke(TTCommands.setHotelInfo, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setHotelCardSector(sector: ..., lockData: ...) instead.')
  static void setHotelCardSector(String sector, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.sector] = sector;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setHotelCardSector, map, callback, fail: failedCallback);
  }

  // static void getDoorSensorState(String lockData,
  //     TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
  //   invoke(TTCommands.getDoorSensorState, lockData, callback,
  //       fail: failedCallback);
  // }

  @Deprecated('Use TTLock.lock.getLockVersion(lockMac) instead.')
  static void getLockVersion(String lockMac, TTGetLockVersionCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    invoke(TTCommands.getLockVersion, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.scanWifi(lockData) and listen to the stream instead.')
  static void scanWifi(String lockData, TTWifiLockScanWifiCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.scanWifi, lockData, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.configWifi(wifiName: ..., wifiPassword: ..., lockData: ...) instead.')
  static void configWifi(String wifiName, String wifiPassword, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.wifiName] = wifiName;
    map[TTResponse.wifiPassword] = wifiPassword;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.configWifi, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.configServer(ip: ..., port: ..., lockData: ...) instead.')
  static void configServer(String ip, String port, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.ip] = ip;
    map[TTResponse.port] = port;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.configServer, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.getWifiInfo(lockData) instead.')
  static void getWifiInfo(String lockData,
      TTWifiLockGetWifiInfoCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.getWifiInfo, lockData, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.configIp(ipSetting: TTIpSetting(...), lockData: ...) instead.')
  static void configIp(
    Map map,
    String lockData,
    TTSuccessCallback callback,
    TTFailedCallback failedCallback,
  ) {
    map[TTResponse.lockData] = lockData;
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(map);
    TTLock.invoke(TTCommands.configIp, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setSoundVolume(type: ..., lockData: ...) instead.')
  static void setLockSoundWithSoundVolume(
      TTSoundVolumeType type,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map["soundVolumeType"] = type.value;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setSoundVolume, map, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.getSoundVolume(lockData) instead.')
  static void getLockSoundWithSoundVolume(
      String lockData,
      TTGetLockSoundWithSoundVolumeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.getSoundVolume, lockData, callback,
        fail: failedCallback);
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
  //   invoke(TTCommands.getAdminPasscode, lockData, callback,
  //       fail: failedCallback);
  // }
  //
  // static void getLockSystemInfo(String lockData, TTGetLockSystemInfoCallback callback, TTFailedCallback failedCallback) {
  //   invoke(TTCommands.getLockSystemInfo, lockData, callback,
  //       fail: failedCallback);
  // }
  //
  // static void getPasscodeVerificationParams(String lockData, TTGetPasscodeVerificationParamsCallback callback, TTFailedCallback failedCallback) {
  //   invoke(TTCommands.getPasscodeVerificationParams, lockData, callback,
  //       fail: failedCallback);
  // }

  @Deprecated('Use TTLock.lock.addRemoteKey(...) instead.')
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
        cycleList == null ? null : TTCycleModel.encodeList(cycleList);
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.addRemoteKey, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.deleteRemoteKey(remoteKeyMac: ..., lockData: ...) instead.')
  static void deleteRemoteKey(String remoteKeyMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = remoteKeyMac;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.deleteRemoteKey, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.clearRemoteKey(lockData) instead.')
  static void clearRemoteKey(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.clearRemoteKey, lockData, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setRemoteKeyValidDate(...) instead.')
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
        cycleList == null ? null : TTCycleModel.encodeList(cycleList);
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setRemoteKeyValidDate, map, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.getAccessoryElectricQuantity(...) instead.')
  static void getRemoteAccessoryElectricQuantity(
      TTRemoteAccessory remoteAccessory,
      String remoteAccessoryMac,
      String lockData,
      TTGetLockAccessoryElectricQuantity callback,
      TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.remoteAccessory] = remoteAccessory.value;
    map[TTResponse.mac] = remoteAccessoryMac;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.getAccessoryElectricQuantity, map, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.addDoorSensor(doorSensorMac: ..., lockData: ...) instead.')
  static void addDoorSensor(String doorSensorMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = doorSensorMac;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.addDoorSensor, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.deleteDoorSensor(lockData) instead.')
  static void deleteDoorSensor(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(TTCommands.deleteDoorSensor, lockData, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setDoorSensorAlertTime(lockData: ..., alertTime: ...) instead.')
  static void setDoorSensorAlertTime(String lockData, int alertTime,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.alertTime] = alertTime;
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.setDoorSensorAlertTime, map, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.setLockEnterUpgradeMode(lockData) instead.')
  static void setLockEnterUpgradeMode(String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    invoke(TTCommands.setLockEnterUpgradeMode, lockData, callback,
        fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.verifyLock(lockMac) instead.')
  static void verifyLock(String lockMac, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.lockMac] = lockMac;
    invoke(TTCommands.verifyLock, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.addFace(...) and listen to the stream instead.')
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
      map[TTResponse.cycleJsonList] = TTCycleModel.encodeList(cycleList);
    }
    invoke(TTCommands.addFace, map, callback,
        progress: progressCallback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.addFaceData(...) instead.')
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
      map[TTResponse.cycleJsonList] = TTCycleModel.encodeList(cycleList);
    }
    invoke(TTCommands.addFaceData, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.modifyFace(...) instead.')
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
      map[TTResponse.cycleJsonList] = TTCycleModel.encodeList(cycleList);
    }
    invoke(TTCommands.modifyFace, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.clearFace(lockData) instead.')
  static void clearFace(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    invoke(TTCommands.clearFace, map, callback, fail: failedCallback);
  }

  @Deprecated('Use TTLock.lock.deleteFace(faceNumber: ..., lockData: ...) instead.')
  static void deleteFace(String faceNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.faceNumber] = faceNumber;
    invoke(TTCommands.deleteFace, map, callback, fail: failedCallback);
  }

  // enum TTSensitivityValue {
//   off = 0,
//   low = 1,
//   medium = 2,
//   high = 3,
// };
  @Deprecated('Use TTLock.lock.setSensitivity(value: TTSensitivityValue, lockData: ...) instead.')
  static void setSensitivity(String lockData, int value, TTSuccessCallback callback,
      TTFailedCallback failedCallback)
  {
    Map map = new Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.sensitivityValue] = value;
    invoke(TTCommands.setSensitivity, map, callback, fail: failedCallback);
  }

  static bool isListenEvent = false;
  static var scanCommandList = [
    TTCommands.startScanLock,
    TTCommands.stopScanLock,
    TTCommands.startScanGateway,
    TTCommands.stopScanGateway,
    TTCommands.startScanDoorSensor,
    TTCommands.stopScanDoorSensor,
    TTCommands.startScanRemoteKey,
    TTCommands.stopScanRemoteKey,
    TTCommands.startScanRemoteKeypad,
    TTCommands.stopScanRemoteKeypad,
  ];

  static void invoke(String command, Object? parameter, Object? success,
      {Object? progress, Object? fail,
        //TODO 多功能键盘会有键盘错误，用这个表示
        Object? otherFail
      }) {
    if (!isListenEvent) {
      isListenEvent = true;
      _listenChannel
          .receiveBroadcastStream("TTLockListen")
          .listen(_onEvent, onError: _onError);
    }

    //开始、停止扫描的时候  清空之前所有的扫描回调
    scanCommandList.forEach((scanCommand) {
      if (command.compareTo(scanCommand) == 0) {
        List removeMapList = [];
        _commandQueue.forEach((map) {
          String key = map.keys.first;
          if (key.compareTo(TTCommands.startScanLock) == 0 ||
              key.compareTo(TTCommands.startScanGateway) == 0 ||
              key.compareTo(TTCommands.startScanRemoteKey) == 0 ||
              key.compareTo(TTCommands.startScanRemoteKeypad) == 0 ||
              key.compareTo(TTCommands.startScanDoorSensor) == 0) {
            removeMapList.add(map);
          }
        });
        removeMapList.forEach((map) {
          _commandQueue.remove(map);
        });
      }
    });

    if (command == TTCommands.stopScanLock ||
        command == TTCommands.stopScanGateway ||
        command == TTCommands.stopScanRemoteKey ||
        command == TTCommands.stopScanRemoteKeypad ||
        command == TTCommands.stopScanDoorSensor) {
    } else {
      Map commandMap = new Map();
      Map callbackMap = new Map();
      callbackMap[CALLBACK_SUCCESS] = success;
      callbackMap[CALLBACK_PROGRESS] = progress;
      callbackMap[CALLBACK_FAIL] = fail;
      callbackMap[CALLBACK_OTHER_FAIL] = otherFail;
      commandMap[command] = callbackMap;
      _commandQueue.add(commandMap);
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
    dynamic callBack;
    int index = -1;
    for (var i = 0; i < _commandQueue.length; i++) {
      Map map = _commandQueue[i];
      String key = map.keys.first;
      if (key.compareTo(command) == 0) {
        callBack = map[command][CALLBACK_SUCCESS];
        index = i;
        break;
      }
    }
    //如果是 网关扫描、锁扫描、网关获取附近wifi 需要特殊处理
    bool reomveCommand = true;
    if (index == -1) {
      reomveCommand = false;
    } else {
      if (command == TTCommands.startScanLock ||
          command == TTCommands.startScanGateway ||
          command == TTCommands.startScanRemoteKey ||
          command == TTCommands.startScanRemoteKeypad ||
          command == TTCommands.startScanDoorSensor) {
        reomveCommand = false;
      }
      if (command == TTCommands.scanWifi && data[TTResponse.finished] == false) {
        reomveCommand = false;
      }
      if (command == TTCommands.getSurroundWifi &&
          data[TTResponse.finished] == false) {
        reomveCommand = false;
      }
    }
    if (reomveCommand) {
      _commandQueue.removeAt(index);
    }

    if (callBack == null) {
      if (printLog) {
        print(
            "********************************************  $command callback null *********************************************");
      }
      return;
    }
    switch (command) {
      case TTCommands.getBluetoothState:
        int stateValue = data[TTResponse.state];
        TTBluetoothState state = TTBluetoothState.fromValue(stateValue);
        TTBluetoothStateCallback stateCallback = callBack;
        stateCallback(state);
        break;

      case TTCommands.startScanLock:
        TTLockScanCallback scanCallback = callBack;
        scanCallback(TTLockScanModel.fromMap(Map<String, dynamic>.from(data)));
        break;

      case TTCommands.startScanGateway:
        TTGatewayScanCallback scanCallback = callBack;
        scanCallback(TTGatewayScanModel.fromMap(Map<String, dynamic>.from(data)));
        break;

      case TTCommands.startScanRemoteKey:
      case TTCommands.startScanRemoteKeypad:
      case TTCommands.startScanDoorSensor:
        TTRemoteAccessoryScanCallback scanCallback = callBack;
        scanCallback(TTRemoteAccessoryScanModel.fromMap(Map<String, dynamic>.from(data)));
        break;

      case TTCommands.getAutoLockTime:
        TTGetLockAutomaticLockingPeriodicTimeCallback
            getLockAutomaticLockingPeriodicTimeCallback = callBack;
        getLockAutomaticLockingPeriodicTimeCallback(
            data[TTResponse.currentTime],
            data[TTResponse.minTime],
            data[TTResponse.maxTime]);
        break;

      case TTCommands.getRemoteUnlockSwitch:
      case TTCommands.getLockConfig:
        TTGetSwitchStateCallback switchStateCallback = callBack;
        switchStateCallback(data[TTResponse.isOn]);
        break;
      case TTCommands.getLockDirection:
        TTGetLockDirectionCallback lockDirectionCallback = callBack;
        int direction = data[TTResponse.direction];
        lockDirectionCallback(TTLockDirection.fromValue(direction));
        break;
      case TTCommands.getLockSystemInfo:
      case TTCommands.initRemoteKey:
      case TTCommands.initDoorSensor:
        TTGetLockSystemCallback getLockSystemCallback = callBack;
        getLockSystemCallback(TTLockSystemModel.fromMap(Map<String, dynamic>.from(data)));
        break;

      case TTCommands.initLock:
      case TTCommands.resetEkey:
      case TTCommands.resetPasscodes:
      case TTCommands.setRemoteUnlockSwitch:
      case TTCommands.getPasscodeVerificationParams:
        TTLockDataCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.lockData]);
        break;

      case TTCommands.controlLock:
        TTControlLockCallback controlLockCallback = callBack;
        controlLockCallback(data[TTResponse.lockTime],
            data[TTResponse.electricQuantity], data[TTResponse.uniqueId]);
        break;

      case TTCommands.activateLift:
        TTLiftCallback liftCallback = callBack;
        liftCallback(data[TTResponse.lockTime],
            data[TTResponse.electricQuantity], data[TTResponse.uniqueId]);
        break;

      case TTCommands.resetPasscodes:
      case TTCommands.modifyAdminPasscode:
        if (isOnPremise) {
          TTLockDataCallback lockDataCallback = callBack;
          lockDataCallback(data[TTResponse.lockData]);
        } else {
          TTSuccessCallback successCallback = callBack;
          successCallback();
        }
        break;

      case TTCommands.getAdminPasscode:
        TTGetAdminPasscodeCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.adminPasscode]);
        break;

      case TTCommands.addCard:
      case TTCommands.multifunctionalKeypadAddCard:
        TTCardNumberCallback addCardCallback = callBack;
        addCardCallback(data[TTResponse.cardNumber]);
        break;

      case TTCommands.addFingerprint:
      case TTCommands.multifunctionalKeypadAddFingerprint:
        TTAddFingerprintCallback addFingerprintCallback = callBack;
        addFingerprintCallback(data[TTResponse.fingerprintNumber]);
        break;

      case TTCommands.getLockSwitchState:
        TTGetLockStatusCallback getLockStatusCallback = callBack;
        int lockSwitchState = data[TTResponse.lockSwitchState];
        getLockStatusCallback(TTLockSwitchState.fromValue(lockSwitchState));
        break;

      case TTCommands.getLockTime:
        TTGetLockTimeCallback getLockTimeCallback = callBack;
        getLockTimeCallback(data[TTResponse.timestamp]);
        break;

      case TTCommands.getLockOperateRecord:
        TTGetLockOperateRecordCallback getLockOperateRecordCallback = callBack;
        getLockOperateRecordCallback(data[TTResponse.records] ?? "");
        break;

      case TTCommands.getLockPower:
      case TTCommands.setNBServerAddress:
        TTGetLockElectricQuantityCallback getLockElectricQuantityCallback =
            callBack;
        getLockElectricQuantityCallback(data[TTResponse.electricQuantity]);
        break;

      case TTCommands.functionSupport:
        TTFunctionSupportCallback functionSupportCallback = callBack;
        functionSupportCallback(data[TTResponse.isSupport]);
        break;
      case TTCommands.getNBAwakeModes:
        TTGetNbAwakeModesCallback getNbAwakeModesCallback = callBack;
        getNbAwakeModesCallback(data[TTResponse.nbAwakeModes]);
        break;
      case TTCommands.getAllValidPasscode:
        TTGetAllPasscodeCallback getAllPasscodeCallback = callBack;
        List passcodeList = [];
        String? passcodeListString = data[TTResponse.passcodeListString];
        if (passcodeListString != null) {
          passcodeList = convert.jsonDecode(passcodeListString);
        }
        getAllPasscodeCallback(passcodeList);
        break;
      case TTCommands.getAllValidCards:
        TTGetAllCardsCallback getAllCardsCallback = callBack;

        List cardList = [];
        String? cardListString = data[TTResponse.cardListString];
        if (cardListString != null) {
          cardList = convert.jsonDecode(cardListString);
        }
        getAllCardsCallback(cardList);
        break;
      case TTCommands.getAllValidFingerprints:
        TTGetAllFingerprintsCallback getAllFingerprintsCallback = callBack;
        List fingerprintList = [];
        String? fingerprintListString = data[TTResponse.fingerprintListString];
        if (fingerprintListString != null) {
          fingerprintList = convert.jsonDecode(fingerprintListString);
        }
        getAllFingerprintsCallback(fingerprintList);
        break;
      case TTCommands.getNBAwakeTimes:
        TTGetNbAwakeTimesCallback getNbAwakeTimesCallback = callBack;
        List<Map> nbAwakeTimeList = data[TTResponse.nbAwakeTimeList];
        List<TTNbAwakeTimeModel> list = [];

        nbAwakeTimeList.forEach((element) {
          list.add(TTNbAwakeTimeModel(
            type: TTNbAwakeTimeType.fromValue(element[TTResponse.type]),
            minutes: element[TTResponse.minutes],
          ));
        });
        getNbAwakeTimesCallback(list);
        break;

      case TTCommands.getAdminPasscode:
        TTGetAdminPasscodeCallback getAdminPasscodeCallback = callBack;
        getAdminPasscodeCallback(data[TTResponse.adminPasscode]);
        break;
      case TTCommands.getLockVersion:
        TTGetLockVersionCallback getLockVersionCallback = callBack;
        getLockVersionCallback(data[TTResponse.lockVersion]);
        break;
      case TTCommands.scanWifi:
        TTWifiLockScanWifiCallback scanWifiCallback = callBack;
        bool finished = data[TTResponse.finished];
        List wifiList = data[TTResponse.wifiList];
        scanWifiCallback(finished, wifiList);
        break;
      case TTCommands.getWifiInfo:
        TTWifiLockGetWifiInfoCallback getWifiInfoCallback = callBack;
        getWifiInfoCallback(TTWifiInfoModel.fromMap(Map<String, dynamic>.from(data)));
        break;
      case TTCommands.getSoundVolume:
        int soundVolumeValue = data[TTResponse.soundVolumeType];
        TTSoundVolumeType type = TTSoundVolumeType.fromValue(soundVolumeValue);

        TTGetLockSoundWithSoundVolumeCallback getLockSoundCallback = callBack;
        getLockSoundCallback(type);
        break;

      case TTCommands.getLockFeatureValue:
        TTLockDataCallback lockDataCallback = callBack;
        lockDataCallback(data[TTResponse.lockData]);
        break;

      // case TTCommands.getLockSystemInfo:
      //   TTGetLockSystemInfoCallback getLockSystemInfoCallback = callBack;
      //   getLockSystemInfoCallback(TTLockSystemInfoModel(data));
      //   break;

      // case TTCommands.getPasscodeVerificationParams:
      //   TTGetPasscodeVerificationParamsCallback getPasscodeVerificationParamsCallback = callBack;
      //   getPasscodeVerificationParamsCallback(data[TTResponse.lockData]);
      //   break;

      case TTCommands.connectGateway:
        TTGatewayConnectCallback connectCallback = callBack;
        TTGatewayConnectStatus status =
            TTGatewayConnectStatus.fromValue(data[TTResponse.status]);
        connectCallback(status);
        break;

      case TTCommands.getSurroundWifi:
        TTGatewayGetAroundWifiCallback getAroundWifiCallback = callBack;
        bool finished = data[TTResponse.finished];
        List wifiList = data[TTResponse.wifiList];
        getAroundWifiCallback(finished, wifiList);
        break;

      case TTCommands.initGateway:
        TTGatewayInitCallback gatewayInitCallback = callBack;
        gatewayInitCallback(data);
        break;
      case TTCommands.getAccessoryElectricQuantity:
        TTGetLockAccessoryElectricQuantity getLockAccessoryElectricQuantity =
            callBack;
        getLockAccessoryElectricQuantity(
            data[TTResponse.electricQuantity], data[TTResponse.updateDate]);
        break;
      case TTCommands.initRemoteKeypad:
        TTRemoteKeypadInitSuccessCallback remoteKeypadInitSuccessCallback =
            callBack;
        remoteKeypadInitSuccessCallback(data[TTResponse.electricQuantity],
            data[TTResponse.wirelessKeypadFeatureValue]);
        break;
      case TTCommands.multifunctionalKeypadGetLocks:
        TTRemoteKeypadGetStoredLockSuccessCallback getStoredLocks = callBack;
        getStoredLocks(data["lockMacs"]);
        break;
      case TTCommands.initMultifunctionalKeypad:

        var systemInfoModelMap = data["systemInfoModel"]??{};
        TTMultifunctionalRemoteKeypadInitSuccessCallback initSuccessCallback =
            callBack;
        initSuccessCallback(
            data["electricQuantity"],
            data["wirelessKeypadFeatureValue"],
            data["slotNumber"],
            data["slotLimit"],
            systemInfoModelMap["modelNum"],
            systemInfoModelMap["hardwareRevision"],
            systemInfoModelMap["firmwareRevision"],
        );
        break;
      case TTCommands.addFace:
      case TTCommands.addFaceData:
        TTAddFaceSuccessCallback addFaceSuccessCallback = callBack;
        addFaceSuccessCallback(data[TTResponse.faceNumber]);
        break;
      default:
        TTSuccessCallback successCallback = callBack;
        successCallback();
    }
  }

  static void _progressCallback(String command, Map data) {
    dynamic callBack;
    for (var i = 0; i < _commandQueue.length; i++) {
      Map map = _commandQueue[i];
      String key = map.keys.first;
      if (key.compareTo(command) == 0) {
        callBack = map[command][CALLBACK_PROGRESS];
        break;
      }
    }
    switch (command) {
      case TTCommands.addCard:
      case TTCommands.multifunctionalKeypadAddCard:
        TTAddCardProgressCallback progressCallback = callBack;
        progressCallback();
        break;
      case TTCommands.addFingerprint:
      case TTCommands.multifunctionalKeypadAddFingerprint:
        TTAddFingerprintProgressCallback progressCallback = callBack;
        progressCallback(
            data[TTResponse.currentCount], data[TTResponse.totalCount]);
        break;
      case TTCommands.addFace:
        TTAddFaceProgressCallback progressCallback = callBack;
        progressCallback(TTFaceState.fromValue(data[TTResponse.state]),
            TTFaceErrorCode.fromValue(data[TTResponse.errorCode]));
        break;
      default:
    }
  }

  static void _errorCallback(
      String command, int errorCode, String errorMessage, Map data) {
    if (errorCode == TTLockError.lockIsBusy.value) {
      errorMessage =
          "The TTLock SDK can only communicate with one lock at a time";
    }
    if (errorCode > TTLockError.wrongWifiPassword.value) {
      errorCode = TTLockError.fail.value;
    }


    dynamic callBack;
    dynamic otherCallBack;
    int index = -1;
    for (var i = 0; i < _commandQueue.length; i++) {
      Map map = _commandQueue[i];
      String key = map.keys.first;
      if (key.compareTo(command) == 0) {
        callBack = map[command][CALLBACK_FAIL];
        otherCallBack = map[command][CALLBACK_OTHER_FAIL];
        index = i;
        break;
      }
    }
    //多功能键盘添加指纹时返回重复指纹失败时，不移除
    if (_commandQueue.length > 0 &&
        !(command == TTCommands.multifunctionalKeypadAddFingerprint &&
            data["errorDevice"] == TTErrorDevice.keyPad.value
            && errorCode == TTRemoteKeyPadAccessoryError.duplicateFingerprint.value)
    ) {
      print("移除方法:$command;;;errorDevice:${data["errorDevice"]};;;;errorCode:${data["errorCode"]}");
      if (index > -1) {
        _commandQueue.removeAt(index);
      }
    }


    if (command == TTCommands.getSurroundWifi ||
        command == TTCommands.initGateway ||
        command == TTCommands.gatewayConfigIp ||
        command == TTCommands.upgradeGateway) {
      TTGatewayFailedCallback? failedCallback = callBack;
      TTGatewayError error = _safeFromValue(TTGatewayError.values, errorCode, TTGatewayError.fail);
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    } else if (command == TTCommands.initRemoteKey ||
        command == TTCommands.initDoorSensor ||
        command == TTCommands.initRemoteKeypad) {
      TTRemoteFailedCallback? failedCallback = callBack;
      TTRemoteAccessoryError error = _safeFromValue(TTRemoteAccessoryError.values, errorCode, TTRemoteAccessoryError.fail);
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    } // 多功能键盘失败处理
    else if ((command == TTCommands.initMultifunctionalKeypad) ||
        command == TTCommands.multifunctionalKeypadDeleteLock ||
        command == TTCommands.multifunctionalKeypadGetLocks ||
        command == TTCommands.multifunctionalKeypadAddFingerprint ||
        command == TTCommands.multifunctionalKeypadAddCard) {


      if(data["errorDevice"] == TTErrorDevice.keyPad.value)
      {
        TTRemoteKeypadFailedCallback? failedCallback = otherCallBack;
        TTRemoteKeyPadAccessoryError error = _safeFromValue(
            TTRemoteKeyPadAccessoryError.values, errorCode, TTRemoteKeyPadAccessoryError.fail);
        if (failedCallback != null) {
          failedCallback(error, errorMessage);
        }
      }else
      {
        if(errorCode<0)
        {
          errorCode = 0;
        }
        callBack?.call(_safeFromValue(TTLockError.values, errorCode, TTLockError.fail), errorMessage);
      }
    } else {
      TTFailedCallback? failedCallback = callBack;
      TTLockError error = _safeFromValue(TTLockError.values, errorCode, TTLockError.fail);
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

    Map map = value;
    String command = map[TTResponse.command];
    Map data = map[TTResponse.data] == null ? {} : map[TTResponse.data];
    int resultState = map[TTResponse.resultState];

    if (resultState == TTLockReuslt.fail.value) {
      int errorCode = map[TTResponse.errorCode];
      String errorMessage = map[TTResponse.errorMessage] == null
          ? ""
          : map[TTResponse.errorMessage];
      _errorCallback(command, errorCode, errorMessage, data);
    } else if (resultState == TTLockReuslt.progress.value) {
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

  static const String remoteAccessory = "remoteAccessory";

  static const String soundVolumeType = "soundVolumeType";

  static const String updateDate = "updateDate";
  static const String alertTime = "alertTime";
  static const String wirelessKeypadFeatureValue = "wirelessKeypadFeatureValue";
  static const String resetCode = "resetCode";

  static const String sensitivityValue = "sensitivityValue";

}

/// 经典 API 结果状态（仅用于 _onEvent），新 API 无此枚举。
enum TTLockReuslt {
  success(0),
  progress(1),
  fail(2);
  final int value;
  const TTLockReuslt(this.value);
}

/// 仅用于 getNbAwakeTimes 回调，新 models 中无此类。
class TTNbAwakeTimeModel {
  final TTNbAwakeTimeType type;
  final int minutes;
  const TTNbAwakeTimeModel({required this.type, required this.minutes});
}

/// 兼容旧方法签名中的拼写。
typedef TTLockFuction = TTLockFunction;

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
    TTSoundVolumeType ttLocksoundVolumeType);
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
    int slotLimit,
    String? modelNum,
    String? hardwareRevision,
    String? firmwareRevision);

typedef TTRemoteKeypadGetStoredLockSuccessCallback = void Function(
    List lockMacs);

typedef TTRemoteKeypadFailedCallback = void Function(
    TTRemoteKeyPadAccessoryError errorCode, String errorMsg);


typedef TTAddFaceProgressCallback = void Function(
    TTFaceState state, TTFaceErrorCode faceErrorCode);

typedef TTAddFaceSuccessCallback = void Function(String faceNumber);
