import 'package:flutter/services.dart';
import 'package:ttlock_flutter/src/ble_guard.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart'
    as pigeon;
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

import 'event_stream_params.dart';
import 'pigeon_errors.dart';

/// 锁相关 Pigeon API：将 [PlatformException] 转为 [TTLockException]（见 `package:ttlock_flutter/errors`）。
class TTLockApi {
  TTLockApi({
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) : _host = pigeon.TTLockHostApi(
          binaryMessenger: binaryMessenger,
          messageChannelSuffix: messageChannelSuffix,
        );

  final pigeon.TTLockHostApi _host;

  pigeon.TTLockHostApi get host => _host;

  Stream<pigeon.TTLockScanModel> lockScanLock() =>
      Stream<void>.fromFuture(runBleGate(TTBleOperation.scanDevice))
          .asyncExpand((_) => mapLockStreamErrors(pigeon.lockScanLock()));

  /// 订阅前调用 [setLockScanWifiParam]；[lockData] 不能为空字符串。
  Stream<TTWifiScanResult> lockScanWifi(String lockData) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return Stream<void>.fromFuture(runBleGate(TTBleOperation.deviceOperation))
        .asyncExpand(
      (_) => Stream<void>.fromFuture(
        runLockApi(
            () => _host.setLockScanWifiParam(
                  pigeon.TTLockScanWifiEventParam(lockData: lockData),
                ),
            method: 'setLockScanWifiParam'),
      ).asyncExpand((_) => mapLockStreamErrors(pigeon.lockScanWifi())),
    );
  }

