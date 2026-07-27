import {
  TTAccessoryType as SdkTTAccessoryType,
  TTControlAction as SdkTTControlAction,
  TTLanguage as SdkTTLanguage,
  TTLockConfigType as SdkTTLockConfigType,
  TTLockSwitchState as SdkTTLockSwitchState,
  TTOperateLogType as SdkTTOperateLogType,
  TTPasscodeType as SdkTTPasscodeType,
  TTSensitivityValue as SdkTTSensitivityValue,
  TTSoundVolume as SdkTTSoundVolume,
  TTLockFeatureValue as SdkTTLockFeatureValue,
  TTFaceErrorCode as SdkTTFaceErrorCode,
  TTAddState as SdkTTAddState,
  TTLiftWorkMode as SdkTTLiftWorkMode,
  TTPowerSaverWorkMode as SdkTTPowerSaverWorkMode,
  TTElectricMeterFeature as SdkTTElectricMeterFeature,
  TTWaterMeterFeature as SdkTTWaterMeterFeature,
  TTWiFiDoorMagneticFeatureValue as SdkTTWiFiDoorMagneticFeatureValue,
  TTGatewayStatus as SdkTTGatewayStatus,
  TTError as SdkTTError,
  TTKeypadStatus as SdkTTKeypadStatus,
  TTGatewayStatus,
} from '@sciener/ttlock';
import {
  TTMeterError,
  TTPassageModeType as SdkTTPassageModeType,
  TTUnlockDirection,
  TTGatewayType as SdkTTGatewayType,
  TTPalmVeinErrorCode as SdkTTPalmVeinErrorCode,
  BLEState
} from '@sciener/ttlock/src/main/ets/TTLock/d/j/j';
import { TTWifiDoorMagneticStatus, } from '@sciener/ttlock/src/main/ets/TTLock/d/j/l';
import {
  TTBluetoothState,
  TTControlAction,
  TTAddFacePhase,
  TTFaceErrorCode,
  TTGatewayConnectStatus,
  TTGatewayError,
  TTGatewayType,
  TTLockConfig,
  TTLockDirection,
  TTLockError,
  TTLockFunction,
  TTLockSwitchState,
  TTMultifunctionalKeypadError,
  TTOperateRecordType,
  TTPassageModeType,
  TTPasscodeType,
  TTLiftWorkActivateType,
  TTPowerSaverWorkType,
  TTRemoteAccessory,
  TTRemoteAccessoryError,
  TTSensitivityValue,
  TTSoundVolumeType,
  TTPalmVeinErrorCode,
  TTElectricMeterFeature,
  TTWaterMeterFeature,
  TTMeterPayMode,
  TTStandaloneDoorSensorError,
  TTStandaloneDoorSensorFeature,
} from './Messages';

/**
 * Pigeon TTLockConfig → SDK TTLockConfigType。
 * SDK 中没有 publicMode/lowBatteryAutoUnlock，使用就近字段做兜底。
 */
export function lockConfigConvert(config: TTLockConfig): SdkTTLockConfigType | null {
  switch (config) {
    case TTLockConfig.AUDIO:
      return SdkTTLockConfigType.sound;
    case TTLockConfig.PASSCODE_VISIBLE:
      return SdkTTLockConfigType.passcodeVisible;
    case TTLockConfig.FREEZE:
      return SdkTTLockConfigType.freeze;
    case TTLockConfig.TAMPER_ALERT:
      return SdkTTLockConfigType.tamperAlert;
    case TTLockConfig.RESET_BUTTON:
      return SdkTTLockConfigType.resetButton;
    case TTLockConfig.PRIVACY_LOCK:
      return SdkTTLockConfigType.privacyLock;
    case TTLockConfig.PASSAGE_MODE_AUTO_UNLOCK:
      return SdkTTLockConfigType.passageModeAutoUnlock;
    case TTLockConfig.WIFI_LOCK_POWER_SAVING_MODE:
      return SdkTTLockConfigType.wifiPowerSavingMode;
    case TTLockConfig.DOUBLE_AUTH:
    case TTLockConfig.PUBLIC_MODE:
    case TTLockConfig.LOW_BATTERY_AUTO_UNLOCK:
    case TTLockConfig.SECURITY_M1CARD:
    case TTLockConfig.SEMI_AUTOMATIC_MODE_CONTROL:
    case TTLockConfig.LOCK_SUPERVISION:
      return null;
  }
}

export function passageModeTypeConvert(type: TTPassageModeType): SdkTTPassageModeType {
  switch (type) {
    case TTPassageModeType.WEEKLY:
      return SdkTTPassageModeType.week;
    case TTPassageModeType.MONTHLY:
      return SdkTTPassageModeType.month;
  }
}

export function passageModeTypeRevert(type: SdkTTPassageModeType): TTPassageModeType {
  switch (type) {
    case SdkTTPassageModeType.week:
      return TTPassageModeType.WEEKLY;
    case SdkTTPassageModeType.month:
      return TTPassageModeType.MONTHLY;
  }
}

export function liftWorkActivateTypeConvert(type: TTLiftWorkActivateType): SdkTTLiftWorkMode {
  switch (type) {
    case TTLiftWorkActivateType.ALL_FLOORS:
      return SdkTTLiftWorkMode.allFloors;
    case TTLiftWorkActivateType.SPECIFIC_FLOORS:
      return SdkTTLiftWorkMode.specificFloors;
  }
}

export function powerSaverWorkModeConvert(type: TTPowerSaverWorkType): SdkTTPowerSaverWorkMode {
  switch (type) {
    case TTPowerSaverWorkType.ALL_CARDS:
      return SdkTTPowerSaverWorkMode.allCards;
    case TTPowerSaverWorkType.HOTEL_CARD:
      return SdkTTPowerSaverWorkMode.hotelCard;
    case TTPowerSaverWorkType.ROOM_CARD:
      return SdkTTPowerSaverWorkMode.roomCard;
  }
}

