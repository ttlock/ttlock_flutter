import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/data/data_source/face_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/entity/face.dart';
import 'package:ttlock_flutter_demo/features/credentials/face/domain/repository/face_repository_interface.dart';

part 'face_repository.g.dart';

@Riverpod(keepAlive: true)
class FaceRepository extends _$FaceRepository
    implements FaceRepositoryInterface {
  late final FaceDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(faceDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<FaceEntity>> list(int lockId) => _map(
    _dataSource.list(lockId: lockId),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
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
  }) => _dataSource.add(
    lockId: lockId,
    faceName: faceName,
    faceNumber: faceNumber,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    channel: channel,
    featureData: featureData,
  );

  @override
  TaskEither<AppException, String> getFeatureDataByPhoto(
    int lockId,
    List<int> imageBytes,
  ) =>
      _dataSource.getFeatureDataByPhoto(lockId: lockId, imageBytes: imageBytes);

  @override
  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int faceId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .changePeriod(
        lockId: lockId,
        faceId: faceId,
        startDate: startDate,
        endDate: endDate,
        cyclicConfig: cyclicConfig,
        channel: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int faceId, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .delete(lockId: lockId, faceId: faceId, channel: channel)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> clear(int lockId) =>
      _dataSource.clear(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> rename(int lockId, int faceId, String name) =>
      _dataSource
          .rename(lockId: lockId, faceId: faceId, name: name)
          .map((_) => unit);

  TaskEither<AppException, R> _map<T, R>(
    TaskEither<AppException, T> call,
    R Function(T) mapper,
  ) => TaskEither(() async {
    final result = await call.run();
    return result.fold(Left.new, (dto) {
      try {
        return Right(mapper(dto));
      } catch (error, stackTrace) {
        return Left(
          AppException.parse(
            message: '人脸数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
