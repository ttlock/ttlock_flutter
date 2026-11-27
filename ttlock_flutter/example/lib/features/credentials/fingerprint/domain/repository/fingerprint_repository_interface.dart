import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';

abstract class FingerprintRepositoryInterface {
  TaskEither<AppException, List<FingerprintEntity>> list(int lockId);

  TaskEither<AppException, int> add(
    int lockId,
    String fingerprintNumber, {
    String? fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType fingerprintType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, int> addByGateway(
    int lockId,
    String fingerprintData, {
    String? fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType fingerprintType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
  });

  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int fingerprintId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, Unit> delete(
    int lockId,
    int fingerprintId, {
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, Unit> clear(int lockId);

  TaskEither<AppException, Unit> rename(
    int lockId,
    int fingerprintId,
    String fingerprintName,
  );
}
