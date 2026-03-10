import 'package:ttlock_premise_flutter/models/enums.dart';
import 'package:ttlock_premise_flutter/models/events.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/scan_models.dart';

/// Abstract interface for all smart lock operations.
///
/// Access via [TTLock.lock]. One-shot operations return [Future] and throw
/// [TTLockException] on failure; use try-catch for error handling. Continuous
/// operations (scanning, add passcode/card/fingerprint/face) return [Stream].
abstract class TTLockApi {
  // ---------------------------------------------------------------------------
  // Scan & Bluetooth
  // ---------------------------------------------------------------------------

  /// Starts scanning for nearby locks; returns a broadcast stream of [TTLockScanModel].
  ///
  /// Call [stopScanLock] or cancel the subscription to stop. Does not throw;
  /// errors may be emitted on the stream depending on implementation.
  Stream<TTLockScanModel> startScanLock();

  /// Stops scanning for locks.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> stopScanLock();

  /// Returns the current Bluetooth state of the device.
  ///
  /// Throws [TTLockException] on failure.
  Future<TTBluetoothState> getBluetoothState();

  // ---------------------------------------------------------------------------
  // Init & Reset
  // ---------------------------------------------------------------------------

  /// Initializes (adds) a lock and returns the lock data string for later operations.
  ///
  /// Throws [TTLockException] on failure.
  Future<String> initLock(TTLockInitParams params);

  /// Factory-resets the lock; [lockData] becomes invalid afterward.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> resetLock(String lockData);

  /// Resets all eKeys and returns updated [lockData].
  ///
  /// Throws [TTLockException] on failure.
  Future<String> resetEkey(String lockData);

  /// Resets the lock using [resetCode] for the lock identified by [lockMac].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> resetLockByCode({required String lockMac, required String resetCode});

  /// Verifies that the lock identified by [lockMac] is reachable.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> verifyLock(String lockMac);

  // ---------------------------------------------------------------------------
  // Control
  // ---------------------------------------------------------------------------

  /// Performs lock or unlock according to [action] and returns result info.
  ///
  /// Returns [ControlLockResult] with lockTime, electricQuantity, and uniqueId.
  /// Throws [TTLockException] on failure.
  Future<ControlLockResult> controlLock(String lockData, TTControlAction action);

  /// Returns the current lock/unlock state for the lock identified by [lockData].
  ///
  /// Throws [TTLockException] on failure.
  Future<TTLockSwitchState> getLockSwitchState(String lockData);

  /// Returns whether the lock supports the given [function].
  ///
  /// Use this before calling feature-specific APIs. Throws [TTLockException] on failure.
  Future<bool> supportFunction(TTLockFunction function, String lockData);

  // ---------------------------------------------------------------------------
  // Passcode
  // ---------------------------------------------------------------------------