export function soundVolumeConvert(type: TTSoundVolumeType): SdkTTSoundVolume {
  switch (type) {
    case TTSoundVolumeType.FIRST_LEVEL:
      return SdkTTSoundVolume.firstLevel;
    case TTSoundVolumeType.SECOND_LEVEL:
      return SdkTTSoundVolume.secondLevel;
    case TTSoundVolumeType.THIRD_LEVEL:
      return SdkTTSoundVolume.thirdLevel;
    case TTSoundVolumeType.FOURTH_LEVEL:
      return SdkTTSoundVolume.fourthLevel;
    case TTSoundVolumeType.FIFTH_LEVEL:
      return SdkTTSoundVolume.fifthLevel;
    case TTSoundVolumeType.OFF:
      return SdkTTSoundVolume.none;
    case TTSoundVolumeType.ON:
      return SdkTTSoundVolume.fifthLevel;
  }
}

export function soundVolumeRevert(value: SdkTTSoundVolume): TTSoundVolumeType {
  switch (value) {
    case SdkTTSoundVolume.none:
      return TTSoundVolumeType.OFF;
    case SdkTTSoundVolume.firstLevel:
      return TTSoundVolumeType.FIRST_LEVEL;
    case SdkTTSoundVolume.secondLevel:
      return TTSoundVolumeType.SECOND_LEVEL;
    case SdkTTSoundVolume.thirdLevel:
      return TTSoundVolumeType.THIRD_LEVEL;
    case SdkTTSoundVolume.fourthLevel:
      return TTSoundVolumeType.FOURTH_LEVEL;
    case SdkTTSoundVolume.fifthLevel:
      return TTSoundVolumeType.FIFTH_LEVEL;
  }
}

export function controlActionConvert(action: TTControlAction): SdkTTControlAction {
  switch (action) {
    case TTControlAction.UNLOCK:
      return SdkTTControlAction.unlock;
    case TTControlAction.LOCK:
      return SdkTTControlAction.lock;
  }
}

export function lockSwitchStateRevert(state: SdkTTLockSwitchState): TTLockSwitchState | null {
  switch (state) {
    case SdkTTLockSwitchState.lock:
      return TTLockSwitchState.LOCK;
    case SdkTTLockSwitchState.unlock:
      return TTLockSwitchState.UNLOCK;
    case SdkTTLockSwitchState.unknown:
      return TTLockSwitchState.UNKNOW;
    case SdkTTLockSwitchState.unlockHasCar:
      return null;
  }
}

export function passcodeTypeConvert(type: TTPasscodeType): SdkTTPasscodeType {
  switch (type) {
    case TTPasscodeType.ONCE:
      return SdkTTPasscodeType.once;
    case TTPasscodeType.PERMANENT:
      return SdkTTPasscodeType.permanent;
    case TTPasscodeType.PERIOD:
      return SdkTTPasscodeType.period;
    case TTPasscodeType.CYCLE:
      return SdkTTPasscodeType.cycle;
  }
}

export function operateLogTypeConvert(type: TTOperateRecordType): SdkTTOperateLogType {
  switch (type) {
    case TTOperateRecordType.LATEST:
      return SdkTTOperateLogType.latest;
    case TTOperateRecordType.TOTAL:
      return SdkTTOperateLogType.all;
  }
}

export function lockDirectionConvert(direction: TTLockDirection): TTUnlockDirection {
  switch (direction) {
    case TTLockDirection.LEFT:
      return TTUnlockDirection.left;
    case TTLockDirection.RIGHT:
      return TTUnlockDirection.right;
  }
}

export function lockDirectionRevert(direction: TTUnlockDirection): TTLockDirection {
  switch (direction) {
    case TTUnlockDirection.left:
      return TTLockDirection.LEFT;
    case TTUnlockDirection.right:
      return TTLockDirection.RIGHT;
  }
}

export function sensitivityValueConvert(value: TTSensitivityValue): SdkTTSensitivityValue {
  switch (value) {
    case TTSensitivityValue.OFF:
      return SdkTTSensitivityValue.off;
    case TTSensitivityValue.LOW:
      return SdkTTSensitivityValue.low;
    case TTSensitivityValue.MEDIUM:
      return SdkTTSensitivityValue.medium;
    case TTSensitivityValue.HIGH:
      return SdkTTSensitivityValue.high;
  }
}

export function sensitivityValueRevert(value: SdkTTSensitivityValue): TTSensitivityValue {
  switch (value) {
    case SdkTTSensitivityValue.off:
      return TTSensitivityValue.OFF;
    case SdkTTSensitivityValue.low:
      return TTSensitivityValue.LOW;
    case SdkTTSensitivityValue.medium:
      return TTSensitivityValue.MEDIUM;
    case SdkTTSensitivityValue.high:
      return TTSensitivityValue.HIGH;
  }
}

export function remoteAccessoryConvert(accessory: TTRemoteAccessory): SdkTTAccessoryType | null {
  switch (accessory) {
    case TTRemoteAccessory.REMOTE_KEY:
      return SdkTTAccessoryType.wirelessKeyFob;
    case TTRemoteAccessory.REMOTE_KEYPAD:
      return SdkTTAccessoryType.wirelessKeypad;
    case TTRemoteAccessory.DOOR_SENSOR:
      return SdkTTAccessoryType.doorMagnetic;
  }
}

/**
 * Pigeon TTLockFunction → SDK TTLockFeatureValue。
 * 无对应能力的条目返回 null（调用方需短路）。
 */
