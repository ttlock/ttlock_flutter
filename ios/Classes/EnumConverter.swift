import Foundation
import TTLockOnPremise

func lockConfigConvert(_ config: TTLockConfig) -> TTLockConfigType {
  switch config {
  case .audio:
    return TTLockConfigType.lockSound
  case .passcodeVisible:
    return TTLockConfigType.passcodeVisible
  case .freeze:
    return TTLockConfigType.lockFreeze
  case .tamperAlert:
    return TTLockConfigType.tamperAlert
  case .resetButton:
    return TTLockConfigType.resetButton
  case .privacyLock:
    return TTLockConfigType.privacyLock
  case .passageModeAutoUnlock:
    return TTLockConfigType.passageModeAutoUnlock
  case .wifiLockPowerSavingMode:
    return TTLockConfigType.wifiPowerSavingMode
  case .doubleAuth:
    return TTLockConfigType.doubleAuth
  case .publicMode:
    return TTLockConfigType.publicMode
  case .lowBatteryAutoUnlock:
    return TTLockConfigType.lowBatteryAutoUnlock
  }
}

func liftWorkActivateTypeConvert(_ type: TTLiftWorkActivateType) -> TTLiftWorkMode {
  switch type {
  case .allFloors:
    return TTLiftWorkMode.activateAllFloors
  case .specificFloors:
    return TTLiftWorkMode.modeActivateSpecificFloors
  }
}

func powerSaverWorkModeConvert(_ type: TTPowerSaverWorkType) -> TTPowerSaverWorkMode {
  switch type {
  case .allCards:
    return TTPowerSaverWorkMode.allCards
  case .hotelCard:
    return TTPowerSaverWorkMode.hotelCard
  case .roomCard:
    return TTPowerSaverWorkMode.roomCard
  }
}

func passageModeTypeConvert(_ type: TTPassageModeType) -> TTLockOnPremise.TTPassageModeType {
  switch type {
  case .weekly:
    return .weekly
  case .monthly:
    return .monthly
  }
}

func soundVolumeConvert(_ type: TTSoundVolumeType) -> TTSoundVolume {
  switch type {
  case .firstLevel:
    return TTSoundVolume.firstLevel
  case .secondLevel:
    return TTSoundVolume.secondLevel
  case .thirdLevel:
    return TTSoundVolume.thirdLevel
  case .fourthLevel:
    return TTSoundVolume.fourthLevel
  case .fifthLevel:
    return TTSoundVolume.fifthLevel
  case .off:
    return TTSoundVolume.off
  case .on:
    return TTSoundVolume.on
  }
}

func controlActionConvert(_ action: TTControlAction) -> TTLockOnPremise.TTControlAction {
  switch action {
  case .unlock:
    return .actionUnlock
  case .lock:
    return .actionLock
  }
}

func lockSwitchStateRevert(_ state: TTLockOnPremise.TTLockSwitchState) -> TTLockSwitchState {
  switch state {
  case .lock:
    return .lock
  case .unlock:
    return .unlock
  default:
    return .unknow
  }
}

func soundVolumeRevert(_ type: TTSoundVolume) -> TTSoundVolumeType {
  switch type {
  case .firstLevel:
    return .firstLevel
  case .secondLevel:
    return .secondLevel
  case .thirdLevel:
    return .thirdLevel
  case .fourthLevel:
    return .fourthLevel
  case .fifthLevel:
    return .fifthLevel
  case .off:
    return .off
  case .on:
    return .on
  default:
    return .off
  }
}

func keyboardPwdTypeConvert(_ type: TTPasscodeType) -> TTLockOnPremise.TTPasscodeType {
  switch type {
  case .permanent:
    return .permanent
  case .once:
    return .once
  case .period:
    return .period
  case .cycle:
    return .cycle
  }
}

func operateLogTypeConvert(_ type: TTOperateRecordType) -> TTLockOnPremise.TTOperateLogType {
  switch type {
  case .latest:
    return .latest
  case .total:
    return .all
  }
}

func lockDirectionConvert(_ direction: TTLockDirection) -> TTLockOnPremise.TTUnlockDirection {
  switch direction {
  case .left:
    return .left
  case .right:
    return .right
  }
}

func lockDirectionRevert(_ direction: TTLockOnPremise.TTUnlockDirection) -> TTLockDirection {
  switch direction {
  case .left:
    return .left
  case .right:
    return .right
  }
}

