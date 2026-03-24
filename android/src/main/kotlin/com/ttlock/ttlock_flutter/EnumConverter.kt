package com.ttlock.ttlock_flutter

import androidx.annotation.Nullable
import com.ttlock.bl.sdk.constant.ControlAction
import com.ttlock.bl.sdk.constant.FeatureValue
import com.ttlock.bl.sdk.constant.KeyboardPwdType
import com.ttlock.bl.sdk.constant.LockDataSwitchValue
import com.ttlock.bl.sdk.constant.LockStatus
import com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError
import com.ttlock.bl.sdk.entity.LockError
import com.ttlock.bl.sdk.entity.OperateLogType
import com.ttlock.bl.sdk.entity.PassageModeType
import com.ttlock.bl.sdk.entity.PowerSaverWorkMode
import com.ttlock.bl.sdk.entity.SoundVolume
import com.ttlock.bl.sdk.entity.TTLiftWorkMode
import com.ttlock.bl.sdk.entity.TTLockConfigType
import com.ttlock.bl.sdk.gateway.model.GatewayError
import com.ttlock.bl.sdk.keypad.model.KeypadError
import com.ttlock.bl.sdk.mulfunkeypad.model.MultifunctionalKeypadError
import com.ttlock.bl.sdk.remote.model.RemoteError
import com.ttlock.bl.sdk.watermeter.model.WaterMeterError
import com.ttlock.bl.sdk.wirelessdoorsensor.model.DoorSensorError

fun lockConfigConvert(config: TTLockConfig): TTLockConfigType {
    return when(config) {
        TTLockConfig.AUDIO -> TTLockConfigType.LOCK_SOUND
        TTLockConfig.PASSCODE_VISIBLE -> TTLockConfigType.PASSCODE_VISIBLE
        TTLockConfig.FREEZE -> TTLockConfigType.LOCK_FREEZE
        TTLockConfig.TAMPER_ALERT -> TTLockConfigType.TAMPER_ALERT
        TTLockConfig.RESET_BUTTON -> TTLockConfigType.RESET_BUTTON
        TTLockConfig.PRIVACY_LOCK -> TTLockConfigType.PRIVACY_LOCK
        TTLockConfig.PASSAGE_MODE_AUTO_UNLOCK -> TTLockConfigType.PASSAGE_MODE_AUTO_UNLOCK_SETTING
        TTLockConfig.WIFI_LOCK_POWER_SAVING_MODE -> TTLockConfigType.WIFI_LOCK_POWER_SAVING_MODE
        TTLockConfig.DOUBLE_AUTH -> TTLockConfigType.DOUBLE_CHECK
        TTLockConfig.PUBLIC_MODE -> TTLockConfigType.PUBLIC_MODE
        TTLockConfig.LOW_BATTERY_AUTO_UNLOCK -> TTLockConfigType.LOW_BATTERY_AUTO_UNLOCK
    }
}

fun liftWorkActivateTypeConvert(type: TTLiftWorkActivateType): TTLiftWorkMode {
    return when(type) {
        TTLiftWorkActivateType.ALL_FLOORS -> TTLiftWorkMode.ActivateAllFloors
        TTLiftWorkActivateType.SPECIFIC_FLOORS -> TTLiftWorkMode.ActivateSpecificFloors
    }
}

fun powerSaverWorkModeConvert(type: TTPowerSaverWorkType): PowerSaverWorkMode {
    return when(type) {
        TTPowerSaverWorkType.ALL_CARDS -> PowerSaverWorkMode.ALL_CARDS
        TTPowerSaverWorkType.HOTEL_CARD -> PowerSaverWorkMode.HOTEL_CARD
        TTPowerSaverWorkType.ROOM_CARD -> PowerSaverWorkMode.ROOM_CARD
    }
}

fun passageModeTypeConvert(type: TTPassageModeType): PassageModeType {
    return when(type) {
        TTPassageModeType.WEEKLY -> PassageModeType.Weekly
        TTPassageModeType.MONTHLY -> PassageModeType.Monthly
    }
}

