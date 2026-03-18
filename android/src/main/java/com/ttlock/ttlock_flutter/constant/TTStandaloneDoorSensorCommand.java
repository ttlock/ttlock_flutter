package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * 独立门磁（Standalone Door Sensor）命令常量，与 commands.dart 一致。
 */
public class TTStandaloneDoorSensorCommand {
    public static final String COMMAND_START_SCAN = "standaloneDoorSensorStartScan";
    public static final String COMMAND_STOP_SCAN = "standaloneDoorSensorStopScan";
    public static final String COMMAND_INIT = "standaloneDoorSensorInit";
    public static final String COMMAND_GET_FEATURE_VALUE = "standaloneDoorGetFeatureValue";
    public static final String COMMAND_IS_SUPPORT_FUNCTION = "standaloneDoorIsSupportFunction";

    public static boolean isStandaloneDoorSensorCommand(String command) {
        Field[] fields = TTStandaloneDoorSensorCommand.class.getDeclaredFields();
        try {
            for (Field field : fields) {
                if (field.getType() == String.class && field.get(null) != null
                        && field.get(null).equals(command)) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
