package com.ttlock.ttlock_flutter

//import com.ttlock.bl.sdk.standalonedoorsensor.api.StandaloneDoorSensorClient
//import com.ttlock.bl.sdk.standalonedoorsensor.model.StandaloneDoorSensorConfigInfo
import android.bluetooth.BluetoothAdapter
import android.content.Context
import com.google.gson.Gson
import com.ttlock.bl.sdk.device.Remote
import com.ttlock.bl.sdk.device.WirelessDoorSensor
import com.ttlock.bl.sdk.device.WirelessKeypad
import com.ttlock.bl.sdk.electricmeter.api.ElectricMeterClient
import com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError
import com.ttlock.bl.sdk.entity.CyclicConfig
import com.ttlock.bl.sdk.entity.ValidityInfo
import com.ttlock.bl.sdk.keypad.WirelessKeypadClient
import com.ttlock.bl.sdk.keypad.model.KeypadError
import com.ttlock.bl.sdk.mulfunkeypad.api.MultifunctionalKeypadClient
import com.ttlock.bl.sdk.mulfunkeypad.model.MultifunctionalKeypadError
import com.ttlock.bl.sdk.remote.api.RemoteClient
import com.ttlock.bl.sdk.remote.model.RemoteError
import com.ttlock.bl.sdk.util.FeatureValueUtil
import com.ttlock.bl.sdk.watermeter.api.WaterMeterClient
import com.ttlock.bl.sdk.watermeter.model.WaterMeterError
import com.ttlock.bl.sdk.wirelessdoorsensor.WirelessDoorSensorClient
import com.ttlock.bl.sdk.wirelessdoorsensor.model.DoorSensorError
import io.flutter.plugin.common.BinaryMessenger

class AccessoryApi : TTAccessoryHostApi {
    var context: Context

