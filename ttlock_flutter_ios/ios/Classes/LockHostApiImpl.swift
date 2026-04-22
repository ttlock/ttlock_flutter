import Foundation
import TTLockSDK

private func parseJsonArrayString(_ json: String?) -> [[String: Any]] {
  guard
    let json,
    let data = json.data(using: .utf8),
    let array = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
  else {
    return []
  }
  return array
}

private func mapStringValue(_ data: [String: Any], _ key: String) throws -> String {
  guard let value = data[key] as? String else {
    throw TtlockPremiseNewArchError.invalidValue("Invalid string value for key: \(key)")
  }
  return value
}

private func mapInt64Value(_ data: [String: Any], _ key: String) throws -> Int64 {
  guard let value = data[key] else {
    throw TtlockPremiseNewArchError.invalidValue("Missing int64 value for key: \(key)")
  }

  if let int64Value = value as? Int64 {
    return int64Value
  }
  if let intValue = value as? Int {
    return Int64(intValue)
  }
  if let numberValue = value as? NSNumber {
    return numberValue.int64Value
  }
  if let stringValue = value as? String, let int64Value = Int64(stringValue) {
    return int64Value
  }

  throw TtlockPremiseNewArchError.invalidValue("Invalid int64 value for key: \(key)")
}

private func lockVersionToJsonString(_ version: TTLockVersion) -> String {
  var dict: [String: Any] = [
    "protocolType": String(version.protocolType),
    "protocolVersion": String(version.protocolVersion),
    "scene": String(version.scene),
    "groupId": String(version.groupId),
    "orgId": String(version.orgId),
  ]
  guard let data = try? JSONSerialization.data(withJSONObject: dict) else {
    return ""
  }
  return String(data: data, encoding: .utf8) ?? ""
}

final class LockHostApiImpl: NSObject, TTLockHostApi {
  private let context: EventContextStore
  init(context: EventContextStore) { self.context = context }

  func setEventLockData(lockData: String) throws {
    context.lockData = lockData
  }

  func getBluetoothState() throws -> TTBluetoothState {
    // Clear contract: expose native bluetooth state immediately.

    return TTBluetoothState(rawValue: TTLock.bluetoothState.rawValue) ?? .unknow
  }