fun soundVolumeConvert(type: TTSoundVolumeType): SoundVolume {
    return when(type) {
        TTSoundVolumeType.FIRST_LEVEL -> SoundVolume.FIRST_LEVEL
        TTSoundVolumeType.SECOND_LEVEL -> SoundVolume.SECOND_LEVEL
        TTSoundVolumeType.THIRD_LEVEL -> SoundVolume.THIRD_LEVEL
        TTSoundVolumeType.FOURTH_LEVEL -> SoundVolume.FOUTH_LEVEL
        TTSoundVolumeType.FIFTH_LEVEL -> SoundVolume.FIFTH_LEVEL
        TTSoundVolumeType.OFF -> SoundVolume.OFF
        TTSoundVolumeType.ON -> SoundVolume.ON
    }
}

fun controlActionConvert(action: TTControlAction): Int {
    return when(action) {
        TTControlAction.UNLOCK -> ControlAction.UNLOCK
        TTControlAction.LOCK -> ControlAction.LOCK
    }
}

fun featureValueConvert(function: TTLockFunction): Int? {
    return when(function) {
        TTLockFunction.PASSCODE -> FeatureValue.PASSCODE
        TTLockFunction.IC_CARD -> FeatureValue.IC
        TTLockFunction.FINGERPRINT -> FeatureValue.FINGER_PRINT
        TTLockFunction.WRISTBAND -> FeatureValue.WRIST_BAND
        TTLockFunction.AUTO_LOCK -> FeatureValue.AUTO_LOCK
        TTLockFunction.DELETE_PASSCODE -> FeatureValue.PASSCODE_WITH_DELETE_FUNCTION
        TTLockFunction.MANAGE_PASSCODE -> FeatureValue.MODIFY_PASSCODE_FUNCTION
        TTLockFunction.LOCKING -> FeatureValue.MANUAL_LOCK
        TTLockFunction.PASSCODE_VISIBLE -> FeatureValue.PASSWORD_DISPLAY_OR_HIDE
        TTLockFunction.GATEWAY_UNLOCK -> FeatureValue.GATEWAY_UNLOCK
        TTLockFunction.LOCK_FREEZE -> FeatureValue.FREEZE_LOCK
        TTLockFunction.CYCLE_PASSWORD -> FeatureValue.CYCLIC_PASSWORD
        TTLockFunction.UNLOCK_SWITCH -> FeatureValue.CONFIG_GATEWAY_UNLOCK
        TTLockFunction.AUDIO_SWITCH -> FeatureValue.AUDIO_MANAGEMENT
        TTLockFunction.NB_IO_T -> FeatureValue.NB_LOCK
        TTLockFunction.GET_ADMIN_PASSCODE -> FeatureValue.GET_ADMIN_CODE
        TTLockFunction.HOTEL_CARD -> FeatureValue.HOTEL_LOCK
        TTLockFunction.NO_CLOCK -> FeatureValue.LOCK_NO_CLOCK_CHIP
        TTLockFunction.NO_BROADCAST_IN_NORMAL -> FeatureValue.SUPPORT_CLOSE_BLUETOOTH_ADVERTISING
        TTLockFunction.PASSAGE_MODE -> FeatureValue.PASSAGE_MODE
        TTLockFunction.TURN_OFF_AUTO_LOCK -> FeatureValue.PASSAGE_MODE_AND_AUTO_LOCK_AND_CAN_CLOSE
        TTLockFunction.WIRELESS_KEYPAD -> FeatureValue.WIRELESS_KEYBOARD
        TTLockFunction.LIGHT -> FeatureValue.LAMP
        TTLockFunction.HOTEL_CARD_BLACKLIST -> null
        TTLockFunction.IDENTITY_CARD -> null
        TTLockFunction.TAMPER_ALERT -> FeatureValue.TAMPER_ALERT
        TTLockFunction.RESET_BUTTON -> FeatureValue.RESET_BUTTON
        TTLockFunction.PRIVACY_LOCK -> FeatureValue.PRIVACY_LOCK
        TTLockFunction.DEAD_LOCK -> FeatureValue.DEAD_LOCK
        TTLockFunction.CYCLIC_CARD_OR_FINGERPRINT -> FeatureValue.CYCLIC_IC_OR_FINGER_PRINT
        TTLockFunction.FINGER_VEIN -> FeatureValue.FINGER_VEIN
        TTLockFunction.BLE5G -> FeatureValue.TELINK_CHIP
        TTLockFunction.NB_AWAKE -> FeatureValue.NB_ACTIVITE_CONFIGURATION
        TTLockFunction.RECOVER_CYCLE_PASSCODE -> FeatureValue.CYCLIC_PASSCODE_CAN_RECOVERY
        TTLockFunction.REMOTE_KEY -> FeatureValue.REMOTE
        TTLockFunction.GET_ACCESSORY_ELECTRIC_QUANTITY -> FeatureValue.ACCESSORY_BATTERY
        TTLockFunction.SOUND_VOLUME_AND_LANGUAGE_SETTING -> FeatureValue.SOUND_VOLUME_AND_LANGUAGE_SETTING
        TTLockFunction.QR_CODE -> FeatureValue.QR_CODE
        TTLockFunction.DOOR_SENSOR_STATE -> FeatureValue.DOOR_SENSOR
        TTLockFunction.PASSAGE_MODE_AUTO_UNLOCK_SETTING -> FeatureValue.PASSAGE_MODE_AUTO_UNLOCK_SETTING
        TTLockFunction.DOOR_SENSOR -> FeatureValue.WIRELESS_DOOR_SENSOR
        TTLockFunction.DOOR_SENSOR_ALERT -> FeatureValue.DOOR_OPEN_ALARM
        TTLockFunction.SENSITIVITY -> FeatureValue.SENSITIVITY
        TTLockFunction.FACE -> FeatureValue.FACE_3D
        TTLockFunction.CPU_CARD -> FeatureValue.CPU_CARD
        TTLockFunction.WIFI_LOCK -> FeatureValue.WIFI_LOCK
        TTLockFunction.WIFI_LOCK_STATIC_IP -> FeatureValue.WIFI_LOCK_SUPPORT_STATIC_IP
        TTLockFunction.PASSCODE_KEY_NUMBER -> FeatureValue.INCOMPLETE_PASSCODE
        TTLockFunction.STAND_ALONE_ACTIVATION -> null
        TTLockFunction.DOUBLE_AUTH -> FeatureValue.SUPPORT_DOUBLE_CHECK
        TTLockFunction.AUTHORIZED_UNLOCK -> FeatureValue.APP_AUTH_UNLOCK
        TTLockFunction.GATEWAY_AUTHORIZED_UNLOCK -> FeatureValue.GATEWAY_AUTH_UNLOCK
        TTLockFunction.NO_EKEY_UNLOCK -> FeatureValue.DO_NOT_SUPPORT_APP_AND_GATEWAY_UNLOCK
        TTLockFunction.ZHI_AN_PHOTO_FACE -> FeatureValue.ZHI_AN_FACE_DELIVERY
        TTLockFunction.PALM_VEIN -> FeatureValue.PALM_VEIN
        TTLockFunction.WIFI_AREA -> null
        TTLockFunction.XIAO_CAO_CAMERA -> FeatureValue.SUPPORT_GRASS
        TTLockFunction.RESET_LOCK_BY_CODE -> FeatureValue.RESET_LOCK_BY_CODE
        TTLockFunction.THIRD_PARTY_BLUETOOTH_DEVICE -> FeatureValue.SUPPORT_THIRD_PARTY_BLUETOOTH_DEVICE
        TTLockFunction.AUTO_SET_ANGLE -> FeatureValue.AUTO_SET_ANGLE
        TTLockFunction.MANUAL_SET_ANGLE -> FeatureValue.MANUAL_SET_ANGLE
        TTLockFunction.CONTROL_LATCH_BOLT -> FeatureValue.CONTROL_LATCH_BOLT
        TTLockFunction.AUTO_SET_UNLOCK_DIRECTION -> FeatureValue.AUTO_SET_UNLOCK_DIRECTION
        TTLockFunction.IC_CARD_SECURITY_SETTING -> FeatureValue.SUPPORT_IC_CARD_SECURITY_SETTING
        TTLockFunction.WIFI_POWER_SAVING_TIME -> FeatureValue.SUPPORT_WIFI_SLEEP_MODE_TIMES_SETTING
        TTLockFunction.MULTI_FUNCTION_KEYPAD -> FeatureValue.SUPPORT_MULTI_FUNCTION_KEYPAD
        TTLockFunction.DO_NOT_SUPPORT_TURN_OFF_LATCH_BOLT -> FeatureValue.DO_NOT_SUPPORT_TURN_OFF_LATCH_BOLT
        TTLockFunction.PUBLIC_MODE -> FeatureValue.SUPPORT_PUBLIC_MODE_SETTING
        TTLockFunction.LOW_BATTERY_AUTO_UNLOCK -> FeatureValue.SUPPORT_LOW_BATTERY_UNLOCK_SETTING
        TTLockFunction.MOTOR_DRIVE_TIME -> FeatureValue.SUPPORT_MOTOR_DRIVE_TIME_SETTING
        TTLockFunction.MODIFY_FEATURE_VALUE -> FeatureValue.SUPPORT_MODIFY_FEATURE_VALUE
        TTLockFunction.MODIFY_LOCK_NAME_PREFIX -> FeatureValue.SUPPORT_MODIFY_LOCK_NAME_PREFIX
        TTLockFunction.AUTH_CODE -> FeatureValue.SUPPORT_AUTH_CODE
        TTLockFunction.UNAUTHORIZED_ATTEMPT_ALARM -> FeatureValue.UNAUTHORIZED_ATTEMPT_ALARM
        TTLockFunction.POWER_SAVER_SUPPORT_WIFI -> FeatureValue.POWER_SAVER_SUPPORT_WIFI
        TTLockFunction.BLUETOOTH_ADVERTISING_SETTING -> FeatureValue.SUPPORT_BLUETOOTH_ADVERTISING_SETTING
        TTLockFunction.WORKING_MODE -> FeatureValue.SUPPORT_WORKING_TIMES
        TTLockFunction.SUPPLIER_CODE -> FeatureValue.SUPPORT_SUPPLIER_CODE
        TTLockFunction.CAT_ONE -> FeatureValue.SUPPORT_CAT_ONE
        TTLockFunction.FORCED_OPENING_DOOR_ALARM -> FeatureValue.SUPPORT_FORCED_OPENING_DOOR_ALARM
        TTLockFunction.ZHI_AN_FACE_FEATURE_SECOND_GENERATION -> FeatureValue.ZHI_AN_FACE_FEATURE_SECOND_GENERATION
        TTLockFunction.SUPPORT_DEAD_LOCKING -> FeatureValue.SUPPORT_DEAD_LOCKING
        TTLockFunction.WORKING_TIME -> null
        TTLockFunction.CUSTOM_QRCODE -> FeatureValue.SUPPORT_CUSTOM_QR_CODE
        TTLockFunction.SECURITY_M1CARD -> FeatureValue.SUPPORT_SAFE_M1_CARD
        TTLockFunction.YI_SHENG_PHOTO_FACE -> null
    } as Int?
}

