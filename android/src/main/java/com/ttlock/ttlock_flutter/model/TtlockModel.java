package com.ttlock.ttlock_flutter.model;

import android.text.TextUtils;

import com.google.gson.reflect.TypeToken;
import com.ttlock.bl.sdk.constant.ControlAction;
import com.ttlock.bl.sdk.entity.NBAwakeMode;
import com.ttlock.bl.sdk.entity.NBAwakeTime;
import com.ttlock.bl.sdk.util.GsonUtil;
import com.ttlock.bl.sdk.util.LogUtil;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by TTLock on 2020/8/24.
 */
public class TtlockModel {

    public static final int CONTROL_ACTION_UNLOCK = 0;
    public static final int CONTROL_ACTION_LOCK = 1;

    //参数
    public String lockData;
    public int controlAction;
    public String passcode;
    public String passcodeOrigin;
    public String passcodeNew;
    public long startDate;
    public long endDate;

    // 0、null - 读取最近的操作记录,  1-读取锁内存中的全部操作记录
    public int logType;
    public String records;

    // 1-每周  2-每月
    public int passageModeType;

    public ArrayList<Integer> weekly;
    public ArrayList<Integer> monthly;

    public String wifiName;
    public String wifiPassword;

    public String ipSettingJsonStr;

/*************      返回值     ****************/


    /**
     * //蓝牙状态
     */
    public int state;
    //蓝牙扫描状态 0-未开启扫描  1-扫描中
    public int scanState;

    public int specialValue;
    public Long lockTime;
    public int uniqueId;
    public int electricQuantity;
    public String lockName;
    public String lockMac;
    public boolean isInited;
    public boolean isAllowUnlock;
    public String lockVersion;
    // 0-锁住  1-解锁  2-未知 3-解锁（车位锁）
    public int lockSwitchState;
    public int rssi;
    public int oneMeterRssi;//todo:
    public long timestamp;
    public boolean isOn;


    public String passcodeInfo;
    //添加指纹时候 剩余手指按压次数
    public int currentCount;
    //添加指纹时候 剩余手指按压次数
    public int totalCount;
    //指纹码
    public String fingerprintNumber;
    public String cardNumber;
//    @property (nonatomic, strong) NSString *passageModes;

    //最大可设置自动闭锁时间
    public int maxTime;
    //最小可设置自动闭锁时间
    public int minTime;
    //当前自动闭锁时间
    public int currentTime;

    //管理员密码
    public String adminPasscode;
    public String erasePasscode;

    /**
     * ttlock switch config type
     */
    public int lockConfig;
    public int feature;
    public boolean isSupportFeature;

    public String cycleJsonList;

    public boolean isSupport;
    public int supportFunction;


    public String floors;
    public int liftWorkActiveType;
    public int powerSaverType;
    public String nbAwakeModes;
    public String clientPara;
    public String hotelInfo;
    public int buildingNumber;
    public int floorNumber;
    public String sector;
    public String nbAwakeTimeList;

    public String passcodeListString;
    public String cardListString;
    public String fingerprintListString;

    public String ip;
    public String port;

    public int cycleType;

    public int type;

    public int soundVolumeType;

//    public String remoteMac;
    public String mac;

//    public String deviceMac;

    public int accessoryBattery;
    public long updateDate;

    public int alertTime;

    public int remoteAccessory;

    public int direction;
    public String resetCode;

    public String faceFeatureData;

    public String faceNumber;

    @Override
    public String toString() {
        return "TtlockModel{" +
                "lockData='" + lockData + '\'' +
                ", controlAction=" + controlAction +
                ", passcode='" + passcode + '\'' +
                ", passcodeOrigin='" + passcodeOrigin + '\'' +
                ", passcodeNew='" + passcodeNew + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", logType=" + logType +
                ", records='" + records + '\'' +
                ", passageModeType=" + passageModeType +
                ", weekly=" + weekly +
                ", monthly=" + monthly +
                ", state=" + state +
                ", scanState=" + scanState +
                ", specialValue=" + specialValue +
                ", lockTime=" + lockTime +
                ", uniqueId=" + uniqueId +
                ", electricQuantity=" + electricQuantity +
                ", lockName='" + lockName + '\'' +
                ", lockMac='" + lockMac + '\'' +
                ", isInited=" + isInited +
                ", isAllowUnlock=" + isAllowUnlock +
                ", lockVersion='" + lockVersion + '\'' +
                ", lockSwitchState=" + lockSwitchState +
                ", rssi=" + rssi +
                ", oneMeterRssi=" + oneMeterRssi +
                ", timestamp=" + timestamp +
                ", isOn=" + isOn +
                ", passcodeInfo='" + passcodeInfo + '\'' +
                ", currentCount=" + currentCount +
                ", totalCount=" + totalCount +
                ", fingerprintNumber='" + fingerprintNumber + '\'' +
                ", cardNumber='" + cardNumber + '\'' +
                ", maxTime=" + maxTime +
                ", minTime=" + minTime +
                ", currentTime=" + currentTime +
                ", adminPasscode='" + adminPasscode + '\'' +
                ", erasePasscode='" + erasePasscode + '\'' +
                ", lockConfig=" + lockConfig +
                ", feature=" + feature +
                ", isSupportFeature=" + isSupportFeature +
                ", cycleJsonList='" + cycleJsonList + '\'' +
                ", isSupport=" + isSupport +
                ", supportFunction=" + supportFunction +
                ", floors='" + floors + '\'' +
                ", liftWorkActiveType=" + liftWorkActiveType +
                ", powerSaverType=" + powerSaverType +
                ", nbAwakeModes='" + nbAwakeModes + '\'' +
                ", clientPara='" + clientPara + '\'' +
                ", hotelInfo='" + hotelInfo + '\'' +
                ", buildingNumber=" + buildingNumber +
                ", floorNumber=" + floorNumber +
                ", sector='" + sector + '\'' +
                ", nbAwakeTimeList='" + nbAwakeTimeList + '\'' +
                ", passcodeListString='" + passcodeListString + '\'' +
                ", cardListString='" + cardListString + '\'' +
                ", fingerprintListString='" + fingerprintListString + '\'' +
                '}';
    }

