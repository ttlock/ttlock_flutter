package com.ttlock.ttlock_flutter

import android.content.Context
import android.os.Handler
import android.os.Looper
import com.ttlock.bl.sdk.api.ExtendedBluetoothDevice
import com.ttlock.bl.sdk.api.TTLockClient
import com.ttlock.bl.sdk.callback.AddFaceCallback
import com.ttlock.bl.sdk.callback.AddFingerprintCallback
import com.ttlock.bl.sdk.callback.AddICCardCallback
import com.ttlock.bl.sdk.callback.EnterKeypadCardAddingModeCallback
import com.ttlock.bl.sdk.callback.EnterKeypadFingerprintAddingModeCallback
import com.ttlock.bl.sdk.callback.GetCardAddingResultCallback
import com.ttlock.bl.sdk.callback.GetFingerprintAddingResultCallback
import com.ttlock.bl.sdk.callback.ScanLockCallback
import com.ttlock.bl.sdk.callback.ScanWifiCallback
import com.ttlock.bl.sdk.device.Remote
import com.ttlock.bl.sdk.device.WirelessDoorSensor
import com.ttlock.bl.sdk.device.WirelessKeypad
import com.ttlock.bl.sdk.electricmeter.api.ElectricMeterClient
import com.ttlock.bl.sdk.entity.FaceCollectionStatus
import com.ttlock.bl.sdk.entity.LockError
import com.ttlock.bl.sdk.gateway.api.GatewayClient
import com.ttlock.bl.sdk.gateway.callback.ScanGatewayCallback
import com.ttlock.bl.sdk.gateway.callback.ScanWiFiByGatewayCallback
import com.ttlock.bl.sdk.gateway.model.GatewayError
import com.ttlock.bl.sdk.keypad.ScanKeypadCallback
import com.ttlock.bl.sdk.keypad.WirelessKeypadClient
import com.ttlock.bl.sdk.mulfunkeypad.api.MultifunctionalKeypadClient
import com.ttlock.bl.sdk.mulfunkeypad.model.MultifunctionalKeypadError
import com.ttlock.bl.sdk.remote.api.RemoteClient
import com.ttlock.bl.sdk.remote.callback.ScanRemoteCallback
import com.ttlock.bl.sdk.util.LogUtil
import com.ttlock.bl.sdk.watermeter.api.WaterMeterClient
import com.ttlock.bl.sdk.wirelessdoorsensor.WirelessDoorSensorClient
import com.ttlock.bl.sdk.wirelessdoorsensor.callback.ScanWirelessDoorSensorCallback
import io.flutter.plugin.common.BinaryMessenger

