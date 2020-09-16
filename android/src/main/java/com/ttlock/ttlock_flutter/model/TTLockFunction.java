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
    deletePasscode,
    // 6
    managePasscode,
    locking,
    passcodeVisible,
    gatewayUnlock,
    lockFreeze,
    cyclePassword,
    doorSensor,
    unlockSwicth,
    audioSwitch,
    nbIoT,
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
    privacyLock,
    //31
    deadLock,
    //33
    cyclicCardOrFingerprint;

    public static int flutter2Native(int index) {
        int supportFunction = index;
        if (supportFunction > 28) {
            supportFunction += 4;
        } else if (supportFunction > 26) {
            supportFunction += 3;
        } else if (supportFunction > 16) {
            supportFunction += 2;
        } else if (supportFunction > 5) {
            supportFunction += 1;
        }
        return supportFunction;
    }
}
