import 'package:flutter/services.dart';
import 'package:ttlock_flutter/ttdoorSensor.dart';
import 'package:ttlock_flutter/ttelectricMeter.dart';
import 'package:ttlock_flutter/ttremoteKey.dart';
import 'package:ttlock_flutter/ttremoteKeypad.dart';
import 'package:ttlock_flutter/ttwaterMeter.dart';
import 'dart:convert' as convert;
import 'ttgateway.dart';

/// The `TTLock` class provides a comprehensive suite of static methods to interact with TTLock smart locks.
///
/// This class encapsulates the functionality of the TTLock Flutter plugin,
/// allowing developers to perform a wide range of operations such as scanning for locks,
/// controlling lock and unlock actions, managing passcodes, cards, fingerprints,
/// and configuring various lock settings.
///
/// It communicates with the native TTLock SDKs (for Android and iOS) via a `MethodChannel`.
/// Callbacks are used extensively to handle asynchronous operations and their results.
class TTLock {
  /// A boolean flag to indicate if the on-premise version of the SDK is being used.
  ///
  /// This affects how some methods, like `modifyAdminPasscode`, handle their callbacks.
  /// Defaults to `false`.
  static bool isOnPremise = false;
  /// Retrieves the lock's time directly.
  ///
  /// This method communicates with the native side to get the current time from the lock.
  /// It returns a `Future<String>` which completes with the time string on success,
  /// or an error if the operation fails.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [lockMac] The MAC address of the lock.
  /// Returns a `Future<String>` that completes with the lock's time.
  static Future<String> getLockTimeDirect({
    required String lockData,
    required String lockMac,
}) async {
    Map<String, dynamic> params = {
        "lockData": lockData,
        "lockMac": lockMac,
    };
    // This will now return the time string on success or throw an error on failure.
    return await _commandChannel.invokeMethod('getLockTimeDirect', params);
}

  static final MethodChannel _commandChannel =
      const MethodChannel("com.ttlock/command/ttlock");
  static final EventChannel _listenChannel =
      const EventChannel("com.ttlock/listen/ttlock");

  /// Checks if Bluetooth is enabled on the device.
  ///
  /// Returns a `Future<bool>` that completes with `true` if Bluetooth is enabled, and `false` otherwise.
  static Future<bool> isBLEEnabled() async {
    // Note: The 'activity' parameter is handled on the native side.
    return await _commandChannel.invokeMethod('isBLEEnabled');
  }
// Controls the lock's state with explicit MAC address (Android V3 compatibility).
///
/// [lockData] The lock data string used to operate the lock.
/// [lockMac] The MAC address of the lock.
/// [controlAction] The desired action, either [TTControlAction.lock] or [TTControlAction.unlock].
/// [callback] A callback that provides lock time, electric quantity, and a unique ID on success.
/// [failedCallback] A callback invoked when the control action fails.
static void controlLockWithMac(String lockData, String lockMac, TTControlAction controlAction,
    TTControlLockCallback callback, TTFailedCallback failedCallback) {
  Map map = Map();
  map[TTResponse.lockData] = lockData;
  map[TTResponse.lockMac] = lockMac;  // Add MAC parameter
  map[TTResponse.controlAction] = controlAction.index;
  invoke("controlLockWithMac", map, callback, fail_callback: failedCallback);
}
  /// Requests the user to enable Bluetooth.
  ///
  /// This method will trigger a system dialog asking the user to turn on Bluetooth.
  static Future<void> requestBleEnable() async {
    await _commandChannel.invokeMethod('requestBleEnable');
  }
  static const String CALLBACK_SUCCESS = "callback_success";
  static const String CALLBACK_PROGRESS = "callback_progress";
  static const String CALLBACK_FAIL = "callback_fail";
  static const String CALLBACK_OTHER_FAIL = "callback_other_fail";

  /// Prepares the Bluetooth service for communication.
  ///
  /// This should be called before performing Bluetooth operations.
  static Future<void> prepareBTService() async {
    await _commandChannel.invokeMethod('prepareBTService');
  }

  /// Checks if location services are enabled.
  ///
  /// Location services are often required for Bluetooth scanning on Android.
  /// Returns a `Future<bool>` that completes with `true` if location is enabled, `false` otherwise.
  static Future<bool> isLocationEnabled() async {
    final bool isEnabled = await _commandChannel.invokeMethod('isLocationEnabled');
    return isEnabled;
  }
  /// Command to start scanning for locks.
  static const String COMMAND_START_SCAN_LOCK = "startScanLock";
  /// Command to stop scanning for locks.
  static const String COMMAND_STOP_SCAN_LOCK = "stopScanLock";
  /// Command to get the Bluetooth state.
  static const String COMMAND_GET_BLUETOOTH_STATE = "getBluetoothState";
  /// Command to prepare the Bluetooth service.
  static const String COMMAND_PREPARE_BT_SERVICE = "prepareBTService";
  /// Command to initialize a lock.
  static const String COMMAND_INIT_LOCK = "initLock";
  /// Command to reset a lock.
  static const String COMMAND_RESET_LOCK = "resetLock";

  /// Command to control a lock.
  static const String COMMAND_CONTROL_LOCK = "controlLock";
  /// Command to reset eKeys.
  static const String COMMAND_RESET_EKEY = "resetEkey";
  /// Command to create a custom passcode.
  static const String COMMAND_CREATE_CUSTOM_PASSCODE = "createCustomPasscode";
  /// Command to modify a passcode.
  static const String COMMAND_MODIFY_PASSCODE = "modifyPasscode";
  /// Command to delete a passcode.
  static const String COMMAND_DELETE_PASSCODE = "deletePasscode";
  /// Command to reset passcodes.
  static const String COMMAND_RESET_PASSCODE = "resetPasscodes";
  /// Command to get all valid passcodes.
  static const String COMMAND_GET_ALL_VALID_PASSCODE = "getAllValidPasscode";
  /// Command to modify the admin passcode.
  static const String COMMAND_MODIFY_ADMIN_PASSCODE = "modifyAdminPasscode";
  /// Command to get the admin passcode.
  static const String COMMAND_GET_ADMIN_PASSCODE =
      "getAdminPasscodeWithLockData";
  /// Command to set the admin erase passcode.
  static const String COMMAND_SET_ADMIN_ERASE_PASSCODE =
      "setAdminErasePasscode";

  /// Command to get passcode verification parameters.
  static const String COMMAND_GET_PASSCODE_VERIFICATION_PARAMS =
      "getPasscodeVerificationParamsWithLockData";
  /// Command to recover a passcode.
  static const String COMMAND_RECOVER_PASSCODE =
      "recoverPasscodeWithPasswordType";

  /// Command to add a card.
  static const String COMMAND_ADD_CARD = "addCard";
  /// Command to modify a card.
  static const String COMMAND_MODIFY_CARD = "modifyIcCard";
  /// Command to delete a card.
  static const String COMMAND_DELETE_CARD = "deleteIcCard";
  /// Command to clear all cards.
  static const String COMMAND_CLEAR_ALL_CARD = "clearAllIcCard";
  /// Command to get all valid cards.
  static const String COMMAND_GET_ALL_VALID_CARD = "getAllValidIcCard";
  /// Command to recover a card.
  static const String COMMAND_RECOVER_CARD = "recoverCardWithCardType";
  /// Command to report a lost card.
  static const String COMMAND_REPORT_LOSS_CARD = "reportLossCard";

  /// Command to add a fingerprint.
  static const String COMMAND_ADD_FINGERPRINT = "addFingerprint";
  /// Command to modify a fingerprint.
  static const String COMMAND_MODIFY_FINGERPRINT = "modifyFingerprint";
  /// Command to delete a fingerprint.
  static const String COMMAND_DELETE_FINGERPRINT = "deleteFingerprint";
  /// Command to clear all fingerprints.
  static const String COMMAND_CLEAR_ALL_FINGERPRINT = "clearAllFingerprint";
  /// Command to get all valid fingerprints.
  static const String COMMAND_GET_ALL_VALID_FINGERPRINT =
      "getAllValidFingerprint";

  /// Command to set the lock time.
  static const String COMMAND_SET_LOCK_TIME = "setLockTime";
  /// Command to get the lock time.
  static const String COMMAND_GET_LOCK_TIME = "getLockTime";
  /// Command to get the lock operate record.
  static const String COMMAND_GET_LOCK_OPERATE_RECORD = "getLockOperateRecord";
  /// Command to get the lock power.
  static const String COMMAND_GET_LOCK_POWER = "getLockPower";
  /// Command to get the lock switch state.
  static const String COMMAND_GET_LOCK_SWITCH_STATE = "getLockSwitchState";
  /// Command to get the lock system info.
  static const String COMMAND_GET_LOCK_SYSTEM_INFO =
      "getLockSystemInfoWithLockData";
  /// Command to get the lock feature value.
  static const String COMMAND_GET_LOCK_FRETURE_VALUE = "getLockFreatureValue";

