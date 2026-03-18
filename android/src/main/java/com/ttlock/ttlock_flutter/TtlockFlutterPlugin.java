package com.ttlock.ttlock_flutter;

import android.Manifest;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ttlock.bl.sdk.api.ExtendedBluetoothDevice;
import com.ttlock.bl.sdk.api.TTLockClient;
import com.ttlock.bl.sdk.callback.ActivateLiftFloorsCallback;
import com.ttlock.bl.sdk.callback.AddDoorSensorCallback;
import com.ttlock.bl.sdk.callback.AddFaceCallback;
import com.ttlock.bl.sdk.callback.AddFingerprintCallback;
import com.ttlock.bl.sdk.callback.AddICCardCallback;
import com.ttlock.bl.sdk.callback.AddRemoteCallback;
import com.ttlock.bl.sdk.callback.ClearAllFingerprintCallback;
import com.ttlock.bl.sdk.callback.ClearAllICCardCallback;
import com.ttlock.bl.sdk.callback.ClearFaceCallback;
import com.ttlock.bl.sdk.callback.ClearPassageModeCallback;
import com.ttlock.bl.sdk.callback.ClearRemoteCallback;
import com.ttlock.bl.sdk.callback.ConfigServerCallback;
import com.ttlock.bl.sdk.callback.ConfigWifiCallback;
import com.ttlock.bl.sdk.callback.ControlLockCallback;
import com.ttlock.bl.sdk.callback.CreateCustomPasscodeCallback;
import com.ttlock.bl.sdk.callback.DeleteDoorSensorCallback;
import com.ttlock.bl.sdk.callback.DeleteFaceCallback;
import com.ttlock.bl.sdk.callback.DeleteFingerprintCallback;
import com.ttlock.bl.sdk.callback.DeleteICCardCallback;
import com.ttlock.bl.sdk.callback.DeletePasscodeCallback;
import com.ttlock.bl.sdk.callback.DeleteRemoteCallback;
import com.ttlock.bl.sdk.callback.GetAccessoryBatteryLevelCallback;
import com.ttlock.bl.sdk.callback.GetAdminPasscodeCallback;
import com.ttlock.bl.sdk.callback.GetAllValidFingerprintCallback;
import com.ttlock.bl.sdk.callback.GetAllValidICCardCallback;
import com.ttlock.bl.sdk.callback.GetAllValidPasscodeCallback;
import com.ttlock.bl.sdk.callback.GetAutoLockingPeriodCallback;
import com.ttlock.bl.sdk.callback.GetBatteryLevelCallback;
import com.ttlock.bl.sdk.callback.GetLockConfigCallback;
import com.ttlock.bl.sdk.callback.GetLockSoundWithSoundVolumeCallback;
import com.ttlock.bl.sdk.callback.GetLockStatusCallback;
import com.ttlock.bl.sdk.callback.GetLockSystemInfoCallback;
import com.ttlock.bl.sdk.callback.GetLockTimeCallback;
import com.ttlock.bl.sdk.callback.GetLockVersionCallback;
import com.ttlock.bl.sdk.callback.GetNBAwakeModesCallback;
import com.ttlock.bl.sdk.callback.GetNBAwakeTimesCallback;
import com.ttlock.bl.sdk.callback.GetOperationLogCallback;
import com.ttlock.bl.sdk.callback.GetRemoteUnlockStateCallback;
import com.ttlock.bl.sdk.callback.GetUnlockDirectionCallback;
import com.ttlock.bl.sdk.callback.GetWifiInfoCallback;
import com.ttlock.bl.sdk.callback.InitLockCallback;
import com.ttlock.bl.sdk.callback.ModifyAdminPasscodeCallback;
import com.ttlock.bl.sdk.callback.ModifyFacePeriodCallback;
import com.ttlock.bl.sdk.callback.ModifyFingerprintPeriodCallback;
import com.ttlock.bl.sdk.callback.ModifyICCardPeriodCallback;
import com.ttlock.bl.sdk.callback.ModifyPasscodeCallback;
import com.ttlock.bl.sdk.callback.ModifyRemoteValidityPeriodCallback;
import com.ttlock.bl.sdk.callback.RecoverLockDataCallback;
import com.ttlock.bl.sdk.callback.ReportLossCardCallback;
import com.ttlock.bl.sdk.callback.ResetKeyCallback;
import com.ttlock.bl.sdk.callback.ResetLockByCodeCallback;
import com.ttlock.bl.sdk.callback.ResetLockCallback;
import com.ttlock.bl.sdk.callback.ResetPasscodeCallback;
import com.ttlock.bl.sdk.callback.ScanLockCallback;
import com.ttlock.bl.sdk.callback.ScanWifiCallback;
import com.ttlock.bl.sdk.callback.SetAutoLockingPeriodCallback;
import com.ttlock.bl.sdk.callback.SetDoorSensorAlertTimeCallback;
import com.ttlock.bl.sdk.callback.SetHotelCardSectorCallback;
import com.ttlock.bl.sdk.callback.SetHotelDataCallback;
import com.ttlock.bl.sdk.callback.SetLiftControlableFloorsCallback;
import com.ttlock.bl.sdk.callback.SetLiftWorkModeCallback;
import com.ttlock.bl.sdk.callback.SetLockConfigCallback;
import com.ttlock.bl.sdk.callback.SetLockSoundWithSoundVolumeCallback;
import com.ttlock.bl.sdk.callback.SetLockTimeCallback;
import com.ttlock.bl.sdk.callback.SetLockWorkingTimeCallback;
import com.ttlock.bl.sdk.callback.GetPasscodeVerificationInfoCallback;
import com.ttlock.bl.sdk.callback.SetNBServerCallback;
import com.ttlock.bl.sdk.callback.SetNBAwakeModesCallback;
import com.ttlock.bl.sdk.callback.SetNBAwakeTimesCallback;
import com.ttlock.bl.sdk.callback.SetPassageModeCallback;
import com.ttlock.bl.sdk.callback.SetPowerSaverControlableLockCallback;
import com.ttlock.bl.sdk.callback.SetPowerSaverWorkModeCallback;
import com.ttlock.bl.sdk.callback.SetRemoteUnlockSwitchCallback;
import com.ttlock.bl.sdk.callback.SetSensitivityCallback;
import com.ttlock.bl.sdk.callback.SetUnlockDirectionCallback;
import com.ttlock.bl.sdk.callback.VerifyLockCallback;
import com.ttlock.bl.sdk.constant.FeatureValue;
import com.ttlock.bl.sdk.constant.RecoveryData;
import com.ttlock.bl.sdk.device.Remote;
import com.ttlock.bl.sdk.device.WirelessDoorSensor;
import com.ttlock.bl.sdk.device.WirelessKeypad;
import com.ttlock.bl.sdk.entity.AccessoryInfo;
import com.ttlock.bl.sdk.entity.AccessoryType;
import com.ttlock.bl.sdk.entity.ActivateLiftFloorsResult;
import com.ttlock.bl.sdk.entity.CameraLockWifiInfo;
import com.ttlock.bl.sdk.entity.ControlLockResult;
import com.ttlock.bl.sdk.entity.CyclicConfig;
import com.ttlock.bl.sdk.entity.FaceCollectionStatus;
import com.ttlock.bl.sdk.entity.HotelData;
import com.ttlock.bl.sdk.entity.IpSetting;
import com.ttlock.bl.sdk.entity.LockError;
import com.ttlock.bl.sdk.entity.LockVersion;
import com.ttlock.bl.sdk.entity.NBAwakeMode;
import com.ttlock.bl.sdk.entity.NBAwakeTime;
import com.ttlock.bl.sdk.entity.PassageModeConfig;
import com.ttlock.bl.sdk.entity.PassageModeType;
import com.ttlock.bl.sdk.entity.PowerSaverWorkMode;
import com.ttlock.bl.sdk.entity.RecoveryDataType;
import com.ttlock.bl.sdk.entity.SoundVolume;
import com.ttlock.bl.sdk.entity.TTLiftWorkMode;
import com.ttlock.bl.sdk.entity.TTLockConfigType;
import com.ttlock.bl.sdk.entity.UnlockDirection;
import com.ttlock.bl.sdk.entity.ValidityInfo;
import com.ttlock.bl.sdk.entity.WifiLockInfo;
import com.ttlock.bl.sdk.gateway.api.GatewayClient;
import com.ttlock.bl.sdk.gateway.callback.ConfigApnCallback;
import com.ttlock.bl.sdk.gateway.callback.ConfigIpCallback;
import com.ttlock.bl.sdk.gateway.callback.GetNetworkMacCallback;
import com.ttlock.bl.sdk.gateway.callback.ConnectCallback;
import com.ttlock.bl.sdk.gateway.callback.InitGatewayCallback;
import com.ttlock.bl.sdk.gateway.callback.ScanGatewayCallback;
import com.ttlock.bl.sdk.gateway.callback.ScanWiFiByGatewayCallback;
import com.ttlock.bl.sdk.gateway.model.ConfigureGatewayInfo;
import com.ttlock.bl.sdk.gateway.model.DeviceInfo;
import com.ttlock.bl.sdk.gateway.model.GatewayError;
import com.ttlock.bl.sdk.gateway.model.WiFi;
import com.ttlock.bl.sdk.keypad.InitKeypadCallback;
import com.ttlock.bl.sdk.keypad.ScanKeypadCallback;
import com.ttlock.bl.sdk.keypad.WirelessKeypadClient;
import com.ttlock.bl.sdk.keypad.model.InitKeypadResult;
import com.ttlock.bl.sdk.keypad.model.KeypadError;
import com.ttlock.bl.sdk.mulfunkeypad.api.MultifunctionalKeypadClient;
import com.ttlock.bl.sdk.mulfunkeypad.callback.AddCardCallback;
import com.ttlock.bl.sdk.mulfunkeypad.callback.DeleteLockCallback;
import com.ttlock.bl.sdk.mulfunkeypad.model.InitMultifunctionalKeypadResult;
import com.ttlock.bl.sdk.mulfunkeypad.model.MultifunctionalKeypadError;
import com.ttlock.bl.sdk.remote.api.RemoteClient;
import com.ttlock.bl.sdk.remote.callback.InitRemoteCallback;
import com.ttlock.bl.sdk.remote.callback.ScanRemoteCallback;
import com.ttlock.bl.sdk.remote.model.InitRemoteResult;
import com.ttlock.bl.sdk.remote.model.RemoteError;
import com.ttlock.bl.sdk.util.DigitUtil;
import com.ttlock.bl.sdk.util.FeatureValueUtil;
import com.ttlock.bl.sdk.util.GsonUtil;
import com.ttlock.bl.sdk.util.LogUtil;
import com.ttlock.bl.sdk.device.StandaloneDoorSensor;
import com.ttlock.bl.sdk.standalonedoorsensor.api.StandaloneDoorSensorClient;
import com.ttlock.bl.sdk.standalonedoorsensor.callback.InitCallback;
import com.ttlock.bl.sdk.standalonedoorsensor.callback.ScanStandaloneDoorSensorCallback;
import com.ttlock.bl.sdk.standalonedoorsensor.model.InitModel;
import com.ttlock.bl.sdk.standalonedoorsensor.model.StandaloneDoorSensorConfigInfo;
import com.ttlock.bl.sdk.standalonedoorsensor.model.StandaloneDoorSensorError;
import com.ttlock.bl.sdk.watermeter.api.WaterMeterClient;
import com.ttlock.bl.sdk.watermeter.callback.ClearRemainingWaterCallback;
import com.ttlock.bl.sdk.watermeter.callback.ConfigApnCallback;
import com.ttlock.bl.sdk.watermeter.callback.GetDeviceInfoCallback;
import com.ttlock.bl.sdk.watermeter.callback.RechargeCallback;
import com.ttlock.bl.sdk.watermeter.callback.SetRemainingWaterCallback;
import com.ttlock.bl.sdk.watermeter.callback.SetTotalUsageCallback;
import com.ttlock.bl.sdk.watermeter.callback.SetWaterOnOffCallback;
import com.ttlock.bl.sdk.watermeter.model.WaterMeter;
import com.ttlock.bl.sdk.watermeter.model.WaterMeterError;
import com.ttlock.bl.sdk.watermeter.model.WaterMeterInfo;
import com.ttlock.bl.sdk.electricmeter.api.ElectricMeterClient;
import com.ttlock.bl.sdk.electricmeter.callback.AddCallback;
import com.ttlock.bl.sdk.electricmeter.callback.ChargeCallback;
import com.ttlock.bl.sdk.electricmeter.callback.ClearRemainingElectricityCallback;
import com.ttlock.bl.sdk.electricmeter.callback.DeleteCallback;
import com.ttlock.bl.sdk.electricmeter.callback.GetFeatureValueCallback;
import com.ttlock.bl.sdk.electricmeter.callback.ReadDataCallback;
import com.ttlock.bl.sdk.electricmeter.callback.SetMaxPowerCallback;
import com.ttlock.bl.sdk.electricmeter.callback.SetPowerOnOffCallback;
import com.ttlock.bl.sdk.electricmeter.callback.SetRemainingElectricityCallback;
import com.ttlock.bl.sdk.electricmeter.callback.SetWorkModeCallback;
import com.ttlock.bl.sdk.electricmeter.model.ElectricMeter;
import com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError;
import com.ttlock.bl.sdk.entity.FirmwareInfo;
import com.ttlock.bl.sdk.wirelessdoorsensor.WirelessDoorSensorClient;
import com.ttlock.bl.sdk.wirelessdoorsensor.callback.InitDoorSensorCallback;
import com.ttlock.bl.sdk.wirelessdoorsensor.callback.ScanWirelessDoorSensorCallback;
import com.ttlock.bl.sdk.wirelessdoorsensor.model.DoorSensorError;
import com.ttlock.bl.sdk.wirelessdoorsensor.model.InitDoorSensorResult;
import com.ttlock.ttlock_flutter.constant.CommandType;
import com.ttlock.ttlock_flutter.constant.GatewayCommand;
import com.ttlock.ttlock_flutter.constant.TTDoorSensorCommand;
import com.ttlock.ttlock_flutter.constant.TTElectricityMeterCommand;
import com.ttlock.ttlock_flutter.constant.TTGatewayConnectStatus;
import com.ttlock.ttlock_flutter.constant.TTKeyPadCommand;
import com.ttlock.ttlock_flutter.constant.TTLockCommand;
import com.ttlock.ttlock_flutter.constant.TTParam;
import com.ttlock.ttlock_flutter.constant.TTRemoteCommand;
import com.ttlock.ttlock_flutter.constant.TTStandaloneDoorSensorCommand;
import com.ttlock.ttlock_flutter.constant.TTWaterMeterCommand;
import com.ttlock.ttlock_flutter.model.CommandObj;
import com.ttlock.ttlock_flutter.model.GatewayErrorConverter;
import com.ttlock.ttlock_flutter.model.GatewayModel;
import com.ttlock.ttlock_flutter.model.LiftWorkModeConverter;
import com.ttlock.ttlock_flutter.model.PowerSaverWorkModeConverter;
import com.ttlock.ttlock_flutter.model.SoundVolumeConverter;
import com.ttlock.ttlock_flutter.model.TTBluetoothState;
import com.ttlock.ttlock_flutter.model.TTGatewayScanModel;
import com.ttlock.ttlock_flutter.model.TTKeyPadScanModel;
import com.ttlock.ttlock_flutter.model.TTLockConfigConverter;
import com.ttlock.ttlock_flutter.model.TTLockErrorConverter;
import com.ttlock.ttlock_flutter.model.TTRemoteScanModel;
import com.ttlock.ttlock_flutter.model.TtlockModel;
import com.ttlock.ttlock_flutter.model.WaterMeterErrorConvert;
import com.ttlock.ttlock_flutter.model.ElectricityMeterErrorConvert;
import com.ttlock.ttlock_flutter.util.PermissionUtils;
import com.ttlock.ttlock_flutter.util.Utils;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;


