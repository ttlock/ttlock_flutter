import 'dart:convert';

import 'package:ttlock_premise_flutter/src/ttlock_channel.dart';
import 'package:ttlock_premise_flutter/src/ttremotekeypad_commands.dart';
import 'package:ttlock_premise_flutter/ttlock.dart';

class TTRemoteKeypad {
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    TTLockChannel.invoke(TTRemoteKeypadCommands.COMMAND_START_SCAN_REMOTE_KEYPAD, null, scanCallback);
  }

  static void stopScan() {
    TTLockChannel.invoke(TTRemoteKeypadCommands.COMMAND_STOP_SCAN_REMOTE_KEYPAD, null, null);
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
    TTLockChannel.invoke(TTRemoteKeypadCommands.COMMAND_INIT_REMOTE_KEYPAD, map, callback,
        fail: failedCallback);
  }

  static void multifunctionalInit(
      String mac,
      String lockData,
      TTMultifunctionalRemoteKeypadInitSuccessCallback callback,
      TTFailedCallback lockFailedCallback,
      TTRemoteKeypadFailedCallback keyPadFailedCallback) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map[TTResponse.lockData] = lockData;
    TTLockChannel.invoke(TTRemoteKeypadCommands.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD, map, callback,
        fail: lockFailedCallback,
        otherFail: keyPadFailedCallback);
  }

  static void getStoredLocks(
      String mac,
      TTRemoteKeypadGetStoredLockSuccessCallback callback,
      TTRemoteKeypadFailedCallback failedCallback,
      ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    TTLockChannel.invoke(
        TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK, map, callback,
        fail: failedCallback, otherFail: failedCallback);
  }

  static void deleteStoredLock(
      String mac,
      int slotNumber,
      TTRemoteKeypadSuccessCallback callback,
      TTRemoteKeypadFailedCallback failedCallback,
      ) {
    Map map = Map();
    map[TTResponse.mac] = mac;
    map['slotNumber'] = slotNumber;
    TTLockChannel.invoke(
        TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK, map, callback,
        otherFail: failedCallback);
  }

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
      map[TTResponse.cycleJsonList] = jsonEncode(cycleList);
    }
    TTLockChannel.invoke(
        TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT, map, callback,
        progress: progressCallback,
        fail: lockFailedCallback,
        otherFail: keyPadFailedCallback);
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
      map[TTResponse.cycleJsonList] = jsonEncode(cycleList);
    }
    TTLockChannel.invoke(TTRemoteKeypadCommands.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD, map, callback,
        progress: progressCallback, fail: failedCallback);
  }
}
