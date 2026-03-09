import 'package:ttlock_premise_flutter/api/tt_accessory_api.dart';
import 'package:ttlock_premise_flutter/models/accessory_models.dart';
import 'package:ttlock_premise_flutter/models/events.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/scan_models.dart';
import 'package:ttlock_premise_flutter/src/constants/commands.dart';
import 'package:ttlock_premise_flutter/src/platform/tt_lock_platform.dart';

class TTAccessoryImpl implements TTAccessoryApi {
  final TTLockPlatform _platform;
  TTAccessoryImpl(this._platform);

  // ---------------------------------------------------------------------------
  // Remote Key
  // ---------------------------------------------------------------------------

  @override
  Stream<TTRemoteAccessoryScanModel> startScanRemoteKey() {
    return _platform
        .eventStream(TTCommands.startScanRemoteKey)
        .map((e) => TTRemoteAccessoryScanModel.fromMap(e.data));
  }

  @override
  Future<void> stopScanRemoteKey() => _platform.send(TTCommands.stopScanRemoteKey);

  @override
  Future<TTLockSystemModel> initRemoteKey({required String mac, required String lockData}) async {
    final data = await _platform.invoke(TTCommands.initRemoteKey, {
      'mac': mac,
      'lockData': lockData,
    });
    return TTLockSystemModel.fromMap(data);
  }

  // ---------------------------------------------------------------------------
  // Remote Keypad
  // ---------------------------------------------------------------------------

  @override
  Stream<TTRemoteAccessoryScanModel> startScanRemoteKeypad() {
    return _platform
        .eventStream(TTCommands.startScanRemoteKeypad)
        .map((e) => TTRemoteAccessoryScanModel.fromMap(e.data));
  }

  @override
  Future<void> stopScanRemoteKeypad() => _platform.send(TTCommands.stopScanRemoteKeypad);

  @override
  Future<RemoteKeypadInitResult> initRemoteKeypad({required String mac, required String lockMac}) async {
    final data = await _platform.invoke(TTCommands.initRemoteKeypad, {
      'mac': mac,
      'lockMac': lockMac,
    });
    return RemoteKeypadInitResult.fromMap(data);
  }

  @override
  Future<MultifunctionalKeypadInitResult> initMultifunctionalKeypad({
    required String mac,
    required String lockData,
  }) async {
    final data = await _platform.invoke(TTCommands.initMultifunctionalKeypad, {
      'mac': mac,
      'lockData': lockData,
    });
    return MultifunctionalKeypadInitResult.fromMap(data);
  }

  @override
  Future<List<dynamic>> getStoredLocks(String mac) async {
    final data = await _platform.invoke(TTCommands.multifunctionalKeypadGetLocks, {'mac': mac});
    return data['lockMacs'] as List<dynamic>;
  }

  @override
  Future<void> deleteStoredLock({required String mac, required int slotNumber}) async {
    await _platform.invoke(TTCommands.multifunctionalKeypadDeleteLock, {
      'mac': mac,
      'slotNumber': slotNumber,
    });
  }

  @override
  Stream<AddFingerprintEvent> addKeypadFingerprint({
    required String mac,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  }) {
    final params = <String, dynamic>{
      'mac': mac,
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    };
    if (cycleList != null && cycleList.isNotEmpty) {
      params['cycleJsonList'] = TTCycleModel.encodeList(cycleList);
    }
    return _platform
        .eventStream(TTCommands.multifunctionalKeypadAddFingerprint, params)
        .map((e) {
      if (e.isProgress) {
        return AddFingerprintProgress(
          currentCount: e.data['currentCount'] as int,
          totalCount: e.data['totalCount'] as int,
        );
      }
      return AddFingerprintComplete(fingerprintNumber: e.data['fingerprintNumber'] as String);
    });
  }

  @override
  Stream<AddCardEvent> addKeypadCard({
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  }) {
    final params = <String, dynamic>{
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    };
    if (cycleList != null && cycleList.isNotEmpty) {
      params['cycleJsonList'] = TTCycleModel.encodeList(cycleList);
    }
    return _platform
        .eventStream(TTCommands.multifunctionalKeypadAddCard, params)
        .map((e) {
      if (e.isProgress) return AddCardProgress();
      return AddCardComplete(cardNumber: e.data['cardNumber'] as String);
    });
  }

  // ---------------------------------------------------------------------------
  // Door Sensor
  // ---------------------------------------------------------------------------

  @override
  Stream<TTRemoteAccessoryScanModel> startScanDoorSensor() {
    return _platform
        .eventStream(TTCommands.startScanDoorSensor)
        .map((e) => TTRemoteAccessoryScanModel.fromMap(e.data));
  }

  @override
  Future<void> stopScanDoorSensor() => _platform.send(TTCommands.stopScanDoorSensor);

  @override
  Future<TTLockSystemModel> initDoorSensor({required String mac, required String lockData}) async {
    final data = await _platform.invoke(TTCommands.initDoorSensor, {
      'mac': mac,
      'lockData': lockData,
    });
    return TTLockSystemModel.fromMap(data);
  }
}
