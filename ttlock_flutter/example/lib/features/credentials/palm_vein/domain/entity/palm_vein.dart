import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';

part 'palm_vein.freezed.dart';

@freezed
abstract class PalmVeinEntity with _$PalmVeinEntity {
  const PalmVeinEntity._();
  const factory PalmVeinEntity({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String number,
    @Default(EntityStatus.normal) EntityStatus status,
    @Default('') String nickname,
    DateTime? startDate,
    DateTime? endDate,
    @Default(CredentialType.normal) CredentialType type,
    @Default([]) List<CyclicConfig> cyclicConfig,
    DateTime? createDate,
  }) = _PalmVeinEntity;
}
