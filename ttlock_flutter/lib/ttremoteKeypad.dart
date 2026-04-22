import 'dart:async';

import 'package:ttlock_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_flutter/ttlock_classic.dart';
import 'package:ttlock_flutter/errors/tt_remote_accessory_exception.dart';
import 'package:ttlock_flutter/errors/tt_multifunctional_keypad_exception.dart';
import 'package:ttlock_flutter/errors/tt_lock_exception.dart';

/// Legacy remote keypad API. Prefer [new_ttlock.TTLock.remoteKeypad] / [new_ttlock.TTLock.remoteKey] instead.
@Deprecated('Use TTLock.remoteKeypad / TTLock.remoteKey for remote keypad operations instead.')
class TTRemoteKeypad {
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN_REMOTE_KEYPAD = 'remoteKeypadStartScan';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN_REMOTE_KEYPAD = 'remoteKeypadStopScan';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_REMOTE_KEYPAD = 'remoteKeypadInit';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD = 'multifunctionalRemoteKeypadInit';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK = 'multifunctionalRemoteKeypadDeleteLock';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK = 'multifunctionalRemoteKeypadGetLocks';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT = 'multifunctionalRemoteKeypadAddFingerprint';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD = 'multifunctionalRemoteKeypadAddCard';

  static StreamSubscription<TTRemoteAccessoryScanModel>? _scanSub;

  @Deprecated('Use TTLock.remoteKeypad.accessoryStartScanRemoteKeypad() and listen to the stream instead.')
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    _scanSub?.cancel();
    _scanSub = new_ttlock.TTLock.remoteKeypad.accessoryStartScanRemoteKeypad().listen(scanCallback);
  }

  @Deprecated('Cancel the subscription from accessoryStartScanRemoteKeypad().')
  static void stopScan() {
    _scanSub?.cancel();
    _scanSub = null;
  }

  @Deprecated('Use TTLock.remoteKeypad.initRemoteKeypad(mac, lockMac) instead.')
  static void init(
    String mac,
    String lockMac,
    TTRemoteKeypadInitSuccessCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.remoteKeypad
        .initRemoteKeypad(mac, lockMac)
        .then((result) {
      callback(result.electricQuantity, result.wirelessKeypadFeatureValue);
    }).catchError((e, _) {
      if (e is TTRemoteAccessoryException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTRemoteAccessoryError.failed, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.remoteKeypad.initMultifunctionalKeypad(mac, lockData) instead.')
  static void multifunctionalInit(
    String mac,
    String lockData,
    TTMultifunctionalRemoteKeypadInitSuccessCallback callback,
    TTFailedCallback lockFailedCallback,
    TTRemoteKeypadFailedCallback keyPadFailedCallback,
  ) {
    new_ttlock.TTLock.remoteKeypad
        .initMultifunctionalKeypad(mac, lockData)
        .then((result) {
      callback(
        result.electricQuantity,
        result.wirelessKeypadFeatureValue,
        result.slotNumber,
        result.slotLimit,
        result.modelNum,
        result.hardwareRevision,
        result.firmwareRevision,
      );
    }).catchError((e, _) {
      if (e is TTMultifunctionalKeypadException) {
        keyPadFailedCallback(e.code, e.message ?? '');
      } else if (e is TTLockException) {
        lockFailedCallback(e.code, e.message ?? '');
      } else {
        lockFailedCallback(TTLockError.fail, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.remoteKey.getStoredLocks(mac) instead.')
  static void getStoredLocks(
    String mac,
    TTRemoteKeypadGetStoredLockSuccessCallback callback,
    TTRemoteKeypadFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.remoteKey.getStoredLocks(mac).then((list) {
      callback(list);
    }).catchError((e, _) {
      if (e is TTRemoteAccessoryException) {
        failedCallback(TTMultifunctionalKeypadError.failed, e.message ?? '');
      } else if (e is TTMultifunctionalKeypadException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTMultifunctionalKeypadError.failed, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.remoteKeypad.deleteStoredLock(mac, slotNumber) instead.')
  static void deleteStoredLock(
    String mac,
    int slotNumber,
    TTRemoteKeypadSuccessCallback callback,
    TTRemoteKeypadFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.remoteKeypad
        .deleteStoredLock(mac, slotNumber)
        .then((_) => callback())
        .catchError((e, _) {
      if (e is TTMultifunctionalKeypadException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTMultifunctionalKeypadError.failed, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.remoteKeypad.accessoryAddKeypadFingerprint(mac) and listen to the stream instead.')
  static void addFingerprint(
    String mac,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
    TTAddFingerprintProgressCallback progressCallback,
    TTAddFingerprintCallback callback,
    TTFailedCallback lockFailedCallback,
    TTRemoteKeypadFailedCallback keyPadFailedCallback,
  ) {
    new_ttlock.TTLock.remoteKeypad.accessoryAddKeypadFingerprint(mac).listen(
      (event) {
        if (event.isProgress) {
          progressCallback(event.currentCount!, event.totalCount!);
        } else {
          callback(event.fingerprintNumber!);
        }
      },
      onError: (e) {
        if (e is TTMultifunctionalKeypadException) {
          keyPadFailedCallback(e.code, e.message ?? '');
        } else if (e is TTLockException) {
          lockFailedCallback(
            e.code,
            e.message ?? '',
          );
        } else {
          lockFailedCallback(TTLockError.fail, e.toString());
        }
      },
    );
  }

  /// [keypadMac] 多功能无线键盘 MAC（订阅前需非空，见 [TTRemoteKeypadApi.accessoryAddKeypadCard]）。
  @Deprecated('Use TTLock.remoteKeypad.accessoryAddKeypadCard(keypadMac) and listen to the stream instead.')
  static void addCard(
    String keypadMac,
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
    TTAddCardProgressCallback progressCallback,
    TTCardNumberCallback callback,
    TTFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.remoteKeypad.accessoryAddKeypadCard(keypadMac).listen(
      (event) {
        if (event.isProgress) {
          progressCallback();
        } else {
          callback(event.cardNumber!);
        }
      },
      onError: (e) {
        if (e is TTLockException) {
          failedCallback(e.code, e.message ?? '');
        } else {
          failedCallback(TTLockError.fail, e.toString());
        }
      },
    );
  }
}
