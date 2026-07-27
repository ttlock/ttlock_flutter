import {
  AccessoryElectricQuantityResult,
  AutoLockingTime,
  CameraLockWifiResult,
  ControlLockResult,
  Result,
  TTBluetoothState,
  TTControlAction,
  TTFingerprintModel,
  TTICCardModel,
  TTIpSetting,
  TTIpSettingType,
  TTLiftWorkActivateType,
  TTLockConfig,
  TTLockDirection,
  TTLockFunction,
  TTLockHostApi,
  TTLockInitParams,
  TTLockSwitchState,
  TTLockScanWifiEventParam,
  TTLockCredentialEventParam,
  TTLockSystemModel,
  TTLockVersion,
  TTOperateRecordType,
  TTPasscodeModel,
  TTPasscodeType,
  TTPalmVeinModel,
  TTPassageModeType,
  TTPassageModeModel,
  TTPowerSaverWorkType,
  TTRemoteAccessory,
  TTSensitivityValue,
  TTSoundVolumeType,
  TTWifiInfoModel,
  TTCycleModel,
  TTAliasType,
} from './Messages';

import {
  bluetoothStateRevert,
  controlActionConvert,
  featureValueConvert,
  liftWorkActivateTypeConvert,
  lockConfigConvert,
  lockDirectionConvert,
  operateLogTypeConvert,
  passageModeTypeConvert,
  passcodeTypeConvert,
  powerSaverWorkModeConvert,
  remoteAccessoryConvert,
  sensitivityValueConvert,
  sensitivityValueRevert,
  soundVolumeConvert,
  soundVolumeRevert,
  lockSwitchStateRevert,
  defaultLanguage,
} from './EnumConverter';

import {
  cycleListToConfig,
  makeInvalidValueError,
  makeLockApiError,
  makeNotImplementedError,
  parseJsonArrayString,
  mapStringValue,
  mapNumberValue,
  mapOptionalNumberValue,
  EventContextStore,
  TTResultBridge,
} from './TtlockPremiseSupport';

import HashMap from '@ohos.util.HashMap';
import {
  TTLock,
  IInitLockModel,
  ITTControlModel,
  ITTSwitchState,
  ITTAudioModel,
  ITTPeriodicTime,
  ITTPublicSwitchModel,
  ITTLockWifiInfoModel,
  ITTLockCyclicConfig,
  CameraLockInfo,
  SNError,
  TTSensitivityValue as SdkTTSensitivityValue,
} from '@sciener/ttlock';

interface LockVersionJson {
  protocolType: number;
  protocolVersion: number;
  scene: number;
  groupId: number;
  orgId: number;
}

function lockVersionToJsonString(version: TTLockVersion | undefined): string | null {
  if (version === undefined) {
    return null;
  }
  const obj: LockVersionJson = {
    protocolType: version.getProtocolType() ?? 0,
    protocolVersion: version.getProtocolVersion() ?? 0,
    scene: version.getScene() ?? 0,
    groupId: version.getGroupId() ?? 0,
    orgId: version.getOrgId() ?? 0,
  };
  try {
    return JSON.stringify(obj);
  } catch (_e) {
    return null;
  }
}

function hashMapToMap(map: HashMap<string, Object>): Map<string, Object> {
  const out = new Map<string, Object>();
  map.forEach((value?: Object, key?: string) => {
    if (value !== undefined && key !== undefined) {
      out.set(key, value);
    }
  });
  return out;
}

/**
 * `TTLockHostApi` 的 OpenHarmony 实现：包装 `@sciener/ttlock` 提供的静态方法，
 * 将 SDK 的 `ITTLockResult<T>` 适配到 Pigeon 的 `Result<T>`。
 *
 * 不存在等价 OHOS API 的接口（升降梯、节能锁、NB 服务器等）通过
 * `makeNotImplementedError` 返回，与 iOS 一致。
 */
export class LockHostApiImpl extends TTLockHostApi {
  setLockScanWifiParam(param: TTLockScanWifiEventParam): void {
    const lockData = param.getLockData();
    if (lockData !== undefined && lockData.length > 0) {
      EventContextStore.shared.lockScanWifi.lockData = lockData;
    }
  }

  setLockAddCardParam(param: TTLockCredentialEventParam): void {
    EventContextStore.shared.lockAddCard.apply(param);
  }

  setLockAddFingerprintParam(param: TTLockCredentialEventParam): void {
    EventContextStore.shared.lockAddFingerprint.apply(param);
  }

