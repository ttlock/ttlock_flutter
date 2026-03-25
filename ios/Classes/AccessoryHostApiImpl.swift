import Foundation
import TTLockOnPremise

final class AccessoryHostApiImpl: NSObject, TTAccessoryHostApi {

  private let context: EventContextStore
  init(context: EventContextStore) { self.context = context }

  func setEventKeypadMac(mac: String, isMultifunctional: Bool) throws {
    context.keypadMac = mac
    context.isMultifunctionalKeypad = isMultifunctional
  }

  func initRemoteKey(
    mac: String, lockData: String, completion: @escaping (Result<TTLockSystemModel, Error>) -> Void
  ) {
    TTWirelessKeyFob.newInitialize(withKeyFobMac: mac, lockData: lockData) {
      status, electricQuantity, systemModel in
      if status == TTKeyFobSuccess {
        completion(
          .success(
            TTLockSystemModel(
              modelNum: systemModel?.modelNum ?? "",
              hardwareRevision: systemModel?.hardwareRevision ?? "",
              firmwareRevision: systemModel?.firmwareRevision ?? "",
              electricQuantity: Int64(electricQuantity),
              nbOperator: nil,
              nbNodeId: nil,
              nbCardNumber: nil,
              nbRssi: nil,
              lockData: lockData
            )))
      } else {
        completion(
          .failure(makeRemoteAccessoryApiError(operation: "accessory.initRemoteKey", error: status))
        )
      }
    }
  }

  func initRemoteKeypad(
    mac: String, lockMac: String,
    completion: @escaping (Result<RemoteKeypadInitResult, Error>) -> Void
  ) {
    TTWirelessKeypad.initializeKeypad(withKeypadMac: mac, lockMac: lockMac) {
      wirelessKeypadFeatureValue, status, electricQuantity in
      if status == TTKeypadSuccess {
        completion(
          .success(
            RemoteKeypadInitResult(
              electricQuantity: Int64(electricQuantity),
              wirelessKeypadFeatureValue: wirelessKeypadFeatureValue ?? ""
            )))
      } else {
        completion(
          .failure(
            makeKeypadAccessoryApiError(operation: "accessory.initRemoteKeypad", error: status)))
      }
    }
  }

