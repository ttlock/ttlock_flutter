import 'package:ttlock_flutter_platform_interface/pigeon/messages.g.dart';

/// [AddCardEvent]、[AddFingerprintEvent]、[AddFaceEvent] 的共用结果访问扩展。
extension TTAddCredentialEventX on Object {
  /// 录入成功后的凭证编号（卡号 / 指纹号 / 人脸号）；非成功阶段为 `null`。
  String? get credentialNumber => switch (this) {
        AddCardEvent(:final cardNumber, :final phase)
            when phase == TTAddCardPhase.success =>
          cardNumber,
        AddFingerprintEvent(:final fingerprintNumber, :final phase)
            when phase == TTAddFingerprintPhase.success =>
          fingerprintNumber,
        AddFaceEvent(:final faceNumber, :final phase)
            when phase == TTAddFacePhase.success =>
          faceNumber,
        _ => null,
      };
}

extension AddCardEventX on AddCardEvent {
  /// 是否处于进行中（非成功阶段）。
  bool get isInProgress => phase != TTAddCardPhase.success;
}

extension AddFingerprintEventX on AddFingerprintEvent {
  /// 是否处于进行中（非成功阶段）。
  bool get isInProgress => phase != TTAddFingerprintPhase.success;

  /// 指纹采集进度，范围 0.0–1.0；无进度信息时返回 `null`。
  double? get collectionProgress {
    if (phase != TTAddFingerprintPhase.collecting) return null;
    final total = totalCount;
    final current = currentCount;
    if (total == null || total <= 0 || current == null) return null;
    return current / total;
  }
}

extension AddFaceEventX on AddFaceEvent {
  /// 是否处于进行中（非成功阶段）。
  bool get isInProgress => phase != TTAddFacePhase.success;

  /// 供 [@Deprecated] `TTAddFaceProgressCallback` 使用的阶段映射。
  TTFaceState? get legacyFaceState => switch (phase) {
        TTAddFacePhase.canStartAdd => TTFaceState.canStartAdd,
        TTAddFacePhase.error => TTFaceState.error,
        _ => null,
      };
}