func sensitivityValueConvert(_ value: TTSensitivityValue) -> TTLockOnPremise.TTSensitivityValue {
  switch value {
  case .off:
    return .off
  case .low:
    return .low
  case .medium:
    return .medium
  case .high:
    return .high
  }
}

func remoteAccessoryConvert(_ accessory: TTRemoteAccessory) -> TTLockOnPremise.TTAccessoryType {
  switch accessory {
  case .remoteKey:
    return .wirelessKeyFob
  case .remoteKeypad:
    return .wirelessKeypad
  case .doorSensor:
    return .doorSensor
  }
}

func featureValueConvert(_ function: TTLockFunction) -> TTLockFeatureValue? {
  switch function {
  case .passcode:
    return TTLockFeatureValue.passcode
  case .icCard:
    return TTLockFeatureValue.icCard
  case .fingerprint:
    return TTLockFeatureValue.fingerprint
  case .wristband:
    return TTLockFeatureValue.wristband
  case .autoLock:
    return TTLockFeatureValue.autoLock
  case .deletePasscode:
    return TTLockFeatureValue.deletePasscode
  case .managePasscode:
    return TTLockFeatureValue.managePasscode
  case .locking:
    return TTLockFeatureValue.locking
  case .passcodeVisible:
    return TTLockFeatureValue.passcodeVisible
  case .gatewayUnlock:
    return TTLockFeatureValue.gatewayUnlock
  case .lockFreeze:
    return TTLockFeatureValue.lockFreeze
  case .cyclePassword:
    return TTLockFeatureValue.cyclePassword
  case .unlockSwitch:
    return TTLockFeatureValue.remoteUnlockSwicth
  case .audioSwitch:
    return TTLockFeatureValue.audioSwitch
  case .nbIoT:
    return TTLockFeatureValue.nbIoT
  case .getAdminPasscode:
    return TTLockFeatureValue.getAdminPasscode
  case .hotelCard:
    return TTLockFeatureValue.hotelCard
  case .noClock:
    return TTLockFeatureValue.noClock
  case .noBroadcastInNormal:
    return TTLockFeatureValue.noBroadcastInNormal
  case .passageMode:
    return TTLockFeatureValue.passageMode
  case .turnOffAutoLock:
    return TTLockFeatureValue.turnOffAutoLock
  case .wirelessKeypad:
    return TTLockFeatureValue.wirelessKeypad
  case .light:
    return TTLockFeatureValue.light
  case .hotelCardBlacklist:
    return TTLockFeatureValue.hotelCardBlacklist
  case .identityCard:
    return TTLockFeatureValue.identityCard
  case .tamperAlert:
    return TTLockFeatureValue.tamperAlert
  case .resetButton:
    return TTLockFeatureValue.resetButton
  case .privacyLock:
    return TTLockFeatureValue.privacyLock
  case .deadLock:
    return TTLockFeatureValue.deadLock
  case .cyclicCardOrFingerprint:
    return TTLockFeatureValue.cyclicCardOrFingerprint
  case .fingerVein:
    return TTLockFeatureValue.fingerVein
  case .ble5G:
    return TTLockFeatureValue.ble5G
  case .nbAwake:
    return TTLockFeatureValue.nbAwake
  case .recoverCyclePasscode:
    return TTLockFeatureValue.recoverCyclePasscode
  case .remoteKey:
    return TTLockFeatureValue.wirelessKeyFob
  case .getAccessoryElectricQuantity:
    return TTLockFeatureValue.getAccessoryElectricQuantity
  case .soundVolumeAndLanguageSetting:
    return TTLockFeatureValue.soundVolume
  case .qrCode:
    return TTLockFeatureValue.qrCode
  case .doorSensorState:
    return TTLockFeatureValue.sensorState
  case .passageModeAutoUnlockSetting:
    return TTLockFeatureValue.passageModeAutoUnlock
  case .doorSensor:
    return TTLockFeatureValue.doorSensor
  case .doorSensorAlert:
    return TTLockFeatureValue.doorSensorAlert
  case .sensitivity:
    return TTLockFeatureValue.sensitivity
  case .face:
    return TTLockFeatureValue.face
  case .cpuCard:
    return TTLockFeatureValue.cpuCard
  case .wifiLock:
    return TTLockFeatureValue.wifiLock
  case .wifiLockStaticIP:
    return TTLockFeatureValue.wifiLockStaticIP
  case .passcodeKeyNumber:
    return TTLockFeatureValue.passcodeKeyNumber
  case .standAloneActivation:
    return TTLockFeatureValue.standAloneActivation
  case .doubleAuth:
    return TTLockFeatureValue.doubleAuth
  case .authorizedUnlock:
    return TTLockFeatureValue.authorizedUnlock
  case .gatewayAuthorizedUnlock:
    return TTLockFeatureValue.gatewayAuthorizedUnlock
  case .noEkeyUnlock:
    return TTLockFeatureValue.noEkeyUnlock
  case .zhiAnPhotoFace:
    return TTLockFeatureValue.zhiAnPhotoFace
  case .palmVein:
    return TTLockFeatureValue.palmVein
  case .wifiArea:
    return TTLockFeatureValue.wifiArea
  case .xiaoCaoCamera:
    return TTLockFeatureValue.xiaoCaoCamera
  case .resetLockByCode:
    return TTLockFeatureValue.resetLockByCode
  case .thirdPartyBluetoothDevice:
    return nil
  case .autoSetAngle:
    return TTLockFeatureValue.autoSetAngle
  case .manualSetAngle:
    return TTLockFeatureValue.manualSetAngle
  case .controlLatchBolt:
    return TTLockFeatureValue.controlLatchBolt
  case .autoSetUnlockDirection:
    return TTLockFeatureValue.autoSetUnlockDirection
  case .icCardSecuritySetting:
    return nil
  case .wifiPowerSavingTime:
    return TTLockFeatureValue.wifiPowerSavingTime
  case .multiFunctionKeypad:
    return TTLockFeatureValue.multifunctionalKeypad
  case .doNotSupportTurnOffLatchBolt:
    return nil
  case .publicMode:
    return TTLockFeatureValue.publicMode
  case .lowBatteryAutoUnlock:
    return TTLockFeatureValue.lowBatteryAutoUnlock
  case .motorDriveTime:
    return TTLockFeatureValue.motorDriveTime
  case .modifyFeatureValue:
    return TTLockFeatureValue.modifyFeatureValue
  case .modifyLockNamePrefix:
    return TTLockFeatureValue.modifyLockNamePrefix
  case .authCode:
    return TTLockFeatureValue.authCode
  case .unauthorizedAttemptAlarm:
    return nil
  case .powerSaverSupportWifi:
    return TTLockFeatureValue.powerSaverSupportWifi
  case .bluetoothAdvertisingSetting:
    return nil
  case .workingMode:
    return TTLockFeatureValue.workingMode
  case .supplierCode:
    return nil
  case .catOne:
    return nil
  case .forcedOpeningDoorAlarm:
    return nil
  case .zhiAnFaceFeatureSecondGeneration:
    return nil
  case .supportDeadLocking:
    return nil
  case .workingTime:
    return TTLockFeatureValue.workingTime
  case .customQRCode:
    return TTLockFeatureValue.customQRCode
  case .securityM1Card:
    return TTLockFeatureValue.securityM1Card
  case .yiShengPhotoFace:
    return TTLockFeatureValue.yiShengPhotoFace
  }
}