class ScanLockImpl : LockScanLockStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(p0: Any?, sink: PigeonEventSink<TTLockScanModel>) {
        super.onListen(p0, sink)
        TTLockClient.getDefault().startScanLock(object : ScanLockCallback {
            override fun onScanLockSuccess(extendedBluetoothDevice: ExtendedBluetoothDevice) {
                val lockVersion = TTLockVersion(
                    protocolType = extendedBluetoothDevice.protocolType.toLong(),
                    protocolVersion = extendedBluetoothDevice.protocolVersion.toLong(),
                    scene = extendedBluetoothDevice.scene.toLong(),
                    groupId = extendedBluetoothDevice.groupId.toLong(),
                    orgId = extendedBluetoothDevice.orgId.toLong(),
                )
                sink.success(
                    TTLockScanModel(
                        lockName = extendedBluetoothDevice.name,
                        lockMac = extendedBluetoothDevice.address,
                        isInited = !extendedBluetoothDevice.isSettingMode,
                        isAllowUnlock = extendedBluetoothDevice.isTouch,
                        electricQuantity = extendedBluetoothDevice.batteryCapacity.toLong(),
                        lockVersion = lockVersion,
                        rssi = extendedBluetoothDevice.rssi.toLong(),
                        timestamp = extendedBluetoothDevice.date,
                        lockSwitchState = TTLockSwitchState.UNKNOW,
                        oneMeterRssi = -1,
                    )
                )
            }

            override fun onFail(lockError: LockError?) {
                LogUtil.d("lockError:$lockError")
                sink.error(
                    lockError?.errorCode ?: "",
                    lockError?.errorMsg,
                    lockError?.description
                )
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        TTLockClient.getDefault().stopScanLock()
    }
}

class ScanLockWifiImpl : LockScanWifiStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<List<TTWifiScanEntry>>
    ) {
        super.onListen(p0, sink)
        val lockData = LockStreamParams.lockData
        if (lockData.isNullOrEmpty()) {
            sink.error(
                "NO_LOCK_DATA",
                "请先通过 initLock、controlLock 等传入 lockData 后再使用 lockScanWifi",
                null
            )
            return
        }
        TTLockClient.getDefault().scanWifi(lockData, object : ScanWifiCallback {
            override fun onScanWifi(wifiList: MutableList<com.ttlock.bl.sdk.gateway.model.WiFi>?, scanState: Int) {
                val list = wifiList?.map { w ->
                    val ssid = w.ssid ?: ""
                    TTWifiScanEntry(
                        wifiMac = "",
                        wifiRssi = w.rssi.toLong(),
                        bssid = "",
                        ssid = ssid,
                        wifiName = ssid,
                        name = ssid
                    )
                } ?: emptyList()
                sink.success(TTWifiScanResult(wifiList = list))
            }

            override fun onFail(lockError: LockError?) {
                sink.error(
                    lockError?.errorCode ?: "",
                    lockError?.errorMsg,
                    lockError?.description
                )
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
    }
}

class AddLockCardImpl : LockAddCardStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<AddCardEvent>
    ) {
        super.onListen(p0, sink)
        val lockData = LockStreamParams.lockData
        if (lockData.isNullOrEmpty()) {
            sink.error("NO_LOCK_DATA", "请先通过 initLock 等设置 lockData 后再使用 lockAddCard", null)
            return
        }
        val validity = LockStreamParams.buildValidityInfo()
        TTLockClient.getDefault().addICCard(validity, lockData, object : AddICCardCallback {
            override fun onEnterAddMode() {
                sink.success(AddCardEvent(isProgress = true, cardNumber = null))
            }

            override fun onAddICCardSuccess(cardNumber: Long) {
                sink.success(AddCardEvent(isProgress = false, cardNumber = cardNumber.toString()))
            }

            override fun onFail(lockError: LockError?) {
                sink.error(
                    lockError?.errorCode ?: "",
                    lockError?.errorMsg,
                    lockError?.description
                )
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
    }
}

class AddLockFingerprintImpl : LockAddFingerprintStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<AddFingerprintEvent>
    ) {
        super.onListen(p0, sink)
        val lockData = LockStreamParams.lockData
        if (lockData.isNullOrEmpty()) {
            sink.error("NO_LOCK_DATA", "请先通过 initLock 等设置 lockData 后再使用 lockAddFingerprint", null)
            return
        }
        val validity = LockStreamParams.buildValidityInfo()
        var fingerprintTotal = 0
        TTLockClient.getDefault().addFingerprint(validity, lockData, object : AddFingerprintCallback {
            override fun onEnterAddMode(totalCount: Int) {
                fingerprintTotal = totalCount
                sink.success(
                    AddFingerprintEvent(
                        isProgress = true,
                        currentCount = 0L,
                        totalCount = totalCount.toLong(),
                        fingerprintNumber = null
                    )
                )
            }

            override fun onCollectFingerprint(currentCount: Int) {
                sink.success(
                    AddFingerprintEvent(
                        isProgress = true,
                        currentCount = currentCount.toLong(),
                        totalCount = fingerprintTotal.toLong(),
                        fingerprintNumber = null
                    )
                )
            }

            override fun onAddFingerpintFinished(fingerprintNumber: Long) {
                sink.success(
                    AddFingerprintEvent(
                        isProgress = false,
                        currentCount = null,
                        totalCount = null,
                        fingerprintNumber = fingerprintNumber.toString()
                    )
                )
            }

            override fun onFail(lockError: LockError?) {
                sink.error(
                    lockError?.errorCode ?: "",
                    lockError?.errorMsg,
                    lockError?.description
                )
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
    }
}

class AddLockFaceImpl : LockAddFaceStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<AddFaceEvent>
    ) {
        super.onListen(p0, sink)
        val lockData = LockStreamParams.lockData
        if (lockData.isNullOrEmpty()) {
            sink.error("NO_LOCK_DATA", "请先通过 initLock 等设置 lockData 后再使用 lockAddFace", null)
            return
        }
        val validity = LockStreamParams.buildValidityInfo()
        TTLockClient.getDefault().addFace(lockData, validity, object : AddFaceCallback {
            override fun onEnterAddMode() {
                sink.success(
                    AddFaceEvent(
                        isProgress = true,
                        state = TTFaceState.CAN_START_ADD,
                        errorCode = TTFaceErrorCode.NORMAL,
                        faceNumber = null
                    )
                )
            }

            override fun onCollectionStatus(status: FaceCollectionStatus) {
                val err = TTFaceErrorCode.ofRaw(status.getValue()) ?: TTFaceErrorCode.NORMAL
                sink.success(
                    AddFaceEvent(
                        isProgress = true,
                        state = TTFaceState.CAN_START_ADD,
                        errorCode = err,
                        faceNumber = null
                    )
                )
            }

            override fun onAddFinished(faceNumber: Long) {
                sink.success(
                    AddFaceEvent(
                        isProgress = false,
                        state = null,
                        errorCode = null,
                        faceNumber = faceNumber.toString()
                    )
                )
            }

            override fun onFail(lockError: LockError?) {
                sink.error(
                    lockError?.errorCode ?: "",
                    lockError?.errorMsg,
                    lockError?.description
                )
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
    }
}

class ScanGatewayImpl : GatewayStartScanStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<TTGatewayScanModel>
    ) {
        super.onListen(p0, sink)
        GatewayClient.getDefault().prepareBTService(context)
        GatewayClient.getDefault().startScanGateway(object : ScanGatewayCallback {
            override fun onScanGatewaySuccess(device: ExtendedBluetoothDevice) {
                sink.success(
                    TTGatewayScanModel(
                        gatewayName = device.name,
                        gatewayMac = device.address,
                        rssi = device.rssi.toLong(),
                        isDfuMode = device.isDfuMode,
                        type = TTGatewayType.ofRaw((device.gatewayType - 1).toInt()) ?: TTGatewayType.G2
                    )
                )
            }

            override fun onScanFailed(errorCode: Int) {
                LogUtil.d("scan gateway fail:$errorCode")
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        GatewayClient.getDefault().stopScanGateway()
    }
}

class ScanGatewayWiFiImpl : GatewayGetNearbyWifiStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<TTWifiScanResult>
    ) {
        super.onListen(p0, sink)
        val mac = GatewayApi.latestGatewayMac
        if (mac.isNullOrEmpty()) {
            sink.error("NO_GATEWAY", "请先 connect 网关后再使用 gatewayGetNearbyWifi", null)
            return
        }
        GatewayClient.getDefault().scanWiFiByGateway(mac, object : ScanWiFiByGatewayCallback {
            override fun onScanWiFiByGateway(wifiList: MutableList<com.ttlock.bl.sdk.gateway.model.WiFi>?) {
                val list = wifiList?.map { w ->
                    val ssid = w.ssid ?: ""
                    TTWifiScanEntry(
                        wifiMac = "",
                        wifiRssi = w.rssi.toLong(),
                        bssid = "",
                        ssid = ssid,
                        wifiName = ssid,
                        name = ssid
                    )
                } ?: emptyList()
                sink.success(TTWifiScanResult(wifiList = list))
            }

            override fun onScanWiFiByGatewaySuccess() {
                // 扫描结束；部分固件仅回调此项，不再重复列表
            }

            override fun onFail(error: GatewayError) {
                sink.error(
                    gatewayErrorRevert(error).raw.toString(),
                    error.description,
                    error.description
                )
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
    }
}

class ScanRemoteKeyImpl : AccessoryStartScanRemoteKeyStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<TTRemoteAccessoryScanModel>
    ) {
        super.onListen(p0, sink)
        RemoteClient.getDefault().startScan(object : ScanRemoteCallback {
            override fun onScanRemote(remote: Remote) {
                sink.success(
                    TTRemoteAccessoryScanModel(
                        name = remote.name,
                        mac = remote.address,
                        rssi = remote.rssi.toLong(),
                        scanTime = System.currentTimeMillis(),
                        isMultifunctionalKeypad = false,
                        advertisementData = emptyMap()
                    )
                )
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        RemoteClient.getDefault().stopScan()
    }
}

class ScanRemoteKeypadImpl : AccessoryStartScanRemoteKeypadStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<TTRemoteAccessoryScanModel>
    ) {
        super.onListen(p0, sink)
        WirelessKeypadClient.getDefault().startScanKeyboard(object : ScanKeypadCallback {
            override fun onScanKeyboardSuccess(wirelessKeypad: WirelessKeypad) {
                sink.success(
                    TTRemoteAccessoryScanModel(
                        name = wirelessKeypad.name,
                        mac = wirelessKeypad.address,
                        rssi = wirelessKeypad.rssi.toLong(),
                        scanTime = System.currentTimeMillis(),
                        isMultifunctionalKeypad = false,
                        advertisementData = emptyMap()
                    )
                )
            }

            override fun onScanFailed(errorcode: Int) {
                LogUtil.d("scan remote keypad fail:$errorcode")
            }
        })
        MultifunctionalKeypadClient.getDefault().startScanKeypad(object : ScanKeypadCallback {
            override fun onScanKeyboardSuccess(wirelessKeypad: WirelessKeypad) {
                sink.success(
                    TTRemoteAccessoryScanModel(
                        name = wirelessKeypad.name,
                        mac = wirelessKeypad.address,
                        rssi = wirelessKeypad.rssi.toLong(),
                        scanTime = System.currentTimeMillis(),
                        isMultifunctionalKeypad = true,
                        advertisementData = emptyMap()
                    )
                )
            }

            override fun onScanFailed(errorcode: Int) {
                LogUtil.d("scan multifunctional keypad fail:$errorcode")
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        WirelessKeypadClient.getDefault().stopScanKeyboard()
        MultifunctionalKeypadClient.getDefault().stopScanKeypad()
    }
}

class AddKeypadFingerprintImpl : AccessoryAddKeypadFingerprintStreamHandler {
    var context: Context
    private var pollHandler: Handler? = null
    private var pollRunnable: Runnable? = null
    @Volatile
    private var pollCancelled: Boolean = false

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    private fun stopPolling() {
        pollCancelled = true
        pollRunnable?.let { pollHandler?.removeCallbacks(it) }
        pollRunnable = null
        pollHandler = null
    }

    private fun pollWirelessFingerprintResult(sink: PigeonEventSink<AddFingerprintEvent>, lockData: String) {
        val handler = Handler(Looper.getMainLooper())
        pollHandler = handler
        pollCancelled = false
        var attempts = 0
        lateinit var runnable: Runnable
        runnable = Runnable {
            if (pollCancelled) return@Runnable
            attempts++
            if (attempts > 200) {
                sink.error("TIMEOUT", "等待键盘录入指纹超时", null)
                stopPolling()
                return@Runnable
            }
            TTLockClient.getDefault().getFingerprintAddingResult(lockData, object : GetFingerprintAddingResultCallback {
                override fun onGetFingerprintAddingResult(fingerprintNumber: Long) {
                    stopPolling()
                    sink.success(
                        AddFingerprintEvent(
                            isProgress = false,
                            currentCount = null,
                            totalCount = null,
                            fingerprintNumber = fingerprintNumber.toString()
                        )
                    )
                }

                override fun onFail(lockError: LockError?) {
                    handler.postDelayed(runnable, 400)
                }
            })
        }
        pollRunnable = runnable
        handler.postDelayed(runnable, 400)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<AddFingerprintEvent>
    ) {
        super.onListen(p0, sink)
        val lockData = LockStreamParams.lockData
        if (lockData.isNullOrEmpty()) {
            sink.error("NO_LOCK_DATA", "请先初始化键盘并保证 lockData 有效", null)
            return
        }
        val mac = AccessoryApi.latestKeypadMac
        if (mac.isNullOrEmpty()) {
            sink.error("NO_KEYPAD", "请先 initRemoteKeypad / initMultifunctionalKeypad", null)
            return
        }

        if (AccessoryApi.latestKeypadIsMultifunctional) {
            val validity = LockStreamParams.buildValidityInfo()
            MultifunctionalKeypadClient.getDefault().addFingerprint(
                mac,
                lockData,
                validity,
                object : com.ttlock.bl.sdk.mulfunkeypad.callback.AddFingerprintCallback {
                    override fun onEnterAddingMode() {
                        sink.success(
                            AddFingerprintEvent(
                                isProgress = true,
                                currentCount = 0L,
                                totalCount = 0L,
                                fingerprintNumber = null
                            )
                        )
                    }

                    override fun onCollectFingerprint(currentCount: Int, totalCount: Int) {
                        sink.success(
                            AddFingerprintEvent(
                                isProgress = true,
                                currentCount = currentCount.toLong(),
                                totalCount = totalCount.toLong(),
                                fingerprintNumber = null
                            )
                        )
                    }

                    override fun onAddFingerprintFinished(fingerprintNumber: Long) {
                        sink.success(
                            AddFingerprintEvent(
                                isProgress = false,
                                currentCount = null,
                                totalCount = null,
                                fingerprintNumber = fingerprintNumber.toString()
                            )
                        )
                    }

                    override fun onLockFail(lockError: LockError) {
                        sink.error(
                            lockError.errorCode ?: "",
                            lockError.errorMsg,
                            lockError.description
                        )
                    }

                    override fun onKeypadFail(keypadError: MultifunctionalKeypadError) {
                        sink.error(
                            multifunctionalKeypadErrorRevert(keypadError).raw.toString(),
                            keypadError.description,
                            keypadError.description
                        )
                    }
                }
            )
            return
        }

        TTLockClient.getDefault().enterKeypadFingerprintAddingMode(
            lockData,
            object : EnterKeypadFingerprintAddingModeCallback {
                override fun onEnterAddingMode() {
                    sink.success(
                        AddFingerprintEvent(
                            isProgress = true,
                            currentCount = 0,
                            totalCount = 0,
                            fingerprintNumber = null
                        )
                    )
                    pollWirelessFingerprintResult(sink, lockData)
                }

                override fun onFail(lockError: LockError?) {
                    sink.error(
                        lockError?.errorCode ?: "",
                        lockError?.errorMsg,
                        lockError?.description
                    )
                }
            }
        )
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        stopPolling()
    }
}

class AddKeypadCardImpl : AccessoryAddKeypadCardStreamHandler {
    var context: Context
    private var pollHandler: Handler? = null
    private var pollRunnable: Runnable? = null
    @Volatile
    private var pollCancelled: Boolean = false

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    private fun stopPolling() {
        pollCancelled = true
        pollRunnable?.let { pollHandler?.removeCallbacks(it) }
        pollRunnable = null
        pollHandler = null
    }

    private fun pollWirelessCardResult(sink: PigeonEventSink<AddCardEvent>, lockData: String) {
        val handler = Handler(Looper.getMainLooper())
        pollHandler = handler
        pollCancelled = false
        var attempts = 0
        lateinit var runnable: Runnable
        runnable = Runnable {
            if (pollCancelled) return@Runnable
            attempts++
            if (attempts > 200) {
                sink.error("TIMEOUT", "等待键盘刷卡超时", null)
                stopPolling()
                return@Runnable
            }
            TTLockClient.getDefault().getCardAddingResult(lockData, object : GetCardAddingResultCallback {
                override fun onGetCardAddingResult(cardNumber: Long) {
                    stopPolling()
                    sink.success(AddCardEvent(isProgress = false, cardNumber = cardNumber.toString()))
                }

                override fun onFail(lockError: LockError?) {
                    handler.postDelayed(runnable, 400)
                }
            })
        }
        pollRunnable = runnable
        handler.postDelayed(runnable, 400)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<AddCardEvent>
    ) {
        super.onListen(p0, sink)
        val lockData = LockStreamParams.lockData
        if (lockData.isNullOrEmpty()) {
            sink.error("NO_LOCK_DATA", "请先初始化键盘并保证 lockData 有效", null)
            return
        }
        val mac = AccessoryApi.latestKeypadMac
        if (mac.isNullOrEmpty()) {
            sink.error("NO_KEYPAD", "请先 initRemoteKeypad / initMultifunctionalKeypad", null)
            return
        }

        if (AccessoryApi.latestKeypadIsMultifunctional) {
            val validity = LockStreamParams.buildValidityInfo()
            MultifunctionalKeypadClient.getDefault().addCard(
                mac,
                validity,
                object : com.ttlock.bl.sdk.mulfunkeypad.callback.AddCardCallback {
                    override fun onEnterAddingMode() {
                        sink.success(AddCardEvent(isProgress = true, cardNumber = null))
                    }

                    override fun onAddCardSuccess(cardNumber: Long) {
                        sink.success(AddCardEvent(isProgress = false, cardNumber = cardNumber.toString()))
                    }

                    override fun onLockFail(lockError: LockError) {
                        sink.error(
                            lockError.errorCode ?: "",
                            lockError.errorMsg,
                            lockError.description
                        )
                    }

                    override fun onKeypadFail(keypadError: MultifunctionalKeypadError) {
                        sink.error(
                            multifunctionalKeypadErrorRevert(keypadError).raw.toString(),
                            keypadError.description,
                            keypadError.description
                        )
                    }
                }
            )
            return
        }

        TTLockClient.getDefault().enterKeypadCardAddingMode(
            lockData,
            object : EnterKeypadCardAddingModeCallback {
                override fun onEnterAddingMode() {
                    sink.success(AddCardEvent(isProgress = true, cardNumber = null))
                    pollWirelessCardResult(sink, lockData)
                }

                override fun onFail(lockError: LockError?) {
                    sink.error(
                        lockError?.errorCode ?: "",
                        lockError?.errorMsg,
                        lockError?.description
                    )
                }
            }
        )
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        stopPolling()
    }
}

class ScanDoorSensorImpl : AccessoryStartScanDoorSensorStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<TTRemoteAccessoryScanModel>
    ) {
        super.onListen(p0, sink)
        WirelessDoorSensorClient.getDefault().startScan(object : ScanWirelessDoorSensorCallback {
            override fun onScan(doorSensor: WirelessDoorSensor) {
                sink.success(
                    TTRemoteAccessoryScanModel(
                        name = doorSensor.name,
                        mac = doorSensor.address,
                        rssi = doorSensor.rssi.toLong(),
                        scanTime = System.currentTimeMillis(),
                        isMultifunctionalKeypad = false,
                        advertisementData = emptyMap()
                    )
                )
            }
        })
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        WirelessDoorSensorClient.getDefault().stopScan()
    }
}

class ScanStandaloneDoorSensorImpl : AccessoryStandaloneDoorSensorStartScanStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<TTStandaloneDoorSensorScanModel>
    ) {
        super.onListen(p0, sink)
        // TTLockOnPremise.aar 当前未包含 standalonedoorsensor；若需支持请按 android/build.gradle 注释叠加 ttlock-release.aar 后再接入 SDK 扫描
        sink.error(
            "NOT_SUPPORTED",
            "当前 On-Premise AAR 未包含独立门磁扫描 API；请使用完整 TTLock SDK AAR 后实现 StandaloneDoorSensorClient.startScan",
            null
        )
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
    }
}

class ScanWaterMeterImpl : AccessoryWaterMeterStartScanStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<TTMeterScanModel>
    ) {
        super.onListen(p0, sink)
        WaterMeterClient.getDefault().startScan { meter ->
            if (meter != null) {
                sink.success(
                    TTMeterScanModel(
                        name = meter.name,
                        mac = meter.address,
                        rssi = meter.rssi.toLong()
                    )
                )
            }
        }
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        WaterMeterClient.getDefault().stopScan()
    }
}

class ScanElectricMeterImpl : AccessoryElectricMeterStartScanStreamHandler {
    var context: Context

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        register(messenger, this)
    }

    override fun onListen(
        p0: Any?,
        sink: PigeonEventSink<TTMeterScanModel>
    ) {
        super.onListen(p0, sink)
        ElectricMeterClient.getDefault().startScan { meter ->
            if (meter != null) {
                sink.success(
                    TTMeterScanModel(
                        name = meter.name,
                        mac = meter.address,
                        rssi = meter.rssi.toLong()
                    )
                )
            }
        }
    }

    override fun onCancel(p0: Any?) {
        super.onCancel(p0)
        ElectricMeterClient.getDefault().stopScan()
    }
}
