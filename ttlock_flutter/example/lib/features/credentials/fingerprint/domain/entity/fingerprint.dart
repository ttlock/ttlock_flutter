import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';

part 'fingerprint.freezed.dart';

@freezed
abstract class FingerprintEntity with _$FingerprintEntity {
  const FingerprintEntity._();
  const factory FingerprintEntity({
    @Default(0) int fingerprintId,
    @Default(0) int lockId,
    @Default('') String fingerprintNumber,
    @Default(CredentialType.normal) CredentialType fingerprintType,
    @Default('') String fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    @Default([]) List<CyclicConfig> cyclicConfig,
    DateTime? createDate,
    @Default('') String senderUsername,
  }) = _FingerprintEntity;
}
