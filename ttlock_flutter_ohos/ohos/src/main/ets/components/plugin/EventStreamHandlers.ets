import EventChannel, { EventSink, StreamHandler } from '@ohos/flutter_ohos/src/main/ets/plugin/common/EventChannel';
import StandardMethodCodec from '@ohos/flutter_ohos/src/main/ets/plugin/common/StandardMethodCodec';
import { BinaryMessenger } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BinaryMessenger';

import {
  TTLock,
  TTElectricMeter,
  TTWaterMeter,
  TTWiFiDoorMagnetic,
  TTLockScanModel as SdkTTLockScanModel,
  TTGatewayScanModel as SdkTTGatewayScanModel,
  IFaceModel,
  IAddFingerprintProgressModel,
  TTAddState as SdkTTAddState,
  TTKeypadStatus as SdkTTKeypadStatus,
  SNError,
} from '@sciener/ttlock';
import {
  TTKeyboardScanModel,
  TTKeyScanModel,
  TTDoorMagneticScanModel,
  TTWaterMeterScanModel,
  TTElectricMeterScanModel,
} from '@sciener/ttlock/src/main/ets/e/f/g/h';
import {
  ITTLockAddICCardModel,
  ITTLockAddFingerprintModel,
  ITTLockScanWifiModel,
} from '@sciener/ttlock/src/main/ets/e/f/i/i';
import {
  TTGatewayType as SdkTTGatewayType,
} from '@sciener/ttlock/src/main/ets/e/f/l/l';

import HashMap from '@ohos.util.HashMap';

import {
  AddCardEvent,
  AddFaceEvent,
  AddFingerprintEvent,
  TTAddFacePhase,
  PigeonCodec,
  TTGatewayScanModel,
  TTGatewayType,
  TTLockScanModel,
  TTLockSwitchState,
  TTLockVersion,
  TTMeterScanModel,
  TTRemoteAccessoryScanModel,
  TTStandaloneDoorSensorScanModel,
  TTWifiScanEntry,
  TTWifiScanResult,
} from './Messages';

import {
  EventContextStore,
  ValidityRange,
  cycleListToConfig,
  CycleConfigEntry,
} from './TtlockPremiseSupport';

import {
  faceErrorRevert,
  facePhaseRevert,
  gatewayErrorRevert,
  keypadErrorRevert,
  lockErrorRevert,
  multifunctionalKeypadErrorRevert,
  lockSwitchStateRevert,
} from './EnumConverter';

const STREAM_PREFIX = 'dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.';

const NO_LOCK_DATA = 'NO_LOCK_DATA';
const NO_GATEWAY = 'NO_GATEWAY';
const NO_KEYPAD = 'NO_KEYPAD';

interface LockVersionLike {
  protocolType?: number;
  protocolVersion?: number;
  scene?: number;
  groupId?: number;
  orgId?: number;
}

function pigeonMethodCodec(): StandardMethodCodec {
  return new StandardMethodCodec(PigeonCodec.INSTANCE);
}

/**
 * 引擎 detach 时，每条 EventChannel 需要清空已注册的 StreamHandler。
 * `setStreamHandler(null)` 在 ArkTS 严格模式下不便表达，
 * 改注册一个空实现的单例即可。
 */
class NoopStreamHandler implements StreamHandler {
  static shared: NoopStreamHandler = new NoopStreamHandler();

  onListen(_args: Object, _events: EventSink): void {
  }

  onCancel(_args: Object): void {
  }
}

function gatewayTypeRevert(t: SdkTTGatewayType): TTGatewayType {
  switch (t) {
    case SdkTTGatewayType.g2:
      return TTGatewayType.G2;
    case SdkTTGatewayType.g3:
      return TTGatewayType.G3;
    case SdkTTGatewayType.g4:
      return TTGatewayType.G4;
    case SdkTTGatewayType.g5:
      return TTGatewayType.G5;
    case SdkTTGatewayType.g6:
      return TTGatewayType.G6;
    default:
      return TTGatewayType.G2;
  }
}

function nowMillis(): number {
  return Date.now();
}

function pigeonLockVersion(value: string | null | undefined): TTLockVersion {
  if (value === null || value === undefined || value.length === 0) {
    return new TTLockVersion(0, 0, 0, 0, 0);
  }
  try {
    const obj = JSON.parse(value) as LockVersionLike;
    return new TTLockVersion(
      obj.protocolType ?? 0,
      obj.protocolVersion ?? 0,
      obj.scene ?? 0,
      obj.groupId ?? 0,
      obj.orgId ?? 0,
    );
  } catch (_e) {
    return new TTLockVersion(0, 0, 0, 0, 0);
  }
}