export function featureValueConvert(lockFunction: TTLockFunction): SdkTTLockFeatureValue | null {
  switch (lockFunction) {
    case TTLockFunction.PASSCODE:
      return SdkTTLockFeatureValue.passcode;
    case TTLockFunction.IC_CARD:
      return SdkTTLockFeatureValue.icCard;
    case TTLockFunction.FINGERPRINT:
      return SdkTTLockFeatureValue.fingerprint;
    case TTLockFunction.WRISTBAND:
      return SdkTTLockFeatureValue.wristband;
    case TTLockFunction.AUTO_LOCK:
      return SdkTTLockFeatureValue.autoLock;
    case TTLockFunction.DELETE_PASSCODE:
      return SdkTTLockFeatureValue.deletePasscode;
    case TTLockFunction.MANAGE_PASSCODE:
      return SdkTTLockFeatureValue.managePasscode;
    case TTLockFunction.LOCKING:
      return SdkTTLockFeatureValue.locking;
    case TTLockFunction.PASSCODE_VISIBLE:
      return SdkTTLockFeatureValue.passcodeVisible;
    case TTLockFunction.GATEWAY_UNLOCK:
      return SdkTTLockFeatureValue.gatewayUnlock;
    case TTLockFunction.LOCK_FREEZE:
      return SdkTTLockFeatureValue.lockFreeze;
    case TTLockFunction.CYCLE_PASSWORD:
      return SdkTTLockFeatureValue.cyclePassword;
    case TTLockFunction.UNLOCK_SWITCH:
      return SdkTTLockFeatureValue.remoteUnlockSwitch;
    case TTLockFunction.AUDIO_SWITCH:
      return SdkTTLockFeatureValue.audioSwitch;
    case TTLockFunction.NB_IO_T:
      return SdkTTLockFeatureValue.NBIoT;
    case TTLockFunction.GET_ADMIN_PASSCODE:
      return SdkTTLockFeatureValue.getAdminPasscode;
    case TTLockFunction.HOTEL_CARD:
      return SdkTTLockFeatureValue.hotelCard;
    case TTLockFunction.NO_CLOCK:
      return SdkTTLockFeatureValue.noClock;
    case TTLockFunction.NO_BROADCAST_IN_NORMAL:
      return SdkTTLockFeatureValue.noBroadcastInNormal;
    case TTLockFunction.PASSAGE_MODE:
      return SdkTTLockFeatureValue.passageMode;
    case TTLockFunction.TURN_OFF_AUTO_LOCK:
      return SdkTTLockFeatureValue.turnOffAutoLock;
    case TTLockFunction.WIRELESS_KEYPAD:
      return SdkTTLockFeatureValue.wirelessKeypad;
    case TTLockFunction.LIGHT:
      return SdkTTLockFeatureValue.light;
    case TTLockFunction.HOTEL_CARD_BLACKLIST:
      return SdkTTLockFeatureValue.cardBlacklist;
    case TTLockFunction.IDENTITY_CARD:
      return SdkTTLockFeatureValue.identityCard;
    case TTLockFunction.TAMPER_ALERT:
      return SdkTTLockFeatureValue.tamperAlert;
    case TTLockFunction.RESET_BUTTON:
      return SdkTTLockFeatureValue.resetButton;
    case TTLockFunction.PRIVACY_LOCK:
      return SdkTTLockFeatureValue.privacyLock;
    case TTLockFunction.DEAD_LOCK:
      return SdkTTLockFeatureValue.deadLock;
    case TTLockFunction.CYCLIC_CARD_OR_FINGERPRINT:
      return SdkTTLockFeatureValue.cyclicCardOrFingerprint;
    case TTLockFunction.FINGER_VEIN:
      return SdkTTLockFeatureValue.fingerVein;
    case TTLockFunction.BLE5G:
      return SdkTTLockFeatureValue.ble5G;
    case TTLockFunction.NB_AWAKE:
      return SdkTTLockFeatureValue.NBAwake;
    case TTLockFunction.RECOVER_CYCLE_PASSCODE:
      return SdkTTLockFeatureValue.recoverCyclePasscode;
    case TTLockFunction.REMOTE_KEY:
      return SdkTTLockFeatureValue.wirelessKeyFob;
    case TTLockFunction.GET_ACCESSORY_ELECTRIC_QUANTITY:
      return SdkTTLockFeatureValue.getAccessoryElectricQuantity;
    case TTLockFunction.SOUND_VOLUME_AND_LANGUAGE_SETTING:
      return SdkTTLockFeatureValue.soundVolume;
    case TTLockFunction.QR_CODE:
      return SdkTTLockFeatureValue.QRCode;
    case TTLockFunction.DOOR_SENSOR_STATE:
      return SdkTTLockFeatureValue.sensorState;
    case TTLockFunction.PASSAGE_MODE_AUTO_UNLOCK_SETTING:
      return SdkTTLockFeatureValue.passageModeAutoUnlock;
    case TTLockFunction.DOOR_SENSOR:
      return SdkTTLockFeatureValue.doorSensor;
    case TTLockFunction.DOOR_SENSOR_ALERT:
      return SdkTTLockFeatureValue.doorSensorAlert;
    case TTLockFunction.SENSITIVITY:
      return SdkTTLockFeatureValue.sensitivity;
    case TTLockFunction.FACE:
      return SdkTTLockFeatureValue.face;
    case TTLockFunction.CPU_CARD:
      return SdkTTLockFeatureValue.cpuCard;
    case TTLockFunction.WIFI_LOCK:
      return SdkTTLockFeatureValue.wifiLock;
    case TTLockFunction.WIFI_LOCK_STATIC_IP:
      return SdkTTLockFeatureValue.wifiLockStaticIP;
    case TTLockFunction.PASSCODE_KEY_NUMBER:
      return SdkTTLockFeatureValue.passcodeKeyNumber;
    case TTLockFunction.STAND_ALONE_ACTIVATION:
      return SdkTTLockFeatureValue.standAloneActivation;
    case TTLockFunction.DOUBLE_AUTH:
      return SdkTTLockFeatureValue.doubleAuth;
    case TTLockFunction.AUTHORIZED_UNLOCK:
      return SdkTTLockFeatureValue.authorizedUnlock;
    case TTLockFunction.GATEWAY_AUTHORIZED_UNLOCK:
      return SdkTTLockFeatureValue.gatewayAuthorizedUnlock;
    case TTLockFunction.NO_EKEY_UNLOCK:
      return SdkTTLockFeatureValue.TTLockFeatureValueNoEkeyUnlock;
    case TTLockFunction.ZHI_AN_PHOTO_FACE:
      return SdkTTLockFeatureValue.TTLockFeatureValueZhiAnPhotoFace;
    case TTLockFunction.PALM_VEIN:
      return SdkTTLockFeatureValue.palmVein;
    case TTLockFunction.WIFI_AREA:
      return SdkTTLockFeatureValue.TTLockFeatureValueWifiArea;
    case TTLockFunction.XIAO_CAO_CAMERA:
      return SdkTTLockFeatureValue.xiaoCaoCamera;
    case TTLockFunction.RESET_LOCK_BY_CODE:
      return SdkTTLockFeatureValue.TTLockFeatureValueResetLockByCode;
    case TTLockFunction.THIRD_PARTY_BLUETOOTH_DEVICE:
      return SdkTTLockFeatureValue.thirdPartyBluetoothDevice;
    case TTLockFunction.AUTO_SET_ANGLE:
      return SdkTTLockFeatureValue.autoSetAngle;
    case TTLockFunction.MANUAL_SET_ANGLE:
      return SdkTTLockFeatureValue.manualSetAngle;
    case TTLockFunction.CONTROL_LATCH_BOLT:
      return SdkTTLockFeatureValue.controlLatchBolt;
    case TTLockFunction.AUTO_SET_UNLOCK_DIRECTION:
      return SdkTTLockFeatureValue.TTLockFeatureValueAutoSetUnlockDirection;
    case TTLockFunction.IC_CARD_SECURITY_SETTING:
    case TTLockFunction.DO_NOT_SUPPORT_TURN_OFF_LATCH_BOLT:
    case TTLockFunction.PUBLIC_MODE:
    case TTLockFunction.LOW_BATTERY_AUTO_UNLOCK:
    case TTLockFunction.MOTOR_DRIVE_TIME:
    case TTLockFunction.MODIFY_FEATURE_VALUE:
    case TTLockFunction.MODIFY_LOCK_NAME_PREFIX:
    case TTLockFunction.AUTH_CODE:
    case TTLockFunction.UNAUTHORIZED_ATTEMPT_ALARM:
    case TTLockFunction.POWER_SAVER_SUPPORT_WIFI:
    case TTLockFunction.BLUETOOTH_ADVERTISING_SETTING:
    case TTLockFunction.WORKING_MODE:
    case TTLockFunction.SUPPLIER_CODE:
    case TTLockFunction.CAT_ONE:
    case TTLockFunction.FORCED_OPENING_DOOR_ALARM:
    case TTLockFunction.ZHI_AN_FACE_FEATURE_SECOND_GENERATION:
    case TTLockFunction.SUPPORT_DEAD_LOCKING:
    case TTLockFunction.WORKING_TIME:
    case TTLockFunction.CUSTOM_QRCODE:
    case TTLockFunction.SECURITY_M1CARD:
    case TTLockFunction.YI_SHENG_PHOTO_FACE:
    case TTLockFunction.PICTURE_FACE_DELIVERY:
    case TTLockFunction.SUPPORT_SET_ALIAS:
    case TTLockFunction.HIDE_WIFI_CAT_ONE_SLEEP_MODE_SETTING:
    case TTLockFunction.SEMI_AUTOMATIC_MODE_CONTROL:
    case TTLockFunction.SUPPORT_SET_USER_ATTRIBUTES:
    case TTLockFunction.SUPPORT_SUPERVISION:
    case TTLockFunction.YI_NUO_PHOTO_FACE:
    case TTLockFunction.URL_FACE:
    case TTLockFunction.HUMAN_PRESENCE_SENSOR:
      return null;
    case TTLockFunction.WIFI_POWER_SAVING_TIME:
      return SdkTTLockFeatureValue.wifiPowerSavingTime;
    case TTLockFunction.MULTI_FUNCTION_KEYPAD:
      return SdkTTLockFeatureValue.multifunctionalKeypad;
  }
}

