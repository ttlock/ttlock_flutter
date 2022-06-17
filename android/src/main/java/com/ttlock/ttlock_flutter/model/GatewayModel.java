package com.ttlock.ttlock_flutter.model;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by TTLock on 2020/9/10.
 */
public class GatewayModel {
    public String mac;
    public String wifi;
    public String wifiPassword;
    public String gatewayName;
    public int ttlockUid;
    public String ttlockLoginPassword;
    public String serverIp;
    public String serverPort;
    public int type;
    public int companyId;
    public int branchId;
    
    public String ipSettingJsonStr;

    public GatewayModel toObject(Map<String, Object> params) {
        if (params == null) {
            return this;
        }
        Field[] fields = this.getClass().getDeclaredFields();
        try {
            for(int i = 0 ; i < fields.length ; i++) {
                //设置是否允许访问，不是修改原来的访问权限修饰词。
                fields[i].setAccessible(true);
                if (params.get(fields[i].getName()) != null) {
                    fields[i].set(this, params.get(fields[i].getName()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this;
    }

    public Map<String, Object> toMap() {
        HashMap<String, Object> hashMap = new HashMap<>();
        Field[] fields = this.getClass().getDeclaredFields();
        try {
            for(int i = 0 ; i < fields.length ; i++) {
                //设置是否允许访问，不是修改原来的访问权限修饰词。
                fields[i].setAccessible(true);
                hashMap.put(fields[i].getName(), fields[i].get(this));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hashMap;
    }
}
