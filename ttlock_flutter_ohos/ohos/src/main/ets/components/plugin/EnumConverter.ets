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
} from '@sciener/ttlock';
import {
  TTPassageModeType as SdkTTPassageModeType,
  TTUnlockDirection as SdkTTUnlockDirection,
} from '@sciener/ttlock/src/main/ets/e/f/l/l';
import {
  TTBluetoothState,
  TTControlAction,
  TTFaceErrorCode,
  TTFaceState,
  TTGatewayError,
  TTLockConfig,
  TTLockDirection,
  TTLockError,
  TTLockFunction,
  TTLockSwitchState,
  TTMultifunctionalKeypadError,
  TTOperateRecordType,
  TTPassageModeType,
  TTPasscodeType,
  TTRemoteAccessory,
  TTRemoteAccessoryError,
  TTSensitivityValue,
  TTSoundVolumeType,
} from './Messages';

/**
 * Pigeon TTLockConfig → SDK TTLockConfigType。
 * SDK 中没有 publicMode/lowBatteryAutoUnlock，使用就近字段做兜底。
 */
export function lockConfigConvert(config: TTLockConfig): SdkTTLockConfigType {
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
      return SdkTTLockConfigType.tamperAlert;
    case TTLockConfig.PUBLIC_MODE:
      return SdkTTLockConfigType.tamperAlert;
    case TTLockConfig.LOW_BATTERY_AUTO_UNLOCK:
      return SdkTTLockConfigType.tamperAlert;
    default:
      return SdkTTLockConfigType.sound;
  }
}

export function passageModeTypeConvert(type: TTPassageModeType): SdkTTPassageModeType {
  switch (type) {
    case TTPassageModeType.WEEKLY:
      return SdkTTPassageModeType.week;
    case TTPassageModeType.MONTHLY:
      return SdkTTPassageModeType.month;
    default:
      return SdkTTPassageModeType.week;
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
    default:
      return SdkTTSoundVolume.none;
  }
}

export function soundVolumeRevert(value: SdkTTSoundVolume): TTSoundVolumeType {
  switch (value) {
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
    default:
      return TTSoundVolumeType.OFF;
  }
}

export function controlActionConvert(action: TTControlAction): SdkTTControlAction {
  switch (action) {
    case TTControlAction.UNLOCK:
      return SdkTTControlAction.unlock;
    case TTControlAction.LOCK:
      return SdkTTControlAction.lock;
    default:
      return SdkTTControlAction.unlock;
  }
}

export function lockSwitchStateRevert(state: SdkTTLockSwitchState): TTLockSwitchState {
  switch (state) {
    case SdkTTLockSwitchState.lock:
      return TTLockSwitchState.LOCK;
    case SdkTTLockSwitchState.unlock:
      return TTLockSwitchState.UNLOCK;
    default:
      return TTLockSwitchState.UNKNOW;
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
    default:
      return SdkTTPasscodeType.permanent;
  }
}

export function operateLogTypeConvert(type: TTOperateRecordType): SdkTTOperateLogType {
  switch (type) {
    case TTOperateRecordType.LATEST:
      return SdkTTOperateLogType.latest;
    case TTOperateRecordType.TOTAL:
      return SdkTTOperateLogType.all;
    default:
      return SdkTTOperateLogType.all;
  }
}

export function lockDirectionConvert(direction: TTLockDirection): SdkTTUnlockDirection {
  switch (direction) {
    case TTLockDirection.LEFT:
      return SdkTTUnlockDirection.left;
    case TTLockDirection.RIGHT:
      return SdkTTUnlockDirection.right;
    default:
      return SdkTTUnlockDirection.right;
  }
}

export function lockDirectionRevert(direction: SdkTTUnlockDirection): TTLockDirection {
  switch (direction) {
    case SdkTTUnlockDirection.left:
      return TTLockDirection.LEFT;
    case SdkTTUnlockDirection.right:
      return TTLockDirection.RIGHT;
    default:
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
    default:
      return SdkTTSensitivityValue.off;
  }
}

export function remoteAccessoryConvert(accessory: TTRemoteAccessory): SdkTTAccessoryType {
  switch (accessory) {
    case TTRemoteAccessory.REMOTE_KEY:
      return SdkTTAccessoryType.wirelessKeyFob;
    case TTRemoteAccessory.REMOTE_KEYPAD:
      return SdkTTAccessoryType.wirelessKeypad;
    case TTRemoteAccessory.DOOR_SENSOR:
      return SdkTTAccessoryType.doorMagnetic;
    default:
      return SdkTTAccessoryType.wirelessKeypad;
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
      return SdkTTLockFeatureValue.TTLockFeatureValueXiaoCaoCamera;
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
    case TTLockFunction.WIFI_POWER_SAVING_TIME:
      return SdkTTLockFeatureValue.wifiPowerSavingTime;
    case TTLockFunction.MULTI_FUNCTION_KEYPAD:
      return SdkTTLockFeatureValue.multifunctionalKeypad;
    default:
      return null;
  }
}