/**
 * SDK `TTError` → Pigeon `TTLockError` 的索引值。
 *
 * 以鸿蒙 SDK `TTErrorCodeEnum.TTError` 为准；未命中时返回 null。
 */
export function lockErrorRevert(code: SdkTTError): TTLockError | null {
  switch (code) {
    case SdkTTError.hadRested:
      return TTLockError.RESETED;
    case SdkTTError.cRCError:
      return TTLockError.CRC_ERROR;
    case SdkTTError.noPermissions:
      return TTLockError.NO_PERMISSTION;
    case SdkTTError.wrongAdminCode:
      return TTLockError.WRONG_ADMIN_CODE;
    case SdkTTError.lackOfStorageSpace:
      return TTLockError.NO_STORAGE_SPACE;
    case SdkTTError.inSettingMode:
      return TTLockError.IN_SETTING_MODE;
    case SdkTTError.noAdmin:
      return TTLockError.NO_ADMIN;
    case SdkTTError.notInSettingMode:
      return TTLockError.NOT_IN_SETTING_MODE;
    case SdkTTError.wrongDynamicCode:
      return TTLockError.WRONG_DYNAMIC_CODE;
    case SdkTTError.isNoPower:
      return TTLockError.NO_POWER;
    case SdkTTError.resetPasscode:
      return TTLockError.RESET_PASSCODE;
    case SdkTTError.updatePasscodeIndex:
      return TTLockError.UNPDATE_PASSCODE_INDEX;
    case SdkTTError.invalidLockFlagPos:
      return TTLockError.INVALID_LOCK_FLAG_POS;
    case SdkTTError.eKeyExpired:
      return TTLockError.EKEY_EXPIRED;
    case SdkTTError.passcodeLengthInvalid:
      return TTLockError.PASSCODE_LENGTH_INVALID;
    case SdkTTError.samePasscodes:
      return TTLockError.SAME_PASSCODES;
    case SdkTTError.eKeyInactive:
      return TTLockError.EKEY_INACTIVE;
    case SdkTTError.aesKey:
      return TTLockError.AES_KEY;
    case SdkTTError.fail:
      return TTLockError.FAIL;
    case SdkTTError.passcodeExist:
      return TTLockError.PASSCODE_EXIST;
    case SdkTTError.passcodeNotExist:
      return TTLockError.PASSCODE_NOT_EXIST;
    case SdkTTError.lackOfStorageSpaceWhenAddingPasscodes:
      return TTLockError.LACK_OF_STORAGE_SPACE_WHEN_ADDING_PASSCODES;
    case SdkTTError.invalidParaLength:
      return TTLockError.INVALID_PARA_LENGTH;
    case SdkTTError.cardNotExist:
      return TTLockError.CARD_NOT_EXIST;
    case SdkTTError.fingerprintDuplication:
      return TTLockError.FINGERPRINT_DUPLICATION;
    case SdkTTError.fingerprintNotExist:
      return TTLockError.FINGERPRINT_NOT_EXIST;
    case SdkTTError.invalidCommand:
      return TTLockError.INVALID_COMMAND;
    case SdkTTError.inFreezeMode:
      return TTLockError.IN_FREEZE_MODE;
    case SdkTTError.invalidClientPara:
      return TTLockError.INVALID_CLIENT_PARA;
    case SdkTTError.lockIsLocked:
      return TTLockError.LOCK_IS_LOCKED;
    case SdkTTError.recordNotExist:
      return TTLockError.RECORD_NOT_EXIST;
    case SdkTTError.invalidParam:
    case SdkTTError.invalidParameter:
      return TTLockError.INVALID_PARAMETER;
    case SdkTTError.wrongSSID:
      return TTLockError.WRONG_WIFI;
    case SdkTTError.wrongWifiPassword:
      return TTLockError.WRONG_WIFI_PASSWORD;
    case SdkTTError.bluetoothPoweredOff:
    case SdkTTError.noOpenBluetooth:
      return TTLockError.BLUETOOTH_OFF;
    case SdkTTError.connectionTimeout:
    case SdkTTError.operationTimeOut:
    case SdkTTError.timeOut:
      return TTLockError.BLUETOOTH_CONNECT_TIMEOUNT;
    case SdkTTError.disconnection:
    case SdkTTError.deviceNoNear:
      return TTLockError.BLUETOOTH_DISCONNECTION;
    case SdkTTError.lockIsBusy:
      return TTLockError.LOCK_IS_BUSY;
    case SdkTTError.wrongLockData:
      return TTLockError.INVALID_LOCK_DATA;
    case SdkTTError.noBluetoothPermission:
      return TTLockError.NO_PERMISSTION;
    case SdkTTError.unknown:
    case SdkTTError.abnormal:
    case SdkTTError.networkError:
      return TTLockError.FAIL;
    case SdkTTError.macError:
      return TTLockError.INVALID_PARAMETER;
  }
  return null;
}

