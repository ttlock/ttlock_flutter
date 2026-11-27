import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

part 'passcode_list_state.freezed.dart';

@freezed
abstract class PasscodeListState with _$PasscodeListState {
  const PasscodeListState._();
  const factory PasscodeListState({
    @Default([]) List<KeyboardPwdEntity> items,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
  }) = _PasscodeListState;
}