  /// 订阅前调用 [setLockAddCardParam]。
  Stream<pigeon.AddCardEvent> lockAddCard(
    String lockData, {
    List<pigeon.TTCycleModel>? cycleList,
    int? startDate,
    int? endDate,
  }) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    final param = buildLockCredentialParam(
      lockData: lockData,
      cycleList: cycleList,
      startDate: startDate,
      endDate: endDate,
    );
    return Stream<void>.fromFuture(runBleGate(TTBleOperation.deviceOperation))
        .asyncExpand(
      (_) => Stream<void>.fromFuture(
        runLockApi(() => _host.setLockAddCardParam(param),
            method: 'setLockAddCardParam'),
      ).asyncExpand((_) => mapLockStreamErrors(pigeon.lockAddCard())),
    );
  }

  /// 订阅前调用 [setLockAddFingerprintParam]。
  Stream<pigeon.AddFingerprintEvent> lockAddFingerprint(
    String lockData, {
    List<pigeon.TTCycleModel>? cycleList,
    int? startDate,
    int? endDate,
  }) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    final param = buildLockCredentialParam(
      lockData: lockData,
      cycleList: cycleList,
      startDate: startDate,
      endDate: endDate,
    );
    return Stream<void>.fromFuture(runBleGate(TTBleOperation.deviceOperation))
        .asyncExpand(
      (_) => Stream<void>.fromFuture(
        runLockApi(() => _host.setLockAddFingerprintParam(param),
            method: 'setLockAddFingerprintParam'),
      ).asyncExpand((_) => mapLockStreamErrors(pigeon.lockAddFingerprint())),
    );
  }

  /// 订阅前调用 [setLockAddFaceParam]。
  Stream<pigeon.AddFaceEvent> lockAddFace(
    String lockData, {
    List<pigeon.TTCycleModel>? cycleList,
    int? startDate,
    int? endDate,
  }) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    final param = buildLockCredentialParam(
      lockData: lockData,
      cycleList: cycleList,
      startDate: startDate,
      endDate: endDate,
    );
    return Stream<void>.fromFuture(runBleGate(TTBleOperation.deviceOperation))
        .asyncExpand(
      (_) => Stream<void>.fromFuture(
        runLockApi(() => _host.setLockAddFaceParam(param),
            method: 'setLockAddFaceParam'),
      ).asyncExpand((_) => mapLockStreamErrors(pigeon.lockAddFace())),
    );
  }

  /// 订阅前调用 [setLockAddPalmVeinParam]。
  Stream<pigeon.AddPalmVeinEvent> lockAddPalmVein(
    String lockData, {
    List<pigeon.TTCycleModel>? cycleList,
    int? startDate,
    int? endDate,
  }) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    final param = buildLockCredentialParam(
      lockData: lockData,
      cycleList: cycleList,
      startDate: startDate,
      endDate: endDate,
    );
    return Stream<void>.fromFuture(runBleGate(TTBleOperation.deviceOperation))
        .asyncExpand(
      (_) => Stream<void>.fromFuture(
        runLockApi(() => _host.setLockAddPalmVeinParam(param),
            method: 'setLockAddPalmVeinParam'),
      ).asyncExpand((_) => mapLockStreamErrors(pigeon.lockAddPalmVein())),
    );
  }

  Future<pigeon.TTBluetoothState> getBluetoothState({Duration? timeout}) =>
      runLockApi(() => _host.getBluetoothState(),
          op: TTBleOperation.getBluetoothState,
          timeout: timeout,
          method: 'getBluetoothState');

  Future<String> initLock(pigeon.TTLockInitParams params,
          {Duration? timeout}) =>
      runLockApi(() => _host.initLock(params),
          timeout: timeout, method: 'initLock');

  Future<void> resetLock(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.resetLock(lockData),
          timeout: timeout, method: 'resetLock');

  Future<String> resetEkey(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.resetEkey(lockData),
          timeout: timeout, method: 'resetEkey');

  Future<void> resetLockByCode(String lockMac, String resetCode,
          {Duration? timeout}) =>
      runLockApi(() => _host.resetLockByCode(lockMac, resetCode),
          timeout: timeout, method: 'resetLockByCode');

  Future<void> verifyLock(String lockMac, {Duration? timeout}) =>
      runLockApi(() => _host.verifyLock(lockMac),
          timeout: timeout, method: 'verifyLock');

  Future<pigeon.ControlLockResult> controlLock(
          String lockData, pigeon.TTControlAction action,
          {Duration? timeout}) =>
      runLockApi(() => _host.controlLock(lockData, action),
          timeout: timeout, method: 'controlLock');

  Future<pigeon.TTLockSwitchState> getLockSwitchState(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getLockSwitchState(lockData),
          timeout: timeout, method: 'getLockSwitchState');

  Future<bool> supportFunction(pigeon.TTLockFunction function, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.supportFunction(function, lockData),
          op: TTBleOperation.stateQuery,
          timeout: timeout,
          method: 'supportFunction');

  Future<void> createCustomPasscode(
          String passcode, int startDate, int endDate, String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.createCustomPasscode(
              passcode, startDate, endDate, lockData),
          timeout: timeout,
          method: 'createCustomPasscode');

  Future<void> modifyPasscode(String passcodeOrigin, String? passcodeNew,
          int startDate, int endDate, String lockData, {Duration? timeout}) =>
      runLockApi(
          () => _host.modifyPasscode(
              passcodeOrigin, passcodeNew, startDate, endDate, lockData),
          timeout: timeout,
          method: 'modifyPasscode');

  Future<void> deletePasscode(String passcode, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.deletePasscode(passcode, lockData),
          timeout: timeout, method: 'deletePasscode');

  Future<String> resetPasscode(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.resetPasscode(lockData),
          timeout: timeout, method: 'resetPasscode');

  Future<String> getAdminPasscode(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.getAdminPasscode(lockData),
          timeout: timeout, method: 'getAdminPasscode');

  Future<void> setErasePasscode(String erasePasscode, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setErasePasscode(erasePasscode, lockData),
          timeout: timeout, method: 'setErasePasscode');

  Future<List<pigeon.TTPasscodeModel>> getAllValidPasscodes(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getAllValidPasscodes(lockData),
          timeout: timeout, method: 'getAllValidPasscodes');

  Future<void> recoverPasscode(
          String passcode,
          String passcodeNew,
          pigeon.TTPasscodeType type,
          int startDate,
          int endDate,
          int cycleType,
          String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.recoverPasscode(
                passcode,
                passcodeNew,
                type,
                startDate,
                endDate,
                cycleType,
                lockData,
              ),
          timeout: timeout,
          method: 'recoverPasscode');

  Future<String?> modifyAdminPasscode(String adminPasscode, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.modifyAdminPasscode(adminPasscode, lockData),
          timeout: timeout, method: 'modifyAdminPasscode');

  Future<String> getPasscodeVerificationParams(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getPasscodeVerificationParams(lockData),
          timeout: timeout, method: 'getPasscodeVerificationParams');

  Future<void> modifyCardValidityPeriod(
          String cardNumber,
          List<pigeon.TTCycleModel>? cycleList,
          int startDate,
          int endDate,
          String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.modifyCardValidityPeriod(
              cardNumber, cycleList, startDate, endDate, lockData),
          timeout: timeout,
          method: 'modifyCardValidityPeriod');

  Future<void> deleteCard(String cardNumber, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.deleteCard(cardNumber, lockData),
          timeout: timeout, method: 'deleteCard');

  Future<List<pigeon.TTICCardModel>> getAllValidCards(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getAllValidCards(lockData),
          timeout: timeout, method: 'getAllValidCards');

  Future<void> clearAllCards(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.clearAllCards(lockData),
          timeout: timeout, method: 'clearAllCards');

  Future<void> recoverCard(
          String cardNumber, int startDate, int endDate, String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.recoverCard(cardNumber, startDate, endDate, lockData),
          timeout: timeout,
          method: 'recoverCard');

  Future<void> reportLossCard(String cardNumber, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.reportLossCard(cardNumber, lockData),
          timeout: timeout, method: 'reportLossCard');

  Future<void> modifyFingerprintValidityPeriod(
          String fingerprintNumber,
          List<pigeon.TTCycleModel>? cycleList,
          int startDate,
          int endDate,
          String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.modifyFingerprintValidityPeriod(
                fingerprintNumber,
                cycleList,
                startDate,
                endDate,
                lockData,
              ),
          timeout: timeout,
          method: 'modifyFingerprintValidityPeriod');

  Future<void> deleteFingerprint(String fingerprintNumber, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.deleteFingerprint(fingerprintNumber, lockData),
          timeout: timeout, method: 'deleteFingerprint');

  Future<List<pigeon.TTFingerprintModel>> getAllValidFingerprints(
          String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getAllValidFingerprints(lockData),
          timeout: timeout, method: 'getAllValidFingerprints');

  Future<void> clearAllFingerprints(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.clearAllFingerprints(lockData),
          timeout: timeout, method: 'clearAllFingerprints');

  Future<void> modifyFace(
          String faceNumber,
          List<pigeon.TTCycleModel>? cycleList,
          int startDate,
          int endDate,
          String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.modifyFace(
              faceNumber, cycleList, startDate, endDate, lockData),
          timeout: timeout,
          method: 'modifyFace');

  Future<String> addFaceData(List<pigeon.TTCycleModel>? cycleList,
          int startDate, int endDate, String faceFeatureData, String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.addFaceData(
              cycleList, startDate, endDate, faceFeatureData, lockData),
          timeout: timeout,
          method: 'addFaceData');

  Future<String> addFaceUrl(String url, List<pigeon.TTCycleModel>? cycleList,
      int startDate, int endDate, String lockData,
      {Duration? timeout}) {
    if (url.isEmpty) {
      throw ArgumentError.value(url, 'url', 'must not be empty');
    }
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return runLockApi(
        () => _host.addFaceUrl(url, cycleList, startDate, endDate, lockData),
        timeout: timeout,
        method: 'addFaceUrl');
  }

  Future<void> setAlias(pigeon.TTAliasType type, String credentialId,
      String alias, String lockData,
      {Duration? timeout}) {
    if (credentialId.isEmpty) {
      throw ArgumentError.value(
          credentialId, 'credentialId', 'must not be empty');
    }
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return runLockApi(() => _host.setAlias(type, credentialId, alias, lockData),
        timeout: timeout, method: 'setAlias');
  }

  Future<void> deleteFace(String faceNumber, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.deleteFace(faceNumber, lockData),
          timeout: timeout, method: 'deleteFace');

  Future<void> clearFace(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.clearFace(lockData),
          timeout: timeout, method: 'clearFace');

  Future<void> modifyPalmVein(
    String palmVeinNumber,
    String lockData, {
    List<pigeon.TTCycleModel>? cycleList,
    int? startDate,
    int? endDate,
    Duration? timeout,
  }) =>
      runLockApi(
          () => _host.modifyPalmVein(
                palmVeinNumber,
                cycleList,
                startDate ?? 0,
                endDate ?? 0,
                lockData,
              ),
          timeout: timeout,
          method: 'modifyPalmVein');

  Future<void> deletePalmVein(String palmVeinNumber, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.deletePalmVein(palmVeinNumber, lockData),
          timeout: timeout, method: 'deletePalmVein');

  Future<void> clearPalmVein(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.clearPalmVein(lockData),
          timeout: timeout, method: 'clearPalmVein');

  Future<List<pigeon.TTPalmVeinModel>> getAllValidPalmVeins(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getAllValidPalmVeins(lockData),
          timeout: timeout, method: 'getAllValidPalmVeins');

  Future<void> addQrCode(
          String qrCodeNumber,
          List<pigeon.TTCycleModel>? cycleList,
          int startDate,
          int endDate,
          String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.addQrCode(
              qrCodeNumber, cycleList, startDate, endDate, lockData),
          timeout: timeout,
          method: 'addQrCode');

  Future<void> modifyQrCodeValidityPeriod(
          String qrCodeNumber,
          List<pigeon.TTCycleModel>? cycleList,
          int startDate,
          int endDate,
          String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.modifyQrCodeValidityPeriod(
                qrCodeNumber,
                cycleList,
                startDate,
                endDate,
                lockData,
              ),
          timeout: timeout,
          method: 'modifyQrCodeValidityPeriod');

  Future<void> deleteQrCode(String qrCodeNumber, int endDate, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.deleteQrCode(qrCodeNumber, endDate, lockData),
          timeout: timeout, method: 'deleteQrCode');

  Future<void> clearAllQrCodes(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.clearAllQrCodes(lockData),
          timeout: timeout, method: 'clearAllQrCodes');

  Future<List<pigeon.TTQrCodeModel>> getAllValidQrCodes(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getAllValidQrCodes(lockData),
          timeout: timeout, method: 'getAllValidQrCodes');

  Future<void> setMotorTorqueLevel(int torqueLevel, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setMotorTorqueLevel(torqueLevel, lockData),
          timeout: timeout, method: 'setMotorTorqueLevel');

  Future<void> setLockLatchBolt(int keepTime, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setLockLatchBolt(keepTime, lockData),
          timeout: timeout, method: 'setLockLatchBolt');

  Future<void> setLockTime(int timestamp, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setLockTime(timestamp, lockData),
          timeout: timeout, method: 'setLockTime');

  Future<int> getLockTime(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.getLockTime(lockData),
          timeout: timeout, method: 'getLockTime');

  Future<void> setLockWorkingTime(int startDate, int endDate, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setLockWorkingTime(startDate, endDate, lockData),
          timeout: timeout, method: 'setLockWorkingTime');

  Future<String> getLockOperateRecord(
          pigeon.TTOperateRecordType type, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getLockOperateRecord(type, lockData),
          timeout: timeout, method: 'getLockOperateRecord');

  Future<int> getLockPower(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.getLockPower(lockData),
          timeout: timeout, method: 'getLockPower');

  Future<pigeon.TTLockSystemModel> getLockSystemInfo(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getLockSystemInfo(lockData),
          timeout: timeout, method: 'getLockSystemInfo');

  Future<String> getLockFeatureValue(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.getLockFeatureValue(lockData),
          timeout: timeout, method: 'getLockFeatureValue');

  Future<pigeon.AutoLockingTime> getAutoLockingPeriodicTime(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getAutoLockingPeriodicTime(lockData),
          timeout: timeout, method: 'getAutoLockingPeriodicTime');

  Future<void> setAutoLockingPeriodicTime(int seconds, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setAutoLockingPeriodicTime(seconds, lockData),
          timeout: timeout, method: 'setAutoLockingPeriodicTime');

  Future<bool> getRemoteUnlockSwitchState(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getRemoteUnlockSwitchState(lockData),
          timeout: timeout, method: 'getRemoteUnlockSwitchState');

  Future<String> setRemoteUnlockSwitchState(bool isOn, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setRemoteUnlockSwitchState(isOn, lockData),
          timeout: timeout, method: 'setRemoteUnlockSwitchState');

  Future<bool> getLockConfig(pigeon.TTLockConfig config, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getLockConfig(config, lockData),
          timeout: timeout, method: 'getLockConfig');

  Future<void> setLockConfig(
          pigeon.TTLockConfig config, bool isOn, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setLockConfig(config, isOn, lockData),
          timeout: timeout, method: 'setLockConfig');

  Future<pigeon.TTLockDirection> getLockDirection(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getLockDirection(lockData),
          timeout: timeout, method: 'getLockDirection');

  Future<void> setLockDirection(
          pigeon.TTLockDirection direction, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setLockDirection(direction, lockData),
          timeout: timeout, method: 'setLockDirection');

  Future<void> addPassageMode(pigeon.TTPassageModeType type, List<int>? weekly,
          List<int>? monthly, int startTime, int endTime, String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.addPassageMode(
              type, weekly, monthly, startTime, endTime, lockData),
          timeout: timeout,
          method: 'addPassageMode');

  Future<void> clearAllPassageModes(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.clearAllPassageModes(lockData),
          timeout: timeout, method: 'clearAllPassageModes');

  Future<pigeon.ControlLockResult> activateLift(String floors, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.activateLift(floors, lockData),
          timeout: timeout, method: 'activateLift');

  Future<void> setLiftControlable(String floors, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setLiftControlable(floors, lockData),
          timeout: timeout, method: 'setLiftControlable');

  Future<void> setLiftWorkMode(
          pigeon.TTLiftWorkActivateType type, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setLiftWorkMode(type, lockData),
          timeout: timeout, method: 'setLiftWorkMode');

  Future<void> setPowerSaverWorkMode(
          pigeon.TTPowerSaverWorkType type, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setPowerSaverWorkMode(type, lockData),
          timeout: timeout, method: 'setPowerSaverWorkMode');

  Future<void> setPowerSaverControlableLock(String lockMac, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setPowerSaverControlableLock(lockMac, lockData),
          timeout: timeout, method: 'setPowerSaverControlableLock');

  Future<void> setHotel(String hotelInfo, int buildingNumber, int floorNumber,
          String lockData, {Duration? timeout}) =>
      runLockApi(
          () =>
              _host.setHotel(hotelInfo, buildingNumber, floorNumber, lockData),
          timeout: timeout,
          method: 'setHotel');

  Future<void> setHotelCardSector(String sector, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setHotelCardSector(sector, lockData),
          timeout: timeout, method: 'setHotelCardSector');

  Future<pigeon.TTLockVersion> getLockVersion(String lockMac,
          {Duration? timeout}) =>
      runLockApi(() => _host.getLockVersion(lockMac),
          timeout: timeout, method: 'getLockVersion');

  Future<int> setNBServerAddress(String ip, String port, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setNBServerAddress(ip, port, lockData),
          timeout: timeout, method: 'setNBServerAddress');

  Future<void> configWifi(
          String wifiName, String wifiPassword, String lockMac, String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.configWifi(wifiName, wifiPassword, lockMac, lockData),
          timeout: timeout,
          method: 'configWifi');

  Future<void> configServer(String ip, String port, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.configServer(ip, port, lockData),
          timeout: timeout, method: 'configServer');

  Future<pigeon.TTWifiInfoModel> getWifiInfo(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getWifiInfo(lockData),
          timeout: timeout, method: 'getWifiInfo');

  Future<void> configIp(pigeon.TTIpSetting ipSetting, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.configIp(ipSetting, lockData),
          timeout: timeout, method: 'configIp');

  Future<pigeon.CameraLockWifiResult> configCameraLockWifi(
          String wifiName, String wifiPassword, String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.configCameraLockWifi(wifiName, wifiPassword, lockData),
          timeout: timeout,
          method: 'configCameraLockWifi');

  Future<void> setSoundVolume(pigeon.TTSoundVolumeType type, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setSoundVolume(type, lockData),
          timeout: timeout, method: 'setSoundVolume');

  Future<pigeon.TTSoundVolumeType> getSoundVolume(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getSoundVolume(lockData),
          timeout: timeout, method: 'getSoundVolume');

  Future<void> setSensitivity(pigeon.TTSensitivityValue value, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setSensitivity(value, lockData),
          timeout: timeout, method: 'setSensitivity');

  Future<void> setRemoteKeyValidDate(
          String remoteKeyMac,
          List<pigeon.TTCycleModel>? cycleList,
          int startDate,
          int endDate,
          String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.setRemoteKeyValidDate(
              remoteKeyMac, cycleList, startDate, endDate, lockData),
          timeout: timeout,
          method: 'setRemoteKeyValidDate');

  Future<void> addRemoteKey(
          String remoteKeyMac,
          List<pigeon.TTCycleModel>? cycleList,
          int startDate,
          int endDate,
          String lockData,
          {Duration? timeout}) =>
      runLockApi(
          () => _host.addRemoteKey(
              remoteKeyMac, cycleList, startDate, endDate, lockData),
          timeout: timeout,
          method: 'addRemoteKey');

  Future<void> deleteRemoteKey(String remoteKeyMac, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.deleteRemoteKey(remoteKeyMac, lockData),
          timeout: timeout, method: 'deleteRemoteKey');

  Future<void> clearRemoteKey(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.clearRemoteKey(lockData),
          timeout: timeout, method: 'clearRemoteKey');

  Future<pigeon.AccessoryElectricQuantityResult>
      getRemoteAccessoryElectricQuantity(
              pigeon.TTRemoteAccessory accessory, String mac, String lockData,
              {Duration? timeout}) =>
          runLockApi(
              () => _host.getRemoteAccessoryElectricQuantity(
                  accessory, mac, lockData),
              timeout: timeout,
              method: 'getRemoteAccessoryElectricQuantity');

  Future<void> addDoorSensor(String doorSensorMac, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.addDoorSensor(doorSensorMac, lockData),
          timeout: timeout, method: 'addDoorSensor');

  Future<void> deleteDoorSensor(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.deleteDoorSensor(lockData),
          timeout: timeout, method: 'deleteDoorSensor');

  Future<void> setDoorSensorAlertTime(int alertTime, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setDoorSensorAlertTime(alertTime, lockData),
          timeout: timeout, method: 'setDoorSensorAlertTime');

  // ---- New API methods ----

  Future<int> getLightTime(String lockData, {Duration? timeout}) =>
      runLockApi(() => _host.getLightTime(lockData),
          timeout: timeout, method: 'getLightTime');

  Future<void> setLightTime(int seconds, String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.setLightTime(seconds, lockData),
          timeout: timeout, method: 'setLightTime');

  Future<List<pigeon.TTPassageModeModel>> getPassageModes(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getPassageModes(lockData),
          timeout: timeout, method: 'getPassageModes');

  Future<pigeon.TTSensitivityValue> getSensitivity(String lockData,
          {Duration? timeout}) =>
      runLockApi(() => _host.getSensitivity(lockData),
          timeout: timeout, method: 'getSensitivity');
}
