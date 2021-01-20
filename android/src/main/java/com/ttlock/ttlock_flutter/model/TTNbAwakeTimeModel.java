package com.ttlock.ttlock_flutter.model;

/**
 * Created by TTLock on 2021/1/14.
 */
public class TTNbAwakeTimeModel {
    private int type;//TTNbAwakeTimeType
    private int minutes;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getMinutes() {
        return minutes;
    }

    public void setMinutes(int minutes) {
        this.minutes = minutes;
    }
}
