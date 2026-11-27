import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'fingerprint_add_state.freezed.dart';

/// 指纹录入页入参（family 参数，需值相等性）。
///
/// [keypadMac] 非空表示「经多功能无线键盘录入」，为空表示「在锁上录入」。
@freezed
abstract class FingerprintAddArgs with _$FingerprintAddArgs {
  const factory FingerprintAddArgs({
    required LockEntity lock,
    String? keypadMac,
  }) = _FingerprintAddArgs;
}

@freezed
abstract class FingerprintAddState with _$FingerprintAddState {
  const FingerprintAddState._();
  const factory FingerprintAddState({
    @Default(CredentialValidityKind.permanent) CredentialValidityKind kind,
    @Default(false) bool showCyclic,
    DateTime? startDate,
    DateTime? endDate,
    CyclicSchedule? schedule,
    @Default(false) bool enrolling,
    @Default(false) bool waiting,
    @Default(false) bool collecting,
    int? currentCount,
    int? totalCount,

    /// 取消后仍展示 enrollCancelHint（锁端录入模式未立即退出）。
    @Default(false) bool showCancelHint,
    AppException? error,

    /// 提交时刻的名称快照 —— 重试登记时用它，不吃用户之后对表单的修改。
    String? fingerprintName,

    /// 录入成功但云登记失败时保留的编号；重试登记用。
    String? pendingFingerprintNumber,

    /// 云登记失败，等待重试（此时锁里已有该指纹，只是云端未登记）。
    @Default(false) bool pendingRegister,
  }) = _FingerprintAddState;
}