/**
 * SDK `TTGatewayStatus` → Pigeon `TTGatewayError` 的索引值。
 */
export function gatewayErrorRevert(code: SdkTTGatewayStatus): TTGatewayError | null {
  switch (code) {
    case SdkTTGatewayStatus.success:
      return TTGatewayError.SUCCESS;
    case SdkTTGatewayStatus.fail:
      return TTGatewayError.FAILED;
    case SdkTTGatewayStatus.wrongSSID:
      return TTGatewayError.BAD_WIFI_NAME;
    case SdkTTGatewayStatus.wrongWifiPassword:
      return TTGatewayError.BAD_WIFI_PASSWORD;
    case SdkTTGatewayStatus.invalidCommand:
      return TTGatewayError.INVALID_COMMAND;
    case SdkTTGatewayStatus.timeout:
      return TTGatewayError.TIME_OUT;
    case SdkTTGatewayStatus.noSIM:
      return TTGatewayError.NO_SIM_CARD;
    case SdkTTGatewayStatus.noPlugCable:
      return TTGatewayError.NO_CABLE;
    case SdkTTGatewayStatus.wrongCRC:
      return TTGatewayError.WRONG_CRC;
    case SdkTTGatewayStatus.wrongAesKey:
      return TTGatewayError.WRONG_AES_KEY;
    case SdkTTGatewayStatus.notConnect:
      return TTGatewayError.UN_CONNECTED;
    case SdkTTGatewayStatus.disconnect:
      return TTGatewayError.COMMUNICATION_DISCONNECTED;
    case SdkTTGatewayStatus.failConfigRouter:
      return TTGatewayError.FAILED_CONFIGURE_ROUTER;
    case SdkTTGatewayStatus.failConfigServer:
      return TTGatewayError.FAILED_CONFIGURE_SERVER;
    case SdkTTGatewayStatus.failConfigAccount:
      return TTGatewayError.FAILED_CONFIGURE_ACCOUNT;
    case SdkTTGatewayStatus.failConfigIP:
      return TTGatewayError.FAILED_CONFIG_IP;
    case SdkTTGatewayStatus.failInvalidIP:
      return TTGatewayError.INVALID_IP;
  }
  return null;
}

/**
 * SDK 网关连接失败 errCode → Pigeon `TTGatewayConnectStatus`。
 */
export function gatewayConnectStatusRevert(code: SdkTTError): TTGatewayConnectStatus {
  switch (code){
    case SdkTTError.timeOut:
      return TTGatewayConnectStatus.TIMEOUT
    default:
      return TTGatewayConnectStatus.FAILED
  }
}