  func initMultifunctionalKeypad(
    mac: String, lockData: String,
    completion: @escaping (Result<MultifunctionalKeypadInitResult, Error>) -> Void
  ) {
    TTWirelessKeypad.initializeMultifunctionalKeypad(withKeypadMac: mac, lockData: lockData) {
      featureValue, electricQuantity, slotNumber, slotLimit, systemInfoModel in
      completion(
        .success(
          MultifunctionalKeypadInitResult(
            electricQuantity: Int64(electricQuantity),
            wirelessKeypadFeatureValue: featureValue ?? "",
            slotNumber: Int64(slotNumber),
            slotLimit: Int64(slotLimit),
            modelNum: systemInfoModel?.modelNum ?? "",
            hardwareRevision: systemInfoModel?.hardwareRevision ?? "",
            firmwareRevision: systemInfoModel?.firmwareRevision ?? "",
          )))
    } lockFailure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "accessory.initMultifunctionalKeypad.lockFailure", error: errorCode,
            message: errorMsg)))
    } keypadFailure: { status in
      completion(
        .failure(
          makeMultifunctionalKeypadApiError(
            operation: "accessory.initMultifunctionalKeypad.keypadFailure", error: status)))
    }
  }
  func getStoredLocks(mac: String, completion: @escaping (Result<[String], any Error>) -> Void) {
    TTWirelessKeypad.getAllStoredLocks(withKeypadMac: mac) { lockMacs in
      completion(.success(lockMacs ?? []))
    } failure: { status in
      completion(
        .failure(makeKeypadAccessoryApiError(operation: "accessory.getStoredLocks", error: status)))
    }
  }

  func deleteStoredLock(
    mac: String, slotNumber: Int64, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTWirelessKeypad.deleteLockAtSpecifiedSlot(withKeypadMac: mac, slotNumber: Int32(slotNumber)) {
      completion(.success(()))
    } failure: { status in
      completion(
        .failure(
          makeKeypadAccessoryApiError(operation: "accessory.deleteStoredLock", error: status)))
    }
  }

  func initDoorSensor(
    mac: String, lockData: String, completion: @escaping (Result<TTLockSystemModel, Error>) -> Void
  ) {
    TTDoorSensor.initialize(withDoorSensorMac: mac, lockData: lockData) {
      electricQuantity, systemModel in
      completion(
        .success(
          TTLockSystemModel(
            modelNum: systemModel.modelNum,
            hardwareRevision: systemModel.hardwareRevision,
            firmwareRevision: systemModel.firmwareRevision,
            electricQuantity: Int64(electricQuantity),
            nbOperator: nil,
            nbNodeId: nil,
            nbCardNumber: nil,
            nbRssi: nil,
            lockData: lockData,
          )))
    } failure: { error in
      completion(
        .failure(makeDoorSensorApiError(operation: "accessory.initDoorSensor", error: error)))
    }
  }

  func standaloneDoorSensorInit(
    mac: String, info: [String: Any?],
    completion: @escaping (Result<TTStandaloneDoorSensorInfo, Error>) -> Void
  ) {
    //    TTStandaloneDoorSensor.initWithInfo(info, mac: mac) { initModel in
    //      completion(.success(TTStandaloneDoorSensorInfo(
    //        doorSensorData: initModel.doorSensorData,
    //        electricQuantity: Int64(initModel.electricQuantity),
    //        featureValue: initModel.featureValue,
    //        wifiMac: initModel.wifiMac,
    //        modelNum: initModel.modelNum,
    //        hardwareRevision: initModel.hardwareRevision,
    //        firmwareRevision: initModel.firmwareRevision
    //      )))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeLockApiError(operation: "accessory.standaloneDoorSensorInit", error: error, message: errorMsg.isEmpty ? nil : errorMsg)))
    //    }
    completion(
      .failure(TtlockPremiseNewArchError.notImplemented("accessory.standaloneDoorSensorInit")))
  }

  func standaloneDoorSensorReadFeatureValue(
    mac: String, completion: @escaping (Result<String, Error>) -> Void
  ) {
    //    TTStandaloneDoorSensor.getFeatureValue(withMac: mac) { featureValue in
    //      completion(.success(featureValue))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeLockApiError(operation: "accessory.standaloneDoorSensorReadFeatureValue", error: error, message: errorMsg.isEmpty ? nil : errorMsg)))
    //    }
    completion(
      .failure(
        TtlockPremiseNewArchError.notImplemented("accessory.standaloneDoorSensorReadFeatureValue")))
  }

  func standaloneDoorSensorIsSupportFunction(featureValue: String, function: Int64) throws -> Bool {
    //    return TTStandaloneDoorSensor.supportFunction(Int(function), featureValue: featureValue)
    throw TtlockPremiseNewArchError.notImplemented(
      "accessory.standaloneDoorSensorIsSupportFunction")
  }

  func waterMeterConfigServer(url: String, clientId: String, accessToken: String) throws {
    TTWaterMeter.setClientParamWithUrl(url, clientId: clientId, accessToken: accessToken)
  }

  func waterMeterConnect(mac: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTWaterMeter.connect(withMac: mac) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterConnect", error: error, message: errorMsg)))
    }
  }

  func waterMeterDisconnect(mac: String) throws {
    TTWaterMeter.cancelConnect(withMac: mac)
  }

  func waterMeterInit(
    params: [String: Any?], completion: @escaping (Result<TTWaterMeterInitResult, Error>) -> Void
  ) {
    //    TTWaterMeter.add(withInfo: params) { result in
    //      completion(.success(TTWaterMeterInitResult(
    //        waterMeterId: "\(result.waterMeterId)",
    //        featureValue: result.featureValue
    //      )))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeWaterMeterApiError(operation: "accessory.waterMeterInit", error: error, message: errorMsg)))
    //    }
    completion(.failure(TtlockPremiseNewArchError.notImplemented("accessory.waterMeterInit")))
  }

  func waterMeterDelete(waterMeterId: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTWaterMeter.delete(withMac: waterMeterId) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterDelete", error: error, message: errorMsg)))
    }
  }

  func waterMeterSetPowerOnOff(
    waterMeterId: String, isOn: Bool, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTWaterMeter.setWaterOnOffWithMac(waterMeterId, onOff: isOn ? 1 : 0) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterSetPowerOnOff", error: error, message: errorMsg)))
    }
  }

  func waterMeterSetRemainderM3(
    waterMeterId: String, remainderM3: Double, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTWaterMeter.setRemainingWaterWithMac(waterMeterId, remainderM3: "\(remainderM3)") {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterSetRemainderM3", error: error, message: errorMsg)))
    }
  }

  func waterMeterClearRemainderM3(
    waterMeterId: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTWaterMeter.clearRemainingWater(withMac: waterMeterId) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterClearRemainderM3", error: error, message: errorMsg)))
    }
  }

  func waterMeterReadData(
    waterMeterId: String, completion: @escaping (Result<[String: Any?], Error>) -> Void
  ) {
    TTWaterMeter.readData(withMac: waterMeterId) {
      completion(.success([:]))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterReadData", error: error, message: errorMsg)))
    }
  }

  func waterMeterSetPayMode(
    waterMeterId: String, payMode: Int64, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTWaterMeter.setPayModeWithMac(waterMeterId, payMode: Int(payMode), price: "0") {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterSetPayMode", error: error, message: errorMsg)))
    }
  }

  func waterMeterCharge(
    waterMeterId: String, amount: Double, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTWaterMeter.recharge(
      withMac: waterMeterId, rechargeAmount: "\(amount)", rechargeM3: "\(amount)"
    ) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterCharge", error: error, message: errorMsg)))
    }
  }

  func waterMeterSetTotalUsage(
    waterMeterId: String, totalM3: Double, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTWaterMeter.setTotalUsageWithMac(waterMeterId, totalM3: "\(totalM3)") {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeWaterMeterApiError(
            operation: "accessory.waterMeterSetTotalUsage", error: error, message: errorMsg)))
    }
  }

  func waterMeterGetFeatureValue(
    waterMeterId: String, completion: @escaping (Result<String, Error>) -> Void
  ) {
    //    TTWaterMeter.getFeatureValue(withMac: waterMeterId) { featureValue in
    //      completion(.success(featureValue))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeWaterMeterApiError(operation: "accessory.waterMeterGetFeatureValue", error: error, message: errorMsg)))
    //    }
    completion(
      .failure(TtlockPremiseNewArchError.notImplemented("accessory.waterMeterGetFeatureValue")))
  }

  func waterMeterGetDeviceInfo(
    waterMeterId: String, completion: @escaping (Result<WaterMeterDeviceInfo, Error>) -> Void
  ) {
    //    TTWaterMeter.getDeviceInfo(withMac: waterMeterId) { model in
    //      completion(.success(WaterMeterDeviceInfo(
    //        modelNum: model.modelNum,
    //        hardwareRevision: model.hardwareRevision,
    //        firmwareRevision: model.firmwareRevision,
    //        catOneOperator: model.catOneOperator,
    //        catOneNodeId: model.catOneNodeId,
    //        catOneCardNumber: model.catOneCardNumber,
    //        catOneRssi: model.catOneRssi,
    //        catOneImsi: model.catOneImsi
    //      )))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeWaterMeterApiError(operation: "accessory.waterMeterGetDeviceInfo", error: error, message: errorMsg)))
    //    }
    completion(
      .failure(TtlockPremiseNewArchError.notImplemented("accessory.waterMeterGetDeviceInfo")))
  }

  func waterMeterIsSupportFunction(featureValue: String, function: Int64) throws -> Bool {
    //    return TTWaterMeter.supportFunction(Int(function), featureValue: featureValue)
    throw TtlockPremiseNewArchError.notImplemented("accessory.waterMeterIsSupportFunction")
  }

  func waterMeterConfigApn(apn: String, completion: @escaping (Result<Void, Error>) -> Void) {
    //    guard let mac = context.keypadMac else {
    //      completion(.failure(TtlockPremiseNewArchError.notImplemented("TODO(chuyi): pending API contract - missing meter mac")))
    //      return
    //    }
    //    TTWaterMeter.configApn(withMac: mac, apn: apn) {
    //      completion(.success(()))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeWaterMeterApiError(operation: "accessory.waterMeterConfigApn", error: error, message: errorMsg)))
    //    }
    completion(.failure(TtlockPremiseNewArchError.notImplemented("accessory.waterMeterConfigApn")))
  }

  func waterMeterConfigMeterServer(
    ip: String, port: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    //    guard let mac = context.keypadMac else {
    //      completion(.failure(TtlockPremiseNewArchError.notImplemented("TODO(chuyi): pending API contract - missing meter mac")))
    //      return
    //    }
    //    TTWaterMeter.configServer(withMac: mac, serverAddress: ip, portNumber: port) {
    //      completion(.success(()))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeWaterMeterApiError(operation: "accessory.waterMeterConfigMeterServer", error: error, message: errorMsg)))
    //    }
    completion(
      .failure(TtlockPremiseNewArchError.notImplemented("accessory.waterMeterConfigMeterServer")))
  }

  func waterMeterReset(waterMeterId: String, completion: @escaping (Result<Void, Error>) -> Void) {
    //    TTWaterMeter.reset(withMac: waterMeterId) {
    //      completion(.success(()))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeWaterMeterApiError(operation: "accessory.waterMeterReset", error: error, message: errorMsg)))
    //    }
    completion(.failure(TtlockPremiseNewArchError.notImplemented("accessory.waterMeterReset")))
  }

  func electricMeterConfigServer(url: String, clientId: String, accessToken: String) throws {
    TTElectricMeter.setClientParamWithUrl(url, clientId: clientId, accessToken: accessToken)
  }

  func electricMeterConnect(mac: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTElectricMeter.connect(withMac: mac) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterConnect", error: error, message: errorMsg)))
    }
  }

  func electricMeterDisconnect(mac: String) throws {
    TTElectricMeter.cancelConnect(withMac: mac)
  }

  func electricMeterInit(
    params: [String: Any?], completion: @escaping (Result<TTElectricMeterInitResult, Error>) -> Void
  ) {
    //    TTElectricMeter.add(withInfo: params) { result in
    //      completion(.success(TTElectricMeterInitResult(
    //        electricMeterId: "\(result.electricMeterId)",
    //        featureValue: nil
    //      )))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeElectricMeterApiError(operation: "accessory.electricMeterInit", error: error, message: errorMsg)))
    //    }
    completion(.failure(TtlockPremiseNewArchError.notImplemented("accessory.electricMeterInit")))
  }

  func electricMeterDelete(
    electricMeterId: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTElectricMeter.delete(withMac: electricMeterId) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterDelete", error: error, message: errorMsg)))
    }
  }

  func electricMeterSetPowerOnOff(
    electricMeterId: String, isOn: Bool, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTElectricMeter.setPowerOnOffWithMac(electricMeterId, powerOn: isOn) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterSetPowerOnOff", error: error, message: errorMsg)))
    }
  }

  func electricMeterSetRemainderKwh(
    electricMeterId: String, remainderKwh: Double,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTElectricMeter.setRemainingElectricityWithMac(electricMeterId, remainderKwh: "\(remainderKwh)")
    {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterSetRemainderKwh", error: error, message: errorMsg)))
    }
  }

  func electricMeterClearRemainderKwh(
    electricMeterId: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTElectricMeter.clearRemainingElectricity(withMac: electricMeterId) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterClearRemainderKwh", error: error, message: errorMsg))
      )
    }
  }

  func electricMeterReadData(
    electricMeterId: String, completion: @escaping (Result<[String: Any?], Error>) -> Void
  ) {
    TTElectricMeter.readData(withMac: electricMeterId) {
      completion(.success([:]))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterReadData", error: error, message: errorMsg)))
    }
  }

  func electricMeterSetPayMode(
    electricMeterId: String, payMode: Int64, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTElectricMeter.setPayModeWithMac(electricMeterId, payMode: Int(payMode), price: "0") {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterSetPayMode", error: error, message: errorMsg)))
    }
  }

  func electricMeterCharge(
    electricMeterId: String, amount: Double, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTElectricMeter.recharge(
      withMac: electricMeterId, rechargeAmount: "\(amount)", rechargeKwh: "\(amount)"
    ) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterCharge", error: error, message: errorMsg)))
    }
  }

  func electricMeterSetMaxPower(
    electricMeterId: String, maxPower: Double, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTElectricMeter.setMaxPowerWithMac(electricMeterId, maxPower: Int(maxPower)) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(
          makeElectricMeterApiError(
            operation: "accessory.electricMeterSetMaxPower", error: error, message: errorMsg)))
    }
  }

  func electricMeterGetFeatureValue(
    electricMeterId: String, completion: @escaping (Result<String, Error>) -> Void
  ) {
    //    TTElectricMeter.getFeatureValue(withMac: electricMeterId) { featureValue in
    //      completion(.success(featureValue))
    //    } failure: { error, errorMsg in
    //      completion(.failure(makeElectricMeterApiError(operation: "accessory.electricMeterGetFeatureValue", error: error, message: errorMsg)))
    //    }
    completion(
      .failure(TtlockPremiseNewArchError.notImplemented("accessory.electricMeterGetFeatureValue")))
  }

  func electricMeterIsSupportFunction(featureValue: String, function: Int64) throws -> Bool {
    //    return TTElectricMeter.supportFunction(Int(function), featureValue: featureValue)
    throw TtlockPremiseNewArchError.notImplemented("accessory.electricMeterIsSupportFunction")
  }

}
