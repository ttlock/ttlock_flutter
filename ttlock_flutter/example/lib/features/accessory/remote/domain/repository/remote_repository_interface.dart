import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';

abstract class RemoteRepositoryInterface {
  TaskEither<AppException, List<RemoteEntity>> listByLock(int lockId);

  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    int electricQuantity = 100,
    String? firmwareInfo,
    String? number,
  });

  /// 改期：通道字段 `type` 为 [ChannelType]，勿传凭证 CredentialType。
  TaskEither<AppException, Unit> changePeriod(
    int remoteId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, Unit> delete(int remoteId);

  TaskEither<AppException, Unit> rename(int remoteId, String name);
}
