import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

part 'passcode_get_state.freezed.dart';

enum PasscodeGetKind { permanent, limited, once, cyclic }

@freezed
abstract class PasscodeGetState with _$PasscodeGetState {
  const PasscodeGetState._();
  const factory PasscodeGetState({
    @Default(PasscodeGetKind.permanent) PasscodeGetKind kind,
    @Default(false) bool showCyclic,
    @Default(KeyboardPwdType.cyclicMonday) KeyboardPwdType cyclicType,
    @Default(480) int startMinutes,
    @Default(1020) int endMinutes,
    DateTime? startDate,
    DateTime? endDate,
    KeyboardPwdEntity? result,
    @Default(false) bool submitting,
    AppException? error,
  }) = _PasscodeGetState;
}
