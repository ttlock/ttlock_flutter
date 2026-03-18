import 'package:ttlock_premise_flutter/models/scan_models.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/enums.dart';
import 'package:ttlock_premise_flutter/models/events.dart';
import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/errors/tt_lock_exception.dart';

// 供仅 import ttlock_classic 的调用方使用
export 'package:ttlock_premise_flutter/models/scan_models.dart';
export 'package:ttlock_premise_flutter/models/lock_models.dart';
export 'package:ttlock_premise_flutter/models/enums.dart';

@Deprecated('Use TTLock from package:ttlock_premise_flutter/ttlock.dart and TTLock.lock / TTLock.gateway / TTLock.accessory instead.')
class TTLock {
  static bool isOnPremise = true;

  static bool get printLog => new_ttlock.TTLock.printLog;
  static set printLog(bool value) => new_ttlock.TTLock.printLog = value;

  static void _runLock<T>(Future<T> f, void Function(T) success, TTFailedCallback? fail) {
    f.then((r) => success(r)).catchError((e, st) {
      if (e is TTLockException) {
        fail?.call(e.error, e.message);
      } else {
        fail?.call(TTLockError.fail, e?.toString() ?? 'Unknown error');
      }
    });
  }

  static void _runLockVoid(Future<void> f, TTSuccessCallback? success, TTFailedCallback? fail) {
    _runLock(f, (_) => success?.call(), fail);
  }

  static dynamic _scanLockSub;
  static dynamic _scanWifiSub;

  /// Scan the smart lock being broadcast
  @Deprecated('Use TTLock.lock.startScanLock() and listen to the stream instead.')
  static void startScanLock(TTLockScanCallback scanCallback) {
    _scanLockSub?.cancel();
    _scanLockSub = new_ttlock.TTLock.lock.startScanLock().listen(
      scanCallback,
      onError: (e) {
        if (e is TTLockException) {
          // 扫描流一般不传 fail 回调，仅打印
          if (printLog) print('TTLock startScanLock error: ${e.message}');
        }
      },
    );
  }

  /// Stop scan the smart lock being broadcast
  @Deprecated('Use TTLock.lock.stopScanLock() instead.')
  static void stopScanLock() {
    _scanLockSub?.cancel();
    _scanLockSub = null;
    new_ttlock.TTLock.lock.stopScanLock().catchError((_) {});
  }

  /// Current Phone/Pad Bluetooth state
  @Deprecated('Use TTLock.lock.getBluetoothState() instead.')
  static void getBluetoothState(TTBluetoothStateCallback stateCallback) {
    _runLock(new_ttlock.TTLock.lock.getBluetoothState(), stateCallback, null);
  }

  /// Initialize the lock. map {"lockMac": string, "lockVersion": string, "isInited": bool}
  @Deprecated('Use TTLock.lock.initLock(TTLockInitParams) instead.')
  static void initLock(
      Map map, TTLockDataCallback callback, TTFailedCallback failedCallback) {
    final params = TTLockInitParams.fromMap(Map<String, dynamic>.from(map));
    _runLock(new_ttlock.TTLock.lock.initLock(params), callback, failedCallback);
  }

  /// Reset the lock
  @Deprecated('Use TTLock.lock.resetLock(lockData) instead.')
  static void resetLock(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(new_ttlock.TTLock.lock.resetLock(lockData), callback, failedCallback);
  }

  /// Reset all eKeys
  @Deprecated('Use TTLock.lock.resetEkey(lockData) instead.')
  static void resetEkey(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(new_ttlock.TTLock.lock.resetEkey(lockData), callback, failedCallback);
  }

  /// Function support
  @Deprecated('Use TTLock.lock.supportFunction(function, lockData) instead.')
  static void supportFunction(TTLockFuction fuction, String lockData,
      TTFunctionSupportCallback callback) {
    _runLock(
      new_ttlock.TTLock.lock.supportFunction(fuction, lockData),
      callback,
      null,
    );
  }

