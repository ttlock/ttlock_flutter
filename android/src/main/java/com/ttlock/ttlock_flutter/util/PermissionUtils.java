package com.ttlock.ttlock_flutter.util;

import android.Manifest;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.os.Build;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.ttlock.bl.sdk.util.LogUtil;

import java.util.ArrayList;

public class PermissionUtils {

  public static final int PERMISSIONS_REQUEST_CODE = 1;

  private static final String[] scanConnectPermission = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT};
  private static final String[] locationPermission = {Manifest.permission.ACCESS_FINE_LOCATION};

  public static boolean isAndroid12OrOver() {
    if (getAndroidSDKVersion() >= 31) {
      return true;
    }
    return false;
  }

  public static int getAndroidSDKVersion() {
    int version = 0;
    try {
      version = Integer.valueOf(Build.VERSION.SDK_INT);
    } catch (NumberFormatException e) {
      e.printStackTrace();
    }
    return version;
  }

  public static boolean hasScanPermission(Activity activity) {
    if (isAndroid12OrOver()) {//android 12及以上 扫描权限  获取名称需要连接权限
      return hasPermission(activity, Manifest.permission.BLUETOOTH_SCAN) && hasPermission(activity, Manifest.permission.BLUETOOTH_CONNECT);
    } else {//以下 位置权限
      return hasPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION);
    }
  }

  public static boolean hasConnectPermission(Activity activity) {
    if (isAndroid12OrOver()) {//android 12及以上 需要连接权限
      return hasPermission(activity, Manifest.permission.BLUETOOTH_CONNECT);
    } else {//12以下的不需要
      return true;
    }
  }

  public static void doWithScanPermission(Activity activity, OnSuccessListener onSuccessListener) {
    if (hasScanPermission(activity)) {
        onSuccessListener.onSuccess(true);
    } else {
        onSuccessListener.onSuccess(false);
      LogUtil.d("no scan permission");
       ActivityCompat.requestPermissions(activity, isAndroid12OrOver() ? scanConnectPermission : locationPermission, PERMISSIONS_REQUEST_CODE);
    }
  }

  public static void doWithConnectPermission(Activity activity, OnSuccessListener onSuccessListener) {
    if (hasConnectPermission(activity)) {
      onSuccessListener.onSuccess(true);
    } else {
      onSuccessListener.onSuccess(false);
      LogUtil.d("no connect permission");
      ActivityCompat.requestPermissions(activity, new String[]{Manifest.permission.BLUETOOTH_CONNECT}, PERMISSIONS_REQUEST_CODE);
    }
  }

  public static boolean hasPermission(Activity activity, String permission) {
    return PackageManager.PERMISSION_GRANTED == ContextCompat.checkSelfPermission(activity, permission);
  }


}
