import Flutter
import Foundation
import TTLockSDK

public final class TtlockFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let context = EventContextStore.shared

    let lockApi = LockHostApiImpl(context: context)
    let gatewayApi = GatewayHostApiImpl(context: context)
    let accessoryApi = AccessoryHostApiImpl(context: context)

    TTLockHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: lockApi)
    TTGatewayHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: gatewayApi)
    TTAccessoryHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: accessoryApi)

    LockScanLockStreamHandler.register(
      with: registrar.messenger(), streamHandler: LockScanLockStreamHandlerImpl())
    LockScanWifiStreamHandler.register(
      with: registrar.messenger(), streamHandler: LockScanWifiStreamHandlerImpl())
    LockAddCardStreamHandler.register(
      with: registrar.messenger(), streamHandler: LockAddCardStreamHandlerImpl())
    LockAddFingerprintStreamHandler.register(
      with: registrar.messenger(), streamHandler: LockAddFingerprintStreamHandlerImpl())
    LockAddFaceStreamHandler.register(
      with: registrar.messenger(), streamHandler: LockAddFaceStreamHandlerImpl())
    GatewayStartScanStreamHandler.register(
      with: registrar.messenger(), streamHandler: GatewayStartScanStreamHandlerImpl())
    GatewayGetNearbyWifiStreamHandler.register(
      with: registrar.messenger(), streamHandler: GatewayGetNearbyWifiStreamHandlerImpl())
    AccessoryStartScanRemoteKeyStreamHandler.register(
      with: registrar.messenger(), streamHandler: AccessoryStartScanRemoteKeyStreamHandlerImpl())
    AccessoryStartScanRemoteKeypadStreamHandler.register(
      with: registrar.messenger(), streamHandler: AccessoryStartScanRemoteKeypadStreamHandlerImpl())
    AccessoryAddKeypadFingerprintStreamHandler.register(
      with: registrar.messenger(), streamHandler: AccessoryAddKeypadFingerprintStreamHandlerImpl())
    AccessoryAddKeypadCardStreamHandler.register(
      with: registrar.messenger(), streamHandler: AccessoryAddKeypadCardStreamHandlerImpl())
    AccessoryStartScanDoorSensorStreamHandler.register(
      with: registrar.messenger(), streamHandler: AccessoryStartScanDoorSensorStreamHandlerImpl())
    AccessoryStandaloneDoorSensorStartScanStreamHandler.register(
      with: registrar.messenger(),
      streamHandler: AccessoryStandaloneDoorSensorStartScanStreamHandlerImpl())
    AccessoryWaterMeterStartScanStreamHandler.register(
      with: registrar.messenger(), streamHandler: AccessoryWaterMeterStartScanStreamHandlerImpl())
    AccessoryElectricMeterStartScanStreamHandler.register(
      with: registrar.messenger(), streamHandler: AccessoryElectricMeterStartScanStreamHandlerImpl()
    )

    TTLock.setupBluetooth { bluetoothState in
      NSLog("bluetoothState: \(bluetoothState)")
    }
  }
}
