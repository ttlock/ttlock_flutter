import { BinaryMessenger } from '@ohos/flutter_ohos/src/main/ets/plugin/common/BinaryMessenger';

import {
  TTLock,
  TTElectricMeter,
  TTWaterMeter,
  TTWiFiDoorMagnetic,
  TTLockScanModel as SdkTTLockScanModel,
  IFaceModel,
  IPalmVeinModel,
  IAddFingerprintProgressModel,
  TTAddState as SdkTTAddState,
  TTKeypadStatus as SdkTTKeypadStatus,
  SNError,
} from '@sciener/ttlock';

import HashMap from '@ohos.util.HashMap';

import {
  AccessoryAddKeypadCardStreamHandler,
  AccessoryAddKeypadFingerprintStreamHandler,
  AccessoryElectricMeterStartScanStreamHandler,
  AccessoryStandaloneDoorSensorStartScanStreamHandler,
  AccessoryStartScanDoorSensorStreamHandler,
  AccessoryStartScanRemoteKeyStreamHandler,
  AccessoryStartScanRemoteKeypadStreamHandler,
  AccessoryWaterMeterStartScanStreamHandler,
  AddCardEvent,
  AddFaceEvent,
  AddFingerprintEvent,
  AddPalmVeinEvent,
  GatewayGetNearbyWifiStreamHandler,
  GatewayStartScanStreamHandler,
  LockAddCardStreamHandler,
  LockAddFaceStreamHandler,
  LockAddFingerprintStreamHandler,
  LockAddPalmVeinStreamHandler,
  LockScanLockStreamHandler,
  LockScanWifiStreamHandler,
  PigeonEventSink,
  TTAddCardPhase,
  TTAddFacePhase,
  TTAddFingerprintPhase,
  TTAddPalmVeinPhase,
  TTGatewayScanModel,
  TTLockScanModel,
  TTLockSwitchState,
  TTMeterScanModel,
  TTRemoteAccessoryScanModel,
  TTStandaloneDoorSensorScanModel,
  TTUpgradeEvent,
  TTWifiScanEntry,
  TTWifiScanResult,
  TTLockError,
  TTGatewayError,
  TTMultifunctionalKeypadError,
  UpgradeElectricMeterByPackageStreamHandler,
  UpgradeElectricMeterStreamHandler,
  UpgradeGatewayByPackageStreamHandler,
  UpgradeGatewayStreamHandler,
  UpgradeKeypadByPackageStreamHandler,
  UpgradeKeypadStreamHandler,
  UpgradeLockStreamHandler,
  UpgradeWaterMeterByPackageStreamHandler,
  UpgradeWaterMeterStreamHandler,
} from './Messages';

import {
  EventContextStore,
  ValidityRange,
  cycleListToConfig,
  CycleConfigEntry,
  emitGatewaySinkError,
  emitKeypadSinkError,
  emitLockSinkError,
  lockVersionFromJsonString,
  makeNotImplementedError,
} from './TtlockPremiseSupport';

import {
  faceErrorRevert,
  facePhaseRevert,
  gatewayTypeRevert,
  lockSwitchStateRevert,
  palmVeinErrorRevert,
} from './EnumConverter';
import {
  ITTLockAddFingerprintModel,
  ITTLockAddICCardModel, ITTLockScanWifiModel } from '@sciener/ttlock/src/main/ets/TTLock/d/g/g';
import {
  TTDoorMagneticScanModel,
  TTElectricMeterScanModel,
  TTKeyboardScanModel, TTKeyScanModel,
  TTGatewayScanModel as SdkTTGatewayScanModel,
  TTWaterMeterScanModel } from '@sciener/ttlock/src/main/ets/TTLock/d/e/f';

const NO_LOCK_DATA = `${TTLockError.INVALID_PARAMETER}`;
const NO_GATEWAY_MAC = `${TTGatewayError.INVALID_PARAMETER}`;
const NO_KEYPAD = `${TTMultifunctionalKeypadError.INVALID_PARAMETER}`;

/**
 * 升级流空实现：立即 error + endOfStream。
 * EventChannel 的 message 走 FlutterError.name（`notImplemented`），
 * 与 Host throw + wrapError 形态对齐，供 Dart `mapUpgradeStreamErrors` 识别。
 */
