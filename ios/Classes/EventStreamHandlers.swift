import Foundation
import TTLockOnPremise

// MARK: - Shared helpers

private let streamContext = EventContextStore.shared

private func pigeonLockVersion(fromLockVersion value: Any?) -> TTLockVersion {
  func fromDict(_ d: [String: Any]) -> TTLockVersion {
    TTLockVersion(
      protocolType: Int64(d["protocolType"] as? Int ?? 0),
      protocolVersion: Int64(d["protocolVersion"] as? Int ?? 0),
      scene: Int64(d["scene"] as? Int ?? 0),
      groupId: Int64(d["groupId"] as? Int ?? 0),
      orgId: Int64(d["orgId"] as? Int ?? 0)
    )
  }
  if let s = value as? String, let data = s.data(using: .utf8),
    let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
  {
    return fromDict(obj)
  }
  if let d = value as? [String: Any] {
    return fromDict(d)
  }
  return TTLockVersion(
    protocolType: 0, protocolVersion: 0, scene: 0, groupId: 0, orgId: 0)
}

private func cyclicConfigDictArray(from cyclic: [[AnyHashable: Any]]?) -> [[String: Any]] {
  guard let cyclic else { return [] }
  return cyclic.map { row in
    var out: [String: Any] = [:]
    for (k, v) in row {
      if let ks = k as? String { out[ks] = v }
    }
    return out
  }
}

private func wifiEntries(from wifiArr: [Any]?) -> [TTWifiScanEntry] {
  guard let wifiArr else { return [] }
  var out: [TTWifiScanEntry] = []
  for item in wifiArr {
    guard let dict = item as? [String: Any] else { continue }
    let ssid =
      (dict["SSID"] as? String)
      ?? (dict["ssid"] as? String)
      ?? ""
    let rssi = (dict["RSSI"] as? NSNumber)?.intValue ?? (dict["rssi"] as? NSNumber)?.intValue ?? 0
    out.append(
      TTWifiScanEntry(
        wifiMac: nil,
        wifiRssi: Int64(rssi),
        bssid: nil,
        ssid: ssid.isEmpty ? nil : ssid,
        wifiName: ssid.isEmpty ? nil : ssid,
        name: ssid.isEmpty ? nil : ssid
      ))
  }
  return out
}

// MARK: - Lock

final class LockScanLockStreamHandlerImpl: LockScanLockStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<TTLockScanModel>) {
    TTLock.startScan { scanModel in
      guard let m = scanModel else { return }
        let tsMs = Int64((m.date).timeIntervalSince1970 * 1000)
      let model = TTLockScanModel(
        lockName: m.lockName,
        lockMac: m.lockMac,
        isInited: m.isInited,
        isAllowUnlock: m.isAllowUnlock,
        electricQuantity: Int64(m.electricQuantity),
        lockVersion: pigeonLockVersion(fromLockVersion: m.lockVersion),
        lockSwitchState: lockSwitchStateRevert(m.lockSwitchState),
        rssi: Int64(m.rssi),
        oneMeterRssi: Int64(m.oneMeterRSSI),
        timestamp: tsMs
      )
      sink.success(model)
    }
  }

  override func onCancel(withArguments arguments: Any?) {
    TTLock.stopScan()
  }
}

final class LockScanWifiStreamHandlerImpl: LockScanWifiStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<TTWifiScanResult>) {
    guard let lockData = streamContext.lockData, !lockData.isEmpty else {
      sink.error(
        code: "NO_LOCK_DATA",
        message: "请先通过 setEventLockData 设置 lockData 后再使用 lockScanWifi",
        details: nil)
      return
    }
    TTLock.scanWifi(withLockData: lockData) { isFinished, wifiArr in
      _ = isFinished
        sink.success(TTWifiScanResult(wifiList: wifiEntries(from: wifiArr)))
    } failure: { code, msg in
      sink.error(
        code: "\(lockErrorConvert(code).rawValue)",
        message: msg,
        details: nil)
    }
  }

  override func onCancel(withArguments arguments: Any?) {}
}

