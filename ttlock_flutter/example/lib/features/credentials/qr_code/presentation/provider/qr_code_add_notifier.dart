import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/provider/qr_code_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/provider/qr_code_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/provider/qr_code_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'qr_code_add_notifier.g.dart';

@Riverpod()
class QrCodeAddNotifier extends _$QrCodeAddNotifier {
  late LockEntity _lock;
  var _cancelled = false;

  @override
  QrCodeAddState build(LockEntity lock) {
    _lock = lock;
    _cancelled = false;
    ref.onDispose(() => _cancelled = true);
    Future.microtask(_probeCyclic);
    return const QrCodeAddState();
  }

  Future<void> _probeCyclic() async {
    if (_lock.lockData.isEmpty) {
      state = state.copyWith(showCyclic: false);
      return;
    }
    try {
      final ok = await runBle(() async {
        final qr = await TTLock.lock.supportFunction(
          TTLockFunction.qrCode,
          _lock.lockData,
        );
        if (qr) return true;
        return await TTLock.lock.supportFunction(
          TTLockFunction.customQRCode,
          _lock.lockData,
        );
      });
      if (!_cancelled) state = state.copyWith(showCyclic: ok);
    } on Object {
      if (!_cancelled) state = state.copyWith(showCyclic: false);
    }
  }

  void setKind(CredentialValidityKind kind) {
    if (kind == CredentialValidityKind.permanent) {
      state = state.copyWith(kind: kind);
      return;
    }
    final now = DateTime.now();
    state = state.copyWith(
      kind: kind,
      startDate: state.startDate ?? now,
      endDate: state.endDate ?? now.add(const Duration(days: 7)),
    );
  }

  void setStartDate(DateTime value) => state = state.copyWith(startDate: value);

  void setEndDate(DateTime value) => state = state.copyWith(endDate: value);

  void setSchedule(CyclicSchedule? value) =>
      state = state.copyWith(schedule: value);

  void clearError() => state = state.copyWith(error: null);

  Future<bool> submit({String? name}) async {
    if (state.kind == CredentialValidityKind.cyclic &&
        (state.schedule == null || !state.schedule!.isValid)) {
      state = state.copyWith(
        error: AppException.business(
          code: -24,
          message: 'invalid_cyclic_schedule',
        ),
      );
      return false;
    }
    state = state.copyWith(submitting: true, error: null);
    final r = await ref
        .read(qrCodeDomainProvider.notifier)
        .add(
          lock: _lock,
          name: name,
          kind: state.kind,
          start: state.startDate,
          end: state.endDate,
          schedule: state.schedule,
        )
        .run();
    return r.fold(
      (err) {
        state = state.copyWith(submitting: false, error: err);
        return false;
      },
      (entity) {
        ref.invalidate(qrCodeListProvider);
        state = state.copyWith(submitting: false, result: entity);
        return true;
      },
    );
  }
}
