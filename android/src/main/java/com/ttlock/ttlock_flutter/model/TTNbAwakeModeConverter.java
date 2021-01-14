package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.entity.NBAwakeMode;

/**
 * Created by TTLock on 2021/1/13.
 */
public enum TTNbAwakeModeConverter {
    keypad, card, fingerprint;

    public static NBAwakeMode flutter2Native(int index) {
        if (index < NBAwakeMode.class.getEnumConstants().length) {
            return flutter2Native(TTNbAwakeModeConverter.class.getEnumConstants()[index]);
        }
        return null;
    }

    public static NBAwakeMode flutter2Native(TTNbAwakeModeConverter converter) {
        switch (converter) {
            case keypad:
                return NBAwakeMode.KEYPAD;
            case card:
                return NBAwakeMode.CARD;
            case fingerprint:
                return NBAwakeMode.FINGERPRINT;
        }
        return null;
    }

    public static TTNbAwakeModeConverter native2Flutter(NBAwakeMode nbAwakeMode) {
        switch (nbAwakeMode) {
            case KEYPAD:
                return keypad;
            case CARD:
                return card;
            case FINGERPRINT:
                return fingerprint;
            default:
                return null;
        }
    }

}
