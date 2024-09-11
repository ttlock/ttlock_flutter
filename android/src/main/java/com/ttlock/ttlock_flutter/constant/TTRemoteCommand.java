package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * Created by TTLock on 2020/8/21.
 */
public class TTRemoteCommand {
    public static final String COMMAND_START_SCAN_REMOTE = "startScanRemoteKey";
    public static final String COMMAND_STOP_SCAN_REMOTE = "stopScanRemoteKey";
    public static final String COMMAND_INIT_REMOTE = "initRemoteKey";

    public static boolean isRemoteCommand(String command) {
        Field[] fields = TTRemoteCommand.class.getDeclaredFields();
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
