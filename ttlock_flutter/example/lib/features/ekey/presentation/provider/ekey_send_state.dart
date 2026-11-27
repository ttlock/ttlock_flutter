import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'ekey_send_state.freezed.dart';

@freezed
abstract class EkeySendState with _$EkeySendState {
  const EkeySendState._();
  const factory EkeySendState({
    @Default(true) bool permanent,
    DateTime? startDate,
    DateTime? endDate,
    @Default(false) bool authorized,
    @Default(false) bool submitting,
    AppException? error,
  }) = _EkeySendState;
}
