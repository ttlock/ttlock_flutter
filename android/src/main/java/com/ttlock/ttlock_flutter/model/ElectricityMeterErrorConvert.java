package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError;

public class ElectricityMeterErrorConvert {
    public static int bluetoothPowerOff = 0;

    public static int convert(ElectricMeterError electricMeterError) {
        int errorCode = 4;
        switch (electricMeterError) {
            case METER_NO_RESPONSE:
                return 2;
            case NET_ERROR:
                return 3;
            case REQUEST_ERROR:
                if (electricMeterError.getSubCode() == -5014) {
                    return 5;
                }
                return 4;
            case ELECTRIC_METER_CONNECT_FAIL:
                return 1;
            default:
                break;
        }
        return errorCode;
    }
}
