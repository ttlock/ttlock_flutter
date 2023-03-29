package com.ttlock.ttlock_flutter.model;

import com.ttlock.bl.sdk.entity.PowerSaverWorkMode;
import com.ttlock.bl.sdk.entity.SoundVolume;
import com.ttlock.bl.sdk.gateway.model.GatewayError;

public enum SoundVolumeConverter {
    firstLevel,
    secondLevel,
    thirdLevel,
    fouthLevel,
    fifthLevel,
    off,
    on;

    public static SoundVolume flutter2Native(int index) {
        if (index < SoundVolumeConverter.class.getEnumConstants().length) {
            return flutter2Native(SoundVolumeConverter.class.getEnumConstants()[index]);
        }
        return null;
    }

    public static SoundVolume flutter2Native(SoundVolumeConverter soundVolumeConverter) {
        switch (soundVolumeConverter) {
            case firstLevel:
                return SoundVolume.FIRST_LEVEL;
            case secondLevel:
                return SoundVolume.SECOND_LEVEL;
            case thirdLevel:
                return SoundVolume.THIRD_LEVEL;
            case fouthLevel:
                return SoundVolume.FOUTH_LEVEL;
            case fifthLevel:
                return SoundVolume.FIFTH_LEVEL;
            case off:
                return SoundVolume.OFF;
            case on:
                return SoundVolume.ON;
        }
        return null;
    }

    public static int native2Flutter(SoundVolume soundVolume) {
        switch (soundVolume) {
            case FIRST_LEVEL:
                return firstLevel.ordinal();
            case SECOND_LEVEL:
                return secondLevel.ordinal();
            case THIRD_LEVEL:
                return thirdLevel.ordinal();
            case FOUTH_LEVEL:
                return fouthLevel.ordinal();
            case FIFTH_LEVEL:
                return fifthLevel.ordinal();
        }
        return off.ordinal();
    }

}