/**
 * TtlockFlutterPlugin
 */
public class TtlockFlutterPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, EventChannel.StreamHandler {
    private static final int PERMISSIONS_REQUEST_CODE = 0;
    private MethodChannel channel;
    private EventChannel eventChannel;
    private static Activity activity;
    private EventChannel.EventSink events;
    //  private TtlockModel ttlockModel = new TtlockModel();
    private GatewayModel gatewayModel = new GatewayModel();

    //lock command que
    private Queue<CommandObj> commandQue = new ArrayDeque<>();


    public static final int ResultStateSuccess = 0;
    public static final int ResultStateProgress = 1;
    public static final int ResultStateFail = 2;

    private int commandType;

    /**
     * lock is busy try
     */
    private boolean tryAgain;

    /**
     * time out: 30s
     */
    private static final long COMMAND_TIME_OUT = 30 * 1000;

    /**
     * 2000.2.1 00:00:00
     */
    public static final long INVALID_START_DATE = 949334400000L;
    /**
     * 2000.2.1 01:00:00
     */
    public static final long INVALID_END_DATE = 949338000000L;

    /**
     * 添加人脸状态
     */
    private static final int STATUS_FACE_ENTER_ADD_MODE = 0;
    private static final int STATUS_FACE_ERROR = 1;

    private Runnable commandTimeOutRunable = new Runnable() {
        @Override
        public void run() {
            TTLockClient.getDefault().disconnect();
            errorCallbackCommand(commandQue.poll(), LockError.Failed);
            clearCommand();
        }
    };

    private Handler handler = new Handler();

