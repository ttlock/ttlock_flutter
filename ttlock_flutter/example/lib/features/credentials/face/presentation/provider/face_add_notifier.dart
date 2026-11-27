import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/provider/face_domain.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/presentation/provider/face_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

part 'face_add_notifier.g.dart';

/// 锁端录入人脸（BLE 采集 → 云端 confirmAdd）编排。
///
/// 对齐 ttaccess_manager 的 FaceLockProgressNotifier：
/// - 以流式相位驱动 UI（canStartAdd/collecting/error/success）；
/// - `error` 相位是**非终止**的采集反馈（如「未检测到人脸」「太远」），流会继续直至
///   success 或 onDone/onError，因此只更新 hint 而不终止本次录制；
/// - BLE 成功后再走云端确认，确认失败仅重试提交，避免重复录脸。
@Riverpod()
class FaceAddNotifier extends _$FaceAddNotifier {
  late LockEntity _lock;
  late FaceDomain _domain;
  StreamSubscription<AddFaceEvent>? _addSub;
  String _name = '';

  @override
  FaceAddState build(LockEntity lock) {
    _lock = lock;
    _domain = ref.read(faceDomainProvider.notifier);
    ref.onDispose(() {
      _addSub?.cancel();
      _domain.cancelAdd();
    });
    return const FaceAddState();
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

  /// 发起录入：首次走 BLE 采集；若 BLE 已成功而仅云端确认失败（faceNumber 已存在），
  /// 则只重试提交，避免重复扫脸入锁。
  Future<bool> start({String? name}) async {
    _name = name ?? _name;
    if (_isOnLock(state)) {
      state = state.copyWith(isSubmitting: true, error: null, hint: '');
      await _submitToCloud(state.faceNumber!);
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
      faceNumber: null,
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

  void _onBleEvent(AddFaceEvent event) {
    switch (event.phase) {
      case TTAddFacePhase.canStartAdd:
        state = state.copyWith(
          phase: event.phase,
          isRunning: true,
          hint: ref.read(l10nProvider).faceLockProgressGuide,
          error: null,
        );
        break;
      case TTAddFacePhase.collecting:
        state = state.copyWith(
          phase: event.phase,
          isRunning: true,
          hint: _collectionHint(event.errorCode),
          error: null,
        );
        break;
      case TTAddFacePhase.error:
        // 非终止：采集反馈（未检测到人脸 / 太远 / 遮挡等），保持运行等待重试。
        state = state.copyWith(
          phase: event.phase,
          isRunning: true,
          hint: _collectionHint(event.errorCode),
          error: null,
        );
        break;
      case TTAddFacePhase.success:
        final faceNumber = event.faceNumber;
        if (faceNumber == null || faceNumber.isEmpty) {
          state = state.copyWith(phase: null, isRunning: false);
          return;
        }
        state = state.copyWith(
          phase: event.phase,
          isRunning: false,
          isSubmitting: true,
          hint: '',
          faceNumber: faceNumber,
        );
        _submitToCloud(faceNumber);
        break;
    }
  }

  Future<void> _submitToCloud(String faceNumber) async {
    final r = await _domain
        .confirmAdd(
          lockId: _lock.lockId,
          lockData: _lock.lockData,
          faceNumber: faceNumber,
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

  static bool _isOnLock(FaceAddState state) {
    final n = state.faceNumber;
    return n != null && n.isNotEmpty;
  }

  String _collectionHint(TTFaceErrorCode? code) {
    final l = ref.read(l10nProvider);
    if (code == null || code == TTFaceErrorCode.normal) return '';
    return switch (code) {
      TTFaceErrorCode.noFaceDetected => l.errorFirmwareFaceNoFaceDetected,
      TTFaceErrorCode.tooCloseToTheTop ||
      TTFaceErrorCode.tooCloseToTheBottom ||
      TTFaceErrorCode.tooCloseToTheLeft ||
      TTFaceErrorCode.tooCloseToTheRight ||
      TTFaceErrorCode.tooClose => l.errorFirmwareFaceTooClose,
      TTFaceErrorCode.tooFarAway => l.errorFirmwareFaceTooFarAway,
      TTFaceErrorCode.eyebrowsCovered ||
      TTFaceErrorCode.eyesCovered ||
      TTFaceErrorCode.faceCovered => l.errorFirmwareFaceFaceCovered,
      _ => l.collectingFace,
    };
  }
}