fun lockSwitchStateRevert(state: Int): TTLockSwitchState {
    return when(state) {
        LockStatus.LOCK -> TTLockSwitchState.LOCK
        LockStatus.UNLOCK -> TTLockSwitchState.UNLOCK
        else -> TTLockSwitchState.UNKNOW
    }
}

fun soundVolumeRevert(type: SoundVolume): TTSoundVolumeType {
    return when(type) {
        SoundVolume.FIRST_LEVEL -> TTSoundVolumeType.FIRST_LEVEL
        SoundVolume.SECOND_LEVEL -> TTSoundVolumeType.SECOND_LEVEL
        SoundVolume.THIRD_LEVEL -> TTSoundVolumeType.THIRD_LEVEL
        SoundVolume.FOUTH_LEVEL -> TTSoundVolumeType.FOURTH_LEVEL
        SoundVolume.FIFTH_LEVEL -> TTSoundVolumeType.FIFTH_LEVEL
        SoundVolume.OFF -> TTSoundVolumeType.OFF
        SoundVolume.ON -> TTSoundVolumeType.ON
    }
}

fun keyboardPwdTypeConvert(type: TTPasscodeType): Byte {
    return when(type) {
        TTPasscodeType.PERMANENT -> KeyboardPwdType.PWD_TYPE_PERMANENT
        TTPasscodeType.ONCE -> KeyboardPwdType.PWD_TYPE_COUNT
        TTPasscodeType.PERIOD -> KeyboardPwdType.PWD_TYPE_PERIOD
        TTPasscodeType.CYCLE -> KeyboardPwdType.PWD_TYPE_CIRCLE
    }
}