    private void initSdk() {
        TTLockClient.getDefault().prepareBTService(activity);
        GatewayClient.getDefault().prepareBTService(activity);
        RemoteClient.getDefault().prepareBTService(activity);
        WirelessKeypadClient.getDefault().prepareBTService(activity);
        MultifunctionalKeypadClient.getDefault().prepareBTService(activity);
        WirelessDoorSensorClient.getDefault().prepareBTService(activity);
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), TTLockCommand.METHOD_CHANNEL_NAME);
        channel.setMethodCallHandler(this);
        eventChannel = new EventChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), TTLockCommand.EVENT_CHANNEL_NAME);
        eventChannel.setStreamHandler(this);
        LogUtil.setDBG(true);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        initSdk();
        if (GatewayCommand.isGatewayCommand(call.method)) {//gateway
            commandType = CommandType.GATEWAY;
            gatewayCommand(call);
        } else if (TTRemoteCommand.isRemoteCommand(call.method)) {
            commandType = CommandType.REMOTE_KEY;
            remoteCommand(call);
        } else if (TTKeyPadCommand.isKeypadCommand(call.method)) {
            commandType = CommandType.KEY_PAD;
            keypadCommand(call);
        } else if (TTDoorSensorCommand.isDoorSensorCommand(call.method)) {
            commandType = CommandType.DOOR_SENSOR;
            doorSensorCommand(call);
        } else if (TTStandaloneDoorSensorCommand.isStandaloneDoorSensorCommand(call.method)) {
            commandType = CommandType.STANDALONE_DOOR_SENSOR;
            standaloneDoorSensorCommand(call);
        } else if (TTElectricityMeterCommand.isElectricityMeterCommand(call.method)) {
            commandType = CommandType.ELECTRICITY_METER;
            electricityMeterCommand(call);
        } else if (TTWaterMeterCommand.isWaterMeterCommand(call.method)) {
            commandType = CommandType.WATER_METER;
            waterMeterCommand(call);
        } else {//door lock
            commandType = CommandType.DOOR_LOCK;
            doorLockCommand(call);
        }
    }

    public void doorLockCommand(MethodCall call) {
        Object arguments = call.arguments;
        TtlockModel ttlockModel = new TtlockModel();
        if (arguments instanceof Map) {
            ttlockModel.toObject((Map<String, Object>) arguments);
        } else {
            ttlockModel.lockData = (String) arguments;
        }
        switch (call.method) {
            case TTLockCommand.COMMAND_SUPPORT_FEATURE:
                isSupportFeature(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SETUP_PUGIN:
                setupPlug(ttlockModel);
                break;
            case TTLockCommand.COMMAND_START_SCAN_LOCK:
                if (initPermission()) {
                    startScan();
                }
                break;
            case TTLockCommand.COMMAND_STOP_SCAN_LOCK:
                stopScan();
                break;
            case TTLockCommand.COMMAND_GET_BLUETOOTH_STATE:
                getBluetoothState(ttlockModel);
                break;
            default:
                commandQue.add(new CommandObj(call.method, ttlockModel));
                LogUtil.d("commandQue:" + commandQue.size());
                if (commandQue.size() == 1) {
                    tryAgain = true;
                    doNextCommandAction();
                }
                break;
        }
    }

    public void gatewayCommand(MethodCall call) {
        String command = call.method;
        gatewayModel.toObject((Map<String, Object>) call.arguments);
        switch (command) {
            case GatewayCommand.COMMAND_START_SCAN_GATEWAY:
                if (initPermission()) {
                    startScanGateway();
                }
                break;
            case GatewayCommand.COMMAND_STOP_SCAN_GATEWAY:
                stopScanGateway();
                break;
            case GatewayCommand.COMMAND_CONNECT_GATEWAY:
                connectGateway(gatewayModel);
                break;
            case GatewayCommand.COMMAND_DISCONNECT_GATEWAY:
                disconnectGateway();
                break;
            case GatewayCommand.COMMAND_GET_SURROUND_WIFI:
                getSurroundWifi(gatewayModel);
                break;
            case GatewayCommand.COMMAND_INIT_GATEWAY:
                initGateway(gatewayModel);
                break;
            case GatewayCommand.COMMAND_CONFIG_IP:
                gatewayConfigIp(gatewayModel);
                break;
            case GatewayCommand.COMMAND_UPGRADE_GATEWAY:
                enterGatewayDfuMode();
                break;
            case GatewayCommand.COMMAND_CONFIG_APN:
                gatewayConfigApn(gatewayModel);
                break;
            case GatewayCommand.COMMAND_GET_NETWORK_MAC:
                getNetworkMac(gatewayModel);
                break;
        }
    }

    public void remoteCommand(MethodCall call) {
        String command = call.method;
        Map<String, Object> params = (Map<String, Object>) call.arguments;
        switch (command) {
            case TTRemoteCommand.COMMAND_START_SCAN_REMOTE:
                startScanRemote();
                break;
            case TTRemoteCommand.COMMAND_STOP_SCAN_REMOTE:
                stopScanRemote();
                break;
            case TTRemoteCommand.COMMAND_INIT_REMOTE:
                initRemote(params);
                break;
        }
    }

    public void keypadCommand(MethodCall call) {
        String command = call.method;
        Map<String, Object> params = (Map<String, Object>) call.arguments;
        switch (command) {
            case TTKeyPadCommand.COMMAND_START_SCAN_KEY_PAD:
                startScanKeyPad();
                break;
            case TTKeyPadCommand.COMMAND_STOP_SCAN_KEY_PAD:
                stopScanKeyPad();
                break;
            case TTKeyPadCommand.COMMAND_INIT_KEY_PAD:
                initKeyPad(params);
                break;
            case TTKeyPadCommand.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD:
                initMultifunctionalKeyPad(params);
                break;
            case TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK:
                deleteLockAtSpecifiedSlot(params);
                break;
            case TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_GET_STORED_LOCK:

                break;
            case TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT:
                multifunctionalKeyPadAddFinger(params);
                break;
            case TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD:
                multifunctionalKeyPadAddCard(params);
                break;
        }
    }

    public void doorSensorCommand(MethodCall call) {
        String command = call.method;
        Map<String, Object> params = (Map<String, Object>) call.arguments;
        switch (command) {
            case TTDoorSensorCommand.COMMAND_START_SCAN_DOOR_SENSOR:
                startScanDoorSensor();
                break;
            case TTDoorSensorCommand.COMMAND_STOP_SCAN_DOOR_SENSOR:
                stopScanDoorSensor();
                break;
            case TTDoorSensorCommand.COMMAND_INIT_DOOR_SENSOR:
                initDoorSensor(params);
                break;
        }
    }

    /** 配件类 API 当前 SDK 未支持时统一回传错误，与 Phase4 文档约定一致 */
    private static final int ERROR_ACCESSORY_NOT_SUPPORTED = 0;
    private static final String MSG_ACCESSORY_NOT_SUPPORTED = "Accessory API not supported by current SDK";

    private void accessoryNotSupported(String command) {
        callbackCommand(command, ResultStateFail, null, ERROR_ACCESSORY_NOT_SUPPORTED, MSG_ACCESSORY_NOT_SUPPORTED);
    }

    /** 独立门磁（Standalone Door Sensor）command 分发，参考云版真实 SDK 调用 */
    public void standaloneDoorSensorCommand(MethodCall call) {
        String command = call.method;
        Map<String, Object> params = call.arguments != null ? (Map<String, Object>) call.arguments : new HashMap<>();
        switch (command) {
            case TTStandaloneDoorSensorCommand.COMMAND_START_SCAN:
                startScanStandaloneDoorSensor();
                break;
            case TTStandaloneDoorSensorCommand.COMMAND_STOP_SCAN:
                stopScanStandaloneDoorSensor();
                break;
            case TTStandaloneDoorSensorCommand.COMMAND_INIT:
                initStandaloneDoorSensor(params);
                break;
            case TTStandaloneDoorSensorCommand.COMMAND_GET_FEATURE_VALUE:
                standaloneDoorGetFeatureValue(params);
                break;
            case TTStandaloneDoorSensorCommand.COMMAND_IS_SUPPORT_FUNCTION:
                standaloneDoorIsSupportFunction(params);
                break;
            default:
                accessoryNotSupported(command);
                break;
        }
    }

    public void startScanStandaloneDoorSensor() {
        PermissionUtils.doWithScanPermission(activity, success -> {
            if (success) {
                StandaloneDoorSensorClient.getDefault().startScan(new ScanStandaloneDoorSensorCallback() {
                    @Override
                    public void onScan(StandaloneDoorSensor standaloneDoorSensor) {
                        Map<String, Object> params = new HashMap<>();
                        params.put(TTParam.NAME, standaloneDoorSensor.getName());
                        params.put(TTParam.MAC, standaloneDoorSensor.getAddress());
                        params.put(TTParam.RSSI, standaloneDoorSensor.getRssi());
                        params.put("scanTime", System.currentTimeMillis());
                        successCallbackCommand(TTStandaloneDoorSensorCommand.COMMAND_START_SCAN, params);
                    }
                });
            } else {
                LogUtil.d("no scan permission");
            }
        });
    }

    public void stopScanStandaloneDoorSensor() {
        StandaloneDoorSensorClient.getDefault().stopScan();
    }

    public void initStandaloneDoorSensor(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                String standaloneInfoStr = params.get("standaloneInfoStr") != null ? (String) params.get("standaloneInfoStr") : null;
                StandaloneDoorSensorConfigInfo info = new StandaloneDoorSensorConfigInfo();
                if (!TextUtils.isEmpty(standaloneInfoStr)) {
                    try {
                        info = new Gson().fromJson(standaloneInfoStr, new TypeToken<StandaloneDoorSensorConfigInfo>() {}.getType());
                    } catch (Exception e) {
                        LogUtil.d("parse standaloneInfoStr fail: " + e.getMessage());
                    }
                }
                StandaloneDoorSensorClient.getDefault().init(info, new InitCallback() {
                    @Override
                    public void onInitSuccess(InitModel result) {
                        Map<String, Object> resultParams = new HashMap<>();
                        resultParams.put(TTParam.doorSensorData, result.getDoorSensorData());
                        resultParams.put(TTParam.electricQuantity, result.getDeviceInfo().getElectricQuantity());
                        resultParams.put(TTParam.featureValue, result.getDeviceInfo().getFeatureValue());
                        resultParams.put(TTParam.wifiMac, result.getDeviceInfo().getWifiMac());
                        resultParams.put(TTParam.MODEL_NUM, result.getDeviceInfo().getModelNum());
                        resultParams.put(TTParam.HARD_WARE_REVISION, result.getDeviceInfo().getHardwareRevision());
                        resultParams.put(TTParam.FIRMWARE_REVISION, result.getDeviceInfo().getFirmwareRevision());
                        successCallbackCommand(TTStandaloneDoorSensorCommand.COMMAND_INIT, resultParams);
                    }

                    @Override
                    public void onFail(StandaloneDoorSensorError error) {
                        errorCallbackCommand(TTStandaloneDoorSensorCommand.COMMAND_INIT, error);
                    }
                });
            } else {
                callbackCommand(TTStandaloneDoorSensorCommand.COMMAND_INIT, ResultStateFail, null,
                        LockError.LOCK_NO_PERMISSION.getIntErrorCode(), "no connect permission");
            }
        });
    }

    public void standaloneDoorGetFeatureValue(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                String mac = (String) params.get(TTParam.MAC);
                StandaloneDoorSensorClient.getDefault().getDeviceInfo(mac, new com.ttlock.bl.sdk.standalonedoorsensor.callback.GetDeviceInfoCallback() {
                    @Override
                    public void onFail(StandaloneDoorSensorError standaloneDoorSensorError) {
                        errorCallbackCommand(TTStandaloneDoorSensorCommand.COMMAND_GET_FEATURE_VALUE, standaloneDoorSensorError);
                    }

                    @Override
                    public void onGetDeviceInfoSuccess(com.ttlock.bl.sdk.standalonedoorsensor.model.DeviceInfo deviceInfo) {
                        Map<String, Object> resultParams = new HashMap<>();
                        resultParams.put("standaloneDoorFeature", deviceInfo.getFeatureValue());
                        successCallbackCommand(TTStandaloneDoorSensorCommand.COMMAND_GET_FEATURE_VALUE, resultParams);
                    }
                });
            } else {
                callbackCommand(TTStandaloneDoorSensorCommand.COMMAND_GET_FEATURE_VALUE, ResultStateFail, null,
                        LockError.LOCK_NO_PERMISSION.getIntErrorCode(), "no connect permission");
            }
        });
    }

    public void standaloneDoorIsSupportFunction(Map<String, Object> params) {
        boolean isSupport = FeatureValueUtil.isSupportFeatureValue(
                params.get("standaloneDoorFeature") != null ? params.get("standaloneDoorFeature").toString() : "",
                Integer.parseInt(params.get(TTParam.supportFunction).toString()));
        HashMap<String, Object> map = new HashMap<>();
        map.put("isSupport", isSupport);
        successCallbackCommand(TTStandaloneDoorSensorCommand.COMMAND_IS_SUPPORT_FUNCTION, map);
    }

    /** 水表 command 分发，参考云版真实 SDK 调用 */
    public void waterMeterCommand(MethodCall call) {
        String command = call.method;
        Map<String, Object> params = call.arguments != null ? (Map<String, Object>) call.arguments : new HashMap<>();
        switch (command) {
            case TTWaterMeterCommand.COMMAND_CONFIG_SERVER:
                waterMeterConfigServer(params);
                break;
            case TTWaterMeterCommand.COMMAND_START_SCAN:
                waterMeterStartScan();
                break;
            case TTWaterMeterCommand.COMMAND_STOP_SCAN:
                waterMeterStopScan();
                break;
            case TTWaterMeterCommand.COMMAND_CONNECT:
                waterMeterConnect(params);
                break;
            case TTWaterMeterCommand.COMMAND_DISCONNECT:
                waterMeterDisconnect();
                break;
            case TTWaterMeterCommand.COMMAND_INIT:
                waterMeterInit(params);
                break;
            case TTWaterMeterCommand.COMMAND_DELETE:
                waterMeterDelete(params);
                break;
            case TTWaterMeterCommand.COMMAND_SET_POWER_ON_OFF:
                waterMeterSetPowerOnOff(params);
                break;
            case TTWaterMeterCommand.COMMAND_SET_REMAINDER_M3:
                waterMeterSetRemainingM3(params);
                break;
            case TTWaterMeterCommand.COMMAND_CLEAR_REMAINDER_M3:
                waterMeterClearRemainingM3(params);
                break;
            case TTWaterMeterCommand.COMMAND_READ_DATA:
                waterMeterReadData(params);
                break;
            case TTWaterMeterCommand.COMMAND_SET_PAY_MODE:
                waterMeterSetPayMode(params);
                break;
            case TTWaterMeterCommand.COMMAND_CHARGE:
                waterMeterCharge(params);
                break;
            case TTWaterMeterCommand.COMMAND_SET_TOTAL_USAGE:
                waterMeterSetTotalUsage(params);
                break;
            case TTWaterMeterCommand.COMMAND_GET_FEATURE_VALUE:
                waterMeterGetFeatureValue(params);
                break;
            case TTWaterMeterCommand.COMMAND_GET_DEVICE_INFO:
                waterMeterGetDeviceInfo(params);
                break;
            case TTWaterMeterCommand.COMMAND_IS_SUPPORT_FUNCTION:
                waterMeterIsSupportFunction(params);
                break;
            case TTWaterMeterCommand.COMMAND_CONFIG_APN:
                waterMeterConfigApn(params);
                break;
            case TTWaterMeterCommand.COMMAND_CONFIG_METER_SERVER:
                waterMeterConfigMeterServer(params);
                break;
            case TTWaterMeterCommand.COMMAND_RESET:
                waterMeterReset(params);
                break;
            default:
                accessoryNotSupported(command);
                break;
        }
    }

    public void waterMeterConfigServer(Map<String, Object> params) {
        WaterMeterClient.getDefault().setClientParam(params.get(TTParam.url).toString(),
                params.get(TTParam.clientId).toString(), params.get(TTParam.accessToken).toString());
        successCallbackCommand(TTWaterMeterCommand.COMMAND_CONFIG_SERVER, new HashMap<>());
    }

    public void waterMeterStartScan() {
        PermissionUtils.doWithScanPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().startScan(waterMeter -> {
                    if (waterMeter != null) {
                        Map<String, Object> params = new HashMap<>();
                        params.put(TTParam.NAME, waterMeter.getName());
                        params.put(TTParam.MAC, waterMeter.getAddress());
                        params.put(TTParam.isInited, !waterMeter.isSettingMode());
                        params.put(TTParam.totalM3, String.valueOf(waterMeter.getTotalM3()));
                        params.put(TTParam.remainderM3, String.valueOf(waterMeter.getRemainderM3()));
                        params.put(TTParam.onOff, waterMeter.getOnOff() == 1);
                        params.put(TTParam.RSSI, waterMeter.getRssi());
                        params.put(TTParam.magneticInterference, String.valueOf(waterMeter.getMagneticInterference()));
                        params.put(TTParam.electricQuantity, waterMeter.getElectricQuantity());
                        params.put(TTParam.waterValveFailure, waterMeter.getWaterValveMalfunction());
                        params.put(TTParam.payMode, waterMeter.getPayMode());
                        params.put(TTParam.scanTime, System.currentTimeMillis());
                        params.put(TTParam.executeResponse, waterMeter.getExecuteResponse());
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_START_SCAN, params);
                    }
                });
            } else {
                LogUtil.d("no scan permission");
            }
        });
    }

    public void waterMeterStopScan() {
        WaterMeterClient.getDefault().stopScan();
    }

    public void waterMeterConnect(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().connect(params.get(TTParam.MAC).toString(), new com.ttlock.bl.sdk.watermeter.callback.ConnectCallback() {
                    @Override
                    public void onConnectSuccess(WaterMeter waterMeter) {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_CONNECT, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_CONNECT, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_CONNECT, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterDisconnect() {
        WaterMeterClient.getDefault().disconnect();
    }

    public void waterMeterInit(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                HashMap<String, String> map = new HashMap<>();
                for (Map.Entry<String, Object> entry : params.entrySet()) {
                    map.put(entry.getKey(), entry.getValue().toString());
                }
                WaterMeterClient.getDefault().add(map, new com.ttlock.bl.sdk.watermeter.callback.AddCallback() {
                    @Override
                    public void onAddSuccess(WaterMeterInfo var1) {
                        HashMap<String, Object> resultMap = new HashMap<>();
                        resultMap.put(TTParam.featureValue, var1.getFeatureValue());
                        resultMap.put(TTParam.waterMeterId, var1.getWaterMeterId());
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_INIT, resultMap);
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_INIT, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_INIT, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterDelete(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().delete(params.get(TTParam.MAC).toString(), new com.ttlock.bl.sdk.watermeter.callback.DeleteCallback() {
                    @Override
                    public void onDeleteSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_DELETE, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_DELETE, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_DELETE, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterSetPowerOnOff(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().setWaterOnOff(params.get(TTParam.MAC).toString(), (boolean) params.get("isOn"), new SetWaterOnOffCallback() {
                    @Override
                    public void onSetSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_SET_POWER_ON_OFF, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_SET_POWER_ON_OFF, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_SET_POWER_ON_OFF, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterSetRemainingM3(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().setRemainingWater(params.get(TTParam.MAC).toString(), params.get(TTParam.remainderM3).toString(), new SetRemainingWaterCallback() {
                    @Override
                    public void onSetSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_SET_REMAINDER_M3, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_SET_REMAINDER_M3, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_SET_REMAINDER_M3, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterClearRemainingM3(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().clearRemainingWater(params.get(TTParam.MAC).toString(), new ClearRemainingWaterCallback() {
                    @Override
                    public void onClearSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_CLEAR_REMAINDER_M3, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_CLEAR_REMAINDER_M3, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_CLEAR_REMAINDER_M3, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterReadData(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().readData(params.get(TTParam.MAC).toString(), new com.ttlock.bl.sdk.watermeter.callback.ReadDataCallback() {
                    @Override
                    public void onReadSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_READ_DATA, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_READ_DATA, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_READ_DATA, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterSetPayMode(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().setWorkMode(params.get(TTParam.MAC).toString(), (int) params.get(TTParam.payMode), Double.parseDouble(params.get(TTParam.price).toString()), new com.ttlock.bl.sdk.watermeter.callback.SetWorkModeCallback() {
                    @Override
                    public void onSetWorkModeSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_SET_PAY_MODE, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_SET_PAY_MODE, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_SET_PAY_MODE, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterCharge(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().recharge(params.get(TTParam.MAC).toString(), Double.parseDouble(params.get("chargeAmount").toString()), Double.parseDouble(params.get("m3").toString()), new RechargeCallback() {
                    @Override
                    public void onRechargeSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_CHARGE, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_CHARGE, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_CHARGE, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterSetTotalUsage(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().setTotalUsage(params.get(TTParam.MAC).toString(), Double.parseDouble(params.get(TTParam.totalM3).toString()), new SetTotalUsageCallback() {
                    @Override
                    public void onSetSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_SET_TOTAL_USAGE, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_SET_TOTAL_USAGE, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_SET_TOTAL_USAGE, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterGetFeatureValue(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().getFeatureValue(params.get(TTParam.MAC).toString(), new com.ttlock.bl.sdk.watermeter.callback.GetFeatureValueCallback() {
                    @Override
                    public void onGetFeatureValueSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_GET_FEATURE_VALUE, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_GET_FEATURE_VALUE, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_GET_FEATURE_VALUE, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterGetDeviceInfo(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().getDeviceInfo(params.get(TTParam.MAC).toString(), new GetDeviceInfoCallback() {
                    @Override
                    public void onGetSuccess(com.ttlock.bl.sdk.watermeter.model.DeviceInfo deviceInfo) {
                        Map<String, Object> resultParams = new HashMap<>();
                        resultParams.put("modelNum", deviceInfo.getModelNum() != null ? deviceInfo.getModelNum() : "");
                        resultParams.put("hardwareRevision", deviceInfo.getHardwareRevision() != null ? deviceInfo.getHardwareRevision() : "");
                        resultParams.put("firmwareRevision", deviceInfo.getFirmwareRevision() != null ? deviceInfo.getFirmwareRevision() : "");
                        resultParams.put("catOneOperator", deviceInfo.getCatOneOperator());
                        resultParams.put("catOneNodeId", deviceInfo.getCatOneNodeId());
                        resultParams.put("catOneCardNumber", deviceInfo.getCatOneCardNumber());
                        resultParams.put("catOneRssi", deviceInfo.getCatOneRssi());
                        resultParams.put("catOneImsi", deviceInfo.getCatOneImsi());
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_GET_DEVICE_INFO, resultParams);
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_GET_DEVICE_INFO, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_GET_DEVICE_INFO, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterIsSupportFunction(Map<String, Object> params) {
        boolean isSupport = FeatureValueUtil.isSupportFeatureValue(params.get(TTParam.featureValue).toString(), Integer.parseInt(params.get(TTParam.supportFunction).toString()));
        HashMap<String, Object> map = new HashMap<>();
        map.put("isSupport", isSupport);
        successCallbackCommand(TTWaterMeterCommand.COMMAND_IS_SUPPORT_FUNCTION, map);
    }

    public void waterMeterConfigApn(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().configApn(params.get(TTParam.MAC).toString(), params.get("apn").toString(), new ConfigApnCallback() {
                    @Override
                    public void onConfigSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_CONFIG_APN, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_CONFIG_APN, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_CONFIG_APN, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterConfigMeterServer(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                String mac = params.get(TTParam.MAC).toString();
                String serverAddress = params.get("ip").toString();
                int port = Integer.parseInt(params.get("port").toString());
                WaterMeterClient.getDefault().configServer(mac, serverAddress, port, new com.ttlock.bl.sdk.watermeter.callback.ConfigServerCallback() {
                    @Override
                    public void onConfigSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_CONFIG_METER_SERVER, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_CONFIG_METER_SERVER, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_CONFIG_METER_SERVER, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void waterMeterReset(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                WaterMeterClient.getDefault().reset(params.get(TTParam.MAC).toString(), new com.ttlock.bl.sdk.watermeter.callback.ResetCallback() {
                    @Override
                    public void onResetSuccess() {
                        successCallbackCommand(TTWaterMeterCommand.COMMAND_RESET, new HashMap<>());
                    }

                    @Override
                    public void onFail(WaterMeterError waterMeterError) {
                        errorCallbackCommand(TTWaterMeterCommand.COMMAND_RESET, waterMeterError);
                    }
                });
            } else {
                callbackCommand(TTWaterMeterCommand.COMMAND_RESET, ResultStateFail, null, WaterMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    /** 电表 command 分发，参考云版真实 SDK 调用 */
    public void electricityMeterCommand(MethodCall call) {
        String command = call.method;
        Map<String, Object> params = call.arguments != null ? (Map<String, Object>) call.arguments : new HashMap<>();
        switch (command) {
            case TTElectricityMeterCommand.COMMAND_CONFIG_SERVER:
                electricMeterConfigServer(params);
                break;
            case TTElectricityMeterCommand.COMMAND_START_SCAN:
                electricMeterStartScan();
                break;
            case TTElectricityMeterCommand.COMMAND_STOP_SCAN:
                electricMeterStopScan();
                break;
            case TTElectricityMeterCommand.COMMAND_CONNECT:
                electricMeterConnect(params);
                break;
            case TTElectricityMeterCommand.COMMAND_DISCONNECT:
                electricMeterDisconnect();
                break;
            case TTElectricityMeterCommand.COMMAND_INIT:
                electricMeterInit(params);
                break;
            case TTElectricityMeterCommand.COMMAND_DELETE:
                electricMeterDelete(params);
                break;
            case TTElectricityMeterCommand.COMMAND_SET_POWER_ON_OFF:
                electricMeterSetPowerOnOff(params);
                break;
            case TTElectricityMeterCommand.COMMAND_SET_REMAINDER_KWH:
                electricMeterSetRemainderKwh(params);
                break;
            case TTElectricityMeterCommand.COMMAND_CLEAR_REMAINDER_KWH:
                electricMeterClearRemainderKwh(params);
                break;
            case TTElectricityMeterCommand.COMMAND_READ_DATA:
                electricMeterReadData(params);
                break;
            case TTElectricityMeterCommand.COMMAND_SET_PAY_MODE:
                electricMeterSetPayMode(params);
                break;
            case TTElectricityMeterCommand.COMMAND_CHARGE:
                electricMeterCharge(params);
                break;
            case TTElectricityMeterCommand.COMMAND_SET_MAX_POWER:
                electricMeterSetMaxPower(params);
                break;
            case TTElectricityMeterCommand.COMMAND_GET_FEATURE_VALUE:
                electricMeterGetFeatureValue(params);
                break;
            case TTElectricityMeterCommand.COMMAND_IS_SUPPORT_FUNCTION:
                electricMeterIsSupportFunction(params);
                break;
            default:
                accessoryNotSupported(command);
                break;
        }
    }

    public void electricMeterConfigServer(Map<String, Object> params) {
        ElectricMeterClient.getDefault().setClientParam(params.get(TTParam.url).toString(), params.get(TTParam.clientId).toString(), params.get(TTParam.accessToken).toString());
        successCallbackCommand(TTElectricityMeterCommand.COMMAND_CONFIG_SERVER, new HashMap<>());
    }

    public void electricMeterStartScan() {
        PermissionUtils.doWithScanPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().startScan(electricMeter -> {
                    if (electricMeter != null) {
                        Map<String, Object> params = new HashMap<>();
                        params.put(TTParam.NAME, electricMeter.getName());
                        params.put(TTParam.MAC, electricMeter.getAddress());
                        params.put(TTParam.isInited, !electricMeter.isSettingMode());
                        params.put(TTParam.totalKwh, String.valueOf(electricMeter.getTotalKwh()));
                        params.put(TTParam.remainderKwh, String.valueOf(electricMeter.getRemainderKwh()));
                        params.put(TTParam.voltage, String.valueOf(electricMeter.getVoltage()));
                        params.put(TTParam.electricCurrent, String.valueOf(electricMeter.getElectricCurrent()));
                        params.put(TTParam.onOff, electricMeter.getOnOff() == 1);
                        params.put(TTParam.RSSI, electricMeter.getRssi());
                        params.put(TTParam.payMode, electricMeter.getPayMode());
                        params.put(TTParam.scanTime, System.currentTimeMillis());
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_START_SCAN, params);
                    }
                });
            } else {
                LogUtil.d("no scan permission");
            }
        });
    }

    public void electricMeterStopScan() {
        ElectricMeterClient.getDefault().stopScan();
    }

    public void electricMeterConnect(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().connect(params.get(TTParam.MAC).toString(), new com.ttlock.bl.sdk.electricmeter.callback.ConnectCallback() {
                    @Override
                    public void onConnectSuccess(ElectricMeter electricMeter) {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_CONNECT, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_CONNECT, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_CONNECT, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterDisconnect() {
        ElectricMeterClient.getDefault().disconnect();
    }

    public void electricMeterInit(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                HashMap<String, String> map = new HashMap<>();
                for (Map.Entry<String, Object> entry : params.entrySet()) {
                    map.put(entry.getKey(), entry.getValue().toString());
                }
                ElectricMeterClient.getDefault().add(map, new AddCallback() {
                    @Override
                    public void onAddSuccess(FirmwareInfo firmwareInfo) {
                        Map<String, Object> resultMap = new HashMap<>();
                        resultMap.put("electricMeterId", -1);
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_INIT, resultMap);
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_INIT, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_INIT, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterDelete(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().delete(params.get(TTParam.MAC).toString(), new DeleteCallback() {
                    @Override
                    public void onDeleteSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_DELETE, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_DELETE, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_DELETE, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterSetPowerOnOff(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().setPowerOnOff(params.get(TTParam.MAC).toString(), (boolean) params.get("isOn"), new SetPowerOnOffCallback() {
                    @Override
                    public void onSetPowerOnOffSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_SET_POWER_ON_OFF, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_SET_POWER_ON_OFF, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_SET_POWER_ON_OFF, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterSetRemainderKwh(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().setRemainingElectricity(params.get(TTParam.MAC).toString(), params.get(TTParam.remainderKwh).toString(), new SetRemainingElectricityCallback() {
                    @Override
                    public void onSetSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_SET_REMAINDER_KWH, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_SET_REMAINDER_KWH, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_SET_REMAINDER_KWH, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterClearRemainderKwh(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().clearRemainingElectricity(params.get(TTParam.MAC).toString(), new ClearRemainingElectricityCallback() {
                    @Override
                    public void onClearSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_CLEAR_REMAINDER_KWH, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_CLEAR_REMAINDER_KWH, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_CLEAR_REMAINDER_KWH, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterReadData(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().readData(params.get(TTParam.MAC).toString(), new ReadDataCallback() {
                    @Override
                    public void onReadSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_READ_DATA, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_READ_DATA, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_READ_DATA, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterSetPayMode(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().setWorkMode(params.get(TTParam.MAC).toString(), (int) params.get(TTParam.payMode), Double.parseDouble(params.get(TTParam.price).toString()), new SetWorkModeCallback() {
                    @Override
                    public void onSetWorkModeSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_SET_PAY_MODE, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_SET_PAY_MODE, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_SET_PAY_MODE, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterCharge(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().recharge(params.get(TTParam.MAC).toString(), Double.parseDouble(params.get(TTParam.chargeAmount).toString()), Double.parseDouble(params.get(TTParam.chargeKwh).toString()), new ChargeCallback() {
                    @Override
                    public void onChargeSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_CHARGE, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_CHARGE, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_CHARGE, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterSetMaxPower(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().setMaxPower(params.get(TTParam.MAC).toString(), (int) params.get(TTParam.maxPower), new SetMaxPowerCallback() {
                    @Override
                    public void onSetMaxPowerSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_SET_MAX_POWER, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_SET_MAX_POWER, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_SET_MAX_POWER, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterGetFeatureValue(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                ElectricMeterClient.getDefault().getFeatureValue(params.get(TTParam.MAC).toString(), new GetFeatureValueCallback() {
                    @Override
                    public void onGetFeatureValueSuccess() {
                        successCallbackCommand(TTElectricityMeterCommand.COMMAND_GET_FEATURE_VALUE, new HashMap<>());
                    }

                    @Override
                    public void onFail(ElectricMeterError electricMeterError) {
                        errorCallbackCommand(TTElectricityMeterCommand.COMMAND_GET_FEATURE_VALUE, electricMeterError);
                    }
                });
            } else {
                callbackCommand(TTElectricityMeterCommand.COMMAND_GET_FEATURE_VALUE, ResultStateFail, null, ElectricityMeterErrorConvert.bluetoothPowerOff, "no connect permission");
            }
        });
    }

    public void electricMeterIsSupportFunction(Map<String, Object> params) {
        boolean isSupport = FeatureValueUtil.isSupportFeatureValue(params.get(TTParam.featureValue).toString(), Integer.parseInt(params.get(TTParam.supportFunction).toString()));
        HashMap<String, Object> map = new HashMap<>();
        map.put("isSupport", isSupport);
        successCallbackCommand(TTElectricityMeterCommand.COMMAND_IS_SUPPORT_FUNCTION, map);
    }

    public void isSupportFeature(TtlockModel ttlockModel) {
        boolean isSupport = FeatureValueUtil.isSupportFeature(ttlockModel.lockData, ttlockModel.supportFunction);
        ttlockModel.isSupport = isSupport;
        LogUtil.d(ttlockModel.supportFunction + ":" + isSupport);
        successCallbackCommand(TTLockCommand.COMMAND_SUPPORT_FEATURE, ttlockModel.toMap());
    }

    /**
     * -------------------- door sensor -----------------------------
     **/
    public void startScanDoorSensor() {
        PermissionUtils.doWithScanPermission(activity, success -> {
            if (success) {
                WirelessDoorSensorClient.getDefault().startScan(new ScanWirelessDoorSensorCallback() {
                    @Override
                    public void onScan(WirelessDoorSensor wirelessDoorSensor) {
                        Map<String, Object> params = new HashMap<>();
                        params.put(TTParam.NAME, wirelessDoorSensor.getName());
                        params.put(TTParam.MAC, wirelessDoorSensor.getAddress());
                        params.put(TTParam.RSSI, wirelessDoorSensor.getRssi());
                        successCallbackCommand(TTDoorSensorCommand.COMMAND_START_SCAN_DOOR_SENSOR, params);
                    }
                });
            } else {
                LogUtil.d("no scan permission");
            }
        });
    }

    public void stopScanDoorSensor() {
        WirelessDoorSensorClient.getDefault().stopScan();
    }

    public void initDoorSensor(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                BluetoothDevice device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice((String) params.get(TTParam.MAC));
                WirelessDoorSensor doorSensor = new WirelessDoorSensor(device);
                WirelessDoorSensorClient.getDefault().initialize(doorSensor, (String) params.get(TTParam.LOCK_DATA), new InitDoorSensorCallback() {
                    @Override
                    public void onInitSuccess(InitDoorSensorResult initDoorSensorResult) {
                        params.put(TTParam.ELECTRIC_QUANTITY, initDoorSensorResult.getBatteryLevel());
                        params.put(TTParam.MODEL_NUM, initDoorSensorResult.getFirmwareInfo().getModelNum());
                        params.put(TTParam.FIRMWARE_REVISION, initDoorSensorResult.getFirmwareInfo().getFirmwareRevision());
                        params.put(TTParam.HARD_WARE_REVISION, initDoorSensorResult.getFirmwareInfo().getHardwareRevision());
                        successCallbackCommand(TTDoorSensorCommand.COMMAND_INIT_DOOR_SENSOR, params);
                    }

                    @Override
                    public void onFail(DoorSensorError doorSensorError) {
                        errorCallbackCommand(TTDoorSensorCommand.COMMAND_INIT_DOOR_SENSOR, doorSensorError);
                    }
                });
            } else {
                callbackCommand(TTKeyPadCommand.COMMAND_INIT_KEY_PAD, ResultStateFail, params, LockError.LOCK_NO_PERMISSION.getIntErrorCode(), "no connect permission");
            }
        });
    }

    /**
     * --------------------------- keypad --------------------------
     **/
    public void startScanKeyPad() {
        PermissionUtils.doWithScanPermission(activity, success -> {
            if (success) {
                LogUtil.d("扫描键盘：1111");
                WirelessKeypadClient.getDefault().startScanKeyboard(new ScanKeypadCallback() {
                    @Override
                    public void onScanKeyboardSuccess(WirelessKeypad wirelessKeypad) {
                        LogUtil.d("扫描键盘：1111" + wirelessKeypad.getAddress());
                        TTKeyPadScanModel ttKeyPadScanModel = new TTKeyPadScanModel();
                        ttKeyPadScanModel.mac = wirelessKeypad.getAddress();
                        ttKeyPadScanModel.name = wirelessKeypad.getName();
                        ttKeyPadScanModel.rssi = wirelessKeypad.getRssi();
                        successCallbackCommand(TTKeyPadCommand.COMMAND_START_SCAN_KEY_PAD, ttKeyPadScanModel.toMap());
                    }

                    @Override
                    public void onScanFailed(int errorcode) {
                        LogUtil.d("扫描键盘：222:" + String.valueOf(errorcode));
                    }
                });

                MultifunctionalKeypadClient.getDefault().startScanKeypad(new ScanKeypadCallback() {
                    @Override
                    public void onScanKeyboardSuccess(WirelessKeypad wirelessKeypad) {
                        HashMap<String, Object> params = new HashMap<>();
                        params.put("mac", wirelessKeypad.getAddress());
                        params.put("name", wirelessKeypad.getName());
                        params.put("rssi", wirelessKeypad.getRssi());
                        params.put("isMultifunctionalKeypad", true);
                        Log.d("扫描到多功能键盘", wirelessKeypad.getAddress());
                        successCallbackCommand(TTKeyPadCommand.COMMAND_START_SCAN_KEY_PAD, params);
                    }

                    @Override
                    public void onScanFailed(int errorcode) {

                    }
                });

            } else {
                LogUtil.d("no scan permission");
            }
        });
    }

    public void stopScanKeyPad() {
        WirelessKeypadClient.getDefault().stopScanKeyboard();
    }

    public void initKeyPad(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                BluetoothDevice device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice((String) params.get(TTParam.MAC));
                WirelessKeypad keypad = new WirelessKeypad(device);
                String lockMac = (String) params.get(TTParam.LOCK_MAC);
//        LockData lockParam = EncryptionUtil.parseLockData(lockData);
                WirelessKeypadClient.getDefault().initializeKeypad(keypad, lockMac, new InitKeypadCallback() {
                    @Override
                    public void onInitKeypadSuccess(InitKeypadResult initKeypadResult) {
                        params.put(TTParam.ELECTRIC_QUANTITY, initKeypadResult.getBatteryLevel());
                        params.put(TTParam.KEYPAD_FEATURE_VALUE, initKeypadResult.getFeatureValue());
                        successCallbackCommand(TTKeyPadCommand.COMMAND_INIT_KEY_PAD, params);
                    }

                    @Override
                    public void onFail(KeypadError keypadError) {
                        errorCallbackCommand(TTKeyPadCommand.COMMAND_INIT_KEY_PAD, keypadError);
                    }
                });
            } else {
                callbackCommand(TTKeyPadCommand.COMMAND_INIT_KEY_PAD, ResultStateFail, params, LockError.LOCK_NO_PERMISSION.getIntErrorCode(), "no connect permission");
            }
        });
    }

    //MULTIFUNCTIONAL
    public void initMultifunctionalKeyPad(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                MultifunctionalKeypadClient.getDefault().initializeMultifunctionalKeypad((String) params.get(TTParam.MAC),
                        (String) params.get(TTParam.LOCK_DATA), new com.ttlock.bl.sdk.mulfunkeypad.callback.InitKeypadCallback() {
                            @Override
                            public void onKeypadFail(MultifunctionalKeypadError multifunctionalKeypadError) {
                                HashMap<String, Object> map = new HashMap<>();
                                map.put("errorDevice", 1);
                                Log.d("sdk失败", multifunctionalKeypadError.toString());
                                Log.d("sdk失败", multifunctionalKeypadError.getDescription());
                                callbackCommand(TTKeyPadCommand.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD, ResultStateFail, map, 0, multifunctionalKeypadError.getDescription());
                            }

                            @Override
                            public void onInitSuccess(InitMultifunctionalKeypadResult initMultifunctionalKeypadResult) {
                                HashMap<String, Object> params = new HashMap<>();
                                params.put("electricQuantity", initMultifunctionalKeypadResult.getBatteryLevel());
                                params.put("wirelessKeypadFeatureValue", initMultifunctionalKeypadResult.getKeypadFeatureValue());
                                params.put("slotNumber", initMultifunctionalKeypadResult.getSlotNumber());
                                params.put("slotLimit", initMultifunctionalKeypadResult.getSlotLimit());
                                HashMap<String, Object> systemInfoModel = new HashMap<>();
                                systemInfoModel.put(TTParam.MODEL_NUM, initMultifunctionalKeypadResult.getFirmwareInfo().getModelNum());
                                systemInfoModel.put(TTParam.HARD_WARE_REVISION, initMultifunctionalKeypadResult.getFirmwareInfo().getHardwareRevision());
                                systemInfoModel.put(TTParam.FIRMWARE_REVISION, initMultifunctionalKeypadResult.getFirmwareInfo().getFirmwareRevision());
                                params.put("systemInfoModel", systemInfoModel);
                                successCallbackCommand(TTKeyPadCommand.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD, params);
                            }

                            @Override
                            public void onLockFail(LockError lockError) {
                                HashMap<String, Object> map = new HashMap<>();
                                map.put("errorDevice", 0);
                                Log.d("sdk失败", lockError.toString());
                                Log.d("sdk失败", lockError.getDescription());
                                callbackCommand(TTKeyPadCommand.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD, ResultStateFail, map, 0, lockError.getDescription());
                            }
                        });
            } else {
                callbackCommand(TTKeyPadCommand.COMMAND_INIT_MULTIFUNCTIONAL_REMOTE_KEYPAD, ResultStateFail, params, LockError.LOCK_NO_PERMISSION.getIntErrorCode(), "no connect permission");
            }
        });
    }

    public void deleteLockAtSpecifiedSlot(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                MultifunctionalKeypadClient.getDefault().deleteLockAtSpecifiedSlot((String) params.get(TTParam.MAC),
                        (int) params.get(TTParam.slotNumber), new DeleteLockCallback() {
                            @Override
                            public void onKeypadFail(MultifunctionalKeypadError multifunctionalKeypadError) {
                                HashMap<String, Object> map = new HashMap<>();
                                map.put("errorDevice", 1);
                                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK, ResultStateFail, map, 0, multifunctionalKeypadError.getDescription());
                            }

                            @Override
                            public void onDeleteLockSuccess() {
                                successCallbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK, params);
                            }
                        });
            } else {
                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_DELETE_STORED_LOCK, ResultStateFail, params, LockError.LOCK_NO_PERMISSION.getIntErrorCode(), "no connect permission");
            }
        });
    }


    public void multifunctionalKeyPadAddFinger(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                String keyPadMac = (String) params.get(TTParam.MAC);
                long startDate = Long.valueOf(params.get(TTParam.startDate).toString());
                long endDate = Long.valueOf(params.get(TTParam.endDate).toString());
                String lockData = (String) params.get(TTParam.LOCK_DATA);
                String cycleJsonList = params.get(TTParam.cycleJsonList) == null ? "" : (String) params.get(TTParam.cycleJsonList);
                ValidityInfo info = new ValidityInfo();
                info.setStartDate(startDate);
                info.setEndDate(endDate);
                if (!cycleJsonList.isEmpty()) {
                    List<CyclicConfig> cycleList = new Gson().fromJson(cycleJsonList, new TypeToken<List<CyclicConfig>>() {
                    }.getType());
                    info.setCyclicConfigs(cycleList);
                    info.setModeType(ValidityInfo.CYCLIC);
                }
                MultifunctionalKeypadClient.getDefault().addFingerprint(keyPadMac,
                        lockData, info, new com.ttlock.bl.sdk.mulfunkeypad.callback.AddFingerprintCallback() {
                            @Override
                            public void onKeypadFail(MultifunctionalKeypadError multifunctionalKeypadError) {
                                HashMap<String, Object> map = new HashMap<>();
                                map.put("errorDevice", 1);
                                int errorCode = 0;
                                if (multifunctionalKeypadError.getErrorCode() == 257) {
                                    errorCode = 4;
                                }
                                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT, ResultStateFail, map, errorCode, multifunctionalKeypadError.getDescription());

                            }

                            @Override
                            public void onEnterAddingMode() {
                                HashMap hashMap = new HashMap<>();
                                hashMap.put("currentCount", 0);
                                hashMap.put("totalCount", 0);
                                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT,
                                        ResultStateProgress, hashMap, -1, "");
                            }

                            @Override
                            public void onCollectFingerprint(int i, int i1) {
                                HashMap hashMap = new HashMap<>();
                                hashMap.put("currentCount", i);
                                hashMap.put("totalCount", i1);
                                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT,
                                        ResultStateProgress, hashMap, -1, "");
                            }

                            @Override
                            public void onAddFingerprintFinished(long l) {
                                HashMap hashMap = new HashMap<>();
                                hashMap.put(TTParam.fingerprintNumber, String.valueOf(l));
                                successCallbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT, hashMap);

                            }

                            @Override
                            public void onLockFail(LockError lockError) {
                                HashMap<String, Object> map = new HashMap<>();
                                map.put("errorDevice", 0);
                                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT, ResultStateFail, map, 0, lockError.getDescription());

                            }
                        });
            } else {
                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_FINGERPRINT, ResultStateFail, params, LockError.LOCK_NO_PERMISSION.getIntErrorCode(), "no connect permission");
            }
        });
    }

    public void multifunctionalKeyPadAddCard(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                long startDate = Long.valueOf(params.get(TTParam.startDate).toString());
                long endDate = Long.valueOf(params.get(TTParam.endDate).toString());
                String lockData = (String) params.get(TTParam.LOCK_DATA);
                String cycleJsonList = params.get(TTParam.cycleJsonList) == null ? "" : (String) params.get(TTParam.cycleJsonList);
                ValidityInfo info = new ValidityInfo();
                info.setStartDate(startDate);
                info.setEndDate(endDate);
                if (!cycleJsonList.isEmpty()) {
                    List<CyclicConfig> cycleList = new Gson().fromJson(cycleJsonList, new TypeToken<List<CyclicConfig>>() {
                    }.getType());
                    info.setCyclicConfigs(cycleList);
                    info.setModeType(ValidityInfo.CYCLIC);
                }
                MultifunctionalKeypadClient.getDefault().addCard(lockData,
                        info, new AddCardCallback() {
                            @Override
                            public void onKeypadFail(MultifunctionalKeypadError multifunctionalKeypadError) {
                                HashMap<String, Object> map = new HashMap<>();
                                map.put("errorDevice", 1);
                                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD, ResultStateFail, map, multifunctionalKeypadError.getErrorCode(), multifunctionalKeypadError.getDescription());

                            }

                            @Override
                            public void onEnterAddingMode() {
                                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD,
                                        ResultStateProgress, new HashMap() {
                                        }, -1, "");
                            }

                            @Override
                            public void onAddCardSuccess(long l) {
                                HashMap hashMap = new HashMap<>();
                                hashMap.put("cardNumber", String.valueOf(l));
                                successCallbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD, hashMap);
                            }

                            @Override
                            public void onLockFail(LockError lockError) {
                                HashMap<String, Object> map = new HashMap<>();
                                map.put("errorDevice", 0);
                                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD, ResultStateFail, map, lockError.getIntErrorCode(), lockError.getDescription());

                            }
                        });
            } else {
                callbackCommand(TTKeyPadCommand.COMMAND_MULTIFUNCTIONAL_REMOTE_KEYPAD_ADD_CARD, ResultStateFail, params, LockError.LOCK_NO_PERMISSION.getIntErrorCode(), "no connect permission");
            }
        });

    }


    /**
     * ---------------------- remote -------------------------
     **/

    public void startScanRemote() {
        PermissionUtils.doWithScanPermission(activity, success -> {
            if (success) {
                RemoteClient.getDefault().startScan(new ScanRemoteCallback() {
                    @Override
                    public void onScanRemote(Remote remote) {
                        TTRemoteScanModel ttRemoteScanModel = new TTRemoteScanModel();
                        ttRemoteScanModel.mac = remote.getAddress();
                        ttRemoteScanModel.name = remote.getName();
                        ttRemoteScanModel.rssi = remote.getRssi();
                        successCallbackCommand(TTRemoteCommand.COMMAND_START_SCAN_REMOTE, ttRemoteScanModel.toMap());
                    }
                });
            } else {
                LogUtil.d("no scan permission");
            }
        });
    }

    public void stopScanRemote() {
        RemoteClient.getDefault().stopScan();
    }

    public void initRemote(Map<String, Object> params) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                BluetoothDevice device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice((String) params.get(TTParam.MAC));
                Remote remote = new Remote(device);
                RemoteClient.getDefault().initialize(remote, (String) params.get(TTParam.LOCK_DATA), new InitRemoteCallback() {
                    @Override
                    public void onInitSuccess(InitRemoteResult initRemoteResult) {
                        params.put(TTParam.ELECTRIC_QUANTITY, initRemoteResult.getBatteryLevel());
                        params.put(TTParam.MODEL_NUM, initRemoteResult.getSystemInfo().getModelNum());
                        params.put(TTParam.FIRMWARE_REVISION, initRemoteResult.getSystemInfo().getFirmwareRevision());
                        params.put(TTParam.HARD_WARE_REVISION, initRemoteResult.getSystemInfo().getHardwareRevision());
                        successCallbackCommand(TTRemoteCommand.COMMAND_INIT_REMOTE, params);
                    }

                    @Override
                    public void onFail(RemoteError remoteError) {
                        errorCallbackCommand(TTRemoteCommand.COMMAND_INIT_REMOTE, remoteError);
                    }
                });
            } else {
                callbackCommand(TTRemoteCommand.COMMAND_INIT_REMOTE, ResultStateFail, params, RemoteError.FAILED.getErrorCode(), "no connect permission");
            }
        });
    }

    public void startScanGateway() {
        GatewayClient.getDefault().prepareBTService(activity);
        GatewayClient.getDefault().startScanGateway(new ScanGatewayCallback() {
            @Override
            public void onScanGatewaySuccess(ExtendedBluetoothDevice device) {
                TTGatewayScanModel ttGatewayScanModel = new TTGatewayScanModel();
                ttGatewayScanModel.gatewayMac = device.getAddress();
                ttGatewayScanModel.gatewayName = device.getName();
                ttGatewayScanModel.isDfuMode = device.isDfuMode();
                ttGatewayScanModel.rssi = device.getRssi();
                ttGatewayScanModel.type = device.getGatewayType() - 1;//对应flutter编号
                successCallbackCommand(GatewayCommand.COMMAND_START_SCAN_GATEWAY, ttGatewayScanModel.toMap());
            }

            @Override
            public void onScanFailed(int errorCode) {

            }
        });
    }

    public void stopScanGateway() {
        GatewayClient.getDefault().stopScanGateway();
    }

    public void connectGateway(final GatewayModel gatewayModel) {
        final HashMap<String, Object> resultMap = new HashMap<>();
        GatewayClient.getDefault().connectGateway(gatewayModel.mac, new ConnectCallback() {
            @Override
            public void onConnectSuccess(ExtendedBluetoothDevice device) {
                resultMap.put("status", TTGatewayConnectStatus.success);
                successCallbackCommand(GatewayCommand.COMMAND_CONNECT_GATEWAY, resultMap);
            }

            @Override
            public void onDisconnected() {//todo:比ios少一个错误码
                callbackCommand(GatewayCommand.COMMAND_CONNECT_GATEWAY, ResultStateFail, gatewayModel.toMap(), TTGatewayConnectStatus.timeout, "disconnect gateway");
            }
        });
    }

    public void disconnectGateway() {//todo:
        GatewayClient.getDefault().disconnectGateway();
        successCallbackCommand(GatewayCommand.COMMAND_DISCONNECT_GATEWAY, null);
    }

    public void gatewayConfigIp(final GatewayModel gatewayModel) {
        String ipSettingJson = gatewayModel.ipSettingJsonStr;
        if (TextUtils.isEmpty(ipSettingJson)) {
            errorCallbackCommand(GatewayCommand.COMMAND_CONFIG_IP, GatewayError.DATA_FORMAT_ERROR);
            return;
        }
        IpSetting ipSetting = GsonUtil.toObject(ipSettingJson, IpSetting.class);
        GatewayClient.getDefault().configIp(gatewayModel.mac, ipSetting, new ConfigIpCallback() {
            @Override
            public void onConfigIpSuccess() {
                successCallbackCommand(GatewayCommand.COMMAND_CONFIG_IP, null);
            }

            @Override
            public void onFail(GatewayError gatewayError) {
                errorCallbackCommand(GatewayCommand.COMMAND_CONFIG_IP, gatewayError);
            }
        });
    }

    public void enterGatewayDfuMode() {
        successCallbackCommand(GatewayCommand.COMMAND_UPGRADE_GATEWAY, null);
    }

    public void gatewayConfigApn(final GatewayModel gatewayModel) {
        GatewayClient.getDefault().configApn(gatewayModel.mac, gatewayModel.apn, new ConfigApnCallback() {
            @Override
            public void onConfigSuccess() {
                successCallbackCommand(GatewayCommand.COMMAND_CONFIG_APN, null);
            }

            @Override
            public void onFail(GatewayError gatewayError) {
                errorCallbackCommand(GatewayCommand.COMMAND_CONFIG_APN, gatewayError);
            }
        });
    }

    public void getNetworkMac(final GatewayModel gatewayModel) {
        GatewayClient.getDefault().getNetworkMac(new GetNetworkMacCallback() {
            @Override
            public void onGetNetworkMacSuccess(String mac) {
                HashMap<String, Object> resultMap = new HashMap<>();
                resultMap.put("networkMac", mac);
                successCallbackCommand(GatewayCommand.COMMAND_GET_NETWORK_MAC, resultMap);
            }

            @Override
            public void onFail(GatewayError gatewayError) {
                HashMap<String, Object> resultMap = new HashMap<>();
                resultMap.put("networkMac", "");
                successCallbackCommand(GatewayCommand.COMMAND_GET_NETWORK_MAC, resultMap);
            }
        });
    }

    public void getSurroundWifi(final GatewayModel gatewayModel) {
        final HashMap<String, Object> resultMap = new HashMap<>();
        GatewayClient.getDefault().scanWiFiByGateway(gatewayModel.mac, new ScanWiFiByGatewayCallback() {
            @Override
            public void onScanWiFiByGateway(List<WiFi> wiFis) {
                List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
                for (WiFi wiFi : wiFis) {
                    HashMap<String, Object> wifiMap = new HashMap<>();
                    wifiMap.put("wifi", wiFi.ssid);
                    wifiMap.put("rssi", wiFi.rssi);
                    mapList.add(wifiMap);
                }
                resultMap.put("finished", false);
                resultMap.put("wifiList", mapList);
                successCallbackCommand(GatewayCommand.COMMAND_GET_SURROUND_WIFI, resultMap);
            }

            @Override
            public void onScanWiFiByGatewaySuccess() {
                resultMap.put("finished", true);
                successCallbackCommand(GatewayCommand.COMMAND_GET_SURROUND_WIFI, resultMap);
            }

            @Override
            public void onFail(GatewayError error) {
                errorCallbackCommand(GatewayCommand.COMMAND_GET_SURROUND_WIFI, error);
            }
        });
    }

    public void initGateway(final GatewayModel gatewayModel) {
        ConfigureGatewayInfo configureGatewayInfo = new ConfigureGatewayInfo();
        configureGatewayInfo.plugName = gatewayModel.gatewayName;
        configureGatewayInfo.plugVersion = gatewayModel.type + 1;
        if (configureGatewayInfo.plugVersion == 2 || configureGatewayInfo.plugVersion == 5) {
            configureGatewayInfo.ssid = gatewayModel.wifi;
            configureGatewayInfo.wifiPwd = gatewayModel.wifiPassword;
        }
        configureGatewayInfo.uid = gatewayModel.ttlockUid;
        configureGatewayInfo.userPwd = gatewayModel.ttlockLoginPassword;

        configureGatewayInfo.companyId = gatewayModel.companyId;
        configureGatewayInfo.branchId = gatewayModel.branchId;


        if (!TextUtils.isEmpty(gatewayModel.serverIp)) {
            configureGatewayInfo.server = gatewayModel.serverIp;
        }
        if (!TextUtils.isEmpty(gatewayModel.serverPort) && DigitUtil.isNumeric(gatewayModel.serverPort)) {
            configureGatewayInfo.port = Integer.valueOf(gatewayModel.serverPort);
        }
//    configureGatewayInfo.uid = 8409;
//    configureGatewayInfo.userPwd = "xtc123456";

        GatewayClient.getDefault().initGateway(configureGatewayInfo, new InitGatewayCallback() {
            @Override
            public void onInitGatewaySuccess(DeviceInfo deviceInfo) {
                HashMap<String, Object> gatewayInfoMap = new HashMap<>();
                gatewayInfoMap.put("modelNum", deviceInfo.modelNum);
                gatewayInfoMap.put("hardwareRevision", deviceInfo.hardwareRevision);
                gatewayInfoMap.put("firmwareRevision", deviceInfo.firmwareRevision);
                gatewayInfoMap.put("networkMac", deviceInfo.networkMac);
                successCallbackCommand(GatewayCommand.COMMAND_INIT_GATEWAY, gatewayInfoMap);
            }

            @Override
            public void onFail(GatewayError error) {
                errorCallbackCommand(GatewayCommand.COMMAND_INIT_GATEWAY, error);
            }
        });
    }

    public void doNextCommandAction() {
        if (commandQue.size() == 0) {
            return;
        }
        commandTimeOutCheck();
        CommandObj commandObj = commandQue.peek();
        if (commandObj == null || !commandObj.isValid()) {
            apiFail(LockError.INVALID_COMMAND);
            return;
        }
        String command = commandObj.getCommand();
        TtlockModel ttlockModel = commandObj.getTtlockModel();
        switch (command) {
            case TTLockCommand.COMMAND_INIT_LOCK:
                initLock(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CONTROL_LOCK:
                controlLock(ttlockModel);
                break;
            case TTLockCommand.COMMAND_RESET_LOCK:
                resetLock(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_TIME:
                getLockTime(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LOCK_TIME:
                setLockTime(ttlockModel);
                break;
            case TTLockCommand.COMMAND_MODIFY_PASSCODE:
                modifyPasscode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CREATE_CUSTOM_PASSCODE:
                setCustomPasscode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_RESET_PASSCODE:
                resetPasscodes(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_OPERATE_RECORD:
                getOperationLog(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_SWITCH_STATE:
                getSwitchStatus(ttlockModel);
                break;
            case TTLockCommand.COMMAND_DELETE_PASSCODE:
                deletePasscode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_MODIFY_ADMIN_PASSCODE:
                setAdminPasscode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_ADMIN_PASSCODE:
                getAdminPasscode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_ADD_CARD:
                addICCard(ttlockModel);
                break;
            case TTLockCommand.COMMAND_MODIFY_CARD:
                modifyICCard(ttlockModel);
                break;
            case TTLockCommand.COMMAND_DELETE_CARD:
                deleteICCard(ttlockModel);
                break;
            case TTLockCommand.COMMAND_ADD_FINGERPRINT:
                addFingerPrint(ttlockModel);
                break;
            case TTLockCommand.COMMAND_MODIFY_FINGERPRINT:
                modifyFingerPrint(ttlockModel);
                break;
            case TTLockCommand.COMMAND_DELETE_FINGERPRINT:
                deleteFingerPrint(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CLEAR_ALL_CARD:
                clearICCard(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CLEAR_ALL_FINGERPRINT:
                clearFingerPrint(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_POWER:
                getBattery(ttlockModel);
                break;
            case TTLockCommand.COMMAND_ADD_PASSAGE_MODE:
                addPassageMode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CLEAR_ALL_PASSAGE_MODE:
                clearPassageMode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_AUTOMATIC_LOCK_PERIODIC_TIME:
                setAutoLockTime(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_AUTOMATIC_LOCK_PERIODIC_TIME:
                getAutoLockTime(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LOCK_REMOTE_UNLOCK_SWITCH_STATE:
                setRemoteUnlockSwitch(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_REMOTE_UNLOCK_SWITCH_STATE:
                getRemoteUnlockSwitch(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LOCK_CONFIG:
                setLockConfig(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_CONFIG:
                getLockConfig(ttlockModel);
                break;
            case TTLockCommand.COMMAND_RESET_EKEY:
                resetEKey(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LIFT_CONTROLABLE_FLOORS:
                setLiftControlableFloors(ttlockModel);
                break;
            case TTLockCommand.COMMAND_ACTIVE_LIFT_FLOORS:
                activateLiftFloors(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_HOTEL_CARD_SECTOR:
                setHotelSector(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_HOTEL_INFO:
                setHotelData(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LIFT_WORK_MODE:
                setLiftWorkMode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_POWSER_SAVER_WORK_MODE:
                setPowerSaverWorkMode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_NB_AWAKE_MODES:
                setNbAwakeModes(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_NB_AWAKE_TIMES:
                setNbAwakeTimes(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_NB_AWAKE_MODES:
                getNbAwakeModes(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_NB_AWAKE_TIMES:
                getNbAwakeTimes(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_POWSER_SAVER_CONTROLABLE:
                setPowerSaverControlableLock(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_ALL_VALID_PASSCODE:
                getAllValidPasscodes(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_ALL_VALID_CARD:
                getAllValidCards(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_ALL_VALID_FINGERPRINT:
                getAllValidFingerPrints(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_NB_SERVER_INFO:
                setNBServerInfo(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_SYSTEM_INFO:
                getLockSystemInfo(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_PASSCODE_VERIFICATION_PARAMS:
                getPasscodeVerificationParams(ttlockModel);
                break;
            case TTLockCommand.COMMAND_REPORT_LOSS_CARD:
                reportLossICCard(ttlockModel);
                break;
            case TTLockCommand.COMMAND_RECOVER_CARD:
                recoveryCard(ttlockModel);
                break;
            case TTLockCommand.COMMAND_RECOVER_PASSCODE:
                recoveryPasscode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_VERSION:
                getLockVersion(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LOCK_WORKING_TIME:
                setLockWorkingTime(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SCAN_WIFI:
                wifiLockGetNearbyWifi(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CONFIG_WIFI:
                configWifi(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CONFIG_SERVER:
                configServer(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_WIFI_INFO:
                getWifiInfo(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CONFIG_IP:
                configIp(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CONFIG_CAMERA_LOCK_WIFI:
                configCameraLockWifi(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LOCK_SOUND_WITH_SOUND_VOLUME:
                setLockSoundWithSoundVolume(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME:
                getLockSoundWithSoundVolume(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LOCK_DOOR_SENSORY_ALERT_TIME:
                setDoorSensorAlertTime(ttlockModel);
                break;
            case TTLockCommand.COMMAND_ADD_LOCK_REMOTE_KEY:
                addRemoteKey(ttlockModel);
                break;
            case TTLockCommand.COMMAND_DELETE_LOCK_REMOTE_KEY:
                deleteRemoteKey(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LOCK_REMOTE_KEY_VALID_DATE:
                modifyRemoteKey(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_REMOTE_ACCESSORY_ELECTRIC_QUANTITY:
                getAccessoryElectricQuantity(ttlockModel);
                break;
            case TTLockCommand.COMMAND_ADD_LOCK_DOOR_SENSORY:
                addDoorSensor(ttlockModel);
                break;
            case TTLockCommand.COMMAND_DELETE_LOCK_DOOR_SENSORY:
                deleteDoorSensor(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CLEAR_REMOTE_KEY:
                clearRemote(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_FRETURE_VALUE:
                getFeatureValue(ttlockModel);
                break;
            case TTLockCommand.COMMAND_GET_LOCK_DIRECTION:
                getUnlockDirection(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_LOCK_DIRECTION:
                setUnlockDirection(ttlockModel);
                break;
            case TTLockCommand.COMMAND_RESET_LOCK_BY_CODE:
                resetLockByCode(ttlockModel);
                break;
            case TTLockCommand.COMMAND_VERIFY_LOCK:
                verifyLock(ttlockModel);
                break;
            case TTLockCommand.COMMAND_ADD_FACE:
                addFace(ttlockModel);
                break;
            case TTLockCommand.COMMAND_ADD_FACE_DATA:
                addFaceData(ttlockModel);
                break;
            case TTLockCommand.COMMAND_MODIFY_FACE:
                modifyFace(ttlockModel);
                break;
            case TTLockCommand.COMMAND_DELETE_FACE:
                deleteFace(ttlockModel);
                break;
            case TTLockCommand.COMMAND_CLEAR_FACE:
                clearFace(ttlockModel);
                break;
            case TTLockCommand.COMMAND_SET_SENSITIVITY:
                setSensitivity(ttlockModel);
                break;
            default:
                apiFail(LockError.INVALID_COMMAND);
                LogUtil.d("unknown command:" + command);
                break;
        }
    }

    public void verifyLock(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().verifyLock(ttlockModel.lockMac, new VerifyLockCallback() {
                    @Override
                    public void onVerifySuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    private void commandTimeOutCheck() {
        commandTimeOutCheck(COMMAND_TIME_OUT);
    }

    private void commandTimeOutCheck(long timeOut) {
        if (handler != null) {
            handler.postDelayed(commandTimeOutRunable, timeOut);
        }
    }

    private void removeCommandTimeOutRunable() {
        if (handler != null) {
            handler.removeCallbacks(commandTimeOutRunable);
        }
    }

    public void setupPlug(TtlockModel ttlockModel) {
        TTLockClient.getDefault().prepareBTService(activity);
        //todo:
        ttlockModel.state = TTBluetoothState.turnOn.ordinal();
        commandQue.clear();
//    removeCommandTimeOutRunable();
        successCallbackCommand(TTLockCommand.COMMAND_SETUP_PUGIN, ttlockModel.toMap());

//    doNextCommandAction();
    }

    public void clearCommand() {
        if (commandQue != null) {
            commandQue.clear();
        }
    }

    public void startScan() {
        TTLockClient.getDefault().startScanLock(new ScanLockCallback() {
            @Override
            public void onScanLockSuccess(ExtendedBluetoothDevice extendedBluetoothDevice) {
                TtlockModel data = new TtlockModel();
                data.electricQuantity = extendedBluetoothDevice.getBatteryCapacity();
                data.lockName = extendedBluetoothDevice.getName();
                data.lockMac = extendedBluetoothDevice.getAddress();
                data.isInited = !extendedBluetoothDevice.isSettingMode();
                data.isAllowUnlock = extendedBluetoothDevice.isTouch();
                data.lockVersion = extendedBluetoothDevice.getLockVersionJson();
                data.rssi = extendedBluetoothDevice.getRssi();
                data.timestamp = extendedBluetoothDevice.getDate();
                successCallbackCommand(TTLockCommand.COMMAND_START_SCAN_LOCK, data.toMap());
//              data.lockSwitchState = @(scanModel.lockSwitchState);
//              data.oneMeterRssi = @(scanModel.oneMeterRSSI);
            }

            @Override
            public void onFail(LockError lockError) {//todo:
                LogUtil.d("lockError:" + lockError);
            }
        });
    }

    public void stopScan() {
        TTLockClient.getDefault().stopScanLock();
    }

    public void initLock(final TtlockModel ttlockModel) {

        ExtendedBluetoothDevice extendedBluetoothDevice = new ExtendedBluetoothDevice();
        BluetoothDevice device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(ttlockModel.lockMac);
        extendedBluetoothDevice.setDevice(device);
        extendedBluetoothDevice.setAddress(ttlockModel.lockMac);

        LockVersion lockVersion = GsonUtil.toObject(ttlockModel.lockVersion, LockVersion.class);
        extendedBluetoothDevice.setProtocolType(lockVersion.getProtocolType());
        extendedBluetoothDevice.setProtocolVersion(lockVersion.getProtocolVersion());
        extendedBluetoothDevice.setScene(lockVersion.getScene());

        extendedBluetoothDevice.setSettingMode(!ttlockModel.isInited);

        if (!TextUtils.isEmpty(ttlockModel.clientPara)) {
            extendedBluetoothDevice.setManufacturerId(ttlockModel.clientPara);
        }

        if (!TextUtils.isEmpty(ttlockModel.hotelInfo)) {
            HotelData hotelData = new HotelData();
            hotelData.setHotelInfo(ttlockModel.hotelInfo);
            hotelData.setBuildingNumber(ttlockModel.buildingNumber);
            hotelData.setFloorNumber(ttlockModel.floorNumber);
            extendedBluetoothDevice.setHotelData(hotelData);
        }

        TTLockClient.getDefault().initLock(extendedBluetoothDevice, new InitLockCallback() {
            @Override
            public void onInitLockSuccess(String lockData) {
                ttlockModel.lockData = lockData;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void controlLock(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().controlLock(ttlockModel.getControlActionValue(), ttlockModel.lockData, new ControlLockCallback() {

            @Override
            public void onControlLockSuccess(ControlLockResult controlLockResult) {
                ttlockModel.lockTime = controlLockResult.lockTime;
                ttlockModel.controlAction = controlLockResult.controlAction;
                ttlockModel.electricQuantity = controlLockResult.battery;
                ttlockModel.uniqueId = controlLockResult.uniqueid;
                if (controlLockResult.lockData != null) {
                    ttlockModel.lockData = controlLockResult.lockData;
                }
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void resetLock(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().resetLock(ttlockModel.lockData, new ResetLockCallback() {
            @Override
            public void onResetLockSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getLockTime(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getLockTime(ttlockModel.lockData, new GetLockTimeCallback() {

            @Override
            public void onGetLockTimeSuccess(long lockTimestamp) {
                ttlockModel.timestamp = lockTimestamp;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setLockTime(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().setLockTime(ttlockModel.timestamp, ttlockModel.lockData, new SetLockTimeCallback() {
            @Override
            public void onSetTimeSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setLockWorkingTime(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().setLockWorkingTime(ttlockModel.startDate, ttlockModel.endDate, ttlockModel.lockData, new SetLockWorkingTimeCallback() {
            @Override
            public void onSetSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getOperationLog(final TtlockModel ttlockModel) {
        //long period operation
        removeCommandTimeOutRunable();
//    commandTimeOutCheck(4 * COMMAND_TIME_OUT);

        TTLockClient.getDefault().getOperationLog(ttlockModel.logType, ttlockModel.lockData, new GetOperationLogCallback() {
            @Override
            public void onGetLogSuccess(String log) {
                ttlockModel.records = log;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getSwitchStatus(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getLockStatus(ttlockModel.lockData, new GetLockStatusCallback() {
            @Override
            public void onGetLockStatusSuccess(int status) {
                ttlockModel.lockSwitchState = status;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onGetDoorSensorStatusSuccess(int status) {

            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setAdminPasscode(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().modifyAdminPasscode(ttlockModel.adminPasscode, ttlockModel.lockData, new ModifyAdminPasscodeCallback() {
            @Override
            public void onModifyAdminPasscodeSuccess(String passcode) {
                ttlockModel.adminPasscode = passcode;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setCustomPasscode(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().createCustomPasscode(ttlockModel.passcode, ttlockModel.startDate, ttlockModel.endDate, ttlockModel.lockData, new CreateCustomPasscodeCallback() {
            @Override
            public void onCreateCustomPasscodeSuccess(String passcode) {
                ttlockModel.passcode = passcode;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void modifyPasscode(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().modifyPasscode(ttlockModel.passcodeOrigin, ttlockModel.passcodeNew, ttlockModel.startDate, ttlockModel.endDate, ttlockModel.lockData, new ModifyPasscodeCallback() {
            @Override
            public void onModifyPasscodeSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void deletePasscode(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().deletePasscode(ttlockModel.passcode, ttlockModel.lockData, new DeletePasscodeCallback() {
            @Override
            public void onDeletePasscodeSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void resetPasscodes(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().resetPasscode(ttlockModel.lockData, new ResetPasscodeCallback() {
            @Override
            public void onResetPasscodeSuccess(String lockData) {
                ttlockModel.lockData = lockData;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void addICCard(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        TTLockClient.getDefault().addICCard(validityInfo, ttlockModel.lockData, new AddICCardCallback() {
            @Override
            public void onEnterAddMode() {
                //重新设置超时时间
                removeCommandTimeOutRunable();
                commandTimeOutCheck();
                progressCallbackCommand(commandQue.peek(), ttlockModel.toMap());
            }

            @Override
            public void onAddICCardSuccess(long cardNum) {
                ttlockModel.cardNumber = String.valueOf(cardNum);
                successCallbackCommand(commandQue.poll(), ttlockModel.toMap());
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void modifyICCard(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        TTLockClient.getDefault().modifyICCardValidityPeriod(validityInfo, ttlockModel.cardNumber, ttlockModel.lockData, new ModifyICCardPeriodCallback() {
            @Override
            public void onModifyICCardPeriodSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void deleteICCard(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().deleteICCard(ttlockModel.cardNumber, ttlockModel.lockData, new DeleteICCardCallback() {
            @Override
            public void onDeleteICCardSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void clearICCard(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().clearAllICCard(ttlockModel.lockData, new ClearAllICCardCallback() {
            @Override
            public void onClearAllICCardSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void addFingerPrint(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        TTLockClient.getDefault().addFingerprint(validityInfo, ttlockModel.lockData, new AddFingerprintCallback() {
            @Override
            public void onEnterAddMode(int totalCount) {
                //重新设置超时时间
                removeCommandTimeOutRunable();
                commandTimeOutCheck();
                ttlockModel.totalCount = totalCount;
                ttlockModel.currentCount = 0;
                progressCallbackCommand(commandQue.peek(), ttlockModel.toMap());
            }

            @Override
            public void onCollectFingerprint(int currentCount) {
                //重新设置超时时间
                removeCommandTimeOutRunable();
                commandTimeOutCheck();
                ttlockModel.currentCount = currentCount;
                progressCallbackCommand(commandQue.peek(), ttlockModel.toMap());
            }

            @Override
            public void onAddFingerpintFinished(long fingerprintNum) {
                ttlockModel.fingerprintNumber = String.valueOf(fingerprintNum);
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void modifyFingerPrint(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        TTLockClient.getDefault().modifyFingerprintValidityPeriod(validityInfo, ttlockModel.fingerprintNumber, ttlockModel.lockData, new ModifyFingerprintPeriodCallback() {
            @Override
            public void onModifyPeriodSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void deleteFingerPrint(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().deleteFingerprint(ttlockModel.fingerprintNumber, ttlockModel.lockData, new DeleteFingerprintCallback() {
            @Override
            public void onDeleteFingerprintSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void clearFingerPrint(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().clearAllFingerprints(ttlockModel.lockData, new ClearAllFingerprintCallback() {
            @Override
            public void onClearAllFingerprintSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getBattery(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getBatteryLevel(ttlockModel.lockData, new GetBatteryLevelCallback() {
            @Override
            public void onGetBatteryLevelSuccess(int electricQuantity) {
                ttlockModel.electricQuantity = electricQuantity;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setAutoLockTime(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().setAutomaticLockingPeriod(ttlockModel.currentTime, ttlockModel.lockData, new SetAutoLockingPeriodCallback() {
            @Override
            public void onSetAutoLockingPeriodSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getAutoLockTime(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getAutomaticLockingPeriod(ttlockModel.lockData, new GetAutoLockingPeriodCallback() {
            @Override
            public void onGetAutoLockingPeriodSuccess(int currtentTime, int minTime, int maxTime) {
                ttlockModel.currentTime = currtentTime;
                ttlockModel.minTime = minTime;
                ttlockModel.maxTime = maxTime;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setRemoteUnlockSwitch(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().setRemoteUnlockSwitchState(ttlockModel.isOn, ttlockModel.lockData, new SetRemoteUnlockSwitchCallback() {
            @Override
            public void onSetRemoteUnlockSwitchSuccess(String lockData) {
                ttlockModel.lockData = lockData;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getRemoteUnlockSwitch(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getRemoteUnlockSwitchState(ttlockModel.lockData, new GetRemoteUnlockStateCallback() {
            @Override
            public void onGetRemoteUnlockSwitchStateSuccess(boolean enabled) {
                ttlockModel.isOn = enabled;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void addPassageMode(final TtlockModel ttlockModel) {
        PassageModeConfig passageModeConfig = new PassageModeConfig();
        PassageModeType passageModeType = PassageModeType.class.getEnumConstants()[ttlockModel.passageModeType];
        passageModeConfig.setModeType(passageModeType);
        String repeatJson = GsonUtil.toJson(ttlockModel.weekly);
        if (passageModeType == PassageModeType.Monthly) {
            repeatJson = GsonUtil.toJson(ttlockModel.monthly);
        }
        passageModeConfig.setRepeatWeekOrDays(repeatJson);
        passageModeConfig.setStartDate((int) ttlockModel.startDate);
        passageModeConfig.setEndDate((int) ttlockModel.endDate);

        TTLockClient.getDefault().setPassageMode(passageModeConfig, ttlockModel.lockData, new SetPassageModeCallback() {
            @Override
            public void onSetPassageModeSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void clearPassageMode(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().clearPassageMode(ttlockModel.lockData, new ClearPassageModeCallback() {
            @Override
            public void onClearPassageModeSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setLockConfig(final TtlockModel ttlockModel) {
        TTLockConfigType ttLockConfigType = TTLockConfigConverter.flutter2Native(ttlockModel.lockConfig);

        if (ttLockConfigType == null) {
            dataError();
            return;
        }

        LogUtil.d("ttLockConfigType:" + ttLockConfigType);
        TTLockClient.getDefault().setLockConfig(ttLockConfigType, ttlockModel.isOn, ttlockModel.lockData, new SetLockConfigCallback() {
            @Override
            public void onSetLockConfigSuccess(TTLockConfigType ttLockConfigType) {
                LogUtil.d("ttLockConfigType:" + ttLockConfigType);
                ttlockModel.lockConfig = TTLockConfigConverter.native2Flutter(ttLockConfigType);
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getLockConfig(final TtlockModel ttlockModel) {
        TTLockConfigType ttLockConfigType = TTLockConfigConverter.flutter2Native(ttlockModel.lockConfig);

        if (ttLockConfigType == null) {
            dataError();
            return;
        }
        LogUtil.d("ttLockConfigType:" + ttLockConfigType);
        TTLockClient.getDefault().getLockConfig(ttLockConfigType, ttlockModel.lockData, new GetLockConfigCallback() {
            @Override
            public void onGetLockConfigSuccess(TTLockConfigType ttLockConfigType, boolean switchOn) {
                ttlockModel.lockConfig = TTLockConfigConverter.native2Flutter(ttLockConfigType);
                ttlockModel.isOn = switchOn;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void resetEKey(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().resetEkey(ttlockModel.lockData, new ResetKeyCallback() {
            @Override
            public void onResetKeySuccess(String lockData) {
                ttlockModel.lockData = lockData;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void activateLiftFloors(final TtlockModel ttlockModel) {
        List<Integer> floorList = ttlockModel.getFloorList();
        if (floorList == null || floorList.size() == 0) {
            dataError();
            return;
        }
        long currentTime = System.currentTimeMillis();//todo:暂时使用手机时间
        TTLockClient.getDefault().activateLiftFloors(floorList, currentTime, ttlockModel.lockData, new ActivateLiftFloorsCallback() {
            @Override
            public void onActivateLiftFloorsSuccess(ActivateLiftFloorsResult activateLiftFloorsResult) {
                ttlockModel.lockTime = activateLiftFloorsResult.deviceTime;
                ttlockModel.uniqueId = activateLiftFloorsResult.uniqueid;
                ttlockModel.electricQuantity = activateLiftFloorsResult.battery;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setLiftControlableFloors(final TtlockModel ttlockModel) {
        if (TextUtils.isEmpty(ttlockModel.floors)) {
            dataError();
            return;
        }
        TTLockClient.getDefault().setLiftControlableFloors(ttlockModel.floors, ttlockModel.lockData, new SetLiftControlableFloorsCallback() {
            @Override
            public void onSetLiftControlableFloorsSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setLiftWorkMode(final TtlockModel ttlockModel) {
        TTLiftWorkMode ttLiftWorkMode = LiftWorkModeConverter.flutter2Native(ttlockModel.liftWorkActiveType);
        if (ttLiftWorkMode == null) {
            dataError();
            return;
        }
        TTLockClient.getDefault().setLiftWorkMode(ttLiftWorkMode, ttlockModel.lockData, new SetLiftWorkModeCallback() {
            @Override
            public void onSetLiftWorkModeSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setPowerSaverWorkMode(final TtlockModel ttlockModel) {
        PowerSaverWorkMode powerSaverWorkMode = PowerSaverWorkModeConverter.flutter2Native(ttlockModel.powerSaverType);
        if (powerSaverWorkMode == null) {
            dataError();
            return;
        }
        TTLockClient.getDefault().setPowerSaverWorkMode(powerSaverWorkMode, ttlockModel.lockData, new SetPowerSaverWorkModeCallback() {
            @Override
            public void onSetPowerSaverWorkModeSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setPowerSaverControlableLock(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().setPowerSaverControlableLock(ttlockModel.lockMac, ttlockModel.lockData, new SetPowerSaverControlableLockCallback() {
            @Override
            public void onSetPowerSaverControlableLockSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setNbAwakeModes(final TtlockModel ttlockModel) {
        List<NBAwakeMode> nbAwakeModeList = ttlockModel.getNbAwakeModeList();
        if (nbAwakeModeList == null || nbAwakeModeList.size() == 0) {
            dataError();
            return;
        }
        TTLockClient.getDefault().setNBAwakeModes(nbAwakeModeList, ttlockModel.lockData, new SetNBAwakeModesCallback() {
            @Override
            public void onSetNBAwakeModesSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getNbAwakeModes(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getNBAwakeModes(ttlockModel.lockData, new GetNBAwakeModesCallback() {
            @Override
            public void onGetNBAwakeModesSuccess(List<NBAwakeMode> list) {
                ttlockModel.setNbAwakeModeList(list);
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setNbAwakeTimes(final TtlockModel ttlockModel) {
        List<NBAwakeTime> nbAwakeTimeList = ttlockModel.getNbAwakeTimeList();
        if (nbAwakeTimeList == null || nbAwakeTimeList.size() == 0) {
            dataError();
            return;
        }
        TTLockClient.getDefault().setNBAwakeTimes(nbAwakeTimeList, ttlockModel.lockData, new SetNBAwakeTimesCallback() {
            @Override
            public void onSetNBAwakeTimesSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getNbAwakeTimes(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getNBAwakeTimes(ttlockModel.lockData, new GetNBAwakeTimesCallback() {
            @Override
            public void onGetNBAwakeTimesSuccess(List<NBAwakeTime> list) {
                ttlockModel.setNbAwakeTimeList(list);
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setHotelData(final TtlockModel ttlockModel) {
        if (TextUtils.isEmpty(ttlockModel.hotelInfo)) {
            dataError();
            return;
        }
        HotelData hotelData = new HotelData();
        hotelData.setHotelInfo(ttlockModel.hotelInfo);
        hotelData.setBuildingNumber(ttlockModel.buildingNumber);
        hotelData.setFloorNumber(ttlockModel.floorNumber);
        TTLockClient.getDefault().setHotelData(hotelData, ttlockModel.lockData, new SetHotelDataCallback() {
            @Override
            public void onSetHotelDataSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setHotelSector(final TtlockModel ttlockModel) {
        if (TextUtils.isEmpty(ttlockModel.sector)) {
            dataError();
            return;
        }
        TTLockClient.getDefault().setHotelCardSector(ttlockModel.sector, ttlockModel.lockData, new SetHotelCardSectorCallback() {
            @Override
            public void onSetHotelCardSectorSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getBluetoothState(TtlockModel ttlockModel) {
        //4-off 5-on
        ttlockModel.state = TTLockClient.getDefault().isBLEEnabled(activity) ? 5 : 4;
        successCallbackCommand(TTLockCommand.COMMAND_GET_BLUETOOTH_STATE, ttlockModel.toMap());
    }

    public void getAllValidFingerPrints(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getAllValidFingerprints(ttlockModel.lockData, new GetAllValidFingerprintCallback() {
            @Override
            public void onGetAllFingerprintsSuccess(String fingerprintStr) {
                ttlockModel.fingerprintListString = fingerprintStr;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getAllValidPasscodes(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getAllValidPasscodes(ttlockModel.lockData, new GetAllValidPasscodeCallback() {
            @Override
            public void onGetAllValidPasscodeSuccess(String passcodeStr) {
                ttlockModel.passcodeListString = passcodeStr;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getAllValidCards(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getAllValidICCards(ttlockModel.lockData, new GetAllValidICCardCallback() {
            @Override
            public void onGetAllValidICCardSuccess(String cardListStr) {
                ttlockModel.cardListString = cardListStr;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

//  public void setNBServerInfo(final TtlockModel ttlockModel) {
//    TTLockClient.getDefault().setNBServerInfo(Integer.valueOf(ttlockModel.port).shortValue() , ttlockModel.ip, ttlockModel.lockData, new SetNBServerCallback() {
//      @Override
//      public void onSetNBServerSuccess(int battery) {
//        ttlockModel.electricQuantity = battery;
//        apiSuccess(ttlockModel);
//      }
//
//      @Override
//      public void onFail(LockError lockError) {
//        apiFail(lockError);
//      }
//    });
//  }

    public void getFeatureValue(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getLockSystemInfo(ttlockModel.lockData, new GetLockSystemInfoCallback() {
            @Override
            public void onGetLockSystemInfoSuccess(com.ttlock.bl.sdk.entity.DeviceInfo deviceInfo) {
                ttlockModel.lockData = deviceInfo.getLockData();
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getLockSystemInfo(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getLockSystemInfo(ttlockModel.lockData, new GetLockSystemInfoCallback() {
            @Override
            public void onGetLockSystemInfoSuccess(com.ttlock.bl.sdk.entity.DeviceInfo deviceInfo) {
                Map<String, Object> map = Utils.object2Map(deviceInfo);
                if (map.containsKey("nbRssi")) {//flutter 用的string类型
                    map.put("nbRssi", String.valueOf(map.get("nbRssi")));
                }
                apiSuccess(map);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getPasscodeVerificationParams(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getPasscodeVerificationParams(ttlockModel.lockData, new GetPasscodeVerificationInfoCallback() {
            @Override
            public void onGetInfoSuccess(String lockData) {
                ttlockModel.lockData = lockData;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setNBServerInfo(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().setNBServerInfo(Integer.valueOf(ttlockModel.port).shortValue(), ttlockModel.ip, ttlockModel.lockData, new SetNBServerCallback() {
            @Override
            public void onSetNBServerSuccess(int battery) {
                ttlockModel.electricQuantity = battery;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void reportLossICCard(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().reportLossCard(ttlockModel.cardNumber, ttlockModel.lockData, new ReportLossCardCallback() {

            @Override
            public void onReportLossCardSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void recoveryCard(final TtlockModel ttlockModel) {
        RecoveryData recoveryData = new RecoveryData();
        recoveryData.cardType = 1;
        recoveryData.cardNumber = ttlockModel.cardNumber;
        recoveryData.startDate = ttlockModel.startDate;
        recoveryData.endDate = ttlockModel.endDate;
        List<RecoveryData> recoveryDataList = new ArrayList<>();
        recoveryDataList.add(recoveryData);

        TTLockClient.getDefault().recoverLockData(GsonUtil.toJson(recoveryDataList), RecoveryDataType.IC, ttlockModel.lockData, new RecoverLockDataCallback() {
            @Override
            public void onRecoveryDataSuccess(int type) {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }


    //  enum TTPasscodeType { once, permanent, period, cycle }
    public void recoveryPasscode(final TtlockModel ttlockModel) {
        RecoveryData recoveryData = new RecoveryData();
        recoveryData.keyboardPwd = ttlockModel.passcode;
        recoveryData.startDate = ttlockModel.startDate;
        recoveryData.endDate = ttlockModel.endDate;
        recoveryData.cycleType = ttlockModel.cycleType;
        recoveryData.keyboardPwdType = ttlockModel.type + 1;
        List<RecoveryData> recoveryDataList = new ArrayList<>();
        recoveryDataList.add(recoveryData);

        TTLockClient.getDefault().recoverLockData(GsonUtil.toJson(recoveryDataList), RecoveryDataType.PASSCODE, ttlockModel.lockData, new RecoverLockDataCallback() {
            @Override
            public void onRecoveryDataSuccess(int type) {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

//  public void getPasscodeVerificationParams(final TtlockModel ttlockModel) {
//    TTLockClient.getDefault().getPasscodeVerificationParams(ttlockModel.lockData, new GetPasscodeVerificationInfoCallback() {
//      @Override
//      public void onGetInfoSuccess(String lockData) {
//        ttlockModel.lockData = lockData;
//        apiSuccess(ttlockModel);
//      }
//
//      @Override
//      public void onFail(LockError lockError) {
//        apiFail(lockError);
//      }
//    });
//  }

    public void getLockVersion(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getLockVersion(ttlockModel.lockMac, new GetLockVersionCallback() {
            @Override
            public void onGetLockVersionSuccess(String lockVersion) {
                ttlockModel.lockVersion = lockVersion;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void wifiLockGetNearbyWifi(final TtlockModel ttlockModel) {
        final HashMap<String, Object> resultMap = new HashMap<>();
        TTLockClient.getDefault().scanWifi(ttlockModel.lockData, new ScanWifiCallback() {
            @Override
            public void onScanWifi(List<WiFi> wiFis, int status) {
                List<HashMap<String, Object>> mapList = new ArrayList<>();
                for (WiFi wiFi : wiFis) {
                    HashMap<String, Object> wifiMap = new HashMap<>();
                    wifiMap.put("wifi", wiFi.ssid);
                    wifiMap.put("rssi", wiFi.rssi);
                    mapList.add(wifiMap);
                }
                resultMap.put("finished", status == 1);
                resultMap.put("wifiList", mapList);

                successCallbackCommand(TTLockCommand.COMMAND_SCAN_WIFI, resultMap);

                if (status == 1) {
                    removeCommandTimeOutRunable();
                    commandQue.poll();
                    tryAgain = true;
                    doNextCommandAction();
                }

            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void configWifi(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().configWifi(ttlockModel.wifiName, ttlockModel.wifiPassword, ttlockModel.lockData, new ConfigWifiCallback() {
            @Override
            public void onConfigWifiSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void configServer(final TtlockModel ttlockModel) {
        if (TextUtils.isEmpty(ttlockModel.ip) || TextUtils.isEmpty(ttlockModel.port)) {
            ttlockModel.ip = "wifilock.ttlock.com";
            ttlockModel.port = "4999";
        }
        TTLockClient.getDefault().configServer(ttlockModel.ip, Integer.valueOf(ttlockModel.port), ttlockModel.lockData, new ConfigServerCallback() {
            @Override
            public void onConfigServerSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getWifiInfo(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getWifiInfo(ttlockModel.lockData, new GetWifiInfoCallback() {
            @Override
            public void onGetWiFiInfoSuccess(WifiLockInfo wifiLockInfo) {
                Map<String, Object> map = Utils.object2Map(wifiLockInfo);
                apiSuccess(map);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void configIp(final TtlockModel ttlockModel) {
        String ipSettingJson = ttlockModel.ipSettingJsonStr;
        if (TextUtils.isEmpty(ipSettingJson)) {
            errorCallbackCommand(TTLockCommand.COMMAND_CONFIG_IP, GatewayError.DATA_FORMAT_ERROR);
            return;
        }
        IpSetting ipSetting = GsonUtil.toObject(ipSettingJson, IpSetting.class);
        TTLockClient.getDefault().configIp(ipSetting, ttlockModel.lockData, new com.ttlock.bl.sdk.callback.ConfigIpCallback() {
            @Override
            public void onConfigIpSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void configCameraLockWifi(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().configCameraLockWifi(
            ttlockModel.wifiName,
            ttlockModel.wifiPassword,
            ttlockModel.lockData,
            new com.ttlock.bl.sdk.callback.ConfigCameraLockWifiCallback() {

                @Override
                public void onConfigSuccess(CameraLockWifiInfo cameraLockWifiInfo) {
                    HashMap<String, Object> map = new HashMap<>();
                    map.put("wifiName",cameraLockWifiInfo.getWifiMac());
                    map.put("videoModuleSerialNumber", cameraLockWifiInfo.getVideoModuleSerialNumber());
                    apiSuccess(map);
                }

                @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void setLockSoundWithSoundVolume(final TtlockModel ttlockModel) {
        SoundVolume soundVolume = SoundVolumeConverter.flutter2Native(ttlockModel.soundVolumeType);
        TTLockClient.getDefault().setLockSoundWithSoundVolume(soundVolume, ttlockModel.lockData, new SetLockSoundWithSoundVolumeCallback() {
            @Override
            public void onSetLockSoundSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getLockSoundWithSoundVolume(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getLockSoundWithSoundVolume(ttlockModel.lockData, new GetLockSoundWithSoundVolumeCallback() {
            @Override
            public void onGetLockSoundSuccess(boolean enable, SoundVolume soundVolume) {
                if (enable) {
                    ttlockModel.soundVolumeType = SoundVolumeConverter.native2Flutter(soundVolume);
                } else {
                    ttlockModel.soundVolumeType = SoundVolumeConverter.off.ordinal();
                }
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void getAdminPasscode(final TtlockModel ttlockModel) {
        TTLockClient.getDefault().getAdminPasscode(ttlockModel.lockData, new GetAdminPasscodeCallback() {
            @Override
            public void onGetAdminPasscodeSuccess(String passcode) {
                ttlockModel.adminPasscode = passcode;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
    }

    public void addDoorSensor(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().addDoorSensor(ttlockModel.mac, ttlockModel.lockData, new AddDoorSensorCallback() {
                    @Override
                    public void onAddSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void deleteDoorSensor(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().deleteDoorSensor(ttlockModel.lockData, new DeleteDoorSensorCallback() {
                    @Override
                    public void onDeleteSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void setDoorSensorAlertTime(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().setDoorSensorAlertTime(ttlockModel.alertTime, ttlockModel.lockData, new SetDoorSensorAlertTimeCallback() {
                    @Override
                    public void onSetDoorSensorAlertTimeSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void setUnlockDirection(final TtlockModel ttlockModel) {
//    PermissionUtils.doWithConnectPermission(activity, success -> {
//      if (success) {
//        enum TTLockDirection { left, right }
        UnlockDirection unlockDirection = ttlockModel.direction == 1 ? UnlockDirection.RIGHT : UnlockDirection.LEFT;
        TTLockClient.getDefault().setUnlockDirection(unlockDirection, ttlockModel.lockData, new SetUnlockDirectionCallback() {
            @Override
            public void onSetUnlockDirectionSuccess() {
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
//      } else {
//        apiFail(LockError.LOCK_NO_PERMISSION);
//      }
//    });
    }

    public void getUnlockDirection(final TtlockModel ttlockModel) {
//    PermissionUtils.doWithConnectPermission(activity, success -> {
//      if (success) {
        TTLockClient.getDefault().getUnlockDirection(ttlockModel.lockData, new GetUnlockDirectionCallback() {
            @Override
            public void onGetUnlockDirectionSuccess(UnlockDirection unlockDirection) {
                //enum TTLockDirection { left, right }
                ttlockModel.direction = unlockDirection == UnlockDirection.LEFT ? 0 : 1;
                apiSuccess(ttlockModel);
            }

            @Override
            public void onFail(LockError lockError) {
                apiFail(lockError);
            }
        });
//      } else {
//        apiFail(LockError.LOCK_NO_PERMISSION);
//      }
//    });
    }

    public void resetLockByCode(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().resetLockByCode(ttlockModel.lockMac, ttlockModel.resetCode, new ResetLockByCodeCallback() {
                    @Override
                    public void onResetSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void addRemoteKey(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().addRemote(ttlockModel.mac, validityInfo, ttlockModel.lockData, new AddRemoteCallback() {
                    @Override
                    public void onAddSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void modifyRemoteKey(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().modifyRemoteValidityPeriod(ttlockModel.mac, validityInfo, ttlockModel.lockData, new ModifyRemoteValidityPeriodCallback() {
                    @Override
                    public void onModifySuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void deleteRemoteKey(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().deleteRemote(ttlockModel.mac, ttlockModel.lockData, new DeleteRemoteCallback() {
                    @Override
                    public void onDeleteSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void clearAllRemoteKey(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().clearRemote(ttlockModel.lockData, new ClearRemoteCallback() {
                    @Override
                    public void onClearSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void getAccessoryElectricQuantity(final TtlockModel ttlockModel) {
        AccessoryInfo accessoryInfo = new AccessoryInfo();
//    TTRemoteAccessory { remoteKey, remoteKeypad, doorSensor }
        AccessoryType accessoryType = null;
        switch (ttlockModel.remoteAccessory) {
            case 0://remoteKey
                accessoryType = AccessoryType.REMOTE;
                break;
            case 1://remoteKeypad
                accessoryType = AccessoryType.WIRELESS_KEYPAD;
                break;
            case 2://doorSensor
                accessoryType = AccessoryType.DOOR_SENSOR;
                break;
        }
        accessoryInfo.setAccessoryType(accessoryType);
        accessoryInfo.setAccessoryMac(ttlockModel.mac);
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().getAccessoryBatteryLevel(accessoryInfo, ttlockModel.lockData, new GetAccessoryBatteryLevelCallback() {
                    @Override
                    public void onGetAccessoryBatteryLevelSuccess(AccessoryInfo accessoryInfo) {
                        ttlockModel.electricQuantity = accessoryInfo.getAccessoryBattery();
                        ttlockModel.updateDate = accessoryInfo.getBatteryDate();
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void clearRemote(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().clearRemote(ttlockModel.lockData, new ClearRemoteCallback() {
                    @Override
                    public void onClearSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    //---------------remote------------------------------

    public void addFace(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().addFace(ttlockModel.lockData, validityInfo, new AddFaceCallback() {
                    @Override
                    public void onEnterAddMode() {
                        ttlockModel.state = STATUS_FACE_ENTER_ADD_MODE;
                        progressCallbackCommand(commandQue.peek(), ttlockModel.toMap());
                    }

                    @Override
                    public void onCollectionStatus(FaceCollectionStatus faceCollectionStatus) {
                        ttlockModel.state = STATUS_FACE_ERROR;
                        Map<String, Object> hashMap = ttlockModel.toMap();
                        hashMap.put("errorCode", faceCollectionStatus.getValue());
                        progressCallbackCommand(commandQue.peek(), hashMap);
                    }

                    @Override
                    public void onAddFinished(long faceNumber) {
                        ttlockModel.faceNumber = String.valueOf(faceNumber);
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void addFaceData(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().addFaceFeatureData(ttlockModel.lockData, ttlockModel.faceFeatureData, validityInfo, new AddFaceCallback() {
                    @Override
                    public void onEnterAddMode() {
                        ttlockModel.state = STATUS_FACE_ENTER_ADD_MODE;
                        progressCallbackCommand(commandQue.peek(), ttlockModel.toMap());
                    }

                    @Override
                    public void onCollectionStatus(FaceCollectionStatus faceCollectionStatus) {
                        ttlockModel.state = STATUS_FACE_ERROR;
                        Map<String, Object> hashMap = ttlockModel.toMap();
                        hashMap.put("errorCode", faceCollectionStatus.getValue());
                        progressCallbackCommand(commandQue.peek(), hashMap);
                    }

                    @Override
                    public void onAddFinished(long faceNumber) {
                        ttlockModel.faceNumber = String.valueOf(faceNumber);
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void modifyFace(final TtlockModel ttlockModel) {
        ValidityInfo validityInfo = new ValidityInfo();
        validityInfo.setStartDate(ttlockModel.startDate);
        validityInfo.setEndDate(ttlockModel.endDate);

        if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
            validityInfo.setModeType(ValidityInfo.TIMED);
        } else {
            validityInfo.setModeType(ValidityInfo.CYCLIC);
            validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>() {
            }));
            ttlockModel.cycleJsonList = null;//clear data
        }
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().modifyFaceValidityPeriod(ttlockModel.lockData, Long.valueOf(ttlockModel.faceNumber), validityInfo, new ModifyFacePeriodCallback() {
                    @Override
                    public void onModifySuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void deleteFace(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().deleteFace(ttlockModel.lockData, Long.valueOf(ttlockModel.faceNumber), new DeleteFaceCallback() {
                    @Override
                    public void onDeleteSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void clearFace(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().clearFace(ttlockModel.lockData, new ClearFaceCallback() {
                    @Override
                    public void onClearSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void setSensitivity(final TtlockModel ttlockModel) {
        PermissionUtils.doWithConnectPermission(activity, success -> {
            if (success) {
                TTLockClient.getDefault().setSensitivity(ttlockModel.lockData, ttlockModel.sensitivityValue, new SetSensitivityCallback() {
                    @Override
                    public void onSetSuccess() {
                        apiSuccess(ttlockModel);
                    }

                    @Override
                    public void onFail(LockError lockError) {
                        apiFail(lockError);
                    }
                });
            } else {
                apiFail(LockError.LOCK_NO_PERMISSION);
            }
        });
    }

    public void setAdminErasePasscode(final TtlockModel ttlockModel) {

    }

    /**
     * android 6.0
     */
    private boolean initPermission() {
        LogUtil.d("");
        String permissions[] = {
                Manifest.permission.ACCESS_FINE_LOCATION
        };

        ArrayList<String> toApplyList = new ArrayList<String>();

        for (String perm : permissions) {
            if (PackageManager.PERMISSION_GRANTED != ContextCompat.checkSelfPermission(activity, perm)) {
                toApplyList.add(perm);
            }
        }
        String tmpList[] = new String[toApplyList.size()];
        if (!toApplyList.isEmpty()) {
            ActivityCompat.requestPermissions(activity, toApplyList.toArray(tmpList), PERMISSIONS_REQUEST_CODE);
            return false;
        }
        return true;
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {
            case PERMISSIONS_REQUEST_CODE: {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0) {
                    for (int i = 0; i < permissions.length; i++) {
                        if (Manifest.permission.ACCESS_FINE_LOCATION.equals(permissions[i]) && grantResults[i] == PackageManager.PERMISSION_GRANTED) {
                            // permission was granted, yay! Do the
                            // contacts-related task you need to do.
                            switch (commandType) {
                                case CommandType.DOOR_LOCK:
                                    startScan();
                                    break;
                                case CommandType.DOOR_SENSOR:
                                    startScanDoorSensor();
                                    break;
                                case CommandType.GATEWAY:
                                    startScanGateway();
                                    break;
                                case CommandType.KEY_PAD:
                                    startScanKeyPad();
                                    break;
                                case CommandType.REMOTE_KEY:
                                    startScanRemote();
                                    break;
                            }
                        } else {
                            // permission denied, boo! Disable the
                            // functionality that depends on this permission.
                        }
                    }
                }
                return;
            }
            // other 'case' lines to check for other
            // permissions this app might request.
        }
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {

    }


    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

    }

    @Override
    public void onDetachedFromActivity() {

    }

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        this.events = events;
    }

    @Override
    public void onCancel(Object arguments) {
        //todo:
    }

    public void apiSuccess(TtlockModel ttlockModel) {
        apiSuccess(ttlockModel.toMap());
    }

    public void apiSuccess(Map<String, Object> resMap) {
        removeCommandTimeOutRunable();
        successCallbackCommand(commandQue.poll(), resMap);
        tryAgain = true;
        doNextCommandAction();
    }

    public void apiFail(LockError lockError) {
        removeCommandTimeOutRunable();
        if (tryAgain && lockError == LockError.LOCK_IS_BUSY) {
            tryAgain = false;
            TTLockClient.getDefault().clearAllCallback();
        } else {
            errorCallbackCommand(commandQue.poll(), lockError);
//      clearCommand();
        }
        doNextCommandAction();
    }

    public void dataError() {
        removeCommandTimeOutRunable();
        errorCallbackCommand(commandQue.poll(), LockError.DATA_FORMAT_ERROR);
        clearCommand();
    }

    public void successCallbackCommand(String command, Map data) {
        if (command != null) {
            callbackCommand(command, ResultStateSuccess, data, -1, "");
        }
    }

    public void successCallbackCommand(CommandObj commandObj, Map data) {
        if (commandObj != null) {
            successCallbackCommand(commandObj.getCommand(), data);
        }
    }

    public void progressCallbackCommand(CommandObj commandObj, Map data) {
        if (commandObj != null) {
            callbackCommand(commandObj.getCommand(), ResultStateProgress, data, -1, "");
        }
    }

    public void errorCallbackCommand(String command, RemoteError remoteError) {
        callbackCommand(command, ResultStateFail, null, 0, remoteError.getDescription());
    }

    public void errorCallbackCommand(String command, KeypadError keypadError) {
        callbackCommand(command, ResultStateFail, null, 0, keypadError.getDescription());
    }

    public void errorCallbackCommand(String command, DoorSensorError doorSensorError) {
        callbackCommand(command, ResultStateFail, null, 0, doorSensorError.getDescription());
    }

    public void errorCallbackCommand(String command, GatewayError gatewayError) {
        callbackCommand(command, ResultStateFail, null, GatewayErrorConverter.native2Flutter(gatewayError), gatewayError.getDescription());
    }

    public void errorCallbackCommand(String command, StandaloneDoorSensorError doorSensorError) {
        callbackCommand(command, ResultStateFail, null, 0, doorSensorError.toString());
    }

    public void errorCallbackCommand(String command, WaterMeterError waterMeterError) {
        callbackCommand(command, ResultStateFail, null, WaterMeterErrorConvert.convert(waterMeterError), waterMeterError.getDescription());
    }

    public void errorCallbackCommand(String command, ElectricMeterError electricMeterError) {
        callbackCommand(command, ResultStateFail, null, ElectricityMeterErrorConvert.convert(electricMeterError), electricMeterError.getDescription());
    }

    public void errorCallbackCommand(CommandObj commandObj, LockError lockError) {
        if (commandObj != null) {
            callbackCommand(commandObj.getCommand(), ResultStateFail, null, TTLockErrorConverter.native2Flutter(lockError), lockError.getErrorMsg());
        }
    }

    public void callbackCommand(final String command, final int resultState, final Map data, final int errorCode, final String errorMessage) {

        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                HashMap<String, Object> resultMap = new HashMap<>();
                resultMap.put("command", command);
                if (errorCode >= 0) {
                    resultMap.put("errorMessage", errorMessage);
                    resultMap.put("errorCode", errorCode);
                }
                resultMap.put("resultState", resultState);
                resultMap.put("data", data);

                events.success(resultMap);
            }
        });
    }

}
