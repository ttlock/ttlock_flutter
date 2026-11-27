import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/provider/fingerprint_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/provider/fingerprint_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'fingerprint_add_notifier.g.dart';

@Riverpod()
class FingerprintAddNotifier extends _$FingerprintAddNotifier {
  late FingerprintAddArgs _args;
  late LockEntity _lock;
  late FingerprintDomain _domain;
  var _cancelled = false;

  @override
  FingerprintAddState build(FingerprintAddArgs args) {
    _args = args;
    _lock = args.lock;
    _domain = ref.read(fingerprintDomainProvider.notifier);
    ref.onDispose(() {
      _cancelled = true;
      _domain.cancelAdd();
    });
    Future.microtask(_probeCyclic);
    return const FingerprintAddState();
  }

  Future<void> _probeCyclic() async {
    if (_lock.lockData.isEmpty) {
      state = state.copyWith(showCyclic: false);
      return;
    }
    try {
      final ok = await runBle(
        () => TTLock.lock.supportFunction(
          TTLockFunction.cyclicCardOrFingerprint,
          _lock.lockData,
        ),
      );
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

  void cancel() {
    _cancelled = true;
    _domain.cancelAdd();
    state = state.copyWith(
      enrolling: false,
      waiting: false,
      collecting: false,
      currentCount: null,
      totalCount: null,
      showCancelHint: true,
      pendingRegister: false,
      pendingFingerprintNumber: null,
    );
  }

  Future<bool> start({String? fingerprintName}) async {
    if (_lock.lockData.isEmpty) {
      state = state.copyWith(
        error: AppException.business(code: -21, message: 'ble_unreachable'),
      );
      return false;
    }
    late final ResolvedValidity resolved;
    try {
      resolved = resolveValidity(
        kind: state.kind,
        start: state.startDate,
        end: state.endDate,
        schedule: state.schedule,
      );
    } on ArgumentError {
      state = state.copyWith(
        error: AppException.business(
          code: -24,
          message: 'invalid_cyclic_schedule',
        ),
      );
      return false;
    }
    _cancelled = false;
    state = state.copyWith(
      enrolling: true,
      waiting: false,
      collecting: false,
      currentCount: null,
      totalCount: null,
      showCancelHint: false,
      error: null,
      fingerprintName: fingerprintName,
    );
    final startMs = resolved.start?.millisecondsSinceEpoch ?? 0;
    final endMs = resolved.end?.millisecondsSinceEpoch ?? 0;
    try {
      final stream = _args.keypadMac == null
          ? _domain.addViaBle(
              lockData: _lock.lockData,
              startMs: startMs,
              endMs: endMs,
              cycleList: resolved.cycleList,
            )
          : _domain.addViaKeypad(
              keypadMac: _args.keypadMac!,
              lockData: _lock.lockData,
              startMs: startMs,
              endMs: endMs,
              cycleList: resolved.cycleList,
            );
      await for (final event in stream) {
        if (_cancelled) return false;
        if (event.phase == TTAddFingerprintPhase.waiting) {
          // 键盘路径首次可能以 waiting + 0/0 表示「待激活」，计数也要写入 state。
          state = state.copyWith(
            waiting: true,
            collecting: false,
            currentCount: event.currentCount,
            totalCount: event.totalCount,
          );
        }
        if (event.phase == TTAddFingerprintPhase.collecting) {
          state = state.copyWith(
            waiting: false,
            collecting: true,
            currentCount: event.currentCount,
            totalCount: event.totalCount,
          );
        }
        if (event.phase == TTAddFingerprintPhase.success &&
            event.fingerprintNumber != null) {
          if (_cancelled) return false;
          final r = await _domain
              .confirmAdd(
                lockId: _lock.lockId,
                fingerprintNumber: event.fingerprintNumber!,
                name: fingerprintName,
                kind: state.kind,
                start: state.startDate,
                end: state.endDate,
                schedule: state.schedule,
              )
              .run();
          return r.fold(
            (err) {
              state = state.copyWith(
                enrolling: false,
                waiting: false,
                collecting: false,
                error: err,
                pendingRegister: true,
                pendingFingerprintNumber: event.fingerprintNumber,
              );
              return false;
            },
            (_) {
              state = state.copyWith(
                enrolling: false,
                waiting: false,
                collecting: false,
                pendingRegister: false,
                pendingFingerprintNumber: null,
              );
              return true;
            },
          );
        }
      }
    } on Object catch (e, st) {
      if (_cancelled) return false;
      state = state.copyWith(
        enrolling: false,
        waiting: false,
        collecting: false,
        error: ExceptionUtils.extractAppException(e, st),
      );
      return false;
    }
    if (!_cancelled) {
      state = state.copyWith(
        enrolling: false,
        waiting: false,
        collecting: false,
      );
    }
    return false;
  }

  /// 只重发云端登记（锁里已有该指纹）。
  ///
  /// 用 [FingerprintAddState.fingerprintName] 等**提交时刻的快照**参数，
  /// 不吃用户之后对表单的修改。
  ///
  /// 飞行中保持 `pendingRegister: true` 并置 `enrolling: true`：前者让页面
  /// 的重试块不消失，后者让页面渲染取消入口而不是一个可点的主按钮 —— 否则
  /// 两次登记可以相隔一次点击并发跑起来。
  Future<bool> retryRegister() async {
    final number = state.pendingFingerprintNumber;
    if (number == null) return false;
    state = state.copyWith(enrolling: true, error: null);
    final r = await _domain
        .confirmAdd(
          lockId: _lock.lockId,
          fingerprintNumber: number,
          name: state.fingerprintName,
          kind: state.kind,
          start: state.startDate,
          end: state.endDate,
          schedule: state.schedule,
        )
        .run();
    return r.fold(
      (err) {
        state = state.copyWith(
          enrolling: false,
          error: err,
          pendingRegister: true,
          // 飞行中可能被 cancel() 清掉了编号；失败时放回去，与 start() 的
          // 失败分支对称，否则页面会渲染一个点不动的「重试登记」。
          pendingFingerprintNumber: number,
        );
        return false;
      },
      (_) {
        state = state.copyWith(
          enrolling: false,
          pendingFingerprintNumber: null,
          pendingRegister: false,
        );
        return true;
      },
    );
  }
}
