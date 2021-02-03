package com.ttlock.ttlock_flutter.model;

import android.text.TextUtils;

/**
 * Created by TTLock on 2021/1/25.
 */
public class CommandObj {
    private String command;
    private TtlockModel ttlockModel;

    public CommandObj() {
    }

    public CommandObj(String command, TtlockModel ttlockModel) {
        this.command = command;
        this.ttlockModel = ttlockModel;
    }

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = command;
    }

    public TtlockModel getTtlockModel() {
        return ttlockModel;
    }

    public void setTtlockModel(TtlockModel ttlockModel) {
        this.ttlockModel = ttlockModel;
    }

    public boolean isValid() {
        if (!TextUtils.isEmpty(command) && ttlockModel != null) {
            return true;
        }
        return false;
    }

    @Override
    public String toString() {
        return "CommandObj{" +
                "command='" + command + '\'' +
                ", ttlockModel=" + ttlockModel +
                '}';
    }
}