  /// Lock or unlock the lock
  @Deprecated('Use TTLock.lock.controlLock(lockData, action) instead.')
  static void controlLock(String lockData, TTControlAction controlAction,
      TTControlLockCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.controlLock(lockData, controlAction),
      (r) => callback(r.lockTime, r.electricQuantity, r.uniqueId),
      failedCallback,
    );
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
    _runLockVoid(
      new_ttlock.TTLock.lock.createCustomPasscode(
        passcode: passcode,
        startDate: startDate,
        endDate: endDate,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
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
    _runLockVoid(
      new_ttlock.TTLock.lock.modifyPasscode(
        passcodeOrigin: passcodeOrigin,
        passcodeNew: passcodeNew,
        startDate: startDate,
        endDate: endDate,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  /// Delete passcode
  @Deprecated('Use TTLock.lock.deletePasscode(passcode: passcode, lockData: lockData) instead.')
  static void deletePasscode(String passcode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.deletePasscode(passcode: passcode, lockData: lockData),
      callback,
      failedCallback,
    );
  }

  /// All passcodes will be invalid except admin passcode
  @Deprecated('Use TTLock.lock.resetPasscode(lockData) instead.')
  static void resetPasscode(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(new_ttlock.TTLock.lock.resetPasscode(lockData), callback, failedCallback);
  }

  /// Get admin passcode from lock
  @Deprecated('Use TTLock.lock.getAdminPasscode(lockData) instead.')
  static void getAdminPasscode(String lockData,
      TTGetAdminPasscodeCallback callback, TTFailedCallback failedCallback) {
    _runLock(new_ttlock.TTLock.lock.getAdminPasscode(lockData), callback, failedCallback);
  }

  @Deprecated('Use TTLock.lock.setErasePasscode(erasePasscode: ..., lockData: ...) instead.')
  static void setErasePasscode(String erasePasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setErasePasscode(
        erasePasscode: erasePasscode,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getAllValidPasscodes(lockData) instead.')
  static void getAllValidPasscode(String lockData,
      TTGetAllPasscodeCallback callback, TTFailedCallback failedCallback) {
    _runLock(new_ttlock.TTLock.lock.getAllValidPasscodes(lockData), callback, failedCallback);
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
    _runLockVoid(
      new_ttlock.TTLock.lock.recoverPasscode(
        passcode: passcode,
        passcodeNew: passcodeNew,
        type: type,
        startDate: startDate,
        endDate: endDate,
        cycleType: cycleType,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  /// Get the lock switch state
  @Deprecated('Use TTLock.lock.getLockSwitchState(lockData) instead.')
  static void getLockSwitchState(String lockData,
      TTGetLockStatusCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockSwitchState(lockData),
      callback,
      failedCallback,
    );
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
    new_ttlock.TTLock.lock
        .addCard(
          cycleList: cycleList,
          startDate: startDate,
          endDate: endDate,
          lockData: lockData,
        )
        .listen(
          (e) {
            if (e is AddCardProgress) {
              progressCallback();
            } else if (e is AddCardComplete) {
              callback(e.cardNumber);
            }
          },
          onError: (err) {
            if (err is TTLockException) {
              failedCallback(err.error, err.message);
            } else {
              failedCallback(TTLockError.fail, err?.toString() ?? 'Unknown error');
            }
          },
        );
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
    _runLockVoid(
      new_ttlock.TTLock.lock.modifyCardValidityPeriod(
        cardNumber: cardNumber,
        cycleList: cycleList,
        startDate: startDate,
        endDate: endDate,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.deleteCard(cardNumber: ..., lockData: ...) instead.')
  static void deleteCard(String cardNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.deleteCard(
        cardNumber: cardNumber,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getAllValidCards(lockData) instead.')
  static void getAllValidCards(String lockData, TTGetAllCardsCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getAllValidCards(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.clearAllCards(lockData) instead.')
  static void clearAllCards(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.clearAllCards(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.recoverCard(...) instead.')
  static void recoverCard(
      String cardNumber,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.recoverCard(
        cardNumber: cardNumber,
        startDate: startDate,
        endDate: endDate,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
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
    new_ttlock.TTLock.lock
        .addFingerprint(
          cycleList: cycleList,
          startDate: startDate,
          endDate: endDate,
          lockData: lockData,
        )
        .listen(
          (e) {
            if (e is AddFingerprintProgress) {
              progressCallback(e.currentCount, e.totalCount);
            } else if (e is AddFingerprintComplete) {
              callback(e.fingerprintNumber);
            }
          },
          onError: (err) {
            if (err is TTLockException) {
              failedCallback(err.error, err.message);
            } else {
              failedCallback(TTLockError.fail, err?.toString() ?? 'Unknown error');
            }
          },
        );
  }

  @Deprecated('Use TTLock.lock.modifyFingerprintValidityPeriod(...) instead.')
  static void modifyFingerprintValidityPeriod(
      String fingerprintNumber,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.modifyFingerprintValidityPeriod(
        fingerprintNumber: fingerprintNumber,
        cycleList: cycleList,
        startDate: startDate,
        endDate: endDate,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.deleteFingerprint(fingerprintNumber: ..., lockData: ...) instead.')
  static void deleteFingerprint(String fingerprintNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.deleteFingerprint(
        fingerprintNumber: fingerprintNumber,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.clearAllFingerprints(lockData) instead.')
  static void clearAllFingerprints(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.clearAllFingerprints(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getAllValidFingerprints(lockData) instead.')
  static void getAllValidFingerprints(String lockData,
      TTGetAllFingerprintsCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getAllValidFingerprints(lockData),
      callback,
      failedCallback,
    );
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
    _runLock<String?>(
      new_ttlock.TTLock.lock.modifyAdminPasscode(
        adminPasscode: adminPasscode,
        lockData: lockData,
      ),
      (lockData) => callback(lockData ?? ''),
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setLockTime(timestamp: ..., lockData: ...) instead.')
  static void setLockTime(int timestamp, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setLockTime(
        timestamp: timestamp,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getLockTime(lockData) instead.')
  static void getLockTime(String lockData, TTGetLockTimeCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockTime(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getLockOperateRecord(type: ..., lockData: ...) instead.')
  static void getLockOperateRecord(
      TTOperateRecordType type,
      String lockData,
      TTGetLockOperateRecordCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockOperateRecord(
        type: type,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getLockPower(lockData) instead.')
  static void getLockPower(
      String lockData,
      TTGetLockElectricQuantityCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockPower(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getLockSystemInfo(lockData) instead.')
  static void getLockSystemInfo(String lockData,
      TTGetLockSystemCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockSystemInfo(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getLockFeatureValue(lockData) instead.')
  static void getLockFeatureValue(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockFeatureValue(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getAutoLockingPeriodicTime(lockData) instead.')
  static void getLockAutomaticLockingPeriodicTime(
      String lockData,
      TTGetLockAutomaticLockingPeriodicTimeCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getAutoLockingPeriodicTime(lockData),
      (r) => callback(r.currentTime, r.minTime, r.maxTime),
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setAutoLockingPeriodicTime(seconds: ..., lockData: ...) instead.')
  static void setLockAutomaticLockingPeriodicTime(int time, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setAutoLockingPeriodicTime(
        seconds: time,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getRemoteUnlockSwitchState(lockData) instead.')
  static void getLockRemoteUnlockSwitchState(String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getRemoteUnlockSwitchState(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setRemoteUnlockSwitchState(isOn: ..., lockData: ...) instead.')
  static void setLockRemoteUnlockSwitchState(bool isOn, String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.setRemoteUnlockSwitchState(
        isOn: isOn,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getLockConfig(config: ..., lockData: ...) instead.')
  static void getLockConfig(TTLockConfig config, String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockConfig(
        config: config,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setLockConfig(config: ..., isOn: ..., lockData: ...) instead.')
  static void setLockConfig(TTLockConfig config, bool isOn, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setLockConfig(
        config: config,
        isOn: isOn,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setLockDirection(direction: ..., lockData: ...) instead.')
  static void setLockDirection(TTLockDirection direction, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setLockDirection(
        direction: direction,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getLockDirection(lockData) instead.')
  static void getLockDirection(String lockData,
      TTGetLockDirectionCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockDirection(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.resetLockByCode(lockMac: ..., resetCode: ...) instead.')
  static void resetLockByCode(String lockMac, String resetCode,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.resetLockByCode(
        lockMac: lockMac,
        resetCode: resetCode,
      ),
      callback,
      failedCallback,
    );
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
    _runLockVoid(
      new_ttlock.TTLock.lock.addPassageMode(
        type: type,
        weekly: weekly,
        monthly: monthly,
        startTime: startTime,
        endTime: endTime,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.clearAllPassageModes(lockData) instead.')
  static void clearAllPassageModes(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.clearAllPassageModes(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.activateLift(floors: ..., lockData: ...) instead.')
  static void activateLift(String floors, String lockData,
      TTLiftCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.activateLift(
        floors: floors,
        lockData: lockData,
      ),
      (r) => callback(r.lockTime, r.electricQuantity, r.uniqueId),
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setLiftControlable(floors: ..., lockData: ...) instead.')
  static void setLiftControlable(String floors, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setLiftControlable(
        floors: floors,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setLiftWorkMode(type: ..., lockData: ...) instead.')
  static void setLiftWorkMode(TTLiftWorkActivateType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setLiftWorkMode(
        type: type,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setPowerSaverWorkMode(type: ..., lockData: ...) instead.')
  static void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setPowerSaverWorkMode(
        type: type,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setPowerSaverControlableLock(lockMac: ..., lockData: ...) instead.')
  static void setPowerSaverControlableLock(String lockMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setPowerSaverControlableLock(
        lockMac: lockMac,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
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
    _runLockVoid(
      new_ttlock.TTLock.lock.setHotel(
        hotelInfo: hotelInfo,
        buildingNumber: buildingNumber,
        floorNumber: floorNumber,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setHotelCardSector(sector: ..., lockData: ...) instead.')
  static void setHotelCardSector(String sector, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setHotelCardSector(
        sector: sector,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  // static void getDoorSensorState(String lockData,
  //     TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
  //   invoke(TTCommands.getDoorSensorState, lockData, callback,
  //       fail: failedCallback);
  // }

  @Deprecated('Use TTLock.lock.getLockVersion(lockMac) instead.')
  static void getLockVersion(String lockMac, TTGetLockVersionCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getLockVersion(lockMac),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.scanWifi(lockData) and listen to the stream instead.')
  static void scanWifi(String lockData, TTWifiLockScanWifiCallback callback,
      TTFailedCallback failedCallback) {
    _scanWifiSub?.cancel();
    final List allWifiList = [];
    final Set<String> seen = <String>{};

    String wifiKey(dynamic item) {
      if (item is Map) {
        final dynamic mapKey = item['wifiMac'] ??
            item['bssid'] ??
            item['BSSID'] ??
            item['mac'] ??
            item['ssid'] ??
            item['wifiName'] ??
            item['name'];
        if (mapKey != null) return mapKey.toString();
      }
      return item?.toString() ?? '';
    }

    _scanWifiSub = new_ttlock.TTLock.lock.scanWifi(lockData).listen(
      (wifiList) {
        for (final item in wifiList) {
          final key = wifiKey(item);
          if (seen.add(key)) {
            allWifiList.add(item);
          }
        }
        callback(false, allWifiList);
      },
      onDone: () => callback(true, allWifiList),
      onError: (e) {
        if (e is TTLockException) {
          failedCallback(e.error, e.message);
        } else {
          failedCallback(TTLockError.fail, e?.toString() ?? 'Unknown error');
        }
      },
    );
  }

  @Deprecated('Use TTLock.lock.configWifi(wifiName: ..., wifiPassword: ..., lockData: ...) instead.')
  static void configWifi(String wifiName, String wifiPassword, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.configWifi(
        wifiName: wifiName,
        wifiPassword: wifiPassword,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.configServer(ip: ..., port: ..., lockData: ...) instead.')
  static void configServer(String ip, String port, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.configServer(
        ip: ip,
        port: port,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getWifiInfo(lockData) instead.')
  static void getWifiInfo(String lockData,
      TTWifiLockGetWifiInfoCallback callback, TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getWifiInfo(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.configIp(ipSetting: TTIpSetting(...), lockData: ...) instead.')
  static void configIp(
    Map map,
    String lockData,
    TTSuccessCallback callback,
    TTFailedCallback failedCallback,
  ) {
    final type = map['type'] as int?;
    final ip = map['ipAddress'] as String?;
    final router = map['router'] as String?;
    final subnetMask = map['subnetMask'] as String?;
    final ipSetting = TTIpSetting(
      type: type ?? TTIpSettingType.dhcp.value,
      ipAddress: ip,
      subnetMask: subnetMask,
      router: router,
    );
    _runLockVoid(
      new_ttlock.TTLock.lock.configIp(
        ipSetting: ipSetting,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setSoundVolume(type: ..., lockData: ...) instead.')
  static void setLockSoundWithSoundVolume(
      TTSoundVolumeType type,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setSoundVolume(
        type: type,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getSoundVolume(lockData) instead.')
  static void getLockSoundWithSoundVolume(
      String lockData,
      TTGetLockSoundWithSoundVolumeCallback callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getSoundVolume(lockData),
      callback,
      failedCallback,
    );
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
    _runLockVoid(
      new_ttlock.TTLock.lock.addRemoteKey(
        remoteKeyMac: remoteKeyMac,
        cycleList: cycleList,
        startDate: startDate,
        endDate: endDate,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.deleteRemoteKey(remoteKeyMac: ..., lockData: ...) instead.')
  static void deleteRemoteKey(String remoteKeyMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.deleteRemoteKey(
        remoteKeyMac: remoteKeyMac,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.clearRemoteKey(lockData) instead.')
  static void clearRemoteKey(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.clearRemoteKey(lockData),
      callback,
      failedCallback,
    );
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
    _runLockVoid(
      new_ttlock.TTLock.lock.setRemoteKeyValidDate(
        remoteKeyMac: remoteKeyMac,
        cycleList: cycleList,
        startDate: startDate,
        endDate: endDate,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.getRemoteAccessoryElectricQuantity(...) instead.')
  static void getRemoteAccessoryElectricQuantity(
      TTRemoteAccessory remoteAccessory,
      String remoteAccessoryMac,
      String lockData,
      TTGetLockAccessoryElectricQuantity callback,
      TTFailedCallback failedCallback) {
    _runLock(
      new_ttlock.TTLock.lock.getRemoteAccessoryElectricQuantity(
        accessory: remoteAccessory,
        mac: remoteAccessoryMac,
        lockData: lockData,
      ),
      (r) => callback(r.electricQuantity, r.updateDate),
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.addDoorSensor(doorSensorMac: ..., lockData: ...) instead.')
  static void addDoorSensor(String doorSensorMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.addDoorSensor(
        doorSensorMac: doorSensorMac,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.deleteDoorSensor(lockData) instead.')
  static void deleteDoorSensor(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.deleteDoorSensor(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setDoorSensorAlertTime(alertTime: ..., lockData: ...) instead.')
  static void setDoorSensorAlertTime(String lockData, int alertTime,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setDoorSensorAlertTime(
        alertTime: alertTime,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setLockEnterUpgradeMode(lockData) instead.')
  static void setLockEnterUpgradeMode(String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.setLockEnterUpgradeMode(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.verifyLock(lockMac) instead.')
  static void verifyLock(String lockMac, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.verifyLock(lockMac),
      callback,
      failedCallback,
    );
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
    new_ttlock.TTLock.lock
        .addFace(
          cycleList: cycleList,
          startDate: startDate,
          endDate: endDate,
          lockData: lockData,
        )
        .listen(
          (e) {
            if (e is AddFaceProgress) {
              progressCallback(e.state, e.errorCode);
            } else if (e is AddFaceComplete) {
              callback(e.faceNumber);
            }
          },
          onError: (err) {
            if (err is TTLockException) {
              failedCallback(err.error, err.message);
            } else {
              failedCallback(TTLockError.fail, err?.toString() ?? 'Unknown error');
            }
          },
        );
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
    _runLock(
      new_ttlock.TTLock.lock.addFaceData(
        cycleList: cycleList,
        startDate: startDate,
        endDate: endDate,
        faceFeatureData: faceFeatureData,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
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
    _runLockVoid(
      new_ttlock.TTLock.lock.modifyFace(
        faceNumber: faceNumber,
        cycleList: cycleList,
        startDate: startDate,
        endDate: endDate,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.clearFace(lockData) instead.')
  static void clearFace(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.clearFace(lockData),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.deleteFace(faceNumber: ..., lockData: ...) instead.')
  static void deleteFace(String faceNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    _runLockVoid(
      new_ttlock.TTLock.lock.deleteFace(
        faceNumber: faceNumber,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
  }

  @Deprecated('Use TTLock.lock.setSensitivity(value: TTSensitivityValue, lockData: ...) instead.')
  static void setSensitivity(String lockData, int value, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final sensitivity = TTSensitivityValue.fromValue(value);
    _runLockVoid(
      new_ttlock.TTLock.lock.setSensitivity(
        value: sensitivity,
        lockData: lockData,
      ),
      callback,
      failedCallback,
    );
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