func lockErrorConvert(_ error: TTLockOnPremise.TTError) -> TTLockError {
  switch error {
  case .hadReseted:
    return .reseted
  case .crcError:
    return .crcError
  case .noPermisstion:
    return .noPermisstion
  case .wrongAdminCode:
    return .wrongAdminCode
  case .lackOfStorageSpace:
    return .noStorageSpace
  case .inSettingMode:
    return .inSettingMode
  case .noAdmin:
    return .noAdmin
  case .notInSettingMode:
    return .notInSettingMode
  case .wrongDynamicCode:
    return .wrongDynamicCode
  case .isNoPower:
    return .noPower
  case .resetPasscode:
    return .resetPasscode
  case .updatePasscodeIndex:
    return .unpdatePasscodeIndex
  case .invalidLockFlagPos:
    return .invalidLockFlagPos
  case .ekeyExpired:
    return .ekeyExpired
  case .passcodeLengthInvalid:
    return .passcodeLengthInvalid
  case .samePasscodes:
    return .samePasscodes
  case .ekeyInactive:
    return .ekeyInactive
  case .aesKey:
    return .aesKey
  case .fail:
    return .fail
  case .passcodeExist:
    return .passcodeExist
  case .passcodeNotExist:
    return .passcodeNotExist
  case .lackOfStorageSpaceWhenAddingPasscodes:
    return .lackOfStorageSpaceWhenAddingPasscodes
  case .invalidParaLength:
    return .invalidParaLength
  case .cardNotExist:
    return .cardNotExist
  case .fingerprintDuplication:
    return .fingerprintDuplication
  case .invalidParam:
    return .invalidParameter
  case .fingerprintNotExist:
    return .fingerprintNotExist
  case .invalidCommand:
    return .invalidCommand
  case .inFreezeMode:
    return .inFreezeMode
  case .invalidClientPara:
    return .invalidClientPara
  case .lockIsLocked:
    return .lockIsLocked
  case .recordNotExist:
    return .recordNotExist
  case .wrongSSID:
    return .wrongWifi
  case .wrongWifiPassword:
    return .wrongWifiPassword
  case .bluetoothPoweredOff:
    return .bluetoothOff
  case .connectionTimeout:
    return .bluetoothConnectTimeount
  case .disconnection:
    return .bluetoothDisconnection
  case .lockIsBusy:
    return .lockIsBusy
  case .wrongLockData:
    return .invalidLockData
  case .invalidParameter:
    return .invalidParameter
  @unknown default:
    return .fail
  }
}

