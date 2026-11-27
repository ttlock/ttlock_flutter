import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'card_add_state.freezed.dart';

/// 卡录入页入参（family 参数，需值相等性）。
///
/// [keypadMac] 非空表示「经多功能无线键盘录入」，为空表示「在锁上录入」。
@freezed
abstract class CardAddArgs with _$CardAddArgs {
  const factory CardAddArgs({required LockEntity lock, String? keypadMac}) =
      _CardAddArgs;
}

@freezed
abstract class CardAddState with _$CardAddState {
  const CardAddState._();
  const factory CardAddState({
    @Default(CredentialValidityKind.permanent) CredentialValidityKind kind,
    @Default(false) bool showCyclic,
    DateTime? startDate,
    DateTime? endDate,
    CyclicSchedule? schedule,
    @Default(false) bool enrolling,
    @Default(false) bool waiting,

    /// 取消后仍展示 enrollCancelHint（锁端录入模式未立即退出）。
    @Default(false) bool showCancelHint,
    AppException? error,

    /// 提交时刻的名称快照 —— 重试登记时用它，不吃用户之后对表单的修改。
    String? cardName,

    /// 录入成功但云登记失败时保留的编号；重试登记用。
    String? pendingCardNumber,

    /// 云登记失败，等待重试（此时锁里已有该卡，只是云端未登记）。
    @Default(false) bool pendingRegister,
  }) = _CardAddState;
}
