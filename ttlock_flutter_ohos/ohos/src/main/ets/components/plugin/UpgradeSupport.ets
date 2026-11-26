import { SNError, TTGatewayDFUType, TTLock } from '@sciener/ttlock';

import {
  PigeonEventSink,
  TTDfuType,
  TTLockUpgradeError,
  TTUpgradeEvent,
  TTUpgradePhase,
  TTUpgradeStatus,
} from './Messages';

export const UPGRADE_KIND_LOCK: string = 'lock';
export const UPGRADE_KIND_GATEWAY: string = 'gateway';
export const UPGRADE_BUSY_MESSAGE: string = 'upgrade already in progress';

/**
 * 同一时刻只允许一路升级。结束会话的回调必须带上开始时的代际，
 * 迟到回调不能结束下一次同路会话。onCancel 在 take 成功后调 TTLock.abort*。
 */
export class UpgradeSession {
  private static activeKind: string | null = null;
  private static generations: Map<string, number> = new Map<string, number>();
  private static sinks: Map<string, PigeonEventSink<TTUpgradeEvent>> =
    new Map<string, PigeonEventSink<TTUpgradeEvent>>();

  static begin(kind: string, sink: PigeonEventSink<TTUpgradeEvent>): number | null {
    if (UpgradeSession.activeKind !== null) {
      return null;
    }
    UpgradeSession.activeKind = kind;
    const prev: number | undefined = UpgradeSession.generations.get(kind);
    const next: number = (prev !== undefined ? prev : 0) + 1;
    UpgradeSession.generations.set(kind, next);
    UpgradeSession.sinks.set(kind, sink);
    return next;
  }

  static matches(kind: string, generation: number): boolean {
    return UpgradeSession.activeKind === kind &&
      UpgradeSession.generations.get(kind) === generation;
  }

  static sinkIfCurrent(kind: string, generation: number): PigeonEventSink<TTUpgradeEvent> | null {
    if (!UpgradeSession.matches(kind, generation)) {
      return null;
    }
    const sink: PigeonEventSink<TTUpgradeEvent> | undefined = UpgradeSession.sinks.get(kind);
    if (sink === undefined) {
      return null;
    }
    return sink;
  }

  static take(kind: string, generation: number): PigeonEventSink<TTUpgradeEvent> | null {
    if (!UpgradeSession.matches(kind, generation)) {
      return null;
    }
    UpgradeSession.activeKind = null;
    const sink: PigeonEventSink<TTUpgradeEvent> | undefined = UpgradeSession.sinks.get(kind);
    UpgradeSession.sinks.delete(kind);
    if (sink === undefined) {
      return null;
    }
    return sink;
  }
}

/**
 * 同一 EventChannel handler 上的 listen / cancel。
 * 缺参或忙拒绝不占会话；成功/失败 take 后 cancel 不再动作。
 */
export class UpgradeListenGate {
  private kind: string;
  private ownsSession: boolean = false;
  generation: number = 0;

  constructor(kind: string) {
    this.kind = kind;
  }

  begin(
    sink: PigeonEventSink<TTUpgradeEvent>,
    hasParam: boolean,
    missingMessage: string,
  ): boolean {
    if (!hasParam) {
      sink.error('' + TTLockUpgradeError.UPGRADE_FAIL, missingMessage, null);
      sink.endOfStream();
      return false;
    }
    const started: number | null = UpgradeSession.begin(this.kind, sink);
    if (started === null) {
      sink.error('' + TTLockUpgradeError.UPGRADE_FAIL, UPGRADE_BUSY_MESSAGE, null);
      sink.endOfStream();
      return false;
    }
    this.generation = started;
    this.ownsSession = true;
    return true;
  }

  /** 成功或失败已 take 过会话时不再 abort。仅 take 成功才调 SDK abort。 */
  cancel(): void {
    if (!this.ownsSession) {
      return;
    }
    this.ownsSession = false;
    const sink: PigeonEventSink<TTUpgradeEvent> | null =
      UpgradeSession.take(this.kind, this.generation);
    if (sink === null) {
      return;
    }
    if (this.kind === UPGRADE_KIND_LOCK) {
      TTLock.abortLockDfu();
    } else if (this.kind === UPGRADE_KIND_GATEWAY) {
      TTLock.abortGatewayDfu();
    }
  }
}

export function gatewayDfuTypeConvert(type: TTDfuType): TTGatewayDFUType {
  if (type === TTDfuType.NET) {
    return TTGatewayDFUType.byNet;
  }
  return TTGatewayDFUType.byBluetooth;
}

/**
 * 鸿蒙 `TTUpgradeErrorCode` 与 Pigeon `TTLockUpgradeError` 在 1–10 对齐；
 * SUCCESS 为占位 0；11/12/断连等落入 UPGRADE_FAIL。
 */
export function upgradeErrorRevert(code: number): TTLockUpgradeError {
  if (code === 1) {
    return TTLockUpgradeError.PERIPHERAL_POWERED_OFF;
  }
  if (code === 2) {
    return TTLockUpgradeError.CONNECT_TIMEOUT;
  }
  if (code === 3) {
    return TTLockUpgradeError.NET_FAIL;
  }
  if (code === 4) {
    return TTLockUpgradeError.NO_NEED_UPGRADE;
  }
  if (code === 5) {
    return TTLockUpgradeError.UNKNOWN_UPGRADE_VERSION;
  }
  if (code === 6) {
    return TTLockUpgradeError.ENTER_UPGRADE_STATE;
  }
  if (code === 7) {
    return TTLockUpgradeError.UPGRADE_LOCK_FAIL;
  }
  if (code === 8) {
    return TTLockUpgradeError.PREPARING_ERROR;
  }
  if (code === 9) {
    return TTLockUpgradeError.GET_SPECIAL_VALUE_ERROR;
  }
  if (code === 10) {
    return TTLockUpgradeError.UPGRADE_FAIL;
  }
  return TTLockUpgradeError.UPGRADE_FAIL;
}

function upgradeErrorMessage(err: SNError, fallback: string): string {
  if (err.msg !== undefined && err.msg !== null && err.msg.length > 0) {
    return err.msg;
  }
  return fallback;
}

export function emitUpgradeProgress(
  kind: string,
  generation: number,
  percent: number,
): void {
  const sink: PigeonEventSink<TTUpgradeEvent> | null =
    UpgradeSession.sinkIfCurrent(kind, generation);
  if (sink === null) {
    return;
  }
  sink.success(new TTUpgradeEvent(
    TTUpgradePhase.PROGRESS,
    TTUpgradeStatus.UPGRADING,
    percent,
    undefined,
  ));
}

export function failUpgrade(
  kind: string,
  generation: number,
  err: SNError,
  fallbackMessage: string,
): void {
  const sink: PigeonEventSink<TTUpgradeEvent> | null =
    UpgradeSession.take(kind, generation);
  if (sink === null) {
    return;
  }
  const mapped: TTLockUpgradeError = upgradeErrorRevert(err.code);
  sink.error('' + mapped, upgradeErrorMessage(err, fallbackMessage), null);
  sink.endOfStream();
}

export function succeedUpgrade(
  kind: string,
  generation: number,
  lockData?: string,
): void {
  const sink: PigeonEventSink<TTUpgradeEvent> | null =
    UpgradeSession.take(kind, generation);
  if (sink === null) {
    return;
  }
  sink.success(new TTUpgradeEvent(
    TTUpgradePhase.SUCCESS,
    undefined,
    undefined,
    lockData,
  ));
  sink.endOfStream();
}