final class LockAddCardStreamHandlerImpl: LockAddCardStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<AddCardEvent>) {
    guard let lockData = streamContext.lockData, !lockData.isEmpty else {
      sink.error(
        code: "NO_LOCK_DATA",
        message: "请先通过 setEventLockData 设置 lockData 后再使用 lockAddCard",
        details: nil)
      return
    }
    let (start, end, cyclic) = streamContext.validityRangeForAddOperations()
    let config = cyclicConfigDictArray(from: cyclic)
    TTLock.addICCard(
      withCyclicConfig: config, startDate: start, endDate: end, lockData: lockData,
      progress: { state in
        sink.success(AddCardEvent(isProgress: true, cardNumber: nil))
        _ = state
      },
      success: { cardNumber in
        sink.success(AddCardEvent(isProgress: false, cardNumber: cardNumber))
      },
      failure: { code, msg in
        sink.error(
          code: "\(lockErrorConvert(code).rawValue)",
          message: msg,
          details: nil)
      })
  }

  override func onCancel(withArguments arguments: Any?) {}
}

final class LockAddFingerprintStreamHandlerImpl: LockAddFingerprintStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<AddFingerprintEvent>) {
    guard let lockData = streamContext.lockData, !lockData.isEmpty else {
      sink.error(
        code: "NO_LOCK_DATA",
        message: "请先通过 setEventLockData 设置 lockData 后再使用 lockAddFingerprint",
        details: nil)
      return
    }
    let (start, end, cyclic) = streamContext.validityRangeForAddOperations()
    let config = cyclicConfigDictArray(from: cyclic)
    TTLock.addFingerprint(
      withCyclicConfig: config, startDate: start, endDate: end, lockData: lockData,
      progress: { current, total in
        sink.success(
          AddFingerprintEvent(
            isProgress: true,
            currentCount: Int64(current),
            totalCount: Int64(total),
            fingerprintNumber: nil
          ))
      },
      success: { fingerprintNumber in
        sink.success(
          AddFingerprintEvent(
            isProgress: false,
            currentCount: nil,
            totalCount: nil,
            fingerprintNumber: fingerprintNumber
          ))
      },
      failure: { code, msg in
        sink.error(
          code: "\(lockErrorConvert(code).rawValue)",
          message: msg,
          details: nil)
      })
  }

  override func onCancel(withArguments arguments: Any?) {}
}

final class LockAddFaceStreamHandlerImpl: LockAddFaceStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<AddFaceEvent>) {
    guard let lockData = streamContext.lockData, !lockData.isEmpty else {
      sink.error(
        code: "NO_LOCK_DATA",
        message: "请先通过 setEventLockData 设置 lockData 后再使用 lockAddFace",
        details: nil)
      return
    }
    let (start, end, cyclic) = streamContext.validityRangeForAddOperations()
    let config = cyclicConfigDictArray(from: cyclic)
    TTLock.addFace(
      withCyclicConfig: config, startDate: start, endDate: end, lockData: lockData,
      progress: { state, faceError in
        if state == .canStartAdd || state == .error {
          let pigeonState: TTFaceState? =
            state == .canStartAdd
            ? .canStartAdd
            : (state == .error ? .error : nil)
          sink.success(
            AddFaceEvent(
              isProgress: true,
              state: pigeonState,
              errorCode: faceErrorConvert(faceError),
              faceNumber: nil
            ))
        }
      },
      success: { faceNumber in
        sink.success(
          AddFaceEvent(
            isProgress: false,
            state: nil,
            errorCode: nil,
            faceNumber: faceNumber
          ))
      },
      failure: { code, msg in
        sink.error(
          code: "\(lockErrorConvert(code).rawValue)",
          message: msg,
          details: nil)
      })
  }

  override func onCancel(withArguments arguments: Any?) {}
}

// MARK: - Gateway

final class GatewayStartScanStreamHandlerImpl: GatewayStartScanStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<TTGatewayScanModel>) {
    TTGateway.startScanGateway { model in
      guard let m = model else { return }
      let pigeonType = TTGatewayType(rawValue: Int(m.type.rawValue) - 1) ?? .g2
      sink.success(
        TTGatewayScanModel(
          gatewayName: m.gatewayName ?? "",
          gatewayMac: m.gatewayMac ?? "",
          rssi: Int64(m.rssi),
          isDfuMode: m.isDfuMode,
          type: pigeonType
        ))
    }
  }

  override func onCancel(withArguments arguments: Any?) {
    TTGateway.stopScanGateway()
  }
}

