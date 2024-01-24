package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.constant.FeatureValue;

/**
 * Created by TTLock on 2020/9/14.
 */
public enum TTLockFunction {
    passcode,
    icCard,
    fingerprint,
    wristband,
    autoLock,
    deletePasscode, //5
    // 6
    managePasscode,
    locking,
    passcodeVisible,
    gatewayUnlock,
    lockFreeze,
    cyclePassword,
    unlockSwicth,
    audioSwitch,
    nbIoT, //15
    //17
    getAdminPasscode,
    hotelCard,
    noClock,
    noBroadcastInNormal,
    passageMode,
    turnOffAutoLock,
    wirelessKeypad,
    light,
    hotelCardBlacklist,
    identityCard,
    tamperAlert,
    resetButton,
    privacyLock, //28
    //31
    deadLock, //29
    //33
    cyclicCardOrFingerprint, //30
    //35
    //36
    fingerVein,
    ble5G,
    nbAwake,
    recoverCyclePasscode,
    wirelessKeyFob,
    getAccessoryElectricQuantity,
    soundVolumeAndLanguageSetting,
    qrCode,
    doorSensorState,
    passageModeAutoUnlockSetting,
    doorSensor, //50
    doorSensorAlert,
    sensitivity,
    face,
    cpuCard,
    wifiLock,
    wifiLockStaticIP,
    passcodeKeyNumber,

    meariCamera,
    standAloneActivation,
    doubleAuth,
    authorizedUnlock,
    gatewayAuthorizedUnlock,
    noEkeyUnlock,
    xiongMaiCamera,
    zhiAnPhotoFace,
    palmVein,
    wifiArea,
    xiaoCaoCamera,
    resetLockByCode;

    public static int flutter2Native(int index) {
        TTLockFunction ttLockFunction = null;
        if (index < TTLockFunction.class.getEnumConstants().length) {
             ttLockFunction = TTLockFunction.class.getEnumConstants()[index];
        }
        if (ttLockFunction == null) {
            return -1;
        }
        switch (ttLockFunction) {
            case passcode:
                return FeatureValue.PASSCODE;
            case icCard:
                return FeatureValue.IC;
            case fingerprint:
                return FeatureValue.FINGER_PRINT;
            case autoLock:
                return FeatureValue.AUTO_LOCK;
            case deletePasscode:
                return FeatureValue.PASSCODE_WITH_DELETE_FUNCTION;
            case managePasscode:
                return FeatureValue.MODIFY_PASSCODE_FUNCTION;
            case locking:
                return FeatureValue.MANUAL_LOCK;
            case passcodeVisible:
                return FeatureValue.PASSWORD_DISPLAY_OR_HIDE;
            case gatewayUnlock:
                return FeatureValue.GATEWAY_UNLOCK;
            case lockFreeze:
                return FeatureValue.FREEZE_LOCK;
            case cyclePassword:
                return FeatureValue.CYCLIC_PASSWORD;
            case unlockSwicth:
                return FeatureValue.CONFIG_GATEWAY_UNLOCK;
            case audioSwitch:
                return FeatureValue.AUDIO_MANAGEMENT;
            case nbIoT:
                return FeatureValue.NB_LOCK;
            case getAdminPasscode:
                return FeatureValue.GET_ADMIN_CODE;
            case hotelCard:
                return FeatureValue.HOTEL_LOCK;
            case noClock:
                return FeatureValue.LOCK_NO_CLOCK_CHIP;
            case noBroadcastInNormal:
                return FeatureValue.CAN_NOT_CLICK_UNLOCK;
            case passageMode:
                return FeatureValue.PASSAGE_MODE;
            case turnOffAutoLock:
                return FeatureValue.PASSAGE_MODE_AND_AUTO_LOCK_AND_CAN_CLOSE;
            case wirelessKeypad:
                return FeatureValue.WIRELESS_KEYBOARD;
            case light:
                return FeatureValue.LAMP;
            case tamperAlert:
                return FeatureValue.TAMPER_ALERT;
            case resetButton:
                return FeatureValue.RESET_BUTTON;
            case privacyLock:
                return FeatureValue.PRIVACY_LOCK;
            case deadLock:
                return FeatureValue.DEAD_LOCK;
            case cyclicCardOrFingerprint:
                return FeatureValue.CYCLIC_IC_OR_FINGER_PRINT;
            case fingerVein:
                return FeatureValue.FINGER_VEIN;
            case ble5G:
                return FeatureValue.TELINK_CHIP;
            case nbAwake:
                return FeatureValue.NB_ACTIVITE_CONFIGURATION;
            case recoverCyclePasscode:
                return FeatureValue.CYCLIC_PASSCODE_CAN_RECOVERY;
            case wirelessKeyFob:
                return FeatureValue.REMOTE;
            case getAccessoryElectricQuantity:
                return FeatureValue.ACCESSORY_BATTERY;
            case soundVolumeAndLanguageSetting:
                return FeatureValue.SOUND_VOLUME_AND_LANGUAGE_SETTING;
            case qrCode:
                return FeatureValue.QR_CODE;
            case doorSensorState:
                return FeatureValue.DOOR_SENSOR;
            case passageModeAutoUnlockSetting:
                return FeatureValue.PASSAGE_MODE_AUTO_UNLOCK_SETTING;
            case doorSensor:
                return FeatureValue.WIRELESS_DOOR_SENSOR;
            case doorSensorAlert:
                return FeatureValue.DOOR_OPEN_ALARM;
            case sensitivity:
                return FeatureValue.SENSITIVITY;
            case face:
                return FeatureValue.FACE_3D;
            case cpuCard:
                return FeatureValue.CPU_CARD;
            case wifiLock:
                return FeatureValue.WIFI_LOCK;
            case wifiLockStaticIP:
                return FeatureValue.WIFI_LOCK_SUPPORT_STATIC_IP;
            case passcodeKeyNumber:
                return FeatureValue.INCOMPLETE_PASSCODE;
            case doubleAuth:
                return FeatureValue.SUPPORT_DOUBLE_CHECK;
            case authorizedUnlock:
                return FeatureValue.APP_AUTH_UNLOCK;
            case gatewayAuthorizedUnlock:
                return FeatureValue.GATEWAY_AUTH_UNLOCK;
            case noEkeyUnlock:
                return FeatureValue.DO_NOT_SUPPORT_APP_AND_GATEWAY_UNLOCK;
            case xiongMaiCamera:
                return FeatureValue.SUPPORT_XM;
            case zhiAnPhotoFace:
                return FeatureValue.ZHI_AN_FACE_DELIVERY;
            case palmVein:
                return FeatureValue.PALM_VEIN;
            case resetLockByCode:
                return FeatureValue.RESET_LOCK_BY_CODE;
            default:
                return -1;
        }
//        int supportFunction = index;
//        if (supportFunction > 48) {
//            supportFunction += 9;
//        } else if (supportFunction > 46) {
//            supportFunction += 8;
//        } else if (supportFunction == 46) {
//            supportFunction += 7;
//        } else if (supportFunction > 30) {
//            supportFunction += 6;
//        } else if (supportFunction > 29) {
//            supportFunction += 4;
//        } else if (supportFunction > 28) {
//            supportFunction += 3;
//        } else if (supportFunction > 15) {
//            supportFunction += 2;
//        } else if (supportFunction > 5) {
//            supportFunction += 1;
//        }
//        return supportFunction;
    }
}
