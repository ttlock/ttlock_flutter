import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';

abstract class FaceRepositoryInterface {
  TaskEither<AppException, List<FaceEntity>> list(int lockId);

  TaskEither<AppException, int> add(
    int lockId, {
    String? faceName,
    String? faceNumber,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
    String? featureData,
  });

  TaskEither<AppException, String> getFeatureDataByPhoto(
    int lockId,
    List<int> imageBytes,
  );

  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int faceId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, Unit> delete(
    int lockId,
    int faceId, {
    ChannelType channel = ChannelType.bleSynced,
  });

  TaskEither<AppException, Unit> clear(int lockId);

  TaskEither<AppException, Unit> rename(int lockId, int faceId, String name);
}
