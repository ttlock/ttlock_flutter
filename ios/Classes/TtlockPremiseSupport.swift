import Foundation
import TTLockOnPremise

enum TtlockPremiseNewArchError: Error {
  case notImplemented(String)
}

func makeLockApiError(operation: String, error: TTLockOnPremise.TTError, message: String?)
  -> PigeonError
{
  let mapped = lockErrorConvert(error)
  let fallback = "\(operation) failed: \(error.rawValue)"
  return PigeonError(code: "\(mapped.rawValue)", message: message ?? fallback, details: operation)
}

func makeGatewayApiError(
  operation: String, error: TTLockOnPremise.TTGatewayStatus, message: String? = nil
) -> PigeonError {
  let mapped = gatewayErrorConvert(error)
  let fallback = "\(operation) failed: \(error.rawValue)"
  return PigeonError(code: "\(mapped.rawValue)", message: message ?? fallback, details: operation)
}

func makeRemoteAccessoryApiError(
  operation: String, error: TTLockOnPremise.TTKeyFobStatus, message: String? = nil
) -> PigeonError {
  let mapped = remoteErrorConvert(error)
  let fallback = "\(operation) failed: \(error.rawValue)"
  return PigeonError(code: "\(mapped.rawValue)", message: message ?? fallback, details: operation)
}

func makeKeypadAccessoryApiError(
  operation: String, error: TTLockOnPremise.TTKeypadStatus, message: String? = nil
) -> PigeonError {
  let mapped = keypadErrorConvert(error)
  let fallback = "\(operation) failed: \(error.rawValue)"
  return PigeonError(code: "\(mapped.rawValue)", message: message ?? fallback, details: operation)
}

func makeDoorSensorApiError(
  operation: String, error: TTLockOnPremise.TTDoorSensorError, message: String? = nil
) -> PigeonError {
  let mapped = doorSensorErrorConvert(error)
  let fallback = "\(operation) failed: \(error.rawValue)"
  return PigeonError(code: "\(mapped.rawValue)", message: message ?? fallback, details: operation)
}

func makeWaterMeterApiError(
  operation: String, error: TTLockOnPremise.TTWaterMeterError, message: String? = nil
) -> PigeonError {
  let mapped = waterMeterErrorConvert(error)
  let fallback = "\(operation) failed: \(error.rawValue)"
  return PigeonError(code: "\(mapped.rawValue)", message: message ?? fallback, details: operation)
}

func makeElectricMeterApiError(
  operation: String, error: TTLockOnPremise.TTElectricMeterError, message: String? = nil
) -> PigeonError {
  let mapped = electricMeterErrorConvert(error)
  let fallback = "\(operation) failed: \(error.rawValue)"
  return PigeonError(code: "\(mapped.rawValue)", message: message ?? fallback, details: operation)
}

func makeMultifunctionalKeypadApiError(
  operation: String, error: TTLockOnPremise.TTKeypadStatus, message: String? = nil
) -> PigeonError {
  let mapped = multifunctionalKeypadErrorConvert(error)
  let fallback = "\(operation) failed: \(error.rawValue)"
  return PigeonError(code: "\(mapped.rawValue)", message: message ?? fallback, details: operation)
}

final class EventContextStore {
  static let shared = EventContextStore()
  private init() {}

  var lockData: String?
  var gatewayMac: String?
  var keypadMac: String?
  var isMultifunctionalKeypad = false

  /// 与 Android `LockStreamParams` 对齐：加卡/指纹/人脸等流使用的周期配置与有效期（毫秒）。未设置时由宿主使用默认时间窗。
  var streamCyclicConfigMaps: [[AnyHashable: Any]]?
  var streamValidityStartMs: Int64?
  var streamValidityEndMs: Int64?

  func validityRangeForAddOperations() -> (start: Int64, end: Int64, cyclic: [[AnyHashable: Any]]?) {
    let nowMs = Int64(Date().timeIntervalSince1970 * 1000)
    let start = streamValidityStartMs ?? nowMs
    let end = streamValidityEndMs ?? (nowMs + 30 * 24 * 3600 * 1000)
    return (start, end, streamCyclicConfigMaps)
  }
}

extension TTCycleModel {
  func toMap() -> [String: Any] {
    [
      "weekDay": weekDay,
      "startTime": startTime,
      "endTime": endTime,
    ]
  }
}