final class GatewayGetNearbyWifiStreamHandlerImpl: GatewayGetNearbyWifiStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<TTWifiScanResult>) {
    guard let mac = streamContext.gatewayMac, !mac.isEmpty else {
      sink.error(
        code: "NO_GATEWAY",
        message: "请先通过 setEventGatewayMac 设置已连接网关 MAC 后再使用 gatewayGetNearbyWifi",
        details: nil)
      return
    }
    TTGateway.scanWiFiByGateway { isFinished, wifiArr, status in
      if status.rawValue == 0 {
          sink.success(TTWifiScanResult(wifiList: wifiEntries(from: wifiArr)))
        _ = isFinished
      } else {
        let ge = gatewayErrorConvert(status)
        sink.error(code: "\(ge.rawValue)", message: nil, details: nil)
      }
    }
  }

  override func onCancel(withArguments arguments: Any?) {}
}

// MARK: - Accessory scan / keypad

final class AccessoryStartScanRemoteKeyStreamHandlerImpl: AccessoryStartScanRemoteKeyStreamHandler {
  override func onListen(
    withArguments arguments: Any?, sink: PigeonEventSink<TTRemoteAccessoryScanModel>
  ) {
    TTWirelessKeyFob.startScan { model in
      guard let m = model else { return }
      sink.success(
        TTRemoteAccessoryScanModel(
          name: m.keyFobName ?? "",
          mac: m.keyFobMac ?? "",
          rssi: Int64(m.rssi),
          scanTime: Int64(Date().timeIntervalSince1970 * 1000),
          isMultifunctionalKeypad: false,
          advertisementData: [:]
        ))
    }
  }

  override func onCancel(withArguments arguments: Any?) {
    TTWirelessKeyFob.stopScan()
  }
}

final class AccessoryStartScanRemoteKeypadStreamHandlerImpl:
  AccessoryStartScanRemoteKeypadStreamHandler
{
  override func onListen(
    withArguments arguments: Any?, sink: PigeonEventSink<TTRemoteAccessoryScanModel>
  ) {
    TTWirelessKeypad.startScanKeypad { model in
      guard let m = model else { return }
      var adv: [String: Any?] = [:]
        if let raw = m.advertisementData {
        for (k, v) in raw {
          if let ks = k as? String { adv[ks] = v as Any? }
        }
      }
      sink.success(
        TTRemoteAccessoryScanModel(
          name: m.keypadName ?? "",
          mac: m.keypadMac ?? "",
          rssi: Int64(m.rssi),
          scanTime: Int64(Date().timeIntervalSince1970 * 1000),
          isMultifunctionalKeypad: m.isMultifunctionalKeypad,
          advertisementData: adv
        ))
    }
  }

  override func onCancel(withArguments arguments: Any?) {
    TTWirelessKeypad.stopScanKeypad()
  }
}

final class AccessoryAddKeypadFingerprintStreamHandlerImpl:
  AccessoryAddKeypadFingerprintStreamHandler
{
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<AddFingerprintEvent>) {
    guard let lockData = streamContext.lockData, !lockData.isEmpty else {
      sink.error(
        code: "NO_LOCK_DATA",
        message: "请先设置 lockData（多功能键盘需先 initMultifunctionalKeypad）",
        details: nil)
      return
    }
    guard let keypadMac = streamContext.keypadMac, !keypadMac.isEmpty else {
      sink.error(
        code: "NO_KEYPAD",
        message: "请先通过 setEventKeypadMac 设置键盘 MAC",
        details: nil)
      return
    }
    let (start, end, cyclic) = streamContext.validityRangeForAddOperations()
    let config = cyclicConfigDictArray(from: cyclic)
    let multi = streamContext.isMultifunctionalKeypad
    TTWirelessKeypad.addFingerprint(
      withCyclicConfig: config, startDate: start, endDate: end, keypadMac: keypadMac,
      lockData: lockData,
      progress: { current, total in
        sink.success(
          AddFingerprintEvent(
            isProgress: true,
            currentCount: Int64(current),
            totalCount: Int64(total),
            fingerprintNumber: nil
          ))
      },
      success: { fingerprintNumber in
        sink.success(
          AddFingerprintEvent(
            isProgress: false,
            currentCount: nil,
            totalCount: nil,
            fingerprintNumber: fingerprintNumber
          ))
      },
      lockFailure: { code, msg in
        sink.error(
          code: "\(lockErrorConvert(code).rawValue)",
          message: msg,
          details: nil)
      },
      keypadFailure: { status in
        let pigeon =
          multi
          ? multifunctionalKeypadErrorConvert(status).rawValue
          : keypadErrorConvert(status).rawValue
        sink.error(code: "\(pigeon)", message: nil, details: nil)
      })
  }

  override func onCancel(withArguments arguments: Any?) {}
}

