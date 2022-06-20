package com.ttlock.ttlock_flutter.model;

/**
 * Created by TTLock on 2020/9/14.
 */
public enum TTLockFunction {
    passcode,
    icCard,
    fingerprint,
    wristband,
    autoLock,
    deletePasscode,//5
    // 6
    managePasscode,//6
    locking,
    passcodeVisible,
    gatewayUnlock,
    lockFreeze,
    cyclePassword,
    doorSensor,
    unlockSwicth,
    audioSwitch,
    nbIoT,//15
    //17
    getAdminPasscode,//16
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
    privacyLock,//28
    //31
    deadLock,//29
    //33
    cyclicCardOrFingerprint,//30
    //35
    //36
    fingerVein,
    ble5G,
    nbAwake,
    recoverCyclePasscode,
    wirelessKeyFob,
    getAccessoryElectricQuantity,
    sound_volume_and_language_setting,
    qr_code,
    door_sensor,
    passage_mode_auto_unlock_setting,
    fingerprint_distribution,
    zhong_zheng,
    syno,
    wireless_door_sensor,
    door_not_lock_alarm, // 45
    //52
    face_3d, //46
    //54
    cpu_card,
    wifi_lock, //48
    //57
    wifi_lock_ip_setting;// 49

    public static int flutter2Native(int index) {
        int supportFunction = index;
        if (supportFunction > 48) {
            supportFunction += 9;
        } else if (supportFunction > 46) {
            supportFunction += 8;
        } else if (supportFunction == 46) {
            supportFunction += 7;
        } else if (supportFunction > 30) {
            supportFunction += 6;
        } else if (supportFunction > 29) {
            supportFunction += 4;
        } else if (supportFunction > 28) {
            supportFunction += 3;
        } else if (supportFunction > 15) {
            supportFunction += 2;
        } else if (supportFunction > 5) {
            supportFunction += 1;
        }
        return supportFunction;
    }
}
