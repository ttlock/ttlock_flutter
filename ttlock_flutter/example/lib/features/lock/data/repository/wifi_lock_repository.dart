import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/data/data_source/wifi_lock_data_source.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_lock.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/repository/wifi_lock_repository_interface.dart';

part 'wifi_lock_repository.g.dart';

@Riverpod(keepAlive: true)
class WifiLockRepository extends _$WifiLockRepository
    implements WifiLockRepositoryInterface {
  late final WifiLockDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(wifiLockDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, WifiLockEntity> detail(int lockId) =>
      _map(_dataSource.detail(lockId: lockId), (dto) => dto.toEntity());

  @override
  TaskEither<AppException, Unit> updateNetwork(
    int lockId, {
    String? networkName,
    String? wifiMac,
    int? rssi,
    bool? useStaticIp,
    String? ip,
    String? subnetMask,
    String? defaultGateway,
    String? preferredDns,
    String? alternateDns,
  }) => _dataSource
      .updateNetwork(
        lockId: lockId,
        networkName: networkName,
        wifiMac: wifiMac,
        rssi: rssi,
        useStaticIp: useStaticIp,
        ip: ip,
        subnetMask: subnetMask,
        defaultGateway: defaultGateway,
        preferredDns: preferredDns,
        alternateDns: alternateDns,
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
            message: 'Wifi锁数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