function emitUpgradeNotImplemented(sink: PigeonEventSink<TTUpgradeEvent>, operation: string): void {
  const err = makeNotImplementedError(operation);
  sink.error(err.code, err.name, err.message);
  sink.endOfStream();
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
  const wifiList: Array<Map<string, Object>> = model.wifiList;
  for (let i = 0; i < wifiList.length; i++) {
    entries.push(readScanWifiEntry(wifiList[i]));
  }
  return new TTWifiScanResult(entries);
}

/**
 * 鸿蒙 TTLock.scanWiFiByGateway 每次 success 回调返回单条 WiFi：
 * Map { 'SSID' => string, 'RSSI' => number, 'status' => boolean }
 * status === true 表示扫描结束（通常无 SSID/RSSI）。
 */
function buildGatewayWifiScanResult(map: HashMap<string, Object>): TTWifiScanResult {
  const entries: Array<TTWifiScanEntry> = [];
  const ssidVal = map.get('SSID') ?? map.get('ssid');
  if (ssidVal === undefined || ssidVal === null) {
    return new TTWifiScanResult(entries);
  }
  // HashMap / ES Map 均有 get；统一拷到 Map 再复用 readScanWifiEntry
  const item = new Map<string, Object>();
  item.set('SSID', ssidVal);
  const rssiVal = map.get('RSSI') ?? map.get('rssi');
  if (rssiVal !== undefined && rssiVal !== null) {
    item.set('RSSI', rssiVal);
  }
  entries.push(readScanWifiEntry(item));
  return new TTWifiScanResult(entries);
}

function doorMagneticToRemoteAccessoryScanModel(
  model: TTDoorMagneticScanModel,
  isMultifunctionalKeypad: boolean,
): TTRemoteAccessoryScanModel {
  return new TTRemoteAccessoryScanModel(
    model.name,
    model.mac,
    model.rssi,
    isMultifunctionalKeypad,
    new Map<string, Object>(),
    model.deviceId,
    model.timestamp,
  );
}

function doorMagneticToStandaloneDoorSensorScanModel(
  model: TTDoorMagneticScanModel,
): TTStandaloneDoorSensorScanModel {
  return new TTStandaloneDoorSensorScanModel(
    model.name,
    model.mac,
    model.rssi,
    model.timestamp,
  );
}

function keyToRemoteAccessoryScanModel(
  model: TTKeyScanModel,
  isMultifunctionalKeypad: boolean,
): TTRemoteAccessoryScanModel {
  return new TTRemoteAccessoryScanModel(
    model.name,
    model.mac,
    model.rssi,
    isMultifunctionalKeypad,
    new Map<string, Object>(),
    model.deviceId,
    model.timestamp,
  );
}

function keyboardToRemoteAccessoryScanModel(
  model: TTKeyboardScanModel,
  isMultifunctionalKeypad: boolean,
): TTRemoteAccessoryScanModel {
  return new TTRemoteAccessoryScanModel(
    model.name,
    model.mac,
    model.rssi,
    isMultifunctionalKeypad,
    new Map<string, Object>(),
    model.deviceId,
    model.timestamp,
  );
}

/** OHOS SDK 水电表扫描模型无 type/scanTime，分别对应 version/timestamp。 */
function waterMeterToMeterScanModel(model: TTWaterMeterScanModel): TTMeterScanModel {
  return new TTMeterScanModel(
    model.name,
    model.mac,
    model.rssi,
    model.isInited,
    model.version,
    model.timestamp,
  );
}

function electricMeterToMeterScanModel(model: TTElectricMeterScanModel): TTMeterScanModel {
  return new TTMeterScanModel(
    model.name,
    model.mac,
    model.rssi,
    model.isInited,
    model.version,
    model.timestamp,
  );
}

interface DisposableStreamHandler {
  onCancel(args: Object): void;
}

