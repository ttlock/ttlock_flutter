import 'package:ttlock_premise_flutter/pigeon/messages.g.dart';
import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_accessory_exception.dart';

/// Legacy remote keypad API. Prefer [new_ttlock.TTLock.accessory] instead.
@Deprecated('Use TTLock.accessory for remote keypad operations instead.')
class TTRemoteKeypad {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN_REMOTE_KEYPAD = 'remoteKeypadStartScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN_REMOTE_KEYPAD = 'remoteKeypadStopScan';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_REMOTE_KEYPAD = 'remoteKeypadInit';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD = 'multifunctionalRemoteKeypadInit';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK = 'multifunctionalRemoteKeypadDeleteLock';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK = 'multifunctionalRemoteKeypadGetLocks';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT = 'multifunctionalRemoteKeypadAddFingerprint';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD = 'multifunctionalRemoteKeypadAddCard';

  @Deprecated('Use TTLock.accessory.startScanRemoteKeypad() and listen to the stream instead.')
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    new_ttlock.TTLock.accessory.startScanRemoteKeypad().listen(scanCallback);
  }

  @Deprecated('Use TTLock.accessory.stopScanRemoteKeypad() instead.')
  static void stopScan() {
    new_ttlock.TTLock.accessory.stopScanRemoteKeypad();
  }

  @Deprecated('Use TTLock.accessory.initRemoteKeypad(mac: mac, lockMac: lockMac) instead.')
  static void init(
    String mac,
    String lockMac,
    TTRemoteKeypadInitSuccessCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.accessory
        .initRemoteKeypad(mac: mac, lockMac: lockMac)
        .then((result) {
      callback(result.electricQuantity, result.wirelessKeypadFeatureValue);
    }).catchError((e, _) {
      if (e is TTAccessoryException) {
        final error = e.code >= 0 && e.code < TTRemoteAccessoryError.values.length
            ? TTRemoteAccessoryError.values[e.code]
            : TTRemoteAccessoryError.fail;
        failedCallback(error, e.message);
      } else {
        failedCallback(TTRemoteAccessoryError.fail, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.accessory.initMultifunctionalKeypad(mac: mac, lockData: lockData) instead.')
  static void multifunctionalInit(
    String mac,
    String lockData,
    TTMultifunctionalRemoteKeypadInitSuccessCallback callback,
    TTFailedCallback lockFailedCallback,
    TTRemoteKeypadFailedCallback keyPadFailedCallback,
  ) {
    new_ttlock.TTLock.accessory
        .initMultifunctionalKeypad(mac: mac, lockData: lockData)
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
      if (e is TTAccessoryException) {
        if (e.code >= 0 && e.code < TTRemoteKeyPadAccessoryError.values.length) {
          keyPadFailedCallback(TTRemoteKeyPadAccessoryError.values[e.code], e.message);
        } else {
          lockFailedCallback(TTLockError.fail, e.message);
        }
      } else {
        lockFailedCallback(TTLockError.fail, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.accessory.getStoredLocks(mac) instead.')
  static void getStoredLocks(
    String mac,
    TTRemoteKeypadGetStoredLockSuccessCallback callback,
    TTRemoteKeypadFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.accessory.getStoredLocks(mac).then((list) {
      callback(list);
    }).catchError((e, _) {
      if (e is TTAccessoryException) {
        final error = e.code >= 0 && e.code < TTRemoteKeyPadAccessoryError.values.length
            ? TTRemoteKeyPadAccessoryError.values[e.code]
            : TTRemoteKeyPadAccessoryError.fail;
        failedCallback(error, e.message);
      } else {
        failedCallback(TTRemoteKeyPadAccessoryError.fail, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.accessory.deleteStoredLock(mac: mac, slotNumber: slotNumber) instead.')
  static void deleteStoredLock(
    String mac,
    int slotNumber,
    TTRemoteKeypadSuccessCallback callback,
    TTRemoteKeypadFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.accessory
        .deleteStoredLock(mac: mac, slotNumber: slotNumber)
        .then((_) => callback())
        .catchError((e, _) {
      if (e is TTAccessoryException) {
        final error = e.code >= 0 && e.code < TTRemoteKeyPadAccessoryError.values.length
            ? TTRemoteKeyPadAccessoryError.values[e.code]
            : TTRemoteKeyPadAccessoryError.fail;
        failedCallback(error, e.message);
      } else {
        failedCallback(TTRemoteKeyPadAccessoryError.fail, e.toString());
      }
    });
  }

  @Deprecated('Use TTLock.accessory.addKeypadFingerprint(...) and listen to the stream instead.')
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
    new_ttlock.TTLock.accessory
        .addKeypadFingerprint(
          mac: mac,
          cycleList: cycleList,
          startDate: startDate,
          endDate: endDate,
          lockData: lockData,
        )
        .listen(
          (event) {
            if (event.isProgress) {
              progressCallback(event.currentCount!, event.totalCount!);
            } else {
              callback(event.fingerprintNumber!);
            }
          },
          onError: (e) {
            if (e is TTAccessoryException) {
              if (e.code >= 0 && e.code < TTRemoteKeyPadAccessoryError.values.length) {
                keyPadFailedCallback(TTRemoteKeyPadAccessoryError.values[e.code], e.message);
              } else {
                lockFailedCallback(
                  e.code >= 0 && e.code < TTLockError.values.length ? TTLockError.values[e.code] : TTLockError.fail,
                  e.message,
                );
              }
            } else {
              lockFailedCallback(TTLockError.fail, e.toString());
            }
          },
        );
  }

  @Deprecated('Use TTLock.accessory.addKeypadCard(...) and listen to the stream instead.')
  static void addCard(
    List<TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
    TTAddCardProgressCallback progressCallback,
    TTCardNumberCallback callback,
    TTFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.accessory
        .addKeypadCard(
          cycleList: cycleList,
          startDate: startDate,
          endDate: endDate,
          lockData: lockData,
        )
        .listen(
          (event) {
            if (event.isProgress) {
              progressCallback();
            } else {
              callback(event.cardNumber!);
            }
          },
          onError: (e) {
            if (e is TTAccessoryException) {
              failedCallback(
                e.code >= 0 && e.code < TTLockError.values.length ? TTLockError.values[e.code] : TTLockError.fail,
                e.message,
              );
            } else {
              failedCallback(TTLockError.fail, e.toString());
            }
          },
        );
  }
}