  func initLock(params: TTLockInitParams, completion: @escaping (Result<String, Error>) -> Void) {
    var payload: [String: Any] = [
      "lockMac": params.lockMac,
      "lockVersion": lockVersionToJsonString(params.lockVersion),
      "isInited": params.isInited,
    ]
    if params.clientPara != nil {
      payload["clientPara"] = params.clientPara
    }
    if params.hotelInfo != nil {
      payload["hotelInfo"] = params.hotelInfo
    }
    if params.buildingNumber != nil {
      payload["buildingNumber"] = params.buildingNumber
    }
    if params.floorNumber != nil {
      payload["floorNumber"] = params.floorNumber
    }
    TTLock.initLock(withDict: payload) { lockData in
      completion(.success(lockData ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "initLock", error: errorCode, message: errorMsg)))
    }
  }

  func resetLock(lockData: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTLock.resetLock(withLockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "resetLock", error: errorCode, message: errorMsg)))
    }
  }

  func resetEkey(lockData: String, completion: @escaping (Result<String, Error>) -> Void) {
    TTLock.resetEkey(withLockData: lockData) { newLockData in
      completion(.success(newLockData ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "resetEkey", error: errorCode, message: errorMsg)))
    }
  }

  func resetLockByCode(
    lockMac: String, resetCode: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.resetLockByCode(withResetCode: resetCode, lockMac: lockMac) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "resetLockByCode", error: errorCode, message: errorMsg)))
    }
  }

  func verifyLock(lockMac: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTLock.verifyLock(withLockMac: lockMac) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "verifyLock", error: errorCode, message: errorMsg)))
    }
  }

  func controlLock(
    lockData: String, action: TTControlAction,
    completion: @escaping (Result<ControlLockResult, Error>) -> Void
  ) {
    let controlAction = controlActionConvert(action)
    TTLock.controlLock(with: controlAction, lockData: lockData) {
      lockTime, electricQuantity, uniqueId in
      completion(
        .success(
          ControlLockResult(
            lockTime: lockTime, electricQuantity: Int64(electricQuantity), uniqueId: uniqueId)))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "controlLock", error: errorCode, message: errorMsg)))
    }
  }

  func getLockSwitchState(
    lockData: String, completion: @escaping (Result<TTLockSwitchState, Error>) -> Void
  ) {
    TTLock.getLockSwitchState(withLockData: lockData) { lockSwitchState, _ in
      completion(.success(lockSwitchStateRevert(lockSwitchState)))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "getLockSwitchState", error: errorCode, message: errorMsg)))
    }
  }

  func supportFunction(function: TTLockFunction, lockData: String) throws -> Bool {
    guard let featureValue = featureValueConvert(function) else {
      return false
    }
    return TTUtil.isSupportFeature(featureValue, lockData: lockData)
  }

  func createCustomPasscode(
    passcode: String, startDate: Int64, endDate: Int64, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.createCustomPasscode(
      passcode, startDate: startDate, endDate: endDate, lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "createCustomPasscode", error: errorCode, message: errorMsg)))
    }
  }

  func modifyPasscode(
    passcodeOrigin: String, passcodeNew: String?, startDate: Int64, endDate: Int64,
    lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.modifyPasscode(
      passcodeOrigin, newPasscode: passcodeNew, startDate: startDate, endDate: endDate,
      lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "modifyPasscode", error: errorCode, message: errorMsg))
      )
    }
  }

  func deletePasscode(
    passcode: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.deletePasscode(passcode, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "deletePasscode", error: errorCode, message: errorMsg))
      )
    }
  }

  func resetPasscode(lockData: String, completion: @escaping (Result<String, Error>) -> Void) {
    TTLock.resetPasscodes(withLockData: lockData) { updatedLockData in
      completion(.success(updatedLockData ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "resetPasscode", error: errorCode, message: errorMsg)))
    }
  }

  func getAdminPasscode(lockData: String, completion: @escaping (Result<String, Error>) -> Void) {
    TTLock.getAdminPasscode(withLockData: lockData) { adminPasscode in
      completion(.success(adminPasscode ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "getAdminPasscode", error: errorCode, message: errorMsg)))
    }
  }

  func setErasePasscode(erasePasscode: String, lockData: String) throws {
    throw TtlockPremiseNewArchError.notImplemented("TODO(chuyi): pending API contract")
  }

  func getAllValidPasscodes(
    lockData: String, completion: @escaping (Result<[TTPasscodeModel], Error>) -> Void
  ) {
    TTLock.getAllValidPasscodes(withLockData: lockData) { passcodes in
      do {
        completion(.success(try parseJsonArrayString(passcodes).map { item in
          TTPasscodeModel(
            keyboardPwd: try mapStringValue(item, "keyboardPwd"),
            newKeyboardPwd: try mapStringValue(item, "newKeyboardPwd"),
            startDate: try mapInt64Value(item, "startDate"),
            endDate: try mapInt64Value(item, "endDate"),
            keyboardPwdType: try mapInt64Value(item, "keyboardPwdType"),
            cycleType: try mapInt64Value(item, "cycleType")
          )
        }))
      } catch {
        completion(.failure(error))
      }
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "getAllValidPasscodes", error: errorCode, message: errorMsg)))
    }
  }

  func recoverPasscode(
    passcode: String, passcodeNew: String, type: TTPasscodeType, startDate: Int64, endDate: Int64,
    cycleType: Int64, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.recoverPasscode(
      passcode, newPasscode: passcodeNew, passcodeType: keyboardPwdTypeConvert(type),
      startDate: startDate, endDate: endDate, cycleType: Int32(cycleType), lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "recoverPasscode", error: errorCode, message: errorMsg)))
    }
  }

  func modifyAdminPasscode(
    adminPasscode: String, lockData: String, completion: @escaping (Result<String?, Error>) -> Void
  ) {
    TTLock.modifyAdminPasscode(adminPasscode, lockData: lockData) {
      completion(.success(nil))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "modifyAdminPasscode", error: errorCode, message: errorMsg)))
    }
  }

  func getPasscodeVerificationParams(
    lockData: String, completion: @escaping (Result<String, Error>) -> Void
  ) {
    completion(
      .failure(
        TtlockPremiseNewArchError.notImplemented(
          "getPasscodeVerificationParams is not available in current iOS SDK")))
  }

  func modifyCardValidityPeriod(
    cardNumber: String, cycleList: [TTCycleModel]?, startDate: Int64, endDate: Int64,
    lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.modifyICCardValidityPeriod(
      withCyclicConfig: cycleList?.map { $0.toMap() }, cardNumber: cardNumber, startDate: startDate,
      endDate: endDate, lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "modifyCardValidityPeriod", error: errorCode, message: errorMsg)))
    }
  }

  func deleteCard(
    cardNumber: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.deleteICCardNumber(cardNumber, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "deleteCard", error: errorCode, message: errorMsg)))
    }
  }

  func getAllValidCards(
    lockData: String, completion: @escaping (Result<[TTICCardModel], Error>) -> Void
  ) {
    TTLock.getAllValidICCards(withLockData: lockData) { cards in
      do {
        completion(.success(try parseJsonArrayString(cards).map { item in
          TTICCardModel(
            cardNumber: try mapStringValue(item, "cardNumber"),
            startDate: try mapInt64Value(item, "startDate"),
            endDate: try mapInt64Value(item, "endDate")
          )
        }))
      } catch {
        completion(.failure(error))
      }
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "getAllValidCards", error: errorCode, message: errorMsg)))
    }
  }

  func clearAllCards(lockData: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTLock.clearAllICCards(withLockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "clearAllCards", error: errorCode, message: errorMsg)))
    }
  }

  func recoverCard(
    cardNumber: String, startDate: Int64, endDate: Int64, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.recoverICCard(
      withCyclicConfig: [], cardNumber: cardNumber, startDate: startDate, endDate: endDate,
      lockData: lockData
    ) { _ in
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "recoverCard", error: errorCode, message: errorMsg)))
    }
  }

  func reportLossCard(
    cardNumber: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.reportLossCard(cardNumber, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "reportLossCard", error: errorCode, message: errorMsg))
      )
    }
  }

  func modifyFingerprintValidityPeriod(
    fingerprintNumber: String, cycleList: [TTCycleModel]?, startDate: Int64, endDate: Int64,
    lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.modifyFingerprintValidityPeriod(
      withCyclicConfig: cycleList?.map { $0.toMap() }, fingerprintNumber: fingerprintNumber,
      startDate: startDate, endDate: endDate, lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "modifyFingerprintValidityPeriod", error: errorCode, message: errorMsg)))
    }
  }

  func deleteFingerprint(
    fingerprintNumber: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.deleteFingerprintNumber(fingerprintNumber, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "deleteFingerprint", error: errorCode, message: errorMsg)))
    }
  }

  func getAllValidFingerprints(
    lockData: String, completion: @escaping (Result<[TTFingerprintModel], Error>) -> Void
  ) {
    TTLock.getAllValidFingerprints(withLockData: lockData) { fingerprints in
      do {
        completion(.success(try parseJsonArrayString(fingerprints).map { item in
          TTFingerprintModel(
            fingerprintNumber: try mapStringValue(item, "fingerprintNumber"),
            startDate: try mapInt64Value(item, "startDate"),
            endDate: try mapInt64Value(item, "endDate")
          )
        }))
      } catch {
        completion(.failure(error))
      }
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "getAllValidFingerprints", error: errorCode, message: errorMsg)))
    }
  }

  func clearAllFingerprints(lockData: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTLock.clearAllFingerprints(withLockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "clearAllFingerprints", error: errorCode, message: errorMsg)))
    }
  }

  func modifyFace(
    faceNumber: String, cycleList: [TTCycleModel]?, startDate: Int64, endDate: Int64,
    lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.modifyFaceValidity(
      withCyclicConfig: cycleList?.map { $0.toMap() }, faceNumber: faceNumber, startDate: startDate,
      endDate: endDate, lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "modifyFace", error: errorCode, message: errorMsg)))
    }
  }

  func addFaceData(
    cycleList: [TTCycleModel]?, startDate: Int64, endDate: Int64, faceFeatureData: String,
    lockData: String, completion: @escaping (Result<String, Error>) -> Void
  ) {
    TTLock.addFaceFeatureData(
      faceFeatureData, cyclicConfig: cycleList?.map { $0.toMap() }, startDate: startDate,
      endDate: endDate, lockData: lockData
    ) { faceNumber in
      completion(.success(faceNumber ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "addFaceData", error: errorCode, message: errorMsg)))
    }
  }

  func deleteFace(
    faceNumber: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.deleteFaceNumber(faceNumber, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "deleteFace", error: errorCode, message: errorMsg)))
    }
  }

  func clearFace(lockData: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTLock.clearFace(withLockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "clearFace", error: errorCode, message: errorMsg)))
    }
  }

  func setLockTime(
    timestamp: Int64, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setLockTimeWithTimestamp(timestamp, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "setLockTime", error: errorCode, message: errorMsg)))
    }
  }

  func getLockTime(lockData: String, completion: @escaping (Result<Int64, Error>) -> Void) {
    TTLock.getLockTime(withLockData: lockData) { lockTimestamp in
      completion(.success(lockTimestamp))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "getLockTime", error: errorCode, message: errorMsg)))
    }
  }

  func setLockWorkingTime(
    startDate: Int64, endDate: Int64, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setLockWorkingTimeWithStartDate(startDate, endDate: endDate, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "setLockWorkingTime", error: errorCode, message: errorMsg)))
    }
  }

  func getLockOperateRecord(
    type: TTOperateRecordType, lockData: String,
    completion: @escaping (Result<String, Error>) -> Void
  ) {
    TTLock.getOperationLog(with: operateLogTypeConvert(type), lockData: lockData) { operateRecord in
      completion(.success(operateRecord ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "getLockOperateRecord", error: errorCode, message: errorMsg)))
    }
  }

  func getLockPower(lockData: String, completion: @escaping (Result<Int64, Error>) -> Void) {
    TTLock.getElectricQuantity(withLockData: lockData) { electricQuantity in
      completion(.success(Int64(electricQuantity)))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "getLockPower", error: errorCode, message: errorMsg)))
    }
  }

  func getLockSystemInfo(
    lockData: String, completion: @escaping (Result<TTLockSystemModel, Error>) -> Void
  ) {
    TTLock.getLockSystemInfo(withLockData: lockData) { systemModel in
      completion(
        .success(
          TTLockSystemModel(
            modelNum: systemModel?.modelNum,
            hardwareRevision: systemModel?.hardwareRevision,
            firmwareRevision: systemModel?.firmwareRevision,
            electricQuantity: nil,
            nbOperator: systemModel?.nbOperator,
            nbNodeId: systemModel?.nbNodeId,
            nbCardNumber: systemModel?.nbCardNumber,
            nbRssi: systemModel?.nbRssi,
            lockData: lockData
          )))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "getLockSystemInfo", error: errorCode, message: errorMsg)))
    }
  }

  func getLockFeatureValue(lockData: String, completion: @escaping (Result<String, Error>) -> Void)
  {
    TTLock.getLockFeatureValue(withLockData: lockData) { newLockData in
      completion(.success(newLockData ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "getLockFeatureValue", error: errorCode, message: errorMsg)))
    }
  }

  func getAutoLockingPeriodicTime(
    lockData: String, completion: @escaping (Result<AutoLockingTime, Error>) -> Void
  ) {
    TTLock.getAutomaticLockingPeriodicTime(withLockData: lockData) {
      currentTime, minTime, maxTime in
      completion(
        .success(
          AutoLockingTime(
            currentTime: Int64(currentTime), minTime: Int64(minTime), maxTime: Int64(maxTime))))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "getAutoLockingPeriodicTime", error: errorCode, message: errorMsg)))
    }
  }

  func setAutoLockingPeriodicTime(
    seconds: Int64, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
      TTLock.setAutomaticLockingPeriodicTime(Int32(seconds), lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "setAutoLockingPeriodicTime", error: errorCode, message: errorMsg)))
    }
  }

  func getRemoteUnlockSwitchState(
    lockData: String, completion: @escaping (Result<Bool, Error>) -> Void
  ) {
    TTLock.getRemoteUnlockSwitch(withLockData: lockData) { isOn in
      completion(.success(isOn))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "getRemoteUnlockSwitchState", error: errorCode, message: errorMsg)))
    }
  }

  func setRemoteUnlockSwitchState(
    isOn: Bool, lockData: String, completion: @escaping (Result<String, Error>) -> Void
  ) {
    TTLock.setRemoteUnlockSwitchOn(isOn, lockData: lockData) { newLockData in
      completion(.success(newLockData ?? ""))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "setRemoteUnlockSwitchState", error: errorCode, message: errorMsg)))
    }
  }

  func getLockConfig(
    config: TTLockConfig, lockData: String, completion: @escaping (Result<Bool, Error>) -> Void
  ) {
    TTLock.getConfigWith(lockConfigConvert(config), lockData: lockData) { _, isOn in
      completion(.success(isOn))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "getLockConfig", error: errorCode, message: errorMsg)))
    }
  }

  func setLockConfig(
    config: TTLockConfig, isOn: Bool, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setLockConfigWith(lockConfigConvert(config), on: isOn, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "setLockConfig", error: errorCode, message: errorMsg)))
    }
  }

  func getLockDirection(
    lockData: String, completion: @escaping (Result<TTLockDirection, Error>) -> Void
  ) {
    TTLock.getUnlockDirection(withLockData: lockData) { direction in
      completion(.success(lockDirectionRevert(direction)))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "getLockDirection", error: errorCode, message: errorMsg)))
    }
  }

  func setLockDirection(
    direction: TTLockDirection, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    let unlockDirection = lockDirectionConvert(direction)
    TTLock.setUnlockDirection(unlockDirection, lockData: lockData) {
      completion(.success(()))
    } failure: { error, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "setLockDirection", error: error, message: errorMsg)))
    }
  }

  func addPassageMode(
    type: TTPassageModeType, weekly: [Int64]?, monthly: [Int64]?, startTime: Int64, endTime: Int64,
    lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.configPassageMode(
      with: passageModeTypeConvert(type),
      weekly: weekly?.map(NSNumber.init(value:)),
      monthly: monthly?.map(NSNumber.init(value:)),
      startDate: Int32(startTime),
      endDate: Int32(endTime),
      lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "addPassageMode", error: errorCode, message: errorMsg))
      )
    }
  }

  func clearAllPassageModes(lockData: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTLock.clearPassageMode(withLockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "clearAllPassageModes", error: errorCode, message: errorMsg)))
    }
  }

  func activateLift(
    floors: String, lockData: String,
    completion: @escaping (Result<ControlLockResult, Error>) -> Void
  ) {
    TTLock.activateLiftFloors(floors, lockData: lockData) { lockTime, electricQuantity, uniqueId in
      completion(
        .success(
          ControlLockResult(
            lockTime: lockTime, electricQuantity: Int64(electricQuantity), uniqueId: uniqueId)))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "activateLift", error: errorCode, message: errorMsg)))
    }
  }

  func setLiftControlable(
    floors: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setLiftControlableFloors(floors, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "setLiftControlable", error: errorCode, message: errorMsg)))
    }
  }

  func setLiftWorkMode(
    type: TTLiftWorkActivateType, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setLiftWorkMode(liftWorkActivateTypeConvert(type), lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "setLiftWorkMode", error: errorCode, message: errorMsg)))
    }
  }

  func setPowerSaverWorkMode(
    type: TTPowerSaverWorkType, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setPowerSaverWorkMode(powerSaverWorkModeConvert(type), lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "setPowerSaverWorkMode", error: errorCode, message: errorMsg))
      )
    }
  }

  func setPowerSaverControlableLock(
    lockMac: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setPowerSaverControlableLockWithLockMac(lockMac, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "setPowerSaverControlableLock", error: errorCode, message: errorMsg)))
    }
  }

  func setHotel(
    hotelInfo: String, buildingNumber: Int64, floorNumber: Int64, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setHotelDataWithHotelInfo(
      hotelInfo, buildingNumber: Int32(buildingNumber), floorNumber: Int32(floorNumber),
      lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "setHotel", error: errorCode, message: errorMsg)))
    }
  }

  func setHotelCardSector(
    sector: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setHotelCardSector(sector, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "setHotelCardSector", error: errorCode, message: errorMsg)))
    }
  }

  func getLockVersion(lockMac: String, completion: @escaping (Result<TTLockVersion, Error>) -> Void)
  {
    TTLock.getLockVersion(withLockMac: lockMac) { lockVersion in
      guard let lockVersionDict = lockVersion else {
        completion(
          .failure(TtlockPremiseNewArchError.notImplemented("getLockVersion serialize failed")))
        return
      }
      completion(
        .success(
          TTLockVersion(
            protocolType: Int64(lockVersionDict["protocolType"] as? Int ?? 0),
            protocolVersion: Int64(lockVersionDict["protocolVersion"] as? Int ?? 0),
            scene: Int64(lockVersionDict["scene"] as? Int ?? 0),
            groupId: Int64(lockVersionDict["groupId"] as? Int ?? 0),
            orgId: Int64(lockVersionDict["orgId"] as? Int ?? 0)
          )
        ))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "getLockVersion", error: errorCode, message: errorMsg))
      )
    }
  }

  func setNBServerAddress(
    ip: String, port: String, lockData: String, completion: @escaping (Result<Int64, Error>) -> Void
  ) {
    completion(
      .failure(
        TtlockPremiseNewArchError.notImplemented(
          "setNBServerAddress is not available in current iOS SDK")))
  }

  func configWifi(
    wifiName: String, wifiPassword: String, lockData: String,
    completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.configWifi(withSSID: wifiName, wifiPassword: wifiPassword, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "configWifi", error: errorCode, message: errorMsg)))
    }
  }

  func configServer(
    ip: String, port: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.configServer(withServerAddress: ip, portNumber: port, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "configServer", error: errorCode, message: errorMsg)))
    }
  }

  func getWifiInfo(lockData: String, completion: @escaping (Result<TTWifiInfoModel, Error>) -> Void)
  {
    TTLock.getWifiInfo(withLockData: lockData) { wifiMac, wifiRssi in
      completion(.success(TTWifiInfoModel(wifiMac: wifiMac ?? "", wifiRssi: Int64(wifiRssi))))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "getWifiInfo", error: errorCode, message: errorMsg)))
    }
  }

  func configIp(
    ipSetting: TTIpSetting, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    var info: [String: Any] = [
      "type": ipSetting.type,
      "ipAddress": ipSetting.ipAddress ?? "",
      "subnetMask": ipSetting.subnetMask ?? "",
      "router": ipSetting.router ?? "",
      "preferredDns": ipSetting.preferredDns ?? "",
      "alternateDns": ipSetting.alternateDns ?? "",
    ]
    info = info.compactMapValues { $0 as Any? }
    TTLock.configIp(withInfo: info, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "configIp", error: errorCode, message: errorMsg)))
    }
  }

  func configCameraLockWifi(
    wifiName: String, wifiPassword: String, lockData: String,
    completion: @escaping (Result<CameraLockWifiResult, Error>) -> Void
  ) {
    TTLock.configCameraLockWifi(
      withSSID: wifiName, wifiPassword: wifiPassword, secCode: "", lockData: lockData
    ) { serialNumber, wifiName, wifiRssi in
      let result = CameraLockWifiResult(serialNumber: serialNumber ?? "", wifiName: wifiName ?? "")
      completion(.success(result))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "configCameraLockWifi", error: errorCode, message: errorMsg)))
    }
  }

  func setSoundVolume(
    type: TTSoundVolumeType, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setLockSoundWith(soundVolumeConvert(type), lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "setSoundVolume", error: errorCode, message: errorMsg))
      )
    }
  }

  func getSoundVolume(
    lockData: String, completion: @escaping (Result<TTSoundVolumeType, Error>) -> Void
  ) {
    TTLock.getLockSound(withLockData: lockData) { soundVolume in
      completion(.success(soundVolumeRevert(soundVolume)))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "getSoundVolume", error: errorCode, message: errorMsg))
      )
    }
  }

  func setSensitivity(
    value: TTSensitivityValue, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setSensitivityWith(sensitivityValueConvert(value), lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "setSensitivity", error: errorCode, message: errorMsg))
      )
    }
  }

  func setRemoteKeyValidDate(
    remoteKeyMac: String, cycleList: [TTCycleModel]?, startDate: Int64, endDate: Int64,
    lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.modifyWirelessKeyFobValidityPeriod(
      withCyclicConfig: cycleList?.map { $0.toMap() }, keyFobMac: remoteKeyMac,
      startDate: startDate, endDate: endDate, lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "setRemoteKeyValidDate", error: errorCode, message: errorMsg))
      )
    }
  }

  func addRemoteKey(
    remoteKeyMac: String, cycleList: [TTCycleModel]?, startDate: Int64, endDate: Int64,
    lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.addWirelessKeyFob(
      withCyclicConfig: cycleList?.map { $0.toMap() }, keyFobMac: remoteKeyMac,
      startDate: startDate, endDate: endDate, lockData: lockData
    ) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "addRemoteKey", error: errorCode, message: errorMsg)))
    }
  }

  func deleteRemoteKey(
    remoteKeyMac: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.deleteWirelessKeyFob(withKeyFobMac: remoteKeyMac, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "deleteRemoteKey", error: errorCode, message: errorMsg)))
    }
  }

  func clearRemoteKey(lockData: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTLock.clearWirelessKeyFobs(withLockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "clearRemoteKey", error: errorCode, message: errorMsg))
      )
    }
  }

  func getRemoteAccessoryElectricQuantity(
    accessory: TTRemoteAccessory, mac: String, lockData: String,
    completion: @escaping (Result<AccessoryElectricQuantityResult, Error>) -> Void
  ) {
    TTLock.getAccessoryElectricQuantity(
      with: remoteAccessoryConvert(accessory), accessoryMac: mac, lockData: lockData
    ) { electricQuantity, updateDate in
      completion(
        .success(
          AccessoryElectricQuantityResult(
            electricQuantity: Int64(electricQuantity), updateDate: updateDate)))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(
            operation: "getRemoteAccessoryElectricQuantity", error: errorCode, message: errorMsg)))
    }
  }

  func addDoorSensor(
    doorSensorMac: String, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.addDoorSensor(withDoorSensorMac: doorSensorMac, lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(makeLockApiError(operation: "addDoorSensor", error: errorCode, message: errorMsg)))
    }
  }

  func deleteDoorSensor(lockData: String, completion: @escaping (Result<Void, Error>) -> Void) {
    TTLock.clearDoorSensor(withLockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "deleteDoorSensor", error: errorCode, message: errorMsg)))
    }
  }

  func setDoorSensorAlertTime(
    alertTime: Int64, lockData: String, completion: @escaping (Result<Void, Error>) -> Void
  ) {
    TTLock.setDoorSensorAlertTime(Int32(Int(alertTime)), lockData: lockData) {
      completion(.success(()))
    } failure: { errorCode, errorMsg in
      completion(
        .failure(
          makeLockApiError(operation: "setDoorSensorAlertTime", error: errorCode, message: errorMsg)
        ))
    }
  }

}
