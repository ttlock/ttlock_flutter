package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * 独立门磁（Standalone Door Sensor）命令常量，与 WiFi 门磁（Wireless Door Sensor）区分。
 */
public class TTStandaloneDoorSensorCommand {
    public static final String COMMAND_START_SCAN_STANDALONE_DOOR_SENSOR = "standaloneDoorSensorStartScan";
    public static final String COMMAND_STOP_SCAN_STANDALONE_DOOR_SENSOR = "standaloneDoorSensorStopScan";
    public static final String COMMAND_INIT_STANDALONE_DOOR_SENSOR = "standaloneDoorSensorInit";
    public static final String COMMAND_STANDALONE_DOOR_GET_FEATURE_VALUE = "standaloneDoorGetFeatureValue";
    public static final String COMMAND_STANDALONE_DOOR_SUPPORT_FUNCTION = "standaloneDoorIsSupportFunction";

    public static boolean isStandaloneDoorSensorCommand(String command) {
        Field[] fields = TTStandaloneDoorSensorCommand.class.getDeclaredFields();
        try {
            for (int i = 0; i < fields.length; i++) {
                if (fields[i].getType() == String.class && fields[i].get(null) != null
                        && fields[i].get(null).equals(command)) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
