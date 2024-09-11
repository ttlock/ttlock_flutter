package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * Created by TTLock on 2020/8/21.
 */
public class TTDoorSensorCommand {
    public static final String COMMAND_START_SCAN_DOOR_SENSOR = "doorSensorStartScan";
    public static final String COMMAND_STOP_SCAN_DOOR_SENSOR = "doorSensorStopScan";
    public static final String COMMAND_INIT_DOOR_SENSOR = "doorSensorInit";

    public static boolean isDoorSensorCommand(String command) {
        Field[] fields = TTDoorSensorCommand.class.getDeclaredFields();
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
