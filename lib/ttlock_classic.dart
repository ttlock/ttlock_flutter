import 'dart:async';
import 'dart:convert' as convert;

import 'package:ttlock_premise_flutter/ttlock.dart' as new_api;
import 'package:ttlock_premise_flutter/models/scan_models.dart' as new_models;
import 'package:ttlock_premise_flutter/models/lock_models.dart' as new_lock_models;
import 'package:ttlock_premise_flutter/models/enums.dart' as new_enums;

@Deprecated('Use TTLock.lock / TTLock.gateway / TTLock.accessory from package:ttlock_premise_flutter/ttlock.dart instead. Will be removed in a future version.')
class TTLock {
  static bool isOnPremise = false;

  static StreamSubscription? _lockScanSubscription;

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

  static bool get printLog => new_api.TTLock.printLog;
  static set printLog(bool value) {
    new_api.TTLock.printLog = value;
  }

  static TTLockScanModel _toClassicScanModel(new_models.TTLockScanModel m) {
    final map = <String, dynamic>{
      TTResponse.lockName: m.lockName,
      TTResponse.lockMac: m.lockMac,
      TTResponse.isInited: m.isInited,
      TTResponse.isAllowUnlock: m.isAllowUnlock,
      TTResponse.electricQuantity: m.electricQuantity,
      TTResponse.lockVersion: m.lockVersion,
      TTResponse.lockSwitchState: m.lockSwitchState.value,
      TTResponse.rssi: m.rssi,
      TTResponse.oneMeterRssi: m.oneMeterRssi,
      TTResponse.timestamp: m.timestamp,
    };
    return TTLockScanModel(map);
  }

  static TTLockError _toClassicLockError(new_api.TTLockException e) {
    final v = e.error.value;
    if (v >= 0 && v < TTLockError.values.length) return TTLockError.values[v];
    return TTLockError.fail;
  }

  static TTBluetoothState _toClassicBluetoothState(new_enums.TTBluetoothState s) {
    final v = s.value;
    if (v >= 0 && v < TTBluetoothState.values.length) return TTBluetoothState.values[v];
    return TTBluetoothState.unknown;
  }

  static TTLockSwitchState _toClassicSwitchState(new_enums.TTLockSwitchState s) {
    final v = s.value;
    if (v >= 0 && v < TTLockSwitchState.values.length) return TTLockSwitchState.values[v];
    return TTLockSwitchState.unknown;
  }

  static TTLockSystemModel _toClassicLockSystemModel(new_lock_models.TTLockSystemModel m) {
    return TTLockSystemModel({
      'modelNum': m.modelNum,
      'hardwareRevision': m.hardwareRevision,
      'firmwareRevision': m.firmwareRevision,
      'electricQuantity': m.electricQuantity,
      'nbOperator': m.nbOperator,
      'nbNodeId': m.nbNodeId,
      'nbCardNumber': m.nbCardNumber,
      'nbRssi': m.nbRssi,
      'lockData': m.lockData,
    });
  }

  // ignore: slash_for_doc_comments
/**
   * Scan the smart lock being broadcast
   */
  @Deprecated('Use TTLock.lock.startScanLock() stream instead. Will be removed in a future version.')
  static void startScanLock(TTLockScanCallback scanCallback) {
    _lockScanSubscription?.cancel();
    _lockScanSubscription = new_api.TTLock.lock.startScanLock().listen(
      (model) => scanCallback(_toClassicScanModel(model)),
      onError: (_) {},
    );
  }

  // ignore: slash_for_doc_comments
/**
   * Stop scan the smart lock being broadcast
   */
  @Deprecated('Use TTLock.lock.stopScanLock() instead. Will be removed in a future version.')
  static void stopScanLock() {
    _lockScanSubscription?.cancel();
    _lockScanSubscription = null;
    new_api.TTLock.lock.stopScanLock().ignore();
  }

  // ignore: slash_for_doc_comments
/**
   * Current Phone/Pad Bluetooth state
   */
  @Deprecated('Use TTLock.lock.getBluetoothState() instead. Will be removed in a future version.')
  static void getBluetoothState(TTBluetoothStateCallback stateCallback) {
    new_api.TTLock.lock.getBluetoothState().then(
      (s) => stateCallback(_toClassicBluetoothState(s)),
    ).catchError((_) {});
  }

// ignore: slash_for_doc_comments
/**
 * Initialize the lock
 * map {"lockMac": string, "lockVersion": string, "isInited": bool}
 */
  @Deprecated('Use TTLock.lock.initLock(TTLockInitParams) instead. Will be removed in a future version.')
  static void initLock(
      Map map, TTLockDataCallback callback, TTFailedCallback failedCallback) {
    final params = new_lock_models.TTLockInitParams.fromMap(Map<String, dynamic>.from(map));
    new_api.TTLock.lock.initLock(params).then(callback).catchError((e) {
      if (e is new_api.TTLockException) {
        failedCallback(_toClassicLockError(e), e.message);
      } else {
        failedCallback(TTLockError.fail, e.toString());
      }
    });
  }

// ignore: slash_for_doc_comments
/**
 * Reset the lock
 */
  @Deprecated('Use TTLock.lock.resetLock() instead. Will be removed in a future version.')
  static void resetLock(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.resetLock(lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) {
        failedCallback(_toClassicLockError(e), e.message);
      } else {
        failedCallback(TTLockError.fail, e.toString());
      }
    });
  }

