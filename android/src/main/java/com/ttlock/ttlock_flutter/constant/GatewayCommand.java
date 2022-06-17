package com.ttlock.ttlock_flutter.constant;

import java.lang.reflect.Field;

/**
 * Created by TTLock on 2020/9/10.
 */
public class GatewayCommand {

    public static final String COMMAND_START_SCAN_GATEWAY = "startScanGateway";
    public static final String COMMAND_STOP_SCAN_GATEWAY = "stopScanGateway";
    public static final String COMMAND_CONNECT_GATEWAY = "connectGateway";
    public static final String COMMAND_DISCONNECT_GATEWAY = "disconnectGateway";
    public static final String COMMAND_GET_SURROUND_WIFI = "getSurroundWifi";
    public static final String COMMAND_INIT_GATEWAY = "initGateway";
    public static final String COMMAND_UPGRADE_GATEWAY = "upgradeGateway";

    public static final String COMMAND_CONFIG_IP = "gatewayConfigIp";

    public static boolean isGatewayCommand(String command) {
        Field[] fields = GatewayCommand.class.getDeclaredFields();
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
