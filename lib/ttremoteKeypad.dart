import 'dart:convert' as convert;

import 'package:ttlock_flutter/ttlock.dart';

class TTRemoteKeypad {
  static const String COMMAND_START_SCAN_REMOTE_KEYPAD =
      "remoteKeypadStartScan";
  static const String COMMAND_STOP_SCAN_REMOTE_KEYPAD = "remoteKeypadStopScan";
  static const String COMMAND_INIT_REMOTE_KEYPAD = "remoteKeypadInit";

  static const String COMMAND_INIT_MUTIFUCTIONAL_REMOTE_KEYPAD =
      "multifuctionalRemoteKeypadInit";
  static const String COMMAND_MUTIFUCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK =
      "multifuctionalRemoteKeypadDeleteLock";
  static const String COMMAND_MUTIFUCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK =
      "multifuctionalRemoteKeypadGetLocks";
  static const String COMMAND_MUTIFUCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT =
      "multifuctionalRemoteKeypadAddFingerprint";
  static const String COMMAND_MUTIFUCTIONAL_REMOTE_KEYPAD_ADD_CARD =
      "multifuctionalRemoteKeypadAddCard";

  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLock.invoke(COMMAND_START_SCAN_REMOTE_KEYPAD, null, scanCallback);
  }

  static void stopScan() {
    TTLock.invoke(COMMAND_STOP_SCAN_REMOTE_KEYPAD, null, null);
  }

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

  static void multifuctionalInit(
      String mac,
      String lockMac,
      TTMutifunctionalRemoteKeypadInitSuccessCallback callback,
      TTFailedCallback lockfailedCallback,
      TTRemoteKeypadFailedCallback keyPadFailedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.lockMac] = lockMac;
    TTLock.invoke(COMMAND_INIT_MUTIFUCTIONAL_REMOTE_KEYPAD, map, callback,
        fail_callback: lockfailedCallback,
        other_fail_callback: keyPadFailedCallback);
  }

  static void getStoredLocks(
    String mac,
    TTRemoteKeypadGetStoredLockSuccessCallback callback,
    TTRemoteKeypadFailedCallback failedCallback,
  ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    TTLock.invoke(
        COMMAND_MUTIFUCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK, map, callback,
        fail_callback: failedCallback);
  }

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
        COMMAND_MUTIFUCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK, map, callback,
        fail_callback: failedCallback);
  }

  static void addFingerprint(
      String mac,
      List<TTCycleModel>? cycleList,
      int startDate,
      int endDate,
      String lockData,
      TTAddFingerprintProgressCallback progressCallback,
      TTAddFingerprintCallback callback,
      TTFailedCallback lockfailedCallback,
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
        COMMAND_MUTIFUCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT, map, callback,
        progress_callback: progressCallback,
        fail_callback: lockfailedCallback,
        other_fail_callback: keyPadFailedCallback);
  }

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
    TTLock.invoke(COMMAND_MUTIFUCTIONAL_REMOTE_KEYPAD_ADD_CARD, map, callback,
        progress_callback: progressCallback, fail_callback: failedCallback);
  }
}
