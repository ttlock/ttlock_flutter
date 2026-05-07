import { FlutterError, TTCycleModel } from './Messages';
import { ITTLockResult, SNError } from '@sciener/ttlock';
import {
  electricMeterErrorRevert,
  gatewayErrorRevert,
  keypadErrorRevert,
  lockErrorRevert,
  multifunctionalKeypadErrorRevert,
  remoteAccessoryErrorRevert,
  waterMeterErrorRevert,
} from './EnumConverter';

const NOT_IMPLEMENTED_CODE = 'NOT_IMPLEMENTED';
const INVALID_VALUE_CODE = 'INVALID_VALUE';
const NO_LOCK_DATA_CODE = 'NO_LOCK_DATA';
const NO_GATEWAY_CODE = 'NO_GATEWAY';
const NO_KEYPAD_CODE = 'NO_KEYPAD';
const NO_METER_MAC_CODE = 'NO_METER_MAC';

/**
 * `ITTLockResult<T>` 的 class 化适配，绕开 ArkTS 严格模式
 * `arkts-no-structural-typing` 规则——SDK 的所有异步回调都接受
 * 该类型，但 ArkTS 不允许直接用对象字面量满足接口。
 */
export class TTResultBridge<T> implements ITTLockResult<T> {
  success: (arg: T) => void;
  failure: (err: SNError) => void;

  constructor(success: (arg: T) => void, failure: (err: SNError) => void) {
    this.success = success;
    this.failure = failure;
  }
}

/** 仅保留 success 回调的便捷构造（failure 静默丢弃，用于 enterUpgradeMode 等"开炮即走"接口）。*/
export function noopFailureBridge<T>(success: (arg: T) => void): TTResultBridge<T> {
  return new TTResultBridge<T>(success, (_err: SNError): void => {
  });
}

export function makeNotImplementedError(operation: string): FlutterError {
  return new FlutterError(
    NOT_IMPLEMENTED_CODE,
    'notImplemented',
    `${operation} is not implemented on OpenHarmony`,
  );
}

export function makeInvalidValueError(message: string): FlutterError {
  return new FlutterError(INVALID_VALUE_CODE, 'invalidValue', message);
}

export function makeNoLockDataError(operation: string): FlutterError {
  return new FlutterError(
    NO_LOCK_DATA_CODE,
    'noLockData',
    `请先通过 setEventLockData 设置 lockData 后再使用 ${operation}`,
  );
}

export function makeNoGatewayError(operation: string): FlutterError {
  return new FlutterError(
    NO_GATEWAY_CODE,
    'noGateway',
    `请先通过 setEventGatewayMac 设置网关 MAC 后再使用 ${operation}`,
  );
}

export function makeNoKeypadError(operation: string): FlutterError {
  return new FlutterError(
    NO_KEYPAD_CODE,
    'noKeypad',
    `请先通过 setEventKeypadMac 设置键盘 MAC 后再使用 ${operation}`,
  );
}

export function makeNoMeterMacError(operation: string): FlutterError {
  return new FlutterError(
    NO_METER_MAC_CODE,
    'noMeterMac',
    `请先连接表具后再使用 ${operation}`,
  );
}

function pickErrorMessage(err: SNError, fallback: string): string {
  if (err.msg !== undefined && err.msg !== null && err.msg.length > 0) {
    return err.msg;
  }
  return fallback;
}

export function makeLockApiError(operation: string, error: SNError, message?: string): FlutterError {
  const fallback = `${operation} failed: ${error.code}`;
  const mapped = lockErrorRevert(error.code);
  return new FlutterError(
    `${mapped}`,
    'lockError',
    message !== undefined ? message : pickErrorMessage(error, fallback),
  );
}

export function makeGatewayApiError(operation: string, error: SNError, message?: string): FlutterError {
  const fallback = `${operation} failed: ${error.code}`;
  const mapped = gatewayErrorRevert(error.code);
  return new FlutterError(
    `${mapped}`,
    'gatewayError',
    message !== undefined ? message : pickErrorMessage(error, fallback),
  );
}

export function makeRemoteAccessoryApiError(operation: string, error: SNError, message?: string): FlutterError {
  const fallback = `${operation} failed: ${error.code}`;
  const mapped = remoteAccessoryErrorRevert(error.code);
  return new FlutterError(
    `${mapped}`,
    'remoteAccessoryError',
    message !== undefined ? message : pickErrorMessage(error, fallback),
  );
}

