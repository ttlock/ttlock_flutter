import 'dart:convert' as convert;

import 'package:ttlock_premise_flutter/api/tt_lock_api.dart';
import 'package:ttlock_premise_flutter/models/enums.dart';
import 'package:ttlock_premise_flutter/models/events.dart';
import 'package:ttlock_premise_flutter/models/lock_models.dart';
import 'package:ttlock_premise_flutter/models/scan_models.dart';
import 'package:ttlock_premise_flutter/src/constants/commands.dart';
import 'package:ttlock_premise_flutter/src/platform/tt_lock_platform.dart';

class TTLockImpl implements TTLockApi {
  final TTLockPlatform _platform;
  TTLockImpl(this._platform);

  // ---------------------------------------------------------------------------
  // Scan & Bluetooth
  // ---------------------------------------------------------------------------

  @override
  Stream<TTLockScanModel> startScanLock() {
    return _platform
        .eventStream(TTCommands.startScanLock)
        .map((e) => TTLockScanModel.fromMap(e.data));
  }

  @override
  Future<void> stopScanLock() => _platform.send(TTCommands.stopScanLock);

  @override
  Future<TTBluetoothState> getBluetoothState() async {
    final data = await _platform.invoke(TTCommands.getBluetoothState);
    return TTBluetoothState.fromValue(data['state'] as int);
  }

  // ---------------------------------------------------------------------------
  // Init & Reset
  // ---------------------------------------------------------------------------

  @override
  Future<String> initLock(TTLockInitParams params) async {
    final data = await _platform.invoke(TTCommands.initLock, params.toMap());
    return data['lockData'] as String;
  }

  @override
  Future<void> resetLock(String lockData) async {
    await _platform.invoke(TTCommands.resetLock, lockData);
  }

  @override
  Future<String> resetEkey(String lockData) async {
    final data = await _platform.invoke(TTCommands.resetEkey, lockData);
    return data['lockData'] as String;
  }

  @override
  Future<void> resetLockByCode({required String lockMac, required String resetCode}) async {
    await _platform.invoke(TTCommands.resetLockByCode, {
      'lockMac': lockMac,
      'resetCode': resetCode,
    });
  }

  @override
  Future<void> verifyLock(String lockMac) async {
    await _platform.invoke(TTCommands.verifyLock, {'lockMac': lockMac});
  }

  // ---------------------------------------------------------------------------
  // Control
  // ---------------------------------------------------------------------------

  @override
  Future<ControlLockResult> controlLock(String lockData, TTControlAction action) async {
    final data = await _platform.invoke(TTCommands.controlLock, {
      'lockData': lockData,
      'controlAction': action.value,
    });
    return ControlLockResult.fromMap(data);
  }

  @override
  Future<TTLockSwitchState> getLockSwitchState(String lockData) async {
    final data = await _platform.invoke(TTCommands.getLockSwitchState, lockData);
    return TTLockSwitchState.fromValue(data['lockSwitchState'] as int);
  }

  @override
  Future<bool> supportFunction(TTLockFunction function, String lockData) async {
    final data = await _platform.invoke(TTCommands.functionSupport, {
      'lockData': lockData,
      'supportFunction': function.value,
    });
    return data['isSupport'] as bool;
  }

  // ---------------------------------------------------------------------------
  // Passcode
  // ---------------------------------------------------------------------------

  @override
  Future<void> createCustomPasscode({
    required String passcode,
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.createCustomPasscode, {
      'passcode': passcode,
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    });
  }

  @override
  Future<void> modifyPasscode({
    required String passcodeOrigin,
    String? passcodeNew,
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.modifyPasscode, {
      'passcodeOrigin': passcodeOrigin,
      'passcodeNew': passcodeNew,
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    });
  }

  @override
  Future<void> deletePasscode({required String passcode, required String lockData}) async {
    await _platform.invoke(TTCommands.deletePasscode, {
      'passcode': passcode,
      'lockData': lockData,
    });
  }

  @override
  Future<String> resetPasscode(String lockData) async {
    final data = await _platform.invoke(TTCommands.resetPasscodes, lockData);
    return data['lockData'] as String;
  }

  @override
  Future<String> getAdminPasscode(String lockData) async {
    final data = await _platform.invoke(TTCommands.getAdminPasscode, lockData);
    return data['adminPasscode'] as String;
  }