class ScanLockImpl extends LockScanLockStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    LockScanLockStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTLockScanModel>): void {
    TTLock.startScanLock((m: SdkTTLockScanModel): void => {
      const switchState: TTLockSwitchState =
        lockSwitchStateRevert(m.lockSwitchState) ?? TTLockSwitchState.UNKNOW;
      const out = new TTLockScanModel(
        m.name,
        m.mac,
        m.isInited,
        m.isAllowUnlock,
        m.electricQuantity,
        lockVersionFromJsonString(m.lockVersion),
        switchState,
        m.rssi,
        m.oneMeterRssi,
        m.timestamp,
      );
      sink.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScan();
  }
}

class ScanLockWifiImpl extends LockScanWifiStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    LockScanWifiStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTWifiScanResult>): void {
    const lockData: string | null = EventContextStore.shared.lockScanWifi.lockData;
    if (lockData === null || lockData.length === 0) {
      sink.error(NO_LOCK_DATA,
        '请先通过 setLockScanWifiParam 设置 lockData 后再使用 lockScanWifi', null);
      return;
    }
    TTLock.lockScanNearbyWifi(lockData, {
      success: (model: ITTLockScanWifiModel): void => {
        sink.success(buildLockScanWifiResult(model));
        if (model.isFinished) {
          sink.endOfStream();
        }
      },
      failure: (err: SNError): void => {
        emitLockSinkError(sink, 'lockScanWifi', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class AddLockCardImpl extends LockAddCardStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    LockAddCardStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<AddCardEvent>): void {
    const slot = EventContextStore.shared.lockAddCard;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      sink.error(NO_LOCK_DATA,
        '请先通过 setLockAddCardParam 设置参数后再使用 lockAddCard', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    TTLock.addICCard(lockData, range.start, range.end, cyclic, {
      success: (model: ITTLockAddICCardModel): void => {
        if (model.status === 1) {
          sink.success(new AddCardEvent(TTAddCardPhase.SUCCESS, model.cardNumber));

        } else if (model.status == 2) {
          sink.success(new AddCardEvent(TTAddCardPhase.WAITING, undefined));
        }
      },
      failure: (err: SNError): void => {
        emitLockSinkError(sink, 'lockAddCard', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class AddLockFingerprintImpl extends LockAddFingerprintStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    LockAddFingerprintStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<AddFingerprintEvent>): void {
    const slot = EventContextStore.shared.lockAddFingerprint;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      sink.error(NO_LOCK_DATA,
        '请先通过 setLockAddFingerprintParam 设置参数后再使用 lockAddFingerprint', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    TTLock.addFingerprint(lockData, range.start, range.end, cyclic, {
      success: (model: ITTLockAddFingerprintModel): void => {
        if (model.success) {
          sink.success(new AddFingerprintEvent(TTAddFingerprintPhase.SUCCESS, undefined, undefined,
            model.fingerprintNumber));
        } else {
          sink.success(new AddFingerprintEvent(TTAddFingerprintPhase.COLLECTING,
            model.currentCount,
            model.totalCount,
            undefined));
        }
      },
      failure: (err: SNError): void => {
        emitLockSinkError(sink, 'lockAddFingerprint', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class AddLockFaceImpl extends LockAddFaceStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    LockAddFaceStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<AddFaceEvent>): void {
    const slot = EventContextStore.shared.lockAddFace;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      sink.error(NO_LOCK_DATA,
        '请先通过 setLockAddFaceParam 设置参数后再使用 lockAddFace', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    TTLock.addFace(lockData, range.start, range.end, cyclic, {
      success: (model: IFaceModel): void => {
        if (model.addState === SdkTTAddState.success) {
          sink.success(new AddFaceEvent(TTAddFacePhase.SUCCESS, undefined, model.faceNumber));
        } else {
          sink.success(new AddFaceEvent(
            facePhaseRevert(model.addState),
            faceErrorRevert(model.errorCode),
            undefined,
          ));
        }
      },
      failure: (err: SNError): void => {
        emitLockSinkError(sink, 'lockAddFace', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class AddLockPalmVeinImpl extends LockAddPalmVeinStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    LockAddPalmVeinStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<AddPalmVeinEvent>): void {
    const slot = EventContextStore.shared.lockAddPalmVein;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      sink.error(NO_LOCK_DATA,
        '请先通过 setLockAddPalmVeinParam 设置参数后再使用 lockAddPalmVein', null);
      return;
    }
    const range: ValidityRange = slot.toValidityRange();
    const cyclic: CycleConfigEntry[] | null = cycleListToConfig(range.cyclic);
    TTLock.addPalmVein(lockData, range.start, range.end, cyclic, {
      success: (model: IPalmVeinModel): void => {
        if (model.addState === SdkTTAddState.success) {
          sink.success(new AddPalmVeinEvent(TTAddPalmVeinPhase.SUCCESS, undefined, model.palmVeinNumber));
        } else if (model.addState === SdkTTAddState.canStartAdd) {
          sink.success(new AddPalmVeinEvent(TTAddPalmVeinPhase.CAN_START_ADD, undefined, undefined));
        } else {
          sink.success(new AddPalmVeinEvent(
            TTAddPalmVeinPhase.ERROR,
            palmVeinErrorRevert(model.errorCode),
            undefined,
          ));
        }
      },
      failure: (err: SNError): void => {
        emitLockSinkError(sink, 'lockAddPalmVein', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class GatewayStartScanImpl extends GatewayStartScanStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    GatewayStartScanStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTGatewayScanModel>): void {
    TTLock.startScanGateway((m: SdkTTGatewayScanModel): void => {
      const isDfuMode: boolean = m.isNordicDfuMode || m.isTeLinkDfuMode;
      const out = new TTGatewayScanModel(m.name, m.mac, m.rssi, isDfuMode, gatewayTypeRevert(m.type));
      sink.success(out);
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScanGateway();
  }
}

class GatewayGetNearbyWifiImpl extends GatewayGetNearbyWifiStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    GatewayGetNearbyWifiStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTWifiScanResult>): void {
    const mac: string | null = EventContextStore.shared.gatewayGetNearbyWifi.gatewayMac;
    if (mac === null || mac.length === 0) {
      sink.error(
        NO_GATEWAY_MAC,
        'noGatewayMac',
        '请先通过 setGatewayGetNearbyWifiParam 设置网关 MAC 后再使用 gatewayGetNearbyWifi',
      );
      return;
    }
    TTLock.scanWiFiByGateway({
      success: (info: HashMap<String, Object>): void => {
        const map = info as HashMap<String, Object> as HashMap<string, Object>;
        // 原生 SDK 用 status 标记结束（见 TTGateway 0x01 / gatewayScanWifi）
        const statusRaw = map.get('status');
        const finished: boolean = statusRaw === true || statusRaw === 1;
        if (finished) {
          sink.endOfStream();
          return;
        }
        sink.success(buildGatewayWifiScanResult(map));
      },
      failure: (err: SNError): void => {
        emitGatewaySinkError(sink, 'gatewayGetNearbyWifi', err);
      },
    });
  }

  onCancel(_args: Object): void {
  }
}

class AccessoryStartScanRemoteKeyImpl extends AccessoryStartScanRemoteKeyStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    AccessoryStartScanRemoteKeyStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTRemoteAccessoryScanModel>): void {
    TTLock.startScanWirelessKey((m: TTKeyScanModel): void => {
      sink.success(keyToRemoteAccessoryScanModel(m, false));
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScan();
  }
}

class AccessoryStartScanRemoteKeypadImpl extends AccessoryStartScanRemoteKeypadStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    AccessoryStartScanRemoteKeypadStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTRemoteAccessoryScanModel>): void {
    TTLock.startScanWirelessKeyboard((m: TTKeyboardScanModel): void => {
      sink.success(keyboardToRemoteAccessoryScanModel(m, m.isMultifunctionalKeypad));
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScan();
  }
}

class AccessoryAddKeypadFingerprintImpl extends AccessoryAddKeypadFingerprintStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    AccessoryAddKeypadFingerprintStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<AddFingerprintEvent>): void {
    const slot = EventContextStore.shared.accessoryAddKeypadFingerprint;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      sink.error(NO_LOCK_DATA, '请先通过 setAccessoryAddKeypadFingerprintParam 设置 lockData', null);
      return;
    }
    const keypadMac: string | null = slot.keypadMac;
    if (keypadMac === null || keypadMac.length === 0) {
      sink.error(NO_KEYPAD, '请先通过 setAccessoryAddKeypadFingerprintParam 设置 keypadMac', null);
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
        sink.success(new AddFingerprintEvent(TTAddFingerprintPhase.COLLECTING, progress.currentCount,
          progress.totalCount, undefined));
      },
      (status: SdkTTKeypadStatus): void => {
        emitKeypadSinkError(sink, status as number, isMulti);
      },
      {
        success: (fingerprintNumber: string): void => {
          sink.success(new AddFingerprintEvent(TTAddFingerprintPhase.SUCCESS, undefined, undefined,
            fingerprintNumber));
        },
        failure: (err: SNError): void => {
          emitLockSinkError(sink, 'accessoryAddKeypadFingerprint', err);
        },
      },
    );
  }

  onCancel(_args: Object): void {
  }
}

class AccessoryAddKeypadCardImpl extends AccessoryAddKeypadCardStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    AccessoryAddKeypadCardStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<AddCardEvent>): void {
    const slot = EventContextStore.shared.accessoryAddKeypadCard;
    const lockData: string | null = slot.lockData;
    if (lockData === null || lockData.length === 0) {
      sink.error(NO_LOCK_DATA, '请先通过 setAccessoryAddKeypadCardParam 设置 lockData', null);
      return;
    }
    const keypadMac: string | null = slot.keypadMac;
    if (keypadMac === null || keypadMac.length === 0) {
      sink.error(NO_KEYPAD, '请先通过 setAccessoryAddKeypadCardParam 设置 keypadMac', null);
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
        sink.success(new AddCardEvent(TTAddCardPhase.WAITING, undefined));
      },
      {
        success: (cardNumber: string): void => {
          sink.success(new AddCardEvent(TTAddCardPhase.SUCCESS, cardNumber));
        },
        failure: (err: SNError): void => {
          emitLockSinkError(sink, 'accessoryAddKeypadCard', err);
        },
      },
    );
  }

  onCancel(_args: Object): void {
  }
}

class AccessoryStartScanDoorSensorImpl extends AccessoryStartScanDoorSensorStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    AccessoryStartScanDoorSensorStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTRemoteAccessoryScanModel>): void {
    TTLock.startScanDoorMagnetic((m: TTDoorMagneticScanModel): void => {
      sink.success(doorMagneticToRemoteAccessoryScanModel(m, false));
    });
  }

  onCancel(_args: Object): void {
    TTLock.stopScan();
  }
}

class AccessoryStandaloneDoorSensorStartScanImpl extends AccessoryStandaloneDoorSensorStartScanStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    AccessoryStandaloneDoorSensorStartScanStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTStandaloneDoorSensorScanModel>): void {
    TTWiFiDoorMagnetic.startScanWiFiDoorMagnetic((m: TTDoorMagneticScanModel): void => {
      sink.success(doorMagneticToStandaloneDoorSensorScanModel(m));
    });
  }

  onCancel(_args: Object): void {
    TTWiFiDoorMagnetic.stopScan();
  }
}

class AccessoryWaterMeterStartScanImpl extends AccessoryWaterMeterStartScanStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    AccessoryWaterMeterStartScanStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTMeterScanModel>): void {
    TTWaterMeter.startScanWaterMeter((m: TTWaterMeterScanModel): void => {
      sink.success(waterMeterToMeterScanModel(m));
    });
  }

  onCancel(_args: Object): void {
    TTWaterMeter.stopScan();
  }
}

class AccessoryElectricMeterStartScanImpl extends AccessoryElectricMeterStartScanStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    AccessoryElectricMeterStartScanStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTMeterScanModel>): void {
    TTElectricMeter.startScanElectricMeter((m: TTElectricMeterScanModel): void => {
      sink.success(electricMeterToMeterScanModel(m));
    });
  }

  onCancel(_args: Object): void {
    TTElectricMeter.stopScan();
  }
}

class UpgradeLockImpl extends UpgradeLockStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeLockStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeLock');
  }

  onCancel(_args: Object): void {
  }
}

class UpgradeGatewayImpl extends UpgradeGatewayStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeGatewayStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeGateway');
  }

  onCancel(_args: Object): void {
  }
}

class UpgradeGatewayByPackageImpl extends UpgradeGatewayByPackageStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeGatewayByPackageStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeGatewayByPackage');
  }

