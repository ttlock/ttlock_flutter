package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * 电表命令常量，与 commands.dart 一致。
 */
public class TTElectricityMeterCommand {
    public static final String COMMAND_CONFIG_SERVER = "electricMeterConfigServer";
    public static final String COMMAND_START_SCAN = "electricMeterStartScan";
    public static final String COMMAND_STOP_SCAN = "electricMeterStopScan";
    public static final String COMMAND_CONNECT = "electricMeterConnect";
    public static final String COMMAND_DISCONNECT = "electricMeterDisconnect";
    public static final String COMMAND_INIT = "electricMeterInit";
    public static final String COMMAND_DELETE = "electricMeterDelete";
    public static final String COMMAND_SET_POWER_ON_OFF = "electricMeterSetPowerOnOff";
    public static final String COMMAND_SET_REMAINDER_KWH = "electricMeterSetRemainderKwh";
    public static final String COMMAND_CLEAR_REMAINDER_KWH = "electricMeterClearRemainderKwh";
    public static final String COMMAND_READ_DATA = "electricMeterReadData";
    public static final String COMMAND_SET_PAY_MODE = "electricMeterSetPayMode";
    public static final String COMMAND_CHARGE = "electricMeterCharge";
    public static final String COMMAND_SET_MAX_POWER = "electricMeterSetMaxPower";
    public static final String COMMAND_GET_FEATURE_VALUE = "electricMeterGetFeatureValue";
    public static final String COMMAND_IS_SUPPORT_FUNCTION = "electricMeterIsSupportFunction";

    public static boolean isElectricityMeterCommand(String command) {
        Field[] fields = TTElectricityMeterCommand.class.getDeclaredFields();
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
