package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.watermeter.model.WaterMeterError;

public class WaterMeterErrorConvert {
    public static int bluetoothPowerOff = 0;
    public static int convert(WaterMeterError electricMeterError) {
        //对应flutter层serverError
        int errorCode = 4;
        switch (electricMeterError) {
            case METER_NO_RESPONSE:
                //disconnect
                return 2;
            case NET_ERROR:
                //netError
                return 3;
            case REQUEST_ERROR:
                //serverError
                if (electricMeterError.getSubCode() == -5014) {
                    //flutter 对应 meterExistedInServer
                    return 5;
                }
                return 4;
            case WATER_METER_CONNECT_FAIL:
                return 1;
        }

        return errorCode;
    }
}