  onCancel(_args: Object): void {
  }
}

class UpgradeWaterMeterImpl extends UpgradeWaterMeterStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeWaterMeterStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeWaterMeter');
  }

  onCancel(_args: Object): void {
  }
}

class UpgradeWaterMeterByPackageImpl extends UpgradeWaterMeterByPackageStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeWaterMeterByPackageStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeWaterMeterByPackage');
  }

  onCancel(_args: Object): void {
  }
}

class UpgradeElectricMeterImpl extends UpgradeElectricMeterStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeElectricMeterStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeElectricMeter');
  }

  onCancel(_args: Object): void {
  }
}

class UpgradeElectricMeterByPackageImpl extends UpgradeElectricMeterByPackageStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeElectricMeterByPackageStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeElectricMeterByPackage');
  }

  onCancel(_args: Object): void {
  }
}

class UpgradeKeypadImpl extends UpgradeKeypadStreamHandler implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeKeypadStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeKeypad');
  }

  onCancel(_args: Object): void {
  }
}

class UpgradeKeypadByPackageImpl extends UpgradeKeypadByPackageStreamHandler
  implements DisposableStreamHandler {
  constructor(messenger: BinaryMessenger) {
    super();
    UpgradeKeypadByPackageStreamHandler.register(messenger, this);
  }

  onListen(_args: Object, sink: PigeonEventSink<TTUpgradeEvent>): void {
    emitUpgradeNotImplemented(sink, 'upgradeKeypadByPackage');
  }

  onCancel(_args: Object): void {
  }
}