/**
 * SDK 错误码 → Pigeon `TTLockError` 的索引值。
 *
 * SDK `TTError` 枚举既覆盖蓝牙/底层错误（97-255）也覆盖业务错误（0-32），
 * 这里直接按数值映射，未命中时返回 `FAIL`。
 */
export function lockErrorRevert(code: number): number {
  switch (code) {
    case 0:
      return TTLockError.RESETED;
    case 1:
      return TTLockError.CRC_ERROR;
    case 2:
      return TTLockError.NO_PERMISSTION;
    case 3:
      return TTLockError.WRONG_ADMIN_CODE;
    case 4:
      return TTLockError.NO_STORAGE_SPACE;
    case 5:
      return TTLockError.IN_SETTING_MODE;
    case 6:
      return TTLockError.NO_ADMIN;
    case 7:
      return TTLockError.NOT_IN_SETTING_MODE;
    case 8:
      return TTLockError.WRONG_DYNAMIC_CODE;
    case 10:
      return TTLockError.NO_POWER;
    case 11:
      return TTLockError.RESET_PASSCODE;
    case 12:
      return TTLockError.UNPDATE_PASSCODE_INDEX;
    case 13:
      return TTLockError.INVALID_LOCK_FLAG_POS;
    case 14:
      return TTLockError.EKEY_EXPIRED;
    case 15:
      return TTLockError.PASSCODE_LENGTH_INVALID;
    case 16:
      return TTLockError.SAME_PASSCODES;
    case 17:
      return TTLockError.EKEY_INACTIVE;
    case 18:
      return TTLockError.AES_KEY;
    case 19:
      return TTLockError.FAIL;
    case 20:
      return TTLockError.PASSCODE_EXIST;
    case 21:
      return TTLockError.PASSCODE_NOT_EXIST;
    case 22:
      return TTLockError.LACK_OF_STORAGE_SPACE_WHEN_ADDING_PASSCODES;
    case 23:
      return TTLockError.INVALID_PARA_LENGTH;
    case 24:
      return TTLockError.CARD_NOT_EXIST;
    case 25:
      return TTLockError.FINGERPRINT_DUPLICATION;
    case 26:
      return TTLockError.FINGERPRINT_NOT_EXIST;
    case 27:
      return TTLockError.INVALID_COMMAND;
    case 28:
      return TTLockError.IN_FREEZE_MODE;
    case 29:
      return TTLockError.INVALID_CLIENT_PARA;
    case 30:
      return TTLockError.LOCK_IS_LOCKED;
    case 31:
      return TTLockError.RECORD_NOT_EXIST;
    case 32:
      return TTLockError.INVALID_PARAMETER;
    case 37:
      return TTLockError.WRONG_WIFI;
    case 38:
      return TTLockError.WRONG_WIFI_PASSWORD;
    case 97:
      return TTLockError.BLUETOOTH_OFF;
    case 98:
      return TTLockError.BLUETOOTH_CONNECT_TIMEOUNT;
    case 99:
      return TTLockError.BLUETOOTH_DISCONNECTION;
    case 100:
      return TTLockError.LOCK_IS_BUSY;
    case 101:
      return TTLockError.INVALID_LOCK_DATA;
    case 102:
      return TTLockError.INVALID_PARAMETER;
    case 250:
      return TTLockError.BLUETOOTH_DISCONNECTION;
    case 251:
      return TTLockError.BLUETOOTH_OFF;
    case 252:
      return TTLockError.NO_PERMISSTION;
    case 253:
      return TTLockError.BLUETOOTH_CONNECT_TIMEOUNT;
    case 255:
      return TTLockError.BLUETOOTH_CONNECT_TIMEOUNT;
    case 1000:
      return TTLockError.FAIL;
    case 1001:
      return TTLockError.INVALID_PARAMETER;
    default:
      return TTLockError.FAIL;
  }
}

/**
 * SDK `TTGatewayStatus` → Pigeon `TTGatewayError` 的索引值。
 */