final class AccessoryAddKeypadCardStreamHandlerImpl: AccessoryAddKeypadCardStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<AddCardEvent>) {
    guard let lockData = streamContext.lockData, !lockData.isEmpty else {
      sink.error(
        code: "NO_LOCK_DATA",
        message: "请先设置 lockData",
        details: nil)
      return
    }
    let (start, end, cyclic) = streamContext.validityRangeForAddOperations()
    let config = cyclicConfigDictArray(from: cyclic)
    TTWirelessKeypad.addCard(
      withCyclicConfig: config, startDate: start, endDate: end, lockData: lockData,
      progress: { _ in
        sink.success(AddCardEvent(isProgress: true, cardNumber: nil))
      },
      success: { cardNumber in
        sink.success(AddCardEvent(isProgress: false, cardNumber: cardNumber))
      },
      lockFailure: { code, msg in
        sink.error(
          code: "\(lockErrorConvert(code).rawValue)",
          message: msg,
          details: nil)
      })
  }

  override func onCancel(withArguments arguments: Any?) {}
}

final class AccessoryStartScanDoorSensorStreamHandlerImpl: AccessoryStartScanDoorSensorStreamHandler {
  override func onListen(
    withArguments arguments: Any?, sink: PigeonEventSink<TTRemoteAccessoryScanModel>
  ) {
    TTDoorSensor.startScan(
      success: { model in
        sink.success(
          TTRemoteAccessoryScanModel(
            name: model.name,
            mac: model.mac,
            rssi: Int64(model.rssi),
            scanTime: model.scanTime,
            isMultifunctionalKeypad: false,
            advertisementData: [:]
          ))
      },
      failure: { err in
        sink.error(
          code: "\(doorSensorErrorConvert(err).rawValue)",
          message: nil,
          details: nil)
      })
  }

  override func onCancel(withArguments arguments: Any?) {
    TTDoorSensor.stopScan()
  }
}

final class AccessoryStandaloneDoorSensorStartScanStreamHandlerImpl:
  AccessoryStandaloneDoorSensorStartScanStreamHandler
{
  override func onListen(
    withArguments arguments: Any?, sink: PigeonEventSink<TTStandaloneDoorSensorScanModel>
  ) {
    sink.error(
      code: "STANDALONE_DOOR_SENSOR_SDK_UNAVAILABLE",
      message:
        "当前集成的 TTLockOnPremise XCFramework 未包含 TTStandaloneDoorSensor；请升级 SDK 或参考 TtlockFlutterPlugin.m 接入独立门磁扫描。",
      details: nil)
  }

  override func onCancel(withArguments arguments: Any?) {}
}

final class AccessoryWaterMeterStartScanStreamHandlerImpl: AccessoryWaterMeterStartScanStreamHandler {
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<TTMeterScanModel>) {
    TTWaterMeter.startScan(
      success: { model in
        sink.success(
          TTMeterScanModel(
            name: model.name,
            mac: model.mac,
            rssi: Int64(model.rssi)
          ))
      },
      failure: { err, msg in
        sink.error(
          code: "\(waterMeterErrorConvert(err).rawValue)",
          message: msg,
          details: nil)
      })
  }

  override func onCancel(withArguments arguments: Any?) {
    TTWaterMeter.stopScan()
  }
}

final class AccessoryElectricMeterStartScanStreamHandlerImpl:
  AccessoryElectricMeterStartScanStreamHandler
{
  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<TTMeterScanModel>) {
    TTElectricMeter.startScan(
      success: { model in
        sink.success(
          TTMeterScanModel(
            name: model.name,
            mac: model.mac,
            rssi: Int64(model.rssi)
          ))
      },
      failure: { err, msg in
        sink.error(
          code: "\(electricMeterErrorConvert(err).rawValue)",
          message: msg,
          details: nil)
      })
  }

  override func onCancel(withArguments arguments: Any?) {
    TTElectricMeter.stopScan()
  }
}
