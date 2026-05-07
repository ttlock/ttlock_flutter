package com.ttlock.ttlock_flutter

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.ttlock.bl.sdk.entity.CyclicConfig
import com.ttlock.bl.sdk.entity.ValidityInfo

/**
 * 供无参 EventChannel 流使用的上下文：lockData / 有效期。
 * 仅由 [TTLockHostApi.setEventLockData] 写入 lockData。
 */
object LockStreamParams {
    @Volatile
    var lockData: String? = null

    @Volatile
    var cycleList: List<TTCycleModel>? = null

    var startDate: Long = System.currentTimeMillis()
    var endDate: Long = System.currentTimeMillis() + 30L * 24 * 3600 * 1000

    private val gson = Gson()

    fun rememberLockData(lockData: String) {
        if (lockData.isNotEmpty()) {
            this.lockData = lockData
        }
    }

    fun buildValidityInfo(): ValidityInfo {
        val validityInfo = ValidityInfo()
        validityInfo.startDate = startDate
        validityInfo.endDate = endDate
        val list = cycleList
        if (list.isNullOrEmpty()) {
            validityInfo.modeType = ValidityInfo.TIMED
            return validityInfo
        }
        validityInfo.modeType = ValidityInfo.CYCLIC
        val cyclicConfigs: List<CyclicConfig> = run {
            val type = object : TypeToken<List<CyclicConfig>>() {}
            gson.fromJson(gson.toJson(list), type.type)
        }
        validityInfo.cyclicConfigs = cyclicConfigs
        return validityInfo
    }
}