fun operateLogTypeConvert(type: TTOperateRecordType): OperateLogType {
    return when(type) {
        TTOperateRecordType.LATEST -> OperateLogType.NEW
        TTOperateRecordType.TOTAL -> OperateLogType.ALL
    }
}

fun lockErrorRevert(error: LockError): TTLockError {
    return when(error) {
        LockError.SUCCESS -> TTLockError.SUCCESS
        LockError.LOCK_CRC_CHECK_ERROR -> TTLockError.CRC_ERROR
        LockError.LOCK_NO_PERMISSION -> TTLockError.NO_PERMISSTION
        LockError.LOCK_ADMIN_CHECK_ERROR -> TTLockError.WRONG_ADMIN_CODE
        LockError.LOCK_IS_IN_SETTING_MODE -> TTLockError.IN_SETTING_MODE
        LockError.LOCK_NOT_EXIST_ADMIN -> TTLockError.NO_ADMIN
        LockError.LOCK_IS_IN_NO_SETTING_MODE -> TTLockError.NOT_IN_SETTING_MODE
        LockError.LOCK_DYNAMIC_PWD_ERROR -> TTLockError.WRONG_DYNAMIC_CODE
        LockError.LOCK_NO_POWER -> TTLockError.NO_POWER
        LockError.LOCK_INIT_KEYBOARD_FAILED -> TTLockError.FAIL
        LockError.LOCK_KEY_FLAG_INVALID -> TTLockError.INVALID_LOCK_FLAG_POS
        LockError.LOCK_USER_TIME_EXPIRED -> TTLockError.EKEY_EXPIRED
        LockError.LOCK_PASSWORD_LENGTH_INVALID -> TTLockError.PASSCODE_LENGTH_INVALID
        LockError.LOCK_SUPER_PASSWORD_IS_SAME_WITH_DELETE_PASSWORD -> TTLockError.SAME_PASSCODES
        LockError.LOCK_USER_TIME_INEFFECTIVE -> TTLockError.EKEY_INACTIVE
        LockError.LOCK_USER_NOT_LOGIN -> TTLockError.FAIL
        LockError.LOCK_OPERATE_FAILED -> TTLockError.FAIL
        LockError.LOCK_PASSWORD_EXIST -> TTLockError.PASSCODE_EXIST
        LockError.LOCK_PASSWORD_NOT_EXIST -> TTLockError.PASSCODE_NOT_EXIST
        LockError.LOCK_NO_FREE_MEMORY -> TTLockError.LACK_OF_STORAGE_SPACE_WHEN_ADDING_PASSCODES
        LockError.NO_DEFINED_ERROR -> TTLockError.FAIL
        LockError.IC_CARD_NOT_EXIST -> TTLockError.CARD_NOT_EXIST
        LockError.FINGER_PRINT_NOT_EXIST -> TTLockError.FINGERPRINT_NOT_EXIST
        LockError.INVALID_COMMAND -> TTLockError.INVALID_COMMAND
        LockError.LOCK_FROZEN -> TTLockError.IN_FREEZE_MODE
        LockError.INVALID_VENDOR -> TTLockError.INVALID_CLIENT_PARA
        LockError.LOCK_REVERSE -> TTLockError.LOCK_IS_LOCKED
        LockError.RECORD_NOT_EXIST -> TTLockError.RECORD_NOT_EXIST
        LockError.INVALID_PARAM -> TTLockError.INVALID_PARAMETER
        LockError.PARKING_LOCK_LOCKED_FAILED -> TTLockError.INVALID_LOCK_DATA
        LockError.Failed -> TTLockError.FAIL
        LockError.COMMAND_RECEIVED -> TTLockError.INVALID_COMMAND
        LockError.BAD_WIFI_NAME -> TTLockError.WRONG_WIFI
        LockError.BAD_WIFI_PASSWORD -> TTLockError.WRONG_WIFI_PASSWORD
        LockError.QR_CODE_ALREADY_EXIST -> TTLockError.PASSCODE_EXIST
        LockError.AES_PARSE_ERROR -> TTLockError.AES_KEY
        LockError.KEY_INVALID -> TTLockError.RESETED
        LockError.LOCK_CONNECT_FAIL -> TTLockError.BLUETOOTH_CONNECT_TIMEOUNT
        LockError.LOCK_IS_BUSY -> TTLockError.LOCK_IS_BUSY
        LockError.DATA_FORMAT_ERROR -> TTLockError.INVALID_PARAMETER
        LockError.LOCK_IS_NOT_SUPPORT -> TTLockError.NOT_SUPPORT_MODIFY_PASSCODE
        LockError.BLE_SERVER_NOT_INIT -> TTLockError.BLUETOOTH_OFF
        LockError.SCAN_FAILED_ALREADY_START -> TTLockError.SCAN_FAILED_ALREADY_START
        LockError.SCAN_FAILED_APPLICATION_REGISTRATION_FAILED -> TTLockError.SCAN_FAILED_APPLICATION_REGISTRATION_FAILED
        LockError.SCAN_FAILED_INTERNAL_ERROR -> TTLockError.SCAN_FAILED_INTERNAL_ERROR
        LockError.SCAN_FAILED_FEATURE_UNSUPPORTED -> TTLockError.SCAN_FAILED_FEATURE_UNSUPPORTED
        LockError.SCAN_FAILED_OUT_OF_HARDWARE_RESOURCES -> TTLockError.SCAN_FAILED_OUT_OF_HARDWARE_RESOURCES
        LockError.INIT_WIRELESS_KEYBOARD_FAILED -> TTLockError.FAIL
        LockError.WIRELESS_KEYBOARD_NO_RESPONSE -> TTLockError.WIRELESS_KEYBOARD_NO_RESPONSE
        LockError.DEVICE_CONNECT_FAILED -> TTLockError.DEVICE_CONNECT_FAILED
        LockError.SIGNATURE_VERIFICATION_FAILED -> TTLockError.SIGNATURE_VERIFICATION_FAILED
        LockError.INVALID_APPLICATION -> TTLockError.INVALID_APPLICATION
    }
}