  /// Command to get the lock automatic locking periodic time.
  static const String COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME =
      "getLockAutomaticLockingPeriodicTime";
  /// Command to set the lock automatic locking periodic time.
  static const String COMMAND_SET_AUTOMATIC_LOCK_PERIODIC_TIME =
      "setLockAutomaticLockingPeriodicTime";

  /// Command to get the lock remote unlock switch state.
  static const String COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE =
      "getLockRemoteUnlockSwitchState";
  /// Command to set the lock remote unlock switch state.
  static const String COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE =
      "setLockRemoteUnlockSwitchState";

  /// Command to get the lock config.
  static const String COMMAND_GET_LOCK_CONFIG = "getLockConfig";
  /// Command to set the lock config.
  static const String COMMAND_SET_LOCK_CONFIG = "setLockConfig";

  /// Command to add a passage mode.
  static const String COMMAND_ADD_PASSAGE_MODE = "addPassageMode";
  /// Command to clear all passage modes.
  static const String COMMAND_CLEAR_ALL_PASSAGE_MODE = "clearAllPassageModes";
  /// Command to check if a function is supported.
  static const String COMMAND_FUNCTION_SUPPORT = "functionSupport";

  /// Command to activate lift floors.
  static const String COMMAND_ACTIVE_LIFT_FLOORS = "activateLiftFloors";

  /// Command to set lift controllable floors.
  static const String COMMAND_SET_LIFT_CONTROL_ABLE_FLOORS =
      "setLiftControlableFloors";
  /// Command to set lift work mode.
  static const String COMMAND_SET_LIFT_WORK_MODE = "setLiftWorkMode";

  /// Command to set power saver work mode.
  static const String COMMAND_SET_POWER_SAVER_WORK_MODE =
      "setPowerSaverWorkMode";
  /// Command to set power saver controllable.
  static const String COMMAND_SET_POWER_SAVER_CONTROL_ABLE =
      "setPowerSaverControlable";

  /// Command to set NB server address.
  static const String COMMAND_SET_NB_ADDRESS = "setNBServerAddress";
  /// Command to set NB awake modes.
  static const String COMMAND_SET_NB_AWAKE_MODES = "setNBAwakeModes";
  /// Command to get NB awake modes.
  static const String COMMAND_GET_NB_AWAKE_MODES = "getNBAwakeModes";
  /// Command to set NB awake times.
  static const String COMMAND_SET_NB_AWAKE_TIMES = "setNBAwakeTimes";
  /// Command to get NB awake times.
  static const String COMMAND_GET_NB_AWAKE_TIMES = "getNBAwakeTimes";

  /// Command to set door sensor switch.
  static const String COMMAND_SET_DOOR_SENSOR_SWITCH = "setDoorSensorSwitch";
  /// Command to get door sensor switch.
  static const String COMMAND_GET_DOOR_SENSOR_SWITCH = "getDoorSensorSwitch";
  /// Command to get door sensor state.
  static const String COMMAND_GET_DOOR_SENSOR_STATE = "getDoorSensorState";

  /// Command to set hotel card sector.
  static const String COMMAND_SET_HOTEL_CARD_SECTOR = "setHotelCardSector";
  /// Command to set hotel info.
  static const String COMMAND_SET_HOTEL_INFO = "setHotelInfo";

  /// Command to get the lock version.
  static const String COMMAND_GET_LOCK_VERSION = "getLockVersion";

  /// Command to scan for Wi-Fi.
  static const String COMMAND_SCAN_WIFI = "scanWifi";
  /// Command to configure Wi-Fi.
  static const String COMMAND_CONFIG_WIFI = "configWifi";
  /// Command to configure the server.
  static const String COMMAND_CONFIG_SERVER = "configServer";
  /// Command to get Wi-Fi info.
  static const String COMMAND_GET_WIFI_INFO = "getWifiInfo";
  /// Command to configure IP.
  static const String COMMAND_CONFIG_IP = "configIp";

  /// Command to set the lock sound with sound volume.
  static const String COMMAND_SET_LOCK_SOUND_WITH_SOUND_VOLUME =
      "setLockSoundWithSoundVolume";
  /// Command to get the lock sound with sound volume.
  static const String COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME =
      "getLockSoundWithSoundVolume";

  /// Command to set the lock to enter upgrade mode.
  static const String COMMAND_SET_LOCK_ENTER_UPGRADE_MODE =
      "setLockEnterUpgradeMode";

  /// Command to add a lock remote key.
  static const String COMMAND_ADD_LOCK_REMOTE_KEY = "lockAddRemoteKey";
  /// Command to delete a lock remote key.
  static const String COMMAND_DELETE_LOCK_REMOTE_KEY = "lockDeleteRemoteKey";
  /// Command to set the lock remote key valid date.
  static const String COMMAND_SET_LOCK_REMOTE_KEY_VALID_DATE =
      "lockModifyRemoteKeyValidDate";
  /// Command to clear the remote key.
  static const String COMMAND_CLEAR_REMOTE_KEY = "clearRemoteKey";
  /// Command to get the lock remote accessory electric quantity.
  static const String COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY =
      "lockGetRemoteAccessoryElectricQuantity";

  /// Command to add a lock door sensor.
  static const String COMMAND_ADD_LOCK_DOOR_SENSORY = "lockAddDoorSensor";
  /// Command to delete a lock door sensor.
  static const String COMMAND_DELETE_LOCK_DOOR_SENSORY = "lockDeleteDoorSensor";
  /// Command to set the lock door sensor alert time.
  static const String COMMAND_SET_LOCK_DOOR_SENSORY_ALERT_TIME =
      "lockSetDoorSensorAlertTime";

  /// Command to get the lock direction.
  static const String COMMAND_GET_LOCK_DIRECTION = "getLockDirection";
  /// Command to set the lock direction.
  static const String COMMAND_SET_LOCK_DIRECTION = "setLockDirection";
  /// Command to reset the lock by code.
  static const String COMMAND_RESET_LOCK_BY_CODE = "resetLockByCode";

  /// Command to verify the lock.
  static const String COMMAND_VERIFY_LOCK = "verifyLock";

  /// Command to add a face.
  static const String COMMAND_ADD_FACE = "faceAdd";
  /// Command to add face data.
  static const String COMMAND_ADD_FACE_DATA = "faceDataAdd";
  /// Command to modify a face.
  static const String COMMAND_MODIFY_FACE = "faceModify";
  /// Command to delete a face.
  static const String COMMAND_DELETE_FACE = "faceDelete";
  /// Command to clear all faces.
  static const String COMMAND_CLEAR_FACE = "faceClear";
  /// Command to set the working time.
  static const String COMMAND_SET_WORKING_TIME = "setLockWorkingTime";

  // static const String COMMAND_GET_PASSCODE_VERIFICATION_PARAMS = "getPasscodeVerificationParams";

  static Map<String, List<Map>> _commandMap = Map();

  static bool printLog = false;

  /// Starts scanning for nearby smart locks that are broadcasting.
  ///
  /// The [scanCallback] will be invoked for each lock found.
  ///
  /// [scanCallback] A callback that provides a [TTLockScanModel] for each discovered lock.
  static void startScanLock(TTLockScanCallback scanCallback) {
    invoke(COMMAND_START_SCAN_LOCK, null, scanCallback);
  }

  /// Stops scanning for smart locks.
  static void stopScanLock() {
    invoke(COMMAND_STOP_SCAN_LOCK, null, null);
  }
  /// Gets the current Bluetooth state of the device.
  ///
  /// [stateCallback] A callback that returns the current [TTBluetoothState].
  static void getBluetoothState(TTBluetoothStateCallback stateCallback) {
    invoke(COMMAND_GET_BLUETOOTH_STATE, null, stateCallback);
  }

