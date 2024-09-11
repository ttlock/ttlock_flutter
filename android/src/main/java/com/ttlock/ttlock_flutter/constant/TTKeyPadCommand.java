package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * Created by TTLock on 2020/8/21.
 */
public class TTKeyPadCommand {
    public static final String COMMAND_START_SCAN_KEY_PAD = "remoteKeypadStartScan";
    public static final String COMMAND_STOP_SCAN_KEY_PAD = "remoteKeypadStopScan";
    public static final String COMMAND_INIT_KEY_PAD = "remoteKeypadInit";

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
