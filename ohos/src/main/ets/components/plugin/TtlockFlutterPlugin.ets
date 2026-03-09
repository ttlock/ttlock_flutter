import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
  EventChannel,
  EventSink,
  StreamHandler,
  Any,
} from '@ohos/flutter_ohos';
import {
  TTLock,
  TTLockScanModel,
  TTGatewayScanModel,
  TTControlAction,
  TTLockSwitchState,
  TTLockFeatureValue,
  TTOperateLogType,
  TTLockConfigType,
  TTSoundVolume,
  TTSensitivityValue,
  TTLanguage,
  TTAccessoryType,
  IInitLockModel,
  SNError,
  ITTPublicSwitchModel,
  ITTControlModel,
  ITTAudioModel,
  ITTLockCyclicConfig,
  IAddFingerprintProgressModel,
  TTKeypadStatus,
  TTAddState,
} from '@sciener/ttlock';
import { TTCommands } from '../../constants/TTCommands';

const METHOD_CHANNEL_NAME = 'com.ttlock/command/ttlock';
const EVENT_CHANNEL_NAME = 'com.ttlock/listen/ttlock';

const RESULT_STATE_SUCCESS = 0;
const RESULT_STATE_PROGRESS = 1;
const RESULT_STATE_FAIL = 2;

const NOT_IMPLEMENTED_ERROR_CODE = -999;
const NOT_IMPLEMENTED_MESSAGE = 'Not implemented on OHOS';

/** 通道模式：1=按周 2=按月（SDK 未导出 TTPassageModeType 时使用） */
const PASSAGE_MODE_WEEK = 1;
const PASSAGE_MODE_MONTH = 2;
/** 开门方向：0=右 1=左（SDK 未导出 TTUnlockDirection 时使用） */
const UNLOCK_DIRECTION_RIGHT = 0;
const UNLOCK_DIRECTION_LEFT = 1;

/** 事件回传结果结构，满足 arkts-no-untyped-obj-literals */
interface EventResultMap {
  command: string;
  resultState: number;
  data: Record<string, Object>;
  errorCode?: number;
  errorMessage?: string;


}

/** TtlockFlutterPlugin - aligns with Android/iOS channel names and event protocol */
export default class TtlockFlutterPlugin implements FlutterPlugin, MethodCallHandler, StreamHandler {
  private methodChannel: MethodChannel | null = null;
  private eventChannel: EventChannel | null = null;
  private eventSink: EventSink | null = null;

  constructor() {
  }

  getUniqueClassName(): string {
    return "TtlockFlutterPlugin";
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.methodChannel = new MethodChannel(binding.getBinaryMessenger(), METHOD_CHANNEL_NAME);
    this.methodChannel.setMethodCallHandler(this);
    this.eventChannel = new EventChannel(binding.getBinaryMessenger(), EVENT_CHANNEL_NAME);
    this.eventChannel.setStreamHandler(this);
  }

  onDetachedFromEngine(_binding: FlutterPluginBinding): void {
    if (this.methodChannel != null) {
      this.methodChannel.setMethodCallHandler(null);
      this.methodChannel = null;
    }
    if (this.eventChannel != null) {
      this.eventChannel.setStreamHandler(null);
      this.eventChannel = null;
    }
    this.eventSink = null;
  }

  onListen(_arguments: Object, eventSink: EventSink): void {
    this.eventSink = eventSink;
  }

  onCancel(_arguments: Object): void {
    this.eventSink = null;
  }

  private callbackCommand(
    command: string,
    resultState: number,
    data: Record<string, Object> | null,
    errorCode: number,
    errorMessage: string
  ): void {
    const sink = this.eventSink;
    if (sink == null) return;
    let resultMap: Record<string, Any> = {
      'command': command,
      'resultState': resultState,
      'data': data ?? {},
    };

    if (errorCode >= 0) {
      resultMap['errorCode'] = errorCode;
      resultMap['errorMessage'] = errorMessage;
    }
    sink.success(resultMap);
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    const method = call.method;

    if (method === TTCommands.startScanLock) {
      this.startScanLock();
      result.success(null);
      return;
    }
    if (method === TTCommands.stopScanLock) {
      TTLock.stopScan();
      result.success(null);
      return;
    }
    if (method === TTCommands.getBluetoothState) {
      this.getBluetoothState();
      result.success(null);
      return;
    }
    if (method === TTCommands.initLock) {
      this.initLock(call);
      result.success(null);
      return;
    }
    if (method === TTCommands.controlLock) {
      this.controlLock(call);
      result.success(null);
      return;
    }
    if (method === TTCommands.resetLock) {
      this.resetLock(call);
      result.success(null);
      return;
    }
    if (method === TTCommands.resetLockByCode) {
      this.resetLockByCode(call);
      result.success(null);
      return;
    }
    if (method === TTCommands.functionSupport) {
      this.functionSupport(call);
      result.success(null);
      return;
    }
    if (method === 'getPlatformVersion') {
      result.success('OpenHarmony ^ ^');
      return;
    }
    // 仅发送、不等待结果的命令：执行原生调用后直接返回
    if (method === TTCommands.stopScanGateway || method === TTCommands.stopScanRemoteKey ||
        method === TTCommands.remoteKeypadStopScan || method === TTCommands.doorSensorStopScan) {
      TTLock.stopScan();
      result.success(null);
      return;
    }
    if (method === TTCommands.disconnectGateway) {
      const mac = (call.argument("mac") as string) ?? (call.argument("gatewayMac") as string) ?? '';
      TTLock.disConnectGateway(mac);
      result.success(null);
      return;
    }
    // 其余命令：先返回成功，再通过事件回传结果或未实现
    result.success(null);
    this.handleCommand(method, call);
  }

  private notImplemented(command: string): void {
    this.callbackCommand(command, RESULT_STATE_FAIL, null, NOT_IMPLEMENTED_ERROR_CODE, NOT_IMPLEMENTED_MESSAGE);
  }

