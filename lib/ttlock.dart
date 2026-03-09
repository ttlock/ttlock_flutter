/// TTLock Flutter Plugin (On-Premise).
///
/// Modern Future/Stream-based API for smart lock, gateway, and accessory
/// operations. Use [TTLock.lock], [TTLock.gateway], and [TTLock.accessory]
/// to access the respective APIs.
///
/// ```dart
/// // Scan for locks
/// final subscription = TTLock.lock.startScanLock().listen((model) {
///   print('Found: ${model.lockName}');
/// });
///
/// // One-shot operation
/// try {
///   final lockData = await TTLock.lock.initLock(params);
/// } on TTLockException catch (e) {
///   print('Error: ${e.error}');
/// }
/// ```
library ttlock_premise_flutter;

// Public API interfaces
export 'package:ttlock_premise_flutter/api/tt_lock_api.dart';
export 'package:ttlock_premise_flutter/api/tt_gateway_api.dart';
export 'package:ttlock_premise_flutter/api/tt_accessory_api.dart';

// Models
export 'package:ttlock_premise_flutter/models/enums.dart';
export 'package:ttlock_premise_flutter/models/scan_models.dart';
export 'package:ttlock_premise_flutter/models/lock_models.dart';
export 'package:ttlock_premise_flutter/models/gateway_models.dart';
export 'package:ttlock_premise_flutter/models/accessory_models.dart';
export 'package:ttlock_premise_flutter/models/events.dart';

// Errors
export 'package:ttlock_premise_flutter/errors/tt_exception.dart';
export 'package:ttlock_premise_flutter/errors/tt_lock_exception.dart';
export 'package:ttlock_premise_flutter/errors/tt_gateway_exception.dart';
export 'package:ttlock_premise_flutter/errors/tt_accessory_exception.dart';

import 'package:ttlock_premise_flutter/api/tt_lock_api.dart';
import 'package:ttlock_premise_flutter/api/tt_gateway_api.dart';
import 'package:ttlock_premise_flutter/api/tt_accessory_api.dart';
import 'package:ttlock_premise_flutter/src/impl/tt_lock_impl.dart';
import 'package:ttlock_premise_flutter/src/impl/tt_gateway_impl.dart';
import 'package:ttlock_premise_flutter/src/impl/tt_accessory_impl.dart';
import 'package:ttlock_premise_flutter/src/platform/tt_lock_method_channel.dart';
import 'package:ttlock_premise_flutter/src/platform/tt_lock_platform.dart';

/// Entry point for the TTLock plugin.
///
/// Provides singleton access to [TTLockApi], [TTGatewayApi], and
/// [TTAccessoryApi] via [lock], [gateway], and [accessory].
class TTLock {
  TTLock._();

  static final TTLockMethodChannel _platform = TTLockMethodChannel();

  static TTLockApi? _lock;
  static TTGatewayApi? _gateway;
  static TTAccessoryApi? _accessory;

  /// Lock operations (scan, init, control, passcode, card, fingerprint, etc.).
  static TTLockApi get lock => _lock ??= TTLockImpl(_platform);

  /// Gateway operations (scan, connect, init, configure).
  static TTGatewayApi get gateway => _gateway ??= TTGatewayImpl(_platform);

  /// Accessory operations (remote key, keypad, door sensor).
  static TTAccessoryApi get accessory => _accessory ??= TTAccessoryImpl(_platform);

  /// The underlying platform implementation. Exposed for advanced use / testing.
  static TTLockPlatform get platform => _platform;

  /// Enable or disable debug logging of native events.
  static bool get printLog => _platform.printLog;
  static set printLog(bool value) => _platform.printLog = value;

  /// Replace the default implementations with custom ones (useful for testing).
  static void setImplementations({
    TTLockApi? lockApi,
    TTGatewayApi? gatewayApi,
    TTAccessoryApi? accessoryApi,
  }) {
    if (lockApi != null) _lock = lockApi;
    if (gatewayApi != null) _gateway = gatewayApi;
    if (accessoryApi != null) _accessory = accessoryApi;
  }
}
