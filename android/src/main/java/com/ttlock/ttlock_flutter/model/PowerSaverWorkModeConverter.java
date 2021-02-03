package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.entity.PowerSaverWorkMode;

/**
 * Created by TTLock on 2021/1/13.
 */
public enum PowerSaverWorkModeConverter {
    allCards, hotelCard, roomCard;

    public static PowerSaverWorkMode flutter2Native(int index) {
        if (index < PowerSaverWorkModeConverter.class.getEnumConstants().length) {
            return flutter2Native(PowerSaverWorkModeConverter.class.getEnumConstants()[index]);
        }
        return null;
    }

    public static PowerSaverWorkMode flutter2Native(PowerSaverWorkModeConverter powerSaverWorkModeConverter) {
        switch (powerSaverWorkModeConverter) {
            case allCards:
                return PowerSaverWorkMode.ALL_CARDS;
            case hotelCard:
                return PowerSaverWorkMode.HOTEL_CARD;
            case roomCard:
                return PowerSaverWorkMode.ROOM_CARD;
        }
        return null;
    }

}
