import 'dart:async';

import 'package:ttlock_flutter/ttlock.dart' as new_ttlock;
import 'package:ttlock_flutter/ttlock_classic.dart';
import 'package:ttlock_flutter/errors/tt_remote_accessory_exception.dart';

/// Legacy remote key API. Prefer [new_ttlock.TTLock.remoteKey] instead.
@Deprecated('Use TTLock.remoteKey.accessoryStartScanRemoteKey() / initRemoteKey() instead.')
class TTRemoteKey {
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_START_SCAN_REMOTE_KEY = 'startScanRemoteKey';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_STOP_SCAN_REMOTE_KEY = 'stopScanRemoteKey';
  @Deprecated('Use TTCommands from package:ttlock_flutter/src/constants/commands.dart')
  static const String COMMAND_INIT_REMOTE_KEY = 'initRemoteKey';

  static StreamSubscription<TTRemoteAccessoryScanModel>? _scanSub;

  /// Legacy: scan for remote keys via callback. Prefer [new_ttlock.TTLock.remoteKey.accessoryStartScanRemoteKey].
  @Deprecated('Use TTLock.remoteKey.accessoryStartScanRemoteKey() and listen to the stream instead.')
  static void startScan(TTRemoteAccessoryScanCallback scanCallback) {
    _scanSub?.cancel();
    _scanSub = new_ttlock.TTLock.remoteKey.accessoryStartScanRemoteKey().listen(scanCallback);
  }

  /// Legacy: stop remote key scan. Prefer cancelling the stream subscription.
  @Deprecated('Cancel the subscription from accessoryStartScanRemoteKey().')
  static void stopScan() {
    _scanSub?.cancel();
    _scanSub = null;
  }

  /// Legacy: init remote key via callbacks. Prefer [new_ttlock.TTLock.remoteKey.initRemoteKey].
  @Deprecated('Use TTLock.remoteKey.initRemoteKey(mac, lockData) instead.')
  static void init(
    String mac,
    String lockData,
    TTGetLockSystemCallback callback,
    TTRemoteFailedCallback failedCallback,
  ) {
    new_ttlock.TTLock.remoteKey
        .initRemoteKey(mac, lockData)
        .then(callback).catchError((e, _) {
      if (e is TTRemoteAccessoryException) {
        failedCallback(e.code, e.message ?? '');
      } else {
        failedCallback(TTRemoteAccessoryError.failed, e.toString());
      }
    });
  }
}
