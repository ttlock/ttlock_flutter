import {
  TTLock,
  TTElectricMeter,
  TTWaterMeter,
  TTWiFiDoorMagnetic,
  TTDeviceInfoModel,
  ConfigWiFiParameters,
  TTElectricMeterAddResult,
  TTWaterMeterAddResult,
  ElectricMeterStatusModel,
  WaterMeterStatusModel,
  TTElectricDeviceInfoModel,
  TTWaterDeviceInfoModel,
  TTElectricMeterFeature as SdkTTElectricMeterFeature,
  TTWaterMeterFeature as SdkTTWaterMeterFeature,
  SNError,
} from '@sciener/ttlock';
import {
  AddElectricMeterModel,
  IMultifunctionalKeyModel,
} from '@sciener/ttlock/src/main/ets/TTLock/d/g/g';

import {
  ElectricMeterDeviceInfo,
  MultifunctionalKeypadInitResult,
  RemoteKeypadInitResult,
  Result,
  TTAccessoryHostApi,
  TTElectricMeterInitParam,
  TTElectricMeterInitResult,
  TTKeypadCredentialEventParam,
  TTLockSystemModel,
  TTStandaloneDoorSensorInfo,
  TTStandaloneDoorSensorFeature,
  TTStandaloneDoorSensorInitParams,
  TTWaterMeterInitParam,
  TTWaterMeterInitResult,
  TTMeterPayMode,
  TTElectricMeterFeature,
  TTWaterMeterFeature,
  WaterMeterDeviceInfo,
} from './Messages';

import {
  EventContextStore,
  makeDoorSensorApiError,
  makeElectricMeterApiError,
  makeKeypadAccessoryApiError,
  makeLockApiError,
  makeMultifunctionalKeypadApiError,
  makeNotImplementedError,
  makeRemoteAccessoryApiError,
  makeStandaloneDoorSensorApiError,
  makeWaterMeterApiError,
} from './TtlockPremiseSupport';

import {
  electricMeterFeatureConvert,
  payModeConvert,
  standaloneDoorSensorFeatureConvert,
  waterMeterFeatureConvert,
} from './EnumConverter';

import HashMap from '@ohos.util.HashMap';

function hashMapToMap(map: HashMap<string, Object>): Map<string, Object> {
  const out = new Map<string, Object>();
  map.forEach((value?: Object, key?: string) => {
    if (value !== undefined && key !== undefined) {
      out.set(key, value);
    }
  });
  return out;
}

function getMapString(m: Map<string, Object>, key: string): string | undefined {
  const v = m.get(key);
  if (v === undefined || v === null) return undefined;
  if (typeof v === 'string') return v as string;
  return `${v}`;
}

function getMapNumber(m: Map<string, Object>, key: string): number | undefined {
  const v = m.get(key);
  if (v === undefined || v === null) return undefined;
  if (typeof v === 'number') return v as number;
  if (typeof v === 'string') {
    const n = Number(v);
    return Number.isNaN(n) ? undefined : n;
  }
  return undefined;
}

function parseDeviceRssi(value: string | undefined): number {
  if (value === undefined || value.length === 0) {
    return 0;
  }
  const n = Number(value);
  return Number.isNaN(n) ? 0 : n;
}

function toElectricMeterDeviceInfo(info: TTElectricDeviceInfoModel): ElectricMeterDeviceInfo {
  return new ElectricMeterDeviceInfo(
    info.catOneCardNumber ?? '',
    info.catOneImsi ?? '',
    info.catOneNodeId ?? '',
    info.catOneOperator ?? '',
    parseDeviceRssi(info.catOneRssi),
  );
}

function toWaterMeterDeviceInfo(info: TTWaterDeviceInfoModel): WaterMeterDeviceInfo {
  return new WaterMeterDeviceInfo(
    info.catOneCardNumber ?? '',
    info.catOneImsi ?? '',
    info.catOneNodeId ?? '',
    info.catOneOperator ?? '',
    parseDeviceRssi(info.catOneRssi),
  );
}

function toConfigWiFiParameters(params: TTStandaloneDoorSensorInitParams): ConfigWiFiParameters {
  return {
    SSID: params.getWifiName(),
    wifiPwd: params.getWifiPassword(),
    serverAddress: params.getServerAddress(),
    portNumber: `${params.getPortNumber()}`,
  };
}

function toStandaloneDoorSensorInfo(info: TTDeviceInfoModel): TTStandaloneDoorSensorInfo {
  return new TTStandaloneDoorSensorInfo(
    undefined,
    info.electricQuantity,
    info.featureValue,
    info.wifiMac,
    info.modelNum,
    info.hardwareRevision,
    info.firmwareRevision,
  );
}

/**
 * `TTAccessoryHostApi` 的 OpenHarmony 实现：覆盖键盘 / 遥控钥匙 / 门磁 / 水表 / 电表。
 */
