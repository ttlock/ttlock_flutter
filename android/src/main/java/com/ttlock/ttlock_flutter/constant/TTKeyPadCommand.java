package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * Created by TTLock on 2020/8/21.
 */
public class TTKeyPadCommand {
    public static final String COMMAND_START_SCAN_KEY_PAD = "remoteKeypadStartScan";
    public static final String COMMAND_STOP_SCAN_KEY_PAD = "remoteKeypadStopScan";
    public static final String COMMAND_INIT_KEY_PAD = "remoteKeypadInit";

    public static final String COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD =
            "multifunctionalRemoteKeypadInit";
    public static final String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK =
            "multifunctionalRemoteKeypadDeleteLock";
    public static final String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK =
            "multifunctionalRemoteKeypadGetLocks";
    public static final String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT =
            "multifunctionalRemoteKeypadAddFingerprint";
    public static final String COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD =
            "multifunctionalRemoteKeypadAddCard";


    public static boolean isKeypadCommand(String command) {
        Field[] fields = TTKeyPadCommand.class.getDeclaredFields();
        try {
            for(int i = 0 ; i < fields.length ; i++) {
                if (fields[i].get(null).equals(command)) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
