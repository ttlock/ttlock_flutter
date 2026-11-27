import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';

part 'face.freezed.dart';

@freezed
abstract class FaceEntity with _$FaceEntity {
  const FaceEntity._();
  const factory FaceEntity({
    @Default(0) int faceId,
    @Default(0) int lockId,
    @Default('') String name,
    @Default('') String faceNumber,
    @Default(EntityStatus.normal) EntityStatus status,
    @Default('') String nickname,
    @Default('') String userid,
    @Default(CredentialType.normal) CredentialType type,
    DateTime? startDate,
    DateTime? endDate,
    @Default([]) List<CyclicConfig> cyclicConfig,
    DateTime? createDate,
  }) = _FaceEntity;
}