export function makeKeypadAccessoryApiError(operation: string, error: SNError, message?: string): FlutterError {
  const fallback = `${operation} failed: ${error.code}`;
  const mapped = keypadErrorRevert(error.code);
  return new FlutterError(
    `${mapped}`,
    'keypadError',
    message !== undefined ? message : pickErrorMessage(error, fallback),
  );
}

export function makeMultifunctionalKeypadApiError(operation: string, error: SNError, message?: string): FlutterError {
  const fallback = `${operation} failed: ${error.code}`;
  const mapped = multifunctionalKeypadErrorRevert(error.code);
  return new FlutterError(
    `${mapped}`,
    'multifunctionalKeypadError',
    message !== undefined ? message : pickErrorMessage(error, fallback),
  );
}

export function makeDoorSensorApiError(operation: string, error: SNError, message?: string): FlutterError {
  const fallback = `${operation} failed: ${error.code}`;
  const mapped = remoteAccessoryErrorRevert(error.code);
  return new FlutterError(
    `${mapped}`,
    'doorSensorError',
    message !== undefined ? message : pickErrorMessage(error, fallback),
  );
}

export function makeWaterMeterApiError(operation: string, error: SNError, message?: string): FlutterError {
  const fallback = `${operation} failed: ${error.code}`;
  const mapped = waterMeterErrorRevert(error.code);
  return new FlutterError(
    `${mapped}`,
    'waterMeterError',
    message !== undefined ? message : pickErrorMessage(error, fallback),
  );
}

export function makeElectricMeterApiError(operation: string, error: SNError, message?: string): FlutterError {
  const fallback = `${operation} failed: ${error.code}`;
  const mapped = electricMeterErrorRevert(error.code);
  return new FlutterError(
    `${mapped}`,
    'electricMeterError',
    message !== undefined ? message : pickErrorMessage(error, fallback),
  );
}

/**
 * 由 ETS 端 host 调用方与 EventChannel 共享的运行期上下文。
 *
 * 与 iOS 端 `EventContextStore` 一致：在订阅 EventChannel（如 lockAddCard、accessoryAddKeypadFingerprint）
 * 之前，先通过 host API 写入 lockData / gatewayMac / keypadMac 等关键字段。
 */
export class EventContextStore {
  private static _instance: EventContextStore | null = null;

  static get shared(): EventContextStore {
    if (EventContextStore._instance === null) {
      EventContextStore._instance = new EventContextStore();
    }
    return EventContextStore._instance as EventContextStore;
  }

  lockData: string | null = null;
  gatewayMac: string | null = null;
  keypadMac: string | null = null;
  isMultifunctionalKeypad: boolean = false;

  /** 由最近一次 gatewayInit 缓存，供 getNetworkMac 复用（OHOS SDK 没有独立接口）。*/
  cachedNetworkMac: string | null = null;

  /** 与 Android `LockStreamParams` 对齐：加卡/指纹/人脸等流的周期配置与有效期（毫秒）。*/
  streamCyclicConfigMaps: Array<TTCycleModel> | null = null;
  streamValidityStartMs: number | null = null;
  streamValidityEndMs: number | null = null;

  /** 用于 readData / payMode 等接口缓存最近一次连接的表具 MAC。*/
  latestWaterMeterMac: string | null = null;
  latestElectricMeterMac: string | null = null;

  validityRangeForAddOperations(): ValidityRange {
    const nowMs = Date.now();
    const start = this.streamValidityStartMs !== null ? this.streamValidityStartMs : nowMs;
    const end = this.streamValidityEndMs !== null
      ? this.streamValidityEndMs
      : nowMs + 30 * 24 * 3600 * 1000;
    return new ValidityRange(start, end, this.streamCyclicConfigMaps);
  }

  reset(): void {
    this.lockData = null;
    this.gatewayMac = null;
    this.keypadMac = null;
    this.isMultifunctionalKeypad = false;
    this.cachedNetworkMac = null;
    this.streamCyclicConfigMaps = null;
    this.streamValidityStartMs = null;
    this.streamValidityEndMs = null;
    this.latestWaterMeterMac = null;
    this.latestElectricMeterMac = null;
  }
}

export class ValidityRange {
  start: number;
  end: number;
  cyclic: Array<TTCycleModel> | null;

  constructor(start: number, end: number, cyclic: Array<TTCycleModel> | null) {
    this.start = start;
    this.end = end;
    this.cyclic = cyclic;
  }
}

/**
 * 把 Pigeon 的 TTCycleModel 转成 SDK 需要的 ITTLockCyclicConfig 形态。
 * SDK 期望：`{ weekDay, startTime, endTime }`。
 */