  private handleCommand(method: string, call: MethodCall): void {
    switch (method) {
      case TTCommands.resetEkey:
        this.resetEkey(call);
        break;
      case TTCommands.verifyLock:
        this.notImplemented(method);
        break;
      case TTCommands.getLockSwitchState:
        this.getLockSwitchState(call);
        break;
      case TTCommands.setLockTime:
        this.setLockTime(call);
        break;
      case TTCommands.getLockTime:
        this.getLockTime(call);
        break;
      case TTCommands.getLockOperateRecord:
        this.getLockOperateRecord(call);
        break;
      case TTCommands.getLockPower:
        this.getLockPower(call);
        break;
      case TTCommands.getLockSystemInfoWithLockData:
        this.getLockSystemInfoWithLockData(call);
        break;
      case TTCommands.getLockFreatureValue:
        this.getLockFeatureValue(call);
        break;
      case TTCommands.getLockAutomaticLockingPeriodicTime:
        this.getLockAutomaticLockingPeriodicTime(call);
        break;
      case TTCommands.setLockAutomaticLockingPeriodicTime:
        this.setLockAutomaticLockingPeriodicTime(call);
        break;
      case TTCommands.getLockRemoteUnlockSwitchState:
        this.getLockRemoteUnlockSwitchState(call);
        break;
      case TTCommands.setLockRemoteUnlockSwitchState:
        this.setLockRemoteUnlockSwitchState(call);
        break;
      case TTCommands.getLockVersion:
        this.getLockVersion(call);
        break;
      case TTCommands.addPassageMode:
        this.addPassageMode(call);
        break;
      case TTCommands.clearAllPassageModes:
        this.clearAllPassageModes(call);
        break;
      case TTCommands.getLockConfig:
        this.getLockConfig(call);
        break;
      case TTCommands.setLockConfig:
        this.setLockConfig(call);
        break;
      case TTCommands.getLockDirection:
        this.getLockDirection(call);
        break;
      case TTCommands.setLockDirection:
        this.setLockDirection(call);
        break;
      case TTCommands.scanWifi:
        this.scanWifi(call);
        break;
      case TTCommands.configWifi:
        this.configWifi(call);
        break;
      case TTCommands.configServer:
        this.configServer(call);
        break;
      case TTCommands.getWifiInfo:
        this.getWifiInfo(call);
        break;
      case TTCommands.configIp:
        this.configIp(call);
        break;
      case TTCommands.setLockSoundWithSoundVolume:
        this.setLockSoundWithSoundVolume(call);
        break;
      case TTCommands.getLockSoundWithSoundVolume:
        this.getLockSoundWithSoundVolume(call);
        break;
      case TTCommands.setSensitivity:
        this.setSensitivity(call);
        break;
      case TTCommands.getSensitivity:
        this.getSensitivity(call);
        break;
      case TTCommands.lockAddRemoteKey:
        this.lockAddRemoteKey(call);
        break;
      case TTCommands.lockDeleteRemoteKey:
        this.lockDeleteRemoteKey(call);
        break;
      case TTCommands.clearRemoteKey:
        this.lockClearRemoteKey(call);
        break;
      case TTCommands.lockModifyRemoteKeyValidDate:
        this.notImplemented(method);
        break;
      case TTCommands.lockGetRemoteAccessoryElectricQuantity:
        this.lockGetRemoteAccessoryElectricQuantity(call);
        break;
      case TTCommands.lockSetDoorSensorAlertTime:
        this.lockSetDoorSensorAlertTime(call);
        break;
      case TTCommands.lockAddDoorSensor:
        this.lockAddDoorSensor(call);
        break;
      case TTCommands.lockDeleteDoorSensor:
        this.lockDeleteDoorSensor(call);
        break;
      case TTCommands.startScanGateway:
        this.startScanGateway();
        break;
      case TTCommands.connectGateway:
        this.connectGateway(call);
        break;
      case TTCommands.getSurroundWifi:
        this.getSurroundWifi(call);
        break;
      case TTCommands.initGateway:
        this.initGateway(call);
        break;
      case TTCommands.upgradeGateway:
        this.upgradeGateway(call);
        break;
      case TTCommands.gatewayConfigIp:
        this.gatewayConfigIp(call);
        break;
      case TTCommands.gatewayConfigApn:
        this.gatewayConfigApn(call);
        break;
      case TTCommands.startScanRemoteKey:
        this.startScanRemoteKey();
        break;
      case TTCommands.initRemoteKey:
        this.initRemoteKey(call);
        break;
      case TTCommands.remoteKeypadStartScan:
        this.remoteKeypadStartScan();
        break;
      case TTCommands.remoteKeypadInit:
        this.remoteKeypadInit(call);
        break;
      case TTCommands.multifunctionalKeyPadDeleteLockAtSpecifiedSlot:
      case TTCommands.multifunctionalRemoteKeypadDeleteLock:
        this.multifunctionalKeyPadDeleteLockAtSpecifiedSlot(call);
        break;
      case TTCommands.multifunctionalKeyPadGetAllStoredLocks:
      case TTCommands.multifunctionalRemoteKeypadGetLocks:
        this.multifunctionalKeyPadGetAllStoredLocks(call);
        break;
      case TTCommands.multifunctionalKeyPadAddFingerprint:
      case TTCommands.multifunctionalRemoteKeypadAddFingerprint:
        this.multifunctionalKeyPadAddFingerprint(call);
        break;
      case TTCommands.multifunctionalKeyPadAddCard:
      case TTCommands.multifunctionalRemoteKeypadAddCard:
        this.multifunctionalKeyPadAddCard(call);
        break;
      case TTCommands.multifunctionalRemoteKeypadInit:
        this.multifunctionalRemoteKeypadInit(call);
        break;
      case TTCommands.createCustomPasscode:
        this.createCustomPasscode(call);
        break;
      case TTCommands.modifyPasscode:
        this.modifyPasscode(call);
        break;
      case TTCommands.deletePasscode:
        this.deletePasscode(call);
        break;
      case TTCommands.resetPasscodes:
        this.resetPasscodes(call);
        break;
      case TTCommands.getAllValidPasscode:
        this.getAllValidPasscode(call);
        break;
      case TTCommands.modifyAdminPasscode:
        this.modifyAdminPasscode(call);
        break;
      case TTCommands.getAdminPasscodeWithLockData:
        this.getAdminPasscodeWithLockData(call);
        break;
      case TTCommands.setAdminErasePasscode:
      case TTCommands.recoverCardWithCardType:
      case TTCommands.setLockEnterUpgradeMode:
      case TTCommands.activateLiftFloors:
      case TTCommands.setLiftControlableFloors:
      case TTCommands.setLiftWorkMode:
      case TTCommands.setPowerSaverWorkMode:
      case TTCommands.setPowerSaverControlable:
      case TTCommands.configCameraLockWifi:
        this.notImplemented(method);
        break;
      case TTCommands.faceAdd:
        this.faceAdd(call);
        break;
      case TTCommands.faceDataAdd:
        this.faceDataAdd(call);
        break;
      case TTCommands.faceModify:
        this.faceModify(call);
        break;
      case TTCommands.faceDelete:
        this.faceDelete(call);
        break;
      case TTCommands.faceClear:
        this.faceClear(call);
        break;
      case TTCommands.setHotelInfo:
        this.setHotelInfo(call);
        break;
      case TTCommands.setHotelCardSector:
        this.setHotelCardSector(call);
        break;
      case TTCommands.recoverPasscodeWithPasswordType:
        this.recoverPasscodeWithPasswordType(call);
        break;
      case TTCommands.addCard:
        this.addCard(call);
        break;
      case TTCommands.modifyIcCard:
        this.modifyIcCard(call);
        break;
      case TTCommands.deleteIcCard:
        this.deleteIcCard(call);
        break;
      case TTCommands.clearAllIcCard:
        this.clearAllIcCard(call);
        break;
      case TTCommands.getAllValidIcCard:
        this.getAllValidIcCard(call);
        break;
      case TTCommands.addFingerprint:
        this.addFingerprint(call);
        break;
      case TTCommands.modifyFingerprint:
        this.modifyFingerprint(call);
        break;
      case TTCommands.deleteFingerprint:
        this.deleteFingerprint(call);
        break;
      case TTCommands.clearAllFingerprint:
        this.clearAllFingerprint(call);
        break;
      case TTCommands.getAllValidFingerprint:
        this.getAllValidFingerprint(call);
        break;
      case TTCommands.doorSensorStartScan:
        this.doorSensorStartScan();
        break;
      case TTCommands.doorSensorInit:
        this.doorSensorInit(call);
        break;
      default:
        this.notImplemented(method);
        break;
    }
  }

