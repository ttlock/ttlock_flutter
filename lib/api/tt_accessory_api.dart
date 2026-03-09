import 'package:ttlock_premise_flutter/models/accessory_models.dart';
import 'package:ttlock_premise_flutter/models/events.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/scan_models.dart';

/// Abstract interface for accessory operations (remote key, keypad, door sensor).
///
/// Access via [TTLock.accessory]. One-shot operations return [Future] and throw
/// [TTAccessoryException] on failure. Scanning and add flows return [Stream].
abstract class TTAccessoryApi {
  // ---------------------------------------------------------------------------
  // Remote Key
  // ---------------------------------------------------------------------------

  /// Starts scanning for remote keys; returns a stream of [TTRemoteAccessoryScanModel].
  ///
  /// Call [stopScanRemoteKey] or cancel the subscription to stop.
  Stream<TTRemoteAccessoryScanModel> startScanRemoteKey();

  /// Stops scanning for remote keys.
  ///
  /// Throws [TTAccessoryException] on failure.
  Future<void> stopScanRemoteKey();

  /// Initializes the remote key with [mac] and binds it to the lock identified by [lockData].
  ///
  /// Returns [TTLockSystemModel]. Throws [TTAccessoryException] on failure.
  Future<TTLockSystemModel> initRemoteKey({required String mac, required String lockData});

  // ---------------------------------------------------------------------------
  // Remote Keypad
  // ---------------------------------------------------------------------------

  /// Starts scanning for remote keypads; returns a stream of [TTRemoteAccessoryScanModel].
  ///
  /// Call [stopScanRemoteKeypad] or cancel the subscription to stop.
  Stream<TTRemoteAccessoryScanModel> startScanRemoteKeypad();

  /// Stops scanning for remote keypads.
  ///
  /// Throws [TTAccessoryException] on failure.
  Future<void> stopScanRemoteKeypad();

  /// Initializes a standard remote keypad [mac] for the lock identified by [lockMac].
  ///
  /// Returns [RemoteKeypadInitResult]. Throws [TTAccessoryException] on failure.
  Future<RemoteKeypadInitResult> initRemoteKeypad({required String mac, required String lockMac});

  /// Initializes a multifunctional keypad [mac] for the lock identified by [lockData].
  ///
  /// Returns [MultifunctionalKeypadInitResult]. Throws [TTAccessoryException] on failure.
  Future<MultifunctionalKeypadInitResult> initMultifunctionalKeypad({
    required String mac,
    required String lockData,
  });

  /// Returns the list of locks stored in the keypad identified by [mac].
  ///
  /// Throws [TTAccessoryException] on failure.
  Future<List<dynamic>> getStoredLocks(String mac);

  /// Deletes the lock at [slotNumber] from the keypad [mac].
  ///
  /// Throws [TTAccessoryException] on failure.
  Future<void> deleteStoredLock({required String mac, required int slotNumber});

  /// Adds a fingerprint via the multifunctional keypad [mac]; validity [startDate]–[endDate].
  ///
  /// Emits [AddFingerprintEvent] (progress and complete). Optional [cycleList] for recurring validity.
  /// Throws [TTAccessoryException] on failure.
  Stream<AddFingerprintEvent> addKeypadFingerprint({
    required String mac,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  /// Adds a card via the multifunctional keypad; validity [startDate]–[endDate].
  ///
  /// Emits [AddCardEvent] (progress and complete). Optional [cycleList] for recurring validity.
  /// Throws [TTAccessoryException] on failure.
  Stream<AddCardEvent> addKeypadCard({
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  });

  // ---------------------------------------------------------------------------
  // Door Sensor
  // ---------------------------------------------------------------------------

  /// Starts scanning for door sensors; returns a stream of [TTRemoteAccessoryScanModel].
  ///
  /// Call [stopScanDoorSensor] or cancel the subscription to stop.
  Stream<TTRemoteAccessoryScanModel> startScanDoorSensor();

  /// Stops scanning for door sensors.
  ///
  /// Throws [TTAccessoryException] on failure.
  Future<void> stopScanDoorSensor();

  /// Initializes the door sensor [mac] and binds it to the lock identified by [lockData].
  ///
  /// Returns [TTLockSystemModel]. Throws [TTAccessoryException] on failure.
  Future<TTLockSystemModel> initDoorSensor({required String mac, required String lockData});
}