export function gatewayErrorRevert(code: number): number {
  switch (code) {
    case 0:
      return TTGatewayError.SUCCESS;
    case 1:
      return TTGatewayError.FAILED;
    case 3:
      return TTGatewayError.BAD_WIFI_NAME;
    case 4:
      return TTGatewayError.BAD_WIFI_PASSWORD;
    case 6:
      return TTGatewayError.INVALID_COMMAND;
    case 7:
      return TTGatewayError.TIME_OUT;
    case 8:
      return TTGatewayError.NO_SIM_CARD;
    case 9:
      return TTGatewayError.NO_CABLE;
    case -1:
      return TTGatewayError.WRONG_CRC;
    case -2:
      return TTGatewayError.WRONG_AES_KEY;
    case -3:
      return TTGatewayError.UN_CONNECTED;
    case -4:
      return TTGatewayError.COMMUNICATION_DISCONNECTED;
    case -5:
      return TTGatewayError.FAILED_CONFIGURE_ROUTER;
    case -6:
      return TTGatewayError.FAILED_CONFIGURE_SERVER;
    case -7:
      return TTGatewayError.FAILED_CONFIGURE_ACCOUNT;
    case -8:
      return TTGatewayError.FAILED_CONFIG_IP;
    case -9:
      return TTGatewayError.INVALID_IP;
    default:
      return TTGatewayError.FAILED;
  }
}

/**
 * SDK `TTKeypadStatus` / `TTWifiDoorMagneticStatus` → Pigeon `TTRemoteAccessoryError` 索引值。
 *
 * 用于普通遥控钥匙、键盘、门磁等流式回调中错误码透传。
 */
export function remoteAccessoryErrorRevert(code: number): number {
  switch (code) {
    case 0:
      return TTRemoteAccessoryError.SUCCESS;
    case 1:
      return TTRemoteAccessoryError.FAILED;
    case -1:
    case 2:
      return TTRemoteAccessoryError.WRONG_CRC;
    case -2:
      return TTRemoteAccessoryError.CONNECT_FAILED;
    case -3:
      return TTRemoteAccessoryError.DATA_FORMAT_ERROR;
    case 3:
      return TTRemoteAccessoryError.REQUEST_FAILED;
    case 4:
      return TTRemoteAccessoryError.REQUEST_FAILED;
    default:
      return TTRemoteAccessoryError.FAILED;
  }
}

export function keypadErrorRevert(code: number): number {
  return remoteAccessoryErrorRevert(code);
}

/**
 * SDK `TTKeypadStatus`（多功能键盘）→ Pigeon `TTMultifunctionalKeypadError` 索引值。
 */
export function multifunctionalKeypadErrorRevert(code: number): number {
  switch (code) {
    case 0:
      return TTMultifunctionalKeypadError.SUCCESS;
    case 1:
      return TTMultifunctionalKeypadError.FAILED;
    case -1:
      return TTMultifunctionalKeypadError.WRONG_CRC;
    case -2:
      return TTMultifunctionalKeypadError.KEYPAD_CONNECT_FAILED;
    case -3:
      return TTMultifunctionalKeypadError.DATA_FORMAT_ERROR;
    case -4:
      return TTMultifunctionalKeypadError.DUPLICATE_FINGERPRINT;
    case 22:
      return TTMultifunctionalKeypadError.NO_STORAGE_SPACE;
    default:
      return TTMultifunctionalKeypadError.FAILED;
  }
}

/**
 * SDK `TTMeterError` → Pigeon `TTRemoteAccessoryError` 索引值。
 */
export function waterMeterErrorRevert(code: number): number {
  switch (code) {
    case 0:
      return TTRemoteAccessoryError.NO_RESPONSE;
    case 1:
      return TTRemoteAccessoryError.REQUEST_FAILED;
    case 2:
      return TTRemoteAccessoryError.REQUEST_FAILED;
    default:
      return remoteAccessoryErrorRevert(code);
  }
}

export function electricMeterErrorRevert(code: number): number {
  return waterMeterErrorRevert(code);
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
    default:
      return TTFaceErrorCode.NORMAL;
  }
}

export function faceStateRevert(state: SdkTTAddState): TTFaceState {
  switch (state) {
    case SdkTTAddState.canStartAdd:
      return TTFaceState.CAN_START_ADD;
    case SdkTTAddState.error:
      return TTFaceState.ERROR;
    default:
      return TTFaceState.ERROR;
  }
}

/**
 * `TTBluetooth.bleState` → Pigeon `TTBluetoothState`。
 * SDK 的 `BLEState` 数值定义与 Pigeon 的 `TTBluetoothState` 完全一致。
 */
export function bluetoothStateRevert(code: number): TTBluetoothState {
  switch (code) {
    case 0:
      return TTBluetoothState.UNKNOW;
    case 1:
      return TTBluetoothState.RESETTING;
    case 2:
      return TTBluetoothState.UNSUPPORTED;
    case 3:
      return TTBluetoothState.UN_AUTHORIZED;
    case 4:
      return TTBluetoothState.TURN_OFF;
    case 5:
      return TTBluetoothState.TURN_ON;
    default:
      return TTBluetoothState.UNKNOW;
  }
}

/**
 * SDK `TTLanguage` 默认值（用于 setLockSound 必填字段）。
 */
export function defaultLanguage(): SdkTTLanguage {
  return SdkTTLanguage.zh;
}
