package com.ttlock.ttlock_flutter

import android.content.Context
import com.ttlock.bl.sdk.api.TTLockClient
import com.ttlock.bl.sdk.gateway.api.GatewayClient
import com.ttlock.bl.sdk.keypad.WirelessKeypadClient
import com.ttlock.bl.sdk.mulfunkeypad.api.MultifunctionalKeypadClient
import com.ttlock.bl.sdk.remote.api.RemoteClient
import com.ttlock.bl.sdk.wirelessdoorsensor.WirelessDoorSensorClient
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger


/** TtlockPremiseFlutterPlugin */
class TtlockFlutterPlugin: FlutterPlugin {
  private var context: Context? = null
  private var messenger: BinaryMessenger? = null
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private var scanLockImpl: ScanLockImpl? = null
  private var scanLockWifiImpl: ScanLockWifiImpl? = null
  private var addLockCardImpl: AddLockCardImpl? = null
  private var addLockFingerprintImpl: AddLockFingerprintImpl? = null
  private var addLockFaceImpl: AddLockFaceImpl? = null
  private var scanGatewayImpl: ScanGatewayImpl? = null
  private var scanGatewayWiFiImpl: ScanGatewayWiFiImpl? = null
  private var scanRemoteKeyImpl: ScanRemoteKeyImpl? = null
  private var scanRemoteKeypadImpl: ScanRemoteKeypadImpl? = null
  private var addKeypadFingerprintImpl: AddKeypadFingerprintImpl? = null
  private var addKeypadCardImpl: AddKeypadCardImpl? = null
  private var scanDoorSensorImpl: ScanDoorSensorImpl? = null
  private var scanStandaloneDoorSensorImpl: ScanStandaloneDoorSensorImpl? = null
  private var scanWaterMeterImpl: ScanWaterMeterImpl? = null
  private var scanElectricMeterImpl: ScanElectricMeterImpl? = null
  private var lockApi: LockApi? = null
  private var gatewayApi: GatewayApi? = null
  private var accessoryApi: AccessoryApi? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    this.context = flutterPluginBinding.applicationContext
    this.messenger = flutterPluginBinding.binaryMessenger
    initSdk()
    initModules()
  }

  private fun initSdk() {
    TTLockClient.getDefault().prepareBTService(context)
    GatewayClient.getDefault().prepareBTService(context)
    RemoteClient.getDefault().prepareBTService(context)
    WirelessKeypadClient.getDefault().prepareBTService(context)
    MultifunctionalKeypadClient.getDefault().prepareBTService(context)
    WirelessDoorSensorClient.getDefault().prepareBTService(context)
  }
  
  private fun initModules() {
    scanLockImpl = ScanLockImpl(context!!, messenger!!)
    scanLockWifiImpl = ScanLockWifiImpl(context!!, messenger!!)
    addLockCardImpl = AddLockCardImpl(context!!, messenger!!)
    addLockFingerprintImpl = AddLockFingerprintImpl(context!!, messenger!!)
    addLockFaceImpl = AddLockFaceImpl(context!!, messenger!!)
    scanGatewayImpl = ScanGatewayImpl(context!!, messenger!!)
    scanGatewayWiFiImpl = ScanGatewayWiFiImpl(context!!, messenger!!)
    scanRemoteKeyImpl = ScanRemoteKeyImpl(context!!, messenger!!)
    scanRemoteKeypadImpl = ScanRemoteKeypadImpl(context!!, messenger!!)
    addKeypadFingerprintImpl = AddKeypadFingerprintImpl(context!!, messenger!!)
    addKeypadCardImpl = AddKeypadCardImpl(context!!, messenger!!)
    scanDoorSensorImpl = ScanDoorSensorImpl(context!!, messenger!!)
    scanStandaloneDoorSensorImpl = ScanStandaloneDoorSensorImpl(context!!, messenger!!)
    scanWaterMeterImpl = ScanWaterMeterImpl(context!!, messenger!!)
    scanElectricMeterImpl = ScanElectricMeterImpl(context!!, messenger!!)
    lockApi = LockApi(context!!, messenger!!)
    gatewayApi = GatewayApi(context!!, messenger!!)
    accessoryApi = AccessoryApi(context!!, messenger!!)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    context = null
    messenger = null
  }

}