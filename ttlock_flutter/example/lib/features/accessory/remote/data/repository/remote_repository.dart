import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/data/data_source/remote_data_source.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/repository/remote_repository_interface.dart';

part 'remote_repository.g.dart';

@Riverpod(keepAlive: true)
class RemoteRepository extends _$RemoteRepository
    implements RemoteRepositoryInterface {
  late final RemoteDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(remoteDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<RemoteEntity>> listByLock(int lockId) => _map(
    _dataSource.listByLock(lockId: lockId),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
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
  }) => _dataSource.add(
    lockId: lockId,
    mac: mac,
    name: name,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
    electricQuantity: electricQuantity,
    firmwareInfo:
        firmwareInfo ??
        '{"modelNum":"","hardwareRevision":"","firmwareRevision":""}',
    number: number,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int remoteId, {
    required DateTime startDate,
    required DateTime endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType channel = ChannelType.bleSynced,
  }) => _dataSource
      .changePeriod(
        remoteId: remoteId,
        startDate: startDate,
        endDate: endDate,
        cyclicConfig: cyclicConfig,
        channel: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(int remoteId) =>
      _dataSource.delete(remoteId: remoteId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> rename(int remoteId, String name) =>
      _dataSource.update(remoteId: remoteId, name: name).map((_) => unit);

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
            message: '遥控数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
