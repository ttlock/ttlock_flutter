import 'package:ttlock_premise_flutter/api/tt_accessory_api.dart';
import 'package:ttlock_premise_flutter/models/accessory_models.dart';
import 'package:ttlock_premise_flutter/models/events.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/meter_models.dart';
import 'package:ttlock_premise_flutter/models/scan_models.dart';
import 'package:ttlock_premise_flutter/models/standalone_door_sensor_models.dart';
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

  // ---------------------------------------------------------------------------
  // Standalone Door Sensor
  // ---------------------------------------------------------------------------

  @override
  Stream<TTStandaloneDoorSensorScanModel> standaloneDoorSensorStartScan() {
    return _platform
        .eventStream(TTCommands.startScanStandaloneDoorSensor)
        .map((e) => TTStandaloneDoorSensorScanModel.fromMap(e.data));
  }

  @override
  Future<void> standaloneDoorSensorStopScan() =>
      _platform.send(TTCommands.stopScanStandaloneDoorSensor);

  @override
  Future<TTStandaloneDoorSensorInfo> standaloneDoorSensorInit({
    required String mac,
    required Map<String, dynamic> info,
  }) async {
    final data = await _platform.invoke(TTCommands.initStandaloneDoorSensor, {
      'mac': mac,
      'info': info,
    });
    return TTStandaloneDoorSensorInfo.fromMap(data);
  }

  @override
  Future<String> standaloneDoorSensorReadFeatureValue(String mac) async {
    final data = await _platform.invoke(TTCommands.standaloneDoorGetFeatureValue, {'mac': mac});
    return data['featureValue'] as String;
  }

  @override
  Future<bool> standaloneDoorSensorIsSupportFunction({
    required String featureValue,
    required int function,
  }) async {
    final data = await _platform.invoke(TTCommands.standaloneDoorIsSupportFunction, {
      'featureValue': featureValue,
      'function': function,
    });
    return data['isSupport'] as bool;
  }

  // ---------------------------------------------------------------------------
  // Water Meter
  // ---------------------------------------------------------------------------

  @override
  Future<void> waterMeterConfigServer({
    required String url,
    required String clientId,
    required String accessToken,
  }) async {
    await _platform.invoke(TTCommands.waterMeterConfigServer, {
      'url': url,
      'clientId': clientId,
      'accessToken': accessToken,
    });
  }

  @override
  Stream<TTMeterScanModel> waterMeterStartScan() {
    return _platform
        .eventStream(TTCommands.startScanWaterMeter)
        .map((e) => TTMeterScanModel.fromMap(e.data));
  }

  @override
  Future<void> waterMeterStopScan() => _platform.send(TTCommands.stopScanWaterMeter);

  @override
  Future<void> waterMeterConnect(String mac) async {
    await _platform.invoke(TTCommands.waterMeterConnect, {'mac': mac});
  }

  @override
  Future<void> waterMeterDisconnect(String mac) async {
    await _platform.invoke(TTCommands.waterMeterDisconnect, {'mac': mac});
  }

  @override
  Future<TTWaterMeterInitResult> waterMeterInit(Map<String, dynamic> params) async {
    final data = await _platform.invoke(TTCommands.waterMeterInit, params);
    return TTWaterMeterInitResult.fromMap(data);
  }

  @override
  Future<void> waterMeterDelete(String waterMeterId) async {
    await _platform.invoke(TTCommands.waterMeterDelete, {'waterMeterId': waterMeterId});
  }

  @override
  Future<void> waterMeterSetPowerOnOff({required String waterMeterId, required bool isOn}) async {
    await _platform.invoke(TTCommands.waterMeterSetPowerOnOff, {
      'waterMeterId': waterMeterId,
      'isOn': isOn,
    });
  }

  @override
  Future<void> waterMeterSetRemainderM3({required String waterMeterId, required num remainderM3}) async {
    await _platform.invoke(TTCommands.waterMeterSetRemainderM3, {
      'waterMeterId': waterMeterId,
      'remainderM3': remainderM3,
    });
  }

  @override
  Future<void> waterMeterClearRemainderM3({required String waterMeterId}) async {
    await _platform.invoke(TTCommands.waterMeterClearRemainderM3, {'waterMeterId': waterMeterId});
  }

  @override
  Future<Map<String, dynamic>> waterMeterReadData({required String waterMeterId}) async {
    final data = await _platform.invoke(TTCommands.waterMeterReadData, {'waterMeterId': waterMeterId});
    return data;
  }

  @override
  Future<void> waterMeterSetPayMode({required String waterMeterId, required int payMode}) async {
    await _platform.invoke(TTCommands.waterMeterSetPayMode, {
      'waterMeterId': waterMeterId,
      'payMode': payMode,
    });
  }

  @override
  Future<void> waterMeterCharge({required String waterMeterId, required num amount}) async {
    await _platform.invoke(TTCommands.waterMeterCharge, {
      'waterMeterId': waterMeterId,
      'amount': amount,
    });
  }

  @override
  Future<void> waterMeterSetTotalUsage({required String waterMeterId, required num totalM3}) async {
    await _platform.invoke(TTCommands.waterMeterSetTotalUsage, {
      'waterMeterId': waterMeterId,
      'totalM3': totalM3,
    });
  }

  @override
  Future<String> waterMeterGetFeatureValue(String waterMeterId) async {
    final data = await _platform.invoke(TTCommands.waterMeterGetFeatureValue, {'waterMeterId': waterMeterId});
    return data['featureValue'] as String;
  }

  @override
  Future<Map<String, dynamic>> waterMeterGetDeviceInfo(String waterMeterId) async {
    final data = await _platform.invoke(TTCommands.waterMeterGetDeviceInfo, {'waterMeterId': waterMeterId});
    return data;
  }

  @override
  Future<bool> waterMeterIsSupportFunction({required String featureValue, required int function}) async {
    final data = await _platform.invoke(TTCommands.waterMeterIsSupportFunction, {
      'featureValue': featureValue,
      'function': function,
    });
    return data['isSupport'] as bool;
  }

  @override
  Future<void> waterMeterConfigApn({required String apn}) async {
    await _platform.invoke(TTCommands.waterMeterConfigApn, {'apn': apn});
  }

  @override
  Future<void> waterMeterConfigMeterServer({required String ip, required String port}) async {
    await _platform.invoke(TTCommands.waterMeterConfigMeterServer, {'ip': ip, 'port': port});
  }

  @override
  Future<void> waterMeterReset(String waterMeterId) async {
    await _platform.invoke(TTCommands.waterMeterReset, {'waterMeterId': waterMeterId});
  }

  // ---------------------------------------------------------------------------
  // Electric Meter
  // ---------------------------------------------------------------------------

  @override
  Future<void> electricMeterConfigServer({
    required String url,
    required String clientId,
    required String accessToken,
  }) async {
    await _platform.invoke(TTCommands.electricMeterConfigServer, {
      'url': url,
      'clientId': clientId,
      'accessToken': accessToken,
    });
  }

  @override
  Stream<TTMeterScanModel> electricMeterStartScan() {
    return _platform
        .eventStream(TTCommands.startScanElectricMeter)
        .map((e) => TTMeterScanModel.fromMap(e.data));
  }

  @override
  Future<void> electricMeterStopScan() => _platform.send(TTCommands.stopScanElectricMeter);

  @override
  Future<void> electricMeterConnect(String mac) async {
    await _platform.invoke(TTCommands.electricMeterConnect, {'mac': mac});
  }

  @override
  Future<void> electricMeterDisconnect(String mac) async {
    await _platform.invoke(TTCommands.electricMeterDisconnect, {'mac': mac});
  }

  @override
  Future<TTElectricMeterInitResult> electricMeterInit(Map<String, dynamic> params) async {
    final data = await _platform.invoke(TTCommands.electricMeterInit, params);
    return TTElectricMeterInitResult.fromMap(data);
  }

  @override
  Future<void> electricMeterDelete(String electricMeterId) async {
    await _platform.invoke(TTCommands.electricMeterDelete, {'electricMeterId': electricMeterId});
  }

  @override
  Future<void> electricMeterSetPowerOnOff({required String electricMeterId, required bool isOn}) async {
    await _platform.invoke(TTCommands.electricMeterSetPowerOnOff, {
      'electricMeterId': electricMeterId,
      'isOn': isOn,
    });
  }

  @override
  Future<void> electricMeterSetRemainderKwh({required String electricMeterId, required num remainderKwh}) async {
    await _platform.invoke(TTCommands.electricMeterSetRemainderKwh, {
      'electricMeterId': electricMeterId,
      'remainderKwh': remainderKwh,
    });
  }

  @override
  Future<void> electricMeterClearRemainderKwh({required String electricMeterId}) async {
    await _platform.invoke(TTCommands.electricMeterClearRemainderKwh, {'electricMeterId': electricMeterId});
  }

  @override
  Future<Map<String, dynamic>> electricMeterReadData({required String electricMeterId}) async {
    final data = await _platform.invoke(TTCommands.electricMeterReadData, {'electricMeterId': electricMeterId});
    return data;
  }

  @override
  Future<void> electricMeterSetPayMode({required String electricMeterId, required int payMode}) async {
    await _platform.invoke(TTCommands.electricMeterSetPayMode, {
      'electricMeterId': electricMeterId,
      'payMode': payMode,
    });
  }

  @override
  Future<void> electricMeterCharge({required String electricMeterId, required num amount}) async {
    await _platform.invoke(TTCommands.electricMeterCharge, {
      'electricMeterId': electricMeterId,
      'amount': amount,
    });
  }

  @override
  Future<void> electricMeterSetMaxPower({required String electricMeterId, required num maxPower}) async {
    await _platform.invoke(TTCommands.electricMeterSetMaxPower, {
      'electricMeterId': electricMeterId,
      'maxPower': maxPower,
    });
  }

  @override
  Future<String> electricMeterGetFeatureValue(String electricMeterId) async {
    final data = await _platform.invoke(TTCommands.electricMeterGetFeatureValue, {'electricMeterId': electricMeterId});
    return data['featureValue'] as String;
  }

  @override
  Future<bool> electricMeterIsSupportFunction({required String featureValue, required int function}) async {
    final data = await _platform.invoke(TTCommands.electricMeterIsSupportFunction, {
      'featureValue': featureValue,
      'function': function,
    });
    return data['isSupport'] as bool;
  }
}
