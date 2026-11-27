import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/data/data_source/fingerprint_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/repository/fingerprint_repository_interface.dart';

part 'fingerprint_repository.g.dart';

@Riverpod(keepAlive: true)
class FingerprintRepository extends _$FingerprintRepository
    implements FingerprintRepositoryInterface {
  late final FingerprintDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(fingerprintDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<FingerprintEntity>> list(int lockId) => _map(
    _dataSource.list(lockId: lockId),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String fingerprintNumber, {
    String? fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType fingerprintType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource.add(
    lockId: lockId,
    fingerprintNumber: fingerprintNumber,
    fingerprintName: fingerprintName,
    startDate: startDate,
    endDate: endDate,
    fingerprintType: fingerprintType,
    cyclicConfig: cyclicConfig,
    channel: channel,
  );

  @override
  TaskEither<AppException, int> addByGateway(
    int lockId,
    String fingerprintData, {
    String? fingerprintName,
    DateTime? startDate,
    DateTime? endDate,
    CredentialType fingerprintType = CredentialType.normal,
    List<CyclicConfig>? cyclicConfig,
  }) => _dataSource.addByGateway(
    lockId: lockId,
    fingerprintData: fingerprintData,
    fingerprintName: fingerprintName,
    startDate: startDate,
    endDate: endDate,
    fingerprintType: fingerprintType,
    cyclicConfig: cyclicConfig,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int lockId,
    int fingerprintId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .changePeriod(
        lockId: lockId,
        fingerprintId: fingerprintId,
        startDate: startDate,
        endDate: endDate,
        cyclicConfig: cyclicConfig,
        channel: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(
    int lockId,
    int fingerprintId, {
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .delete(lockId: lockId, fingerprintId: fingerprintId, channel: channel)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> clear(int lockId) =>
      _dataSource.clear(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> rename(
    int lockId,
    int fingerprintId,
    String fingerprintName,
  ) => _dataSource
      .rename(
        lockId: lockId,
        fingerprintId: fingerprintId,
        fingerprintName: fingerprintName,
      )
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
            message: '指纹数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
