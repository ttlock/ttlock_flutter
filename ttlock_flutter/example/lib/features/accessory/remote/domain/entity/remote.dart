import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';

part 'remote.freezed.dart';

@freezed
abstract class RemoteEntity with _$RemoteEntity {
  const RemoteEntity._();
  const factory RemoteEntity({
    @Default(0) int remoteId,
    @Default('') String name,
    @Default('') String mac,
    @Default(0) int electricQuantity,
    @Default(EntityStatus.normal) EntityStatus status,
    @Default('') String nickname,
    @Default('') String userId,
    DateTime? startDate,
    DateTime? endDate,
    @Default(CredentialType.normal) CredentialType type,
    @Default([]) List<CyclicConfig> cyclicConfig,
    DateTime? createDate,
  }) = _RemoteEntity;
}
