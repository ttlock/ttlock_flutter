import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/data/data_source/door_sensor_data_source.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/repository/door_sensor_repository_interface.dart';

part 'door_sensor_repository.g.dart';

@Riverpod(keepAlive: true)
class DoorSensorRepository extends _$DoorSensorRepository
    implements DoorSensorRepositoryInterface {
  late final DoorSensorDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(doorSensorDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, List<DoorSensorEntity>> listByLock(int lockId) =>
      query(
        lockId,
      ).map((entity) => entity.doorSensorId > 0 ? [entity] : const []);

  @override
  TaskEither<AppException, int> add(
    int lockId,
    String mac, {
    String? name,
    required int electricQuantity,
    required String firmwareInfo,
    required String number,
  }) => _dataSource.add(
    lockId: lockId,
    mac: mac,
    name: name,
    electricQuantity: electricQuantity,
    firmwareInfo: firmwareInfo,
    number: number,
  );

  @override
  TaskEither<AppException, Unit> delete(int doorSensorId) =>
      _dataSource.delete(doorSensorId: doorSensorId).map((_) => unit);

  @override
  TaskEither<AppException, DoorSensorEntity> query(int lockId) =>
      _map(_dataSource.query(lockId: lockId), (dto) => dto.toEntity());

  @override
  TaskEither<AppException, Unit> rename(int doorSensorId, String name) =>
      _dataSource
          .update(doorSensorId: doorSensorId, name: name)
          .map((_) => unit);

  @override
  TaskEither<AppException, PageState<DoorSensorRecordEntity>> listRecord(
    int lockId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _map(
    _dataSource.listRecord(lockId: lockId, pageNo: pageNo, pageSize: pageSize),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: page.pageNo,
      pageSize: page.pageSize,
      total: page.total,
    ),
  );

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
            message: '门磁数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}

@Riverpod(keepAlive: true)
class StandaloneDoorSensorRepository extends _$StandaloneDoorSensorRepository
    implements StandaloneDoorSensorRepositoryInterface {
  late final DoorSensorDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(doorSensorDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, PageState<StandaloneDoorSensorEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    String? searchStr,
  }) => _map(
    _dataSource.standaloneList(
      pageNo: pageNo,
      pageSize: pageSize,
      searchStr: searchStr,
    ),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: page.pageNo,
      pageSize: page.pageSize,
      total: page.total,
    ),
  );

  @override
  TaskEither<AppException, int> add({
    required String name,
    required String doorSensorData,
    required String wifiName,
  }) => _dataSource.standaloneAdd(
    name: name,
    doorSensorData: doorSensorData,
    wifiName: wifiName,
  );

  @override
  TaskEither<AppException, Unit> delete(int doorSensorId) =>
      _dataSource.standaloneDelete(doorSensorId: doorSensorId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> update(int doorSensorId, String name) =>
      _dataSource
          .standaloneUpdate(doorSensorId: doorSensorId, name: name)
          .map((_) => unit);

  @override
  TaskEither<AppException, Unit> configAlertFlag(
    int doorSensorId, {
    required int notCloseAlertFlag,
    int? notCloseAlertSecondNum,
    required int longTimeNotOpenAlertFlag,
    int? longTimeNotOpenDayNum,
  }) => _dataSource
      .standaloneConfigAlertFlag(
        doorSensorId: doorSensorId,
        notCloseAlertFlag: notCloseAlertFlag,
        notCloseAlertSecondNum: notCloseAlertSecondNum,
        longTimeNotOpenAlertFlag: longTimeNotOpenAlertFlag,
        longTimeNotOpenDayNum: longTimeNotOpenDayNum,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, List<StandaloneDoorSensorRecordEntity>> listRecord(
    int doorSensorId, {
    int pageNo = 1,
    int pageSize = 20,
  }) => _map(
    _dataSource.standaloneListRecord(
      doorSensorId: doorSensorId,
      pageNo: pageNo,
      pageSize: pageSize,
    ),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, StandaloneDoorSensorAlertFlagEntity> getAlertFlag(
    int doorSensorId,
  ) => _map(
    _dataSource.standaloneGetAlertFlag(doorSensorId: doorSensorId),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, Unit> configNetwork(
    int doorSensorId, {
    required String doorSensorData,
    required String wifiName,
  }) => _dataSource
      .standaloneConfigNetwork(
        doorSensorId: doorSensorId,
        doorSensorData: doorSensorData,
        wifiName: wifiName,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> addDoorSensorUser(
    int doorSensorId, {
    required String account,
    required String username,
  }) => _dataSource
      .standaloneAddDoorSensorUser(
        doorSensorId: doorSensorId,
        account: account,
        username: username,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> deleteDoorSensorUser(
    int doorSensorId,
    int id,
  ) => _dataSource
      .standaloneDeleteDoorSensorUser(doorSensorId: doorSensorId, id: id)
      .map((_) => unit);

  @override
  TaskEither<AppException, List<StandaloneDoorSensorUserEntity>>
  listDoorSensorUser(int doorSensorId, {String? searchStr}) => _map(
    _dataSource.standaloneListDoorSensorUser(
      doorSensorId: doorSensorId,
      searchStr: searchStr,
    ),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

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
            message: '独立门磁数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