  setLockAddFaceParam(param: TTLockCredentialEventParam): void {
    EventContextStore.shared.lockAddFace.apply(param);
  }

  setLockAddPalmVeinParam(param: TTLockCredentialEventParam): void {
    EventContextStore.shared.lockAddPalmVein.apply(param);
  }

  getBluetoothState(): TTBluetoothState {
    const state: number = TTLock.getState() as number;
    return bluetoothStateRevert(state);
  }

  initLock(params: TTLockInitParams, result: Result<string>): void {
    const lockMac: string | undefined = params.getLockMac();
    if (lockMac === undefined) {
      result.error(makeLockApiError('initLock', SNError.invalidParam(), '`lockMac` is required'));
      return;
    }
    const config: IInitLockModel = {
      mac: lockMac,
      lockVersion: lockVersionToJsonString(params.getLockVersion()),
      clientPara: params.getClientPara() ?? null,
    };
    const callback = new TTResultBridge<string>(
      (lockData: string): void => {
        const hotelInfo: string | undefined = params.getHotelInfo();
        const buildingNumber: number | undefined = params.getBuildingNumber();
        const floorNumber: number | undefined = params.getFloorNumber();
        if (hotelInfo !== undefined && hotelInfo.length > 0) {
          TTLock.setHotelDataWithHotelInfo(
            lockData,
            hotelInfo,
            buildingNumber ?? 0,
            floorNumber ?? 0,
            new TTResultBridge<void>(
              (_: void): void => {
                result.success(lockData);
              },
              (_e: SNError): void => {
                result.success(lockData);
              },
            ),
          );
        } else {
          result.success(lockData);
        }
      },
      (err: SNError): void => {
        result.error(makeLockApiError('initLock', err));
      },
    );
    TTLock.initLock(config, callback);
  }

  resetLock(lockData: string, result: Result<void>): void {
    TTLock.resetLock(lockData, new TTResultBridge<void>(
      (_: void): void => {
        result.success(undefined);
      },
      (err: SNError): void => {
        result.error(makeLockApiError('resetLock', err));
      },
    ));
  }

  resetEkey(lockData: string, result: Result<string>): void {
    TTLock.resetEKey(lockData, new TTResultBridge<string>(
      (newLockData: string): void => {
        result.success(newLockData);
      },
      (err: SNError): void => {
        result.error(makeLockApiError('resetEkey', err));
      },
    ));
  }

  resetLockByCode(lockMac: string, resetCode: string, result: Result<void>): void {
    TTLock.resetLockByCode(resetCode, lockMac, new TTResultBridge<void>(
      (_: void): void => {
        result.success(undefined);
      },
      (err: SNError): void => {
        result.error(makeLockApiError('resetLockByCode', err));
      },
    ));
  }

  verifyLock(lockMac: string, result: Result<void>): void {
    result.error(makeNotImplementedError('verifyLock'));
  }

  controlLock(lockData: string, action: TTControlAction, result: Result<ControlLockResult>): void {
    TTLock.controlLockWithControlAction(lockData, controlActionConvert(action), new TTResultBridge<ITTControlModel>(
      (model: ITTControlModel): void => {
        const out = new ControlLockResult(
          model.lockTime,
          model.electricQuantity,
          model.uniqueId,
          undefined,
        );
        result.success(out);
      },
      (err: SNError): void => {
        result.error(makeLockApiError('controlLock', err));
      },
    ));
  }

  getLockSwitchState(lockData: string, result: Result<TTLockSwitchState>): void {
    TTLock.getLockSwitchState(lockData, new TTResultBridge<ITTSwitchState>(
      (state: ITTSwitchState): void => {
        result.success(lockSwitchStateRevert(state.lockSwitchState) ?? TTLockSwitchState.UNKNOW);
      },
      (err: SNError): void => {
        result.error(makeLockApiError('getLockSwitchState', err));
      },
    ));
  }

  supportFunction(lockFunction: TTLockFunction, lockData: string): boolean {
    if (lockData.length === 0) {
      return false;
    }
    const feature = featureValueConvert(lockFunction);
    if (feature === null) {
      return false;
    }
    return TTLock.supportFunction(lockData, feature!);
  }

