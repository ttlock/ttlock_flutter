package com.ttlock.ttlock_flutter

import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.content.Context
import android.text.TextUtils
import com.ttlock.bl.sdk.api.ExtendedBluetoothDevice
import com.ttlock.bl.sdk.api.TTLockClient
import com.ttlock.bl.sdk.entity.HotelData
import com.ttlock.bl.sdk.entity.LockError
import com.ttlock.bl.sdk.util.FeatureValueUtil
import com.ttlock.bl.sdk.util.LogUtil
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.ttlock.bl.sdk.callback.*
import com.ttlock.bl.sdk.constant.*
import com.ttlock.bl.sdk.entity.*
import io.flutter.plugin.common.BinaryMessenger
import kotlin.collections.emptyList

fun lockErrorToFlutterError(lockError: LockError): FlutterError {
    return FlutterError(
        code = lockErrorRevert(lockError).raw.toString(),
        message = lockError.errorMsg,
        details = lockError.description
    )
}

class LockApi: TTLockHostApi {
    var context: Context

    private val gson: Gson = Gson()

    private fun <T> parseJson(json: String, type: TypeToken<T>): T {
        return gson.fromJson(json, type.type)
    }

    private fun parseJsonListMaps(json: String): List<Map<String, Any?>> {
        if (TextUtils.isEmpty(json)) return emptyList()
        val type = object : TypeToken<List<Map<String, Any?>>>() {}
        return parseJson(json, type)
    }

    private fun buildValidityInfo(cycleList: List<TTCycleModel>?, startDate: Long, endDate: Long): ValidityInfo {
        val validityInfo = ValidityInfo()
        validityInfo.startDate = startDate
        validityInfo.endDate = endDate

        if (cycleList.isNullOrEmpty()) {
            validityInfo.modeType = ValidityInfo.TIMED
            return validityInfo
        }

        validityInfo.modeType = ValidityInfo.CYCLIC
        val cyclicConfigs: List<CyclicConfig> = run {
            val type = object : TypeToken<List<CyclicConfig>>() {}
            gson.fromJson(gson.toJson(cycleList), type.type)
        }
        validityInfo.cyclicConfigs = cyclicConfigs
        return validityInfo
    }

    constructor(context: Context, messenger: BinaryMessenger) {
        this.context = context
        TTLockHostApi.setUp(messenger, this)
    }

    override fun setEventLockData(lockData: String) {
        LockStreamParams.rememberLockData(lockData)
    }

    override fun getBluetoothState(): TTBluetoothState {
        if(TTLockClient.getDefault().isBLEEnabled(context)){
            return TTBluetoothState.TURN_ON
        }else{
            return  TTBluetoothState.TURN_OFF
        }
    }

