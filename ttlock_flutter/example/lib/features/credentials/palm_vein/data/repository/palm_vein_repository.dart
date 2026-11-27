import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/channel_type.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/data/data_source/palm_vein_data_source.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/entity/palm_vein.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/domain/repository/palm_vein_repository_interface.dart';

part 'palm_vein_repository.g.dart';

@Riverpod(keepAlive: true)
class PalmVeinRepository extends _$PalmVeinRepository
    implements PalmVeinRepositoryInterface {
  late final PalmVeinDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(palmVeinDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<PalmVeinEntity>> list(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  }) => _map(
    _dataSource.list(
      lockId: lockId,
      pageNo: pageNo,
      pageSize: pageSize,
      searchStr: searchStr,
    ),
    (page) => page.list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String number, {
    String? name,
    required int startDate,
    required int endDate,
    CredentialType type = CredentialType.normal,
    List<CyclicConfig> cyclicConfig = const [],
  }) => _dataSource.add(
    lockId: lockId,
    number: number,
    name: name,
    startDate: startDate,
    endDate: endDate,
    type: type,
    cyclicConfig: cyclicConfig,
  );

  @override
  TaskEither<AppException, Unit> changePeriod(
    int id, {
    required int startDate,
    required int endDate,
    List<CyclicConfig>? cyclicConfig,
    ChannelType? channel,
  }) => _dataSource
      .changePeriod(
        id: id,
        startDate: startDate,
        endDate: endDate,
        cyclicConfig: cyclicConfig,
        channel: channel,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(int id, {ChannelType? channel}) =>
      _dataSource.delete(id: id, channel: channel).map((_) => unit);

  @override
  TaskEither<AppException, Unit> clear(int lockId) =>
      _dataSource.clear(lockId: lockId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> rename(int id, String name) =>
      _dataSource.rename(id: id, name: name).map((_) => unit);

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
            message: '掌静脉数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