  private scanModelToFlutterData(model: TTLockScanModel): Record<string, Object> {
    let lockSwitchState = 2;
    if (model.lockSwitchState === TTLockSwitchState.lock) {
      lockSwitchState = 0;
    } else if (model.lockSwitchState === TTLockSwitchState.unlock) {
      lockSwitchState = 1;
    }
    return {
      'lockName': model.name,
      'lockMac': model.mac,
      'isInited': model.isInited,
      'isAllowUnlock': model.isAllowUnlock,
      'electricQuantity': model.electricQuantity,
      'lockVersion': model.lockVersion ?? '',
      'lockSwitchState': lockSwitchState,
      'rssi': model.rssi,
      'oneMeterRssi': model.oneMeterRssi ?? 0,
      'timestamp': model.timestamp ?? Date.now(),
    };
  }

  private startScanLock(): void {
    TTLock.startScanLock((model: TTLockScanModel) => {
      this.callbackCommand(
        TTCommands.startScanLock,
        RESULT_STATE_SUCCESS,
        this.scanModelToFlutterData(model),
        -1,
        ''
      );
    });
  }

  private getBluetoothState(): void {
    const state = TTLock.getState();
    const stateValue = (state as number) >= 0 && (state as number) <= 5 ? (state as number) : 0;
    this.callbackCommand(TTCommands.getBluetoothState, RESULT_STATE_SUCCESS, { 'state': stateValue }, -1, '');
  }

  private initLock(call: MethodCall): void {
    const lockMac = (call.argument("lockMac") as string) ?? '';
    const lockVersion = (call.argument("lockVersion") as string | undefined) ?? '';
    const config: IInitLockModel = {
      mac: lockMac,
      lockVersion: lockVersion,
      clientPara: (call.argument("clientPara") as string | undefined) ?? undefined,
    };
    TTLock.initLock(config, {
      success: (lockData: string) => {
        this.callbackCommand(TTCommands.initLock, RESULT_STATE_SUCCESS, { 'lockData': lockData }, -1, '');
      },
      failure: (err: SNError) => {
        this.callbackCommand(TTCommands.initLock, RESULT_STATE_FAIL, null, err.code ?? 1, err.msg ?? 'init failed');
      },
    });
  }

  private controlLock(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const controlAction = (call.argument("controlAction") as number) ?? 0;
    const action = controlAction === 1 ? TTControlAction.lock : TTControlAction.unlock;
    TTLock.controlLockWithControlAction(lockData, action, {
      success: (info: ITTControlModel) => {
        const data: Record<string, Object> = {};
        data['uniqueId'] = info.uniqueId;
        data['electricQuantity'] = info.electricQuantity
        data['lockTime'] = info.lockTime
        this.callbackCommand(TTCommands.controlLock, RESULT_STATE_SUCCESS, data, -1, '');
      },
      failure: (err: SNError) => {
        this.callbackCommand(TTCommands.controlLock, RESULT_STATE_FAIL, null, err.code ?? 1, err.msg ?? 'control failed');
      },
    });
  }

  private resetLock(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.resetLock(lockData, {
      success: () => {
        this.callbackCommand(TTCommands.resetLock, RESULT_STATE_SUCCESS, null, -1, '');
      },
      failure: (err: SNError) => {
        this.callbackCommand(TTCommands.resetLock, RESULT_STATE_FAIL, null, err.code ?? 1, err.msg ?? 'reset failed');
      },
    });
  }

  private resetLockByCode(call: MethodCall): void {
    const resetCode = (call.argument("resetCode") as string) ?? '';
    const mac = (call.argument("lockMac") as string) ?? (call.argument("mac") as string) ?? '';
    TTLock.resetLockByCode(resetCode, mac, {
      success: () => {
        this.callbackCommand(TTCommands.resetLockByCode, RESULT_STATE_SUCCESS, null, -1, '');
      },
      failure: (err: SNError) => {
        this.callbackCommand(TTCommands.resetLockByCode, RESULT_STATE_FAIL, null, err.code ?? 1, err.msg ?? 'reset by code failed');
      },
    });
  }

  private async functionSupport(call: MethodCall): Promise<void> {
    const lockData = (call.argument("lockData") as string) ?? '';
    const supportFunction = (call.argument("supportFunction") as number) ?? 0;
    try {
      const func = supportFunction as TTLockFeatureValue;
      const isSupport = await TTLock.supportFunction(lockData, func);
      this.callbackCommand(
        TTCommands.functionSupport,
        RESULT_STATE_SUCCESS,
        { 'isSupport': isSupport, 'supportFunction': supportFunction },
        -1,
        ''
      );
    } catch (e) {
      const msg = e instanceof Error ? e.message : 'functionSupport failed';
      this.callbackCommand(TTCommands.functionSupport, RESULT_STATE_FAIL, null, 1, msg);
    }
  }

  private sendResult(cmd: string, success: boolean, data: Record<string, Object> | null, err?: SNError): void {
    if (success) {
      this.callbackCommand(cmd, RESULT_STATE_SUCCESS, data ?? {}, -1, '');
    } else {
      this.callbackCommand(cmd, RESULT_STATE_FAIL, null, err?.code ?? 1, err?.msg ?? '');
    }
  }

  private resetEkey(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.resetEKey(lockData, {
      success: () => this.sendResult(TTCommands.resetEkey, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.resetEkey, false, null, e),
    });
  }

