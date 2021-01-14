package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.entity.NBAwakeTimeType;

/**
 * Created by TTLock on 2021/1/14.
 */
public enum TTNbAwakeTimeType {
    point, interval;

    public static NBAwakeTimeType flutter2Native(int index) {
        if (index < TTNbAwakeTimeType.values().length) {
            return flutter2Native(TTNbAwakeTimeType.class.getEnumConstants()[index]);
        }
        return null;
    }

    public static NBAwakeTimeType flutter2Native(TTNbAwakeTimeType ttNbAwakeTimeType) {
        if (ttNbAwakeTimeType != null) {
            switch (ttNbAwakeTimeType) {
                case point:
                    return NBAwakeTimeType.TIME_POINT;
                case interval:
                    return NBAwakeTimeType.TIME_INTERVAL;
            }
        }
        return null;
    }

    public static int native2Flutter(NBAwakeTimeType nbAwakeTimeType) {
        if (nbAwakeTimeType != null) {
            switch (nbAwakeTimeType) {
                case TIME_POINT:
                    return point.ordinal();
                case TIME_INTERVAL:
                    interval.ordinal();
            }
        }
        return -1;
    }

}