function readScanWifiEntry(item: Map<string, Object>): TTWifiScanEntry {
  const ssidVal = item.get('SSID') ?? item.get('ssid');
  const rssiVal = item.get('RSSI') ?? item.get('rssi');
  let ssid: string | undefined = undefined;
  if (typeof ssidVal === 'string') {
    ssid = ssidVal as string;
  } else if (ssidVal !== undefined && ssidVal !== null) {
    ssid = `${ssidVal}`;
  }
  let rssi: number = 0;
  if (typeof rssiVal === 'number') {
    rssi = rssiVal as number;
  } else if (typeof rssiVal === 'string') {
    const n = Number(rssiVal);
    rssi = Number.isNaN(n) ? 0 : n;
  }
  return new TTWifiScanEntry(undefined, rssi, undefined, ssid, ssid, ssid);
}

function buildLockScanWifiResult(model: ITTLockScanWifiModel): TTWifiScanResult {
  const entries: Array<TTWifiScanEntry> = [];
  for (const item of model.wifiList) {
    entries.push(readScanWifiEntry(item));
  }
  return new TTWifiScanResult(entries);
}

function buildGatewayWifiScanResult(map: HashMap<string, Object>): TTWifiScanResult {
  const entries: Array<TTWifiScanEntry> = [];
  const list = map.get('wifiList');
  if (Array.isArray(list)) {
    for (const item of list as Object[]) {
      if (item instanceof Map) {
        entries.push(readScanWifiEntry(item as Map<string, Object>));
      }
    }
  }
  return new TTWifiScanResult(entries);
}

function emitLockError(events: EventSink, op: string, err: SNError): void {
  const code = lockErrorRevert(err.code);
  events.error(`${code}`, err.msg.length > 0 ? err.msg : `${op} failed`, null);
}

function emitGatewayError(events: EventSink, op: string, err: SNError): void {
  const code = gatewayErrorRevert(err.code);
  events.error(`${code}`, err.msg.length > 0 ? err.msg : `${op} failed`, null);
}

function emitKeypadStatusFromSdk(events: EventSink, status: SdkTTKeypadStatus, isMulti: boolean): void {
  const code = isMulti
    ? multifunctionalKeypadErrorRevert(status as number)
    : keypadErrorRevert(status as number);
  events.error(`${code}`, isMulti ? 'multifunctional keypad failure' : 'keypad failure', null);
}

class LockScanLockHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    TTLock.startScanLock((m: SdkTTLockScanModel): void => {
      const switchState: TTLockSwitchState = lockSwitchStateRevert(m.lockSwitchState);
      const out = new TTLockScanModel(
        m.name,
        m.mac,
        m.isInited,
        m.isAllowUnlock,
        m.electricQuantity,
        pigeonLockVersion(m.lockVersion),
        switchState,
        m.rssi,
        m.oneMeterRssi,
        m.timestamp,
      );
      events.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScan();
  }
}

class LockScanWifiHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    const lockData: string | null = EventContextStore.shared.lockScanWifi.lockData;
    if (lockData === null || lockData.length === 0) {
      events.error(NO_LOCK_DATA,
        '请先通过 setLockScanWifiParam 设置 lockData 后再使用 lockScanWifi', null);
      return;
    }
    TTLock.lockScanNearbyWifi(lockData, {
      success: (model: ITTLockScanWifiModel): void => {
        events.success(buildLockScanWifiResult(model));
      },
      failure: (err: SNError): void => {
        emitLockError(events, 'lockScanWifi', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class LockAddCardHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    const slot = EventContextStore.shared.lockAddCard;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      events.error(NO_LOCK_DATA,
        '请先通过 setLockAddCardParam 设置参数后再使用 lockAddCard', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    TTLock.addICCard(lockData, range.start, range.end, cyclic, {
      success: (model: ITTLockAddICCardModel): void => {
        if (model.status === 1) {
          events.success(new AddCardEvent(true, undefined));
        } else {
          events.success(new AddCardEvent(false, model.cardNumber));
        }
      },
      failure: (err: SNError): void => {
        emitLockError(events, 'lockAddCard', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class LockAddFingerprintHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    const slot = EventContextStore.shared.lockAddFingerprint;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      events.error(NO_LOCK_DATA,
        '请先通过 setLockAddFingerprintParam 设置参数后再使用 lockAddFingerprint', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    TTLock.addFingerprint(lockData, range.start, range.end, cyclic, {
      success: (model: ITTLockAddFingerprintModel): void => {
        if (model.success) {
          events.success(new AddFingerprintEvent(false, undefined, undefined, model.fingerprintNumber));
        } else {
          events.success(new AddFingerprintEvent(true, model.currentCount, model.totalCount, undefined));
        }
      },
      failure: (err: SNError): void => {
        emitLockError(events, 'lockAddFingerprint', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class LockAddFaceHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    const slot = EventContextStore.shared.lockAddFace;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      events.error(NO_LOCK_DATA,
        '请先通过 setLockAddFaceParam 设置参数后再使用 lockAddFace', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    TTLock.addFace(lockData, range.start, range.end, cyclic, {
      success: (model: IFaceModel): void => {
        if (model.addState === SdkTTAddState.success) {
          events.success(new AddFaceEvent(TTAddFacePhase.SUCCESS, undefined, model.faceNumber));
        } else {
          events.success(new AddFaceEvent(
            facePhaseRevert(model.addState),
            faceErrorRevert(model.errorCode),
            undefined,
          ));
        }
      },
      failure: (err: SNError): void => {
        emitLockError(events, 'lockAddFace', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class LockAddPalmVeinHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    events.error(
      'NOT_IMPLEMENTED',
      'lockAddPalmVein is not implemented on OpenHarmony',
      null,
    );
  }

  onCancel(_args: Object): void {
  }
}

class GatewayStartScanHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    TTLock.startScanGateway((m: SdkTTGatewayScanModel): void => {
      const isDfuMode: boolean = m.isNordicDfuMode || m.isTeLinkDfuMode;
      const out = new TTGatewayScanModel(m.name, m.mac, m.rssi, isDfuMode, gatewayTypeRevert(m.type));
      events.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScanGateway();
  }
}

class GatewayGetNearbyWifiHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    const mac: string | null = EventContextStore.shared.gatewayGetNearbyWifi.gatewayMac;
    if (mac === null || mac.length === 0) {
      events.error(NO_GATEWAY,
        '请先通过 setGatewayGetNearbyWifiParam 设置网关 MAC 后再使用 gatewayGetNearbyWifi', null);
      return;
    }
    TTLock.scanWiFiByGateway({
      success: (info: HashMap<String, Object>): void => {
        events.success(buildGatewayWifiScanResult(info as HashMap<String, Object> as HashMap<string, Object>));
      },
      failure: (err: SNError): void => {
        emitGatewayError(events, 'gatewayGetNearbyWifi', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class AccessoryStartScanRemoteKeyHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    TTLock.startScanWirelessKey((m: TTKeyScanModel): void => {
      const out = new TTRemoteAccessoryScanModel(m.name, m.mac, m.rssi, nowMillis(), false,
        new Map<string, Object>());
      events.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScan();
  }
}

class AccessoryStartScanRemoteKeypadHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    TTLock.startScanWirelessKeyboard((m: TTKeyboardScanModel): void => {
      const out = new TTRemoteAccessoryScanModel(m.name, m.mac, m.rssi, nowMillis(),
        m.isMultifunctionalKeypad, new Map<string, Object>());
      events.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScan();
  }
}

class AccessoryAddKeypadFingerprintHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    const slot = EventContextStore.shared.accessoryAddKeypadFingerprint;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      events.error(NO_LOCK_DATA, '请先通过 setAccessoryAddKeypadFingerprintParam 设置 lockData', null);
      return;
    }
    const keypadMac: string | null = slot.keypadMac;
    if (keypadMac === null || keypadMac.length === 0) {
      events.error(NO_KEYPAD, '请先通过 setAccessoryAddKeypadFingerprintParam 设置 keypadMac', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    const isMulti: boolean = slot.isMultifunctionalKeypad;
    TTLock.multifunctionalKeyPadAddFingerprint(
      keypadMac,
      lockData,
      range.start,
      range.end,
      cyclic,
      (progress: IAddFingerprintProgressModel): void => {
        events.success(new AddFingerprintEvent(true, progress.currentCount,
          progress.totalCount, undefined));
      },
      (status: SdkTTKeypadStatus): void => {
        emitKeypadStatusFromSdk(events, status, isMulti);
      },
      {
        success: (fingerprintNumber: string): void => {
          events.success(new AddFingerprintEvent(false, undefined, undefined, fingerprintNumber));
        },
        failure: (err: SNError): void => {
          emitLockError(events, 'accessoryAddKeypadFingerprint', err);
        },
      },
    );
  }

  onCancel(_args: Object): void {
  }
}

class AccessoryAddKeypadCardHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    const slot = EventContextStore.shared.accessoryAddKeypadCard;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      events.error(NO_LOCK_DATA, '请先通过 setAccessoryAddKeypadCardParam 设置 lockData', null);
      return;
    }
    const keypadMac: string | null = slot.keypadMac;
    if (keypadMac === null || keypadMac.length === 0) {
      events.error(NO_KEYPAD, '请先通过 setAccessoryAddKeypadCardParam 设置 keypadMac', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    TTLock.multifunctionalKeyPadAddCard(
      keypadMac,
      lockData,
      range.start,
      range.end,
      cyclic,
      (_progress: void): void => {
        events.success(new AddCardEvent(true, undefined));
      },
      {
        success: (cardNumber: string): void => {
          events.success(new AddCardEvent(false, cardNumber));
        },
        failure: (err: SNError): void => {
          emitLockError(events, 'accessoryAddKeypadCard', err);
        },
      },
    );
  }

  onCancel(_args: Object): void {
  }
}

class AccessoryStartScanDoorSensorHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    TTLock.startScanDoorMagnetic((m: TTDoorMagneticScanModel): void => {
      const out = new TTRemoteAccessoryScanModel(m.name, m.mac, m.rssi, nowMillis(), false,
        new Map<string, Object>());
      events.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScan();
  }
}

class AccessoryStandaloneDoorSensorStartScanHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    TTWiFiDoorMagnetic.startScanWiFiDoorMagnetic((m: TTDoorMagneticScanModel): void => {
      const out = new TTStandaloneDoorSensorScanModel(m.name, m.mac, m.rssi, nowMillis());
      events.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTWiFiDoorMagnetic.stopScan();
  }
}

class AccessoryWaterMeterStartScanHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    TTWaterMeter.startScanWaterMeter((m: TTWaterMeterScanModel): void => {
      const out = new TTMeterScanModel(m.name, m.mac, m.rssi);
      events.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTWaterMeter.stopScan();
  }
}

class AccessoryElectricMeterStartScanHandler implements StreamHandler {
  onListen(_args: Object, events: EventSink): void {
    TTElectricMeter.startScanElectricMeter((m: TTElectricMeterScanModel): void => {
      const out = new TTMeterScanModel(m.name, m.mac, m.rssi);
      events.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTElectricMeter.stopScan();
  }
}

interface ChannelEntry {
  method: string;
  handler: StreamHandler;
}

/**
 * 在 plugin 启动时统一注册 14 条 EventChannel（与 iOS / Android `Messages.kt`
 * 一致），所有 channel 名称的格式为
 * `dev.flutter.pigeon.ttlock_flutter.TTEventChannelApi.<methodName>`。
 *
 * 调用 {@link dispose} 会反注册全部流，避免内存泄漏。
 */
export class EventStreamHandlers {
  private messenger: BinaryMessenger;
  private channels: Array<EventChannel> = [];

  constructor(messenger: BinaryMessenger) {
    this.messenger = messenger;
  }

  register(): void {
    const entries: ChannelEntry[] = [
      { method: 'lockScanLock', handler: new LockScanLockHandler() },
      { method: 'lockScanWifi', handler: new LockScanWifiHandler() },
      { method: 'lockAddCard', handler: new LockAddCardHandler() },
      { method: 'lockAddFingerprint', handler: new LockAddFingerprintHandler() },
      { method: 'lockAddFace', handler: new LockAddFaceHandler() },
      { method: 'lockAddPalmVein', handler: new LockAddPalmVeinHandler() },
      { method: 'gatewayStartScan', handler: new GatewayStartScanHandler() },
      { method: 'gatewayGetNearbyWifi', handler: new GatewayGetNearbyWifiHandler() },
      { method: 'accessoryStartScanRemoteKey', handler: new AccessoryStartScanRemoteKeyHandler() },
      { method: 'accessoryStartScanRemoteKeypad', handler: new AccessoryStartScanRemoteKeypadHandler() },
      { method: 'accessoryAddKeypadFingerprint', handler: new AccessoryAddKeypadFingerprintHandler() },
      { method: 'accessoryAddKeypadCard', handler: new AccessoryAddKeypadCardHandler() },
      { method: 'accessoryStartScanDoorSensor', handler: new AccessoryStartScanDoorSensorHandler() },
      {
        method: 'accessoryStandaloneDoorSensorStartScan',
        handler: new AccessoryStandaloneDoorSensorStartScanHandler(),
      },
      { method: 'accessoryWaterMeterStartScan', handler: new AccessoryWaterMeterStartScanHandler() },
      { method: 'accessoryElectricMeterStartScan', handler: new AccessoryElectricMeterStartScanHandler() },
    ];
    const codec = pigeonMethodCodec();
    for (const entry of entries) {
      const channel = new EventChannel(this.messenger, `${STREAM_PREFIX}${entry.method}`, codec);
      channel.setStreamHandler(entry.handler);
      this.channels.push(channel);
    }
  }

  dispose(): void {
    for (const channel of this.channels) {
      channel.setStreamHandler(NoopStreamHandler.shared);
    }
    this.channels = [];
  }
}