  private getLockSwitchState(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getLockSwitchState(lockData, {
      success: (state) => {
        const lockSwitchState = state?.lockSwitchState === TTLockSwitchState.unlock ? 1 :
          (state?.lockSwitchState === TTLockSwitchState.lock ? 0 : 2);
        const doorSensorState = (state?.doorSensorState != null) ? Number(state.doorSensorState) : 2;
        const lockBackState = (state.lockSwitchState != null) ? Number(state.lockSwitchState) : 2;
        this.callbackCommand(TTCommands.getLockSwitchState, RESULT_STATE_SUCCESS, {
          'lockSwitchState': lockSwitchState,
          'doorSensorState': doorSensorState,
          'lockBackState': lockBackState,
        }, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.getLockSwitchState, false, null, e),
    });
  }

  private setLockTime(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const timestamp = (call.argument("timestamp") as number) ?? Date.now();
    TTLock.timeCalibration(lockData, timestamp, {
      success: () => this.sendResult(TTCommands.setLockTime, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setLockTime, false, null, e),
    });
  }

  private getLockTime(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getLockTime(lockData, {
      success: (time: number) => this.callbackCommand(TTCommands.getLockTime, RESULT_STATE_SUCCESS, { 'timestamp': time }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getLockTime, false, null, e),
    });
  }

  private getLockOperateRecord(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const type = ((call.argument("type") as number) ?? 1) === 2 ? TTOperateLogType.all : TTOperateLogType.latest;
    TTLock.getOperationLog(lockData, type, {
      success: (logs: string) => this.callbackCommand(TTCommands.getLockOperateRecord, RESULT_STATE_SUCCESS, { 'records': logs }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getLockOperateRecord, false, null, e),
    });
  }

  private getLockPower(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getElectricQuantity(
      lockData,
      {
        success: (quantity: number) => this.callbackCommand(TTCommands.getLockPower, RESULT_STATE_SUCCESS, { 'electricQuantity': quantity }, -1, ''),
        failure: (e: SNError) => this.sendResult(TTCommands.getLockPower, false, null, e),
      }
    );
  }

  private getLockSystemInfoWithLockData(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getLockSystemInfo(lockData, {
      success: (info: Map<string, Object>) => {
        const data: Record<string, Object> = {};
        info.forEach((v, k) => { data[k] = v; });
        this.callbackCommand(TTCommands.getLockSystemInfoWithLockData, RESULT_STATE_SUCCESS, data, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.getLockSystemInfoWithLockData, false, null, e),
    });
  }

  private getLockFeatureValue(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getLockFeature(lockData, {
      success: (value: string) => this.callbackCommand(TTCommands.getLockFreatureValue, RESULT_STATE_SUCCESS, { 'featureValue': value }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getLockFreatureValue, false, null, e),
    });
  }

  private getLockAutomaticLockingPeriodicTime(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getAutomaticLockingPeriodicTime(lockData, {
      success: (info) => {
        const data: Record<string, Object> = {};
        if (info?.minTime != null) data['minTime'] = info.minTime;
        if (info?.maxTime != null) data['maxTime'] = info.maxTime;
        if (info?.currentTime != null) data['currentTime'] = info.currentTime;
        this.callbackCommand(TTCommands.getLockAutomaticLockingPeriodicTime, RESULT_STATE_SUCCESS, data, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.getLockAutomaticLockingPeriodicTime, false, null, e),
    });
  }

  private setLockAutomaticLockingPeriodicTime(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const seconds = (call.argument("seconds") as number) ?? 0;
    TTLock.setAutomaticLockingPeriodicTime(lockData, seconds, {
      success: () => this.sendResult(TTCommands.setLockAutomaticLockingPeriodicTime, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setLockAutomaticLockingPeriodicTime, false, null, e),
    });
  }

  private getLockRemoteUnlockSwitchState(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getRemoteUnlockSwitch(lockData, {
      success: (on: boolean) => this.callbackCommand(TTCommands.getLockRemoteUnlockSwitchState, RESULT_STATE_SUCCESS, { 'on': on }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getLockRemoteUnlockSwitchState, false, null, e),
    });
  }

  private setLockRemoteUnlockSwitchState(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const on = (call.argument("on") as boolean) ?? false;
    TTLock.setRemoteUnlockSwitch(lockData, on, {
      success: () => this.sendResult(TTCommands.setLockRemoteUnlockSwitchState, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setLockRemoteUnlockSwitchState, false, null, e),
    });
  }

  private getLockVersion(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const mac = (call.argument("lockMac") as string) ?? lockData;
    TTLock.getLockVersion(mac, {
      success: (map: Map<string, Object>) => {
        const data: Record<string, Object> = {};
        map.forEach((v: Object, k: string) => { data[k] = v; });
        this.callbackCommand(TTCommands.getLockVersion, RESULT_STATE_SUCCESS, data, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.getLockVersion, false, null, e),
    });
  }

  private addPassageMode(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const typeNum = (call.argument("type") as number) ?? 1;
    const type = typeNum === 2 ? PASSAGE_MODE_MONTH : PASSAGE_MODE_WEEK;
    const weekOrDays = (call.argument("weekOrDays") as number[]) ?? [];
    const startTime = (call.argument("startTime") as number) ?? 0;
    const endTime = (call.argument("endTime") as number) ?? 0;
    TTLock.setPassageMode(lockData, type as number, weekOrDays, startTime, endTime, {
      success: () => this.sendResult(TTCommands.addPassageMode, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.addPassageMode, false, null, e),
    });
  }

  private clearAllPassageModes(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.clearPassageMode(lockData, {
      success: () => this.sendResult(TTCommands.clearAllPassageModes, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.clearAllPassageModes, false, null, e),
    });
  }

  private getLockConfig(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const configType = (call.argument("configType") as number) ?? 0;
    TTLock.getLockConfigWithType(lockData, configType as TTLockConfigType, {
      success: (arg: ITTPublicSwitchModel) => this.callbackCommand(TTCommands.getLockConfig, RESULT_STATE_SUCCESS, { 'config': arg.isOn ? 1 : 0 }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getLockConfig, false, null, e),
    });
  }

  private setLockConfig(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const configType = (call.argument("configType") as number) ?? 0;
    const value = (call.argument("value") as number) ?? 0;
    const on = value === 1;
    TTLock.setLockConfigWithType(lockData, on, configType as TTLockConfigType, {
      success: () => this.sendResult(TTCommands.setLockConfig, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setLockConfig, false, null, e),
    });
  }

  private getLockDirection(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getUnlockDirection(lockData, {
      success: (arg: ITTPublicSwitchModel) => this.callbackCommand(TTCommands.getLockDirection, RESULT_STATE_SUCCESS, { 'direction': arg.isOn ? UNLOCK_DIRECTION_LEFT : UNLOCK_DIRECTION_RIGHT }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getLockDirection, false, null, e),
    });
  }

  private setLockDirection(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const direction = (call.argument("direction") as number) ?? 0;
    TTLock.setUnlockDirection(lockData, direction as number, {
      success: () => this.sendResult(TTCommands.setLockDirection, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setLockDirection, false, null, e),
    });
  }

  private scanWifi(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.lockScanNearbyWifi(lockData, {
      success: (info) => {
        const wifiList = info?.wifiList ?? [];
        const arr: Record<string, Object>[] = [];
        for (let i = 0; i < wifiList.length; i++) {
          const item = wifiList[i] as Map<string, Object>;
          const o: Record<string, Object> = {};
          const w = item.get('wifi');
          const r = item.get('rssi');
          if (w != null) o['wifi'] = w;
          if (r != null) o['rssi'] = r;
          arr.push(o);
        }
        this.callbackCommand(TTCommands.scanWifi, RESULT_STATE_SUCCESS, { 'list': arr as Object[], 'isFinished': info?.isFinished ?? true }, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.scanWifi, false, null, e),
    });
  }

  private configWifi(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const wifi = (call.argument("wifi") as string) ?? (call.argument("SSID") as string) ?? '';
    const wifiPassword = (call.argument("wifiPassword") as string) ?? (call.argument("wifiPwd") as string) ?? '';
    TTLock.lockConfigWifi(lockData, wifi, wifiPassword, {
      success: () => this.sendResult(TTCommands.configWifi, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.configWifi, false, null, e),
    });
  }

  private configServer(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const service = (call.argument("server") as string) ?? (call.argument("service") as string) ?? '';
    const port = (call.argument("port") as number) ?? 0;
    TTLock.configLockServer(lockData, service, port, {
      success: () => this.sendResult(TTCommands.configServer, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.configServer, false, null, e),
    });
  }

  private getWifiInfo(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getLockWifiInfo(lockData, {
      success: (info) => {
        const data: Record<string, Object> = {};
        if (info != null) {
          if (info.mac != null) data['wifi'] = info.mac;
          if (info.rssi != null) data['rssi'] = info.rssi;
        }
        this.callbackCommand(TTCommands.getWifiInfo, RESULT_STATE_SUCCESS, data, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.getWifiInfo, false, null, e),
    });
  }

  private configIp(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const ipAddress = (call.argument("ip") as string) ?? (call.argument("ipAddress") as string) ?? '';
    const auto = (call.argument("auto") as boolean) ?? (ipAddress === '');
    const subnetMask = (call.argument("mask") as string) ?? (call.argument("subnetMask") as string) ?? '';
    const router = (call.argument("gateway") as string) ?? (call.argument("router") as string) ?? '';
    const preferredDns = (call.argument("preferredDns") as string) ?? '';
    const alternateDns = (call.argument("alternateDns") as string) ?? '';
    TTLock.configLockIP(lockData, auto, {
      success: () => this.sendResult(TTCommands.configIp, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.configIp, false, null, e),
    }, ipAddress, subnetMask, router, preferredDns, alternateDns);
  }

  private setLockSoundWithSoundVolume(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const volume = (call.argument("soundVolume") as number) ?? 0;
    TTLock.setLockSound(lockData, true, volume as TTSoundVolume, TTLanguage.none, {
      success: () => this.sendResult(TTCommands.setLockSoundWithSoundVolume, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setLockSoundWithSoundVolume, false, null, e),
    });
  }

  private getLockSoundWithSoundVolume(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getLockSound(lockData, {
      success: (arg: ITTAudioModel) => this.callbackCommand(TTCommands.getLockSoundWithSoundVolume, RESULT_STATE_SUCCESS, { 'soundVolume': arg.volume }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getLockSoundWithSoundVolume, false, null, e),
    });
  }

  private setSensitivity(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const value = (call.argument("sensitivity") as number) ?? 0;
    TTLock.setSensitivity(lockData, value as TTSensitivityValue, {
      success: () => this.sendResult(TTCommands.setSensitivity, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setSensitivity, false, null, e),
    });
  }

  private getSensitivity(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getSensitivity(lockData, {
      success: (value: TTSensitivityValue) => this.callbackCommand(TTCommands.getSensitivity, RESULT_STATE_SUCCESS, { 'sensitivity': value }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getSensitivity, false, null, e),
    });
  }

  private lockAddRemoteKey(call: MethodCall): void {
    const keyMac = (call.argument("wirelessKeyMac") as string) ?? (call.argument("keyMac") as string) ?? '';
    const lockData = (call.argument("lockData") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const rawCyclic = call.argument("cyclicConfig") as Record<string, number>[] | null | undefined;
    let cyclicConfig: ITTLockCyclicConfig[] | null = null;
    if (rawCyclic != null && rawCyclic.length > 0) {
      cyclicConfig = rawCyclic.map((c: Record<string, number>): ITTLockCyclicConfig => {
        const item: ITTLockCyclicConfig = {
          weekDay: c['weekDay'] ?? 1,
          startTime: c['startTime'] ?? 0,
          endTime: c['endTime'] ?? 0,
        };
        return item;
      });
    }
    TTLock.addWirelessKey(keyMac, lockData, startDate, endDate, cyclicConfig, {
      success: () => this.callbackCommand(TTCommands.lockAddRemoteKey, RESULT_STATE_SUCCESS, {}, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.lockAddRemoteKey, false, null, e),
    });
  }

  private lockDeleteRemoteKey(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const wirelessKeyNumber = (call.argument("wirelessKeyNumber") as string) ?? '';
    TTLock.deleteWirelessKey(lockData, wirelessKeyNumber, {
      success: () => this.sendResult(TTCommands.lockDeleteRemoteKey, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.lockDeleteRemoteKey, false, null, e),
    });
  }

  private lockClearRemoteKey(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.clearWirelessKey(lockData, {
      success: () => this.sendResult(TTCommands.clearRemoteKey, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.clearRemoteKey, false, null, e),
    });
  }

  private parseCyclicConfig(call: MethodCall): ITTLockCyclicConfig[] | null {
    const rawCyclic = call.argument("cyclicConfig") as Record<string, number>[] | null | undefined;
    if (rawCyclic == null || rawCyclic.length === 0) {
      return null;
    }
    return rawCyclic.map((c: Record<string, number>): ITTLockCyclicConfig => {
      return {
        weekDay: c['weekDay'] ?? 1,
        startTime: c['startTime'] ?? 0,
        endTime: c['endTime'] ?? 0,
      };
    });
  }

  private createCustomPasscode(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const passcode = (call.argument("passcode") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    TTLock.createCustomPasscode(lockData, passcode, startDate, endDate, {
      success: () => this.callbackCommand(TTCommands.createCustomPasscode, RESULT_STATE_SUCCESS, { 'passcode': passcode }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.createCustomPasscode, false, null, e),
    });
  }

  private modifyPasscode(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const passcode = (call.argument("passcodeOrigin") as string) ?? (call.argument("passcode") as string) ?? '';
    const newPasscode = (call.argument("passcodeNew") as string) ?? (call.argument("newPasscode") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    TTLock.modifyPasscode(lockData, passcode, newPasscode, startDate, endDate, {
      success: () => this.callbackCommand(TTCommands.modifyPasscode, RESULT_STATE_SUCCESS, {}, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.modifyPasscode, false, null, e),
    });
  }

  private deletePasscode(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const passcode = (call.argument("passcode") as string) ?? '';
    TTLock.deletePasscode(lockData, passcode, {
      success: () => this.sendResult(TTCommands.deletePasscode, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.deletePasscode, false, null, e),
    });
  }

  private resetPasscodes(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.resetPasscodes(lockData, {
      success: (newLockData: string) => this.callbackCommand(TTCommands.resetPasscodes, RESULT_STATE_SUCCESS, { 'lockData': newLockData }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.resetPasscodes, false, null, e),
    });
  }

  private getAllValidPasscode(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getAllValidPasscodes(lockData, {
      success: (listStr: string) => this.callbackCommand(TTCommands.getAllValidPasscode, RESULT_STATE_SUCCESS, { 'passcodeListString': listStr }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getAllValidPasscode, false, null, e),
    });
  }

  private modifyAdminPasscode(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const adminPasscode = (call.argument("adminPasscode") as string) ?? '';
    TTLock.modifyAdminPasscode(lockData, adminPasscode, {
      success: () => this.callbackCommand(TTCommands.modifyAdminPasscode, RESULT_STATE_SUCCESS, { 'lockData': lockData }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.modifyAdminPasscode, false, null, e),
    });
  }

  private getAdminPasscodeWithLockData(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getAdminPasscode(lockData, {
      success: (passcode: string) => this.callbackCommand(TTCommands.getAdminPasscodeWithLockData, RESULT_STATE_SUCCESS, { 'adminPasscode': passcode }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getAdminPasscodeWithLockData, false, null, e),
    });
  }

  private recoverPasscodeWithPasswordType(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const passcodeType = (call.argument("passcodeType") as number) ?? 0;
    const passcode = (call.argument("passcode") as string) ?? '';
    const newPasscode = (call.argument("newPasscode") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const cycleType = (call.argument("cycleType") as number) ?? 0;
    TTLock.recoverPasscode(lockData, passcodeType, passcode, newPasscode, startDate, endDate, cycleType, {
      success: () => this.sendResult(TTCommands.recoverPasscodeWithPasswordType, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.recoverPasscodeWithPasswordType, false, null, e),
    });
  }

  private addCard(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const cyclicConfig = this.parseCyclicConfig(call);
    TTLock.addICCard(lockData, startDate, endDate, cyclicConfig, {
      success: (data) => {
        switch (data.status){
          case TTAddState.canStartAdd.valueOf():
          case TTAddState.error.valueOf():
            this.callbackCommand(
              TTCommands.faceAdd, RESULT_STATE_PROGRESS,
              {},
              -1,
              ''
            )
          case TTAddState.success.valueOf():
            this.callbackCommand(
              TTCommands.faceAdd, RESULT_STATE_SUCCESS,
              { 'faceNumber': data.cardNumber ?? '' },
              -1, ''
            );
        }
      },
      failure: (e: SNError) => this.sendResult(TTCommands.addCard, false, null, e),
    });
  }

  private modifyIcCard(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const cardNumber = (call.argument("cardNumber") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const cyclicConfig = this.parseCyclicConfig(call);
    TTLock.modifyICCard(lockData, cardNumber, startDate, endDate, cyclicConfig, {
      success: () => this.sendResult(TTCommands.modifyIcCard, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.modifyIcCard, false, null, e),
    });
  }

  private deleteIcCard(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const cardNumber = (call.argument("cardNumber") as string) ?? '';
    TTLock.deleteICCard(lockData, cardNumber, {
      success: () => this.sendResult(TTCommands.deleteIcCard, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.deleteIcCard, false, null, e),
    });
  }

  private clearAllIcCard(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.clearAllICCard(lockData, {
      success: () => this.sendResult(TTCommands.clearAllIcCard, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.clearAllIcCard, false, null, e),
    });
  }

  private getAllValidIcCard(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getAllValidICCard(lockData, {
      success: (listStr: string) => this.callbackCommand(TTCommands.getAllValidIcCard, RESULT_STATE_SUCCESS, { 'cardListString': listStr }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getAllValidIcCard, false, null, e),
    });
  }

  private addFingerprint(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const cyclicConfig = this.parseCyclicConfig(call);
    TTLock.addFingerprint(lockData, startDate, endDate, cyclicConfig, {
      success: (model: IAddFingerprintProgressModel | Record<string, Object>) => {
        const m = model as Record<string, Object>;
        const totalCount = m['totalCount'] as number | undefined;
        const currentCount = m['currentCount'] as number | undefined;
        const fingerprintNumber = m['fingerprintNumber'] ?? m['fingerprintNum'];
        if (totalCount != null && currentCount != null && fingerprintNumber == null) {
          this.callbackCommand(TTCommands.addFingerprint, RESULT_STATE_PROGRESS, { 'currentCount': currentCount, 'totalCount': totalCount }, -1, '');
        } else {
          this.callbackCommand(TTCommands.addFingerprint, RESULT_STATE_SUCCESS, { 'fingerprintNumber': String(fingerprintNumber ?? '') }, -1, '');
        }
      },
      failure: (e: SNError) => this.sendResult(TTCommands.addFingerprint, false, null, e),
    });
  }

  private modifyFingerprint(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const fingerprintNumber = (call.argument("fingerprintNumber") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const cyclicConfig = this.parseCyclicConfig(call);
    TTLock.modifyFingerprint(lockData, fingerprintNumber, startDate, endDate, cyclicConfig, {
      success: () => this.sendResult(TTCommands.modifyFingerprint, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.modifyFingerprint, false, null, e),
    });
  }

  private deleteFingerprint(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const fingerprintNumber = (call.argument("fingerprintNumber") as string) ?? '';
    TTLock.deleteFingerprint(lockData, fingerprintNumber, {
      success: () => this.sendResult(TTCommands.deleteFingerprint, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.deleteFingerprint, false, null, e),
    });
  }

  private clearAllFingerprint(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.clearAllFingerprint(lockData, {
      success: () => this.sendResult(TTCommands.clearAllFingerprint, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.clearAllFingerprint, false, null, e),
    });
  }

  private getAllValidFingerprint(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.getAllValidFingerprints(lockData, {
      success: (listStr: string) => this.callbackCommand(TTCommands.getAllValidFingerprint, RESULT_STATE_SUCCESS, { 'fingerprintListString': listStr }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.getAllValidFingerprint, false, null, e),
    });
  }

  private faceAdd(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const cyclicConfig = this.parseCyclicConfig(call);
    TTLock.addFace(lockData, startDate, endDate, cyclicConfig, {
      success: (model) => {
        switch (model.addState){
          case TTAddState.canStartAdd:
          case TTAddState.error:
            this.callbackCommand(
              TTCommands.faceAdd, RESULT_STATE_PROGRESS,
              {
                'state': model.addState.valueOf(),
                'errcode': model.errorCode.valueOf()
              },
              -1,
              ''
            )
          case TTAddState.success:
            this.callbackCommand(
              TTCommands.faceAdd, RESULT_STATE_SUCCESS,
              { 'faceNumber': model.faceNumber ?? '' },
              -1, ''
            );
        }
      },
      failure: (e: SNError) => this.sendResult(TTCommands.faceAdd, false, null, e),
    });
  }

  private faceDataAdd(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const featureData = (call.argument("featureData") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const cyclicConfig = this.parseCyclicConfig(call);
    TTLock.addFaceFeatureData(lockData, featureData, startDate, endDate, cyclicConfig, {
      success: (faceNumber: string) => this.callbackCommand(TTCommands.faceDataAdd, RESULT_STATE_SUCCESS, { 'faceNumber': faceNumber }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.faceDataAdd, false, null, e),
    });
  }

  private faceModify(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const faceNum = (call.argument("faceNumber") as string) ?? (call.argument("faceNum") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const cyclicConfig = this.parseCyclicConfig(call);
    TTLock.modifyFace(lockData, faceNum, startDate, endDate, cyclicConfig, {
      success: () => this.sendResult(TTCommands.faceModify, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.faceModify, false, null, e),
    });
  }

  private faceDelete(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const faceNumber = (call.argument("faceNumber") as string) ?? '';
    TTLock.deleteFace(lockData, faceNumber, {
      success: () => this.sendResult(TTCommands.faceDelete, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.faceDelete, false, null, e),
    });
  }

  private faceClear(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.clearFace(lockData, {
      success: () => this.sendResult(TTCommands.faceClear, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.faceClear, false, null, e),
    });
  }

  private setHotelInfo(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const hotelInfo = (call.argument("hotelInfo") as string) ?? '';
    const buildingNumber = (call.argument("buildingNumber") as number) ?? 0;
    const floorNumber = (call.argument("floorNumber") as number) ?? 0;
    TTLock.setHotelDataWithHotelInfo(lockData, hotelInfo, buildingNumber, floorNumber, {
      success: () => this.sendResult(TTCommands.setHotelInfo, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setHotelInfo, false, null, e),
    });
  }

  private setHotelCardSector(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const sector = (call.argument("sector") as string) ?? '';
    TTLock.setHotelCardSector(lockData, sector, {
      success: () => this.sendResult(TTCommands.setHotelCardSector, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.setHotelCardSector, false, null, e),
    });
  }

  private lockGetRemoteAccessoryElectricQuantity(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const accessoryMac = (call.argument("accessoryMac") as string) ?? '';
    TTLock.getAccessoryElectricQuantity(lockData, accessoryMac, TTAccessoryType.doorMagnetic, {
      success: (map) => {
        const quantity = (map != null && map.get('electricQuantity') != null) ? Number(map.get('electricQuantity')) : 0;
        this.callbackCommand(TTCommands.lockGetRemoteAccessoryElectricQuantity, RESULT_STATE_SUCCESS, { 'electricQuantity': quantity }, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.lockGetRemoteAccessoryElectricQuantity, false, null, e),
    });
  }

  private lockSetDoorSensorAlertTime(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const alertTime = (call.argument("alertTime") as number) ?? 0;
    TTLock.setDoorMagneticAlertTime(lockData, alertTime, {
      success: () => this.sendResult(TTCommands.lockSetDoorSensorAlertTime, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.lockSetDoorSensorAlertTime, false, null, e),
    });
  }

  private lockAddDoorSensor(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const doorSensorMac = (call.argument("doorSensorMac") as string) ?? (call.argument("mac") as string) ?? '';
    TTLock.initializeDoorMagnetic(doorSensorMac, lockData, {
      success: () => this.sendResult(TTCommands.lockAddDoorSensor, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.lockAddDoorSensor, false, null, e),
    });
  }

  private lockDeleteDoorSensor(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.clearDoorMagnetic(lockData, {
      success: () => this.sendResult(TTCommands.lockDeleteDoorSensor, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.lockDeleteDoorSensor, false, null, e),
    });
  }

  private gatewayScanModelToFlutterData(model: TTGatewayScanModel): Record<string, Object> {
    return {
      'gatewayMac': model.mac,
      'gatewayName': model.name ?? '',
      'rssi': model.rssi ?? 0,
      'isDfuMode': model.isNordicDfuMode ?? model.isTeLinkDfuMode ?? false,
      'type': model.type ?? 0,
    };
  }

  private startScanGateway(): void {
    TTLock.startScanGateway((model: TTGatewayScanModel) => {
      this.callbackCommand(TTCommands.startScanGateway, RESULT_STATE_SUCCESS, this.gatewayScanModelToFlutterData(model), -1, '');
    });
  }

  private connectGateway(call: MethodCall): void {
    const mac = (call.argument("gatewayMac") as string) ?? (call.argument("mac") as string) ?? '';
    TTLock.connectGateway(mac, {
      success: () => this.sendResult(TTCommands.connectGateway, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.connectGateway, false, null, e),
    });
  }

  private getSurroundWifi(call: MethodCall): void {
    TTLock.scanWiFiByGateway({
      success: (map) => {
        const data: Record<string, Object> = {};
        if (map != null) {
          map.forEach((v: Object, k: string) => {
            data[k] = v;
          });
        }
        this.callbackCommand(TTCommands.getSurroundWifi, RESULT_STATE_SUCCESS, data, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.getSurroundWifi, false, null, e),
    });
  }

  private initGateway(call: MethodCall): void {
    TTLock.gatewayInit({
      SSID: (call.argument("wifi") as string) ?? (call.argument("SSID") as string) ?? '',
      wifiPwd: (call.argument("wifiPassword") as string) ?? (call.argument("wifiPwd") as string) ?? '',
      uid: (call.argument("uid") as string) ?? '',
      userPwd: (call.argument("userPwd") as string) ?? '',
      companyId: (call.argument("companyId") as string) ?? undefined,
      gatewayName: (call.argument("gatewayName") as string) ?? '',
      gatewayVersion: (call.argument("gatewayVersion") as number) ?? 0,
      portNumber: (call.argument("portNumber") as string) ?? '',
    }, {
      success: (gateway) => {
        const data: Record<string, Object> = {};
        if (gateway != null) {
          if (gateway.modelNum != null) data['modelNum'] = gateway.modelNum;
          if (gateway.hardwareRevision != null) data['hardwareRevision'] = gateway.hardwareRevision;
          if (gateway.firmwareRevision != null) data['firmwareRevision'] = gateway.firmwareRevision;
        }
        this.callbackCommand(TTCommands.initGateway, RESULT_STATE_SUCCESS, data, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.initGateway, false, null, e),
    });
  }

  private upgradeGateway(call: MethodCall): void {
    const mac = (call.argument("gatewayMac") as string) ?? (call.argument("mac") as string) ?? '';
    TTLock.upgradeGatewayMode(mac, {
      success: () => this.sendResult(TTCommands.upgradeGateway, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.upgradeGateway, false, null, e),
    });
  }

  private gatewayConfigIp(call: MethodCall): void {
    const auto = (call.argument("auto") as boolean) ?? false;
    const ipAddress = (call.argument("ip") as string) ?? (call.argument("ipAddress") as string) ?? '';
    const subnetMask = (call.argument("mask") as string) ?? (call.argument("subnetMask") as string) ?? '';
    const router = (call.argument("gateway") as string) ?? (call.argument("router") as string) ?? '';
    const preferredDns = (call.argument("preferredDns") as string) ?? '';
    const alternateDns = (call.argument("alternateDns") as string) ?? '';
    TTLock.gatewayConfigIp({ auto, ipAddress, subnetMask, router, preferredDns, alternateDns }, {
      success: () => this.sendResult(TTCommands.gatewayConfigIp, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.gatewayConfigIp, false, null, e),
    });
  }

  private gatewayConfigApn(call: MethodCall): void {
    const apn = (call.argument("apn") as string) ?? '';
    TTLock.gatewayConfigAPN(apn, {
      success: () => this.sendResult(TTCommands.gatewayConfigApn, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.gatewayConfigApn, false, null, e),
    });
  }

  private startScanRemoteKey(): void {
    TTLock.startScanWirelessKey((model) => {
      const data: Record<string, Object> = {
        'mac': model.mac,
        'name': model.name ?? '',
        'rssi': model.rssi ?? 0,
      };
      this.callbackCommand(TTCommands.startScanRemoteKey, RESULT_STATE_SUCCESS, data, -1, '');
    });
  }

  private initRemoteKey(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const wirelessKeyMac = (call.argument("wirelessKeyMac") as string) ?? (call.argument("mac") as string) ?? '';
    TTLock.initializeWirelessKey(lockData, wirelessKeyMac, {
      success: () => this.sendResult(TTCommands.initRemoteKey, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.initRemoteKey, false, null, e),
    });
  }

  private remoteKeypadStartScan(): void {
    TTLock.startScanWirelessKeyboard((model) => {
      const data: Record<string, Object> = {
        'mac': model.mac,
        'name': model.name,
        'rssi': model.rssi,
        'isMultifunctionalKeypad': model.isMultifunctionalKeypad,
      };
      this.callbackCommand(TTCommands.remoteKeypadStartScan, RESULT_STATE_SUCCESS, data, -1, '');
    });
  }

  private remoteKeypadInit(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const keypadMac = (call.argument("keypadMac") as string) ?? (call.argument("mac") as string) ?? '';
    TTLock.initializeKeypad(lockData, keypadMac, {
      success: () => this.sendResult(TTCommands.remoteKeypadInit, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.remoteKeypadInit, false, null, e),
    });
  }

  private multifunctionalKeyPadDeleteLockAtSpecifiedSlot(call: MethodCall): void {
    const keypadMac = (call.argument("keypadMac") as string) ?? (call.argument("mac") as string) ?? '';
    const slot = (call.argument("slot") as number) ?? 0;
    TTLock.multifunctionalKeyPadDeleteLockAtSpecifiedSlot(keypadMac, slot, {
      success: () => this.sendResult(TTCommands.multifunctionalKeyPadDeleteLockAtSpecifiedSlot, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.multifunctionalKeyPadDeleteLockAtSpecifiedSlot, false, null, e),
    });
  }

  private multifunctionalKeyPadGetAllStoredLocks(call: MethodCall): void {
    const keypadMac = (call.argument("keypadMac") as string) ?? (call.argument("mac") as string) ?? '';
    TTLock.multifunctionalKeyPadGetAllStoredLocks(keypadMac, {
      success: (list: string[] | undefined) => {
        const arr: Object[] = list ?? [];
        const data: Record<string, Object> = { 'list': arr };
        this.callbackCommand(TTCommands.multifunctionalKeyPadGetAllStoredLocks, RESULT_STATE_SUCCESS, data, -1, '');
      },
      failure: (e: SNError) => this.sendResult(TTCommands.multifunctionalKeyPadGetAllStoredLocks, false, null, e),
    });
  }

  private multifunctionalKeyPadAddFingerprint(call: MethodCall): void {
    const keypadMac = (call.argument("keypadMac") as string) ?? (call.argument("mac") as string) ?? '';
    const lockData = (call.argument("lockData") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const rawCyclic = call.argument("cyclicConfig") as Record<string, number>[] | null | undefined;
    let cyclicConfig: ITTLockCyclicConfig[] | null = null;
    if (rawCyclic != null && rawCyclic.length > 0) {
      cyclicConfig = rawCyclic.map((c: Record<string, number>): ITTLockCyclicConfig => {
        const item: ITTLockCyclicConfig = {
          weekDay: c['weekDay'] ?? 1,
          startTime: c['startTime'] ?? 0,
          endTime: c['endTime'] ?? 0,
        };
        return item;
      });
    }
    const progressBack = (progress: IAddFingerprintProgressModel): void => {
      this.callbackCommand(
        TTCommands.multifunctionalKeyPadAddFingerprint,
        RESULT_STATE_PROGRESS,
        { 'currentCount': progress.currentCount, 'totalCount': progress.totalCount },
        -1,
        ''
      );
    };
    const keypadFailure = (status: TTKeypadStatus): void => {
      const code = (status as number) >= 0 ? (status as number) : Math.abs(status as number);
      const msg = status === TTKeypadStatus.duplicateFingerprint ? 'duplicate fingerprint' :
        (status === TTKeypadStatus.fail ? 'keypad fail' : 'keypad error');
      this.callbackCommand(TTCommands.multifunctionalKeyPadAddFingerprint, RESULT_STATE_FAIL, null, code, msg);
    };
    TTLock.multifunctionalKeyPadAddFingerprint(keypadMac, lockData, startDate, endDate, cyclicConfig, progressBack, keypadFailure, {
      success: (fingerprintNumber: string) => this.callbackCommand(TTCommands.multifunctionalKeyPadAddFingerprint, RESULT_STATE_SUCCESS, { 'fingerprintNumber': fingerprintNumber }, -1, ''),
      failure: (e: SNError) => this.sendResult(TTCommands.multifunctionalKeyPadAddFingerprint, false, null, e),
    });
  }

  private multifunctionalKeyPadAddCard(call: MethodCall): void {
    const keypadMac = (call.argument("keypadMac") as string) ?? (call.argument("mac") as string) ?? '';
    const lockData = (call.argument("lockData") as string) ?? '';
    const startDate = (call.argument("startDate") as number) ?? 0;
    const endDate = (call.argument("endDate") as number) ?? 0;
    const rawCyclic = call.argument("cyclicConfig") as Record<string, number>[] | null | undefined;
    let cyclicConfig: ITTLockCyclicConfig[] | null = null;
    if (rawCyclic != null && rawCyclic.length > 0) {
      cyclicConfig = rawCyclic.map((c: Record<string, number>): ITTLockCyclicConfig => {
        const item: ITTLockCyclicConfig = {
          weekDay: c['weekDay'] ?? 1,
          startTime: c['startTime'] ?? 0,
          endTime: c['endTime'] ?? 0,
        };
        return item;
      });
    }
    const progressBack = (): void => {
      this.callbackCommand(
        TTCommands.multifunctionalKeyPadAddCard,
        RESULT_STATE_PROGRESS,
        { 'progress': true },
        -1,
        ''
      );
    };
    TTLock.multifunctionalKeyPadAddCard(
      keypadMac,
      lockData,
      startDate,
      endDate,
      cyclicConfig,
      progressBack,
      {
        success: () => this.sendResult(TTCommands.multifunctionalKeyPadAddCard, true, null),
        failure: (e: SNError) => this.sendResult(TTCommands.multifunctionalKeyPadAddCard, false, null, e),
      }
    );
  }

  private multifunctionalRemoteKeypadInit(call: MethodCall): void {
    const keypadMac = (call.argument("keypadMac") as string) ?? (call.argument("mac") as string) ?? '';
    const lockData = (call.argument("lockData") as string) ?? '';
    TTLock.initializeMultifunctionalKeyPad(keypadMac, lockData, {
      success: () => this.sendResult(TTCommands.multifunctionalRemoteKeypadInit, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.multifunctionalRemoteKeypadInit, false, null, e),
    });
  }

  private doorSensorStartScan(): void {
    TTLock.startScanDoorMagnetic((model) => {
      const data: Record<string, Object> = {
        'mac': model.mac,
        'name': model.name,
        'rssi': model.rssi,
      };
      this.callbackCommand(TTCommands.doorSensorStartScan, RESULT_STATE_SUCCESS, data, -1, '');
    });
  }

  private doorSensorInit(call: MethodCall): void {
    const lockData = (call.argument("lockData") as string) ?? '';
    const doorSensorMac = (call.argument("doorSensorMac") as string) ?? (call.argument("mac") as string) ?? '';
    TTLock.initializeDoorMagnetic(doorSensorMac, lockData, {
      success: () => this.sendResult(TTCommands.doorSensorInit, true, null),
      failure: (e: SNError) => this.sendResult(TTCommands.doorSensorInit, false, null, e),
    });
  }
}
