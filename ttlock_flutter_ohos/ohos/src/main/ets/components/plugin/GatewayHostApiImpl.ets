import {
  TTLock,
  SNError,
} from '@sciener/ttlock';
import {
  IGatewayModel,
  IGatewayConfigIpParameters,
  InitGatewayParameters,
} from '@sciener/ttlock/src/main/ets/e/f/i/i';

import {
  GatewayDeviceInfo,
  Result,
  TTGatewayConnectStatus,
  TTGatewayHostApi,
  TTGatewayInitParams,
  TTIpSetting,
  TTIpSettingType,
} from './Messages';

import {
  EventContextStore,
  makeGatewayApiError,
  makeNoGatewayError,
} from './TtlockPremiseSupport';

/**
 * `TTGatewayHostApi` 的 OpenHarmony 实现。底层全部走 `@sciener/ttlock` 的
 * `TTLock` 静态接口，与 iOS / Android 保持等价。
 *
 * networkMac 没有独立 SDK 接口，本实现复用 `gatewayInit` 返回的
 * `IGatewayModel.networkMac` 并缓存到 `EventContextStore`，供后续
 * `getNetworkMac` 调用读取。
 */
export class GatewayHostApiImpl extends TTGatewayHostApi {
  setEventGatewayMac(mac: string): void {
    EventContextStore.shared.gatewayMac = mac;
  }

  connect(mac: string, result: Result<TTGatewayConnectStatus>): void {
    EventContextStore.shared.gatewayMac = mac;
    TTLock.connectGateway(mac, {
      success: (_: void): void => {
        result.success(TTGatewayConnectStatus.SUCCESS);
      },
      failure: (err: SNError): void => {
        result.error(makeGatewayApiError('connectGateway', err));
      },
    });
  }

  disconnect(mac: string): void {
    TTLock.disConnectGateway(mac);
  }

  initGateway(params: TTGatewayInitParams, result: Result<GatewayDeviceInfo>): void {
    const wifi: string | undefined = params.getWifi();
    const wifiPwd: string | undefined = params.getWifiPassword();
    const uid: number | undefined = params.getTtlockUid();
    const userPwd: string | undefined = params.getTtlockLoginPassword();
    const gatewayName: string | undefined = params.getGatewayName();
    const gatewayVersion: number | undefined = params.getType();
    const portNumber: string | undefined = params.getServerPort();
    if (wifi === undefined || wifiPwd === undefined || uid === undefined ||
      userPwd === undefined || gatewayName === undefined ||
      gatewayVersion === undefined || portNumber === undefined) {
      result.error(makeGatewayApiError('initGateway', SNError.invalidParam(),
        '`wifi`, `wifiPassword`, `ttlockUid`, `ttlockLoginPassword`, `gatewayName`, `type`, `serverPort` are required'));
      return;
    }

    const companyId: number | undefined = params.getCompanyId();
    const branchId: number | undefined = params.getBranchId();

    const model: InitGatewayParameters = {
      SSID: wifi,
      wifiPwd: wifiPwd,
      uid: `${uid}`,
      userPwd: userPwd,
      companyId: companyId !== undefined ? `${companyId}` : undefined,
      branchId: branchId !== undefined ? `${branchId}` : undefined,
      gatewayName: gatewayName,
      gatewayVersion: gatewayVersion,
      serverAddress: params.getServerIp(),
      portNumber: portNumber,
    };

    TTLock.gatewayInit(model, {
      success: (info: IGatewayModel): void => {
        EventContextStore.shared.cachedNetworkMac = info.networkMac ?? null;
        const out = new GatewayDeviceInfo(
          info.modelNum,
          info.hardwareRevision,
          info.firmwareRevision,
          info.networkMac,
        );
        result.success(out);
      },
      failure: (err: SNError): void => {
        result.error(makeGatewayApiError('gatewayInit', err));
      },
    });
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
    TTLock.gatewayConfigIp(cfg, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeGatewayApiError('configIp', err));
      },
    });
  }

  configApn(_mac: string, apn: string, result: Result<void>): void {
    TTLock.gatewayConfigAPN(apn, {
      success: (_: void): void => {
        result.success(undefined);
      },
      failure: (err: SNError): void => {
        result.error(makeGatewayApiError('configApn', err));
      },
    });
  }

  getNetworkMac(result: Result<string>): void {
    const cached = EventContextStore.shared.cachedNetworkMac;
    if (cached === null) {
      result.error(makeNoGatewayError('getNetworkMac'));
      return;
    }
    result.success(cached);
  }

  enterUpgradeMode(mac: string): void {
    TTLock.connectGateway(mac, {
      success: (_: void): void => {
        TTLock.upgradeGatewayMode(mac, {
          success: (_unused: void): void => {
          },
          failure: (_err: SNError): void => {
          },
        });
      },
      failure: (_err: SNError): void => {
      },
    });
  }
}
