import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

part 'remote_add_state.freezed.dart';

@freezed
abstract class RemoteAddState with _$RemoteAddState {
  const RemoteAddState._();
  const factory RemoteAddState({
    @Default(CredentialValidityKind.permanent) CredentialValidityKind kind,

    /// 遥控器始终展示循环选项，不探测能力位。
    @Default(true) bool showCyclic,
    DateTime? startDate,
    DateTime? endDate,
    CyclicSchedule? schedule,
    @Default(false) bool submitting,
    @Default(false) bool scanning,
    @Default(<TTRemoteAccessoryScanModel>[])
    List<TTRemoteAccessoryScanModel> scanned,
    String? selectedMac,
    AppException? error,
  }) = _RemoteAddState;
}
