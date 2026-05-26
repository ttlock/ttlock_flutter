import {
  TTLock,
  TTElectricMeter,
  TTWaterMeter,
  TTWiFiDoorMagnetic,
  TTDeviceInfoModel,
  ConfigWiFiParameters,
  ElectricMeterStatusModel,
  WaterMeterStatusModel,
  TTWiFiDoorMagneticFeatureValue as SdkTTWiFiDoorMagneticFeatureValue,
  SNError,
} from '@sciener/ttlock';
import {
  IMultifunctionalKeyModel,
  AddElectricMeterModel,
} from '@sciener/ttlock/src/main/ets/e/f/i/i';

import {
  MultifunctionalKeypadInitResult,
  RemoteKeypadInitResult,
  Result,
  TTAccessoryHostApi,
  TTElectricMeterInitResult,
  TTLockSystemModel,
  TTStandaloneDoorSensorInfo,
  TTWaterMeterInitResult,
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
  makeWaterMeterApiError,
  mapOptionalString,
  mapStringValue,
} from './TtlockPremiseSupport';

import HashMap from '@ohos.util.HashMap';

function hashMapToMap(map: HashMap<string, Object>): Map<string, Object> {
  const out = new Map<string, Object>();
  map.forEach((value: Object, key: string) => {
    out.set(key, value);
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

function waterMeterStatusToMap(model: WaterMeterStatusModel): Map<string, Object> {
  const m = new Map<string, Object>();
  m.set('payMode', model.payMode);
  m.set('onOff', model.onOff);
  m.set('totalM3', model.totalM3);
  m.set('remainderM3', model.remainderM3);
  m.set('magneticInterference', model.magneticInterference);
  m.set('electricQuantity', model.electricQuantity);
  m.set('waterValveMalfunction', model.waterValveMalfunction);
  m.set('featureValue', model.featureValue);
  return m;
}

function electricMeterStatusToMap(model: ElectricMeterStatusModel): Map<string, Object> {
  const m = new Map<string, Object>();
  m.set('payMode', model.payMode);
  m.set('onOff', model.onOff);
  m.set('voltage', model.voltage);
  m.set('electricCurrent', model.electricCurrent);
  m.set('totalKwh', model.totalKwh);
  m.set('maxPower', model.maxPower);
  m.set('remainderKwh', model.remainderKwh);
  m.set('featureValue', model.featureValue);
  return m;
}

/**
 * `TTAccessoryHostApi` 的 OpenHarmony 实现：覆盖键盘 / 遥控钥匙 / 门磁 / 水表 / 电表。
 *
 * 与 iOS 一致，部分接口在当前 SDK 没有等价能力，全部以 `notImplemented` 返回。
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

  standaloneDoorSensorInit(mac: string, info: Map<string, Object>,
    result: Result<TTStandaloneDoorSensorInfo>): void {
    const ssid = mapOptionalString(info, 'SSID') ?? mapOptionalString(info, 'wifi');
    const wifiPwd = mapOptionalString(info, 'wifiPwd') ?? mapOptionalString(info, 'wifiPassword');
    const serverAddress = mapOptionalString(info, 'serverAddress') ?? mapOptionalString(info, 'serverIp');
    const portNumber = mapOptionalString(info, 'portNumber') ?? mapOptionalString(info, 'serverPort');
    if (ssid === undefined || wifiPwd === undefined || serverAddress === undefined ||
      portNumber === undefined) {
      result.error(makeDoorSensorApiError('standaloneDoorSensorInit', SNError.invalidParam(),
        '`SSID`, `wifiPwd`, `serverAddress`, `portNumber` are required'));
      return;
    }
    const config: ConfigWiFiParameters = {
      SSID: ssid,
      wifiPwd: wifiPwd,
      serverAddress: serverAddress,
      portNumber: portNumber,
      aesKey: mapOptionalString(info, 'aesKey'),
      contractNumber: mapOptionalString(info, 'contractNumber'),
    };
    TTWiFiDoorMagnetic.initializeDoorMagnetic(mac, config, {
      success: (deviceInfo: TTDeviceInfoModel): void => {
        const out = new TTStandaloneDoorSensorInfo(
          undefined,
          deviceInfo.electricQuantity,
          deviceInfo.featureValue,
          deviceInfo.wifiMac,
          deviceInfo.modelNum,
          deviceInfo.hardwareRevision,
          deviceInfo.firmwareRevision,
        );
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeDoorSensorApiError('standaloneDoorSensorInit', err));
      },
    });
  }

  standaloneDoorSensorReadFeatureValue(mac: string, result: Result<string>): void {
    TTWiFiDoorMagnetic.getFeatureValue(mac, {
      success: (fv: string): void => {
        result.success(fv);
      },
      failure: (err: SNError): void => {
        result.error(makeDoorSensorApiError('standaloneDoorSensorReadFeatureValue', err));
      },
    });
  }

  standaloneDoorSensorIsSupportFunction(featureValue: string, lockFunction: number): boolean {
    const sdkFunc = lockFunction as SdkTTWiFiDoorMagneticFeatureValue;
    return TTWiFiDoorMagnetic.supportFunction(sdkFunc, featureValue);
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

  waterMeterInit(params: Map<string, Object>, result: Result<TTWaterMeterInitResult>): void {
    let mac: string;
    let payMode: string;
    let price: string;
    let waterMeterId: string;
    try {
      waterMeterId = mapStringValue(params, 'number');
      mac = mapStringValue(params, 'mac');
      payMode = mapStringValue(params, 'payMode');
      price = mapStringValue(params, 'price');
    } catch (e) {
      result.error(e as Error);
      return;
    }
    const model: AddElectricMeterModel = {
      number: waterMeterId,
      mac: mac,
      payMode: payMode,
      price: price,
    };
    TTWaterMeter.addWaterMeter(model, {
      success: (_: void): void => {
        result.success(new TTWaterMeterInitResult(waterMeterId, undefined));
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterInit', err));
      },
    });
  }

  waterMeterDelete(waterMeterId: string, result: Result<void>): void {
    TTWaterMeter.deleteWaterMeter(waterMeterId, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterDelete', err));
      },
    });
  }

  waterMeterSetPowerOnOff(waterMeterId: string, isOn: boolean, result: Result<void>): void {
    TTWaterMeter.setWaterPower(waterMeterId, isOn, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterSetPowerOnOff', err));
      },
    });
  }

  waterMeterSetRemainderM3(waterMeterId: string, remainderM3: number, result: Result<void>): void {
    TTWaterMeter.setRemainingWater(waterMeterId, `${remainderM3}`, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterSetRemainderM3', err));
      },
    });
  }

  waterMeterClearRemainderM3(waterMeterId: string, result: Result<void>): void {
    TTWaterMeter.clearRemainingWater(waterMeterId, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterClearRemainderM3', err));
      },
    });
  }

  waterMeterReadData(waterMeterId: string, result: Result<Map<string, Object>>): void {
    TTWaterMeter.readWaterData(waterMeterId, {
      success: (model: WaterMeterStatusModel): void => {
        result.success(waterMeterStatusToMap(model));
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterReadData', err));
      },
    });
  }

  waterMeterSetPayMode(waterMeterId: string, payMode: number, result: Result<void>): void {
    TTWaterMeter.setWaterPayMode(waterMeterId, payMode, '0', {
      success: (_: WaterMeterStatusModel): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterSetPayMode', err));
      },
    });
  }

  waterMeterCharge(waterMeterId: string, amount: number, result: Result<void>): void {
    const amountStr = `${amount}`;
    TTWaterMeter.rechargeWater(waterMeterId, amountStr, amountStr, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterCharge', err));
      },
    });
  }

  waterMeterSetTotalUsage(waterMeterId: string, totalM3: number, result: Result<void>): void {
    TTWaterMeter.setWaterTotalUsage(waterMeterId, `${totalM3}`, {
      success: (_: WaterMeterStatusModel): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterSetTotalUsage', err));
      },
    });
  }

  waterMeterGetFeatureValue(waterMeterId: string, result: Result<string>): void {
    TTWaterMeter.getWaterMeterFeatureValue(waterMeterId, {
      success: (fv: string): void => {
        result.success(fv);
      },
      failure: (err: SNError): void => {
        result.error(makeWaterMeterApiError('waterMeterGetFeatureValue', err));
      },
    });
  }

  waterMeterGetDeviceInfo(_waterMeterId: string, result: Result<WaterMeterDeviceInfo>): void {
    result.error(makeNotImplementedError('waterMeterGetDeviceInfo'));
  }

  waterMeterIsSupportFunction(_featureValue: string, _lockFunction: number): boolean {
    return false;
  }

  waterMeterConfigApn(_apn: string, result: Result<void>): void {
    result.error(makeNotImplementedError('waterMeterConfigApn'));
  }

  waterMeterConfigMeterServer(_ip: string, _port: string, result: Result<void>): void {
    result.error(makeNotImplementedError('waterMeterConfigMeterServer'));
  }

  waterMeterReset(waterMeterId: string, result: Result<void>): void {
    TTWaterMeter.waterMeterEnterUpgradeMode(waterMeterId, {
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

  electricMeterInit(params: Map<string, Object>, result: Result<TTElectricMeterInitResult>): void {
    let mac: string;
    let payMode: string;
    let price: string;
    let electricMeterId: string;
    try {
      electricMeterId = mapStringValue(params, 'number');
      mac = mapStringValue(params, 'mac');
      payMode = mapStringValue(params, 'payMode');
      price = mapStringValue(params, 'price');
    } catch (e) {
      result.error(e as Error);
      return;
    }
    const model: AddElectricMeterModel = {
      number: electricMeterId,
      mac: mac,
      payMode: payMode,
      price: price,
    };
    TTElectricMeter.addElectricMeter(model, {
      success: (_: void): void => {
        result.success(new TTElectricMeterInitResult(electricMeterId, undefined));
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterInit', err));
      },
    });
  }

  electricMeterDelete(electricMeterId: string, result: Result<void>): void {
    TTElectricMeter.deleteElectricMeter(electricMeterId, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterDelete', err));
      },
    });
  }

  electricMeterSetPowerOnOff(electricMeterId: string, isOn: boolean, result: Result<void>): void {
    TTElectricMeter.setPower(electricMeterId, isOn, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterSetPowerOnOff', err));
      },
    });
  }

  electricMeterSetRemainderKwh(electricMeterId: string, remainderKwh: number,
    result: Result<void>): void {
    TTElectricMeter.setRemainingElectricity(electricMeterId, `${remainderKwh}`, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterSetRemainderKwh', err));
      },
    });
  }

  electricMeterClearRemainderKwh(electricMeterId: string, result: Result<void>): void {
    TTElectricMeter.clearRemainingElectricity(electricMeterId, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterClearRemainderKwh', err));
      },
    });
  }

  electricMeterReadData(electricMeterId: string, result: Result<Map<string, Object>>): void {
    TTElectricMeter.readData(electricMeterId, {
      success: (model: ElectricMeterStatusModel): void => {
        result.success(electricMeterStatusToMap(model));
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterReadData', err));
      },
    });
  }

  electricMeterSetPayMode(electricMeterId: string, payMode: number, result: Result<void>): void {
    TTElectricMeter.setPayMode(electricMeterId, payMode, '0', {
      success: (_: ElectricMeterStatusModel): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterSetPayMode', err));
      },
    });
  }

  electricMeterCharge(electricMeterId: string, amount: number, result: Result<void>): void {
    const amountStr = `${amount}`;
    TTElectricMeter.recharge(electricMeterId, amountStr, amountStr, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterCharge', err));
      },
    });
  }

  electricMeterSetMaxPower(electricMeterId: string, maxPower: number, result: Result<void>): void {
    TTElectricMeter.setMaxPower(electricMeterId, maxPower, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterSetMaxPower', err));
      },
    });
  }

  electricMeterGetFeatureValue(electricMeterId: string, result: Result<string>): void {
    TTElectricMeter.getFeatureValue(electricMeterId, {
      success: (fv: string): void => {
        result.success(fv);
      },
      failure: (err: SNError): void => {
        result.error(makeElectricMeterApiError('electricMeterGetFeatureValue', err));
      },
    });
  }

  electricMeterIsSupportFunction(_featureValue: string, _lockFunction: number): boolean {
    return false;
  }
}
