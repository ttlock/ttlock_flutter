package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.gateway.model.GatewayError;

/**
 * Created by TTLock on 2020/9/10.
 */
public enum GatewayErrorConverter {
    fail,
    wrongWifi,
    wrongWifiPassword,
    wrongCRC,
    wrongAeskey,
    notConnect,
    disconnect,
    failConfigRouter,
    failConfigServer,
    failConfigAccount,
    noSim,
    invalidCommand;

    public static int native2Flutter(GatewayError error) {
        switch (error) {
            case FAILED:
            case DATA_FORMAT_ERROR:
                return fail.ordinal();
            case BAD_WIFI_NAME:
                return wrongWifi.ordinal();
            case BAD_WIFI_PASSWORD:
                return wrongWifiPassword.ordinal();
            case FAILED_TO_CONFIGURE_ACCOUNT:
                return failConfigAccount.ordinal();
            case FAILED_TO_CONFIGURE_SERVER:
                return failConfigServer.ordinal();
            case FAILED_TO_CONFIGURE_ROUTER:
                return failConfigRouter.ordinal();
            case COMMUNICATION_DISCONNECTED:
                return disconnect.ordinal();
            case NO_SIM_CARD:
                return noSim.ordinal();
            case INVALID_COMMAND:
                return invalidCommand.ordinal();
        }
        return fail.ordinal();
    }
}
