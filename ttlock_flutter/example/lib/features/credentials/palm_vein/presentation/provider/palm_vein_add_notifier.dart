import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/provider/palm_vein_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/provider/palm_vein_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'palm_vein_add_notifier.g.dart';

/// 锁端录入掌静脉（BLE 采集 → 云端 confirmAdd）编排。
///
/// 与人脸录入同构（见 face_add_notifier）：
/// - 以流式相位驱动 UI（canStartAdd/error/success）；
/// - 掌静脉**无 collecting 相位**，原生把每帧采集反馈（未检测到手掌 / 角度不对 /
///   遮挡等）经 `onCollectionStatus` 映射为 `error`，因此 `error` 是**非终止**的
///   反馈，流会继续直至 success 或 onDone/onError，只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录掌。
@Riverpod()
class PalmVeinAddNotifier extends _$PalmVeinAddNotifier {
  late LockEntity _lock;
  late PalmVeinDomain _domain;
  StreamSubscription<AddPalmVeinEvent>? _addSub;
  var _disposed = false;
  String _name = '';

  @override
  PalmVeinAddState build(LockEntity lock) {
    _lock = lock;
    _domain = ref.read(palmVeinDomainProvider.notifier);
    ref.onDispose(() {
      _disposed = true;
      _addSub?.cancel();
      _domain.cancelAdd();
    });
    Future.microtask(_probeCyclic);
    return const PalmVeinAddState();
  }

  /// 启发式复用 cyclicCardOrFingerprint（非官方掌静脉循环位）。
  Future<void> _probeCyclic() async {
    if (_lock.lockData.isEmpty) {
      if (!_disposed) state = state.copyWith(showCyclic: false);
      return;
    }
    try {
      final ok = await runBle(
        () => TTLock.lock.supportFunction(
          TTLockFunction.cyclicCardOrFingerprint,
          _lock.lockData,
        ),
      );
      if (!_disposed) state = state.copyWith(showCyclic: ok);
    } on Object {
      if (!_disposed) state = state.copyWith(showCyclic: false);
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

  /// 发起录入：首次走 BLE 采集；若 BLE 已成功而仅云端确认失败
  /// （palmVeinNumber 已存在），则只重试提交，避免重复录掌。
  Future<bool> start({String? name}) async {
    _name = name ?? _name;
    if (_isOnLock(state)) {
      state = state.copyWith(isSubmitting: true, error: null, hint: '');
      await _submitToCloud(state.palmVeinNumber!);
      return true;
    }
    return _startBle();
  }

  Future<bool> _startBle() async {
    if (_lock.lockData.isEmpty) {
      state = state.copyWith(
        started: true,
        isRunning: false,
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
        started: true,
        isRunning: false,
        error: AppException.business(
          code: -24,
          message: 'invalid_cyclic_schedule',
        ),
      );
      return false;
    }

    await _addSub?.cancel();
    _domain.cancelAdd();
    state = state.copyWith(
      started: true,
      phase: null,
      isRunning: true,
      isSubmitting: false,
      hint: '',
      palmVeinNumber: null,
      succeeded: false,
      error: null,
    );

    final startMs = resolved.start?.millisecondsSinceEpoch ?? 0;
    final endMs = resolved.end?.millisecondsSinceEpoch ?? 0;
    try {
      _addSub = _domain
          .addViaBle(
            lockData: _lock.lockData,
            startMs: startMs,
            endMs: endMs,
            cycleList: resolved.cycleList,
          )
          .listen(
            _onBleEvent,
            onDone: () => state = state.copyWith(isRunning: false),
            onError: (Object e, StackTrace st) {
              if (_isOnLock(state)) return;
              state = state.copyWith(
                isRunning: false,
                error: ExceptionUtils.extractAppException(e, st),
              );
            },
          );
    } on Object catch (e, st) {
      state = state.copyWith(
        isRunning: false,
        error: ExceptionUtils.extractAppException(e, st),
      );
    }
    return true;
  }

  void _onBleEvent(AddPalmVeinEvent event) {
    switch (event.phase) {
      case TTAddPalmVeinPhase.canStartAdd:
        state = state.copyWith(
          phase: event.phase,
          isRunning: true,
          hint: ref.read(l10nProvider).palmVeinLockProgressGuide,
          error: null,
        );
        break;
      case TTAddPalmVeinPhase.error:
        // 非终止：采集反馈（未检测到手掌 / 角度不对 / 遮挡等），保持运行等待重试。
        state = state.copyWith(
          phase: event.phase,
          isRunning: true,
          hint: _collectionHint(event.errorCode),
          error: null,
        );
        break;
      case TTAddPalmVeinPhase.success:
        final number = event.palmVeinNumber;
        if (number == null || number.isEmpty) {
          state = state.copyWith(phase: null, isRunning: false);
          return;
        }
        state = state.copyWith(
          phase: event.phase,
          isRunning: false,
          isSubmitting: true,
          hint: '',
          palmVeinNumber: number,
        );
        _submitToCloud(number);
        break;
    }
  }

  Future<void> _submitToCloud(String number) async {
    final r = await _domain
        .confirmAdd(
          lockId: _lock.lockId,
          number: number,
          name: _name,
          kind: state.kind,
          start: state.startDate,
          end: state.endDate,
          schedule: state.schedule,
        )
        .run();
    r.fold(
      (err) => state = state.copyWith(isSubmitting: false, error: err),
      (_) => state = state.copyWith(
        isSubmitting: false,
        succeeded: true,
        error: null,
      ),
    );
  }

  void cancel() {
    _addSub?.cancel();
    _addSub = null;
    _domain.cancelAdd();
    state = state.copyWith(
      isRunning: false,
      phase: null,
      error: null,
      hint: ref.read(l10nProvider).enrollCancelHint,
    );
  }

  static bool _isOnLock(PalmVeinAddState state) {
    final n = state.palmVeinNumber;
    return n != null && n.isNotEmpty;
  }

  String _collectionHint(TTPalmVeinErrorCode? code) {
    final l = ref.read(l10nProvider);
    if (code == null) return '';
    return switch (code) {
      TTPalmVeinErrorCode.noPalmVeinDetected =>
        l.errorFirmwarePalmVeinNoPalmDetected,
      TTPalmVeinErrorCode.palmRectConfLow ||
      TTPalmVeinErrorCode.palmLandmarkConfLow =>
        l.errorFirmwarePalmVeinPosition,
      TTPalmVeinErrorCode.palmAngleRollError ||
      TTPalmVeinErrorCode.palmAngleLeanError => l.errorFirmwarePalmVeinAngle,
      TTPalmVeinErrorCode.palmBlock => l.errorFirmwarePalmVeinBlocked,
      TTPalmVeinErrorCode.palmBlur => l.errorFirmwarePalmVeinBlur,
      TTPalmVeinErrorCode.palmBack => l.errorFirmwarePalmVeinBack,
      TTPalmVeinErrorCode.unknownStatus => l.collectingPalmVein,
    };
  }
}
