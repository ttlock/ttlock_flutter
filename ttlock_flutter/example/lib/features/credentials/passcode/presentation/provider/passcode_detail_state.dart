import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

part 'passcode_detail_state.freezed.dart';

@freezed
abstract class PasscodeDetailState with _$PasscodeDetailState {
  const PasscodeDetailState._();
  const factory PasscodeDetailState({
    required KeyboardPwdEntity pwd,
    @Default(false) bool operating,
    AppException? error,
  }) = _PasscodeDetailState;
}
