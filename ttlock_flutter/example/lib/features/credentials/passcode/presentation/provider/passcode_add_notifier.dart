import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_add_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'passcode_add_notifier.g.dart';

@Riverpod()
class PasscodeAddNotifier extends _$PasscodeAddNotifier {
  late LockEntity _lock;

  @override
  PasscodeAddState build(LockEntity lock) {
    _lock = lock;
    return const PasscodeAddState();
  }

  void setPermanent(bool value) {
    if (value) {
      state = state.copyWith(permanent: true);
      return;
    }
    final now = DateTime.now();
    state = state.copyWith(
      permanent: false,
      startDate: state.startDate ?? now,
      endDate: state.endDate ?? now.add(const Duration(days: 7)),
    );
  }

  void setStartDate(DateTime value) => state = state.copyWith(startDate: value);

  void setEndDate(DateTime value) => state = state.copyWith(endDate: value);

  void clearError() => state = state.copyWith(error: null);

  Future<bool> submit({
    required String keyboardPwd,
    String? keyboardPwdName,
  }) async {
    final pwd = keyboardPwd.trim();
    if (!RegExp(r'^\d{4,9}$').hasMatch(pwd)) {
      state = state.copyWith(
        error: AppException.business(code: 0, message: 'invalid_passcode'),
      );
      return false;
    }
    state = state.copyWith(submitting: true, error: null);
    final r = await ref
        .read(passcodeDomainProvider.notifier)
        .addCustom(
          lock: _lock,
          keyboardPwd: pwd,
          type: state.permanent
              ? KeyboardPwdType.permanent
              : KeyboardPwdType.limited,
          keyboardPwdName: keyboardPwdName,
          start: state.permanent ? null : state.startDate,
          end: state.permanent ? null : state.endDate,
        )
        .run();
    return r.fold(
      (err) {
        state = state.copyWith(submitting: false, error: err);
        return false;
      },
      (_) {
        state = state.copyWith(submitting: false);
        return true;
      },
    );
  }
}