/**
 * SDK `TTKeypadStatus` / `TTWifiDoorMagneticStatus` → Pigeon `TTRemoteAccessoryError` 索引值。
 *
 * 用于普通遥控钥匙、键盘、门磁等流式回调中错误码透传。
 */
export function remoteAccessoryErrorRevert(code: number): number | null {
  switch (code) {
    case SdkTTKeypadStatus.success:
      return TTRemoteAccessoryError.SUCCESS;
    case SdkTTKeypadStatus.fail:
    case TTWifiDoorMagneticStatus.fail:
      return TTRemoteAccessoryError.FAILED;
    case SdkTTKeypadStatus.wrongCRC:
    case TTWifiDoorMagneticStatus.wrongCRC:
      return TTRemoteAccessoryError.WRONG_CRC;
    case SdkTTKeypadStatus.connectTimeout:
      return TTRemoteAccessoryError.CONNECT_FAILED;
    case SdkTTKeypadStatus.wrongFactoryDate:
      return TTRemoteAccessoryError.DATA_FORMAT_ERROR;
    case TTWifiDoorMagneticStatus.wrongSSID:
    case TTWifiDoorMagneticStatus.wrongWifiPassword:
      return TTRemoteAccessoryError.REQUEST_FAILED;
    case SdkTTKeypadStatus.duplicateFingerprint:
    case SdkTTKeypadStatus.lackOfStorageSpace:
      return null;
  }
  return null;
}

export function keypadErrorRevert(code: number): number | null {
  return remoteAccessoryErrorRevert(code);
}

/**
 * SDK `TTKeypadStatus`（多功能键盘）→ Pigeon `TTMultifunctionalKeypadError` 索引值。
 */
export function multifunctionalKeypadErrorRevert(code: number): number | null {
  switch (code) {
    case SdkTTKeypadStatus.success:
      return TTMultifunctionalKeypadError.SUCCESS;
    case SdkTTKeypadStatus.fail:
      return TTMultifunctionalKeypadError.FAILED;
    case SdkTTKeypadStatus.wrongCRC:
      return TTMultifunctionalKeypadError.WRONG_CRC;
    case SdkTTKeypadStatus.connectTimeout:
      return TTMultifunctionalKeypadError.KEYPAD_CONNECT_FAILED;
    case SdkTTKeypadStatus.wrongFactoryDate:
      return TTMultifunctionalKeypadError.DATA_FORMAT_ERROR;
    case SdkTTKeypadStatus.duplicateFingerprint:
      return TTMultifunctionalKeypadError.DUPLICATE_FINGERPRINT;
    case SdkTTKeypadStatus.lackOfStorageSpace:
      return TTMultifunctionalKeypadError.NO_STORAGE_SPACE;
  }
  return null;
}

/**
 * 表具回调中复用的 `TTError` → Pigeon `TTRemoteAccessoryError` 映射。
 */
function meterLockErrorRevert(code: number): TTRemoteAccessoryError | null {
  switch (code) {
    case SdkTTError.deviceNoNear:
    case SdkTTError.connectionTimeout:
    case SdkTTError.operationTimeOut:
    case SdkTTError.timeOut:
    case SdkTTError.disconnection:
      return TTRemoteAccessoryError.CONNECT_FAILED;
    case SdkTTError.networkError:
      return TTRemoteAccessoryError.REQUEST_FAILED;
    case SdkTTError.lockIsBusy:
      return TTRemoteAccessoryError.DEVICE_IS_BUSY;
    case SdkTTError.invalidParam:
    case SdkTTError.invalidParameter:
    case SdkTTError.wrongLockData:
      return TTRemoteAccessoryError.DATA_FORMAT_ERROR;
    case SdkTTError.hadRested:
    case SdkTTError.cRCError:
    case SdkTTError.noPermissions:
    case SdkTTError.wrongAdminCode:
    case SdkTTError.lackOfStorageSpace:
    case SdkTTError.inSettingMode:
    case SdkTTError.noAdmin:
    case SdkTTError.notInSettingMode:
    case SdkTTError.wrongDynamicCode:
    case SdkTTError.isNoPower:
    case SdkTTError.resetPasscode:
    case SdkTTError.updatePasscodeIndex:
    case SdkTTError.invalidLockFlagPos:
    case SdkTTError.eKeyExpired:
    case SdkTTError.passcodeLengthInvalid:
    case SdkTTError.samePasscodes:
    case SdkTTError.eKeyInactive:
    case SdkTTError.aesKey:
    case SdkTTError.fail:
    case SdkTTError.passcodeExist:
    case SdkTTError.passcodeNotExist:
    case SdkTTError.lackOfStorageSpaceWhenAddingPasscodes:
    case SdkTTError.invalidParaLength:
    case SdkTTError.cardNotExist:
    case SdkTTError.fingerprintDuplication:
    case SdkTTError.fingerprintNotExist:
    case SdkTTError.invalidCommand:
    case SdkTTError.inFreezeMode:
    case SdkTTError.invalidClientPara:
    case SdkTTError.lockIsLocked:
    case SdkTTError.recordNotExist:
    case SdkTTError.wrongSSID:
    case SdkTTError.wrongWifiPassword:
    case SdkTTError.bluetoothPoweredOff:
    case SdkTTError.noOpenBluetooth:
    case SdkTTError.noBluetoothPermission:
    case SdkTTError.unknown:
    case SdkTTError.abnormal:
    case SdkTTError.macError:
      return null;
  }
  return null;
}

/**
 * SDK `TTMeterError` / `TTError` → Pigeon `TTRemoteAccessoryError` 索引值。
 */