  @override
  Future<void> setErasePasscode({required String erasePasscode, required String lockData}) async {
    await _platform.invoke(TTCommands.setAdminErasePasscode, {
      'erasePasscode': erasePasscode,
      'lockData': lockData,
    });
  }

  @override
  Future<List<dynamic>> getAllValidPasscodes(String lockData) async {
    final data = await _platform.invoke(TTCommands.getAllValidPasscode, lockData);
    final s = data['passcodeListString'] as String?;
    if (s == null) return [];
    return convert.jsonDecode(s) as List;
  }

  @override
  Future<void> recoverPasscode({
    required String passcode,
    required String passcodeNew,
    required TTPasscodeType type,
    required int startDate,
    required int endDate,
    required int cycleType,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.recoverPasscode, {
      'passcode': passcode,
      'passcodeNew': passcodeNew,
      'type': type.value,
      'cycleType': cycleType,
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    });
  }

  @override
  Future<String> modifyAdminPasscode({required String adminPasscode, required String lockData}) async {
    final data = await _platform.invoke(TTCommands.modifyAdminPasscode, {
      'adminPasscode': adminPasscode,
      'lockData': lockData,
    });
    return data['lockData'] as String;
  }

  @override
  Future<String> getPasscodeVerificationParams(String lockData) async {
    final data = await _platform.invoke(TTCommands.getPasscodeVerificationParams, lockData);
    return data['lockData'] as String? ?? '';
  }

  // ---------------------------------------------------------------------------
  // Card
  // ---------------------------------------------------------------------------

