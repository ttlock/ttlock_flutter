import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/provider/card_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

part 'card_add_notifier.g.dart';

@Riverpod()
class CardAddNotifier extends _$CardAddNotifier {
  late CardAddArgs _args;
  late LockEntity _lock;
  late CardDomain _domain;
  var _cancelled = false;

  @override
  CardAddState build(CardAddArgs args) {
    _args = args;
    _lock = args.lock;
    _domain = ref.read(cardDomainProvider.notifier);
    ref.onDispose(() {
      _cancelled = true;
      _domain.cancelAdd();
    });
    Future.microtask(_probeCyclic);
    return const CardAddState();
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
    // 停 Dart 收事件，但锁仍在录入模式；保留 cancel hint。
    state = state.copyWith(
      enrolling: false,
      waiting: false,
      showCancelHint: true,
      pendingRegister: false,
      pendingCardNumber: null,
    );
  }

  Future<bool> start({String? cardName}) async {
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
      showCancelHint: false,
      error: null,
      cardName: cardName,
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
        if (event.phase == TTAddCardPhase.waiting) {
          state = state.copyWith(waiting: true);
        }
        if (event.phase == TTAddCardPhase.success &&
            event.cardNumber != null) {
          if (_cancelled) return false;
          final r = await _domain
              .confirmAdd(
                lockId: _lock.lockId,
                lockData: _lock.lockData,
                cardNumber: event.cardNumber!,
                cardName: cardName,
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
                error: err,
                pendingRegister: true,
                pendingCardNumber: event.cardNumber,
              );
              return false;
            },
            (_) {
              state = state.copyWith(
                enrolling: false,
                waiting: false,
                pendingRegister: false,
                pendingCardNumber: null,
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
        error: ExceptionUtils.extractAppException(e, st),
      );
      return false;
    }
    // Stream 无 success 结束（含 cancel 关闭）：复位 enrolling/waiting。
    if (!_cancelled) {
      state = state.copyWith(enrolling: false, waiting: false);
    }
    return false;
  }

  /// 只重发云端登记（锁里已有该卡）。
  ///
  /// 用 [CardAddState.cardName] 等**提交时刻的快照**参数，不吃用户之后对表单的修改。
  ///
  /// 飞行中保持 `pendingRegister: true` 并置 `enrolling: true`：前者让页面
  /// 的重试块不消失，后者让页面渲染取消入口而不是一个可点的主按钮 —— 否则
  /// 两次登记可以相隔一次点击并发跑起来。
  Future<bool> retryRegister() async {
    final number = state.pendingCardNumber;
    if (number == null) return false;
    state = state.copyWith(enrolling: true, error: null);
    final r = await _domain
        .confirmAdd(
          lockId: _lock.lockId,
          lockData: _lock.lockData,
          cardNumber: number,
          cardName: state.cardName,
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
          pendingCardNumber: number,
        );
        return false;
      },
      (_) {
        state = state.copyWith(
          enrolling: false,
          pendingCardNumber: null,
          pendingRegister: false,
        );
        return true;
      },
    );
  }
}
