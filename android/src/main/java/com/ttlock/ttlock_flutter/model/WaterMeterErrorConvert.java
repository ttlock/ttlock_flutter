package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.watermeter.model.WaterMeterError;

public class WaterMeterErrorConvert {
    public static int bluetoothPowerOff = 0;

    public static int convert(WaterMeterError waterMeterError) {
        int errorCode = 4;
        switch (waterMeterError) {
            case METER_NO_RESPONSE:
                return 2;
            case NET_ERROR:
                return 3;
            case REQUEST_ERROR:
                if (waterMeterError.getSubCode() == -5014) {
                    return 5;
                }
                return 4;
            case WATER_METER_CONNECT_FAIL:
                return 1;
            default:
                break;
        }
        return errorCode;
    }
}
