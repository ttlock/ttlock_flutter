package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

public class TTElectricityMeterCommand {
    public static final String COMMAND_CONFIG_SERVER_ELECTRIC_METER =
            "electricMeterConfigServer";
    public static final String COMMAND_START_SCAN_ELECTRIC_METER =
            "electricMeterStartScan";
    public static final String COMMAND_STOP_SCAN_ELECTRIC_METER =
            "electricMeterStopScan";
    public static final String COMMAND_ELECTRIC_METER_CONNECT = "electricMeterConnect";
    public static final String COMMAND_ELECTRIC_METER_DISCONNECT =
            "electricMeterDisconnect";
    public static final String COMMAND_ELECTRIC_METER_INIT = "electricMeterInit";
    public static final String COMMAND_ELECTRIC_METER_DELETE = "electricMeterDelete";
    public static final String COMMAND_ELECTRIC_METER_SET_POWER_ON_OFF =
            "electricMeterSetPowerOnOff";
    public static final String COMMAND_ELECTRIC_METER_SET_REMAINING_ELECTRICITY =
            "electricMeterSetRemainingElectricity";
    public static final String COMMAND_ELECTRIC_METER_CLEAR_REMAINING_ELECTRICITY =
            "electricMeterClearRemainingElectricity";
    public static final String COMMAND_ELECTRIC_METER_READ_DATA =
            "electricMeterReadData";
    public static final String COMMAND_ELECTRIC_METER_SET_PAY_MODE =
            "electricMeterSetPayMode";
    public static final String COMMAND_ELECTRIC_METER_CHARG = "electricMeterCharg";
    public static final String COMMAND_ELECTRIC_METER_SET_MAX_POWER =
            "electricMeterSetMaxPower";
    public static final String COMMAND_ELECTRIC_METER_GET_FEATURE_VALUE =
            "electricMeterGetFeatureValue";
    public static final String COMMAND_ELECTRIC_METER_ENTER_UPGRADE_MODE =
            "electricMeterEnterUpgradeMode";


    public static boolean isElectricityMeterCommand(String command) {
        Field[] fields = TTElectricityMeterCommand.class.getDeclaredFields();
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
