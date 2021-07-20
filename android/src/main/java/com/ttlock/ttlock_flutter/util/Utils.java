package com.ttlock.ttlock_flutter.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

public class Utils {

    public static Map<String, Object> object2Map(Object model) {
        HashMap<String, Object> hashMap = new HashMap<>();
        if (model == null) {
            return hashMap;
        }
        Field[] fields = model.getClass().getDeclaredFields();
        try {
            for (int i = 0; i < fields.length; i++) {
                //设置是否允许访问，不是修改原来的访问权限修饰词。
                fields[i].setAccessible(true);
                if (fields[i].get(model) != null) {
                    hashMap.put(fields[i].getName(), fields[i].get(model));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hashMap;
    }

}
