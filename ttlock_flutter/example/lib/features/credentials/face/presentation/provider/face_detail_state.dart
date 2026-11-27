import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';

part 'face_detail_state.freezed.dart';

@freezed
abstract class FaceDetailState with _$FaceDetailState {
  const FaceDetailState._();
  const factory FaceDetailState({
    required FaceEntity item,
    @Default(false) bool operating,
    AppException? error,
  }) = _FaceDetailState;
}
