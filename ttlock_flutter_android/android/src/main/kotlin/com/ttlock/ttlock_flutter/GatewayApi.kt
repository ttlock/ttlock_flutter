package com.ttlock.ttlock_flutter

import android.content.Context
import com.ttlock.bl.sdk.api.ExtendedBluetoothDevice
import com.ttlock.bl.sdk.entity.IpSetting
import com.ttlock.bl.sdk.gateway.api.GatewayClient
import com.ttlock.bl.sdk.gateway.model.ConfigureGatewayInfo
import com.ttlock.bl.sdk.gateway.model.GatewayError
import com.ttlock.bl.sdk.util.DigitUtil
import io.flutter.plugin.common.BinaryMessenger

class GatewayApi : TTGatewayHostApi {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        TTGatewayHostApi.setUp(messenger, this)
    }

    companion object {
        /** 仅由 [setEventGatewayMac] 写入，供 gatewayGetNearbyWifi 等使用 */
        var latestGatewayMac: String? = null
    }

    override fun setEventGatewayMac(mac: String) {
        if (mac.isNotEmpty()) {
            latestGatewayMac = mac
        }
    }

    private fun gatewayErrorToFlutterError(gatewayError: GatewayError): FlutterError {
        return FlutterError(
            code = gatewayErrorRevert(gatewayError).raw.toString(),
            message = gatewayError.description,
            details = gatewayError.description
        )
    }

    override fun connect(
        mac: String,
        callback: (Result<TTGatewayConnectStatus>) -> Unit
    ) {
        GatewayClient.getDefault().connectGateway(mac, object : com.ttlock.bl.sdk.gateway.callback.ConnectCallback {
            override fun onConnectSuccess(device: ExtendedBluetoothDevice) {
                callback(Result.success(TTGatewayConnectStatus.SUCCESS))
            }

            override fun onDisconnected() {
                callback(Result.success(TTGatewayConnectStatus.TIMEOUT))
            }
        })
    }

    override fun disconnect(mac: String) {
        GatewayClient.getDefault().disconnectGateway()
    }

    override fun initGateway(
        params: TTGatewayInitParams,
        callback: (Result<GatewayDeviceInfo>) -> Unit
    ) {
        val info = ConfigureGatewayInfo()
        info.plugName = params.gatewayName
        info.plugVersion = params.type.toInt() + 1
        if (info.plugVersion == 2 || info.plugVersion == 5) {
            info.ssid = params.wifi
            info.wifiPwd = params.wifiPassword
        }
        info.uid = params.ttlockUid.toInt()
        info.userPwd = params.ttlockLoginPassword
        info.companyId = params.companyId?.toInt() ?: 0
        info.branchId = params.branchId?.toInt() ?: 0
        if (!params.serverIp.isNullOrEmpty()) {
            info.server = params.serverIp
        }
        if (!params.serverPort.isNullOrEmpty() && DigitUtil.isNumeric(params.serverPort)) {
            info.port = params.serverPort.toInt()
        }
        GatewayClient.getDefault().initGateway(info, object : com.ttlock.bl.sdk.gateway.callback.InitGatewayCallback {
            override fun onInitGatewaySuccess(deviceInfo: com.ttlock.bl.sdk.gateway.model.DeviceInfo) {
                callback(
                    Result.success(
                        GatewayDeviceInfo(
                            modelNum = deviceInfo.modelNum,
                            hardwareRevision = deviceInfo.hardwareRevision,
                            firmwareRevision = deviceInfo.firmwareRevision,
                            networkMac = deviceInfo.networkMac
                        )
                    )
                )
            }

            override fun onFail(error: com.ttlock.bl.sdk.gateway.model.GatewayError) {
                callback(Result.failure(gatewayErrorToFlutterError(error)))
            }
        })
    }

    override fun configIp(
        mac: String,
        ipSetting: TTIpSetting,
        callback: (Result<Unit>) -> Unit
    ) {
        if (mac.isEmpty()) {
            callback(Result.failure(FlutterError("missing_mac", "mac is required for configIp", null)))
            return
        }
        val setting = IpSetting()
        setting.type = ipSetting.type.toInt()
        setting.ipAddress = ipSetting.ipAddress
        setting.subnetMask = ipSetting.subnetMask
        setting.router = ipSetting.router
        setting.preferredDns = ipSetting.preferredDns
        setting.alternateDns = ipSetting.alternateDns
        GatewayClient.getDefault().configIp(mac, setting, object : com.ttlock.bl.sdk.gateway.callback.ConfigIpCallback {
            override fun onConfigIpSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: GatewayError) {
                callback(Result.failure(gatewayErrorToFlutterError(error)))
            }
        })
    }

    override fun configApn(
        mac: String,
        apn: String,
        callback: (Result<Unit>) -> Unit
    ) {
        GatewayClient.getDefault().configApn(mac, apn, object : com.ttlock.bl.sdk.gateway.callback.ConfigApnCallback {
            override fun onConfigSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.gateway.model.GatewayError) {
                callback(Result.failure(gatewayErrorToFlutterError(error)))
            }
        })
    }

    override fun getNetworkMac(callback: (Result<String?>) -> Unit) {
        GatewayClient.getDefault().getNetworkMac(object : com.ttlock.bl.sdk.gateway.callback.GetNetworkMacCallback {
            override fun onGetNetworkMacSuccess(mac: String) {
                callback(Result.success(mac))
            }

            override fun onFail(error: com.ttlock.bl.sdk.gateway.model.GatewayError) {
                callback(Result.success(null))
            }
        })
    }

    override fun enterUpgradeMode(mac: String) {
        return;
    }

}