export class AccessoryHostApiImpl extends TTAccessoryHostApi {
  setAccessoryAddKeypadFingerprintParam(param: TTKeypadCredentialEventParam): void {
    EventContextStore.shared.accessoryAddKeypadFingerprint.apply(param);
  }

  setAccessoryAddKeypadCardParam(param: TTKeypadCredentialEventParam): void {
    EventContextStore.shared.accessoryAddKeypadCard.apply(param);
  }

  initRemoteKey(mac: string, lockData: string, result: Result<TTLockSystemModel>): void {
    TTLock.initializeWirelessKey(mac, lockData, {
      success: (info: TTDeviceInfoModel): void => {
        const out = new TTLockSystemModel(
          info.modelNum,
          info.hardwareRevision,
          info.firmwareRevision,
          info.electricQuantity,
          undefined,
          undefined,
          undefined,
          undefined,
          lockData,
        );
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeRemoteAccessoryApiError('initRemoteKey', err));
      },
    });
  }

  initRemoteKeypad(mac: string, lockMac: string, result: Result<RemoteKeypadInitResult>): void {
    TTLock.initializeKeypad(mac, lockMac, {
      success: (info: HashMap<string, Object>): void => {
        const m = hashMapToMap(info);
        const eq = getMapNumber(m, 'electricQuantity') ?? 0;
        const fv = getMapString(m, 'wirelessKeypadFeatureValue') ?? '';
        result.success(new RemoteKeypadInitResult(eq, fv));
      },
      failure: (err: SNError): void => {
        result.error(makeKeypadAccessoryApiError('initRemoteKeypad', err));
      },
    });
  }

  initMultifunctionalKeypad(mac: string, lockData: string,
    result: Result<MultifunctionalKeypadInitResult>): void {
    TTLock.initializeMultifunctionalKeyPad(mac, lockData, {
      success: (info: IMultifunctionalKeyModel): void => {
        const sys: Record<string, string | undefined> =
          info.systemInfoModel as Record<string, string | undefined>;
        const out = new MultifunctionalKeypadInitResult(
          info.electricQuantity,
          info.wirelessKeypadFeatureValue ?? '',
          info.slotNumber,
          info.slotLimit,
          sys.modelNum ?? '',
          sys.hardwareRevision ?? '',
          sys.firmwareRevision ?? '',
        );
        result.success(out);
      },
      failure: (err: SNError): void => {
        if (err.isKeyPadError()) {
          result.error(makeMultifunctionalKeypadApiError('initMultifunctionalKeypad.keypadFailure', err));
        } else {
          result.error(makeLockApiError('initMultifunctionalKeypad.lockFailure', err));
        }
      },
    });
  }

  getStoredLocks(mac: string, result: Result<Array<string>>): void {
    TTLock.multifunctionalKeyPadGetAllStoredLocks(mac, {
      success: (lockMacs: string[]): void => {
        result.success(lockMacs);
      },
      failure: (err: SNError): void => {
        result.error(makeKeypadAccessoryApiError('getStoredLocks', err));
      },
    });
  }

  deleteStoredLock(mac: string, slotNumber: number, result: Result<void>): void {
    TTLock.multifunctionalKeyPadDeleteLockAtSpecifiedSlot(mac, slotNumber, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeKeypadAccessoryApiError('deleteStoredLock', err));
      },
    });
  }

  initDoorSensor(mac: string, lockData: string, result: Result<TTLockSystemModel>): void {
    TTLock.initializeDoorMagnetic(mac, lockData, {
      success: (info: HashMap<string, Object>): void => {
        const m = hashMapToMap(info);
        const out = new TTLockSystemModel(
          getMapString(m, 'modelNum'),
          getMapString(m, 'hardwareRevision'),
          getMapString(m, 'firmwareRevision'),
          getMapNumber(m, 'electricQuantity'),
          undefined,
          undefined,
          undefined,
          undefined,
          lockData,
        );
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeDoorSensorApiError('initDoorSensor', err));
      },
    });
  }

  standaloneDoorSensorInit(
    params: TTStandaloneDoorSensorInitParams,
    result: Result<TTStandaloneDoorSensorInfo>,
  ): void {
    const config = toConfigWiFiParameters(params);
    TTWiFiDoorMagnetic.initializeDoorMagnetic(params.getMac(), config, {
      success: (info: TTDeviceInfoModel): void => {
        result.success(toStandaloneDoorSensorInfo(info));
      },
      failure: (err: SNError): void => {
        result.error(makeStandaloneDoorSensorApiError('standaloneDoorSensorInit', err));
      },
    });
  }

  standaloneDoorSensorReadFeatureValue(mac: string, result: Result<string>): void {
    TTWiFiDoorMagnetic.getFeatureValue(mac, {
      success: (value: string): void => {
        result.success(value);
      },
      failure: (err: SNError): void => {
        result.error(makeStandaloneDoorSensorApiError('standaloneDoorSensorReadFeatureValue', err));
      },
    });
  }

  standaloneDoorSensorIsSupportFunction(
    featureValue: string,
    lockFunction: TTStandaloneDoorSensorFeature,
  ): boolean {
    const sdkFeature = standaloneDoorSensorFeatureConvert(lockFunction);
    if (sdkFeature === null) {
      return false;
    }
    return TTWiFiDoorMagnetic.supportFunction(sdkFeature, featureValue);
  }

  waterMeterConfigServer(url: string, clientId: string, accessToken: string): void {
    TTWaterMeter.setClientParam(url, clientId, accessToken);
  }

  waterMeterConnect(mac: string, result: Result<void>): void {
    EventContextStore.shared.latestWaterMeterMac = mac;
    TTWaterMeter.connect(mac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterConnect', err));
      },
    });
  }

  waterMeterDisconnect(mac: string): void {
    TTWaterMeter.cancelConnect(mac, {
      success: (_: void): void => {
      },
      failure: (_err: SNError): void => {
      },
    });
  }

  waterMeterInit(params: TTWaterMeterInitParam, result: Result<TTWaterMeterInitResult>): void {
    const model: AddElectricMeterModel = {
      number: params.getName(),
      mac: params.getMac(),
      payMode: payModeConvert(params.getPayMode()),
      price: `${params.getPrice()}`,
    };
    TTWaterMeter.addWaterMeter(model, {
      success: (info: TTWaterMeterAddResult): void => {
        result.success(new TTWaterMeterInitResult(info.waterMeterId ?? 0, info.featureValue ?? ''));
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterInit', err));
      },
    });
  }

  waterMeterDelete(mac: string, result: Result<void>): void {
    TTWaterMeter.deleteWaterMeter(mac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterDelete', err));
      },
    });
  }

  waterMeterSetPowerOnOff(mac: string, isOn: boolean, result: Result<void>): void {
    TTWaterMeter.setWaterPower(mac, isOn, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterSetPowerOnOff', err));
      },
    });
  }

  waterMeterSetRemainderM3(mac: string, remainderM3: number, result: Result<void>): void {
    TTWaterMeter.setRemainingWater(mac, `${remainderM3}`, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterSetRemainderM3', err));
      },
    });
  }

  waterMeterClearRemainderM3(mac: string, result: Result<void>): void {
    TTWaterMeter.clearRemainingWater(mac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterClearRemainderM3', err));
      },
    });
  }

  waterMeterReadData(mac: string, result: Result<void>): void {
    TTWaterMeter.readWaterData(mac, {
      success: (_: WaterMeterStatusModel): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterReadData', err));
      },
    });
  }

  waterMeterSetPayMode(mac: string, payMode: TTMeterPayMode, price: number, result: Result<void>): void {
    TTWaterMeter.setWaterPayMode(mac, payModeConvert(payMode), `${price}`, {
      success: (_: WaterMeterStatusModel): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterSetPayMode', err));
      },
    });
  }

  waterMeterCharge(mac: string, amount: number, m3: number, result: Result<void>): void {
    TTWaterMeter.rechargeWater(mac, `${amount}`, `${m3}`, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterCharge', err));
      },
    });
  }

  waterMeterSetTotalUsage(mac: string, totalM3: number, result: Result<void>): void {
    TTWaterMeter.setWaterTotalUsage(mac, `${totalM3}`, {
      success: (_: WaterMeterStatusModel): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterSetTotalUsage', err));
      },
    });
  }

  waterMeterGetFeatureValue(mac: string, result: Result<string>): void {
    TTWaterMeter.getWaterMeterFeatureValue(mac, {
      success: (fv: string): void => {
        result.success(fv);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterGetFeatureValue', err));
      },
    });
  }

  waterMeterGetDeviceInfo(mac: string, result: Result<WaterMeterDeviceInfo>): void {
    TTWaterMeter.getDeviceInfo(mac, {
      success: (info: TTWaterDeviceInfoModel): void => {
        result.success(toWaterMeterDeviceInfo(info));
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterGetDeviceInfo', err));
      },
    });
  }

  waterMeterIsSupportFunction(featureValue: string, lockFunction: TTWaterMeterFeature): boolean {
    const sdkFeature = waterMeterFeatureConvert(lockFunction) as SdkTTWaterMeterFeature;
    return TTWaterMeter.supportFunction(sdkFeature, featureValue);
  }

  waterMeterConfigApn(mac: string, apn: string, result: Result<void>): void {
    TTWaterMeter.configAPN(mac, apn, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterConfigApn', err));
      },
    });
  }

  waterMeterConfigMeterServer(mac: string, ip: string, port: string, result: Result<void>): void {
    TTWaterMeter.configServer(mac, ip, port, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterConfigMeterServer', err));
      },
    });
  }

  waterMeterReset(mac: string, result: Result<void>): void {
    TTWaterMeter.waterMeterEnterUpgradeMode(mac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterReset', err));
      },
    });
  }

  electricMeterConfigServer(url: string, clientId: string, accessToken: string): void {
    TTElectricMeter.setClientParam(url, clientId, accessToken);
  }

  electricMeterConnect(mac: string, result: Result<void>): void {
    EventContextStore.shared.latestElectricMeterMac = mac;
    TTElectricMeter.connect(mac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterConnect', err));
      },
    });
  }

  electricMeterDisconnect(mac: string): void {
    TTElectricMeter.cancelConnect(mac, {
      success: (_: void): void => {
      },
      failure: (_err: SNError): void => {
      },
    });
  }

  electricMeterInit(params: TTElectricMeterInitParam, result: Result<TTElectricMeterInitResult>): void {
    const model: AddElectricMeterModel = {
      number: params.getName(),
      mac: params.getMac(),
      payMode: payModeConvert(params.getPayMode()),
      price: `${params.getPrice()}`,
    };
    TTElectricMeter.addElectricMeter(model, {
      success: (info: TTElectricMeterAddResult): void => {
        result.success(new TTElectricMeterInitResult(info.electricMeterId ?? 0, info.featureValue ?? ''));
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterInit', err));
      },
    });
  }

  electricMeterDelete(mac: string, result: Result<void>): void {
    TTElectricMeter.deleteElectricMeter(mac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterDelete', err));
      },
    });
  }

  electricMeterSetPowerOnOff(mac: string, isOn: boolean, result: Result<void>): void {
    TTElectricMeter.setPower(mac, isOn, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterSetPowerOnOff', err));
      },
    });
  }

  electricMeterSetRemainderKwh(mac: string, remainderKwh: number,
    result: Result<void>): void {
    TTElectricMeter.setRemainingElectricity(mac, `${remainderKwh}`, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterSetRemainderKwh', err));
      },
    });
  }

  electricMeterClearRemainderKwh(mac: string, result: Result<void>): void {
    TTElectricMeter.clearRemainingElectricity(mac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterClearRemainderKwh', err));
      },
    });
  }

  electricMeterReadData(mac: string, result: Result<void>): void {
    TTElectricMeter.readData(mac, {
      success: (_: ElectricMeterStatusModel): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterReadData', err));
      },
    });
  }

  electricMeterSetPayMode(mac: string, payMode: TTMeterPayMode, price: number, result: Result<void>): void {
    TTElectricMeter.setPayMode(mac, payModeConvert(payMode), `${price}`, {
      success: (_: ElectricMeterStatusModel): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterSetPayMode', err));
      },
    });
  }

  electricMeterCharge(mac: string, amount: number, kwh: number, result: Result<void>): void {
    TTElectricMeter.recharge(mac, `${amount}`, `${kwh}`, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterCharge', err));
      },
    });
  }

  electricMeterSetMaxPower(mac: string, maxPower: number, result: Result<void>): void {
    TTElectricMeter.setMaxPower(mac, maxPower, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterSetMaxPower', err));
      },
    });
  }

  electricMeterGetFeatureValue(mac: string, result: Result<string>): void {
    TTElectricMeter.getFeatureValue(mac, {
      success: (fv: string): void => {
        result.success(fv);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterGetFeatureValue', err));
      },
    });
  }

  electricMeterIsSupportFunction(featureValue: string, lockFunction: TTElectricMeterFeature): boolean {
    const sdkFeature = electricMeterFeatureConvert(lockFunction) as SdkTTElectricMeterFeature;
    return TTElectricMeter.supportFunction(sdkFeature, featureValue);
  }

  electricMeterGetDeviceInfo(mac: string, result: Result<ElectricMeterDeviceInfo>): void {
    TTElectricMeter.getElectricMeterDeviceInfo(mac, {
      success: (info: TTElectricDeviceInfoModel): void => {
        result.success(toElectricMeterDeviceInfo(info));
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterGetDeviceInfo', err));
      },
    });
  }

  electricMeterConfigApn(mac: string, apn: string, result: Result<void>): void {
    TTElectricMeter.setElectricMeterApn(mac, apn, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterConfigApn', err));
      },
    });
  }

  electricMeterConfigMeterServer(mac: string, ip: string, port: string, result: Result<void>): void {
    TTElectricMeter.setElectricMeterServer(mac, ip, port, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterConfigMeterServer', err));
      },
    });
  }

  electricMeterReset(mac: string, result: Result<void>): void {
    TTElectricMeter.enterUpgradeMode(mac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterReset', err));
      },
    });
  }
}
