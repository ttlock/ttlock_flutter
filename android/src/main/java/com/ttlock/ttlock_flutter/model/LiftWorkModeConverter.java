package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.entity.TTLiftWorkMode;

/**
 * Created by TTLock on 2021/1/13.
 */
public enum LiftWorkModeConverter {
    allFloors, specificFloors;

    public static TTLiftWorkMode flutter2Native(int index) {
        if (index < TTLiftWorkMode.class.getEnumConstants().length) {
            return flutter2Native(LiftWorkModeConverter.class.getEnumConstants()[index]);
        }
        return null;
    }

    public static TTLiftWorkMode flutter2Native(LiftWorkModeConverter liftWorkModeConverter) {
        switch (liftWorkModeConverter) {
            case allFloors:
                return TTLiftWorkMode.ActivateAllFloors;
            case specificFloors:
                return TTLiftWorkMode.ActivateSpecificFloors;
        }
        return null;
    }

}
