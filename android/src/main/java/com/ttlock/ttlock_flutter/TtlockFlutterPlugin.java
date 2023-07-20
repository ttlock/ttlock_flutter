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

import com.google.gson.reflect.TypeToken;
import com.ttlock.bl.sdk.api.ExtendedBluetoothDevice;
import com.ttlock.bl.sdk.api.TTLockClient;
import com.ttlock.bl.sdk.callback.ActivateLiftFloorsCallback;
import com.ttlock.bl.sdk.callback.AddFingerprintCallback;
import com.ttlock.bl.sdk.callback.AddICCardCallback;
import com.ttlock.bl.sdk.callback.ClearAllFingerprintCallback;
import com.ttlock.bl.sdk.callback.ClearAllICCardCallback;
import com.ttlock.bl.sdk.callback.ClearPassageModeCallback;
import com.ttlock.bl.sdk.callback.ConfigServerCallback;
import com.ttlock.bl.sdk.callback.ConfigWifiCallback;
import com.ttlock.bl.sdk.callback.ControlLockCallback;
import com.ttlock.bl.sdk.callback.CreateCustomPasscodeCallback;
import com.ttlock.bl.sdk.callback.DeleteFingerprintCallback;
import com.ttlock.bl.sdk.callback.DeletePasscodeCallback;
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
import com.ttlock.bl.sdk.callback.GetPasscodeVerificationInfoCallback;
import com.ttlock.bl.sdk.callback.GetRemoteUnlockStateCallback;
import com.ttlock.bl.sdk.callback.GetWifiInfoCallback;
import com.ttlock.bl.sdk.callback.InitLockCallback;
import com.ttlock.bl.sdk.callback.ModifyAdminPasscodeCallback;
import com.ttlock.bl.sdk.callback.ModifyFingerprintPeriodCallback;
import com.ttlock.bl.sdk.callback.ModifyICCardPeriodCallback;
import com.ttlock.bl.sdk.callback.ModifyPasscodeCallback;
import com.ttlock.bl.sdk.callback.RecoverLockDataCallback;
import com.ttlock.bl.sdk.callback.ReportLossCardCallback;
import com.ttlock.bl.sdk.callback.ResetKeyCallback;
import com.ttlock.bl.sdk.callback.ResetLockCallback;
import com.ttlock.bl.sdk.callback.ResetPasscodeCallback;
import com.ttlock.bl.sdk.callback.ScanLockCallback;
import com.ttlock.bl.sdk.callback.ScanWifiCallback;
import com.ttlock.bl.sdk.callback.SetAutoLockingPeriodCallback;
import com.ttlock.bl.sdk.callback.SetHotelCardSectorCallback;
import com.ttlock.bl.sdk.callback.SetHotelDataCallback;
import com.ttlock.bl.sdk.callback.SetLiftControlableFloorsCallback;
import com.ttlock.bl.sdk.callback.SetLiftWorkModeCallback;
import com.ttlock.bl.sdk.callback.SetLockConfigCallback;
import com.ttlock.bl.sdk.callback.SetLockSoundWithSoundVolumeCallback;
import com.ttlock.bl.sdk.callback.SetLockTimeCallback;
import com.ttlock.bl.sdk.callback.SetNBAwakeModesCallback;
import com.ttlock.bl.sdk.callback.SetNBAwakeTimesCallback;
import com.ttlock.bl.sdk.callback.SetNBServerCallback;
import com.ttlock.bl.sdk.callback.SetPassageModeCallback;
import com.ttlock.bl.sdk.callback.SetPowerSaverControlableLockCallback;
import com.ttlock.bl.sdk.callback.SetPowerSaverWorkModeCallback;
import com.ttlock.bl.sdk.callback.SetRemoteUnlockSwitchCallback;
import com.ttlock.bl.sdk.constant.LogType;
import com.ttlock.bl.sdk.constant.RecoveryData;
import com.ttlock.bl.sdk.entity.ActivateLiftFloorsResult;
import com.ttlock.bl.sdk.entity.ControlLockResult;
import com.ttlock.bl.sdk.entity.CyclicConfig;
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
import com.ttlock.bl.sdk.entity.ValidityInfo;
import com.ttlock.bl.sdk.entity.WifiLockInfo;
import com.ttlock.bl.sdk.gateway.api.GatewayClient;
import com.ttlock.bl.sdk.gateway.callback.ConfigIpCallback;
import com.ttlock.bl.sdk.gateway.callback.ConnectCallback;
import com.ttlock.bl.sdk.gateway.callback.InitGatewayCallback;
import com.ttlock.bl.sdk.gateway.callback.ScanGatewayCallback;
import com.ttlock.bl.sdk.gateway.callback.ScanWiFiByGatewayCallback;
import com.ttlock.bl.sdk.gateway.model.ConfigureGatewayInfo;
import com.ttlock.bl.sdk.gateway.model.DeviceInfo;
import com.ttlock.bl.sdk.gateway.model.GatewayError;
import com.ttlock.bl.sdk.gateway.model.WiFi;
import com.ttlock.bl.sdk.util.DigitUtil;
import com.ttlock.bl.sdk.util.FeatureValueUtil;
import com.ttlock.bl.sdk.util.GsonUtil;
import com.ttlock.bl.sdk.util.LogUtil;
import com.ttlock.ttlock_flutter.constant.GatewayCommand;
import com.ttlock.ttlock_flutter.constant.TTGatewayConnectStatus;
import com.ttlock.ttlock_flutter.constant.TTLockCommand;
import com.ttlock.ttlock_flutter.model.CommandObj;
import com.ttlock.ttlock_flutter.model.GatewayErrorConverter;
import com.ttlock.ttlock_flutter.model.GatewayModel;
import com.ttlock.ttlock_flutter.model.LiftWorkModeConverter;
import com.ttlock.ttlock_flutter.model.PowerSaverWorkModeConverter;
import com.ttlock.ttlock_flutter.model.SoundVolumeConverter;
import com.ttlock.ttlock_flutter.model.TTBluetoothState;
import com.ttlock.ttlock_flutter.model.TTGatewayScanModel;
import com.ttlock.ttlock_flutter.model.TTLockConfigConverter;
import com.ttlock.ttlock_flutter.model.TTLockErrorConverter;
import com.ttlock.ttlock_flutter.model.TTLockFunction;
import com.ttlock.ttlock_flutter.model.TtlockModel;
import com.ttlock.ttlock_flutter.util.PermissionUtils;
import com.ttlock.ttlock_flutter.util.Utils;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** TtlockFlutterPlugin */
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

  private boolean isGatewayCommand;
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

  private boolean sdkIsInit;

  private Runnable commandTimeOutRunable = new Runnable() {
    @Override
    public void run() {
      TTLockClient.getDefault().disconnect();
      errorCallbackCommand(commandQue.poll(), LockError.Failed);
      clearCommand();
    }
  };

  private Handler handler = new Handler();

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
    if (!sdkIsInit) {
      initSdk();
    }
    if (GatewayCommand.isGatewayCommand(call.method)) {//gateway
      isGatewayCommand = true;
      gatewayCommand(call);
    } else {//door lock
      isGatewayCommand = false;
      doorLockCommand(call);
    }
  }

  private void initSdk() {
    TTLockClient.getDefault().prepareBTService(activity);
    GatewayClient.getDefault().prepareBTService(activity);
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
//        if (initPermission()) {
          startScan();
//        }
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
//        if (initPermission()) {
          startScanGateway();
//        }
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
    }
  }

  public void isSupportFeature(TtlockModel ttlockModel) {
    boolean isSupport = FeatureValueUtil.isSupportFeature(ttlockModel.lockData, TTLockFunction.flutter2Native(ttlockModel.supportFunction));
    ttlockModel.isSupport = isSupport;
    LogUtil.d(TTLockFunction.flutter2Native(ttlockModel.supportFunction) + ":" + isSupport);
    successCallbackCommand(TTLockCommand.COMMAND_SUPPORT_FEATURE, ttlockModel.toMap());
  }

  //enum TTGatewayType { g1, g2, g3, g4 }
  public void startScanGateway() {
    GatewayClient.getDefault().prepareBTService(activity);
    PermissionUtils.doWithScanPermission(activity, success -> {
      if (success) {
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
      } else {
        LogUtil.d("no scan permission");
      }
    });
  }

  public void stopScanGateway() {
    GatewayClient.getDefault().stopScanGateway();
  }

  public void connectGateway(final GatewayModel gatewayModel) {
    final HashMap<String, Object> resultMap = new HashMap<>();
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        callbackCommand(GatewayCommand.COMMAND_CONNECT_GATEWAY, ResultStateFail, gatewayModel.toMap(), TTGatewayConnectStatus.faile, "no connect permission");
      }
    });
  }

  public void disconnectGateway() {//todo:
    GatewayClient.getDefault().disconnectGateway();
    successCallbackCommand(GatewayCommand.COMMAND_DISCONNECT_GATEWAY, null);
  }

  private void noConnectPermissionLog() {
    LogUtil.d("no connect permission");
  }

  public void gatewayConfigIp(final GatewayModel gatewayModel) {
    String ipSettingJson = gatewayModel.ipSettingJsonStr;
    if (TextUtils.isEmpty(ipSettingJson)) {
      errorCallbackCommand(GatewayCommand.COMMAND_CONFIG_IP, GatewayError.DATA_FORMAT_ERROR);
      return;
    }
     IpSetting ipSetting = GsonUtil.toObject(ipSettingJson, IpSetting.class);
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        noConnectPermissionLog();
        errorCallbackCommand(GatewayCommand.COMMAND_CONFIG_IP, GatewayError.FAILED);
      }
    });
  }

  public void getSurroundWifi(final GatewayModel gatewayModel) {
    final HashMap<String, Object> resultMap = new HashMap<>();
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        noConnectPermissionLog();
        errorCallbackCommand(GatewayCommand.COMMAND_GET_SURROUND_WIFI, GatewayError.FAILED);
      }
    });
  }

  public void initGateway(final GatewayModel gatewayModel) {
    ConfigureGatewayInfo configureGatewayInfo = new ConfigureGatewayInfo();
    configureGatewayInfo.plugName = gatewayModel.gatewayName;
    configureGatewayInfo.plugVersion = gatewayModel.type + 1;
    if (configureGatewayInfo.plugVersion == 2) {
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

    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        GatewayClient.getDefault().initGateway(configureGatewayInfo, new InitGatewayCallback() {
          @Override
          public void onInitGatewaySuccess(DeviceInfo deviceInfo) {
            HashMap<String, Object> gatewayInfoMap = new HashMap<>();
            gatewayInfoMap.put("modelNum", deviceInfo.modelNum);
            gatewayInfoMap.put("hardwareRevision", deviceInfo.hardwareRevision);
            gatewayInfoMap.put("firmwareRevision", deviceInfo.firmwareRevision);
            successCallbackCommand(GatewayCommand.COMMAND_INIT_GATEWAY, gatewayInfoMap);
          }

          @Override
          public void onFail(GatewayError error) {
            errorCallbackCommand(GatewayCommand.COMMAND_INIT_GATEWAY, error);
          }
        });
      } else {
        errorCallbackCommand(GatewayCommand.COMMAND_INIT_GATEWAY, GatewayError.FAILED);
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
      case TTLockCommand.COMMAND_SET_LOCK_SOUND_WITH_SOUND_VOLUME:
        setLockSoundWithSoundVolume(ttlockModel);
        break;
      case TTLockCommand.COMMAND_GET_LOCK_SOUND_WITH_SOUND_VOLUME:
        getLockSoundWithSoundVolume(ttlockModel);
        break;
      default:
        apiFail(LockError.INVALID_COMMAND);
        LogUtil.d("unknown command:" + command);
        break;
    }
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
    PermissionUtils.doWithScanPermission(activity, success -> {
      if (success) {
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
            successCallbackCommand(TTLockCommand.COMMAND_START_SCAN_LOCK, data.toMap());
//              data.lockSwitchState = @(scanModel.lockSwitchState);
//              data.oneMeterRssi = @(scanModel.oneMeterRSSI);
          }

          @Override
          public void onFail(LockError lockError) {//todo:
            LogUtil.d("lockError:" + lockError);
          }
        });
      } else {
        LogUtil.d("no scan permission");
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

    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void controlLock(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().controlLock(ttlockModel.getControlActionValue(), ttlockModel.lockData, ttlockModel.lockMac, new ControlLockCallback(){

          @Override
          public void onControlLockSuccess(ControlLockResult controlLockResult) {
            ttlockModel.lockTime = controlLockResult.lockTime;
            ttlockModel.controlAction = controlLockResult.controlAction;
            ttlockModel.electricQuantity = controlLockResult.battery;
            ttlockModel.uniqueId = controlLockResult.uniqueid;
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

  public void resetLock(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().resetLock(ttlockModel.lockData, ttlockModel.lockMac, new ResetLockCallback() {
          @Override
          public void onResetLockSuccess() {
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

  public void getLockTime(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getLockTime(ttlockModel.lockData, ttlockModel.lockMac, new GetLockTimeCallback() {

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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setLockTime(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().setLockTime(ttlockModel.timestamp, ttlockModel.lockData, ttlockModel.lockMac, new SetLockTimeCallback() {
          @Override
          public void onSetTimeSuccess() {
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

  public void getOperationLog(final TtlockModel ttlockModel) {
    //long period operation
    removeCommandTimeOutRunable();
//    commandTimeOutCheck(4 * COMMAND_TIME_OUT);

    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getOperationLog(ttlockModel.logType == 0 ? LogType.NEW : LogType.ALL, ttlockModel.lockData, ttlockModel.lockMac, new GetOperationLogCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getSwitchStatus(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getLockStatus(ttlockModel.lockData, ttlockModel.lockMac, new GetLockStatusCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setAdminPasscode(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().modifyAdminPasscode(ttlockModel.adminPasscode, ttlockModel.lockData, ttlockModel.lockMac, new ModifyAdminPasscodeCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getAdminPasscode(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getAdminPasscode(ttlockModel.lockData, ttlockModel.lockMac, new GetAdminPasscodeCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setCustomPasscode(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().createCustomPasscode(ttlockModel.passcode, ttlockModel.startDate, ttlockModel.endDate, ttlockModel.lockData, ttlockModel.lockMac, new CreateCustomPasscodeCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void modifyPasscode(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().modifyPasscode(ttlockModel.passcodeOrigin, ttlockModel.passcodeNew, ttlockModel.startDate, ttlockModel.endDate, ttlockModel.lockData, ttlockModel.lockMac, new ModifyPasscodeCallback() {
          @Override
          public void onModifyPasscodeSuccess() {
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

  public void deletePasscode(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().deletePasscode(ttlockModel.passcode, ttlockModel.lockData, ttlockModel.lockMac, new DeletePasscodeCallback() {
          @Override
          public void onDeletePasscodeSuccess() {
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

  public void resetPasscodes(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().resetPasscode(ttlockModel.lockData, ttlockModel.lockMac, new ResetPasscodeCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
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
      validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>(){}));
      ttlockModel.cycleJsonList = null;//clear data
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
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
      validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>(){}));
      ttlockModel.cycleJsonList = null;//clear data
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void deleteICCard(final TtlockModel ttlockModel) {
    //删除改成修改无效有效期
    ValidityInfo validityInfo = new ValidityInfo();
    validityInfo.setModeType(ValidityInfo.TIMED);
    validityInfo.setStartDate(INVALID_START_DATE);
    validityInfo.setEndDate(INVALID_END_DATE);

    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void reportLossICCard(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void clearICCard(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().clearAllICCard(ttlockModel.lockData, ttlockModel.lockMac, new ClearAllICCardCallback() {
          @Override
          public void onClearAllICCardSuccess() {
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

  public void recoveryCard(final TtlockModel ttlockModel) {
    RecoveryData recoveryData = new RecoveryData();
    recoveryData.cardType = 1;
    recoveryData.cardNumber = ttlockModel.cardNumber;
    recoveryData.startDate = ttlockModel.startDate;
    recoveryData.endDate = ttlockModel.endDate;
    List<RecoveryData> recoveryDataList = new ArrayList<>();
    recoveryDataList.add(recoveryData);
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().recoverLockData(GsonUtil.toJson(recoveryDataList), RecoveryDataType.IC, ttlockModel.lockData, ttlockModel.lockMac, new RecoverLockDataCallback() {
          @Override
          public void onRecoveryDataSuccess(int type) {
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

    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().recoverLockData(GsonUtil.toJson(recoveryDataList), RecoveryDataType.PASSCODE, ttlockModel.lockData, ttlockModel.lockMac, new RecoverLockDataCallback() {
          @Override
          public void onRecoveryDataSuccess(int type) {
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

  public void addFingerPrint(final TtlockModel ttlockModel) {
    ValidityInfo validityInfo = new ValidityInfo();
    validityInfo.setStartDate(ttlockModel.startDate);
    validityInfo.setEndDate(ttlockModel.endDate);

    if (TextUtils.isEmpty(ttlockModel.cycleJsonList)) {
      validityInfo.setModeType(ValidityInfo.TIMED);
    } else {
      validityInfo.setModeType(ValidityInfo.CYCLIC);
      validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>(){}));
      ttlockModel.cycleJsonList = null;//clear data
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
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
      validityInfo.setCyclicConfigs(GsonUtil.toObject(ttlockModel.cycleJsonList, new TypeToken<List<CyclicConfig>>(){}));
      ttlockModel.cycleJsonList = null;//clear data
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void deleteFingerPrint(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().deleteFingerprint(ttlockModel.fingerprintNumber, ttlockModel.lockData, ttlockModel.lockMac, new DeleteFingerprintCallback() {
          @Override
          public void onDeleteFingerprintSuccess() {
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

  public void clearFingerPrint(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().clearAllFingerprints(ttlockModel.lockData, ttlockModel.lockMac, new ClearAllFingerprintCallback() {
          @Override
          public void onClearAllFingerprintSuccess() {
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

  public void getBattery(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getBatteryLevel(ttlockModel.lockData, ttlockModel.lockMac, new GetBatteryLevelCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setAutoLockTime(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().setAutomaticLockingPeriod(ttlockModel.currentTime, ttlockModel.lockData, ttlockModel.lockMac, new SetAutoLockingPeriodCallback() {
          @Override
          public void onSetAutoLockingPeriodSuccess() {
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

  public void getAutoLockTime(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setRemoteUnlockSwitch(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().setRemoteUnlockSwitchState(ttlockModel.isOn, ttlockModel.lockData, ttlockModel.lockMac, new SetRemoteUnlockSwitchCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getRemoteUnlockSwitch(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getRemoteUnlockSwitchState(ttlockModel.lockData, ttlockModel.lockMac, new GetRemoteUnlockStateCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
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

    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().setPassageMode(passageModeConfig, ttlockModel.lockData, ttlockModel.lockMac, new SetPassageModeCallback() {
          @Override
          public void onSetPassageModeSuccess() {
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

  public void clearPassageMode(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().clearPassageMode(ttlockModel.lockData, ttlockModel.lockMac, new ClearPassageModeCallback() {
          @Override
          public void onClearPassageModeSuccess() {
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

  public void setLockConfig(final TtlockModel ttlockModel) {
    TTLockConfigType ttLockConfigType = TTLockConfigConverter.flutter2Native(ttlockModel.lockConfig);

    if (ttLockConfigType == null) {
      dataError();
      return;
    }

    LogUtil.d("ttLockConfigType:" + ttLockConfigType);
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
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
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void resetEKey(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().resetEkey(ttlockModel.lockData, ttlockModel.lockMac, new ResetKeyCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
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
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setLiftControlableFloors(final TtlockModel ttlockModel) {
    if (TextUtils.isEmpty(ttlockModel.floors)) {
      dataError();
      return;
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setLiftWorkMode(final TtlockModel ttlockModel) {
      TTLiftWorkMode ttLiftWorkMode = LiftWorkModeConverter.flutter2Native(ttlockModel.liftWorkActiveType);
      if (ttLiftWorkMode == null) {
        dataError();
        return;
      }
      PermissionUtils.doWithConnectPermission(activity, success -> {
        if (success) {
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
        } else {
          apiFail(LockError.LOCK_NO_PERMISSION);
        }
      });
  }

  public void setPowerSaverWorkMode(final TtlockModel ttlockModel) {
     PowerSaverWorkMode powerSaverWorkMode = PowerSaverWorkModeConverter.flutter2Native(ttlockModel.powerSaverType);
     if (powerSaverWorkMode == null) {
       dataError();
       return;
     }
     PermissionUtils.doWithConnectPermission(activity, success -> {
       if (success) {
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
       } else {
         apiFail(LockError.LOCK_NO_PERMISSION);
       }
     });
  }

  public void setPowerSaverControlableLock(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setNbAwakeModes(final TtlockModel ttlockModel) {
    List<NBAwakeMode> nbAwakeModeList = ttlockModel.getNbAwakeModeList();
    if (nbAwakeModeList == null || nbAwakeModeList.size() == 0) {
      dataError();
      return;
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getNbAwakeModes(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setNbAwakeTimes(final TtlockModel ttlockModel) {
    List<NBAwakeTime> nbAwakeTimeList = ttlockModel.getNbAwakeTimeList();
    if (nbAwakeTimeList == null || nbAwakeTimeList.size() == 0) {
      dataError();
      return;
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getNbAwakeTimes(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
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
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setHotelSector(final TtlockModel ttlockModel) {
    if (TextUtils.isEmpty(ttlockModel.sector)) {
      dataError();
      return;
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getBluetoothState(TtlockModel ttlockModel) {
    //4-off 5-on
    ttlockModel.state = TTLockClient.getDefault().isBLEEnabled(activity) ? 5 : 4;
    successCallbackCommand(TTLockCommand.COMMAND_GET_BLUETOOTH_STATE, ttlockModel.toMap());
  }

  public void getAllValidFingerPrints(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getAllValidFingerprints(ttlockModel.lockData, ttlockModel.lockMac, new GetAllValidFingerprintCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getAllValidPasscodes(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getAllValidPasscodes(ttlockModel.lockData, ttlockModel.lockMac, new GetAllValidPasscodeCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getAllValidCards(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getAllValidICCards(ttlockModel.lockData, ttlockModel.lockMac, new GetAllValidICCardCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setNBServerInfo(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().setNBServerInfo(Integer.valueOf(ttlockModel.port).shortValue() , ttlockModel.ip, ttlockModel.lockData, new SetNBServerCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getLockSystemInfo(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().getLockSystemInfo(ttlockModel.lockData, null, new GetLockSystemInfoCallback() {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getPasscodeVerificationParams(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getLockVersion(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void wifiLockGetNearbyWifi(final TtlockModel ttlockModel) {
    final HashMap<String, Object> resultMap = new HashMap<>();
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
        TTLockClient.getDefault().scanWifi(ttlockModel.lockData, new ScanWifiCallback() {
          @Override
          public void onScanWifi(List<WiFi> wiFis, int status) {
            List<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void configWifi(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void configServer(final TtlockModel ttlockModel) {
    if (TextUtils.isEmpty(ttlockModel.ip) || TextUtils.isEmpty(ttlockModel.port)) {
      ttlockModel.ip = "wifilock.ttlock.com";
      ttlockModel.port = "4999";
    }
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getWifiInfo(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
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
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void setLockSoundWithSoundVolume(final TtlockModel ttlockModel) {
    SoundVolume soundVolume = SoundVolumeConverter.flutter2Native(ttlockModel.soundVolumeType);
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
      } else {
        apiFail(LockError.LOCK_NO_PERMISSION);
      }
    });
  }

  public void getLockSoundWithSoundVolume(final TtlockModel ttlockModel) {
    PermissionUtils.doWithConnectPermission(activity, success -> {
      if (success) {
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
//  private boolean initPermission() {
//    LogUtil.d("");
//    String permissions[] = {
//            Manifest.permission.ACCESS_FINE_LOCATION
//    };
//
//    ArrayList<String> toApplyList = new ArrayList<String>();
//
//    for (String perm : permissions) {
//      if (PackageManager.PERMISSION_GRANTED != ContextCompat.checkSelfPermission(activity, perm)) {
//        toApplyList.add(perm);
//      }
//    }
//    String tmpList[] = new String[toApplyList.size()];
//    if (!toApplyList.isEmpty()) {
//      ActivityCompat.requestPermissions(activity, toApplyList.toArray(tmpList), PERMISSIONS_REQUEST_CODE);
//      return false;
//    }
//    return true;
//  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
    switch (requestCode) {
      case PERMISSIONS_REQUEST_CODE: {
        // If request is cancelled, the result arrays are empty.
        if (grantResults.length > 0) {
          for (int i=0;i<permissions.length;i++) {
            if (Manifest.permission.ACCESS_FINE_LOCATION.equals(permissions[i]) && grantResults[i] == PackageManager.PERMISSION_GRANTED) {
              // permission was granted, yay! Do the
              // contacts-related task you need to do.
              if (isGatewayCommand) {
                startScanGateway();
              } else {
                startScan();
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
//    removeCommandTimeOutRunable();
//    successCallbackCommand(commandQue.poll(), ttlockModel.toMap());
//    tryAgain = true;
//    doNextCommandAction();
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
        doNextCommandAction();
    } else {
      errorCallbackCommand(commandQue.poll(), lockError);
      clearCommand();
    }
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

  public void errorCallbackCommand(String command, GatewayError gatewayError) {
    callbackCommand(command, ResultStateFail, null, GatewayErrorConverter.native2Flutter(gatewayError), gatewayError.getDescription());
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
        resultMap.put("errorMessage", errorMessage);
        resultMap.put("errorCode", errorCode);
        resultMap.put("resultState", resultState);
        resultMap.put("data", data);

        events.success(resultMap);
      }
    });
  }

}