export function cycleModelToMap(cycle: TTCycleModel): Map<string, Object> {
  const m = new Map<string, Object>();
  const weekDay = cycle.getWeekDay();
  if (weekDay !== undefined) {
    m.set('weekDay', weekDay);
  }
  const startTime = cycle.getStartTime();
  if (startTime !== undefined) {
    m.set('startTime', startTime);
  }
  const endTime = cycle.getEndTime();
  if (endTime !== undefined) {
    m.set('endTime', endTime);
  }
  return m;
}

export class CycleConfigEntry {
  weekDay: number;
  startTime: number;
  endTime: number;

  constructor(weekDay: number, startTime: number, endTime: number) {
    this.weekDay = weekDay;
    this.startTime = startTime;
    this.endTime = endTime;
  }
}

/**
 * SDK 的 cyclicConfig 是 `ITTLockCyclicConfig[] | null`，
 * 把 Pigeon 的 `Array<TTCycleModel>` 转成可直接入参的纯对象数组。
 */
export function cycleListToConfig(cycleList: Array<TTCycleModel> | null | undefined): CycleConfigEntry[] | null {
  if (cycleList === null || cycleList === undefined || cycleList.length === 0) {
    return null;
  }
  const out: CycleConfigEntry[] = [];
  for (const cycle of cycleList) {
    out.push(new CycleConfigEntry(
      cycle.getWeekDay() ?? 0,
      cycle.getStartTime() ?? 0,
      cycle.getEndTime() ?? 0,
    ));
  }
  return out;
}

/**
 * 解析 SDK 返回的 JSON 数组字符串（passcode/cards/fingerprints 等返回值）。
 * 失败时返回空数组，与 iOS 端 `parseJsonArrayString` 行为一致。
 */
export function parseJsonArrayString(json: string | null | undefined): Array<Map<string, Object>> {
  if (json === null || json === undefined || json.length === 0) {
    return [];
  }
  try {
    const parsed: Object = JSON.parse(json) as Object;
    if (!Array.isArray(parsed)) {
      return [];
    }
    const out: Array<Map<string, Object>> = [];
    for (const raw of parsed as Object[]) {
      out.push(objectToMap(raw));
    }
    return out;
  } catch (_e) {
    return [];
  }
}

export function objectToMap(raw: Object): Map<string, Object> {
  const m = new Map<string, Object>();
  if (raw === null || raw === undefined) {
    return m;
  }
  const keys = Object.keys(raw);
  for (const key of keys) {
    const val = (raw as Record<string, Object>)[key];
    if (val !== undefined && val !== null) {
      m.set(key, val);
    }
  }
  return m;
}

export function mapStringValue(data: Map<string, Object>, key: string): string {
  const v = data.get(key);
  if (typeof v === 'string') {
    return v;
  }
  if (v === undefined || v === null) {
    throw makeInvalidValueError(`Missing string value for key: ${key}`);
  }
  return `${v}`;
}

export function mapNumberValue(data: Map<string, Object>, key: string): number {
  const v = data.get(key);
  if (typeof v === 'number') {
    return v;
  }
  if (typeof v === 'string') {
    const parsed = Number(v);
    if (!Number.isNaN(parsed)) {
      return parsed;
    }
  }
  throw makeInvalidValueError(`Missing number value for key: ${key}`);
}

export function mapOptionalString(data: Map<string, Object>, key: string): string | undefined {
  const v = data.get(key);
  if (v === undefined || v === null) {
    return undefined;
  }
  if (typeof v === 'string') {
    return v;
  }
  return `${v}`;
}

export function mapOptionalNumber(data: Map<string, Object>, key: string): number | undefined {
  const v = data.get(key);
  if (v === undefined || v === null) {
    return undefined;
  }
  if (typeof v === 'number') {
    return v;
  }
  if (typeof v === 'string') {
    const parsed = Number(v);
    if (!Number.isNaN(parsed)) {
      return parsed;
    }
  }
  return undefined;
}

/**
 * 把 SDK 返回的 lockVersion（既可能是字典也可能是 JSON 字符串）
 * 序列化为字符串形式，便于跨 Pigeon 边界传递。
 */
export function lockVersionToJsonString(version: Object | null | undefined): string {
  if (version === null || version === undefined) {
    return '';
  }
  if (typeof version === 'string') {
    return version;
  }
  try {
    return JSON.stringify(version);
  } catch (_e) {
    return '';
  }
}
