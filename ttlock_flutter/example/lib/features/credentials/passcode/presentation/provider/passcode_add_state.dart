import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'passcode_add_state.freezed.dart';

@freezed
abstract class PasscodeAddState with _$PasscodeAddState {
  const PasscodeAddState._();
  const factory PasscodeAddState({
    @Default(true) bool permanent,
    DateTime? startDate,
    DateTime? endDate,
    @Default(false) bool submitting,
    AppException? error,
  }) = _PasscodeAddState;
}