fun gatewayErrorRevert(error: GatewayError): TTGatewayError {
    return when(error) {
        GatewayError.FAILED -> TTGatewayError.FAILED
        GatewayError.BAD_WIFI_NAME -> TTGatewayError.BAD_WIFI_NAME
        GatewayError.BAD_WIFI_PASSWORD -> TTGatewayError.BAD_WIFI_PASSWORD
        GatewayError.INVALID_COMMAND -> TTGatewayError.INVALID_COMMAND
        GatewayError.TIME_OUT -> TTGatewayError.TIME_OUT
        GatewayError.NO_SIM_CARD -> TTGatewayError.NO_SIM_CARD
        GatewayError.NO_CABLE -> TTGatewayError.NO_CABLE
        GatewayError.FAILED_TO_CONFIGURE_ROUTER -> TTGatewayError.FAILED_CONFIGURE_ROUTER
        GatewayError.FAILED_TO_CONFIGURE_SERVER -> TTGatewayError.FAILED_CONFIGURE_SERVER
        GatewayError.FAILED_TO_CONFIGURE_ACCOUNT -> TTGatewayError.FAILED_CONFIGURE_ACCOUNT
        GatewayError.COMMUNICATION_DISCONNECTED -> TTGatewayError.COMMUNICATION_DISCONNECTED
        GatewayError.UNCONNECTED -> TTGatewayError.UN_CONNECTED
        GatewayError.CONNECT_TIMEOUT -> TTGatewayError.CONNECT_TIMEOUT
        GatewayError.DATA_FORMAT_ERROR -> TTGatewayError.DATA_FORMAT_ERROR
        GatewayError.SUCCESS -> TTGatewayError.SUCCESS
    }
}