  /// Initializes a lock.
  ///
  /// This process is required for a new lock to be used with the SDK.
  /// The [map] parameter should contain lock-specific data required for initialization,
  /// typically including `lockMac`, `lockVersion`, and `isInited`.
  ///
  /// [map] A map containing the lock's data for initialization.
  /// [callback] A callback that returns the lock data on successful initialization.
  /// [failedCallback] A callback invoked when the initialization fails.
  static void initLock(
      Map map, TTLockDataCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_INIT_LOCK, map, callback, fail_callback: failedCallback);
  }

  /// Resets a lock to its factory settings.
  ///
  /// This operation will erase all data on the lock, including passcodes, cards, and fingerprints.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked upon successful reset.
  /// [failedCallback] A callback invoked when the reset operation fails.
  static void resetLock(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_LOCK, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Resets all eKeys associated with the lock.
  ///
  /// This will invalidate all electronic keys that have been shared for this lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns updated lock data on success.
  /// [failedCallback] A callback invoked when the operation fails.
  static void resetEkey(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_EKEY, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Checks if a specific function is supported by the lock.
  ///
  /// Use this to determine if a lock has a certain capability before attempting to use it.
  ///
  /// [function] The [TTLockFunction] to check for.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns `true` if the function is supported, `false` otherwise.
  static void supportFunction(TTLockFunction fuction, String lockData,
      TTFunctionSupportCallback callback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.supportFunction] = fuction.index;
    invoke(COMMAND_FUNCTION_SUPPORT, map, callback);
  }

  /// Controls the lock's state (lock or unlock).
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [controlAction] The desired action, either [TTControlAction.lock] or [TTControlAction.unlock].
  /// [callback] A callback that provides lock time, electric quantity, and a unique ID on success.
  /// [failedCallback] A callback invoked when the control action fails.
  static void controlLock(String lockData, TTControlAction controlAction,
      TTControlLockCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.controlAction] = controlAction.index;
    invoke(COMMAND_CONTROL_LOCK, map, callback, fail_callback: failedCallback);
  }

  /// Creates a custom passcode with a specified validity period.
  ///
  /// The passcode must be between 4 and 9 digits.
  ///
  /// [passcode] The desired passcode (4-9 digits).
  /// [startDate] The start time of the passcode's validity (in milliseconds since epoch).
  /// [endDate] The end time of the passcode's validity (in milliseconds since epoch).
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful creation.
  /// [failedCallback] A callback invoked when the creation fails.
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

  /// Modifies an existing passcode or its validity period.
  ///
  /// To change the passcode, provide a [passcodeNew]. To only update the validity,
  /// set [passcodeNew] to `null`. The new passcode must be 4-9 digits.
  ///
  /// [passcodeOrigin] The original passcode to be modified.
  /// [passcodeNew] The new passcode (4-9 digits), or `null` to only change the date.
  /// [startDate] The new start time of the passcode's validity (in milliseconds since epoch).
  /// [endDate] The new end time of the passcode's validity (in milliseconds since epoch).
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful modification.
  /// [failedCallback] A callback invoked when the modification fails.
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

  /// Deletes a passcode from the lock.
  ///
  /// [passcode] The passcode to be deleted.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful deletion.
  /// [failedCallback] A callback invoked when the deletion fails.
  static void deletePasscode(String passcode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.passcode] = passcode;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_DELETE_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

  /// Resets all passcodes on the lock, except for the admin passcode.
  ///
  /// After this operation, only the admin passcode will be valid.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns updated lock data on success.
  /// [failedCallback] A callback invoked when the operation fails.
  static void resetPasscode(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_RESET_PASSCODE, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Retrieves the admin passcode from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the admin passcode.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getAdminPasscode(String lockData,
      TTGetAdminPasscodeCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_ADMIN_PASSCODE, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Sets or defines an erase passcode for the lock.
  ///
  /// An erase passcode, when used, will delete all other passcodes on the lock.
  ///
  /// [erasePasscode] The passcode to be set as the erase passcode.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting of the erase passcode.
  /// [failedCallback] A callback invoked when the operation fails.
  static void setErasePasscode(String erasePasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.erasePasscode] = erasePasscode;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_ADMIN_ERASE_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

  /// Retrieves a list of all valid passcodes from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns a list of all valid passcodes.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getAllValidPasscode(String lockData,
      TTGetAllPasscodeCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_ALL_VALID_PASSCODE, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Recovers a passcode on the lock.
  ///
  /// This can be used to restore a passcode that was previously on the lock.
  ///
  /// [passcode] The original passcode to recover.
  /// [passcodeNew] The new passcode to be set.
  /// [type] The type of passcode, e.g., permanent, period, etc.
  /// [startDate] The start time for the passcode's validity.
  /// [endDate] The end time for the passcode's validity.
  /// [cycleType] The cycle type for recurring passcodes.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful recovery.
  /// [failedCallback] A callback invoked when the recovery fails.
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

  /// Gets the current switch state of the lock (locked or unlocked).
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the current [TTLockSwitchState].
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockSwitchState(String lockData,
      TTGetLockStatusCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_SWITCH_STATE, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Adds a new IC card to the lock.
  ///
  /// The lock needs to be near the phone to add a card.
  /// A [progressCallback] can be used to guide the user to place the card near the lock.
  ///
  /// [cycleList] An optional list of [TTCycleModel] for setting a cyclic card.
  /// [startDate] The start time of the card's validity (in milliseconds since epoch).
  /// [endDate] The end time of the card's validity (in milliseconds since epoch).
  /// [lockData] The lock data string used to operate the lock.
  /// [progressCallback] A callback to indicate progress, e.g., when to place the card.
  /// [callback] A callback that returns the card number on successful addition.
  /// [failedCallback] A callback invoked when the addition fails.
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

  /// Modifies the validity period of an existing IC card.
  ///
  /// [cardNumber] The number of the card to modify.
  /// [cycleList] An optional list of [TTCycleModel] for setting a cyclic card.
  /// [startDate] The new start time of the card's validity (in milliseconds since epoch).
  /// [endDate] The new end time of the card's validity (in milliseconds since epoch).
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful modification.
  /// [failedCallback] A callback invoked when the modification fails.
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

  /// Deletes an IC card from the lock.
  ///
  /// [cardNumber] The number of the card to delete.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful deletion.
  /// [failedCallback] A callback invoked when the deletion fails.
  static void deleteCard(String cardNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.cardNumber] = cardNumber;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_DELETE_CARD, map, callback, fail_callback: failedCallback);
  }

  /// Retrieves a list of all valid IC cards from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns a list of all valid cards.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getAllValidCards(String lockData, TTGetAllCardsCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_ALL_VALID_CARD, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Clears all IC cards from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked upon successful clearing of all cards.
  /// [failedCallback] A callback invoked when the operation fails.
  static void clearAllCards(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_ALL_CARD, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Recovers a previously deleted IC card.
  ///
  /// [cardNumber] The number of the card to recover.
  /// [startDate] The start time for the card's validity.
  /// [endDate] The end time for the card's validity.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful recovery.
  /// [failedCallback] A callback invoked when the recovery fails.
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

  /// Reports an IC card as lost.
  ///
  /// This action may have different implications depending on the lock's settings.
  ///
  /// [cardNumber] The number of the card to report as lost.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful reporting.
  /// [failedCallback] A callback invoked when the reporting fails.
  static void reportLossCard(String cardNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.cardNumber] = cardNumber;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_REPORT_LOSS_CARD, map, callback,
        fail_callback: failedCallback);
  }

  /// Adds a new fingerprint to the lock.
  ///
  /// The process requires multiple scans of the fingerprint. The [progressCallback]
  /// provides feedback on the number of successful scans.
  ///
  /// [cycleList] An optional list of [TTCycleModel] for setting a cyclic fingerprint.
  /// [startDate] The start time of the fingerprint's validity (in milliseconds since epoch).
  /// [endDate] The end time of the fingerprint's validity (in milliseconds since epoch).
  /// [lockData] The lock data string used to operate the lock.
  /// [progressCallback] A callback that indicates the progress of the fingerprint scanning.
  /// [callback] A callback that returns the fingerprint number on successful addition.
  /// [failedCallback] A callback invoked when the addition fails.
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

  /// Modifies the validity period of an existing fingerprint.
  ///
  /// [fingerprintNumber] The number of the fingerprint to modify.
  /// [cycleList] An optional list of [TTCycleModel] for setting a cyclic fingerprint.
  /// [startDate] The new start time of the fingerprint's validity (in milliseconds since epoch).
  /// [endDate] The new end time of the fingerprint's validity (in milliseconds since epoch).
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful modification.
  /// [failedCallback] A callback invoked when the modification fails.
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

  /// Deletes a fingerprint from the lock.
  ///
  /// [fingerprintNumber] The number of the fingerprint to delete.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful deletion.
  /// [failedCallback] A callback invoked when the deletion fails.
  static void deleteFingerprint(String fingerprintNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.fingerprintNumber] = fingerprintNumber;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_DELETE_FINGERPRINT, map, callback,
        fail_callback: failedCallback);
  }

  /// Clears all fingerprints from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked upon successful clearing of all fingerprints.
  /// [failedCallback] A callback invoked when the operation fails.
  static void clearAllFingerprints(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_ALL_FINGERPRINT, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Retrieves a list of all valid fingerprints from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns a list of all valid fingerprints.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getAllValidFingerprints(String lockData,
      TTGetAllFingerprintsCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_ALL_VALID_FINGERPRINT, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Gets parameters required for passcode verification.
  ///
  /// These parameters might be used for server-side verification of passcodes.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the verification parameters as a string.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getPasscodeVerificationParams(String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_PASSCODE_VERIFICATION_PARAMS, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Modifies the admin passcode of the lock.
  ///
  /// The new admin passcode must be between 4 and 9 digits.
  ///
  /// [adminPasscode] The new admin passcode (4-9 digits).
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful modification.
  /// [failedCallback] A callback invoked when the modification fails.
  static void modifyAdminPasscode(String adminPasscode, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.adminPasscode] = adminPasscode;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_MODIFY_ADMIN_PASSCODE, map, callback,
        fail_callback: failedCallback);
  }

  /// Sets the time on the lock.
  ///
  /// It's important to keep the lock's time synchronized for time-based features to work correctly.
  ///
  /// [timestamp] The current time as a timestamp in milliseconds since epoch.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful time setting.
  /// [failedCallback] A callback invoked when the operation fails.
  static void setLockTime(int timestamp, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.timestamp] = timestamp;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LOCK_TIME, map, callback, fail_callback: failedCallback);
  }

  /// Gets the current time from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the lock's time as a timestamp.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockTime(String lockData, TTGetLockTimeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_TIME, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Retrieves the operation records from the lock.
  ///
  /// You can get either the latest records since the last read or all records stored in the lock.
  ///
  /// [type] The type of record to retrieve: [TTOperateRecordType.latest] or [TTOperateRecordType.total].
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the operation records as a string.
  /// [failedCallback] A callback invoked when the operation fails.
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

  /// Gets the battery level of the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the electric quantity (battery level).
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockPower(
      String lockData,
      TTGetLockElectricQuantityCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_POWER, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Retrieves system information from the lock.
  ///
  /// This can include model number, hardware/firmware revisions, etc.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns a [TTLockSystemModel] with the system info.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockSystemInfo(String lockData,
      TTGetLockSystemCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_SYSTEM_INFO, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Gets the feature value of the lock.
  ///
  /// The feature value is a string that encodes the capabilities of the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the feature value as a string.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockFeatureValue(String lockData, TTLockDataCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_FRETURE_VALUE, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Gets the automatic locking periodic time of the lock.
  ///
  /// This is the duration after which the lock will automatically re-lock itself.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the current, min, and max possible times.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockAutomaticLockingPeriodicTime(
      String lockData,
      TTGetLockAutomaticLockingPeriodicTimeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Sets the automatic locking periodic time of the lock.
  ///
  /// [time] The auto-lock time in seconds.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the operation fails.
  static void setLockAutomaticLockingPeriodicTime(int time, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.currentTime] = time;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_AUTOMATIC_LOCK_PERIODIC_TIME, map, callback,
        fail_callback: failedCallback);
  }

  /// Gets the state of the remote unlock switch.
  ///
  /// This determines if the lock can be unlocked remotely (e.g., via a gateway).
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns `true` if remote unlock is on, `false` otherwise.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockRemoteUnlockSwitchState(String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Sets the state of the remote unlock switch.
  ///
  /// [isOn] `true` to enable remote unlock, `false` to disable it.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns updated lock data on success.
  /// [failedCallback] A callback invoked when the operation fails.
  static void setLockRemoteUnlockSwitchState(bool isOn, String lockData,
      TTLockDataCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE, map, callback,
        fail_callback: failedCallback);
  }

  /// Gets the state of a specific lock configuration.
  ///
  /// [config] The [TTLockConfig] to query.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns `true` if the config is on, `false` otherwise.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockConfig(TTLockConfig config, String lockData,
      TTGetSwitchStateCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.index;
    invoke(COMMAND_GET_LOCK_CONFIG, map, callback,
        fail_callback: failedCallback);
  }

  /// Sets the state of a specific lock configuration.
  ///
  /// [config] The [TTLockConfig] to modify.
  /// [isOn] `true` to enable the configuration, `false` to disable it.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful configuration.
  /// [failedCallback] A callback invoked when the operation fails.
  static void setLockConfig(TTLockConfig config, bool isOn, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.isOn] = isOn;
    map[TTResponse.lockData] = lockData;
    map[TTResponse.lockConfig] = config.index;
    invoke(COMMAND_SET_LOCK_CONFIG, map, callback,
        fail_callback: failedCallback);
  }

  /// Sets the lock's direction (left or right).
  ///
  /// This is important for locks that have a specific orientation.
  ///
  /// [direction] The [TTLockDirection] to set.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the operation fails.
  static void setLockDirection(TTLockDirection direction, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.direction] = direction.index;
    invoke(COMMAND_SET_LOCK_DIRECTION, map, callback,
        fail_callback: failedCallback);
  }

  /// Gets the lock's currently configured direction.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the current [TTLockDirection].
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockDirection(String lockData,
      TTGetLockDirectionCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_DIRECTION, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Resets the lock using a reset code.
  ///
  /// This is an alternative method for resetting a lock.
  ///
  /// [lockMac] The MAC address of the lock.
  /// [resetCode] The reset code for the lock.
  /// [callback] A callback invoked on successful reset.
  /// [failedCallback] A callback invoked when the reset fails.
  static void resetLockByCode(String lockMac, String resetCode,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.resetCode] = resetCode;
    invoke(COMMAND_RESET_LOCK_BY_CODE, map, callback,
        fail_callback: failedCallback);
  }

  /// Configures passage mode on the lock.
  ///
  /// In passage mode, the lock remains unlocked during specified times.
  ///
  /// [type] The type of passage mode, either [TTPassageModeType.weekly] or [TTPassageModeType.monthly].
  /// [weekly] A list of weekdays (1-7, Monday-Sunday) for weekly passage mode.
  /// [monthly] A list of days of the month (1-31) for monthly passage mode.
  /// [startTime] The start time for passage mode (in minutes from midnight).
  /// [endTime] The end time for passage mode (in minutes from midnight).
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful configuration.
  /// [failedCallback] A callback invoked when the configuration fails.
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

  /// Clears all configured passage modes from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked upon successful clearing.
  /// [failedCallback] A callback invoked when the operation fails.
  static void clearAllPassageModes(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_ALL_PASSAGE_MODE, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Activates a lift for specified floors.
  ///
  /// This is used for elevator control systems.
  ///
  /// [floors] A string representing the floors to be activated.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful activation.
  /// [failedCallback] A callback invoked when activation fails.
  static void activateLift(String floors, String lockData,
      TTLiftCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_ACTIVE_LIFT_FLOORS, map, callback,
        fail_callback: failedCallback);
  }

  /// Sets which floors are controllable by the lift.
  ///
  /// [floors] A string representing the controllable floors.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
  static void setLiftControlAble(String floors, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["floors"] = floors;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LIFT_CONTROL_ABLE_FLOORS, map, callback,
        fail_callback: failedCallback);
  }

  /// Sets the work mode for the lift.
  ///
  /// [type] The [TTLiftWorkActivateType] to set.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
  static void setLiftWorkMode(TTLiftWorkActivateType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["liftWorkActiveType"] = type.index;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LIFT_WORK_MODE, map, callback,
        fail_callback: failedCallback);
  }

  /// Sets the work mode for a power saver device.
  ///
  /// [type] The [TTPowerSaverWorkType] to set.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
  static void setPowerSaverWorkMode(TTPowerSaverWorkType type, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map["powerSaverType"] = type.index;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_POWER_SAVER_WORK_MODE, map, callback,
        fail_callback: failedCallback);
  }

  /// Makes a lock controllable by a power saver device.
  ///
  /// [lockMac] The MAC address of the lock to be controlled.
  /// [lockData] The lock data string of the power saver device.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
  static void setPowerSaverControlAbleLock(String lockMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_POWER_SAVER_CONTROL_ABLE, map, callback,
        fail_callback: failedCallback);
  }

  /// Sets the NB-IoT server address for the lock.
  ///
  /// [ip] The server IP address.
  /// [port] The server port.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the lock's battery level on success.
  /// [failedCallback] A callback invoked when the operation fails.
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



  /// Configures hotel-related information on the lock.
  ///
  /// This is used for hotel lock systems.
  ///
  /// [hotelInfo] Information about the hotel.
  /// [buildingNumber] The building number.
  /// [floorNumber] The floor number.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful configuration.
  /// [failedCallback] A callback invoked when the configuration fails.
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

  /// Sets the hotel card sector on the lock.
  ///
  /// [sector] The card sector to be set.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
  static void setHotelCardSector(String sector, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.sector] = sector;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_HOTEL_CARD_SECTOR, map, callback,
        fail_callback: failedCallback);
  }


  /// Gets the version of the lock.
  ///
  /// [lockMac] The MAC address of the lock.
  /// [callback] A callback that returns the lock's version string.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockVersion(String lockMac, TTGetLockVersionCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockMac] = lockMac;
    invoke(COMMAND_GET_LOCK_VERSION, map, callback,
        fail_callback: failedCallback);
  }

  /// Scans for nearby Wi-Fi networks using the lock.
  ///
  /// This is for Wi-Fi enabled locks. The callback will be invoked multiple times
  /// as networks are found, and finally with `finished` set to `true`.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that provides the list of found Wi-Fi networks.
  /// [failedCallback] A callback invoked when the scan fails.
  static void scanWifi(String lockData, TTWifiLockScanWifiCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_SCAN_WIFI, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Configures the Wi-Fi credentials on the lock.
  ///
  /// [wifiName] The SSID of the Wi-Fi network.
  /// [wifiPassword] The password for the Wi-Fi network.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful configuration.
  /// [failedCallback] A callback invoked when the configuration fails.
  static void configWifi(String wifiName, String wifiPassword, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.wifiName] = wifiName;
    map[TTResponse.wifiPassword] = wifiPassword;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_CONFIG_WIFI, map, callback, fail_callback: failedCallback);
  }

  /// Configures the server address for a Wi-Fi lock.
  ///
  /// [ip] The server IP address.
  /// [port] The server port.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful configuration.
  /// [failedCallback] A callback invoked when the configuration fails.
  static void configServer(String ip, String port, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.ip] = ip;
    map[TTResponse.port] = port;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_CONFIG_SERVER, map, callback, fail_callback: failedCallback);
  }

  /// Gets Wi-Fi information from the lock.
  ///
  /// This can include the connected Wi-Fi's MAC address and RSSI.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns a [TTWifiInfoModel] with the Wi-Fi info.
  /// [failedCallback] A callback invoked when the operation fails.
  static void getWifiInfo(String lockData,
      TTWifiLockGetWifiInfoCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_WIFI_INFO, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Configures the IP settings for a Wi-Fi lock (e.g., static IP).
  ///
  /// [map] A map containing the IP configuration details.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful configuration.
  /// [failedCallback] A callback invoked when the configuration fails.
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

  /// Sets the sound volume of the lock.
  ///
  /// [type] The desired sound volume level, as a [TTSoundVolumeType].
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
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

  /// Gets the current sound volume of the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the current [TTSoundVolumeType].
  /// [failedCallback] A callback invoked when the operation fails.
  static void getLockSoundWithSoundVolume(
      String lockData,
      TTGetLockSoundWithSoundVolumeCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME, lockData, callback,
        fail_callback: failedCallback);
  }


  /// Adds a remote key to the lock.
  ///
  /// [remoteKeyMac] The MAC address of the remote key.
  /// [cycleList] An optional list for setting a cyclic validity period.
  /// [startDate] The start time of the remote key's validity.
  /// [endDate] The end time of the remote key's validity.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful addition.
  /// [failedCallback] A callback invoked when the addition fails.
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

  /// Deletes a remote key from the lock.
  ///
  /// [remoteKeyMac] The MAC address of the remote key to delete.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful deletion.
  /// [failedCallback] A callback invoked when the deletion fails.
  static void deleteRemoteKey(String remoteKeyMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = remoteKeyMac;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_DELETE_LOCK_REMOTE_KEY, map, callback,
        fail_callback: failedCallback);
  }

  /// Clears all remote keys from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked upon successful clearing.
  /// [failedCallback] A callback invoked when the operation fails.
  static void clearRemoteKey(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_CLEAR_REMOTE_KEY, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Sets or modifies the validity period of a remote key.
  ///
  /// [remoteKeyMac] The MAC address of the remote key.
  /// [cycleList] An optional list for setting a cyclic validity period.
  /// [startDate] The new start time of the remote key's validity.
  /// [endDate] The new end time of the remote key's validity.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
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

  /// Gets the battery level of a remote accessory (e.g., remote key, keypad, door sensor).
  ///
  /// [remoteAccessory] The type of the accessory.
  /// [remoteAccessoryMac] The MAC address of the accessory.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the battery level and update date.
  /// [failedCallback] A callback invoked when the operation fails.
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

  /// Adds a door sensor to the lock.
  ///
  /// [doorSensorMac] The MAC address of the door sensor.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful addition.
  /// [failedCallback] A callback invoked when the addition fails.
  static void addDoorSensor(String doorSensorMac, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.mac] = doorSensorMac;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_ADD_LOCK_DOOR_SENSORY, map, callback,
        fail_callback: failedCallback);
  }

  /// Deletes the door sensor from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful deletion.
  /// [failedCallback] A callback invoked when the deletion fails.
  static void deleteDoorSensor(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    invoke(COMMAND_DELETE_LOCK_DOOR_SENSORY, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Sets the alert time for the door sensor.
  ///
  /// This is the duration the door can be open before an alert is triggered.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [alertTime] The alert time in seconds.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
  static void setDoorSensorAlertTime(String lockData, int alertTime,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.alertTime] = alertTime;
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_SET_LOCK_DOOR_SENSORY_ALERT_TIME, map, callback,
        fail_callback: failedCallback);
  }

  /// Puts the lock into firmware upgrade mode.
  ///
  /// After calling this, you can proceed with the firmware upgrade process.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked when the lock successfully enters upgrade mode.
  /// [failedCallback] A callback invoked when the operation fails.
  static void setLockEnterUpgradeMode(String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    invoke(COMMAND_SET_LOCK_ENTER_UPGRADE_MODE, lockData, callback,
        fail_callback: failedCallback);
  }

  /// Verifies the lock.
  ///
  /// This can be used to check the status or presence of a lock.
  ///
  /// [lockMac] The MAC address of the lock to verify.
  /// [callback] A callback invoked on successful verification.
  /// [failedCallback] A callback invoked when verification fails.
  static void verifyLock(String lockMac, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = new Map();
    map[TTResponse.lockMac] = lockMac;
    invoke(COMMAND_VERIFY_LOCK, map, callback, fail_callback: failedCallback);
  }

  /// Adds a new face recognition entry to the lock.
  ///
  /// The process requires the user to position their face in front of the lock.
  /// The [progressCallback] provides feedback on the process.
  ///
  /// [cycleList] An optional list for setting a cyclic validity period.
  /// [startDate] The start time of the face entry's validity.
  /// [endDate] The end time of the face entry's validity.
  /// [lockData] The lock data string used to operate the lock.
  /// [progressCallback] A callback that provides feedback on the face scanning process.
  /// [callback] A callback that returns the face number on successful addition.
  /// [failedCallback] A callback invoked when the addition fails.
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

  /// Adds face recognition data directly to the lock.
  ///
  /// This is an alternative to the interactive `addFace` method, used when
  /// the face feature data is already available.
  ///
  /// [cycleList] An optional list for setting a cyclic validity period.
  /// [startDate] The start time of the face entry's validity.
  /// [endDate] The end time of the face entry's validity.
  /// [faceFeatureData] The pre-captured face feature data.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback that returns the face number on successful addition.
  /// [failedCallback] A callback invoked when the addition fails.
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

  /// Modifies the validity period of an existing face entry.
  ///
  /// [cycleList] An optional list for setting a cyclic validity period.
  /// [startDate] The new start time of the face entry's validity.
  /// [endDate] The new end time of the face entry's validity.
  /// [faceNumber] The number of the face entry to modify.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful modification.
  /// [failedCallback] A callback invoked when the modification fails.
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

  /// Clears all face recognition entries from the lock.
  ///
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked upon successful clearing.
  /// [failedCallback] A callback invoked when the operation fails.
  static void clearFace(String lockData, TTSuccessCallback callback,
      TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    invoke(COMMAND_CLEAR_FACE, map, callback, fail_callback: failedCallback);
  }

  /// Deletes a specific face recognition entry from the lock.
  ///
  /// [faceNumber] The number of the face entry to delete.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful deletion.
  /// [failedCallback] A callback invoked when the deletion fails.
  static void deleteFace(String faceNumber, String lockData,
      TTSuccessCallback callback, TTFailedCallback failedCallback) {
    Map map = Map();
    map[TTResponse.lockData] = lockData;
    map[TTResponse.faceNumber] = faceNumber;
    invoke(COMMAND_DELETE_FACE, map, callback, fail_callback: failedCallback);
  }

  /// Sets the working time for the lock.
  ///
  /// This can be used to define a period during which the lock is operational.
  ///
  /// [startDate] The start time of the working period.
  /// [endDate] The end time of the working period.
  /// [lockData] The lock data string used to operate the lock.
  /// [callback] A callback invoked on successful setting.
  /// [failedCallback] A callback invoked when the setting fails.
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
    if (commandList.length > 0) {
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

/// A utility class that defines constant string keys used in communication with the native TTLock SDK.
/// These keys are used to identify commands, data fields, and status information in the maps
/// passed between the Dart and native layers.
class TTResponse {
  /// The key for the command name.
  static const String command = "command";
  /// The key for the data payload.
  static const String data = "data";
  /// The key for the result state of an operation (e.g., success, fail).
  static const String resultState = "resultState";
  /// The key for the error code.
  static const String errorCode = "errorCode";
  /// The key for the error message.
  static const String errorMessage = "errorMessage";
  /// The key for the state (e.g., Bluetooth state).
  static const String state = "state";
  /// The key for a generic status.
  static const String status = "status";
  /// The key for a list of Wi-Fi networks.
  static const String wifiList = "wifiList";
  /// The key to indicate if a process (like scanning) is finished.
  static const String finished = "finished";

  /// The key for the lock's name.
  static const String lockName = "lockName";
  /// The key for the lock's MAC address.
  static const String lockMac = "lockMac";
  /// The key to check if the lock is initialized.
  static const String isInited = "isInited";
  /// The key to check if unlocking is allowed.
  static const String isAllowUnlock = "isAllowUnlock";
  /// The key to check if the lock is in DFU (firmware upgrade) mode.
  static const String isDfuMode = "isDfuMode";
  /// The key for the lock's battery level.
  static const String electricQuantity = "electricQuantity";
  /// The key for the lock's version information.
  static const String lockVersion = "lockVersion";
  /// The key for the lock's switch state (locked/unlocked).
  static const String lockSwitchState = "lockSwitchState";
  /// The key for the RSSI (Received Signal Strength Indicator).
  static const String rssi = "rssi";
  /// The key for the RSSI value at one meter distance.
  static const String oneMeterRssi = "oneMeterRssi";
  /// The key for a timestamp.
  static const String timestamp = "timestamp";
  /// The key for a special value from the lock.
  static const String specialValue = "specialValue";
  /// The key for the lock's data string.
  static const String lockData = "lockData";
  /// The key for lock configuration settings.
  static const String lockConfig = "lockConfig";
  /// The key for the scan state.
  static const String scanState = "scanState";
  /// The key for passcode information.
  static const String passcodeInfo = "passcodeInfo";
  /// The key for a control action (e.g., lock, unlock).
  static const String controlAction = "controlAction";
  /// The key for the lock's time.
  static const String lockTime = "lockTime";
  /// The key for a unique identifier.
  static const String uniqueId = "uniqueId";
  /// The key for a passcode.
  static const String passcode = "passcode";
  /// The key for a start date/time.
  static const String startDate = "startDate";
  /// The key for an end date/time.
  static const String endDate = "endDate";
  /// The key for an original passcode (used in modification).
  static const String passcodeOrigin = "passcodeOrigin";
  /// The key for a new passcode (used in modification).
  static const String passcodeNew = "passcodeNew";
  /// The key for an IC card number.
  static const String cardNumber = "cardNumber";
  /// The key for a fingerprint number.
  static const String fingerprintNumber = "fingerprintNumber";
  /// The key for the admin passcode.
  static const String adminPasscode = "adminPasscode";
  /// The key for an erase passcode.
  static const String erasePasscode = "erasePasscode";
  /// The key for a total count (e.g., for fingerprint scanning).
  static const String totalCount = "totalCount";
  /// The key for a current count (e.g., for fingerprint scanning).
  static const String currentCount = "currentCount";
  /// The key for operation records.
  static const String records = "records";
  /// The key for a maximum time value.
  static const String maxTime = "maxTime";
  /// The key for a JSON list of cycle models.
  static const String cycleJsonList = "cycleJsonList";
  /// The key for face feature data.
  static const String faceFeatureData = "faceFeatureData";
  /// The key for a face number.
  static const String faceNumber = "faceNumber";

  /// The key for a minimum time value.
  static const String minTime = "minTime";
  /// The key for a current time value.
  static const String currentTime = "currentTime";
  /// The key for a boolean on/off state.
  static const String isOn = "isOn";
  /// The key for the passage mode type.
  static const String passageModeType = "passageModeType";
  /// The key for weekly passage mode settings.
  static const String weekly = "weekly";
  /// The key for monthly passage mode settings.
  static const String monthly = "monthly";

  /// The key for the lock's direction.
  static const String direction = "direction";

  /// The key to check if a function is supported.
  static const String isSupport = "isSupport";
  /// The key for the function to check support for.
  static const String supportFunction = "supportFunction";

  /// The key for NB-IoT awake modes.
  static const String nbAwakeModes = "nbAwakeModes";
  /// The key for a list of NB-IoT awake times.
  static const String nbAwakeTimeList = "nbAwakeTimeList";
  /// The key for minutes.
  static const String minutes = "minutes";
  /// The key for a generic type.
  static const String type = "type";
  /// The key for hotel information.
  static const String hotelInfo = "hotelInfo";
  /// The key for a building number.
  static const String buildingNumber = "buildingNumber";
  /// The key for a floor number.
  static const String floorNumber = "floorNumber";
  /// The key for a hotel card sector.
  static const String sector = "sector";

  /// The key for a stringified list of passcodes.
  static const String passcodeListString = "passcodeListString";
  /// The key for a stringified list of cards.
  static const String cardListString = "cardListString";
  /// The key for a stringified list of fingerprints.
  static const String fingerprintListString = "fingerprintListString";

  /// The key for an NB-IoT server address.
  static const String nbServerAddress = "nbServerAddress";
  /// The key for an NB-IoT server port.
  static const String nbServerPort = "nbServerPort";

  /// The key for a model number.
  static const String modelNum = "modelNum";
  /// The key for a hardware revision.
  static const String hardwareRevision = "hardwareRevision";
  /// The key for a firmware revision.
  static const String firmwareRevision = "firmwareRevision";
  /// The key for an NB-IoT node ID.
  static const String nbNodeId = "nbNodeId";
  /// The key for an NB-IoT operator.
  static const String nbOperator = "nbOperator";
  /// The key for an NB-IoT card number.
  static const String nbCardNumber = "nbCardNumber";
  /// The key for NB-IoT RSSI.
  static const String nbRssi = "nbRssi";

  /// The key for a JSON string to add a gateway.
  static const String addGatewayJsonStr = "addGatewayJsonStr";
  /// The key for an IP address.
  static const String ip = "ip";
  /// The key for a port number.
  static const String port = "port";

  /// The key for a JSON string of IP settings.
  static const String ipSettingJsonStr = "ipSettingJsonStr";
  /// The key for a Wi-Fi name (SSID).
  static const String wifiName = "wifiName";
  /// The key for a Wi-Fi password.
  static const String wifiPassword = "wifiPassword";

  /// The key for a MAC address.
  static const String mac = "mac";
  /// The key for a name.
  static const String name = "name";

  /// The key for a remote accessory type.
  static const String remoteAccessory = "remoteAccessory";

  /// The key for the sound volume type.
  static const String soundVolumeType = "soundVolumeType";

  /// The key for an update date.
  static const String updateDate = "updateDate";
  /// The key for an alert time.
  static const String alertTime = "alertTime";
  /// The key for a wireless keypad's feature value.
  static const String wirelessKeypadFeatureValue = "wirelessKeypadFeatureValue";
  /// The key for a reset code.
  static const String resetCode = "resetCode";

  /// The key for total kilowatt-hours (for electric meters).
  static const String totalKwh = "totalKwh";
  /// The key for remaining kilowatt-hours (for electric meters).
  static const String remainderKwh = "remainderKwh";
  /// The key for voltage (for electric meters).
  static const String voltage = "voltage";
  /// The key for electric current (for electric meters).
  static const String electricCurrent = "electricCurrent";

  /// The key for an on/off status.
  static const String onOff = "onOff";
  /// The key for the payment mode (for meters).
  static const String payMode = "payMode";
  /// The key for a scan time.
  static const String scanTime = "scanTime";
  /// The key for a slot number.
  static const String slotNumber = "slotNumber";

  /// The key for total cubic meters (for water meters).
  static const String totalM3 = "totalM3";
  /// The key for remaining cubic meters (for water meters).
  static const String remainderM3 = "remainderM3";
  /// The key for magnetic interference status (for water meters).
  static const String magneticInterference = "magneticInterference";
  /// The key for water valve failure status (for water meters).
  static const String waterValveFailure = "waterValveFailure";
}

/// Represents the data of a TTLock device discovered during a Bluetooth scan.
///
/// An instance of this class is passed to the [TTLockScanCallback] for each lock found.
class TTLockScanModel {
  /// The name of the lock.
  String lockName = '';
  /// The MAC address of the lock.
  String lockMac = '';
  /// Indicates whether the lock has been initialized.
  bool isInited = true;
  /// Indicates whether the lock is currently allowed to be unlocked.
  bool isAllowUnlock = false;
  // bool isDfuMode;
  /// The battery level of the lock.
  int electricQuantity = -1;
  /// The version of the lock's firmware.
  String lockVersion = '';
  /// The current state of the lock (locked, unlocked, or unknown).
  TTLockSwitchState lockSwitchState = TTLockSwitchState.unknown;
  /// The Received Signal Strength Indicator (RSSI) of the lock's Bluetooth signal.
  int rssi = -1;
  /// The RSSI value calibrated at a distance of one meter.
  int oneMeterRssi = -1;
  /// A timestamp from the lock.
  int timestamp = 0;

  /// Creates a [TTLockScanModel] from a map of data received from the native SDK.
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

/// Represents a recurring time period for features like cyclic passcodes or cards.
class TTCycleModel {
  /// The day of the week, where 1 is Monday and 7 is Sunday.
  int weekDay = 0;
  /// The start time of the valid period, in minutes from midnight.
  int startTime = 0;
  /// The end time of the valid period, in minutes from midnight.
  int endTime = 0;

  /// Converts the [TTCycleModel] to a JSON map.
  /// This is used for serialization when communicating with the native SDK.
  Map toJson() {
    Map map = new Map();
    map["weekDay"] = this.weekDay;
    map["startTime"] = this.startTime;
    map["endTime"] = this.endTime;
    return map;
  }

  /// Creates a [TTCycleModel].
  ///
  /// [weekDay] The day of the week (1 for Monday, ..., 7 for Sunday).
  /// [startTime] The start time in minutes from midnight.
  /// [endTime] The end time in minutes from midnight.
  TTCycleModel(int weekDay, int startTime, int endTime) {
    this.weekDay = weekDay;
    this.startTime = startTime;
    this.endTime = endTime;
  }
}

/// Represents the system information of a TTLock device.
class TTLockSystemModel {
  /// The model number of the lock.
  String? modelNum;
  /// The hardware revision of the lock.
  String? hardwareRevision;
  /// The firmware revision of the lock.
  String? firmwareRevision;
  /// The battery level of the lock.
  int? electricQuantity;

  // NB IOT LOCK
  /// The network operator for an NB-IoT lock.
  String? nbOperator;
  /// The node ID for an NB-IoT lock.
  String? nbNodeId;
  /// The card number for an NB-IoT lock.
  String? nbCardNumber;
  /// The RSSI for an NB-IoT lock.
  String? nbRssi;

  /// The number of keys supported for passcodes.
  String? passcodeKeyNumber;

  /// The updated lock data string.
  String? lockData;

  /// Creates a [TTLockSystemModel] from a map of data received from the native SDK.
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

/// Represents the state of the device's Bluetooth adapter.
enum TTBluetoothState {
  /// The Bluetooth state is unknown.
  unknown,
  /// The Bluetooth adapter is resetting.
  resetting,
  /// Bluetooth is not supported on this device.
  unsupported,
  /// The application is not authorized to use Bluetooth.
  unAuthorized,
  /// Bluetooth is turned off.
  turnOff,
  /// Bluetooth is turned on.
  turnOn
}

/// Defines the type of a passcode.
enum TTPasscodeType {
  /// A one-time use passcode.
  once,
  /// A passcode that is always valid.
  permanent,
  /// A passcode valid for a specific period.
  period,
  /// A passcode that is valid on a recurring cycle.
  cycle
}

/// Specifies the type of operation records to retrieve from the lock.
enum TTOperateRecordType {
  /// Retrieve only the latest records since the last read.
  latest,
  /// Retrieve all records stored in the lock.
  total
}

/// Represents the control actions that can be performed on a lock.
enum TTControlAction {
  /// The action to unlock the lock.
  unlock,
  /// The action to lock the lock.
  lock
}

/// Represents the physical state of the lock.
enum TTLockSwitchState {
  /// The lock is in the locked state.
  lock,
  /// The lock is in the unlocked state.
  unlock,
  /// The state of the lock is unknown.
  unknown
}

/// Defines the type of recurrence for passage mode.
enum TTPassageModeType {
  /// The passage mode repeats on a weekly basis.
  weekly,
  /// The passage mode repeats on a monthly basis.
  monthly
}

/// Represents the result of a command sent to the lock.
enum TTLockResult {
  /// The command was successful.
  success,
  /// The command is in progress (e.g., adding a fingerprint).
  progress,
  /// The command failed.
  fail
}

/// Defines various configuration settings for a lock.
enum TTLockConfig {
  /// Audio feedback setting.
  audio,
  /// Visibility of the passcode on the keypad.
  passcodeVisible,
  /// Lock freeze state.
  freeze,
  /// Tamper alert setting.
  tamperAlert,
  /// Functionality of the reset button.
  resetButton,
  /// Privacy lock (do not disturb) mode.
  privacyLock,
  /// Automatic unlocking at the end of passage mode.
  passageModeAutoUnlock,
  /// Power saving mode for Wi-Fi locks.
  wifiLockPowerSavingMode,
  /// Double authentication requirement.
  doubleAuth,
  /// Public mode setting.
  publicMode,
  /// Automatic unlocking when the battery is low.
  lowBatteryAutoUnlock
}

/// Represents the installation direction of the lock.
enum TTLockDirection {
  /// The lock is installed on the left side of the door.
  left,
  /// The lock is installed on the right side of the door.
  right
}

/// Defines the sound volume levels for the lock.
enum TTSoundVolumeType {
  /// Sound level 1.
  firstLevel,
  /// Sound level 2.
  secondLevel,
  /// Sound level 3.
  thirdLevel,
  /// Sound level 4.
  fourthLevel,
  /// Sound level 5 (highest).
  fifthLevel,
  /// Sound is turned off.
  off,
  /// Sound is turned on (default volume).
  on
}

/// Enumerates the possible errors that can occur during TTLock operations.
enum TTLockError {
  /// The lock has been reset.
  reset, //0
  /// CRC check error.
  crcError, //1
  /// No permission to perform the operation.
  noPermission,
  /// Incorrect admin passcode.
  wrongAdminCode,
  /// No available storage space on the lock.
  noStorageSpace,
  /// The lock is currently in setting mode.
  inSettingMode, //5
  /// No admin has been set up on the lock.
  noAdmin,
  /// The lock is not in setting mode.
  notInSettingMode,
  /// Incorrect dynamic passcode.
  wrongDynamicCode,
  /// The lock has no power.
  noPower,
  /// Passcode has been reset.
  resetPasscode, //10
  /// Error updating passcode index.
  updatePasscodeIndex,
  /// Invalid lock flag position.
  invalidLockFlagPos,
  /// The eKey has expired.
  eKeyExpired,
  /// The passcode length is invalid.
  passcodeLengthInvalid,
  /// The new passcode is the same as the old one.
  samePasscode, //15
  /// The eKey is not active.
  eKeyInactive,
  /// AES key error.
  aesKey,
  /// A generic failure.
  fail,
  /// The passcode already exists.
  passcodeExist,
  /// The passcode does not exist.
  passcodeNotExist, //20
  /// Lack of storage space when adding a passcode.
  lackOfStorageSpaceWhenAddingPasscode,
  /// Invalid parameter length.
  invalidParaLength,
  /// The card does not exist.
  cardNotExist,
  /// The fingerprint is a duplicate.
  fingerprintDuplication,
  /// The fingerprint does not exist.
  fingerprintNotExist, //25
  /// The command is invalid.
  invalidCommand,
  /// The lock is in freeze mode.
  inFreezeMode,
  /// Invalid client parameter.
  invalidClientPara,
  /// The lock is already locked.
  lockIsLocked,
  /// The record does not exist.
  recordNotExist, //30

  /// The lock does not support modifying the passcode.
  notSupportModifyPasscode,
  /// Bluetooth is turned off.
  bluetoothOff,
  /// Connection timed out.
  bluetoothConnectTimeout,
  /// Bluetooth disconnected during the operation.
  bluetoothDisconnection,
  /// The lock is busy with another operation.
  lockIsBusy, //35
  /// The provided lock data is invalid.
  invalidLockData,
  /// A provided parameter is invalid.
  invalidParameter,
  /// Incorrect Wi-Fi name.
  wrongWifi, //38
  /// Incorrect Wi-Fi password.
  wrongWifiPassword
}

/// Defines the activation type for a lift's work mode.
enum TTLiftWorkActivateType {
  /// The lift is activated for all floors.
  allFloors,
  /// The lift is activated only for specific, pre-configured floors.
  specificFloors
}

/// Defines the work type for a power saver device.
enum TTPowerSaverWorkType {
  /// The power saver works with all types of cards.
  allCards,
  /// The power saver is specifically for hotel cards.
  hotelCard,
  /// The power saver is specifically for room cards.
  roomCard
}

/// Defines the methods that can wake an NB-IoT lock.
enum TTNbAwakeMode {
  /// The lock can be woken up by using the keypad.
  keypad,
  /// The lock can be woken up by using a card.
  card,
  /// The lock can be woken up by using a fingerprint.
  fingerprint
}

/// Defines the type of awake time for an NB-IoT lock.
enum TTNbAwakeTimeType {
  /// The lock wakes up at a specific point in time.
  point,
  /// The lock wakes up periodically within an interval.
  interval
}

/// Defines the types of remote accessories that can be paired with a lock.
enum TTRemoteAccessory {
  /// A remote key fob.
  remoteKey,
  /// A wireless keypad.
  remoteKeypad,
  /// A door sensor.
  doorSensor
}

/// A callback that indicates a successful operation with no return value.
typedef TTSuccessCallback = void Function();
/// A callback for failed operations, providing an error code and message.
typedef TTFailedCallback = void Function(
    TTLockError errorCode, String errorMsg);
/// A callback for lock scanning, providing a model of the scanned lock.
typedef TTLockScanCallback = void Function(TTLockScanModel scanModel);
/// A callback for changes in the Bluetooth state.
typedef TTBluetoothStateCallback = void Function(TTBluetoothState state);
/// A callback for changes in the Bluetooth scanning state.
typedef TTBluetoothScanStateCallback = void Function(bool isScanning);
/// A callback that returns generic lock data as a string.
typedef TTLockDataCallback = void Function(String lockData);
/// A callback for the control lock operation, providing lock time, battery, and unique ID.
typedef TTControlLockCallback = void Function(
    int lockTime, int electricQuantity, int uniqueId, String lockData);
/// A callback that returns the admin passcode.
typedef TTGetAdminPasscodeCallback = void Function(String adminPasscode);
/// A callback that returns the lock's battery level.
typedef TTGetLockElectricQuantityCallback = void Function(int electricQuantity);
/// A callback that returns lock operation records.
typedef TTGetLockOperateRecordCallback = void Function(String records);
/// A callback that returns a special value from the lock.
typedef TTGetLockSpecialValueCallback = void Function(int specialValue);
/// A callback that returns the lock's time.
typedef TTGetLockTimeCallback = void Function(int timestamp);
/// A callback that returns the lock's system information.
typedef TTGetLockSystemCallback = void Function(
    TTLockSystemModel lockSystemModel);

/// A callback that returns passcode data.
typedef TTGetLockPasscodeDataCallback = void Function(String passcodeData);
/// A callback that returns the auto-lock time settings.
typedef TTGetLockAutomaticLockingPeriodicTimeCallback = void Function(
    int currentTime, int minTime, int maxTime);
/// A callback that returns a list of all valid passcodes.
typedef TTGetAllPasscodeCallback = void Function(List passcodeList);

/// A callback for the progress of adding a card.
typedef TTAddCardProgressCallback = void Function();
/// A callback that returns a card number.
typedef TTCardNumberCallback = void Function(String cardNumber);
/// A callback that returns a list of all valid cards.
typedef TTGetAllCardsCallback = void Function(List cardList);

/// A callback for the progress of adding a fingerprint.
typedef TTAddFingerprintProgressCallback = void Function(
    int currentCount, int totalCount);
/// A callback that returns a fingerprint number.
typedef TTAddFingerprintCallback = void Function(String fingerprintNumber);
/// A callback that returns a list of all valid fingerprints.
typedef TTGetAllFingerprintsCallback = void Function(List fingerprintList);
/// A callback that returns a boolean on/off state of a switch.
typedef TTGetSwitchStateCallback = void Function(bool isOn);
/// A callback that returns the lock's physical status (locked/unlocked).
typedef TTGetLockStatusCallback = void Function(TTLockSwitchState state);
/// A callback that returns the lock's installation direction.
typedef TTGetLockDirectionCallback = void Function(TTLockDirection direction);

/// A callback for failed gateway operations.
typedef TTGatewayFailedCallback = void Function(
    TTGatewayError errorCode, String errorMsg);
/// A callback for gateway scanning.
typedef TTGatewayScanCallback = void Function(TTGatewayScanModel scanModel);
/// A callback for gateway connection status changes.
typedef TTGatewayConnectCallback = void Function(TTGatewayConnectStatus status);
/// A callback for gateway disconnection.
typedef TTGatewayDisconnectCallback = void Function();
/// A callback for getting surrounding Wi-Fi networks via a gateway.
typedef TTGatewayGetAroundWifiCallback = void Function(
    bool finished, List wifiList);
/// A callback for gateway initialization.
typedef TTGatewayInitCallback = void Function(Map map);
/// A callback that returns whether a specific function is supported.
typedef TTFunctionSupportCallback = void Function(bool isSupport);

/// A callback for lift activation.
typedef TTLiftCallback = void Function(
    int lockTime, int electricQuantity, int uniqueId);

/// A callback that returns a list of NB-IoT awake modes.
typedef TTGetNbAwakeModesCallback = void Function(List<TTNbAwakeMode> list);
/// A callback that returns a list of NB-IoT awake times.
typedef TTGetNbAwakeTimesCallback = void Function(
    List<TTNbAwakeTimeModel> list);

/// A callback that returns the lock's version string.
typedef TTGetLockVersionCallback = void Function(String lockVersion);

/// A callback for Wi-Fi scanning via a Wi-Fi lock.
typedef TTWifiLockScanWifiCallback = void Function(
    bool finished, List wifiList);

/// A callback that returns Wi-Fi information from a Wi-Fi lock.
typedef TTWifiLockGetWifiInfoCallback = void Function(TTWifiInfoModel wifiInfo);

/// A callback that returns the lock's sound volume setting.
typedef TTGetLockSoundWithSoundVolumeCallback = void Function(
    TTSoundVolumeType ttLockSoundVolumeType);
/// A callback for getting passcode verification parameters.
typedef TTGetPasscodeVerificationParamsCallback = void Function(String lockData);

/// A callback for failed remote accessory operations.
typedef TTRemoteFailedCallback = void Function(
    TTRemoteAccessoryError errorCode, String errorMsg);
/// A callback for remote accessory scanning.
typedef TTRemoteAccessoryScanCallback = void Function(
    TTRemoteAccessoryScanModel scanModel);

/// A callback that returns the battery level of a remote accessory.
typedef TTGetLockAccessoryElectricQuantity = void Function(
    int electricQuantity, int updateDate);

/// A generic success callback for remote keypad operations.
typedef TTRemoteKeypadSuccessCallback = void Function();

/// A success callback for remote keypad initialization.
typedef TTRemoteKeypadInitSuccessCallback = void Function(
    int electricQuantity, String wirelessKeypadFeatureValue);

/// A success callback for multifunctional remote keypad initialization.
typedef TTMultifunctionalRemoteKeypadInitSuccessCallback = void Function(
    int electricQuantity,
    String wirelessKeypadFeatureValue,
    int slotNumber,
    int slotLimit);

/// A success callback for getting stored locks from a remote keypad.
typedef TTRemoteKeypadGetStoredLockSuccessCallback = void Function(
    List lockMacs);

/// A callback for failed remote keypad operations.
typedef TTRemoteKeypadFailedCallback = void Function(
    TTRemoteKeyPadAccessoryError errorCode, String errorMsg);

/// A callback for the progress of adding a face.
typedef TTAddFaceProgressCallback = void Function(
    TTFaceState state, TTFaceErrorCode faceErrorCode);

/// A success callback for adding a face, returning the face number.
typedef TTAddFaceSuccessCallback = void Function(String faceNumber);

/// A callback for electric meter scanning.
typedef TTElectricMeterScanCallback = void Function(
    TTElectricMeterScanModel scanModel);

/// A callback for failed meter (electric or water) operations.
typedef TTMeterFailedCallback = void Function(
    TTMeterErrorCode errorCode, String message);

/// A callback for water meter scanning.
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
