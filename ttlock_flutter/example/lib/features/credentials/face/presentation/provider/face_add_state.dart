import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

part 'face_add_state.freezed.dart';

@freezed
abstract class FaceAddState with _$FaceAddState {
  const FaceAddState._();
  const factory FaceAddState({
    @Default(CredentialValidityKind.permanent) CredentialValidityKind kind,

    /// 人脸始终展示循环选项（对齐开源），不探测能力位。
    @Default(true) bool showCyclic,
    DateTime? startDate,
    DateTime? endDate,
    CyclicSchedule? schedule,

    /// 是否已发起过录入（用于首帧展示「开始录入」/ 停止后展示「重新添加」）。
    @Default(false) bool started,

    /// BLE 采集当前相位（canStartAdd/collecting/error/success）。
    TTAddFacePhase? phase,

    /// BLE 采集流是否仍在运行。
    @Default(false) bool isRunning,

    /// 云端确认（confirmAdd）是否进行中。
    @Default(false) bool isSubmitting,

    /// 采集相位对应的实时提示（引导 / 误差编码文案）。
    @Default('') String hint,
    String? faceNumber,

    /// BLE 采集 + 云端确认均成功。
    @Default(false) bool succeeded,
    AppException? error,
  }) = _FaceAddState;
}