  /// Creates a custom passcode valid between [startDate] and [endDate] (milliseconds).
  ///
  /// Throws [TTLockException] on failure.
  Future<void> createCustomPasscode({
    required String passcode,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Modifies an existing passcode [passcodeOrigin] to [passcodeNew] and validity period.
  ///
  /// [passcodeNew] may be null to only update the validity period.
  /// Throws [TTLockException] on failure.
  Future<void> modifyPasscode({
    required String passcodeOrigin,
    String? passcodeNew,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Deletes the passcode [passcode] from the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> deletePasscode({required String passcode, required String lockData});

  /// Resets all passcodes and returns updated [lockData] (on-premise mode).
  ///
  /// Throws [TTLockException] on failure.
  Future<String> resetPasscode(String lockData);

  /// Returns the admin passcode for the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<String> getAdminPasscode(String lockData);

  /// Sets the erase passcode used to wipe the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setErasePasscode({required String erasePasscode, required String lockData});

  /// Returns a list of all valid passcodes (each item is a map with passcode info).
  ///
  /// Throws [TTLockException] on failure.
  Future<List<dynamic>> getAllValidPasscodes(String lockData);

  /// Recovers a passcode with new value and validity; [type] and [cycleType] define behavior.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> recoverPasscode({
    required String passcode,
    required String passcodeNew,
    required TTPasscodeType type,
    required int startDate,
    required int endDate,
    required int cycleType,
    required String lockData,
  });

  /// Modifies the admin passcode and returns updated [lockData] (on-premise mode).
  ///
  /// Throws [TTLockException] on failure.
  Future<String> modifyAdminPasscode({required String adminPasscode, required String lockData});

  /// Returns passcode verification params (lockData) for the given [lockData].
  ///
  /// Throws [TTLockException] on failure.
  Future<String> getPasscodeVerificationParams(String lockData);

  // ---------------------------------------------------------------------------
  // Card
  // ---------------------------------------------------------------------------

  /// Adds a card; validity between [startDate] and [endDate] (milliseconds).
  ///
  /// Emits [AddCardProgress] during enrollment and [AddCardComplete] with the card number on success.
  /// Optional [cycleList] for recurring validity. Throws [TTLockException] on failure.
  Stream<AddCardEvent> addCard({
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Modifies the validity period of the card [cardNumber].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> modifyCardValidityPeriod({
    required String cardNumber,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Deletes the card identified by [cardNumber].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> deleteCard({required String cardNumber, required String lockData});

  /// Returns a list of all valid cards (each item is a map with card info).
  ///
  /// Throws [TTLockException] on failure.
  Future<List<dynamic>> getAllValidCards(String lockData);

  /// Clears all cards from the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> clearAllCards(String lockData);

  /// Recovers the card [cardNumber] with new validity [startDate]–[endDate].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> recoverCard({
    required String cardNumber,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Reports the card [cardNumber] as lost so it is invalidated on the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> reportLossCard({required String cardNumber, required String lockData});

  // ---------------------------------------------------------------------------
  // Fingerprint
  // ---------------------------------------------------------------------------

  /// Adds a fingerprint; validity between [startDate] and [endDate] (milliseconds).
  ///
  /// Emits [AddFingerprintProgress] for each scan step and [AddFingerprintComplete] with the
  /// fingerprint number on success. Optional [cycleList] for recurring validity.
  /// Throws [TTLockException] on failure.
  Stream<AddFingerprintEvent> addFingerprint({
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Modifies the validity period of the fingerprint [fingerprintNumber].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> modifyFingerprintValidityPeriod({
    required String fingerprintNumber,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Deletes the fingerprint identified by [fingerprintNumber].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> deleteFingerprint({required String fingerprintNumber, required String lockData});

  /// Returns a list of all valid fingerprints (each item is a map with fingerprint info).
  ///
  /// Throws [TTLockException] on failure.
  Future<List<dynamic>> getAllValidFingerprints(String lockData);

  /// Clears all fingerprints from the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> clearAllFingerprints(String lockData);

  // ---------------------------------------------------------------------------
  // Face
  // ---------------------------------------------------------------------------

  /// Adds a face; validity between [startDate] and [endDate] (milliseconds).
  ///
  /// Emits [AddFaceProgress] for camera guidance and [AddFaceComplete] with the face number on success.
  /// Optional [cycleList] for recurring validity. Throws [TTLockException] on failure.
  Stream<AddFaceEvent> addFace({
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Adds a face using pre-captured [faceFeatureData]; returns the assigned face number.
  ///
  /// Throws [TTLockException] on failure.
  Future<String> addFaceData({
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String faceFeatureData,
    required String lockData,
  });

  /// Modifies the validity period of the face [faceNumber].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> modifyFace({
    required String faceNumber,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Deletes the face identified by [faceNumber].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> deleteFace({required String faceNumber, required String lockData});

  /// Clears all face data from the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> clearFace(String lockData);

  // ---------------------------------------------------------------------------
  // Time
  // ---------------------------------------------------------------------------

  /// Sets the lock's internal time to [timestamp] (milliseconds since epoch).
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setLockTime({required int timestamp, required String lockData});

  /// Returns the lock's current time in milliseconds since epoch.
  ///
  /// Throws [TTLockException] on failure.
  Future<int> getLockTime(String lockData);

  /// Sets the lock working time window ([startDate]–[endDate], minutes from midnight).
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setLockWorkingTime({
    required int startDate,
    required int endDate,
    required String lockData,
  });

  // ---------------------------------------------------------------------------
  // Records / Power / System
  // ---------------------------------------------------------------------------

  /// Returns the operate record string for the given [type] (e.g. latest, all).
  ///
  /// Throws [TTLockException] on failure.
  Future<String> getLockOperateRecord({required TTOperateRecordType type, required String lockData});

  /// Returns the lock battery level (percentage).
  ///
  /// Throws [TTLockException] on failure.
  Future<int> getLockPower(String lockData);

  /// Returns system info (model, hardware/firmware revision, battery, etc.).
  ///
  /// Throws [TTLockException] on failure.
  Future<TTLockSystemModel> getLockSystemInfo(String lockData);

  /// Returns the lock data string containing the feature bitmap value.
  ///
  /// Throws [TTLockException] on failure.
  Future<String> getLockFeatureValue(String lockData);

  // ---------------------------------------------------------------------------
  // Auto Locking
  // ---------------------------------------------------------------------------

  /// Returns current, min, and max auto-locking periodic time (seconds).
  ///
  /// Throws [TTLockException] on failure.
  Future<AutoLockingTime> getAutoLockingPeriodicTime(String lockData);

  /// Sets the auto-locking delay to [seconds] after door closes.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setAutoLockingPeriodicTime({required int seconds, required String lockData});

  // ---------------------------------------------------------------------------
  // Remote Unlock Switch
  // ---------------------------------------------------------------------------

  /// Returns whether remote unlock is enabled.
  ///
  /// Throws [TTLockException] on failure.
  Future<bool> getRemoteUnlockSwitchState(String lockData);

  /// Enables or disables remote unlock; returns updated [lockData].
  ///
  /// Throws [TTLockException] on failure.
  Future<String> setRemoteUnlockSwitchState({required bool isOn, required String lockData});

  // ---------------------------------------------------------------------------
  // Config
  // ---------------------------------------------------------------------------

  /// Returns whether the lock config [config] is currently on.
  ///
  /// Throws [TTLockException] on failure.
  Future<bool> getLockConfig({required TTLockConfig config, required String lockData});

  /// Sets the lock config [config] to on/off according to [isOn].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setLockConfig({required TTLockConfig config, required bool isOn, required String lockData});

  // ---------------------------------------------------------------------------
  // Direction
  // ---------------------------------------------------------------------------

  /// Returns the current lock direction (left/right).
  ///
  /// Throws [TTLockException] on failure.
  Future<TTLockDirection> getLockDirection(String lockData);

  /// Sets the lock direction (handing) to [direction].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setLockDirection({required TTLockDirection direction, required String lockData});

  // ---------------------------------------------------------------------------
  // Passage Mode
  // ---------------------------------------------------------------------------

  /// Adds a passage mode with [type], optional [weekly]/[monthly], and [startTime]–[endTime].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> addPassageMode({
    required TTPassageModeType type,
    List<int>? weekly,
    List<int>? monthly,
    required int startTime,
    required int endTime,
    required String lockData,
  });

  /// Clears all passage modes from the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> clearAllPassageModes(String lockData);

  // ---------------------------------------------------------------------------
  // Lift
  // ---------------------------------------------------------------------------

  /// Activates lift control for the given [floors]; returns [ControlLockResult].
  ///
  /// Throws [TTLockException] on failure.
  Future<ControlLockResult> activateLift({required String floors, required String lockData});

  /// Sets which floors are controllable by the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setLiftControlable({required String floors, required String lockData});

  /// Sets the lift work mode (activate type) to [type].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setLiftWorkMode({required TTLiftWorkActivateType type, required String lockData});

  // ---------------------------------------------------------------------------
  // Power Saver
  // ---------------------------------------------------------------------------

  /// Sets the power saver work mode to [type].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setPowerSaverWorkMode({required TTPowerSaverWorkType type, required String lockData});

  /// Sets which lock ([lockMac]) is controllable in power saver mode.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setPowerSaverControlableLock({required String lockMac, required String lockData});

  // ---------------------------------------------------------------------------
  // Hotel
  // ---------------------------------------------------------------------------

  /// Sets hotel info (building, floor, etc.) for the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setHotel({
    required String hotelInfo,
    required int buildingNumber,
    required int floorNumber,
    required String lockData,
  });

  /// Sets the hotel card sector [sector] for the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setHotelCardSector({required String sector, required String lockData});

  // ---------------------------------------------------------------------------
  // Version
  // ---------------------------------------------------------------------------

  /// Returns the firmware version string for the lock identified by [lockMac].
  ///
  /// Throws [TTLockException] on failure.
  Future<String> getLockVersion(String lockMac);

  /// Sets the NB-IoT server address for the lock; returns current battery level.
  ///
  /// Throws [TTLockException] on failure.
  Future<int> setNBServerAddress({
    required String ip,
    required String port,
    required String lockData,
  });

  // Not implemented in classic (commented there); platform command available.
  // Future<void> setNBAwakeModes({required List<int> modes, required String lockData});
  // Future<List<int>> getNBAwakeModes(String lockData);
  // Future<void> setNBAwakeTimes({required List<Map<String, dynamic>> times, required String lockData});
  // Future<List<Map<String, dynamic>>> getNBAwakeTimes(String lockData);

  // ---------------------------------------------------------------------------
  // WiFi Lock
  // ---------------------------------------------------------------------------

  /// Scans for nearby WiFi networks via the lock; each emission is a batch of results.
  ///
  /// The stream closes when scanning is complete. Throws [TTLockException] on failure.
  Stream<List<dynamic>> scanWifi(String lockData);

  /// Configures the lock to connect to WiFi [wifiName] with [wifiPassword].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> configWifi({required String wifiName, required String wifiPassword, required String lockData});

  /// Configures the lock's server address to [ip] and [port].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> configServer({required String ip, required String port, required String lockData});

  /// Returns current WiFi connection info for the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<TTWifiInfoModel> getWifiInfo(String lockData);

  /// Configures the lock's IP settings (DHCP or static) via [ipSetting].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> configIp({required TTIpSetting ipSetting, required String lockData});

  /// Configures camera lock WiFi; returns [CameraLockWifiResult].
  ///
  /// Throws [TTLockException] on failure.
  Future<CameraLockWifiResult> configCameraLockWifi({
    required String wifiName,
    required String wifiPassword,
    required String lockData,
  });

  // ---------------------------------------------------------------------------
  // Sound & Sensitivity
  // ---------------------------------------------------------------------------

  /// Sets the lock sound volume to [type].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setSoundVolume({required TTSoundVolumeType type, required String lockData});

  /// Returns the current sound volume type.
  ///
  /// Throws [TTLockException] on failure.
  Future<TTSoundVolumeType> getSoundVolume(String lockData);

  /// Sets the lock sensitivity to [value].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setSensitivity({required TTSensitivityValue value, required String lockData});

  // ---------------------------------------------------------------------------
  // Remote Accessory (on-lock)
  // ---------------------------------------------------------------------------

  /// Adds a remote key ([remoteKeyMac]) with validity [startDate]–[endDate].
  ///
  /// Optional [cycleList] for recurring validity. Throws [TTLockException] on failure.
  Future<void> addRemoteKey({
    required String remoteKeyMac,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Deletes the remote key identified by [remoteKeyMac].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> deleteRemoteKey({required String remoteKeyMac, required String lockData});

  /// Clears all remote keys from the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> clearRemoteKey(String lockData);

  /// Updates the validity period of the remote key [remoteKeyMac].
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setRemoteKeyValidDate({
    required String remoteKeyMac,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Returns battery level for the accessory [accessory] with [mac].
  ///
  /// Throws [TTLockException] on failure.
  Future<AccessoryElectricQuantityResult> getRemoteAccessoryElectricQuantity({
    required TTRemoteAccessory accessory,
    required String mac,
    required String lockData,
  });

  /// Adds door sensor [doorSensorMac] to the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> addDoorSensor({required String doorSensorMac, required String lockData});

  /// Removes the door sensor from the lock.
  ///
  /// Throws [TTLockException] on failure.
  Future<void> deleteDoorSensor(String lockData);

  /// Sets the door sensor alert delay to [alertTime] (seconds).
  ///
  /// Throws [TTLockException] on failure.
  Future<void> setDoorSensorAlertTime({required int alertTime, required String lockData});

  // Not implemented in classic (commented there); platform command available.
  // Future<void> setDoorSensorSwitch({required bool isOn, required String lockData});
  // Future<bool> getDoorSensorSwitchState(String lockData);
  // Future<bool> getDoorSensorState(String lockData);

  // ---------------------------------------------------------------------------
  // Upgrade
  // ---------------------------------------------------------------------------

  /// Puts the lock into firmware upgrade mode.
  ///
  /// [lockData] becomes invalid after this. Throws [TTLockException] on failure.
  Future<void> setLockEnterUpgradeMode(String lockData);
}