// ignore: slash_for_doc_comments
/**
 * Reset all eKeys
 */
  @Deprecated('Use TTLock.lock.resetEkey() instead. Will be removed in a future version.')
  static void resetEkey(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.resetEkey(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) {
        failedCallback(_toClassicLockError(e), e.message);
      } else {
        failedCallback(TTLockError.fail, e.toString());
      }
    });
  }

  // ignore: slash_for_doc_comments
/**
 * Function support
 */
  @Deprecated('Use TTLock.lock.supportFunction() instead. Will be removed in a future version.')
  static void supportFunction(TTLockFunction fuction, String lockData,
      TTFunctionSupportCallback callback) {
    new_enums.TTLockFunction newFunc;
    try {
      newFunc = new_enums.TTLockFunction.fromValue(fuction.index);
    } catch (_) {
      newFunc = new_enums.TTLockFunction.passcode;
    }
    new_api.TTLock.lock.supportFunction(newFunc, lockData).then(callback).catchError((_) {
      callback(false);
    });
  }

// ignore: slash_for_doc_comments
/**
 * Lock or unlock the lock
 */
  @Deprecated('Use TTLock.lock.controlLock() instead. Will be removed in a future version.')
  static void controlLock(String lockData, TTControlAction controlAction,
      TTControlLockCallback callback, TTFailedCallback failedCallback) {
    final action = controlAction == TTControlAction.unlock
        ? new_enums.TTControlAction.unlock
        : new_enums.TTControlAction.lock;
    new_api.TTLock.lock.controlLock(lockData, action).then((result) {
      callback(result.lockTime, result.electricQuantity, result.uniqueId, lockData);
    }).catchError((e) {
      if (e is new_api.TTLockException) {
        failedCallback(_toClassicLockError(e), e.message);
      } else {
        failedCallback(TTLockError.fail, e.toString());
      }
    });
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
  @Deprecated('Use TTLock.lock.createCustomPasscode() instead. Will be removed in a future version.')
  static void createCustomPasscode(
      String passcode,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.createCustomPasscode(passcode: passcode, startDate: startDate, endDate: endDate, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Moddify passcode or passcode valid date
 */
  @Deprecated('Use TTLock.lock.modifyPasscode() instead. Will be removed in a future version.')
  static void modifyPasscode(
      String passcodeOrigin,
      String? passcodeNew,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.modifyPasscode(passcodeOrigin: passcodeOrigin, passcodeNew: passcodeNew, startDate: startDate, endDate: endDate, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Delete passcode
 */
  @Deprecated('Use TTLock.lock.deletePasscode() instead. Will be removed in a future version.')
  static void deletePasscode(String passcode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.deletePasscode(passcode: passcode, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * All passcodes will be invalid except admin passcode
 */
  @Deprecated('Use TTLock.lock.resetPasscode() instead. Will be removed in a future version.')
  static void resetPasscode(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.resetPasscode(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  // ignore: slash_for_doc_comments
/**
 * Get admin passcode from lock
 */
  @Deprecated('Use TTLock.lock.getAdminPasscode() instead. Will be removed in a future version.')
  static void getAdminPasscode(String lockData,
      TTGetAdminPasscodeCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getAdminPasscode(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setErasePasscode() instead. Will be removed in a future version.')
  static void setErasePasscode(String erasePasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setErasePasscode(erasePasscode: erasePasscode, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getAllValidPasscodes() instead. Will be removed in a future version.')
  static void getAllValidPasscode(String lockData,
      TTGetAllPasscodeCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getAllValidPasscodes(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.recoverPasscode() instead. Will be removed in a future version.')
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
    new_enums.TTPasscodeType newType;
    try {
      newType = new_enums.TTPasscodeType.fromValue(type.index);
    } catch (_) {
      newType = new_enums.TTPasscodeType.period;
    }
    new_api.TTLock.lock.recoverPasscode(passcode: passcode, passcodeNew: passcodeNew, type: newType, startDate: startDate, endDate: endDate, cycleType: cycleType, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  // ignore: slash_for_doc_comments
/**
 * Get the lock switch state
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.getLockSwitchState() instead. Will be removed in a future version.')
  static void getLockSwitchState(String lockData,
      TTGetLockStatusCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getLockSwitchState(lockData).then((s) {
      callback(_toClassicSwitchState(s));
    }).catchError((e) {
      if (e is new_api.TTLockException) {
        failedCallback(_toClassicLockError(e), e.message);
      } else {
        failedCallback(TTLockError.fail, e.toString());
      }
    });
  }

  // ignore: slash_for_doc_comments
/**
   * Add a card
   */
  @Deprecated('Use TTLock.lock.addCard() stream instead. Will be removed in a future version.')
  static void addCard(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddCardProgressCallback progressCallback,
      TTCardNumberCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.addCard(cycleList: newCycleList, startDate: startDate, endDate: endDate, lockData: lockData).listen(
      (e) {
        if (e is new_api.AddCardProgress) {
          progressCallback();
        } else if (e is new_api.AddCardComplete) {
          callback(e.cardNumber);
        }
      },
      onError: (err) {
        if (err is new_api.TTLockException) failedCallback(_toClassicLockError(err), err.message);
        else failedCallback(TTLockError.fail, err.toString());
      },
    );
  }

// ignore: slash_for_doc_comments
/**
 * Modify the card valid date
 */
  @Deprecated('Use TTLock.lock.modifyCardValidityPeriod() instead. Will be removed in a future version.')
  static void modifyCardValidityPeriod(
      String cardNumber,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.modifyCardValidityPeriod(cardNumber: cardNumber, cycleList: newCycleList, startDate: startDate, endDate: endDate, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Delete the card
 */
  @Deprecated('Use TTLock.lock.deleteCard() instead. Will be removed in a future version.')
  static void deleteCard(String cardNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.deleteCard(cardNumber: cardNumber, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  // ignore: slash_for_doc_comments
/**
 * Get all valid cards
 */
  @Deprecated('Use TTLock.lock.getAllValidCards() instead. Will be removed in a future version.')
  static void getAllValidCards(String lockData, TTGetAllCardsCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getAllValidCards(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Clear all cards
 */
  @Deprecated('Use TTLock.lock.clearAllCards() instead. Will be removed in a future version.')
  static void clearAllCards(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.clearAllCards(lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.recoverCard() instead. Will be removed in a future version.')
  static void recoverCard(
      String cardNumber,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.recoverCard(cardNumber: cardNumber, startDate: startDate, endDate: endDate, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.reportLossCard() instead. Will be removed in a future version.')
  static void reportLossCard(String cardNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.reportLossCard(cardNumber: cardNumber, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
   * Add a fingerprint
   */
  @Deprecated('Use TTLock.lock.addFingerprint() stream instead. Will be removed in a future version.')
  static void addFingerprint(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddFingerprintProgressCallback progressCallback,
      TTAddFingerprintCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.addFingerprint(cycleList: newCycleList, startDate: startDate, endDate: endDate, lockData: lockData).listen(
      (e) {
        if (e is new_api.AddFingerprintProgress) {
          progressCallback(e.currentCount, e.totalCount);
        } else if (e is new_api.AddFingerprintComplete) {
          callback(e.fingerprintNumber);
        }
      },
      onError: (err) {
        if (err is new_api.TTLockException) failedCallback(_toClassicLockError(err), err.message);
        else failedCallback(TTLockError.fail, err.toString());
      },
    );
  }

// ignore: slash_for_doc_comments
/**
 * Modify the fingerprint valid date
 */
  @Deprecated('Use TTLock.lock.modifyFingerprintValidityPeriod() instead. Will be removed in a future version.')
  static void modifyFingerprintValidityPeriod(
      String fingerprintNumber,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.modifyFingerprintValidityPeriod(fingerprintNumber: fingerprintNumber, cycleList: newCycleList, startDate: startDate, endDate: endDate, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Delete the fingerprint
 */
  @Deprecated('Use TTLock.lock.deleteFingerprint() instead. Will be removed in a future version.')
  static void deleteFingerprint(String fingerprintNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.deleteFingerprint(fingerprintNumber: fingerprintNumber, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Clear all fingerprints
 */
  @Deprecated('Use TTLock.lock.clearAllFingerprints() instead. Will be removed in a future version.')
  static void clearAllFingerprints(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.clearAllFingerprints(lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Get all valid fingerprints
 */
  @Deprecated('Use TTLock.lock.getAllValidFingerprints() instead. Will be removed in a future version.')
  static void getAllValidFingerprints(String lockData,
      TTGetAllFingerprintsCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getAllValidFingerprints(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getPasscodeVerificationParams() instead. Will be removed in a future version.')
  static void getPasscodeVerificationParams(String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getPasscodeVerificationParams(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Modify admin passcode
 */
  @Deprecated('Use TTLock.lock.modifyAdminPasscode() instead. Will be removed in a future version.')
  static void modifyAdminPasscode(String adminPasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.modifyAdminPasscode(adminPasscode: adminPasscode, lockData: lockData).then((_) {
      callback();
    }).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock time
 */
  @Deprecated('Use TTLock.lock.setLockTime() instead. Will be removed in a future version.')
  static void setLockTime(int timestamp, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setLockTime(timestamp: timestamp, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock time
 */
  @Deprecated('Use TTLock.lock.getLockTime() instead. Will be removed in a future version.')
  static void getLockTime(String lockData, TTGetLockTimeCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getLockTime(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock operate record
 */
  @Deprecated('Use TTLock.lock.getLockOperateRecord() instead. Will be removed in a future version.')
  static void getLockOperateRecord(
      TTOperateRecordType type,
      String lockData,
      TTGetLockOperateRecordCallback callback,
      TTFailedCallback failedCallback) {
    final newType = type == TTOperateRecordType.latest ? new_enums.TTOperateRecordType.latest : new_enums.TTOperateRecordType.total;
    new_api.TTLock.lock.getLockOperateRecord(type: newType, lockData: lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock power
 */
  @Deprecated('Use TTLock.lock.getLockPower() instead. Will be removed in a future version.')
  static void getLockPower(
      String lockData,
      TTGetLockElectricQuantityCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getLockPower(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getLockSystemInfo() instead. Will be removed in a future version.')
  static void getLockSystemInfo(String lockData,
      TTGetLockSystemCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getLockSystemInfo(lockData).then((m) => callback(_toClassicLockSystemModel(m))).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getLockFeatureValue() instead. Will be removed in a future version.')
  static void getLockFeatureValue(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getLockFeatureValue(lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock automatic locking periodic time
 */
  @Deprecated('Use TTLock.lock.getAutoLockingPeriodicTime() instead. Will be removed in a future version.')
  static void getLockAutomaticLockingPeriodicTime(
      String lockData,
      TTGetLockAutomaticLockingPeriodicTimeCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getAutoLockingPeriodicTime(lockData).then((t) => callback(t.currentTime, t.minTime, t.maxTime)).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock automatic locking periodic time
 */
  @Deprecated('Use TTLock.lock.setAutoLockingPeriodicTime() instead. Will be removed in a future version.')
  static void setLockAutomaticLockingPeriodicTime(int time, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setAutoLockingPeriodicTime(seconds: time, lockData: lockData)
        .then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Set the lock remote unlock switch
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.getRemoteUnlockSwitchState() instead. Will be removed in a future version.')
  static void getLockRemoteUnlockSwitchState(String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getRemoteUnlockSwitchState(lockData).then((isOn) {
      callback(isOn);
    }).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

// ignore: slash_for_doc_comments
/**
 * Get the lock remote unlock switch state
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.setRemoteUnlockSwitchState() instead. Will be removed in a future version.')
  static void setLockRemoteUnlockSwitchState(bool isOn, String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setRemoteUnlockSwitchState(isOn: isOn, lockData: lockData).then((lockDataResult) {
      callback(lockDataResult);
    }).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getLockConfig() instead. Will be removed in a future version.')
  static void getLockConfig(TTLockConfig config, String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    final newConfig = new_enums.TTLockConfig.fromValue(config.index);
    new_api.TTLock.lock.getLockConfig(config: newConfig, lockData: lockData).then((isOn) {
      callback(isOn);
    }).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setLockConfig() instead. Will be removed in a future version.')
  static void setLockConfig(TTLockConfig config, bool isOn, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    final newConfig = new_enums.TTLockConfig.fromValue(config.index);
    new_api.TTLock.lock.setLockConfig(config: newConfig, isOn: isOn, lockData: lockData).then((_) {
      callback();
    }).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setLockDirection() instead. Will be removed in a future version.')
  static void setLockDirection(TTLockDirection direction, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    final newDirection = new_enums.TTLockDirection.fromValue(direction.index);
    new_api.TTLock.lock.setLockDirection(direction: newDirection, lockData: lockData).then((_) {
      callback();
    }).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getLockDirection() instead. Will be removed in a future version.')
  static void getLockDirection(String lockData,
      TTGetLockDirectionCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getLockDirection(lockData).then((direction) {
      callback(TTLockDirection.values[direction.value]);
    }).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.resetLockByCode() instead. Will be removed in a future version.')
  static void resetLockByCode(String lockMac, String resetCode,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.resetLockByCode(
        lockMac: lockMac,resetCode: resetCode
    ).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
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
  @Deprecated('Use TTLock.lock.addPassageMode() instead. Will be removed in a future version.')
  static void addPassageMode(
      TTPassageModeType type,
      List<int>? weekly,
      List<int>? monthly,
      int startTime,
      int endTime,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newType = new_enums.TTPassageModeType.fromValue(type.index);
    new_api.TTLock.lock.addPassageMode(type: newType, weekly: weekly, monthly: monthly, startTime: startTime, endTime: endTime, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }


/**
 * Clear all passage modes
 * 
 * lockData The lock data string used to operate lock
 */
  @Deprecated('Use TTLock.lock.clearAllPassageModes() instead. Will be removed in a future version.')
  static void clearAllPassageModes(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.clearAllPassageModes(lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.activateLift() instead. Will be removed in a future version.')
  static void activateLift(String floors, String lockData,
      TTLiftCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.activateLift(floors: floors, lockData: lockData).then((r) {
      callback(r.lockTime, r.electricQuantity, r.uniqueId);
    }).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setLiftControlable() instead. Will be removed in a future version.')
  static void setLiftControlAble(String floors, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setLiftControlable(floors: floors, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setLiftWorkMode() instead. Will be removed in a future version.')
  static void setLiftWorkMode(TTLiftWorkActivateType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    final newType = new_enums.TTLiftWorkActivateType.fromValue(type.index);
    new_api.TTLock.lock.setLiftWorkMode(type: newType, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setPowerSaverWorkMode() instead. Will be removed in a future version.')
  static void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    final newType = new_enums.TTPowerSaverWorkType.fromValue(type.index);
    new_api.TTLock.lock.setPowerSaverWorkMode(type: newType, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setPowerSaverControlableLock() instead. Will be removed in a future version.')
  static void setPowerSaverControlAbleLock(String lockMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setPowerSaverControlableLock(lockMac: lockMac, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setNBServerAddress() instead. Will be removed in a future version.')
  static void setLockNbAddress(
      String ip,
      String port,
      String lockData,
      TTGetLockElectricQuantityCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setNBServerAddress(ip: ip, port: port, lockData: lockData).then(callback).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
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

  @Deprecated('Use TTLock.lock.setHotel() instead. Will be removed in a future version.')
  static void setHotel(
      String hotelInfo,
      int buildingNumber,
      int floorNumber,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setHotel(hotelInfo: hotelInfo, buildingNumber: buildingNumber, floorNumber: floorNumber, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setHotelCardSector() instead. Will be removed in a future version.')
  static void setHotelCardSector(String sector, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setHotelCardSector(sector: sector, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  // static void getDoorSensorState(String lockData,
  //     TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
  //   invoke(COMMAND_GET_DOOR_SENSOR_STATE, lockData, callback,
  //       fail: failedCallback);
  // }

  @Deprecated('Use TTLock.lock.getLockVersion() instead. Will be removed in a future version.')
  static void getLockVersion(String lockMac, TTGetLockVersionCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getLockVersion(lockMac).then((version) => callback(version)).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.scanWifi() stream instead. Will be removed in a future version.')
  static void scanWifi(String lockData, TTWifiLockScanWifiCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.scanWifi(lockData).listen((wifiList) {
      callback(false, wifiList);
    }, onDone: () => callback(true, []), onError: (e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.configWifi() instead. Will be removed in a future version.')
  static void configWifi(String wifiName, String wifiPassword, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.configWifi(wifiName: wifiName, wifiPassword: wifiPassword, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.configServer() instead. Will be removed in a future version.')
  static void configServer(String ip, String port, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.configServer(ip: ip, port: port, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getWifiInfo() instead. Will be removed in a future version.')
  static void getWifiInfo(String lockData,
      TTWifiLockGetWifiInfoCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getWifiInfo(lockData).then((info) => callback(TTWifiInfoModel({'wifiMac': info.wifiMac, 'wifiRssi': info.wifiRssi}))).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.configIp() with TTIpSetting or platform.invoke. Will be removed in a future version.')
  static void configIp(
    Map map,
    String lockData,
    TTSuccessCallback callback,
    TTFailedCallback failedCallback,
  ) {
    map[TTResponse.lockData] = lockData;
    map[TTResponse.ipSettingJsonStr] = convert.jsonEncode(map);
    new_api.TTLock.platform.invoke(COMMAND_CONFIG_IP, map).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setSoundVolume() instead. Will be removed in a future version.')
  static void setLockSoundWithSoundVolume(
      TTSoundVolumeType type,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newType = new_enums.TTSoundVolumeType.fromValue(type.index);
    new_api.TTLock.lock.setSoundVolume(type: newType, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getSoundVolume() instead. Will be removed in a future version.')
  static void getLockSoundWithSoundVolume(
      String lockData,
      TTGetLockSoundWithSoundVolumeCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.getSoundVolume(lockData).then((type) => callback(TTSoundVolumeType.values[type.value])).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
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

  @Deprecated('Use TTLock.lock.addRemoteKey() instead. Will be removed in a future version.')
  static void addRemoteKey(
      String remoteKeyMac,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.addRemoteKey(remoteKeyMac: remoteKeyMac, cycleList: newCycleList, startDate: startDate, endDate: endDate, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.deleteRemoteKey() instead. Will be removed in a future version.')
  static void deleteRemoteKey(String remoteKeyMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.deleteRemoteKey(remoteKeyMac: remoteKeyMac, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.clearRemoteKey() instead. Will be removed in a future version.')
  static void clearRemoteKey(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.clearRemoteKey(lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setRemoteKeyValidDate() instead. Will be removed in a future version.')
  static void setRemoteKeyValidDate(
      String remoteKeyMac,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.setRemoteKeyValidDate(remoteKeyMac: remoteKeyMac, cycleList: newCycleList, startDate: startDate, endDate: endDate, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.getRemoteAccessoryElectricQuantity() instead. Will be removed in a future version.')
  static void getRemoteAccessoryElectricQuantity(
      TTRemoteAccessory remoteAccessory,
      String remoteAccessoryMac,
      String lockData,
      TTGetLockAccessoryElectricQuantity callback,
      TTFailedCallback failedCallback) {
    final accessory = new_enums.TTRemoteAccessory.fromValue(remoteAccessory.index);
    new_api.TTLock.lock.getRemoteAccessoryElectricQuantity(accessory: accessory, mac: remoteAccessoryMac, lockData: lockData).then((r) => callback(r.electricQuantity, r.updateDate)).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.addDoorSensor() instead. Will be removed in a future version.')
  static void addDoorSensor(String doorSensorMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.addDoorSensor(doorSensorMac: doorSensorMac, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.deleteDoorSensor() instead. Will be removed in a future version.')
  static void deleteDoorSensor(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.deleteDoorSensor(lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setLockDoorSensorAlertTime() instead. Will be removed in a future version.')
  static void setDoorSensorAlertTime(String lockData, int alertTime,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setDoorSensorAlertTime(
        alertTime: alertTime,lockData: lockData
    ).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setLockEnterUpgradeMode() instead. Will be removed in a future version.')
  static void setLockEnterUpgradeMode(String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setLockEnterUpgradeMode(lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.verifyLock() instead. Will be removed in a future version.')
  static void verifyLock(String lockMac, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.verifyLock(lockMac).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.addFace() stream instead. Will be removed in a future version.')
  static void addFace(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddFaceProgressCallback progressCallback,
      TTAddFaceSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.addFace(cycleList: newCycleList, startDate: startDate, endDate: endDate, lockData: lockData).listen(
      (e) {
        if (e is new_api.AddFaceProgress) {
          progressCallback(
            TTFaceState.values[e.state.value],
            TTFaceErrorCode.values[e.errorCode.value],
          );
        } else if (e is new_api.AddFaceComplete) {
          callback(e.faceNumber);
        }
      },
      onError: (err) {
        if (err is new_api.TTLockException) failedCallback(_toClassicLockError(err), err.message);
        else failedCallback(TTLockError.fail, err.toString());
      },
    );
  }

  @Deprecated('Use TTLock.lock.addFaceData() instead. Will be removed in a future version.')
  static void addFaceData(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String faceFeatureData,
      String lockData,
      TTAddFaceSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.addFaceData(cycleList: newCycleList, startDate: startDate, endDate: endDate, faceFeatureData: faceFeatureData, lockData: lockData).then((faceNumber) => callback(faceNumber)).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.modifyFace() instead. Will be removed in a future version.')
  static void modifyFace(
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String faceNumber,
      String lockData,
      TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    final newCycleList = cycleList?.map((c) => new_lock_models.TTCycleModel(weekDay: c.weekDay, startTime: c.startTime, endTime: c.endTime)).toList();
    new_api.TTLock.lock.modifyFace(faceNumber: faceNumber, cycleList: newCycleList, startDate: startDate, endDate: endDate, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.clearFace() instead. Will be removed in a future version.')
  static void clearFace(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    new_api.TTLock.lock.clearFace(lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.deleteFace() instead. Will be removed in a future version.')
  static void deleteFace(String faceNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.deleteFace(faceNumber: faceNumber, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

  @Deprecated('Use TTLock.lock.setLockWorkingTime() instead. Will be removed in a future version.')
  static void setLockWorkingTime(int startDate, int endDate, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    new_api.TTLock.lock.setLockWorkingTime(startDate: startDate, endDate: endDate, lockData: lockData).then((_) => callback()).catchError((e) {
      if (e is new_api.TTLockException) failedCallback(_toClassicLockError(e), e.message);
      else failedCallback(TTLockError.fail, e.toString());
    });
  }

//执行方法 - delegates to new API platform; callbacks dispatched via _successCallback/_errorCallback
  static void invoke(
      String command, Object? parameter, Object? success_callback,
      {Object? progress_callback,
      Object? fail_callback,
      Object? other_fail_callback}) {
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

    new_api.TTLock.platform.invoke(command, parameter).then((data) {
      _successCallback(command, data);
    }).catchError((e) {
      final code = e is new_api.TTException ? e.code : TTLockError.fail.index;
      final msg = e is new_api.TTException ? e.message : e.toString();
      _errorCallback(command, code, msg, {});
    });
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
          command ==
              TTStandaloneDoorSensor
                  .COMMAND_START_SCAN_STANDALONE_DOOR_SENSOR ||
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
        TTRemoteAccessoryScanCallback scanCallback = callBack;
        scanCallback(TTRemoteAccessoryScanModel(data));
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
      case TTWaterMeter.COMMAND_WATER_METER_SUPPORT_FUNCTION:
      case TTStandaloneDoorSensor.COMMAND_STANDALONE_DOOR_SUPPORT_FUNCTION:
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
      case TTGateway.COMMAND_GET_NETWORK_MAC:
        TTGatewayGetNetWorkMacCallback gatewayGetNetWorkMacCallback = callBack;
        gatewayGetNetWorkMacCallback(data['networkMac'] ?? "");
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

      case TTElectricMeter.COMMAND_START_SCAN_ELECTRIC_METER:
        TTElectricMeterScanCallback scanCallback = callBack;
        scanCallback(TTElectricMeterScanModel(data));
        break;

      case TTElectricMeter.COMMAND_ELECTRIC_METER_INIT:
        TTElectricMeterSuccessResultCallback resultCallback = callBack;
        resultCallback(data[TTResponse.electricMeterId]);
        break;

      case TTWaterMeter.COMMAND_START_SCAN_WATER_METER:
        TTWaterMeterScanCallback scanCallback = callBack;
        scanCallback(TTWaterMeterScanModel(data));
        break;

      case TTWaterMeter.COMMAND_WATER_METER_INIT:
        TTWaterMeterSuccessResultCallback resultCallback = callBack;
        resultCallback(
            data[TTResponse.waterMeterId], data[TTResponse.featureValue]);
        break;

      case TTWaterMeter.COMMAND_WATER_METER_GET_DEVICE_INFO:
        TTWaterMeterDeviceInfoCallback resultCallback = callBack;
        resultCallback(TTWaterDeviceInfoModel(data));
        break;

      case TTDoorSensor.COMMAND_START_SCAN_DOOR_SENSOR:
        TTDoorSensorScanCallback scanCallback = callBack;
        scanCallback(TTDoorSensorScanModel(data));
        break;

      case TTDoorSensor.COMMAND_INIT_DOOR_SENSOR:
        TTGetLockSystemCallback getLockSystemCallback = callBack;
        getLockSystemCallback(TTLockSystemModel(data));
        break;

      case TTStandaloneDoorSensor.COMMAND_START_SCAN_STANDALONE_DOOR_SENSOR:
        TTDoorSensorScanCallback scanCallback = callBack;
        scanCallback(TTDoorSensorScanModel(data));
        break;

      case TTStandaloneDoorSensor.COMMAND_INIT_STANDALONE_DOOR_SENSOR:
        TTStandaloneDoorSensorInitSuccessResultCallback initSuccessCallback =
            callBack;
        initSuccessCallback(TTStandaloneDoorSensorInfo(data));
        break;

      case TTStandaloneDoorSensor.COMMAND_STANDALONE_DOOR_GET_FEATURE_VALUE:
        TTStandaloneDoorSensorGetFeatureValueCallback getFeatureValueCallback =
            callBack;
        getFeatureValueCallback(data[TTResponse.standaloneDoorFeature]);
        break;

      default:
        TTSuccessCallback successCallback = callBack;
        successCallback();
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
        !(command ==
                TTRemoteKeypad
                    .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT &&
            data["errorDevice"] == TTErrorDevice.keyPad.index &&
            errorCode ==
                TTRemoteKeyPadAccessoryError.duplicateFingerprint.index)) {
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
      TTRemoteAccessoryError error = TTRemoteAccessoryError.values[0];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    }

    //独立门磁失败处理
    else if (command ==
        TTStandaloneDoorSensor.COMMAND_INIT_STANDALONE_DOOR_SENSOR) {
      TTStandaloneDoorSensorFailedCallback? failedCallback = callBack;
      TTStandaloneDoorSensorErrorCode error =
          TTStandaloneDoorSensorErrorCode.values[errorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    } 
    
    else if (command ==
            TTRemoteKeypad
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK ||
        command ==
            TTRemoteKeypad
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK) {
      TTRemoteKeypadFailedCallback? failedCallback = callBack;
      TTRemoteKeyPadAccessoryError error =
          TTRemoteKeyPadAccessoryError.values[errorCode];
      if (failedCallback != null) {
        failedCallback(error, errorMessage);
      }
    }

    // 多功能键盘失败处理
    else if ((command ==
            TTRemoteKeypad.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD) ||
        command ==
            TTRemoteKeypad
                .COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT ||
        command ==
            TTRemoteKeypad.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD) {
      print('errorCallback: $command, $errorCode, $errorMessage, $data');
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
}

// Placeholder classes for command constants used in _successCallback/_errorCallback (gateway/accessory commands).
class TTGateway {
  static const String COMMAND_START_SCAN_GATEWAY = 'startScanGateway';
  static const String COMMAND_GET_SURROUND_WIFI = 'getSurroundWifi';
  static const String COMMAND_CONNECT_GATEWAY = 'connectGateway';
  static const String COMMAND_INIT_GATEWAY = 'initGateway';
  static const String COMMAND_GET_NETWORK_MAC = 'getNetworkMac';
  static const String COMMAND_CONFIG_IP = 'gatewayConfigIp';
  static const String COMMAND_UPGRADE_GATEWAY = 'upgradeGateway';
}

class TTRemoteKey {
  static const String COMMAND_START_SCAN_REMOTE_KEY = 'startScanRemoteKey';
  static const String COMMAND_INIT_REMOTE_KEY = 'initRemoteKey';
}

class TTRemoteKeypad {
  static const String COMMAND_START_SCAN_REMOTE_KEYPAD = 'remoteKeypadStartScan';
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD = 'multifunctionalRemoteKeypadAddCard';
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT = 'multifunctionalRemoteKeypadAddFingerprint';
  static const String COMMAND_INIT_REMOTE_KEYPAD = 'remoteKeypadInit';
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK = 'multifunctionalRemoteKeypadGetLocks';
  static const String COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD = 'multifunctionalRemoteKeypadInit';
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK = 'multifunctionalRemoteKeypadDeleteLock';
}

class TTDoorSensor {
  static const String COMMAND_START_SCAN_DOOR_SENSOR = 'doorSensorStartScan';
  static const String COMMAND_INIT_DOOR_SENSOR = 'doorSensorInit';
}

class TTStandaloneDoorSensor {
  static const String COMMAND_START_SCAN_STANDALONE_DOOR_SENSOR = 'startScanStandaloneDoorSensor';
  static const String COMMAND_INIT_STANDALONE_DOOR_SENSOR = 'initStandaloneDoorSensor';
  static const String COMMAND_STANDALONE_DOOR_SUPPORT_FUNCTION = 'standaloneDoorSupportFunction';
  static const String COMMAND_STANDALONE_DOOR_GET_FEATURE_VALUE = 'standaloneDoorGetFeatureValue';
}

class TTWaterMeter {
  static const String COMMAND_START_SCAN_WATER_METER = 'startScanWaterMeter';
  static const String COMMAND_WATER_METER_INIT = 'waterMeterInit';
  static const String COMMAND_WATER_METER_GET_DEVICE_INFO = 'waterMeterGetDeviceInfo';
  static const String COMMAND_WATER_METER_SUPPORT_FUNCTION = 'waterMeterSupportFunction';
}

class TTElectricMeter {
  static const String COMMAND_START_SCAN_ELECTRIC_METER = 'startScanElectricMeter';
  static const String COMMAND_ELECTRIC_METER_INIT = 'electricMeterInit';
}

class TTElectricMeterScanModel {
  TTElectricMeterScanModel(Map data) {}
}

class TTWaterMeterScanModel {
  TTWaterMeterScanModel(Map data) {}
}

class TTWaterDeviceInfoModel {
  TTWaterDeviceInfoModel(Map data) {}
}

class TTStandaloneDoorSensorInfo {
  TTStandaloneDoorSensorInfo(Map data) {}
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

  static const String electricMeterId = "electricMeterId";
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

  static const String executeResponse = "executeResponse";
  static const String waterMeterId = "waterMeterId";
  static const String featureValue = "featureValue";

  static const String catOneOperator = 'catOneOperator';
  static const String catOneNodeId = 'catOneNodeId';
  static const String catOneCardNumber = 'catOneCardNumber';
  static const String catOneRssi = 'catOneRssi';
  static const String catOneImsi = 'catOneImsi';
  static const String apn = 'apn';

  static const String standaloneInfoStr = "standaloneInfoStr";
  static const String standaloneDoorFeature = "standaloneDoorFeature";
  static const String doorSensorData = "doorSensorData";
  static const String wifiMac = "wifiMac";
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
typedef TTGatewayGetNetWorkMacCallback = void Function(String networkMac);
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
typedef TTElectricMeterSuccessResultCallback = void Function(
    int electricMeterId);

typedef TTMeterFailedCallback = void Function(
    TTMeterErrorCode errorCode, String message);
typedef TTWaterMeterScanCallback = void Function(
    TTWaterMeterScanModel scanModel);
typedef TTWaterMeterSuccessResultCallback = void Function(
    int waterMeterId, String featureValue);
typedef TTWaterMeterDeviceInfoCallback = void Function(
    TTWaterDeviceInfoModel deviceInfoModel);

typedef TTDoorSensorScanCallback = void Function(
    TTDoorSensorScanModel scanModel);
typedef TTStandaloneDoorSensorInitSuccessResultCallback = void Function(
    TTStandaloneDoorSensorInfo standaloneDoorSensorInfo);
typedef TTStandaloneDoorSensorFailedCallback = void Function(
    TTStandaloneDoorSensorErrorCode errorCode, String errorMsg);
typedef TTStandaloneDoorSensorGetFeatureValueCallback = void Function(
    String featureValue);

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
  int scanTime = 0;

  TTDoorSensorScanModel(Map map) {
    this.name = map["name"];
    this.mac = map["mac"];
    this.rssi = map["rssi"];
    this.scanTime = map["scanTime"] ?? 0;
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

enum TTStandaloneDoorSensorFeature {
  Wifi24G,
  Wifi5G,
  AuthCode,
}

enum TTStandaloneDoorSensorErrorCode {
  bluetoothPowerOff,
  connectTimeout,
  disconnect,
  Fail,
  WrongCRC,
  WrongSSID,
  WrongWifiPassword,
}
