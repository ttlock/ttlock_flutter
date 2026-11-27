import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/gateway/data/data_source/gateway_data_source.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/repository/gateway_repository_interface.dart';

part 'gateway_repository.g.dart';

@Riverpod(keepAlive: true)
class GatewayRepository extends _$GatewayRepository
    implements GatewayRepositoryInterface {
  late final GatewayDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(gatewayDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, PageState<GatewayEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int orderBy = 0,
  }) => _map(
    _dataSource.list(pageNo: pageNo, pageSize: pageSize, orderBy: orderBy),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: page.pageNo,
      pageSize: page.pageSize,
      total: page.total,
    ),
  );

  @override
  TaskEither<AppException, GatewayEntity> detail(int gatewayId) =>
      _map(_dataSource.detail(gatewayId: gatewayId), (dto) => dto.toEntity());

  @override
  TaskEither<AppException, Unit> rename(int gatewayId, String name) =>
      _dataSource
          .rename(gatewayId: gatewayId, gatewayName: name)
          .map((_) => unit);

  @override
  TaskEither<AppException, Unit> delete(int gatewayId) =>
      _dataSource.delete(gatewayId: gatewayId).map((_) => unit);

  @override
  TaskEither<AppException, List<GatewayEntity>> listByLock(int lockId) => _map(
    _dataSource.listByLock(lockId: lockId),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, int> confirmInitSuccess(String gatewayNetMac) =>
      _dataSource.isInitSuccess(gatewayNetMac: gatewayNetMac);

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
            message: '网关数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