    companion object {
        var latestWaterMeterMac: String? = null
        var latestElectricMeterMac: String? = null
        /** 仅由 [setEventKeypadMac] 写入，供 accessory 流使用 */
        var latestKeypadMac: String? = null
        /** 仅由 [setEventKeypadMac] 写入 */
        var latestKeypadIsMultifunctional: Boolean = false
    }

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        TTAccessoryHostApi.setUp(messenger, this)
    }

    override fun setEventKeypadMac(mac: String, isMultifunctional: Boolean) {
        latestKeypadMac = mac
        latestKeypadIsMultifunctional = isMultifunctional
    }

    private fun remoteErrorToFlutterError(error: RemoteError): FlutterError {
        return FlutterError(
            code = remoteErrorRevert(error).raw.toString(),
            message = error.description,
            details = error.description
        )
    }

    private fun keypadErrorToFlutterError(error: KeypadError): FlutterError {
        return FlutterError(
            code = keypadErrorRevert(error).raw.toString(),
            message = error.description,
            details = error.description
        )
    }

    private fun doorSensorErrorToFlutterError(error: DoorSensorError): FlutterError {
        return FlutterError(
            code = doorSensorErrorRevert(error).raw.toString(),
            message = error.description,
            details = error.description
        )
    }

    private fun waterMeterErrorToFlutterError(error: WaterMeterError): FlutterError {
        return FlutterError(
            code = waterMeterErrorRevert(error).raw.toString(),
            message = error.description,
            details = error.description
        )
    }

    private fun electricMeterErrorToFlutterError(error: ElectricMeterError): FlutterError {
        return FlutterError(
            code = electricMeterErrorRevert(error).raw.toString(),
            message = error.description,
            details = error.description
        )
    }

    private fun multifunctionalKeypadErrorToFlutterError(error: MultifunctionalKeypadError): FlutterError {
        return FlutterError(
            code = multifunctionalKeypadErrorRevert(error).raw.toString(),
            message = error.description,
            details = error.description
        )
    }

    private fun buildValidityInfo(cycleList: List<TTCycleModel>?, startDate: Long, endDate: Long): ValidityInfo {
        val info = ValidityInfo()
        info.startDate = startDate
        info.endDate = endDate
        if (!cycleList.isNullOrEmpty()) {
            val sdkCycles = cycleList.map {
                val c = CyclicConfig()
                c.weekDay = it.weekDay.toInt()
                c.startTime = it.startTime.toInt()
                c.endTime = it.endTime.toInt()
                c
            }
            info.cyclicConfigs = sdkCycles
            info.modeType = ValidityInfo.CYCLIC
        }
        return info
    }

    override fun initRemoteKey(
        mac: String,
        lockData: String,
        callback: (Result<TTLockSystemModel>) -> Unit
    ) {
        val device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(mac)
        val remote = Remote(device)
        RemoteClient.getDefault().initialize(remote, lockData, object : com.ttlock.bl.sdk.remote.callback.InitRemoteCallback {
            override fun onInitSuccess(result: com.ttlock.bl.sdk.remote.model.InitRemoteResult) {
                val systemInfo = result.systemInfo
                callback(
                    Result.success(
                        TTLockSystemModel(
                            modelNum = systemInfo.modelNum,
                            hardwareRevision = systemInfo.hardwareRevision,
                            firmwareRevision = systemInfo.firmwareRevision,
                            electricQuantity = result.batteryLevel.toLong()
                        )
                    )
                )
            }

            override fun onFail(error: com.ttlock.bl.sdk.remote.model.RemoteError) {
                callback(Result.failure(remoteErrorToFlutterError(error)))
            }
        })
    }

    override fun initRemoteKeypad(
        mac: String,
        lockMac: String,
        callback: (Result<RemoteKeypadInitResult>) -> Unit
    ) {
        val device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(mac)
        val keypad = WirelessKeypad(device)
        WirelessKeypadClient.getDefault().initializeKeypad(
            keypad,
            lockMac,
            object : com.ttlock.bl.sdk.keypad.InitKeypadCallback {
                override fun onInitKeypadSuccess(result: com.ttlock.bl.sdk.keypad.model.InitKeypadResult) {
                    callback(
                        Result.success(
                            RemoteKeypadInitResult(
                                electricQuantity = result.batteryLevel.toLong(),
                                wirelessKeypadFeatureValue = result.featureValue
                            )
                        )
                    )
                }

                override fun onFail(error: com.ttlock.bl.sdk.keypad.model.KeypadError) {
                    callback(Result.failure(keypadErrorToFlutterError(error)))
                }
            }
        )
    }

    override fun initMultifunctionalKeypad(
        mac: String,
        lockData: String,
        callback: (Result<MultifunctionalKeypadInitResult>) -> Unit
    ) {
        MultifunctionalKeypadClient.getDefault().initializeMultifunctionalKeypad(
            mac,
            lockData,
            object : com.ttlock.bl.sdk.mulfunkeypad.callback.InitKeypadCallback {
                override fun onInitSuccess(result: com.ttlock.bl.sdk.mulfunkeypad.model.InitMultifunctionalKeypadResult) {
                    callback(
                        Result.success(
                            MultifunctionalKeypadInitResult(
                                electricQuantity = result.batteryLevel.toLong(),
                                wirelessKeypadFeatureValue = result.keypadFeatureValue,
                                slotNumber = result.slotNumber.toLong(),
                                slotLimit = result.slotLimit.toLong(),
                                modelNum = result.firmwareInfo.modelNum,
                                hardwareRevision = result.firmwareInfo.hardwareRevision,
                                firmwareRevision = result.firmwareInfo.firmwareRevision
                            )
                        )
                    )
                }

                override fun onLockFail(lockError: com.ttlock.bl.sdk.entity.LockError) {
                    callback(Result.failure(lockErrorToFlutterError(lockError)))
                }

                override fun onKeypadFail(keypadError: com.ttlock.bl.sdk.mulfunkeypad.model.MultifunctionalKeypadError) {
                    callback(Result.failure(multifunctionalKeypadErrorToFlutterError(keypadError)))
                }
            }
        )
    }

    override fun getStoredLocks(mac: String): List<String> {
        return emptyList()
    }

    override fun deleteStoredLock(
        mac: String,
        slotNumber: Long,
        callback: (Result<Unit>) -> Unit
    ) {
        MultifunctionalKeypadClient.getDefault().deleteLockAtSpecifiedSlot(
            mac,
            slotNumber.toInt(),
            object : com.ttlock.bl.sdk.mulfunkeypad.callback.DeleteLockCallback {
                override fun onDeleteLockSuccess() {
                    callback(Result.success(Unit))
                }

                override fun onKeypadFail(keypadError: com.ttlock.bl.sdk.mulfunkeypad.model.MultifunctionalKeypadError) {
                    callback(Result.failure(multifunctionalKeypadErrorToFlutterError(keypadError)))
                }
            }
        )
    }

    override fun initDoorSensor(
        mac: String,
        lockData: String,
        callback: (Result<TTLockSystemModel>) -> Unit
    ) {
        val device = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(mac)
        val doorSensor = WirelessDoorSensor(device)
        WirelessDoorSensorClient.getDefault().initialize(
            doorSensor,
            lockData,
            object : com.ttlock.bl.sdk.wirelessdoorsensor.callback.InitDoorSensorCallback {
                override fun onInitSuccess(result: com.ttlock.bl.sdk.wirelessdoorsensor.model.InitDoorSensorResult) {
                    callback(
                        Result.success(
                            TTLockSystemModel(
                                modelNum = result.firmwareInfo.modelNum,
                                hardwareRevision = result.firmwareInfo.hardwareRevision,
                                firmwareRevision = result.firmwareInfo.firmwareRevision,
                                electricQuantity = result.batteryLevel.toLong()
                            )
                        )
                    )
                }

                override fun onFail(error: com.ttlock.bl.sdk.wirelessdoorsensor.model.DoorSensorError) {
                    callback(Result.failure(doorSensorErrorToFlutterError(error)))
                }
            }
        )
    }

    override fun standaloneDoorSensorInit(
        mac: String,
        info: Map<String, Any?>,
        callback: (Result<TTStandaloneDoorSensorInfo>) -> Unit
    ) {
//        val config = gson.fromJson(
//            gson.toJson(info),
//            object : TypeToken<StandaloneDoorSensorConfigInfo>() {}.type
//        ) as StandaloneDoorSensorConfigInfo
//        StandaloneDoorSensorClient.getDefault().init(
//            config,
//            object : com.ttlock.bl.sdk.standalonedoorsensor.callback.InitCallback {
//                override fun onInitSuccess(result: com.ttlock.bl.sdk.standalonedoorsensor.model.InitModel) {
//                    callback(
//                        Result.success(
//                            TTStandaloneDoorSensorInfo(
//                                doorSensorData = result.doorSensorData,
//                                electricQuantity = result.deviceInfo.electricQuantity.toLong(),
//                                featureValue = result.deviceInfo.featureValue,
//                                wifiMac = result.deviceInfo.wifiMac,
//                                modelNum = result.deviceInfo.modelNum,
//                                hardwareRevision = result.deviceInfo.hardwareRevision,
//                                firmwareRevision = result.deviceInfo.firmwareRevision
//                            )
//                        )
//                    )
//                }
//
//                override fun onFail(error: com.ttlock.bl.sdk.standalonedoorsensor.model.StandaloneDoorSensorError) {
//                    callback(Result.failure(anyErrorToFlutterError(error)))
//                }
//            }
//        )
    }

    override fun standaloneDoorSensorReadFeatureValue(
        mac: String,
        callback: (Result<String>) -> Unit
    ) {

//        StandaloneDoorSensorClient.getDefault().getDeviceInfo(
//            mac,
//            object : com.ttlock.bl.sdk.standalonedoorsensor.callback.GetDeviceInfoCallback {
//                override fun onGetDeviceInfoSuccess(deviceInfo: com.ttlock.bl.sdk.standalonedoorsensor.model.DeviceInfo) {
//                    callback(Result.success(deviceInfo.featureValue ?: ""))
//                }
//
//                override fun onFail(error: com.ttlock.bl.sdk.standalonedoorsensor.model.StandaloneDoorSensorError) {
//                    callback(Result.failure(anyErrorToFlutterError(error)))
//                }
//            }
//        )
    }

    override fun standaloneDoorSensorIsSupportFunction(
        featureValue: String,
        function: Long
    ): Boolean {
        return FeatureValueUtil.isSupportFeatureValue(featureValue, function.toInt())
    }

    override fun waterMeterConfigServer(
        url: String,
        clientId: String,
        accessToken: String
    ) {
        WaterMeterClient.getDefault().setClientParam(url, clientId, accessToken)
    }

    override fun waterMeterConnect(
        mac: String,
        callback: (Result<Unit>) -> Unit
    ) {
        latestWaterMeterMac = mac
        WaterMeterClient.getDefault().connect(mac, object : com.ttlock.bl.sdk.watermeter.callback.ConnectCallback {
            override fun onConnectSuccess(waterMeter: com.ttlock.bl.sdk.watermeter.model.WaterMeter) {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterDisconnect(mac: String) {
        WaterMeterClient.getDefault().disconnect()
    }

    override fun waterMeterInit(
        params: Map<String, Any?>,
        callback: (Result<TTWaterMeterInitResult>) -> Unit
    ) {
        val map = HashMap<String, String>()
        params.forEach { (k, v) -> map[k] = v?.toString() ?: "" }
        WaterMeterClient.getDefault().add(map, object : com.ttlock.bl.sdk.watermeter.callback.AddCallback {
            override fun onAddSuccess(info: com.ttlock.bl.sdk.watermeter.model.WaterMeterInfo) {
                latestWaterMeterMac = info.waterMeterId.toString()
                callback(Result.success(TTWaterMeterInitResult(waterMeterId = info.waterMeterId.toString(), featureValue = info.featureValue)))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterDelete(
        waterMeterId: String,
        callback: (Result<Unit>) -> Unit
    ) {
        WaterMeterClient.getDefault().delete(waterMeterId, object : com.ttlock.bl.sdk.watermeter.callback.DeleteCallback {
            override fun onDeleteSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterSetPowerOnOff(
        waterMeterId: String,
        isOn: Boolean,
        callback: (Result<Unit>) -> Unit
    ) {
        WaterMeterClient.getDefault().setWaterOnOff(waterMeterId, isOn, object : com.ttlock.bl.sdk.watermeter.callback.SetWaterOnOffCallback {
            override fun onSetSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterSetRemainderM3(
        waterMeterId: String,
        remainderM3: Double,
        callback: (Result<Unit>) -> Unit
    ) {
        WaterMeterClient.getDefault().setRemainingWater(waterMeterId, remainderM3.toString(), object : com.ttlock.bl.sdk.watermeter.callback.SetRemainingWaterCallback {
            override fun onSetSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterClearRemainderM3(
        waterMeterId: String,
        callback: (Result<Unit>) -> Unit
    ) {
        WaterMeterClient.getDefault().clearRemainingWater(waterMeterId, object : com.ttlock.bl.sdk.watermeter.callback.ClearRemainingWaterCallback {
            override fun onClearSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterReadData(
        waterMeterId: String,
        callback: (Result<Map<String, Any?>>) -> Unit
    ) {
        WaterMeterClient.getDefault().readData(waterMeterId, object : com.ttlock.bl.sdk.watermeter.callback.ReadDataCallback {
            override fun onReadSuccess() {
                callback(Result.success(emptyMap()))
            }

            override fun onFail(error: WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterSetPayMode(
        waterMeterId: String,
        payMode: Long,
        callback: (Result<Unit>) -> Unit
    ) {
        WaterMeterClient.getDefault().setWorkMode(waterMeterId, payMode.toInt(), 0.0, object : com.ttlock.bl.sdk.watermeter.callback.SetWorkModeCallback {
            override fun onSetWorkModeSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterCharge(
        waterMeterId: String,
        amount: Double,
        callback: (Result<Unit>) -> Unit
    ) {
        WaterMeterClient.getDefault().recharge(waterMeterId, amount, 0.0, object : com.ttlock.bl.sdk.watermeter.callback.RechargeCallback {
            override fun onRechargeSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterSetTotalUsage(
        waterMeterId: String,
        totalM3: Double,
        callback: (Result<Unit>) -> Unit
    ) {
        WaterMeterClient.getDefault().setTotalUsage(waterMeterId, totalM3, object : com.ttlock.bl.sdk.watermeter.callback.SetTotalUsageCallback {
            override fun onSetSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterGetFeatureValue(
        waterMeterId: String,
        callback: (Result<String>) -> Unit
    ) {
        WaterMeterClient.getDefault().getFeatureValue(waterMeterId, object : com.ttlock.bl.sdk.watermeter.callback.GetFeatureValueCallback {
            override fun onGetFeatureValueSuccess() {
                callback(Result.success(""))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterGetDeviceInfo(
        waterMeterId: String,
        callback: (Result<WaterMeterDeviceInfo>) -> Unit
    ) {
        WaterMeterClient.getDefault().getDeviceInfo(waterMeterId, object : com.ttlock.bl.sdk.watermeter.callback.GetDeviceInfoCallback {
            override fun onGetSuccess(deviceInfo: com.ttlock.bl.sdk.watermeter.model.DeviceInfo) {
                @Suppress("UNCHECKED_CAST")
                callback(Result.success(WaterMeterDeviceInfo(
                    catOneCardNumber = deviceInfo.catOneCardNumber,
                    catOneImsi = deviceInfo.catOneImsi,
                    catOneNodeId = deviceInfo.catOneNodeId,
                    catOneOperator = deviceInfo.catOneOperator,
                    catOneRssi = deviceInfo.catOneRssi.toLong()
                )))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterIsSupportFunction(
        featureValue: String,
        function: Long
    ): Boolean {
        return FeatureValueUtil.isSupportFeatureValue(featureValue, function.toInt())
    }

    override fun waterMeterConfigApn(
        apn: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val mac = latestWaterMeterMac
        if (mac.isNullOrEmpty()) {
            callback(Result.failure(FlutterError("missing_mac", "water meter is not connected", null)))
            return
        }
        WaterMeterClient.getDefault().configureApn(mac, apn, object : com.ttlock.bl.sdk.watermeter.callback.ConfigApnCallback {
            override fun onConfigSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(p0: WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(p0)))
            }
        })
    }

    override fun waterMeterConfigMeterServer(
        ip: String,
        port: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val mac = latestWaterMeterMac
        if (mac.isNullOrEmpty()) {
            callback(Result.failure(FlutterError("missing_mac", "water meter is not connected", null)))
            return
        }
        WaterMeterClient.getDefault().configureServer(mac, ip, port.toInt(), object : com.ttlock.bl.sdk.watermeter.callback.ConfigServerCallback {
            override fun onConfigSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun waterMeterReset(
        waterMeterId: String,
        callback: (Result<Unit>) -> Unit
    ) {
        WaterMeterClient.getDefault().reset(waterMeterId, object : com.ttlock.bl.sdk.watermeter.callback.ResetCallback {
            override fun onResetSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.watermeter.model.WaterMeterError) {
                callback(Result.failure(waterMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterConfigServer(
        url: String,
        clientId: String,
        accessToken: String
    ) {
        ElectricMeterClient.getDefault().setClientParam(url, clientId, accessToken)
    }

    override fun electricMeterConnect(
        mac: String,
        callback: (Result<Unit>) -> Unit
    ) {
        latestElectricMeterMac = mac
        ElectricMeterClient.getDefault().connect(mac, object : com.ttlock.bl.sdk.electricmeter.callback.ConnectCallback {
            override fun onConnectSuccess(electricMeter: com.ttlock.bl.sdk.electricmeter.model.ElectricMeter) {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterDisconnect(mac: String) {
        ElectricMeterClient.getDefault().disconnect()
    }

    override fun electricMeterInit(
        params: Map<String, Any?>,
        callback: (Result<TTElectricMeterInitResult>) -> Unit
    ) {
        val map = HashMap<String, String>()
        params.forEach { (k, v) -> map[k] = v?.toString() ?: "" }
        ElectricMeterClient.getDefault().add(map, object : com.ttlock.bl.sdk.electricmeter.callback.AddCallback {
            override fun onAddSuccess(info: com.ttlock.bl.sdk.entity.FirmwareInfo) {
                callback(Result.success(TTElectricMeterInitResult(electricMeterId = "-1", featureValue = null)))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterDelete(
        electricMeterId: String,
        callback: (Result<Unit>) -> Unit
    ) {
        ElectricMeterClient.getDefault().delete(electricMeterId, object : com.ttlock.bl.sdk.electricmeter.callback.DeleteCallback {
            override fun onDeleteSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterSetPowerOnOff(
        electricMeterId: String,
        isOn: Boolean,
        callback: (Result<Unit>) -> Unit
    ) {
        ElectricMeterClient.getDefault().setPowerOnOff(electricMeterId, isOn, object : com.ttlock.bl.sdk.electricmeter.callback.SetPowerOnOffCallback {
            override fun onSetPowerOnOffSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterSetRemainderKwh(
        electricMeterId: String,
        remainderKwh: Double,
        callback: (Result<Unit>) -> Unit
    ) {
        ElectricMeterClient.getDefault().setRemainingElectricity(electricMeterId, remainderKwh.toString(), object : com.ttlock.bl.sdk.electricmeter.callback.SetRemainingElectricityCallback {
            override fun onSetSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterClearRemainderKwh(
        electricMeterId: String,
        callback: (Result<Unit>) -> Unit
    ) {
        ElectricMeterClient.getDefault().clearRemainingElectricity(electricMeterId, object : com.ttlock.bl.sdk.electricmeter.callback.ClearRemainingElectricityCallback {
            override fun onClearSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterReadData(
        electricMeterId: String,
        callback: (Result<Map<String, Any?>>) -> Unit
    ) {
        ElectricMeterClient.getDefault().readData(electricMeterId, object : com.ttlock.bl.sdk.electricmeter.callback.ReadDataCallback {
            override fun onReadSuccess() {
                callback(Result.success(emptyMap()))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterSetPayMode(
        electricMeterId: String,
        payMode: Long,
        callback: (Result<Unit>) -> Unit
    ) {
        ElectricMeterClient.getDefault().setWorkMode(electricMeterId, payMode.toInt(), 0.0, object : com.ttlock.bl.sdk.electricmeter.callback.SetWorkModeCallback {
            override fun onSetWorkModeSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterCharge(
        electricMeterId: String,
        amount: Double,
        callback: (Result<Unit>) -> Unit
    ) {
        ElectricMeterClient.getDefault().recharge(electricMeterId, amount, 0.0, object : com.ttlock.bl.sdk.electricmeter.callback.ChargeCallback {
            override fun onChargeSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterSetMaxPower(
        electricMeterId: String,
        maxPower: Double,
        callback: (Result<Unit>) -> Unit
    ) {
        ElectricMeterClient.getDefault().setMaxPower(electricMeterId, maxPower.toInt(), object : com.ttlock.bl.sdk.electricmeter.callback.SetMaxPowerCallback {
            override fun onSetMaxPowerSuccess() {
                callback(Result.success(Unit))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterGetFeatureValue(
        electricMeterId: String,
        callback: (Result<String>) -> Unit
    ) {
        ElectricMeterClient.getDefault().getFeatureValue(electricMeterId, object : com.ttlock.bl.sdk.electricmeter.callback.GetFeatureValueCallback {
            override fun onGetFeatureValueSuccess() {
                callback(Result.success(""))
            }

            override fun onFail(error: com.ttlock.bl.sdk.electricmeter.model.ElectricMeterError) {
                callback(Result.failure(electricMeterErrorToFlutterError(error)))
            }
        })
    }

    override fun electricMeterIsSupportFunction(
        featureValue: String,
        function: Long
    ): Boolean {
        return FeatureValueUtil.isSupportFeatureValue(featureValue, function.toInt())
    }

}