    public TtlockModel toObject(Map<String, Object> params) {
        Field[] fields = this.getClass().getDeclaredFields();
        try {
            for (int i = 0; i < fields.length; i++) {
                //设置是否允许访问，不是修改原来的访问权限修饰词。
                fields[i].setAccessible(true);
                if (params.get(fields[i].getName()) != null) {
                    LogUtil.d(fields[i].getName() + ":" + params.get(fields[i].getName()));
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
            for (int i = 0; i < fields.length; i++) {
                //设置是否允许访问，不是修改原来的访问权限修饰词。
                fields[i].setAccessible(true);
                if (fields[i].get(this) != null) {
                    hashMap.put(fields[i].getName(), fields[i].get(this));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hashMap;
    }

    public int getControlActionValue() {
        switch (controlAction) {
            case CONTROL_ACTION_UNLOCK:
                return ControlAction.UNLOCK;
            case CONTROL_ACTION_LOCK:
                return ControlAction.LOCK;
        }
        return ControlAction.UNLOCK;
    }

    public List<Integer> getFloorList() {
        List<Integer> floorList = new ArrayList<>();
        try {
            if (!TextUtils.isEmpty(floors)) {
                String[] floorArray = floors.split(",");
                for (int i=0;i<floorArray.length;i++) {
                    floorList.add(Integer.valueOf(floorArray[i]));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return floorList;
    }

    public List<NBAwakeMode> getNbAwakeModeList() {
        List<NBAwakeMode> nbAwakeModeList = new ArrayList<>();
        if (!TextUtils.isEmpty(nbAwakeModes)) {
            try {
                nbAwakeModeList = GsonUtil.toObject(nbAwakeModes, new TypeToken<ArrayList<NBAwakeMode>>(){});
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return nbAwakeModeList;
    }

    public void setNbAwakeModeList(List<NBAwakeMode> nbAwakeModeList) {
        List<Integer> awakeModeList = new ArrayList<>();
        if (nbAwakeModeList != null) {
            for (NBAwakeMode nbAwakeMode : nbAwakeModeList) {
                TTNbAwakeModeConverter ttNbAwakeModeConverter = TTNbAwakeModeConverter.native2Flutter(nbAwakeMode);
                awakeModeList.add(ttNbAwakeModeConverter.ordinal());
            }
        }
        this.nbAwakeModes = GsonUtil.toJson(awakeModeList);
    }

    public List<NBAwakeTime> getNbAwakeTimeList() {
        List<NBAwakeTime> nbAwakeTimes = new ArrayList<>();
        if (!TextUtils.isEmpty(nbAwakeTimeList)) {
            try {
                List<TTNbAwakeTimeModel> ttNbAwakeTimeModelList = GsonUtil.toObject(nbAwakeTimeList, new TypeToken<List<TTNbAwakeTimeModel>>(){});
                for (TTNbAwakeTimeModel ttNbAwakeTimeModel : ttNbAwakeTimeModelList) {
                    NBAwakeTime nbAwakeTime = new NBAwakeTime();
                    nbAwakeTime.setMinutes(ttNbAwakeTimeModel.getMinutes());
                    nbAwakeTime.setNbAwakeTimeType(TTNbAwakeTimeType.flutter2Native(ttNbAwakeTimeModel.getType()));
                    if (nbAwakeTime.getNbAwakeTimeType() != null) {
                        nbAwakeTimes.add(nbAwakeTime);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return nbAwakeTimes;
    }

    public void setNbAwakeTimeList(List<NBAwakeTime> nbAwakeTimeList) {
        List<TTNbAwakeTimeModel> ttNbAwakeTimeModelList = new ArrayList<>();
        if (nbAwakeTimeList != null) {
            for (NBAwakeTime nbAwakeTime : nbAwakeTimeList) {
                TTNbAwakeTimeModel ttNbAwakeTimeModel = new TTNbAwakeTimeModel();
                ttNbAwakeTimeModel.setMinutes(nbAwakeTime.getMinutes());
                ttNbAwakeTimeModel.setType(TTNbAwakeTimeType.native2Flutter(nbAwakeTime.getNbAwakeTimeType()));
            }
        }
        this.nbAwakeTimeList = GsonUtil.toJson(ttNbAwakeTimeModelList);
    }

}
