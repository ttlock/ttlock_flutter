package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * 水表命令常量，与 commands.dart 一致。
 */
public class TTWaterMeterCommand {
    public static final String COMMAND_CONFIG_SERVER = "waterMeterConfigServer";
    public static final String COMMAND_START_SCAN = "waterMeterStartScan";
    public static final String COMMAND_STOP_SCAN = "waterMeterStopScan";
    public static final String COMMAND_CONNECT = "waterMeterConnect";
    public static final String COMMAND_DISCONNECT = "waterMeterDisconnect";
    public static final String COMMAND_INIT = "waterMeterInit";
    public static final String COMMAND_DELETE = "waterMeterDelete";
    public static final String COMMAND_SET_POWER_ON_OFF = "waterMeterSetPowerOnOff";
    public static final String COMMAND_SET_REMAINDER_M3 = "waterMeterSetRemainderM3";
    public static final String COMMAND_CLEAR_REMAINDER_M3 = "waterMeterClearRemainderM3";
    public static final String COMMAND_READ_DATA = "waterMeterReadData";
    public static final String COMMAND_SET_PAY_MODE = "waterMeterSetPayMode";
    public static final String COMMAND_CHARGE = "waterMeterCharge";
    public static final String COMMAND_SET_TOTAL_USAGE = "waterMeterSetTotalUsage";
    public static final String COMMAND_GET_FEATURE_VALUE = "waterMeterGetFeatureValue";
    public static final String COMMAND_GET_DEVICE_INFO = "waterMeterGetDeviceInfo";
    public static final String COMMAND_IS_SUPPORT_FUNCTION = "waterMeterIsSupportFunction";
    public static final String COMMAND_CONFIG_APN = "waterMeterConfigApn";
    public static final String COMMAND_CONFIG_METER_SERVER = "waterMeterConfigMeterServer";
    public static final String COMMAND_RESET = "waterMeterReset";

    public static boolean isWaterMeterCommand(String command) {
        Field[] fields = TTWaterMeterCommand.class.getDeclaredFields();
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