  @override
  Stream<AddCardEvent> addCard({
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
    return _platform.eventStream(TTCommands.addCard, params).map((e) {
      if (e.isProgress) return AddCardProgress();
      return AddCardComplete(cardNumber: e.data['cardNumber'] as String);
    });
  }

  @override
  Future<void> modifyCardValidityPeriod({
    required String cardNumber,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    final params = <String, dynamic>{
      'cardNumber': cardNumber,
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    };
    if (cycleList != null && cycleList.isNotEmpty) {
      params['cycleJsonList'] = TTCycleModel.encodeList(cycleList);
    }
    await _platform.invoke(TTCommands.modifyCard, params);
  }

  @override
  Future<void> deleteCard({required String cardNumber, required String lockData}) async {
    await _platform.invoke(TTCommands.deleteCard, {'cardNumber': cardNumber, 'lockData': lockData});
  }

  @override
  Future<List<dynamic>> getAllValidCards(String lockData) async {
    final data = await _platform.invoke(TTCommands.getAllValidCards, lockData);
    final s = data['cardListString'] as String?;
    if (s == null) return [];
    return convert.jsonDecode(s) as List;
  }

  @override
  Future<void> clearAllCards(String lockData) async {
    await _platform.invoke(TTCommands.clearAllCards, lockData);
  }

  @override
  Future<void> recoverCard({
    required String cardNumber,
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.recoverCard, {
      'cardNumber': cardNumber,
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    });
  }

  @override
  Future<void> reportLossCard({required String cardNumber, required String lockData}) async {
    await _platform.invoke(TTCommands.reportLossCard, {
      'cardNumber': cardNumber,
      'lockData': lockData,
    });
  }

  // ---------------------------------------------------------------------------
  // Fingerprint
  // ---------------------------------------------------------------------------

  @override
  Stream<AddFingerprintEvent> addFingerprint({
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
    return _platform.eventStream(TTCommands.addFingerprint, params).map((e) {
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
  Future<void> modifyFingerprintValidityPeriod({
    required String fingerprintNumber,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    final params = <String, dynamic>{
      'fingerprintNumber': fingerprintNumber,
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    };
    if (cycleList != null && cycleList.isNotEmpty) {
      params['cycleJsonList'] = TTCycleModel.encodeList(cycleList);
    }
    await _platform.invoke(TTCommands.modifyFingerprint, params);
  }

  @override
  Future<void> deleteFingerprint({required String fingerprintNumber, required String lockData}) async {
    await _platform.invoke(TTCommands.deleteFingerprint, {
      'fingerprintNumber': fingerprintNumber,
      'lockData': lockData,
    });
  }

  @override
  Future<List<dynamic>> getAllValidFingerprints(String lockData) async {
    final data = await _platform.invoke(TTCommands.getAllValidFingerprints, lockData);
    final s = data['fingerprintListString'] as String?;
    if (s == null) return [];
    return convert.jsonDecode(s) as List;
  }

  @override
  Future<void> clearAllFingerprints(String lockData) async {
    await _platform.invoke(TTCommands.clearAllFingerprints, lockData);
  }

  // ---------------------------------------------------------------------------
  // Face
  // ---------------------------------------------------------------------------

  @override
  Stream<AddFaceEvent> addFace({
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
    return _platform.eventStream(TTCommands.addFace, params).map((e) {
      if (e.isProgress) {
        return AddFaceProgress(
          state: TTFaceState.fromValue(e.data['state'] as int),
          errorCode: TTFaceErrorCode.fromValue(e.data['errorCode'] as int),
        );
      }
      return AddFaceComplete(faceNumber: e.data['faceNumber'] as String);
    });
  }

  @override
  Future<String> addFaceData({
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String faceFeatureData,
    required String lockData,
  }) async {
    final params = <String, dynamic>{
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
      'faceFeatureData': faceFeatureData,
    };
    if (cycleList != null && cycleList.isNotEmpty) {
      params['cycleJsonList'] = TTCycleModel.encodeList(cycleList);
    }
    final data = await _platform.invoke(TTCommands.addFaceData, params);
    return data['faceNumber'] as String;
  }

  @override
  Future<void> modifyFace({
    required String faceNumber,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    final params = <String, dynamic>{
      'faceNumber': faceNumber,
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    };
    if (cycleList != null && cycleList.isNotEmpty) {
      params['cycleJsonList'] = TTCycleModel.encodeList(cycleList);
    }
    await _platform.invoke(TTCommands.modifyFace, params);
  }

  @override
  Future<void> deleteFace({required String faceNumber, required String lockData}) async {
    await _platform.invoke(TTCommands.deleteFace, {'lockData': lockData, 'faceNumber': faceNumber});
  }

  @override
  Future<void> clearFace(String lockData) async {
    await _platform.invoke(TTCommands.clearFace, {'lockData': lockData});
  }

  // ---------------------------------------------------------------------------
  // Time
  // ---------------------------------------------------------------------------

  @override
  Future<void> setLockTime({required int timestamp, required String lockData}) async {
    await _platform.invoke(TTCommands.setLockTime, {'timestamp': timestamp, 'lockData': lockData});
  }

  @override
  Future<int> getLockTime(String lockData) async {
    final data = await _platform.invoke(TTCommands.getLockTime, lockData);
    return data['timestamp'] as int;
  }

  @override
  Future<void> setLockWorkingTime({
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.setLockWorkingTime, {
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    });
  }

  // ---------------------------------------------------------------------------
  // Records / Power / System
  // ---------------------------------------------------------------------------

  @override
  Future<String> getLockOperateRecord({required TTOperateRecordType type, required String lockData}) async {
    final data = await _platform.invoke(TTCommands.getLockOperateRecord, {
      'logType': type.value,
      'lockData': lockData,
    });
    return (data['records'] as String?) ?? '';
  }

  @override
  Future<int> getLockPower(String lockData) async {
    final data = await _platform.invoke(TTCommands.getLockPower, lockData);
    return data['electricQuantity'] as int;
  }

  @override
  Future<TTLockSystemModel> getLockSystemInfo(String lockData) async {
    final data = await _platform.invoke(TTCommands.getLockSystemInfo, lockData);
    return TTLockSystemModel.fromMap(data);
  }

  @override
  Future<String> getLockFeatureValue(String lockData) async {
    final data = await _platform.invoke(TTCommands.getLockFeatureValue, lockData);
    return data['lockData'] as String;
  }

  // ---------------------------------------------------------------------------
  // Auto Locking
  // ---------------------------------------------------------------------------

  @override
  Future<AutoLockingTime> getAutoLockingPeriodicTime(String lockData) async {
    final data = await _platform.invoke(TTCommands.getAutoLockTime, lockData);
    return AutoLockingTime.fromMap(data);
  }

  @override
  Future<void> setAutoLockingPeriodicTime({required int seconds, required String lockData}) async {
    await _platform.invoke(TTCommands.setAutoLockTime, {
      'currentTime': seconds,
      'lockData': lockData,
    });
  }

  // ---------------------------------------------------------------------------
  // Remote Unlock Switch
  // ---------------------------------------------------------------------------

  @override
  Future<bool> getRemoteUnlockSwitchState(String lockData) async {
    final data = await _platform.invoke(TTCommands.getRemoteUnlockSwitch, lockData);
    return data['isOn'] as bool;
  }

  @override
  Future<String> setRemoteUnlockSwitchState({required bool isOn, required String lockData}) async {
    final data = await _platform.invoke(TTCommands.setRemoteUnlockSwitch, {
      'isOn': isOn,
      'lockData': lockData,
    });
    return data['lockData'] as String;
  }

  // ---------------------------------------------------------------------------
  // Config
  // ---------------------------------------------------------------------------

  @override
  Future<bool> getLockConfig({required TTLockConfig config, required String lockData}) async {
    final data = await _platform.invoke(TTCommands.getLockConfig, {
      'lockData': lockData,
      'lockConfig': config.value,
    });
    return data['isOn'] as bool;
  }

  @override
  Future<void> setLockConfig({
    required TTLockConfig config,
    required bool isOn,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.setLockConfig, {
      'isOn': isOn,
      'lockData': lockData,
      'lockConfig': config.value,
    });
  }

  // ---------------------------------------------------------------------------
  // Direction
  // ---------------------------------------------------------------------------

  @override
  Future<TTLockDirection> getLockDirection(String lockData) async {
    final data = await _platform.invoke(TTCommands.getLockDirection, lockData);
    return TTLockDirection.fromValue(data['direction'] as int);
  }

  @override
  Future<void> setLockDirection({required TTLockDirection direction, required String lockData}) async {
    await _platform.invoke(TTCommands.setLockDirection, {
      'lockData': lockData,
      'direction': direction.value,
    });
  }

  // ---------------------------------------------------------------------------
  // Passage Mode
  // ---------------------------------------------------------------------------

  @override
  Future<void> addPassageMode({
    required TTPassageModeType type,
    List<int>? weekly,
    List<int>? monthly,
    required int startTime,
    required int endTime,
    required String lockData,
  }) async {
    final params = <String, dynamic>{
      'passageModeType': type.value,
      'startDate': startTime,
      'endDate': endTime,
      'lockData': lockData,
    };
    if (type == TTPassageModeType.weekly) {
      params['weekly'] = weekly;
    } else {
      params['monthly'] = monthly;
    }
    await _platform.invoke(TTCommands.addPassageMode, params);
  }

  @override
  Future<void> clearAllPassageModes(String lockData) async {
    await _platform.invoke(TTCommands.clearAllPassageModes, lockData);
  }

  // ---------------------------------------------------------------------------
  // Lift
  // ---------------------------------------------------------------------------

  @override
  Future<ControlLockResult> activateLift({required String floors, required String lockData}) async {
    final data = await _platform.invoke(TTCommands.activateLift, {
      'floors': floors,
      'lockData': lockData,
    });
    return ControlLockResult.fromMap(data);
  }

  @override
  Future<void> setLiftControlable({required String floors, required String lockData}) async {
    await _platform.invoke(TTCommands.setLiftControlable, {
      'floors': floors,
      'lockData': lockData,
    });
  }

  @override
  Future<void> setLiftWorkMode({required TTLiftWorkActivateType type, required String lockData}) async {
    await _platform.invoke(TTCommands.setLiftWorkMode, {
      'liftWorkActiveType': type.value,
      'lockData': lockData,
    });
  }

  // ---------------------------------------------------------------------------
  // Power Saver
  // ---------------------------------------------------------------------------

  @override
  Future<void> setPowerSaverWorkMode({required TTPowerSaverWorkType type, required String lockData}) async {
    await _platform.invoke(TTCommands.setPowerSaverWorkMode, {
      'powerSaverType': type.value,
      'lockData': lockData,
    });
  }

  @override
  Future<void> setPowerSaverControlableLock({required String lockMac, required String lockData}) async {
    await _platform.invoke(TTCommands.setPowerSaverControlable, {
      'lockMac': lockMac,
      'lockData': lockData,
    });
  }

  // ---------------------------------------------------------------------------
  // Hotel
  // ---------------------------------------------------------------------------

  @override
  Future<void> setHotel({
    required String hotelInfo,
    required int buildingNumber,
    required int floorNumber,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.setHotelInfo, {
      'hotelInfo': hotelInfo,
      'buildingNumber': buildingNumber,
      'floorNumber': floorNumber,
      'lockData': lockData,
    });
  }

  @override
  Future<void> setHotelCardSector({required String sector, required String lockData}) async {
    await _platform.invoke(TTCommands.setHotelCardSector, {
      'sector': sector,
      'lockData': lockData,
    });
  }

  // ---------------------------------------------------------------------------
  // Version
  // ---------------------------------------------------------------------------

  @override
  Future<String> getLockVersion(String lockMac) async {
    final data = await _platform.invoke(TTCommands.getLockVersion, {'lockMac': lockMac});
    return data['lockVersion'] as String;
  }

  @override
  Future<int> setNBServerAddress({
    required String ip,
    required String port,
    required String lockData,
  }) async {
    final data = await _platform.invoke(TTCommands.setNBServerAddress, {
      'ip': ip,
      'port': port,
      'lockData': lockData,
    });
    return data['electricQuantity'] as int;
  }

  // Not implemented in classic (commented there); platform command available.
  // @override
  // Future<void> setNBAwakeModes({required List<int> modes, required String lockData}) async {
  //   await _platform.invoke(TTCommands.setNBAwakeModes, {'nbAwakeModes': modes, 'lockData': lockData});
  // }
  // @override
  // Future<List<int>> getNBAwakeModes(String lockData) async {
  //   final data = await _platform.invoke(TTCommands.getNBAwakeModes, lockData);
  //   return (data['nbAwakeModes'] as List<dynamic>).cast<int>();
  // }
  // @override
  // Future<void> setNBAwakeTimes({required List<Map<String, dynamic>> times, required String lockData}) async {
  //   await _platform.invoke(TTCommands.setNBAwakeTimes, {'nbAwakeTimeList': times, 'lockData': lockData});
  // }
  // @override
  // Future<List<Map<String, dynamic>>> getNBAwakeTimes(String lockData) async {
  //   final data = await _platform.invoke(TTCommands.getNBAwakeTimes, lockData);
  //   return (data['nbAwakeTimeList'] as List<dynamic>).cast<Map<String, dynamic>>();
  // }

  // ---------------------------------------------------------------------------
  // WiFi Lock
  // ---------------------------------------------------------------------------

  @override
  Stream<List<dynamic>> scanWifi(String lockData) {
    return _platform
        .eventStream(TTCommands.scanWifi, {'lockData': lockData})
        .map((e) => e.data['wifiList'] as List<dynamic>);
  }

  @override
  Future<void> configWifi({
    required String wifiName,
    required String wifiPassword,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.configWifi, {
      'wifiName': wifiName,
      'wifiPassword': wifiPassword,
      'lockData': lockData,
    });
  }

  @override
  Future<void> configServer({required String ip, required String port, required String lockData}) async {
    await _platform.invoke(TTCommands.configServer, {'ip': ip, 'port': port, 'lockData': lockData});
  }

  @override
  Future<TTWifiInfoModel> getWifiInfo(String lockData) async {
    final data = await _platform.invoke(TTCommands.getWifiInfo, lockData);
    return TTWifiInfoModel.fromMap(data);
  }

  @override
  Future<void> configIp({required TTIpSetting ipSetting, required String lockData}) async {
    final params = Map<String, dynamic>.from(ipSetting.toMap());
    params['lockData'] = lockData;
    params['ipSettingJsonStr'] = convert.jsonEncode(ipSetting.toMap());
    await _platform.invoke(TTCommands.configIp, params);
  }

  @override
  Future<CameraLockWifiResult> configCameraLockWifi({
    required String wifiName,
    required String wifiPassword,
    required String lockData,
  }) async {
    final data = await _platform.invoke(TTCommands.configCameraLockWifi, {
      'wifiName': wifiName,
      'wifiPassword': wifiPassword,
      'lockData': lockData,
    });
    return CameraLockWifiResult.fromMap(data);
  }

  // ---------------------------------------------------------------------------
  // Sound & Sensitivity
  // ---------------------------------------------------------------------------

  @override
  Future<void> setSoundVolume({required TTSoundVolumeType type, required String lockData}) async {
    await _platform.invoke(TTCommands.setSoundVolume, {
      'soundVolumeType': type.value,
      'lockData': lockData,
    });
  }

  @override
  Future<TTSoundVolumeType> getSoundVolume(String lockData) async {
    final data = await _platform.invoke(TTCommands.getSoundVolume, lockData);
    return TTSoundVolumeType.fromValue(data['soundVolumeType'] as int);
  }

  @override
  Future<void> setSensitivity({required TTSensitivityValue value, required String lockData}) async {
    await _platform.invoke(TTCommands.setSensitivity, {
      'lockData': lockData,
      'sensitivityValue': value.value,
    });
  }

  // ---------------------------------------------------------------------------
  // Remote Accessory (on-lock)
  // ---------------------------------------------------------------------------

  @override
  Future<void> addRemoteKey({
    required String remoteKeyMac,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.addRemoteKey, {
      'mac': remoteKeyMac,
      'cycleJsonList': cycleList == null ? null : TTCycleModel.encodeList(cycleList),
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    });
  }

  @override
  Future<void> deleteRemoteKey({required String remoteKeyMac, required String lockData}) async {
    await _platform.invoke(TTCommands.deleteRemoteKey, {'mac': remoteKeyMac, 'lockData': lockData});
  }

  @override
  Future<void> clearRemoteKey(String lockData) async {
    await _platform.invoke(TTCommands.clearRemoteKey, lockData);
  }

  @override
  Future<void> setRemoteKeyValidDate({
    required String remoteKeyMac,
    List<TTCycleModel>? cycleList,
    required int startDate,
    required int endDate,
    required String lockData,
  }) async {
    await _platform.invoke(TTCommands.setRemoteKeyValidDate, {
      'mac': remoteKeyMac,
      'cycleJsonList': cycleList == null ? null : TTCycleModel.encodeList(cycleList),
      'startDate': startDate,
      'endDate': endDate,
      'lockData': lockData,
    });
  }

  @override
  Future<AccessoryElectricQuantityResult> getRemoteAccessoryElectricQuantity({
    required TTRemoteAccessory accessory,
    required String mac,
    required String lockData,
  }) async {
    final data = await _platform.invoke(TTCommands.getAccessoryElectricQuantity, {
      'remoteAccessory': accessory.value,
      'mac': mac,
      'lockData': lockData,
    });
    return AccessoryElectricQuantityResult.fromMap(data);
  }

  @override
  Future<void> addDoorSensor({required String doorSensorMac, required String lockData}) async {
    await _platform.invoke(TTCommands.addDoorSensor, {'mac': doorSensorMac, 'lockData': lockData});
  }

  @override
  Future<void> deleteDoorSensor(String lockData) async {
    await _platform.invoke(TTCommands.deleteDoorSensor, lockData);
  }

  @override
  Future<void> setDoorSensorAlertTime({required int alertTime, required String lockData}) async {
    await _platform.invoke(TTCommands.setDoorSensorAlertTime, {
      'alertTime': alertTime,
      'lockData': lockData,
    });
  }

  // Not implemented in classic (commented there); platform command available.
  // @override
  // Future<void> setDoorSensorSwitch({required bool isOn, required String lockData}) async {
  //   await _platform.invoke(TTCommands.setDoorSensorSwitch, {'isOn': isOn, 'lockData': lockData});
  // }
  // @override
  // Future<bool> getDoorSensorSwitchState(String lockData) async {
  //   final data = await _platform.invoke(TTCommands.getDoorSensorSwitch, lockData);
  //   return data['isOn'] as bool;
  // }
  // @override
  // Future<bool> getDoorSensorState(String lockData) async {
  //   final data = await _platform.invoke(TTCommands.getDoorSensorState, lockData);
  //   return data['isOn'] as bool;
  // }

  // ---------------------------------------------------------------------------
  // Upgrade
  // ---------------------------------------------------------------------------

  @override
  Future<void> setLockEnterUpgradeMode(String lockData) async {
    await _platform.invoke(TTCommands.setLockEnterUpgradeMode, lockData);
  }
}