// typedef NS_ENUM(NSInteger, TTGatewayStatus){
//     TTGatewaySuccess = 0,
//     TTGatewayFail = 1,
//     TTGatewayWrongSSID = 3,
//     TTGatewayWrongWifiPassword = 4,
//     TTGatewayInvalidCommand = 6,
//     TTGatewayTimeout = 7,
//     TTGatewayNoSIM = 8,
//     TTGatewayNoPlugCable = 9,
//     TTGatewayWrongCRC = -1,
//     TTGatewayWrongAeskey = -2,
//     TTGatewayNotConnect = -3,
//     TTGatewayDisconnect = -4,
//     TTGatewayFailConfigRouter = -5,
//     TTGatewayFailConfigServer = -6,
//     TTGatewayFailConfigAccount = -7,
//     TTGatewayFailConfigIP = -8,
//     TTGatewayFailInvaildIP = -9,
// };

// enum TTGatewayError: Int {
//   case success = 0
//   case failed = 1
//   case badWifiName = 2
//   case badWifiPassword = 3
//   case invalidCommand = 4
//   case timeOut = 5
//   case noSimCard = 6
//   case noCable = 7
//   case failedConfigureRouter = 8
//   case failedConfigureServer = 9
//   case failedConfigureAccount = 10
//   case communicationDisconnected = 11
//   case unConnected = 12
//   case connectTimeout = 13
//   case dataFormatError = 14
// }

func gatewayConnectStatusConvert(_ error: TTLockOnPremise.TTGatewayConnectStatus) -> TTGatewayConnectStatus {
    switch error {
    case .success:
        return .success
    case .timeout:
        return .timeout
    case .fail:
        return .failed
    @unknown default:
        return .failed
    }
}

