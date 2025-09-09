import 'dart:convert' as convert;

import 'package:ttlock_flutter/ttlock.dart';

/// A class for interacting with a TTlock remote keypad accessory.
///
/// This class provides methods to scan for, initialize, and manage remote keypads.
class TTRemoteKeypad {
  /// Command to start scanning for remote keypads.
  static const String COMMAND_START_SCAN_REMOTE_KEYPAD =
      "remoteKeypadStartScan";
  /// Command to stop scanning for remote keypads.
  static const String COMMAND_STOP_SCAN_REMOTE_KEYPAD = "remoteKeypadStopScan";
  /// Command to initialize a remote keypad.
  static const String COMMAND_INIT_REMOTE_KEYPAD = "remoteKeypadInit";

  /// Command to initialize a multifunctional remote keypad.
  static const String COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD =
      "multifunctionalRemoteKeypadInit";
  /// Command to delete a stored lock from a multifunctional remote keypad.
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK =
      "multifunctionalRemoteKeypadDeleteLock";
  /// Command to get the stored locks from a multifunctional remote keypad.
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK =
      "multifunctionalRemoteKeypadGetLocks";
  /// Command to add a fingerprint to a multifunctional remote keypad.
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT =
      "multifunctionalRemoteKeypadAddFingerprint";
  /// Command to add a card to a multifunctional remote keypad.
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD =
      "multifunctionalRemoteKeypadAddCard";

  /// Starts scanning for nearby remote keypads.
  ///
  /// [scanCallback] A callback that will be invoked for each remote keypad found.
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_REMOTE_KEYPAD, null, scanCallback);
  }

  /// Stops the remote keypad scan.
  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_REMOTE_KEYPAD, null, null);
  }

  /// Initializes a remote keypad.
  ///
  /// [mac] The MAC address of the remote keypad.
  /// [lockMac] The MAC address of the lock to associate with the keypad.
  /// [callback] A callback for when the initialization is successful.
  /// [failedCallback] A callback for when the initialization fails.
  static void init(
    String mac,
    String lockMac,
    TTRemoteKeypadInitSuccessCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.lockMac] = lockMac;
    TTLock.invoke(COMMAND_INIT_REMOTE_KEYPAD, map, callback,
        fail_callback: failedCallback);
  }

  /// Initializes a multifunctional remote keypad.
  ///
  /// [mac] The MAC address of the keypad.
  /// [lockData] The lock data string of the lock to associate.
  /// [callback] A callback for successful initialization.
  /// [lockFailedCallback] A callback for failures related to the lock.
  /// [keyPadFailedCallback] A callback for failures related to the keypad.
  static void multifunctionalInit(
      String mac,
      String lockData,
      TTMultifunctionalRemoteKeypadInitSuccessCallback callback,
      TTFailedCallback lockFailedCallback,
      TTRemoteKeypadFailedCallback keyPadFailedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.lockData] = lockData;
    TTLock.invoke(COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD, map, callback,
        fail_callback: lockFailedCallback,
        other_fail_callback: keyPadFailedCallback);
  }

  /// Gets the locks stored in a multifunctional remote keypad.
  ///
  /// [mac] The MAC address of the keypad.
  /// [callback] A callback that returns a list of stored lock MAC addresses.
  /// [failedCallback] A callback for when the operation fails.
  static void getStoredLocks(
    String mac,
    TTRemoteKeypadGetStoredLockSuccessCallback callback,
    TTRemoteKeypadFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    TTLock.invoke(
        COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK, map, callback,
        fail_callback: failedCallback);
  }

  /// Deletes a stored lock from a multifunctional remote keypad.
  ///
  /// [mac] The MAC address of the keypad.
  /// [slotNumber] The slot number of the lock to delete.
  /// [callback] A callback for successful deletion.
  /// [failedCallback] A callback for when the deletion fails.
  static void deleteStoredLock(
    String mac,
    int slotNumber,
    TTRemoteKeypadSuccessCallback callback,
    TTRemoteKeypadFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.slotNumber] = slotNumber;
    TTLock.invoke(
        COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK, map, callback,
        fail_callback: failedCallback);
  }

  /// Adds a fingerprint to a multifunctional remote keypad.
  ///
  /// [mac] The MAC address of the keypad.
  /// [cycleList] An optional list for setting a cyclic validity period.
  /// [startDate] The start time of the fingerprint's validity.
  /// [endDate] The end time of the fingerprint's validity.
  /// [lockData] The lock data string of the lock.
  /// [progressCallback] A callback for the progress of adding the fingerprint.
  /// [callback] A callback that returns the fingerprint number on success.
  /// [lockFailedCallback] A callback for failures related to the lock.
  /// [keyPadFailedCallback] A callback for failures related to the keypad.
  static void addFingerprint(
      String mac,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddFingerprintProgressCallback progressCallback,
      TTAddFingerprintCallback callback,
      TTFailedCallback lockFailedCallback,
      TTRemoteKeypadFailedCallback keyPadFailedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.startDate] = startDate;
    map[TTResponse.endDate] = endDate;
    map[TTResponse.lockData] = lockData;
    if (cycleList != null && cycleList.length > 0) {
      map[TTResponse.cycleJsonList] = convert.jsonEncode(cycleList);
    }
    TTLock.invoke(
        COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT, map, callback,
        progress_callback: progressCallback,
        fail_callback: lockFailedCallback,
        other_fail_callback: keyPadFailedCallback);
  }

  /// Adds a card to a multifunctional remote keypad.
  ///
  /// [cycleList] An optional list for setting a cyclic validity period.
  /// [startDate] The start time of the card's validity.
  /// [endDate] The end time of the card's validity.
  /// [lockData] The lock data string of the lock.
  /// [progressCallback] A callback for the progress of adding the card.
  /// [callback] A callback that returns the card number on success.
  /// [failedCallback] A callback for when the operation fails.
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
    TTLock.invoke(COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD, map, callback,
        progress_callback: progressCallback, fail_callback: failedCallback);
  }
}
