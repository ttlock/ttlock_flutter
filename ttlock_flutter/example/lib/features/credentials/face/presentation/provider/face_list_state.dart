import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';

part 'face_list_state.freezed.dart';

@freezed
abstract class FaceListState with _$FaceListState {
  const FaceListState._();
  const factory FaceListState({@Default([]) List<FaceEntity> items}) =
      _FaceListState;
}
