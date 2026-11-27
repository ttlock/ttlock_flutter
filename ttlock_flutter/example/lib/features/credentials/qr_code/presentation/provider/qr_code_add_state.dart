import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

part 'qr_code_add_state.freezed.dart';

@freezed
abstract class QrCodeAddState with _$QrCodeAddState {
  const QrCodeAddState._();
  const factory QrCodeAddState({
    @Default(CredentialValidityKind.permanent) CredentialValidityKind kind,
    @Default(false) bool showCyclic,
    DateTime? startDate,
    DateTime? endDate,
    CyclicSchedule? schedule,
    QrCodeEntity? result,
    @Default(false) bool submitting,
    AppException? error,
  }) = _QrCodeAddState;
}
