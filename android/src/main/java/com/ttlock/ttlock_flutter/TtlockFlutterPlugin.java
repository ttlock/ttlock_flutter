package com.ttlock.ttlock_flutter;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ttlock.bl.sdk.api.TTLockClient;
import com.ttlock.bl.sdk.callback.ControlLockCallback;
import com.ttlock.bl.sdk.callback.InitLockCallback;
import com.ttlock.bl.sdk.callback.ScanLockCallback;
import com.ttlock.bl.sdk.entity.ControlLockResult;
import com.ttlock.bl.sdk.entity.ExtendedBluetoothDevice;
import com.ttlock.bl.sdk.entity.LockError;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;

// Note: Many unused imports were removed for clarity. The core logic is what matters.

public class TtlockFlutterPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    private MethodChannel channel;
    private static Context context;
    private static Activity activity;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        context = flutterPluginBinding.getApplicationContext();
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "ttlock_flutter");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        // First, check for our new custom command. This is the fix.
        if (call.method.equals("prepareBTService")) {
            prepareBTService(result);
            return; // Stop here after handling our command
        }

        // This is the original logic from the package for other commands.
        // For simplicity in this example, we'll focus on the core commands.
        // The full file will have all the other else-if blocks.
        if (call.method.equals("startScanLock")) {
             TTLockClient.getDefault().startScanLock(new ScanLockCallback() {
                @Override
                public void onScanLockSuccess(ExtendedBluetoothDevice device) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("lockMac", device.getAddress());
                    map.put("lockName", device.getName());
                    // Add other scan data as needed
                    channel.invokeMethod("onScanLock", map);
                }
                @Override
                public void onFail(LockError error) {
                     channel.invokeMethod("onScanLockFail", error.getDescription());
                }
            });
        } else if (call.method.equals("stopScanLock")) {
            TTLockClient.getDefault().stopScanLock();
            result.success(null);
        } else if (call.method.equals("controlLock")) {
             String lockData = call.argument("lockData");
             TTLockClient.getDefault().controlLock(lockData, new ControlLockCallback() {
                @Override
                public void onControlLockSuccess(ControlLockResult controlLockResult) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("batteryLevel", controlLockResult.battery);
                    // Add other result data as needed
                    result.success(map);
                }
                @Override
                public void onFail(LockError error) {
                    result.error(String.valueOf(error.getErrorCode()), error.getErrorMsg(), null);
                }
            });
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    // Other ActivityAware methods (onDetached, onReattached, etc.) go here...
    @Override
    public void onDetachedFromActivity() { activity = null; }
    @Override
    public void onDetachedFromActivityForConfigChanges() { onDetachedFromActivity(); }
    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) { onAttachedToActivity(binding); }


    // This is the new function we are adding. It's the "light switch".
    private void prepareBTService(Result result) {
        TTLockClient.getDefault().prepareBTService(context);
        result.success(null);
    }
}
