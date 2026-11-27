import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_detail_state.dart';

part 'passcode_detail_notifier.g.dart';

@Riverpod()
class PasscodeDetailNotifier extends _$PasscodeDetailNotifier {
  late PasscodeDetailArgs _args;

  PasscodeDomain get _domain => ref.read(passcodeDomainProvider.notifier);

  @override
  PasscodeDetailState build(PasscodeDetailArgs args) {
    _args = args;
    return PasscodeDetailState(pwd: args.pwd);
  }

  void clearError() => state = state.copyWith(error: null);

  Future<void> rename(String name) => _runUnit(
    _domain.change(
      lock: _args.lock,
      pwd: state.pwd,
      keyboardPwdName: name.trim(),
    ),
    (pwd) => pwd.copyWith(keyboardPwdName: name.trim()),
  );

  Future<void> changePassword(String newPwd) async {
    final pwd = newPwd.trim();
    if (!RegExp(r'^\d{4,9}$').hasMatch(pwd)) {
      state = state.copyWith(
        error: AppException.business(code: 0, message: 'invalid_passcode'),
      );
      return;
    }
    await _runUnit(
      _domain.change(lock: _args.lock, pwd: state.pwd, newKeyboardPwd: pwd),
      (entity) => entity.copyWith(keyboardPwd: pwd),
    );
  }

  Future<void> changePeriod(DateTime start, DateTime end) => _runUnit(
    _domain.change(lock: _args.lock, pwd: state.pwd, start: start, end: end),
    (pwd) => pwd.copyWith(startDate: start, endDate: end),
  );

  Future<bool> delete() async {
    state = state.copyWith(operating: true, error: null);
    final r = await _domain
        .delete(lock: _args.lock, pwd: state.pwd)
        .runWithLoading(status: ref.read(l10nProvider).loading);
    return r.fold(
      (err) {
        state = state.copyWith(operating: false, error: err);
        return false;
      },
      (_) {
        state = state.copyWith(operating: false);
        return true;
      },
    );
  }

  Future<void> _runUnit(
    TaskEither<AppException, Unit> task,
    KeyboardPwdEntity Function(KeyboardPwdEntity) update,
  ) async {
    state = state.copyWith(operating: true, error: null);
    final r = await task.runWithLoading(status: ref.read(l10nProvider).loading);
    r.fold(
      (err) => state = state.copyWith(operating: false, error: err),
      (_) => state = state.copyWith(operating: false, pwd: update(state.pwd)),
    );
  }
}