  createCustomPasscode(passcode: string, startDate: number, endDate: number,
    lockData: string, result: Result<void>): void {
    TTLock.createCustomPasscode(lockData, passcode, startDate, endDate, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('createCustomPasscode', err));
      },
    });
  }

  modifyPasscode(passcodeOrigin: string, passcodeNew: string, startDate: number,
    endDate: number, lockData: string, result: Result<void>): void {
    TTLock.modifyPasscode(lockData, passcodeOrigin, passcodeNew, startDate, endDate, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('modifyPasscode', err));
      },
    });
  }

  deletePasscode(passcode: string, lockData: string, result: Result<void>): void {
    TTLock.deletePasscode(lockData, passcode, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('deletePasscode', err));
      },
    });
  }

  resetPasscode(lockData: string, result: Result<string>): void {
    TTLock.resetPasscodes(lockData, {
      success: (newLockData: string): void => {
        result.success(newLockData);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('resetPasscode', err));
      },
    });
  }

  getAdminPasscode(lockData: string, result: Result<string>): void {
    TTLock.getAdminPasscode(lockData, {
      success: (adminPasscode: string): void => {
        result.success(adminPasscode);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getAdminPasscode', err));
      },
    });
  }

  setErasePasscode(_erasePasscode: string, _lockData: string): void {
    throw makeNotImplementedError('setErasePasscode');
  }

  getAllValidPasscodes(lockData: string, result: Result<Array<TTPasscodeModel>>): void {
    TTLock.getAllValidPasscodes(lockData, {
      success: (json: string): void => {
        try {
          const arr = parseJsonArrayString(json);
          const out: Array<TTPasscodeModel> = [];
          for (const item of arr) {
            out.push(new TTPasscodeModel(
              mapStringValue(item, 'keyboardPwd'),
              mapStringValue(item, 'newKeyboardPwd'),
              mapNumberValue(item, 'startDate'),
              mapNumberValue(item, 'endDate'),
              mapNumberValue(item, 'keyboardPwdType'),
              mapOptionalNumberValue(item, 'cycleType'),
            ));
          }
          result.success(out);
        } catch (e) {
          result.error(e as Error);
        }
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getAllValidPasscodes', err));
      },
    });
  }

  recoverPasscode(passcode: string, passcodeNew: string, type: TTPasscodeType,
    startDate: number, endDate: number, cycleType: number, lockData: string,
    result: Result<void>): void {
    TTLock.recoverPasscode(
      lockData,
      passcodeTypeConvert(type),
      passcode,
      passcodeNew,
      startDate,
      endDate,
      cycleType,
      {
        success: (_: void): void => {
          result.success(undefined);
        },
        failure: (err: SNError): void => {
          result.error(makeLockApiError('recoverPasscode', err));
        },
      },
    );
  }

  modifyAdminPasscode(adminPasscode: string, lockData: string, result: Result<string>): void {
    TTLock.modifyAdminPasscode(lockData, adminPasscode, {
      success: (_: void): void => {
        result.success(adminPasscode);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('modifyAdminPasscode', err));
      },
    });
  }

  getPasscodeVerificationParams(_lockData: string, result: Result<string>): void {
    result.error(makeNotImplementedError('getPasscodeVerificationParams'));
  }

  modifyCardValidityPeriod(cardNumber: string, cycleList: Array<TTCycleModel>,
    startDate: number, endDate: number, lockData: string, result: Result<void>): void {
    const cyclic: ITTLockCyclicConfig[] | null = cycleListToConfig(cycleList) as ITTLockCyclicConfig[] | null;
    TTLock.modifyICCard(lockData, cardNumber, startDate, endDate, cyclic, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('modifyCardValidityPeriod', err));
      },
    });
  }

  deleteCard(cardNumber: string, lockData: string, result: Result<void>): void {
    TTLock.deleteICCard(lockData, cardNumber, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('deleteCard', err));
      },
    });
  }

  getAllValidCards(lockData: string, result: Result<Array<TTICCardModel>>): void {
    TTLock.getAllValidICCard(lockData, {
      success: (json: string): void => {
        try {
          const arr = parseJsonArrayString(json);
          const out: Array<TTICCardModel> = [];
          for (const item of arr) {
            out.push(new TTICCardModel(
              mapStringValue(item, 'cardNumber'),
              mapNumberValue(item, 'startDate'),
              mapNumberValue(item, 'endDate'),
            ));
          }
          result.success(out);
        } catch (e) {
          result.error(e as Error);
        }
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getAllValidCards', err));
      },
    });
  }

  clearAllCards(lockData: string, result: Result<void>): void {
    TTLock.clearAllICCard(lockData, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('clearAllCards', err));
      },
    });
  }

  recoverCard(cardNumber: string, startDate: number, endDate: number, lockData: string,
    result: Result<void>): void {
    TTLock.recoverICCard(lockData, cardNumber, startDate, endDate, null, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('recoverCard', err));
      },
    });
  }

  reportLossCard(_cardNumber: string, _lockData: string, result: Result<void>): void {
    result.error(makeNotImplementedError('reportLossCard'));
  }

  modifyFingerprintValidityPeriod(fingerprintNumber: string, cycleList: Array<TTCycleModel>,
    startDate: number, endDate: number, lockData: string, result: Result<void>): void {
    const cyclic: ITTLockCyclicConfig[] | null = cycleListToConfig(cycleList) as ITTLockCyclicConfig[] | null;
    TTLock.modifyFingerprint(lockData, fingerprintNumber, startDate, endDate, cyclic, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('modifyFingerprintValidityPeriod', err));
      },
    });
  }

  deleteFingerprint(fingerprintNumber: string, lockData: string, result: Result<void>): void {
    TTLock.deleteFingerprint(lockData, fingerprintNumber, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('deleteFingerprint', err));
      },
    });
  }

  getAllValidFingerprints(lockData: string, result: Result<Array<TTFingerprintModel>>): void {
    TTLock.getAllValidFingerprints(lockData, {
      success: (json: string): void => {
        try {
          const arr = parseJsonArrayString(json);
          const out: Array<TTFingerprintModel> = [];
          for (const item of arr) {
            out.push(new TTFingerprintModel(
              mapStringValue(item, 'fingerprintNumber'),
              mapNumberValue(item, 'startDate'),
              mapNumberValue(item, 'endDate'),
            ));
          }
          result.success(out);
        } catch (e) {
          result.error(e as Error);
        }
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getAllValidFingerprints', err));
      },
    });
  }

  clearAllFingerprints(lockData: string, result: Result<void>): void {
    TTLock.clearAllFingerprint(lockData, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('clearAllFingerprints', err));
      },
    });
  }

  modifyFace(faceNumber: string, cycleList: Array<TTCycleModel>, startDate: number,
    endDate: number, lockData: string, result: Result<void>): void {
    const cyclic: ITTLockCyclicConfig[] | null = cycleListToConfig(cycleList) as ITTLockCyclicConfig[] | null;
    TTLock.modifyFace(lockData, faceNumber, startDate, endDate, cyclic, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('modifyFace', err));
      },
    });
  }

  addFaceData(cycleList: Array<TTCycleModel>, startDate: number, endDate: number,
    faceFeatureData: string, lockData: string, result: Result<string>): void {
    const cyclic: ITTLockCyclicConfig[] | null = cycleListToConfig(cycleList) as ITTLockCyclicConfig[] | null;
    TTLock.addFaceFeatureData(lockData, faceFeatureData, startDate, endDate, cyclic, {
      success: (faceNumber: string): void => {
        result.success(faceNumber);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('addFaceData', err));
      },
    });
  }

  addFaceUrl(url: string, cycleList: Array<TTCycleModel> | undefined, startDate: number, endDate: number,
    lockData: string, result: Result<string>): void {
    result.error(makeNotImplementedError('addFaceUrl'));
  }

  setAlias(type: TTAliasType, credentialId: string, alias: string, lockData: string,
    result: Result<void>): void {
    result.error(makeNotImplementedError('setAlias'));
  }

  deleteFace(faceNumber: string, lockData: string, result: Result<void>): void {
    TTLock.deleteFace(lockData, faceNumber, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('deleteFace', err));
      },
    });
  }

  clearFace(lockData: string, result: Result<void>): void {
    TTLock.clearFace(lockData, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('clearFace', err));
      },
    });
  }

  modifyPalmVein(
    palmVeinNumber: string,
    cycleList: Array<TTCycleModel>,
    startDate: number,
    endDate: number,
    lockData: string,
    result: Result<void>,
  ): void {
    const cyclic: ITTLockCyclicConfig[] | null = cycleListToConfig(cycleList) as ITTLockCyclicConfig[] | null;
    TTLock.modifyPalmVein(lockData, palmVeinNumber, startDate, endDate, cyclic, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('modifyPalmVein', err));
      },
    });
  }

  deletePalmVein(palmVeinNumber: string, lockData: string, result: Result<void>): void {
    TTLock.deletePalmVein(lockData, palmVeinNumber, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('deletePalmVein', err));
      },
    });
  }

  clearPalmVein(lockData: string, result: Result<void>): void {
    TTLock.clearPalmVein(lockData, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('clearPalmVein', err));
      },
    });
  }

  getAllValidPalmVeins(lockData: string, result: Result<Array<TTPalmVeinModel>>): void {
    TTLock.getAllValidPalmVein(lockData, {
      success: (json: string): void => {
        try {
          const arr = parseJsonArrayString(json);
          const out: Array<TTPalmVeinModel> = [];
          for (const item of arr) {
            out.push(new TTPalmVeinModel(
              mapStringValue(item, 'palmVeinNumber'),
              mapNumberValue(item, 'startDate'),
              mapNumberValue(item, 'endDate'),
            ));
          }
          result.success(out);
        } catch (e) {
          result.error(e as Error);
        }
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getAllValidPalmVeins', err));
      },
    });
  }

  setMotorTorqueLevel(torqueLevel: number, lockData: string, result: Result<void>): void {
    TTLock.setMotorTorqueLevel(lockData, torqueLevel, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setMotorTorqueLevel', err));
      },
    });
  }

  setLockLatchBolt(keepTime: number, lockData: string, result: Result<void>): void {
    // 与 Android 对齐：isControl=true，driveLevel 使用 SDK 默认值（-1）。
    TTLock.setLatchBolt(lockData, true, keepTime, -1, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setLockLatchBolt', err));
      },
    });
  }

  setLockTime(timestamp: number, lockData: string, result: Result<void>): void {
    TTLock.timeCalibration(lockData, timestamp, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setLockTime', err));
      },
    });
  }

  getLockTime(lockData: string, result: Result<number>): void {
    TTLock.getLockTime(lockData, {
      success: (timestamp: number): void => {
        result.success(timestamp);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLockTime', err));
      },
    });
  }

  setLockWorkingTime(_startDate: number, _endDate: number, _lockData: string,
    result: Result<void>): void {
    result.error(makeNotImplementedError('setLockWorkingTime'));
  }

  getLockOperateRecord(type: TTOperateRecordType, lockData: string, result: Result<string>): void {
    TTLock.getOperationLog(lockData, operateLogTypeConvert(type), {
      success: (records: string): void => {
        result.success(records);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLockOperateRecord', err));
      },
    });
  }

  getLockPower(lockData: string, result: Result<number>): void {
    TTLock.getElectricQuantity(lockData, {
      success: (eq: number): void => {
        result.success(eq);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLockPower', err));
      },
    });
  }

  getLockSystemInfo(lockData: string, result: Result<TTLockSystemModel>): void {
    TTLock.getLockSystemInfo(lockData, {
      success: (info: Map<string, Object>): void => {
        const get = (key: string): string | undefined => {
          const v = info.get(key);
          if (v === undefined || v === null) return undefined;
          return typeof v === 'string' ? (v as string) : `${v}`;
        };
        const getNum = (key: string): number | undefined => {
          const v = info.get(key);
          if (v === undefined || v === null) return undefined;
          if (typeof v === 'number') return v as number;
          if (typeof v === 'string') {
            const n = Number(v);
            return Number.isNaN(n) ? undefined : n;
          }
          return undefined;
        };
        const out = new TTLockSystemModel(
          get('modelNum'),
          get('hardwareRevision'),
          get('firmwareRevision'),
          getNum('electricQuantity'),
          get('nbOperator'),
          get('nbNodeId'),
          get('nbCardNumber'),
          get('nbRssi'),
          lockData,
        );
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLockSystemInfo', err));
      },
    });
  }

  getLockFeatureValue(lockData: string, result: Result<string>): void {
    TTLock.getLockFeature(lockData, {
      success: (feature: string): void => {
        result.success(feature);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLockFeatureValue', err));
      },
    });
  }

  getAutoLockingPeriodicTime(lockData: string, result: Result<AutoLockingTime>): void {
    TTLock.getAutomaticLockingPeriodicTime(lockData, {
      success: (model: ITTPeriodicTime): void => {
        const out = new AutoLockingTime(model.currentTime, model.minTime, model.maxTime);
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getAutoLockingPeriodicTime', err));
      },
    });
  }

  setAutoLockingPeriodicTime(seconds: number, lockData: string, result: Result<void>): void {
    TTLock.setAutomaticLockingPeriodicTime(lockData, seconds, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setAutoLockingPeriodicTime', err));
      },
    });
  }

  getRemoteUnlockSwitchState(lockData: string, result: Result<boolean>): void {
    TTLock.getRemoteUnlockSwitch(lockData, {
      success: (isOn: boolean): void => {
        result.success(isOn);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getRemoteUnlockSwitchState', err));
      },
    });
  }

  setRemoteUnlockSwitchState(isOn: boolean, lockData: string, result: Result<string>): void {
    TTLock.setRemoteUnlockSwitch(lockData, isOn, {
      success: (newLockData: string): void => {
        result.success(newLockData);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setRemoteUnlockSwitchState', err));
      },
    });
  }

  getLockConfig(config: TTLockConfig, lockData: string, result: Result<boolean>): void {
    const sdkConfig = lockConfigConvert(config);
    if (sdkConfig === null) {
      result.error(makeInvalidValueError(`锁配置 ${config} 在 OpenHarmony SDK 中无对应项`));
      return;
    }
    TTLock.getLockConfigWithType(lockData, sdkConfig, {
      success: (model: ITTPublicSwitchModel): void => {
        result.success(model.isOn);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLockConfig', err));
      },
    });
  }

  setLockConfig(config: TTLockConfig, isOn: boolean, lockData: string, result: Result<void>): void {
    const sdkConfig = lockConfigConvert(config);
    if (sdkConfig === null) {
      result.error(makeInvalidValueError(`锁配置 ${config} 在 OpenHarmony SDK 中无对应项`));
      return;
    }
    TTLock.setLockConfigWithType(lockData, isOn, sdkConfig, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setLockConfig', err));
      },
    });
  }

  getLightTime(lockData: string, result: Result<number>): void {
    TTLock.getLightTime(lockData, {
      success: (seconds: number): void => {
        result.success(seconds);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLightTime', err));
      },
    });
  }

  setLightTime(seconds: number, lockData: string, result: Result<void>): void {
    TTLock.setLightTime(lockData, seconds, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setLightTime', err));
      },
    });
  }

  getLockDirection(lockData: string, result: Result<TTLockDirection>): void {
    TTLock.getUnlockDirection(lockData, {
      success: (model: ITTPublicSwitchModel): void => {
        // OHOS SDK 把方向开关包在 ITTPublicSwitchModel 里：isOn=true 表示左开。
        result.success(model.isOn ? TTLockDirection.LEFT : TTLockDirection.RIGHT);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLockDirection', err));
      },
    });
  }

  setLockDirection(direction: TTLockDirection, lockData: string, result: Result<void>): void {
    TTLock.setUnlockDirection(lockData, lockDirectionConvert(direction), {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setLockDirection', err));
      },
    });
  }

  addPassageMode(type: TTPassageModeType, weekly: Array<number>, monthly: Array<number>,
    startTime: number, endTime: number, lockData: string, result: Result<void>): void {
    const days = type === TTPassageModeType.WEEKLY ? weekly : monthly;
    TTLock.setPassageMode(lockData, passageModeTypeConvert(type), days, startTime, endTime, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('addPassageMode', err));
      },
    });
  }

  clearAllPassageModes(lockData: string, result: Result<void>): void {
    TTLock.clearPassageMode(lockData, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('clearAllPassageModes', err));
      },
    });
  }

  getPassageModes(lockData: string, result: Result<Array<TTPassageModeModel>>): void {
    TTLock.getPassageMode(lockData, {
      success: (json: string): void => {
        try {
          const arr = parseJsonArrayString(json);
          const out: Array<TTPassageModeModel> = [];
          for (const item of arr) {
            const modeType = mapNumberValue(item, 'modeType');
            const type = modeType === 1 ? TTPassageModeType.WEEKLY : TTPassageModeType.MONTHLY;
            const repeatRaw = item.get('repeatList');
            let weekly: Array<number> | undefined = undefined;
            if (Array.isArray(repeatRaw)) {
              weekly = [];
              for (const v of repeatRaw as Object[]) {
                if (typeof v === 'number') {
                  weekly.push(v);
                }
              }
            }
            out.push(new TTPassageModeModel(
              type,
              mapNumberValue(item, 'startDate'),
              mapNumberValue(item, 'endDate'),
              weekly,
              undefined,
            ));
          }
          result.success(out);
        } catch (_e) {
          result.success([]);
        }
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getPassageModes', err));
      },
    });
  }

  activateLift(floors: string, lockData: string, result: Result<ControlLockResult>): void {
    const floorList: Array<number> = [];
    for (const raw of floors.split(',')) {
      const item = raw.trim();
      if (item.length === 0) {
        continue;
      }
      const floor = Number(item);
      if (!Number.isNaN(floor)) {
        floorList.push(floor);
      }
    }
    if (floorList.length === 0) {
      result.error(makeLockApiError('activateLift', SNError.invalidParam(), `Invalid floors: ${floors}`));
      return;
    }
    const normalizedFloors = floorList.join(',');
    TTLock.activateHotelLiftFloors(lockData, normalizedFloors, {
      success: (model: ITTControlModel): void => {
        const out = new ControlLockResult(
          model.lockTime,
          model.electricQuantity,
          model.uniqueId,
          undefined,
        );
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('activateLift', err));
      },
    });
  }

  setLiftControlable(floors: string, lockData: string, result: Result<void>): void {
    TTLock.setLiftControllableFloors(lockData, floors, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setLiftControlable', err));
      },
    });
  }

  setLiftWorkMode(type: TTLiftWorkActivateType, lockData: string, result: Result<void>): void {
    TTLock.setLiftWorkMode(lockData, liftWorkActivateTypeConvert(type), {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setLiftWorkMode', err));
      },
    });
  }

  setPowerSaverWorkMode(type: TTPowerSaverWorkType, lockData: string, result: Result<void>): void {
    TTLock.setPowerSaverWorkMode(lockData, powerSaverWorkModeConvert(type), {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setPowerSaverWorkMode', err));
      },
    });
  }

  setPowerSaverControlableLock(lockMac: string, lockData: string, result: Result<void>): void {
    TTLock.setPowerSaverControllableLock(lockData, lockMac, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setPowerSaverControlableLock', err));
      },
    });
  }

  setHotel(hotelInfo: string, buildingNumber: number, floorNumber: number, lockData: string,
    result: Result<void>): void {
    TTLock.setHotelDataWithHotelInfo(lockData, hotelInfo, buildingNumber, floorNumber, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setHotel', err));
      },
    });
  }

  setHotelCardSector(sector: string, lockData: string, result: Result<void>): void {
    TTLock.setHotelCardSector(lockData, sector, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setHotelCardSector', err));
      },
    });
  }

  getLockVersion(lockMac: string, result: Result<TTLockVersion>): void {
    TTLock.getLockVersion(lockMac, {
      success: (info: Map<string, Object>): void => {
        const num = (key: string): number => {
          const v = info.get(key);
          if (typeof v === 'number') return v as number;
          if (typeof v === 'string') {
            const n = Number(v);
            return Number.isNaN(n) ? 0 : n;
          }
          return 0;
        };
        const out = new TTLockVersion(
          num('protocolType'),
          num('protocolVersion'),
          num('scene'),
          num('groupId'),
          num('orgId'),
        );
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getLockVersion', err));
      },
    });
  }

  setNBServerAddress(_ip: string, _port: string, _lockData: string, result: Result<number>): void {
    result.error(makeNotImplementedError('setNBServerAddress'));
  }

  configWifi(wifiName: string, wifiPassword: string, lockData: string, result: Result<void>): void {
    TTLock.lockConfigWifi(lockData, wifiName, wifiPassword, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('configWifi', err));
      },
    });
  }

  configServer(ip: string, port: string, lockData: string, result: Result<void>): void {
    const portNum: number = Number(port);
    if (Number.isNaN(portNum)) {
      result.error(makeLockApiError('configServer', SNError.invalidParam(),
        `Invalid port: ${port}`));
      return;
    }
    TTLock.configLockServer(lockData, ip, portNum, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('configServer', err));
      },
    });
  }

  getWifiInfo(lockData: string, result: Result<TTWifiInfoModel>): void {
    TTLock.getLockWifiInfo(lockData, {
      success: (info: ITTLockWifiInfoModel): void => {
        const out = new TTWifiInfoModel(info.mac, info.rssi);
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getWifiInfo', err));
      },
    });
  }

  configIp(ipSetting: TTIpSetting, lockData: string, result: Result<void>): void {
    const auto: boolean = ipSetting.getType() === TTIpSettingType.DHCP;
    TTLock.configLockIP(
      lockData,
      auto,
      {
        success: (_: void): void => {
          result.success(undefined);
        },
        failure: (err: SNError): void => {
          result.error(makeLockApiError('configIp', err));
        },
      },
      ipSetting.getIpAddress(),
      ipSetting.getSubnetMask(),
      ipSetting.getRouter(),
      ipSetting.getPreferredDns(),
      ipSetting.getAlternateDns(),
    );
  }

  configCameraLockWifi(wifiName: string, wifiPassword: string, lockData: string,
    result: Result<CameraLockWifiResult>): void {
    // SDK v1.0.6 该接口第 4 个参数为 string 预留字段，传空串与 Android 行为保持一致。
    TTLock.cameraLockConfigWifi(lockData, wifiName, wifiPassword, '', {
      success: (info: CameraLockInfo): void => {
        try {
          const payload = JSON.stringify(info);
          const arr = parseJsonArrayString(`[${payload}]`);
          if (arr.length > 0) {
            const serial = mapStringValue(arr[0], 'videoModuleSerialNumber');
            const wifiMac = mapStringValue(arr[0], 'wifiMac');
            result.success(new CameraLockWifiResult(serial, wifiMac));
            return;
          }
        } catch (_e) {
          // ignore and fallback
        }
        result.success(new CameraLockWifiResult('', ''));
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('configCameraLockWifi', err));
      },
    });
  }

  setSoundVolume(type: TTSoundVolumeType, lockData: string, result: Result<void>): void {
    TTLock.setLockSound(lockData, true, soundVolumeConvert(type), defaultLanguage(), {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setSoundVolume', err));
      },
    });
  }

  getSoundVolume(lockData: string, result: Result<TTSoundVolumeType>): void {
    TTLock.getLockSound(lockData, {
      success: (model: ITTAudioModel): void => {
        result.success(soundVolumeRevert(model.volume));
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getSoundVolume', err));
      },
    });
  }

  setSensitivity(value: TTSensitivityValue, lockData: string, result: Result<void>): void {
    TTLock.setSensitivity(lockData, sensitivityValueConvert(value), {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setSensitivity', err));
      },
    });
  }

  getSensitivity(lockData: string, result: Result<TTSensitivityValue>): void {
    TTLock.getSensitivity(lockData, {
      success: (value: SdkTTSensitivityValue): void => {
        result.success(sensitivityValueRevert(value));
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getSensitivity', err));
      },
    });
  }

  setRemoteKeyValidDate(remoteKeyMac: string, cycleList: Array<TTCycleModel>, startDate: number,
    endDate: number, lockData: string, result: Result<void>): void {
    const cyclic: ITTLockCyclicConfig[] | null = cycleListToConfig(cycleList) as ITTLockCyclicConfig[] | null;
    TTLock.modifyWirelessKey(remoteKeyMac, lockData, startDate, endDate, cyclic, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setRemoteKeyValidDate', err));
      },
    });
  }

  addRemoteKey(remoteKeyMac: string, cycleList: Array<TTCycleModel>, startDate: number,
    endDate: number, lockData: string, result: Result<void>): void {
    const cyclic: ITTLockCyclicConfig[] | null = cycleListToConfig(cycleList) as ITTLockCyclicConfig[] | null;
    TTLock.addWirelessKey(remoteKeyMac, lockData, startDate, endDate, cyclic, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('addRemoteKey', err));
      },
    });
  }

  deleteRemoteKey(remoteKeyMac: string, lockData: string, result: Result<void>): void {
    TTLock.deleteWirelessKey(remoteKeyMac, lockData, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('deleteRemoteKey', err));
      },
    });
  }

  clearRemoteKey(lockData: string, result: Result<void>): void {
    TTLock.clearWirelessKey(lockData, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('clearRemoteKey', err));
      },
    });
  }

  getRemoteAccessoryElectricQuantity(accessory: TTRemoteAccessory, mac: string, lockData: string,
    result: Result<AccessoryElectricQuantityResult>): void {
    const sdkAccessory = remoteAccessoryConvert(accessory);
    if (sdkAccessory === null) {
      result.error(makeInvalidValueError(`配件类型 ${accessory} 在 OpenHarmony SDK 中无对应项`));
      return;
    }
    TTLock.getAccessoryElectricQuantity(lockData, mac, sdkAccessory, {
      success: (info: HashMap<string, Object>): void => {
        const data = hashMapToMap(info);
        const eqRaw = data.get('electricQuantity');
        const updateRaw = data.get('updateDate');
        const eq: number = typeof eqRaw === 'number' ? (eqRaw as number) : 0;
        const upd: number = typeof updateRaw === 'number' ? (updateRaw as number) : 0;
        result.success(new AccessoryElectricQuantityResult(eq, upd));
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('getRemoteAccessoryElectricQuantity', err));
      },
    });
  }

  addDoorSensor(doorSensorMac: string, lockData: string, result: Result<void>): void {
    TTLock.initializeDoorMagnetic(doorSensorMac, lockData, {
      success: (_: HashMap<string, Object>): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('addDoorSensor', err));
      },
    });
  }

  deleteDoorSensor(lockData: string, result: Result<void>): void {
    TTLock.clearDoorMagnetic(lockData, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('deleteDoorSensor', err));
      },
    });
  }

  setDoorSensorAlertTime(alertTime: number, lockData: string, result: Result<void>): void {
    TTLock.setDoorMagneticAlertTime(lockData, alertTime, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeLockApiError('setDoorSensorAlertTime', err));
      },
    });
  }
}
