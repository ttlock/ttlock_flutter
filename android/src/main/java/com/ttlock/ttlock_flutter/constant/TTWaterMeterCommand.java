package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

public class TTWaterMeterCommand {
    public static final String COMMAND_CONFIG_SERVER_WATER_METER =
            "waterMeterConfigServer";
    public static final String COMMAND_START_SCAN_WATER_METER = "waterMeterStartScan";
    public static final String COMMAND_STOP_SCAN_WATER_METER = "waterMeterStopScan";
    public static final String COMMAND_WATER_METER_CONNECT = "waterMeterConnect";
    public static final String COMMAND_WATER_METER_DISCONNECT = "waterMeterDisconnect";
    public static final String COMMAND_WATER_METER_INIT = "waterMeterInit";
    public static final String COMMAND_WATER_METER_DELETE = "waterMeterDelete";
    public static final String COMMAND_WATER_METER_SET_POWER_ON_OFF =
            "waterMeterSetPowerOnOff";
    public static final String COMMAND_WATER_METER_SET_REMAINING_M3 =
            "waterMeterSetRemainingM3";
    public static final String COMMAND_WATER_METER_CLEAR_REMAINING_M3 =
            "waterMeterClearRemainingM3";
    public static final String COMMAND_WATER_METER_READ_DATA = "waterMeterReadData";
    public static final String COMMAND_WATER_METER_SET_PAY_MODE = "waterMeterSetPayMode";
    public static final String COMMAND_WATER_METER_CHARGE = "waterMeterCharge";
    public static final String COMMAND_WATER_METER_SET_TOTAL_USAGE =
            "waterMeterSetTotalUsage";
    public static final String COMMAND_WATER_METER_GET_FEATURE_VALUE =
            "waterMeterGetFeatureValue";
    public static final String COMMAND_WATER_METER_ENTER_UPGRADE_MODE =
            "waterMeterEnterUpgradeMode";

    public static boolean isWaterMeterCommand(String command) {
        Field[] fields = TTWaterMeterCommand.class.getDeclaredFields();
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
