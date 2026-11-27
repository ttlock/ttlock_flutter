import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';

part 'face_photo_add_state.freezed.dart';

@freezed
abstract class FacePhotoAddState with _$FacePhotoAddState {
  const FacePhotoAddState._();
  const factory FacePhotoAddState({
    @Default(CredentialValidityKind.permanent) CredentialValidityKind kind,

    /// 人脸始终展示循环选项（对齐开源），不探测能力位。
    @Default(true) bool showCyclic,
    DateTime? startDate,
    DateTime? endDate,
    CyclicSchedule? schedule,
    List<int>? imageBytes,
    @Default(false) bool photoTooLarge,
    @Default(false) bool submitting,
    AppException? error,
  }) = _FacePhotoAddState;
}
