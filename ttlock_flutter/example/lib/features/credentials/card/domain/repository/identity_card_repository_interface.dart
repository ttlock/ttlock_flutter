import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/domain/entity/identity_card.dart';

abstract class IdentityCardRepositoryInterface {
  TaskEither<AppException, List<IdentityCardEntity>> list(int lockId);

  TaskEither<AppException, int> add(
    int lockId,
    String cardNumber, {
    String? cardName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType cardType,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel,
  });

  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int cardId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel,
  });

  TaskEither<AppException, Unit> delete(
    int lockId,
    int cardId, {
    ChannelType channel,
  });

  TaskEither<AppException, Unit> clear(int lockId);

  TaskEither<AppException, Unit> rename(int lockId, int cardId, String name);
}
