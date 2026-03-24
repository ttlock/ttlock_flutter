import 'package:ttlock_premise_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_premise_flutter/ttlock_classic.dart';
import 'package:ttlock_premise_flutter/errors/tt_accessory_exception.dart';

/// Legacy remote key API. Prefer [new_ttlock.TTLock.accessory] instead.
@Deprecated('Use TTLock.accessory.startScanRemoteKey() / stopScanRemoteKey() / initRemoteKey() instead.')
class TTRemoteKey {
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN_REMOTE_KEY = 'startScanRemoteKey';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN_REMOTE_KEY = 'stopScanRemoteKey';
  @Deprecated('Use TTCommands from package:ttlock_premise_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_REMOTE_KEY = 'initRemoteKey';

  /// Legacy: scan for remote keys via callback. Prefer [new_ttlock.TTLock.accessory.startScanRemoteKey].
  @Deprecated('Use TTLock.accessory.startScanRemoteKey() and listen to the stream instead.')
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    new_ttlock.TTLock.accessory.startScanRemoteKey().listen(scanCallback);
  }

  /// Legacy: stop remote key scan. Prefer [new_ttlock.TTLock.accessory.stopScanRemoteKey].
  @Deprecated('Use TTLock.accessory.stopScanRemoteKey() instead.')
  static void stopScan() {
    new_ttlock.TTLock.accessory.stopScanRemoteKey();
  }

  /// Legacy: init remote key via callbacks. Prefer [new_ttlock.TTLock.accessory.initRemoteKey].
  @Deprecated('Use TTLock.accessory.initRemoteKey(mac: mac, lockData: lockData) instead.')
  static void init(
    String mac,
    String lockData,
    TTGetLockSystemCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.accessory
        .initRemoteKey(mac: mac, lockData: lockData)
        .then(callback).catchError((e, _) {
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
}