const STREAM_CANCEL_ARGS: Object = new Object();

/**
 * 在 plugin 启动时实例化 25 条 Pigeon EventChannel 实现类；
 * 各实现类在构造时通过 `*StreamHandler.register` 完成注册，
 * 与 Android `StreamHandlers.kt` 模式一致。升级 9 路为空实现。
 */
export class EventStreamHandlers {
  private handlers: Array<DisposableStreamHandler> = [];
  private messenger: BinaryMessenger;

  constructor(messenger: BinaryMessenger) {
    this.messenger = messenger;
  }

  register(): void {
    const messenger = this.messenger;
    this.handlers = [
      new ScanLockImpl(messenger),
      new ScanLockWifiImpl(messenger),
      new AddLockCardImpl(messenger),
      new AddLockFingerprintImpl(messenger),
      new AddLockFaceImpl(messenger),
      new AddLockPalmVeinImpl(messenger),
      new GatewayStartScanImpl(messenger),
      new GatewayGetNearbyWifiImpl(messenger),
      new AccessoryStartScanRemoteKeyImpl(messenger),
      new AccessoryStartScanRemoteKeypadImpl(messenger),
      new AccessoryAddKeypadFingerprintImpl(messenger),
      new AccessoryAddKeypadCardImpl(messenger),
      new AccessoryStartScanDoorSensorImpl(messenger),
      new AccessoryStandaloneDoorSensorStartScanImpl(messenger),
      new AccessoryWaterMeterStartScanImpl(messenger),
      new AccessoryElectricMeterStartScanImpl(messenger),
      new UpgradeLockImpl(messenger),
      new UpgradeGatewayImpl(messenger),
      new UpgradeGatewayByPackageImpl(messenger),
      new UpgradeWaterMeterImpl(messenger),
      new UpgradeWaterMeterByPackageImpl(messenger),
      new UpgradeElectricMeterImpl(messenger),
      new UpgradeElectricMeterByPackageImpl(messenger),
      new UpgradeKeypadImpl(messenger),
      new UpgradeKeypadByPackageImpl(messenger),
    ];
  }

  dispose(): void {
    for (const handler of this.handlers) {
      handler.onCancel(STREAM_CANCEL_ARGS);
    }
    this.handlers = [];
  }
}