export function meterErrorRevert(code: number): TTRemoteAccessoryError | null {
  switch (code) {
    case TTMeterError.noNet:
      return TTRemoteAccessoryError.REQUEST_FAILED;
    case TTMeterError.requestServerError:
      return TTRemoteAccessoryError.REQUEST_FAILED;
    case TTMeterError.existedInServer:
      return TTRemoteAccessoryError.REQUEST_FAILED;
  }
  return meterLockErrorRevert(code);
}

/** 电表错误码 → Pigeon `TTRemoteAccessoryError`（与水表共用映射）。 */
export function electricMeterErrorRevert(code: number): TTRemoteAccessoryError | null {
  return meterErrorRevert(code);
}

/** Pigeon `TTGatewayType` → SDK `TTGatewayType`（g2=2 … g6=6）。 */
export function gatewayTypeConvert(type: TTGatewayType): SdkTTGatewayType {
  switch (type) {
    case TTGatewayType.G2:
      return SdkTTGatewayType.g2;
    case TTGatewayType.G3:
      return SdkTTGatewayType.g3;
    case TTGatewayType.G4:
      return SdkTTGatewayType.g4;
    case TTGatewayType.G5:
      return SdkTTGatewayType.g5;
    case TTGatewayType.G6:
      return SdkTTGatewayType.g6;
  }
}

/** SDK 网关型号 → Pigeon `TTGatewayType`。 */
export function gatewayTypeRevert(nativeGatewayType: SdkTTGatewayType): TTGatewayType {
  switch (nativeGatewayType) {
    case SdkTTGatewayType.g2:
      return TTGatewayType.G2;
    case SdkTTGatewayType.g3:
      return TTGatewayType.G3;
    case SdkTTGatewayType.g4:
      return TTGatewayType.G4;
    case SdkTTGatewayType.g5:
      return TTGatewayType.G5;
    case SdkTTGatewayType.g6:
      return TTGatewayType.G6;
  }
}

/** SDK 掌静脉采集错误码 → Pigeon `TTPalmVeinErrorCode`。 */
export function palmVeinErrorRevert(code: SdkTTPalmVeinErrorCode): TTPalmVeinErrorCode {
  switch (code) {
    case SdkTTPalmVeinErrorCode.noError:
      return TTPalmVeinErrorCode.UNKNOWN_STATUS;
    case SdkTTPalmVeinErrorCode.noPalm:
      return TTPalmVeinErrorCode.NO_PALM_VEIN_DETECTED;
    case SdkTTPalmVeinErrorCode.rectConfidenceLow:
      return TTPalmVeinErrorCode.PALM_RECT_CONF_LOW;
    case SdkTTPalmVeinErrorCode.landmarkConfidenceLow:
      return TTPalmVeinErrorCode.PALM_LANDMARK_CONF_LOW;
    case SdkTTPalmVeinErrorCode.angleRoll:
      return TTPalmVeinErrorCode.PALM_ANGLE_ROLL_ERROR;
    case SdkTTPalmVeinErrorCode.angleLean:
      return TTPalmVeinErrorCode.PALM_ANGLE_LEAN_ERROR;
    case SdkTTPalmVeinErrorCode.palmBlock:
      return TTPalmVeinErrorCode.PALM_BLOCK;
    case SdkTTPalmVeinErrorCode.palmBlur:
      return TTPalmVeinErrorCode.PALM_BLUR;
    case SdkTTPalmVeinErrorCode.palmBack:
      return TTPalmVeinErrorCode.PALM_BACK;
  }
}

/** Pigeon 水表特征值 → SDK 位掩码索引。 */
export function waterMeterFeatureConvert(feature: TTWaterMeterFeature): SdkTTWaterMeterFeature {
  switch (feature) {
    case TTWaterMeterFeature.CAT_ONE:
      return SdkTTWaterMeterFeature.catOne;
  }
}

/** Pigeon 电表特征值 → SDK 位掩码索引。 */
export function electricMeterFeatureConvert(feature: TTElectricMeterFeature): SdkTTElectricMeterFeature {
  switch (feature) {
    case TTElectricMeterFeature.CAT_ONE:
      return SdkTTElectricMeterFeature.catOne;
    case TTElectricMeterFeature.TELINK:
      return SdkTTElectricMeterFeature.nordic;
  }
}

/** Pigeon 表具付费模式 → SDK payMode 数值（0 后付费 / 1 预付费）。 */
export function payModeConvert(mode: TTMeterPayMode): number {
  switch (mode) {
    case TTMeterPayMode.POSTPAID:
      return 0;
    case TTMeterPayMode.PREPAID:
      return 1;
  }
}

/**
 * SDK WiFi 门磁错误码 / `TTError` → Pigeon `TTStandaloneDoorSensorError`。
 */
export function standaloneDoorSensorErrorRevert(code: number): TTStandaloneDoorSensorError | null {
  switch (code) {
    case TTWifiDoorMagneticStatus.fail:
      return TTStandaloneDoorSensorError.FAILED;
    case TTWifiDoorMagneticStatus.wrongCRC:
      return TTStandaloneDoorSensorError.WRONG_CRC;
    case TTWifiDoorMagneticStatus.wrongSSID:
      return TTStandaloneDoorSensorError.WRONG_SSID;
    case TTWifiDoorMagneticStatus.wrongWifiPassword:
      return TTStandaloneDoorSensorError.WRONG_WIFI_PASSWORD;
    case SdkTTError.bluetoothPoweredOff:
    case SdkTTError.noOpenBluetooth:
      return TTStandaloneDoorSensorError.BLUETOOTH_POWER_OFF;
    case SdkTTError.connectionTimeout:
    case SdkTTError.operationTimeOut:
    case SdkTTError.timeOut:
      return TTStandaloneDoorSensorError.CONNECT_TIMEOUT;
    case SdkTTError.disconnection:
    case SdkTTError.deviceNoNear:
      return TTStandaloneDoorSensorError.DISCONNECT;
    case SdkTTError.lockIsBusy:
      return TTStandaloneDoorSensorError.DEVICE_IS_BUSY;
    case SdkTTError.invalidParam:
    case SdkTTError.invalidParameter:
      return TTStandaloneDoorSensorError.DATA_FORMAT_ERROR;
    case SdkTTError.macError:
      return TTStandaloneDoorSensorError.BAD_MAC_ADDRESS;
  }
  return null;
}