fun remoteErrorRevert(error: RemoteError): TTRemoteAccessoryError {
    return when(error) {
        RemoteError.SUCCESS -> TTRemoteAccessoryError.SUCCESS
        RemoteError.FAILED -> TTRemoteAccessoryError.FAILED
        RemoteError.NO_RESPONSE -> TTRemoteAccessoryError.NO_RESPONSE
        RemoteError.CONNECT_FAIL -> TTRemoteAccessoryError.CONNECT_FAILED
        RemoteError.Device_IS_BUSY -> TTRemoteAccessoryError.DEVICE_IS_BUSY
        RemoteError.DATA_FORMAT_ERROR -> TTRemoteAccessoryError.DATA_FORMAT_ERROR
    }
}

fun keypadErrorRevert(error: KeypadError): TTRemoteAccessoryError {
    return when(error) {
        KeypadError.SUCCESS -> TTRemoteAccessoryError.SUCCESS
        KeypadError.FAILED -> TTRemoteAccessoryError.FAILED
        KeypadError.NO_RESPONSE -> TTRemoteAccessoryError.NO_RESPONSE
        KeypadError.KEYBOARD_CONNECT_FAIL -> TTRemoteAccessoryError.CONNECT_FAILED
        KeypadError.KEYBOARD_IS_BUSY -> TTRemoteAccessoryError.DEVICE_IS_BUSY
        KeypadError.DATA_FORMAT_ERROR -> TTRemoteAccessoryError.DATA_FORMAT_ERROR
    }
}