    override fun initLock(params: TTLockInitParams, callback: (Result<String>) -> Unit) {
        val extendedBluetoothDevice = ExtendedBluetoothDevice()
        val device: BluetoothDevice =
            BluetoothAdapter.getDefaultAdapter().getRemoteDevice(params.lockMac)
        extendedBluetoothDevice.setDevice(device)
        extendedBluetoothDevice.address = params.lockMac

        val lockVersion = params.lockVersion
        extendedBluetoothDevice.protocolType = lockVersion.protocolType.toByte()
        extendedBluetoothDevice.protocolVersion = lockVersion.protocolVersion.toByte()
        extendedBluetoothDevice.scene = lockVersion.scene.toByte()

        extendedBluetoothDevice.setSettingMode(!params.isInited)

        if (!TextUtils.isEmpty(params.clientPara)) {
            extendedBluetoothDevice.manufacturerId = params.clientPara
        }

        if (!TextUtils.isEmpty(params.hotelInfo)) {
            val hotelData = HotelData()
            hotelData.hotelInfo = params.hotelInfo
            hotelData.buildingNumber = params.buildingNumber?.toInt() ?: 0
            hotelData.floorNumber = params.floorNumber?.toInt()?:0
            extendedBluetoothDevice.hotelData = hotelData
        }
        
        TTLockClient.getDefault().initLock(
            extendedBluetoothDevice,
            object : InitLockCallback {
                override fun onInitLockSuccess(lockData: String?) {
                    callback.invoke(Result.success(lockData?:""))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(FlutterError(
                        lockError.errorCode ?: "",
                        lockError.errorMsg,
                        lockError.description
                    )))
                }
            })

    }

    override fun resetLock(lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().resetLock(lockData, object : ResetLockCallback {
            override fun onResetLockSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun resetEkey(lockData: String, callback: (Result<String>) -> Unit) {
        TTLockClient.getDefault().resetEkey(lockData, object : ResetKeyCallback {
            override fun onResetKeySuccess(lockData: String) {
                callback.invoke(Result.success(lockData))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun resetLockByCode(lockMac: String, resetCode: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().resetLockByCode(lockMac, resetCode, object : ResetLockByCodeCallback {
            override fun onResetSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun verifyLock(lockMac: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().verifyLock(lockMac, object : VerifyLockCallback {
            override fun onVerifySuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun controlLock(
        lockData: String,
        action: TTControlAction,
        callback: (Result<ControlLockResult>) -> Unit
    ) {
        TTLockClient.getDefault().controlLock(controlActionConvert(action), lockData, object : ControlLockCallback {
            override fun onControlLockSuccess(controlLockResult: com.ttlock.bl.sdk.entity.ControlLockResult) {
                callback.invoke(
                    Result.success(
                        ControlLockResult(
                            lockTime = controlLockResult.lockTime,
                            electricQuantity = controlLockResult.battery.toLong(),
                            uniqueId = controlLockResult.uniqueid.toLong(),
                            lockData = ""
                        )
                    )
                )
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockSwitchState(lockData: String, callback: (Result<TTLockSwitchState>) -> Unit) {
        TTLockClient.getDefault().getLockStatus(lockData, object : GetLockStatusCallback {
            override fun onGetLockStatusSuccess(status: Int) {
                val state = lockSwitchStateRevert(status)
                callback.invoke(Result.success(state))
            }

            override fun onGetDoorSensorStatusSuccess(p0: Int) {

            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun supportFunction(
        function: TTLockFunction,
        lockData: String
    ): Boolean {
        val featureValue = featureValueConvert(function)
        if (featureValue == null) {
            return false
        }
        val r =  FeatureValueUtil.isSupportFeature(lockData, featureValue)
        LogUtil.d(function.name + ":" + r)

        return r
    }

    override fun createCustomPasscode(
        passcode: String,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        TTLockClient.getDefault().createCustomPasscode(
            passcode,
            startDate,
            endDate,
            lockData,
            object : CreateCustomPasscodeCallback {
                override fun onCreateCustomPasscodeSuccess(passcode: String) {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun modifyPasscode(
        passcodeOrigin: String,
        passcodeNew: String?,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        TTLockClient.getDefault().modifyPasscode(
            passcodeOrigin,
            passcodeNew,
            startDate,
            endDate,
            lockData,
            object : ModifyPasscodeCallback {
                override fun onModifyPasscodeSuccess() {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun deletePasscode(passcode: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().deletePasscode(passcode, lockData, object : DeletePasscodeCallback {
            override fun onDeletePasscodeSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun resetPasscode(lockData: String, callback: (Result<String>) -> Unit) {
        TTLockClient.getDefault().resetPasscode(lockData, object : ResetPasscodeCallback {
            override fun onResetPasscodeSuccess(lockData: String) {
                callback.invoke(Result.success(lockData))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getAdminPasscode(lockData: String, callback: (Result<String>) -> Unit) {
        TTLockClient.getDefault().getAdminPasscode(lockData, object : GetAdminPasscodeCallback {
            override fun onGetAdminPasscodeSuccess(passcode: String) {
                callback.invoke(Result.success(passcode))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setErasePasscode(erasePasscode: String, lockData: String) {
        // Older Android SDK versions may not expose this API in an obvious way.
        // We try to call it reflectively when the method exists; otherwise we just no-op.
        try {
            val client = TTLockClient.getDefault()
            val candidates = listOf(
                "setAdminErasePasscode",
                "eraseAdminPasscode",
                "setErasePasscode",
            )
            for (name in candidates) {
                val methods = client.javaClass.methods
                val method = methods.firstOrNull { m ->
                    m.name == name &&
                        m.parameterTypes.size == 2 &&
                        m.parameterTypes[0] == String::class.java &&
                        m.parameterTypes[1] == String::class.java
                }
                if (method != null) {
                    method.invoke(client, erasePasscode, lockData)
                    return
                }
            }
        } catch (e: Throwable) {
            LogUtil.d("setErasePasscode invoke failed: ${e.message}")
        }
    }

    override fun getAllValidPasscodes(lockData: String, callback: (Result<List<Map<String, Any?>>>) -> Unit) {
        TTLockClient.getDefault().getAllValidPasscodes(lockData, object : GetAllValidPasscodeCallback {
            override fun onGetAllValidPasscodeSuccess(passcodeStr: String) {
                callback.invoke(Result.success(parseJsonListMaps(passcodeStr)))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun recoverPasscode(
        passcode: String,
        passcodeNew: String,
        type: TTPasscodeType,
        startDate: Long,
        endDate: Long,
        cycleType: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        // Keep legacy behavior: new passcode is used as erase/admin passcode when provided.
        if (passcodeNew.isNotBlank()) {
            setErasePasscode(passcodeNew, lockData)
        }
        val recoveryData = RecoveryData()
        recoveryData.keyboardPwd = passcode
        recoveryData.startDate = startDate
        recoveryData.endDate = endDate
        recoveryData.cycleType = cycleType.toInt()
        recoveryData.keyboardPwdType = keyboardPwdTypeConvert(type).toInt()
        val recoveryDataList = listOf(recoveryData)
        val json = gson.toJson(recoveryDataList)
        TTLockClient.getDefault().recoverLockData(json, 1, lockData, object : RecoverLockDataCallback {
            override fun onRecoveryDataSuccess(type: Int) {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun modifyAdminPasscode(
        adminPasscode: String,
        lockData: String,
        callback: (Result<String?>) -> Unit
    ) {
        TTLockClient.getDefault().modifyAdminPasscode(adminPasscode, lockData, object : ModifyAdminPasscodeCallback {
            override fun onModifyAdminPasscodeSuccess(passcode: String) {
                callback.invoke(Result.success(passcode))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getPasscodeVerificationParams(lockData: String, callback: (Result<String>) -> Unit) {
//        TTLockClient.getDefault().getPasscodeVerificationParams(lockData, object : GetPasscodeVerificationInfoCallback {
//            override fun onGetInfoSuccess(lockData: String) {
//                callback.invoke(Result.success(lockData))
//            }
//
//            override fun onFail(lockError: LockError) {
//                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
//            }
//        })
    }

    override fun modifyCardValidityPeriod(
        cardNumber: String,
        cycleList: List<TTCycleModel>?,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val validityInfo = buildValidityInfo(cycleList, startDate, endDate)
        TTLockClient.getDefault().modifyICCardValidityPeriod(
            validityInfo,
            cardNumber,
            lockData,
            object : ModifyICCardPeriodCallback {
                override fun onModifyICCardPeriodSuccess() {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun deleteCard(cardNumber: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().deleteICCard(cardNumber, lockData, object : DeleteICCardCallback {
            override fun onDeleteICCardSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getAllValidCards(lockData: String, callback: (Result<List<Map<String, Any?>>>) -> Unit) {
        TTLockClient.getDefault().getAllValidICCards(lockData, object : GetAllValidICCardCallback {
            override fun onGetAllValidICCardSuccess(cardListStr: String) {
                callback.invoke(Result.success(parseJsonListMaps(cardListStr)))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun clearAllCards(lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().clearAllICCard(lockData, object : ClearAllICCardCallback {
            override fun onClearAllICCardSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun recoverCard(
        cardNumber: String,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val recoveryData = RecoveryData()
        recoveryData.cardType = 1
        recoveryData.cardNumber = cardNumber
        recoveryData.startDate = startDate
        recoveryData.endDate = endDate

        val recoveryDataList = listOf(recoveryData)
        val json = gson.toJson(recoveryDataList)
        TTLockClient.getDefault().recoverLockData(json, 2, lockData, object : RecoverLockDataCallback {
            override fun onRecoveryDataSuccess(type: Int) {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun reportLossCard(cardNumber: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().reportLossCard(cardNumber, lockData, object : ReportLossCardCallback {
            override fun onReportLossCardSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun modifyFingerprintValidityPeriod(
        fingerprintNumber: String,
        cycleList: List<TTCycleModel>?,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val validityInfo = buildValidityInfo(cycleList, startDate, endDate)
        TTLockClient.getDefault().modifyFingerprintValidityPeriod(
            validityInfo,
            fingerprintNumber,
            lockData,
            object : ModifyFingerprintPeriodCallback {
                override fun onModifyPeriodSuccess() {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun deleteFingerprint(fingerprintNumber: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().deleteFingerprint(fingerprintNumber, lockData, object : DeleteFingerprintCallback {
            override fun onDeleteFingerprintSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getAllValidFingerprints(lockData: String, callback: (Result<List<Map<String, Any?>>>) -> Unit) {
        TTLockClient.getDefault().getAllValidFingerprints(lockData, object : GetAllValidFingerprintCallback {
            override fun onGetAllFingerprintsSuccess(fingerprintStr: String) {
                callback.invoke(Result.success(parseJsonListMaps(fingerprintStr)))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun clearAllFingerprints(lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().clearAllFingerprints(lockData, object : ClearAllFingerprintCallback {
            override fun onClearAllFingerprintSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun modifyFace(
        faceNumber: String,
        cycleList: List<TTCycleModel>?,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val validityInfo = buildValidityInfo(cycleList, startDate, endDate)
        val faceNo = faceNumber.toLongOrNull()
        if (faceNo == null) {
            callback.invoke(
                Result.failure(
                    FlutterError(
                        code = "INVALID_PARAMETER",
                        message = "faceNumber is not a number",
                        details = faceNumber
                    )
                )
            )
            return
        }

        TTLockClient.getDefault().modifyFaceValidityPeriod(
            lockData,
            faceNo,
            validityInfo,
            object : ModifyFacePeriodCallback {
                override fun onModifySuccess() {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun addFaceData(
        cycleList: List<TTCycleModel>?,
        startDate: Long,
        endDate: Long,
        faceFeatureData: String,
        lockData: String,
        callback: (Result<String>) -> Unit
    ) {
        val validityInfo = buildValidityInfo(cycleList, startDate, endDate)
        TTLockClient.getDefault().addFaceFeatureData(
            lockData,
            faceFeatureData,
            validityInfo,
            object : AddFaceCallback {
                override fun onEnterAddMode() {
                    // no-op: legacy implementation reports progress via stream
                }

                override fun onCollectionStatus(faceCollectionStatus: FaceCollectionStatus) {
                    // no-op: we don't have progress events in this BasicMessageChannel
                }

                override fun onAddFinished(faceNumber: Long) {
                    callback.invoke(Result.success(faceNumber.toString()))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun deleteFace(faceNumber: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        val faceNo = faceNumber.toLongOrNull()
        if (faceNo == null) {
            callback.invoke(Result.failure(FlutterError("INVALID_PARAMETER", "faceNumber is not a number", faceNumber)))
            return
        }

        TTLockClient.getDefault().deleteFace(
            lockData,
            faceNo,
            object : DeleteFaceCallback {
                override fun onDeleteSuccess() {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun clearFace(lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().clearFace(lockData, object : ClearFaceCallback {
            override fun onClearSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setLockTime(timestamp: Long, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().setLockTime(timestamp, lockData, object : SetLockTimeCallback {
            override fun onSetTimeSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockTime(lockData: String, callback: (Result<Long>) -> Unit) {
        TTLockClient.getDefault().getLockTime(lockData, object : GetLockTimeCallback {
            override fun onGetLockTimeSuccess(lockTimestamp: Long) {
                callback.invoke(Result.success(lockTimestamp))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setLockWorkingTime(
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        TTLockClient.getDefault().setLockWorkingTime(startDate, endDate, lockData, object : SetLockWorkingTimeCallback {
            override fun onSetSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockOperateRecord(
        type: TTOperateRecordType,
        lockData: String,
        callback: (Result<String>) -> Unit
    ) {
        TTLockClient.getDefault().getOperationLog(operateLogTypeConvert(type).ordinal, lockData, object : GetOperationLogCallback {
            override fun onGetLogSuccess(log: String) {
                callback.invoke(Result.success(log))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockPower(lockData: String, callback: (Result<Long>) -> Unit) {
        TTLockClient.getDefault().getBatteryLevel(lockData, object : GetBatteryLevelCallback {
            override fun onGetBatteryLevelSuccess(electricQuantity: Int) {
                callback.invoke(Result.success(electricQuantity.toLong()))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockSystemInfo(lockData: String, callback: (Result<TTLockSystemModel>) -> Unit) {
        TTLockClient.getDefault().getLockSystemInfo(lockData, object : GetLockSystemInfoCallback {
            override fun onGetLockSystemInfoSuccess(deviceInfo: DeviceInfo) {

                val model = TTLockSystemModel(
                    modelNum = deviceInfo.modelNum,
                    hardwareRevision = deviceInfo.hardwareRevision,
                    firmwareRevision = deviceInfo.firmwareRevision,
                    electricQuantity = null,
                    nbOperator = deviceInfo.nbOperator,
                    nbNodeId = deviceInfo.nbNodeId,
                    nbCardNumber = deviceInfo.nbCardNumber,
                    nbRssi = deviceInfo.nbRssi.toString(),
                    lockData = deviceInfo.lockData
                )
                callback.invoke(Result.success(model))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockFeatureValue(lockData: String, callback: (Result<String>) -> Unit) {
        TTLockClient.getDefault().getLockSystemInfo(lockData, object : GetLockSystemInfoCallback {
            override fun onGetLockSystemInfoSuccess(deviceInfo: DeviceInfo) {
                callback.invoke(Result.success(deviceInfo.lockData))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getAutoLockingPeriodicTime(lockData: String, callback: (Result<AutoLockingTime>) -> Unit) {
        TTLockClient.getDefault().getAutomaticLockingPeriod(lockData, object : GetAutoLockingPeriodCallback {
            override fun onGetAutoLockingPeriodSuccess(currentTime: Int, minTime: Int, maxTime: Int) {
                callback.invoke(Result.success(AutoLockingTime(
                    currentTime = currentTime.toLong(),
                    minTime = minTime.toLong(),
                    maxTime = maxTime.toLong()
                )))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setAutoLockingPeriodicTime(seconds: Long, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().setAutomaticLockingPeriod(seconds.toInt(), lockData, object : SetAutoLockingPeriodCallback {
            override fun onSetAutoLockingPeriodSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getRemoteUnlockSwitchState(lockData: String, callback: (Result<Boolean>) -> Unit) {
        TTLockClient.getDefault().getRemoteUnlockSwitchState(lockData, object : GetRemoteUnlockStateCallback {
            override fun onGetRemoteUnlockSwitchStateSuccess(enabled: Boolean) {
                callback.invoke(Result.success(enabled))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setRemoteUnlockSwitchState(
        isOn: Boolean,
        lockData: String,
        callback: (Result<String>) -> Unit
    ) {
        TTLockClient.getDefault().setRemoteUnlockSwitchState(isOn, lockData, object : SetRemoteUnlockSwitchCallback {
            override fun onSetRemoteUnlockSwitchSuccess(lockData: String) {
                callback.invoke(Result.success(lockData))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockConfig(
        config: TTLockConfig,
        lockData: String,
        callback: (Result<Boolean>) -> Unit
    ) {

        TTLockClient.getDefault().getLockConfig(lockConfigConvert(config), lockData, object : GetLockConfigCallback {
            override fun onGetLockConfigSuccess(ttLockConfigType: TTLockConfigType, switchOn: Boolean) {
                callback.invoke(Result.success(switchOn))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setLockConfig(
        config: TTLockConfig,
        isOn: Boolean,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {

        TTLockClient.getDefault().setLockConfig(lockConfigConvert(config), isOn, lockData, object : SetLockConfigCallback {
            override fun onSetLockConfigSuccess(ttLockConfigType: TTLockConfigType) {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockDirection(lockData: String, callback: (Result<TTLockDirection>) -> Unit) {
        TTLockClient.getDefault().getUnlockDirection(lockData, object : GetUnlockDirectionCallback {
            override fun onGetUnlockDirectionSuccess(unlockDirection: UnlockDirection) {
                val direction = if (unlockDirection == UnlockDirection.LEFT) TTLockDirection.LEFT else TTLockDirection.RIGHT
                callback.invoke(Result.success(direction))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setLockDirection(
        direction: TTLockDirection,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val unlockDirection = if (direction == TTLockDirection.RIGHT) UnlockDirection.RIGHT else UnlockDirection.LEFT
        TTLockClient.getDefault().setUnlockDirection(unlockDirection, lockData, object : SetUnlockDirectionCallback {
            override fun onSetUnlockDirectionSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun addPassageMode(
        type: TTPassageModeType,
        weekly: List<Long>?,
        monthly: List<Long>?,
        startTime: Long,
        endTime: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val passageModeConfig = PassageModeConfig()
        val passageModeType = passageModeTypeConvert(type)
        passageModeConfig.modeType = passageModeType

        val repeatJson = if (passageModeType == PassageModeType.Monthly) {
            gson.toJson(monthly ?: emptyList<Long>())
        } else {
            gson.toJson(weekly ?: emptyList<Long>())
        }
        passageModeConfig.repeatWeekOrDays = repeatJson
        passageModeConfig.setStartDate(startTime.toInt())
        passageModeConfig.setEndDate(endTime.toInt())

        TTLockClient.getDefault().setPassageMode(passageModeConfig, lockData, object : SetPassageModeCallback {
            override fun onSetPassageModeSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun clearAllPassageModes(lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().clearPassageMode(lockData, object : ClearPassageModeCallback {
            override fun onClearPassageModeSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun activateLift(
        floors: String,
        lockData: String,
        callback: (Result<ControlLockResult>) -> Unit
    ) {
        val floorList = floors.split(",")
            .map { it.trim() }
            .filter { it.isNotEmpty() }
            .mapNotNull { it.toIntOrNull() }

        if (floorList.isEmpty()) {
            callback.invoke(Result.failure(FlutterError("INVALID_PARAMETER", "floors is empty/invalid", floors)))
            return
        }

        val currentTime = System.currentTimeMillis()
        TTLockClient.getDefault().activateLiftFloors(floorList, currentTime, lockData, object : ActivateLiftFloorsCallback {
            override fun onActivateLiftFloorsSuccess(activateLiftFloorsResult: ActivateLiftFloorsResult) {
                callback.invoke(Result.success(
                    ControlLockResult(
                        lockTime = activateLiftFloorsResult.deviceTime,
                        electricQuantity = activateLiftFloorsResult.battery.toLong(),
                        uniqueId = activateLiftFloorsResult.uniqueid.toLong(),
                        lockData = null
                    )
                ))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setLiftControlable(floors: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().setLiftControlableFloors(floors, lockData, object : SetLiftControlableFloorsCallback {
            override fun onSetLiftControlableFloorsSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setLiftWorkMode(
        type: TTLiftWorkActivateType,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {

        TTLockClient.getDefault().setLiftWorkMode(liftWorkActivateTypeConvert(type), lockData, object : SetLiftWorkModeCallback {
            override fun onSetLiftWorkModeSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setPowerSaverWorkMode(
        type: TTPowerSaverWorkType,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {

        TTLockClient.getDefault().setPowerSaverWorkMode(powerSaverWorkModeConvert(type), lockData, object : SetPowerSaverWorkModeCallback {
            override fun onSetPowerSaverWorkModeSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setPowerSaverControlableLock(lockMac: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().setPowerSaverControlableLock(lockMac, lockData, object : SetPowerSaverControlableLockCallback {
            override fun onSetPowerSaverControlableLockSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setHotel(
        hotelInfo: String,
        buildingNumber: Long,
        floorNumber: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        if (TextUtils.isEmpty(hotelInfo)) {
            callback.invoke(Result.failure(FlutterError("INVALID_PARAMETER", "hotelInfo is empty", hotelInfo)))
            return
        }

        val hotelData = HotelData().apply {
            this.hotelInfo = hotelInfo
            this.buildingNumber = buildingNumber.toInt()
            this.floorNumber = floorNumber.toInt()
        }

        TTLockClient.getDefault().setHotelData(hotelData, lockData, object : SetHotelDataCallback {
            override fun onSetHotelDataSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setHotelCardSector(sector: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        if (TextUtils.isEmpty(sector)) {
            callback.invoke(Result.failure(FlutterError("INVALID_PARAMETER", "sector is empty", sector)))
            return
        }

        TTLockClient.getDefault().setHotelCardSector(sector, lockData, object : SetHotelCardSectorCallback {
            override fun onSetHotelCardSectorSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getLockVersion(lockMac: String, callback: (Result<String>) -> Unit) {
        TTLockClient.getDefault().getLockVersion(lockMac, object : GetLockVersionCallback {
            override fun onGetLockVersionSuccess(lockVersion: String) {
                callback.invoke(Result.success(lockVersion))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setNBServerAddress(
        ip: String,
        port: String,
        lockData: String,
        callback: (Result<Long>) -> Unit
    ) {
        val portInt = port.toIntOrNull()
        if (portInt == null) {
            callback.invoke(Result.failure(FlutterError("INVALID_PARAMETER", "port is invalid", port)))
            return
        }

        TTLockClient.getDefault().setNBServerInfo(portInt.toShort(), ip, lockData, object : SetNBServerCallback {
            override fun onSetNBServerSuccess(battery: Int) {
                callback.invoke(Result.success(battery.toLong()))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun configWifi(
        wifiName: String,
        wifiPassword: String,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        TTLockClient.getDefault().configWifi(wifiName, wifiPassword, lockData, object : ConfigWifiCallback {
            override fun onConfigWifiSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun configServer(ip: String, port: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        val ipValue = if (TextUtils.isEmpty(ip)) "wifilock.ttlock.com" else ip
        val portValue = if (TextUtils.isEmpty(port)) "4999" else port
        val portInt = portValue.toIntOrNull()
        if (portInt == null) {
            callback.invoke(Result.failure(FlutterError("INVALID_PARAMETER", "port is invalid", port)))
            return
        }

        TTLockClient.getDefault().configServer(ipValue, portInt, lockData, object : ConfigServerCallback {
            override fun onConfigServerSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getWifiInfo(lockData: String, callback: (Result<TTWifiInfoModel>) -> Unit) {
        TTLockClient.getDefault().getWifiInfo(lockData, object : GetWifiInfoCallback {
            override fun onGetWiFiInfoSuccess(wifiLockInfo: WifiLockInfo) {
                callback.invoke(Result.success(TTWifiInfoModel(wifiLockInfo.wifiMac, wifiLockInfo.wifiRssi.toLong())))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun configIp(
        ipSetting: TTIpSetting,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        try {
            val ipSettingNative = gson.fromJson(gson.toJson(ipSetting), IpSetting::class.java)
            TTLockClient.getDefault().configIp(ipSettingNative, lockData, object : ConfigIpCallback {
                override fun onConfigIpSuccess() {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            })
        } catch (e: Throwable) {
            callback.invoke(Result.failure(FlutterError("INVALID_PARAMETER", "configIp parse failed", e.message)))
        }
    }

    override fun configCameraLockWifi(
        wifiName: String,
        wifiPassword: String,
        lockData: String,
        callback: (Result<CameraLockWifiResult>) -> Unit
    ) {
        TTLockClient.getDefault().configCameraLockWifi(
            wifiName,
            wifiPassword,
            lockData,
            object : ConfigCameraLockWifiCallback {
                override fun onConfigSuccess(cameraLockWifiInfo: CameraLockWifiInfo) {
                    val serialNumber = cameraLockWifiInfo.videoModuleSerialNumber ?: ""
                    val wifiMac = cameraLockWifiInfo.wifiMac ?: ""
                    callback.invoke(Result.success(CameraLockWifiResult(serialNumber, wifiMac)))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun setSoundVolume(
        type: TTSoundVolumeType,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {

        TTLockClient.getDefault().setLockSoundWithSoundVolume(soundVolumeConvert(type), lockData, object : SetLockSoundWithSoundVolumeCallback {
            override fun onSetLockSoundSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getSoundVolume(lockData: String, callback: (Result<TTSoundVolumeType>) -> Unit) {
        TTLockClient.getDefault().getLockSoundWithSoundVolume(lockData, object : GetLockSoundWithSoundVolumeCallback {
            override fun onGetLockSoundSuccess(enable: Boolean, soundVolume: SoundVolume) {
                val type = if (enable) {
                    soundVolumeRevert(soundVolume)
                } else {
                    TTSoundVolumeType.OFF
                }
                callback.invoke(Result.success(type))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setSensitivity(
        value: TTSensitivityValue,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {

        TTLockClient.getDefault().setSensitivity(lockData, value.raw, object : SetSensitivityCallback {
            override fun onSetSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setRemoteKeyValidDate(
        remoteKeyMac: String,
        cycleList: List<TTCycleModel>?,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val validityInfo = buildValidityInfo(cycleList, startDate, endDate)
        TTLockClient.getDefault().modifyRemoteValidityPeriod(
            remoteKeyMac,
            validityInfo,
            lockData,
            object : ModifyRemoteValidityPeriodCallback {
                override fun onModifySuccess() {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun addRemoteKey(
        remoteKeyMac: String,
        cycleList: List<TTCycleModel>?,
        startDate: Long,
        endDate: Long,
        lockData: String,
        callback: (Result<Unit>) -> Unit
    ) {
        val validityInfo = buildValidityInfo(cycleList, startDate, endDate)
        TTLockClient.getDefault().addRemote(
            remoteKeyMac,
            validityInfo,
            lockData,
            object : AddRemoteCallback {
                override fun onAddSuccess() {
                    callback.invoke(Result.success(Unit))
                }

                override fun onFail(lockError: LockError) {
                    callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
                }
            }
        )
    }

    override fun deleteRemoteKey(remoteKeyMac: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().deleteRemote(remoteKeyMac, lockData, object : DeleteRemoteCallback {
            override fun onDeleteSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun clearRemoteKey(lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().clearRemote(lockData, object : ClearRemoteCallback {
            override fun onClearSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun getRemoteAccessoryElectricQuantity(
        accessory: Long,
        mac: String,
        lockData: String,
        callback: (Result<AccessoryElectricQuantityResult>) -> Unit
    ) {
        val accessoryInfo = AccessoryInfo()
        val accessoryType = when (accessory) {
            0L -> AccessoryType.REMOTE
            1L -> AccessoryType.WIRELESS_KEYPAD
            2L -> AccessoryType.DOOR_SENSOR
            else -> AccessoryType.REMOTE
        }
        accessoryInfo.accessoryType = accessoryType
        accessoryInfo.accessoryMac = mac

        TTLockClient.getDefault().getAccessoryBatteryLevel(accessoryInfo, lockData, object : GetAccessoryBatteryLevelCallback {
            override fun onGetAccessoryBatteryLevelSuccess(accessoryInfo: AccessoryInfo) {
                callback.invoke(
                    Result.success(
                        AccessoryElectricQuantityResult(
                            electricQuantity = accessoryInfo.accessoryBattery.toLong(),
                            updateDate = accessoryInfo.batteryDate
                        )
                    )
                )
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun addDoorSensor(doorSensorMac: String, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().addDoorSensor(doorSensorMac, lockData, object : AddDoorSensorCallback {
            override fun onAddSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun deleteDoorSensor(lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().deleteDoorSensor(lockData, object : DeleteDoorSensorCallback {
            override fun onDeleteSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

    override fun setDoorSensorAlertTime(alertTime: Long, lockData: String, callback: (Result<Unit>) -> Unit) {
        TTLockClient.getDefault().setDoorSensorAlertTime(alertTime.toInt(), lockData, object : SetDoorSensorAlertTimeCallback {
            override fun onSetDoorSensorAlertTimeSuccess() {
                callback.invoke(Result.success(Unit))
            }

            override fun onFail(lockError: LockError) {
                callback.invoke(Result.failure(lockErrorToFlutterError(lockError)))
            }
        })
    }

}