/** Pigeon 独立门磁特征值 → SDK `TTWiFiDoorMagneticFeatureValue`。 */
export function standaloneDoorSensorFeatureConvert(
  feature: TTStandaloneDoorSensorFeature,
): SdkTTWiFiDoorMagneticFeatureValue | null {
  switch (feature) {
    case TTStandaloneDoorSensorFeature.WIFI24G:
      return SdkTTWiFiDoorMagneticFeatureValue.wifi24G;
    case TTStandaloneDoorSensorFeature.WIFI5G:
      return SdkTTWiFiDoorMagneticFeatureValue.wifi5G;
    case TTStandaloneDoorSensorFeature.AUTH_CODE:
      return SdkTTWiFiDoorMagneticFeatureValue.authCode;
    case TTStandaloneDoorSensorFeature.ALARM:
      return null;
  }
}

/**
 * SDK 人脸添加错误码 → Pigeon `TTFaceErrorCode`。
 */
export function faceErrorRevert(code: SdkTTFaceErrorCode): TTFaceErrorCode {
  switch (code) {
    case SdkTTFaceErrorCode.noError:
      return TTFaceErrorCode.NORMAL;
    case SdkTTFaceErrorCode.faceDetected:
      return TTFaceErrorCode.NO_FACE_DETECTED;
    case SdkTTFaceErrorCode.tooCloseToTheTop:
      return TTFaceErrorCode.TOO_CLOSE_TO_THE_TOP;
    case SdkTTFaceErrorCode.tooCloseToTheBottom:
      return TTFaceErrorCode.TOO_CLOSE_TO_THE_BOTTOM;
    case SdkTTFaceErrorCode.tooCloseToTheLeft:
      return TTFaceErrorCode.TOO_CLOSE_TO_THE_LEFT;
    case SdkTTFaceErrorCode.tooCloseToTheRight:
      return TTFaceErrorCode.TOO_CLOSE_TO_THE_RIGHT;
    case SdkTTFaceErrorCode.tooFarAway:
      return TTFaceErrorCode.TOO_FAR_AWAY;
    case SdkTTFaceErrorCode.tooClose:
      return TTFaceErrorCode.TOO_CLOSE;
    case SdkTTFaceErrorCode.eyebrowsCovered:
      return TTFaceErrorCode.EYEBROWS_COVERED;
    case SdkTTFaceErrorCode.eyesCovered:
      return TTFaceErrorCode.EYES_COVERED;
    case SdkTTFaceErrorCode.faceCovered:
      return TTFaceErrorCode.FACE_COVERED;
    case SdkTTFaceErrorCode.wrongFaceDirection:
      return TTFaceErrorCode.FACE_DIRECTION;
    case SdkTTFaceErrorCode.eyeOpeningDetected:
      return TTFaceErrorCode.EYE_OPENING_DETECTED;
    case SdkTTFaceErrorCode.eyesClosedStatus:
      return TTFaceErrorCode.EYES_CLOSED_STATUS;
    case SdkTTFaceErrorCode.failedToDetectEye:
      return TTFaceErrorCode.FAILED_TO_DETECT_EYE;
    case SdkTTFaceErrorCode.needTurnHeadToLeft:
      return TTFaceErrorCode.NEED_TURN_HEAD_TO_LEFT;
    case SdkTTFaceErrorCode.needTurnHeadToRight:
      return TTFaceErrorCode.NEED_TURN_HEAD_TO_RIGHT;
    case SdkTTFaceErrorCode.needRaiseHead:
      return TTFaceErrorCode.NEED_RAISE_HEAD;
    case SdkTTFaceErrorCode.needLowerHead:
      return TTFaceErrorCode.NEED_LOWER_HEAD;
    case SdkTTFaceErrorCode.needTiltHeadToLeft:
      return TTFaceErrorCode.NEED_TILT_HEAD_TO_LEFT;
    case SdkTTFaceErrorCode.needTiltHeadToRight:
      return TTFaceErrorCode.NEED_TILT_HEAD_TO_RIGHT;
  }
}

export function facePhaseRevert(state: SdkTTAddState): TTAddFacePhase {
  switch (state) {
    case SdkTTAddState.success:
      return TTAddFacePhase.SUCCESS;
    case SdkTTAddState.canStartAdd:
      return TTAddFacePhase.CAN_START_ADD;
    case SdkTTAddState.error:
      return TTAddFacePhase.ERROR;
  }
}

/**
 * `TTBluetooth.bleState` → Pigeon `TTBluetoothState`。
 * SDK 的 `BLEState` 数值定义与 Pigeon 的 `TTBluetoothState` 完全一致。
 */
export function bluetoothStateRevert(code: BLEState): TTBluetoothState {
  switch (code) {
    case BLEState.unknown:
      return TTBluetoothState.UNKNOW;
    case BLEState.resetting:
      return TTBluetoothState.RESETTING;
    case BLEState.unsupported:
      return TTBluetoothState.UNSUPPORTED;
    case BLEState.unAuthorized:
      return TTBluetoothState.UN_AUTHORIZED;
    case BLEState.turnOff:
      return TTBluetoothState.TURN_OFF;
    case BLEState.turnOn:
      return TTBluetoothState.TURN_ON;
  }
}

/**
 * SDK `TTLanguage` 默认值（用于 setLockSound 必填字段）。
 */
export function defaultLanguage(): SdkTTLanguage {
  return SdkTTLanguage.zh;
}
