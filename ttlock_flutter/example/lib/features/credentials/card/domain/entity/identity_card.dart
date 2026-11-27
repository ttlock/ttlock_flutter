import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';

part 'identity_card.freezed.dart';

@freezed
abstract class IdentityCardEntity with _$IdentityCardEntity {
  const IdentityCardEntity._();
  const factory IdentityCardEntity({
    @Default(0) int cardId,
    @Default(0) int lockId,
    @Default('') String cardNumber,
    @Default('') String cardName,
    @Default(CredentialType.normal) CredentialType cardType,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createDate,
    @Default('') String senderUsername,
    @Default([]) List<CyclicConfig> cyclicConfig,
  }) = _IdentityCardEntity;
}