fun doorSensorErrorRevert(error: DoorSensorError): TTRemoteAccessoryError {
    return when(error) {
        DoorSensorError.SUCCESS -> TTRemoteAccessoryError.SUCCESS
        DoorSensorError.FAILED -> TTRemoteAccessoryError.FAILED
        DoorSensorError.NO_RESPONSE -> TTRemoteAccessoryError.NO_RESPONSE
        DoorSensorError.CONNECT_FAIL -> TTRemoteAccessoryError.CONNECT_FAILED
        DoorSensorError.Device_IS_BUSY -> TTRemoteAccessoryError.DEVICE_IS_BUSY
        DoorSensorError.DATA_FORMAT_ERROR -> TTRemoteAccessoryError.DATA_FORMAT_ERROR
    }
}

fun waterMeterErrorRevert(error: WaterMeterError): TTRemoteAccessoryError {
    return when(error) {
        WaterMeterError.SUCCESS -> TTRemoteAccessoryError.SUCCESS
        WaterMeterError.METER_NO_RESPONSE -> TTRemoteAccessoryError.NO_RESPONSE
        WaterMeterError.NET_ERROR -> TTRemoteAccessoryError.REQUEST_FAILED
        WaterMeterError.REQUEST_ERROR -> TTRemoteAccessoryError.REQUEST_FAILED
        WaterMeterError.WATER_METER_CONNECT_FAIL -> TTRemoteAccessoryError.CONNECT_FAILED
        WaterMeterError.WATER_METER_IS_BUSY -> TTRemoteAccessoryError.DEVICE_IS_BUSY
        WaterMeterError.DATA_FORMAT_ERROR -> TTRemoteAccessoryError.DATA_FORMAT_ERROR
    }
}

fun electricMeterErrorRevert(error: ElectricMeterError): TTRemoteAccessoryError {
    return when(error) {
        ElectricMeterError.SUCCESS -> TTRemoteAccessoryError.SUCCESS
        ElectricMeterError.METER_NO_RESPONSE -> TTRemoteAccessoryError.NO_RESPONSE
        ElectricMeterError.NET_ERROR -> TTRemoteAccessoryError.REQUEST_FAILED
        ElectricMeterError.REQUEST_ERROR -> TTRemoteAccessoryError.REQUEST_FAILED
        ElectricMeterError.ELECTRIC_METER_CONNECT_FAIL -> TTRemoteAccessoryError.CONNECT_FAILED
        ElectricMeterError.ELECTRIC_METER_IS_BUSY -> TTRemoteAccessoryError.DEVICE_IS_BUSY
        ElectricMeterError.DATA_FORMAT_ERROR -> TTRemoteAccessoryError.DATA_FORMAT_ERROR
    }
}

fun multifunctionalKeypadErrorRevert(error: MultifunctionalKeypadError): TTMultifunctionalKeypadError {
    return when(error) {
        MultifunctionalKeypadError.SUCCESS -> TTMultifunctionalKeypadError.SUCCESS
        MultifunctionalKeypadError.FAILED -> TTMultifunctionalKeypadError.FAILED
        MultifunctionalKeypadError.DUPLICATE_FINGERPRINT -> TTMultifunctionalKeypadError.DUPLICATE_FINGERPRINT
        MultifunctionalKeypadError.NO_RESPONSE -> TTMultifunctionalKeypadError.NO_RESPONSE
        MultifunctionalKeypadError.KEYPAD_CONNECT_FAIL -> TTMultifunctionalKeypadError.KEYPAD_CONNECT_FAILED
        MultifunctionalKeypadError.DATA_FORMAT_ERROR -> TTMultifunctionalKeypadError.DATA_FORMAT_ERROR
    }
}