func gatewayErrorConvert(_ error: TTLockOnPremise.TTGatewayStatus) -> TTGatewayError {
  switch error {
  case .success:
    return .success
  case .fail:
    return .failed
  case .wrongSSID:
    return .badWifiName
  case .wrongWifiPassword:
    return .badWifiPassword
  case .invalidCommand:
    return .invalidCommand
  case .timeout:
    return .timeOut
  case .noSIM:
    return .noSimCard
  case .noPlugCable:
    return .noCable
  case .wrongCRC:
    return .wrongCRC
  case .wrongAeskey:
    return .wrongAesKey
  case .notConnect:
    return .unConnected
  case .disconnect:
    return .communicationDisconnected
  case .failConfigRouter:
    return .failedConfigureRouter
  case .failConfigServer:
    return .failedConfigureServer
  case .failConfigAccount:
    return .failedConfigAccount
  case .failConfigIP:
    return .failedConfigIp
  case .failInvaildIP:
    return .invalidIp
  @unknown default:
    return .failed
  }
}
func faceErrorConvert(_ error: TTLockOnPremise.TTFaceErrorCode) -> TTFaceErrorCode {
  switch error {
  case .noError:
      return .normal
  case .noFaceDetected:
      return .noFaceDetected
  case .tooCloseToTheTop:
      return .tooCloseToTheTop
  case .tooCloseToTheBottom:
      return .tooCloseToTheBottom
  case .tooCloseToTheLeft:
      return .tooCloseToTheLeft
  case .tooCloseToTheRight:
      return .tooCloseToTheRight
  case .tooFarAway:
      return .tooFarAway
  case .tooClose:
      return .tooClose
  case .eyebrowsCovered:
      return .eyebrowsCovered
  case .eyesCovered:
      return .eyesCovered
  case .faceCovered:
      return .faceCovered
  case .wrongFaceDirection:
      return .faceDirection
  case .eyeOpeningDetected:
      return .eyeOpeningDetected
  case .eyesClosedStatus:
      return .eyesClosedStatus
  case .failedToDetectEye:
      return .failedToDetectEye
  case .needTurnHeadToLeft:
      return .needTurnHeadToLeft
  case .needTurnHeadToRight:
      return .needTurnHeadToRight
  case .needRaiseHead:
      return .needRaiseHead
  case .needLowerHead:
      return .needLowerHead
  case .needTiltHeadToLeft:
      return .needTiltHeadToLeft
  case .needTiltHeadToRight:
      return .needTiltHeadToRight
  @unknown default:
      return .normal
  }
}

func remoteErrorConvert(_ error: TTLockOnPremise.TTKeyFobStatus) -> TTRemoteAccessoryError {
  switch error {
  case TTKeyFobSuccess:
    return .success
  case TTKeyFobFail:
    return .connectFailed
  case TTKeyFobConnectTimeout:
    return .connectFailed
  case TTKeyFobWrongCRC:
    return .wrongCRC
  default:
    return .failed
  }
}

func keypadErrorConvert(_ error: TTLockOnPremise.TTKeypadStatus) -> TTRemoteAccessoryError {
  switch error {
  case TTKeypadSuccess:
    return .success
  case TTKeypadFail:
    return .failed
  case TTKeypadWrongCRC:
    return .wrongCRC
  case TTKeypadConnectTimeout:
    return .connectFailed
  case TTKeypadWrongFactorydDate:
    return .dataFormatError
  default:
    return .failed
  }
}

func doorSensorErrorConvert(_ error: TTLockOnPremise.TTDoorSensorError) -> TTRemoteAccessoryError {
  switch error {
  case .bluetoothPowerOff:
    return .requestFailed
  case .connectTimeout:
    return .connectFailed
  case .fail:
    return .failed
  case .wrongCRC:
    return .wrongCRC
  @unknown default:
    return .failed
  }
}

func waterMeterErrorConvert(_ error: TTLockOnPremise.TTWaterMeterError) -> TTRemoteAccessoryError {
  switch error {
  case .bluetoothPowerOff:
    return .requestFailed
  case .connectTimeout:
    return .connectFailed
  case .disconnect:
    return .connectFailed
  case .netError:
    return .noResponse
  case .requestServerError:
    return .requestFailed
  case .existedInServer:
    return .requestFailed
  @unknown default:
    return .failed
  }
}

func electricMeterErrorConvert(_ error: TTLockOnPremise.TTElectricMeterError) -> TTRemoteAccessoryError
{
  switch error {
  case .bluetoothPowerOff:
    return .requestFailed
  case .connectTimeout:
    return .connectFailed
  case .disconnect:
    return .connectFailed
  case .netError:
    return .noResponse
  case .requestServerError:
    return .requestFailed
  case .existedInServer:
    return .requestFailed
  @unknown default:
    return .failed
  }
}

func multifunctionalKeypadErrorConvert(_ error: TTLockOnPremise.TTKeypadStatus)
  -> TTMultifunctionalKeypadError
{
  switch error {
  case TTKeypadSuccess:
    return .success
  case TTKeypadFail:
    return .failed
  case TTKeypadWrongCRC:
    return .wrongCRC
  case TTKeypadConnectTimeout:
    return .keypadConnectFailed
  case TTKeypadWrongFactorydDate:
    return .dataFormatError
  case TTKeypadDuplicateFingerprint:
    return .duplicateFingerprint
  case TTKeypadLackOfStorageSpace:
    return .noStorageSpace
  default:
    return .failed
  }
}
