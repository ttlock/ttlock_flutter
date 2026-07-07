import {
  TTLock,
  SNError,
} from '@sciener/ttlock';
import {
  IGatewayModel,
  IGatewayConfigIpParameters,
  InitGatewayParameters,
} from '@sciener/ttlock/src/main/ets/TTLock/d/g/g';

import {
  GatewayDeviceInfo,
  Result,
  TTGatewayConnectStatus,
  TTGatewayHostApi,
  TTGatewayInitParams,
  TTGatewayType,
  TTIpSetting,
  TTIpSettingType,
} from './Messages';

import {
  EventContextStore,
  TTResultBridge,
  makeInvalidValueError,
  makeGatewayApiError,
} from './TtlockPremiseSupport';
import { gatewayConnectStatusRevert, gatewayTypeConvert } from './EnumConverter';

/**
 * `TTGatewayHostApi` 的 OpenHarmony 实现。底层全部走 `@sciener/ttlock` 的
 * `TTLock` 静态接口，与 iOS / Android 保持等价。
 *
 * networkMac 没有独立 SDK 接口，本实现复用 `gatewayInit` 返回的
 * `IGatewayModel.networkMac` 并缓存到 `EventContextStore`，供后续
 * `getNetworkMac` 调用读取。
 */
export class GatewayHostApiImpl extends TTGatewayHostApi {
  /** `gatewayInit` 返回的 networkMac；SDK 在 OpenHarmony 侧无独立接口复用。 */
  private networkMac: string | null = null;

  setGatewayGetNearbyWifiParam(gatewayMac: string): void {
    EventContextStore.shared.gatewayGetNearbyWifi.gatewayMac = gatewayMac;
  }

  connect(mac: string, result: Result<TTGatewayConnectStatus>): void {
    EventContextStore.shared.gatewayGetNearbyWifi.gatewayMac = mac;
    if (mac.length === 0) {
      result.error(makeInvalidValueError('mac is required'));
      return;
    }

    const bridge = new TTResultBridge<void>(
      (_: void): void => {
        result.success(TTGatewayConnectStatus.SUCCESS);
      },
      (err: SNError): void => {
        // OHOS SDK connectGateway 仅返回 void；将失败 errCode 归并为 TIMEOUT / FAILED。
        result.success(gatewayConnectStatusRevert(err.code));
      },
    );
    TTLock.connectGateway(mac, bridge);
  }

  disconnect(mac: string): void {
    TTLock.disConnectGateway(mac);
  }

  initGateway(params: TTGatewayInitParams, result: Result<GatewayDeviceInfo>): void {
    const uid: number | undefined = params.getTtlockUid();
    const userPwd: string | undefined = params.getTtlockLoginPassword();
    const gatewayName: string | undefined = params.getGatewayName();
    const gatewayType: TTGatewayType | undefined = params.getType();
    const portNumber: string | undefined = params.getServerPort();

    if (uid === undefined || userPwd === undefined || gatewayName === undefined ||
      gatewayType === undefined || portNumber === undefined) {
      result.error(makeInvalidValueError(
        '`ttlockUid`, `ttlockLoginPassword`, `gatewayName`, `type`, `serverPort` are required',
      ));
      return;
    }

    const portTrim = portNumber.trim();
    if (portTrim.length === 0 || !/^[0-9]+$/.test(portTrim)) {
      result.error(makeInvalidValueError('`serverPort` must be numeric'));
      return;
    }

    const needsWifi: boolean = gatewayType === TTGatewayType.G2 ||
      gatewayType === TTGatewayType.G5 ||
      gatewayType === TTGatewayType.G6;

    const wifi: string | undefined = params.getWifi();
    const wifiPwd: string | undefined = params.getWifiPassword();
    if (needsWifi && (wifi === undefined || wifi.trim().length === 0)) {
      result.error(makeInvalidValueError('`wifi` is required for this gateway type'));
      return;
    }
    if (needsWifi && (wifiPwd === undefined || wifiPwd.trim().length === 0)) {
      result.error(makeInvalidValueError('`wifiPassword` is required for this gateway type'));
      return;
    }

    const companyId: number | undefined = params.getCompanyId();
    const branchId: number | undefined = params.getBranchId();

    const model: InitGatewayParameters = {
      SSID: needsWifi ? (wifi ?? '1') : '1',
      wifiPwd: needsWifi ? (wifiPwd ?? '1') : '1',
      uid: `${uid}`,
      userPwd: userPwd,
      companyId: companyId !== undefined ? `${companyId}` : '0',
      branchId: branchId !== undefined ? `${branchId}` : '0',
      gatewayName: gatewayName,
      gatewayVersion: gatewayTypeConvert(gatewayType),
      serverAddress: params.getServerIp() ?? '',
      portNumber: portTrim,
    };

    const bridge = new TTResultBridge<IGatewayModel>(
      (info: IGatewayModel): void => {
        const cached: string | null = info.networkMac ?? null;
        this.networkMac = cached;
        result.success(new GatewayDeviceInfo(
          info.modelNum ?? '',
          info.hardwareRevision ?? '',
          info.firmwareRevision ?? '',
          cached ?? '',
        ));
      },
      (err: SNError): void => {
        result.error(makeGatewayApiError('initGateway', err));
      },
    );
    TTLock.gatewayInit(model, bridge);
  }

  configIp(_mac: string, ipSetting: TTIpSetting, result: Result<void>): void {
    const auto: boolean = ipSetting.getType() === TTIpSettingType.DHCP;
    const cfg: IGatewayConfigIpParameters = {
      auto: auto,
      ipAddress: ipSetting.getIpAddress() ?? '',
      subnetMask: ipSetting.getSubnetMask() ?? '',
      router: ipSetting.getRouter() ?? '',
      preferredDns: ipSetting.getPreferredDns() ?? '',
      alternateDns: ipSetting.getAlternateDns() ?? '',
    };
    TTLock.gatewayConfigIp(cfg, new TTResultBridge<void>(
      (_: void): void => {
        result.success(undefined);
      },
      (err: SNError): void => {
        result.error(makeGatewayApiError('configIp', err));
      },
    ));
  }

  configApn(_mac: string, apn: string, result: Result<void>): void {
    TTLock.gatewayConfigAPN(apn, new TTResultBridge<void>(
      (_: void): void => {
        result.success(undefined);
      },
      (err: SNError): void => {
        result.error(makeGatewayApiError('configApn', err));
      },
    ));
  }

  getNetworkMac(result: Result<string | undefined>): void {
    result.success(this.networkMac ?? undefined);
  }

  enterUpgradeMode(mac: string): void {
    // fire-and-forget：先连接再进入升级模式（与 iOS 保持一致）
    TTLock.connectGateway(mac, new TTResultBridge<void>(
      (_: void): void => {
        TTLock.upgradeGatewayMode(mac, new TTResultBridge<void>(
          (_unused: void): void => {},
          (_err: SNError): void => {},
        ));
      },
      (_err: SNError): void => {},
    ));
  }
}
