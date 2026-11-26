import {
  TTUpgradeElectricMeterByPackageParam,
  TTUpgradeElectricMeterParam,
  TTUpgradeGatewayByPackageParam,
  TTUpgradeGatewayParam,
  TTUpgradeHostApi,
  TTUpgradeKeypadByPackageParam,
  TTUpgradeKeypadParam,
  TTUpgradeLockByPackageParam,
  TTUpgradeLockParam,
  TTUpgradeWaterMeterByPackageParam,
  TTUpgradeWaterMeterParam,
} from './Messages';

import { EventContextStore, makeNotImplementedError } from './TtlockPremiseSupport';

/**
 * `TTUpgradeHostApi` 的 OpenHarmony 实现。
 *
 * 已接入：锁网络 / 锁固件包 / 网关网络 DFU（参数写入 EventContextStore，流在 EventStreamHandlers）。
 * 其余仍 `notImplemented`（鸿蒙 SDK 无完整 DFU）。
 *
 * 生成物无 `@async`：方法是同步 `void`，错误靠 throw，由 Pigeon `wrapError` 转成
 * code=`TTLockError.FAIL`、message=`notImplemented`。
 *
 * 中止 DFU 仅在 Stream `onCancel`（take 成功后调 `TTLock.abort*`）。
 */
export class UpgradeHostApiImpl extends TTUpgradeHostApi {
  setUpgradeLockParam(param: TTUpgradeLockParam): void {
    EventContextStore.shared.upgradeLock = param;
  }

  setUpgradeLockByPackageParam(param: TTUpgradeLockByPackageParam): void {
    EventContextStore.shared.upgradeLockByPackage = param;
  }

  setUpgradeGatewayParam(param: TTUpgradeGatewayParam): void {
    EventContextStore.shared.upgradeGateway = param;
  }

  setUpgradeGatewayByPackageParam(_param: TTUpgradeGatewayByPackageParam): void {
    throw makeNotImplementedError('setUpgradeGatewayByPackageParam');
  }

  setUpgradeWaterMeterParam(_param: TTUpgradeWaterMeterParam): void {
    throw makeNotImplementedError('setUpgradeWaterMeterParam');
  }

  setUpgradeWaterMeterByPackageParam(_param: TTUpgradeWaterMeterByPackageParam): void {
    throw makeNotImplementedError('setUpgradeWaterMeterByPackageParam');
  }

  setUpgradeElectricMeterParam(_param: TTUpgradeElectricMeterParam): void {
    throw makeNotImplementedError('setUpgradeElectricMeterParam');
  }

  setUpgradeElectricMeterByPackageParam(_param: TTUpgradeElectricMeterByPackageParam): void {
    throw makeNotImplementedError('setUpgradeElectricMeterByPackageParam');
  }

  setUpgradeKeypadParam(_param: TTUpgradeKeypadParam): void {
    throw makeNotImplementedError('setUpgradeKeypadParam');
  }

  setUpgradeKeypadByPackageParam(_param: TTUpgradeKeypadByPackageParam): void {
    throw makeNotImplementedError('setUpgradeKeypadByPackageParam');
  }
}
