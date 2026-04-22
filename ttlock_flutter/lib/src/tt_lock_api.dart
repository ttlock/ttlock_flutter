import 'package:flutter/services.dart';
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart' as pigeon;
import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

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

  Stream<pigeon.TTLockScanModel> lockScanLock() => pigeon.lockScanLock();

  /// 订阅前会先调用 [setEventLockData]；[lockData] 不能为空字符串。
  Stream<TTWifiScanResult> lockScanWifi(String lockData) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return Stream<void>.fromFuture(
      runLockApi(() => _host.setEventLockData(lockData)),
    ).asyncExpand((_) => pigeon.lockScanWifi());
  }

  /// 订阅前会先调用 [setEventLockData]；[lockData] 不能为空字符串。
  Stream<pigeon.AddCardEvent> lockAddCard(String lockData) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return Stream<void>.fromFuture(
      runLockApi(() => _host.setEventLockData(lockData)),
    ).asyncExpand((_) => pigeon.lockAddCard());
  }

  /// 订阅前会先调用 [setEventLockData]；[lockData] 不能为空字符串。
  Stream<pigeon.AddFingerprintEvent> lockAddFingerprint(String lockData) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return Stream<void>.fromFuture(
      runLockApi(() => _host.setEventLockData(lockData)),
    ).asyncExpand((_) => pigeon.lockAddFingerprint());
  }

  /// 订阅前会先调用 [setEventLockData]；[lockData] 不能为空字符串。
  Stream<pigeon.AddFaceEvent> lockAddFace(String lockData) {
    if (lockData.isEmpty) {
      throw ArgumentError.value(lockData, 'lockData', 'must not be empty');
    }
    return Stream<void>.fromFuture(
      runLockApi(() => _host.setEventLockData(lockData)),
    ).asyncExpand((_) => pigeon.lockAddFace());
  }

  /// 在订阅 [lockScanWifi]、[lockAddCard]、[lockAddFingerprint]、[lockAddFace] 等流之前设置 `lockData`（推荐，不依赖其它接口副作用）。
  /// 上述 stream 方法已内置调用，一般无需单独调用。
  // Future<void> setEventLockData(String lockData) =>
  //     runLockApi(() => _host.setEventLockData(lockData));

  Future<pigeon.TTBluetoothState> getBluetoothState() =>
      runLockApi(() => _host.getBluetoothState());

  Future<String> initLock(pigeon.TTLockInitParams params) =>
      runLockApi(() => _host.initLock(params));

  Future<void> resetLock(String lockData) =>
      runLockApi(() => _host.resetLock(lockData));

  Future<String> resetEkey(String lockData) =>
      runLockApi(() => _host.resetEkey(lockData));

  Future<void> resetLockByCode(String lockMac, String resetCode) =>
      runLockApi(() => _host.resetLockByCode(lockMac, resetCode));

  Future<void> verifyLock(String lockMac) =>
      runLockApi(() => _host.verifyLock(lockMac));

  Future<pigeon.ControlLockResult> controlLock(
    String lockData,
    pigeon.TTControlAction action,
  ) =>
      runLockApi(() => _host.controlLock(lockData, action));

  Future<pigeon.TTLockSwitchState> getLockSwitchState(String lockData) =>
      runLockApi(() => _host.getLockSwitchState(lockData));

  Future<bool> supportFunction(
    pigeon.TTLockFunction function,
    String lockData,
  ) =>
      runLockApi(() => _host.supportFunction(function, lockData));

  Future<void> createCustomPasscode(
    String passcode,
    int startDate,
    int endDate,
    String lockData,
  ) =>
      runLockApi(() => _host.createCustomPasscode(passcode, startDate, endDate, lockData));

  Future<void> modifyPasscode(
    String passcodeOrigin,
    String? passcodeNew,
    int startDate,
    int endDate,
    String lockData,
  ) =>
      runLockApi(
        () => _host.modifyPasscode(passcodeOrigin, passcodeNew, startDate, endDate, lockData),
      );

  Future<void> deletePasscode(String passcode, String lockData) =>
      runLockApi(() => _host.deletePasscode(passcode, lockData));

  Future<String> resetPasscode(String lockData) =>
      runLockApi(() => _host.resetPasscode(lockData));

  Future<String> getAdminPasscode(String lockData) =>
      runLockApi(() => _host.getAdminPasscode(lockData));

  Future<void> setErasePasscode(String erasePasscode, String lockData) =>
      runLockApi(() => _host.setErasePasscode(erasePasscode, lockData));

  Future<List<pigeon.TTPasscodeModel>> getAllValidPasscodes(String lockData) =>
      runLockApi(() => _host.getAllValidPasscodes(lockData));

  Future<void> recoverPasscode(
    String passcode,
    String passcodeNew,
    pigeon.TTPasscodeType type,
    int startDate,
    int endDate,
    int cycleType,
    String lockData,
  ) =>
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
      );

  Future<String?> modifyAdminPasscode(String adminPasscode, String lockData) =>
      runLockApi(() => _host.modifyAdminPasscode(adminPasscode, lockData));

  Future<String> getPasscodeVerificationParams(String lockData) =>
      runLockApi(() => _host.getPasscodeVerificationParams(lockData));

  Future<void> modifyCardValidityPeriod(
    String cardNumber,
    List<pigeon.TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  ) =>
      runLockApi(
        () => _host.modifyCardValidityPeriod(cardNumber, cycleList, startDate, endDate, lockData),
      );

  Future<void> deleteCard(String cardNumber, String lockData) =>
      runLockApi(() => _host.deleteCard(cardNumber, lockData));

  Future<List<pigeon.TTICCardModel>> getAllValidCards(String lockData) =>
      runLockApi(() => _host.getAllValidCards(lockData));

  Future<void> clearAllCards(String lockData) =>
      runLockApi(() => _host.clearAllCards(lockData));

  Future<void> recoverCard(
    String cardNumber,
    int startDate,
    int endDate,
    String lockData,
  ) =>
      runLockApi(() => _host.recoverCard(cardNumber, startDate, endDate, lockData));

  Future<void> reportLossCard(String cardNumber, String lockData) =>
      runLockApi(() => _host.reportLossCard(cardNumber, lockData));

  Future<void> modifyFingerprintValidityPeriod(
    String fingerprintNumber,
    List<pigeon.TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  ) =>
      runLockApi(
        () => _host.modifyFingerprintValidityPeriod(
          fingerprintNumber,
          cycleList,
          startDate,
          endDate,
          lockData,
        ),
      );

  Future<void> deleteFingerprint(String fingerprintNumber, String lockData) =>
      runLockApi(() => _host.deleteFingerprint(fingerprintNumber, lockData));

  Future<List<pigeon.TTFingerprintModel>> getAllValidFingerprints(String lockData) =>
      runLockApi(() => _host.getAllValidFingerprints(lockData));

  Future<void> clearAllFingerprints(String lockData) =>
      runLockApi(() => _host.clearAllFingerprints(lockData));

  Future<void> modifyFace(
    String faceNumber,
    List<pigeon.TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  ) =>
      runLockApi(() => _host.modifyFace(faceNumber, cycleList, startDate, endDate, lockData));

  Future<String> addFaceData(
    List<pigeon.TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String faceFeatureData,
    String lockData,
  ) =>
      runLockApi(
        () => _host.addFaceData(cycleList, startDate, endDate, faceFeatureData, lockData),
      );

  Future<void> deleteFace(String faceNumber, String lockData) =>
      runLockApi(() => _host.deleteFace(faceNumber, lockData));

  Future<void> clearFace(String lockData) =>
      runLockApi(() => _host.clearFace(lockData));

  Future<void> setLockTime(int timestamp, String lockData) =>
      runLockApi(() => _host.setLockTime(timestamp, lockData));

  Future<int> getLockTime(String lockData) =>
      runLockApi(() => _host.getLockTime(lockData));

  Future<void> setLockWorkingTime(int startDate, int endDate, String lockData) =>
      runLockApi(() => _host.setLockWorkingTime(startDate, endDate, lockData));

  Future<String> getLockOperateRecord(
    pigeon.TTOperateRecordType type,
    String lockData,
  ) =>
      runLockApi(() => _host.getLockOperateRecord(type, lockData));

  Future<int> getLockPower(String lockData) =>
      runLockApi(() => _host.getLockPower(lockData));

  Future<pigeon.TTLockSystemModel> getLockSystemInfo(String lockData) =>
      runLockApi(() => _host.getLockSystemInfo(lockData));

  Future<String> getLockFeatureValue(String lockData) =>
      runLockApi(() => _host.getLockFeatureValue(lockData));

  Future<pigeon.AutoLockingTime> getAutoLockingPeriodicTime(String lockData) =>
      runLockApi(() => _host.getAutoLockingPeriodicTime(lockData));

  Future<void> setAutoLockingPeriodicTime(int seconds, String lockData) =>
      runLockApi(() => _host.setAutoLockingPeriodicTime(seconds, lockData));

  Future<bool> getRemoteUnlockSwitchState(String lockData) =>
      runLockApi(() => _host.getRemoteUnlockSwitchState(lockData));

  Future<String> setRemoteUnlockSwitchState(bool isOn, String lockData) =>
      runLockApi(() => _host.setRemoteUnlockSwitchState(isOn, lockData));

  Future<bool> getLockConfig(pigeon.TTLockConfig config, String lockData) =>
      runLockApi(() => _host.getLockConfig(config, lockData));

  Future<void> setLockConfig(
    pigeon.TTLockConfig config,
    bool isOn,
    String lockData,
  ) =>
      runLockApi(() => _host.setLockConfig(config, isOn, lockData));

  Future<pigeon.TTLockDirection> getLockDirection(String lockData) =>
      runLockApi(() => _host.getLockDirection(lockData));

  Future<void> setLockDirection(
    pigeon.TTLockDirection direction,
    String lockData,
  ) =>
      runLockApi(() => _host.setLockDirection(direction, lockData));

  Future<void> addPassageMode(
    pigeon.TTPassageModeType type,
    List<int>? weekly,
    List<int>? monthly,
    int startTime,
    int endTime,
    String lockData,
  ) =>
      runLockApi(
        () => _host.addPassageMode(type, weekly, monthly, startTime, endTime, lockData),
      );

  Future<void> clearAllPassageModes(String lockData) =>
      runLockApi(() => _host.clearAllPassageModes(lockData));

  Future<pigeon.ControlLockResult> activateLift(String floors, String lockData) =>
      runLockApi(() => _host.activateLift(floors, lockData));

  Future<void> setLiftControlable(String floors, String lockData) =>
      runLockApi(() => _host.setLiftControlable(floors, lockData));

  Future<void> setLiftWorkMode(
    pigeon.TTLiftWorkActivateType type,
    String lockData,
  ) =>
      runLockApi(() => _host.setLiftWorkMode(type, lockData));

  Future<void> setPowerSaverWorkMode(
    pigeon.TTPowerSaverWorkType type,
    String lockData,
  ) =>
      runLockApi(() => _host.setPowerSaverWorkMode(type, lockData));

  Future<void> setPowerSaverControlableLock(String lockMac, String lockData) =>
      runLockApi(() => _host.setPowerSaverControlableLock(lockMac, lockData));

  Future<void> setHotel(
    String hotelInfo,
    int buildingNumber,
    int floorNumber,
    String lockData,
  ) =>
      runLockApi(() => _host.setHotel(hotelInfo, buildingNumber, floorNumber, lockData));

  Future<void> setHotelCardSector(String sector, String lockData) =>
      runLockApi(() => _host.setHotelCardSector(sector, lockData));

  Future<pigeon.TTLockVersion> getLockVersion(String lockMac) =>
      runLockApi(() => _host.getLockVersion(lockMac));

  Future<int> setNBServerAddress(String ip, String port, String lockData) =>
      runLockApi(() => _host.setNBServerAddress(ip, port, lockData));

  Future<void> configWifi(
    String wifiName,
    String wifiPassword,
    String lockData,
  ) =>
      runLockApi(() => _host.configWifi(wifiName, wifiPassword, lockData));

  Future<void> configServer(String ip, String port, String lockData) =>
      runLockApi(() => _host.configServer(ip, port, lockData));

  Future<pigeon.TTWifiInfoModel> getWifiInfo(String lockData) =>
      runLockApi(() => _host.getWifiInfo(lockData));

  Future<void> configIp(pigeon.TTIpSetting ipSetting, String lockData) =>
      runLockApi(() => _host.configIp(ipSetting, lockData));

  Future<pigeon.CameraLockWifiResult> configCameraLockWifi(
    String wifiName,
    String wifiPassword,
    String lockData,
  ) =>
      runLockApi(() => _host.configCameraLockWifi(wifiName, wifiPassword, lockData));

  Future<void> setSoundVolume(
    pigeon.TTSoundVolumeType type,
    String lockData,
  ) =>
      runLockApi(() => _host.setSoundVolume(type, lockData));

  Future<pigeon.TTSoundVolumeType> getSoundVolume(String lockData) =>
      runLockApi(() => _host.getSoundVolume(lockData));

  Future<void> setSensitivity(
    pigeon.TTSensitivityValue value,
    String lockData,
  ) =>
      runLockApi(() => _host.setSensitivity(value, lockData));

  Future<void> setRemoteKeyValidDate(
    String remoteKeyMac,
    List<pigeon.TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  ) =>
      runLockApi(
        () => _host.setRemoteKeyValidDate(remoteKeyMac, cycleList, startDate, endDate, lockData),
      );

  Future<void> addRemoteKey(
    String remoteKeyMac,
    List<pigeon.TTCycleModel>? cycleList,
    int startDate,
    int endDate,
    String lockData,
  ) =>
      runLockApi(
        () => _host.addRemoteKey(remoteKeyMac, cycleList, startDate, endDate, lockData),
      );

  Future<void> deleteRemoteKey(String remoteKeyMac, String lockData) =>
      runLockApi(() => _host.deleteRemoteKey(remoteKeyMac, lockData));

  Future<void> clearRemoteKey(String lockData) =>
      runLockApi(() => _host.clearRemoteKey(lockData));

  Future<pigeon.AccessoryElectricQuantityResult> getRemoteAccessoryElectricQuantity(
    pigeon.TTRemoteAccessory accessory,
    String mac,
    String lockData,
  ) =>
      runLockApi(() => _host.getRemoteAccessoryElectricQuantity(accessory, mac, lockData));

  Future<void> addDoorSensor(String doorSensorMac, String lockData) =>
      runLockApi(() => _host.addDoorSensor(doorSensorMac, lockData));

  Future<void> deleteDoorSensor(String lockData) =>
      runLockApi(() => _host.deleteDoorSensor(lockData));

  Future<void> setDoorSensorAlertTime(int alertTime, String lockData) =>
      runLockApi(() => _host.setDoorSensorAlertTime(alertTime, lockData));
}
