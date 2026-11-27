import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';

abstract class PalmVeinRepositoryInterface {
  TaskEither<AppException, List<PalmVeinEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  });

  TaskEither<AppException, int> add(
    int lockId,
    String number, {
    String? name,
    required int startDate,
    required int endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig> cyclicConfig = const [],
  });

  TaskEither<AppException, Unit> changePeriod(
    int id, {
    required int startDate,
    required int endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType? channel,
  });

  TaskEither<AppException, Unit> delete(int id, {ChannelType? channel});

  TaskEither<AppException, Unit> clear(int lockId);

  TaskEither<AppException, Unit> rename(int id, String name);
}
