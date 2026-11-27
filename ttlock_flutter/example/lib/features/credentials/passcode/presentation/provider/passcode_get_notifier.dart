import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/cyclic_passcode_window.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/provider/passcode_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_get_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'passcode_get_notifier.g.dart';

@Riverpod()
class PasscodeGetNotifier extends _$PasscodeGetNotifier {
  late LockEntity _lock;

  @override
  PasscodeGetState build(LockEntity lock) {
    _lock = lock;
    Future.microtask(_probeCyclic);
    return const PasscodeGetState();
  }

  Future<void> _probeCyclic() async {
    if (_lock.lockData.isEmpty) return;
    try {
      final ok = await runBle(
        () => TTLock.lock.supportFunction(
          TTLockFunction.cyclePassword,
          _lock.lockData,
        ),
      );
      state = state.copyWith(showCyclic: ok);
    } on Object {
      state = state.copyWith(showCyclic: false);
    }
  }

  void setKind(PasscodeGetKind kind) {
    if (kind == PasscodeGetKind.cyclic && !state.showCyclic) return;
    if (kind == PasscodeGetKind.limited || kind == PasscodeGetKind.once) {
      final now = DateTime.now();
      state = state.copyWith(
        kind: kind,
        startDate: state.startDate ?? now,
        endDate: state.endDate ?? now.add(const Duration(days: 1)),
        result: null,
      );
      return;
    }
    state = state.copyWith(kind: kind, result: null);
  }

  void setCyclicType(KeyboardPwdType type) {
    if (!isCyclicKeyboardPwdType(type)) return;
    state = state.copyWith(cyclicType: type, result: null);
  }

  void setStartMinutes(int minutes) =>
      state = state.copyWith(startMinutes: minutes, result: null);

  void setEndMinutes(int minutes) =>
      state = state.copyWith(endMinutes: minutes, result: null);

  void setStartDate(DateTime value) =>
      state = state.copyWith(startDate: value, result: null);

  void setEndDate(DateTime value) =>
      state = state.copyWith(endDate: value, result: null);

  void clearError() => state = state.copyWith(error: null);

  Future<bool> submit({String? keyboardPwdName}) async {
    state = state.copyWith(submitting: true, error: null);
    late KeyboardPwdType type;
    DateTime? start;
    DateTime? end;
    switch (state.kind) {
      case PasscodeGetKind.permanent:
        type = KeyboardPwdType.permanent;
        start = DateTime.now();
        end = null;
      case PasscodeGetKind.limited:
        type = KeyboardPwdType.limited;
        start = state.startDate;
        end = state.endDate;
      case PasscodeGetKind.once:
        type = KeyboardPwdType.once;
        start = state.startDate;
        end = state.endDate;
      case PasscodeGetKind.cyclic:
        type = state.cyclicType;
        try {
          final w = cyclicPasscodeWindow(
            type: type,
            startMinutes: state.startMinutes,
            endMinutes: state.endMinutes,
          );
          start = w.start;
          end = w.end;
        } on ArgumentError {
          state = state.copyWith(
            submitting: false,
            error: AppException.business(
              code: 0,
              message: 'invalid_cyclic_window',
            ),
          );
          return false;
        }
    }
    if (type != KeyboardPwdType.permanent && (start == null || end == null)) {
      state = state.copyWith(
        submitting: false,
        error: AppException.business(code: 0, message: 'invalid_period'),
      );
      return false;
    }
    final r = await ref
        .read(passcodeDomainProvider.notifier)
        .getRandom(
          lockId: _lock.lockId,
          type: type,
          start: start,
          end: end,
          keyboardPwdName: keyboardPwdName,
        )
        .run();
    return r.fold(
      (err) {
        state = state.copyWith(submitting: false, error: err);
        return false;
      },
      (pwd) {
        state = state.copyWith(submitting: false, result: pwd);
        return true;
      },
    );
  }
}
