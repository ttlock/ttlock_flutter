import {
  TTUpgradeElectricMeterByPackageParam,
  TTUpgradeElectricMeterParam,
  TTUpgradeGatewayByPackageParam,
  TTUpgradeGatewayParam,
  TTUpgradeHostApi,
  TTUpgradeKeypadByPackageParam,
  TTUpgradeKeypadParam,
  TTUpgradeLockParam,
  TTUpgradeWaterMeterByPackageParam,
  TTUpgradeWaterMeterParam,
} from './Messages';

import { makeNotImplementedError } from './TtlockPremiseSupport';

/**
 * `TTUpgradeHostApi` 的 OpenHarmony 空实现。鸿蒙本轮不做真实 DFU，
 * 全部 Host 方法抛 `makeNotImplementedError`，与 Lock/Accessory 未实现接口一致。
 *
 * 生成物无 `@async`：方法是同步 `void`，错误靠 throw，由 Pigeon `wrapError` 转成
 * code=`TTLockError.FAIL`、message=`notImplemented`。
 */
export class UpgradeHostApiImpl extends TTUpgradeHostApi {
  setUpgradeLockParam(_param: TTUpgradeLockParam): void {
    throw makeNotImplementedError('setUpgradeLockParam');
  }

  setUpgradeGatewayParam(_param: TTUpgradeGatewayParam): void {
    throw makeNotImplementedError('setUpgradeGatewayParam');
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

  stopUpgradeLock(): void {
    throw makeNotImplementedError('stopUpgradeLock');
  }

  stopUpgradeGateway(): void {
    throw makeNotImplementedError('stopUpgradeGateway');
  }

  stopUpgradeWaterMeter(): void {
    throw makeNotImplementedError('stopUpgradeWaterMeter');
  }

  stopUpgradeElectricMeter(): void {
    throw makeNotImplementedError('stopUpgradeElectricMeter');
  }

  stopUpgradeKeypad(): void {
    throw makeNotImplementedError('stopUpgradeKeypad');
  }
}
