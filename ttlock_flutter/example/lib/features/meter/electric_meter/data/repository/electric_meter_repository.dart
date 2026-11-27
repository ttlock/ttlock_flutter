import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/data/data_source/electric_meter_data_source.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/repository/electric_meter_repository_interface.dart';

part 'electric_meter_repository.g.dart';

@Riverpod(keepAlive: true)
class ElectricMeterRepository extends _$ElectricMeterRepository
    implements ElectricMeterRepositoryInterface {
  late final ElectricMeterDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(electricMeterDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, int> add({
    required String mac,
    required String name,
  }) => _dataSource.add(mac: mac, name: name);

  @override
  TaskEither<AppException, PageState<ElectricMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  }) => _map(
    _dataSource.list(
      pageNo: pageNo,
      pageSize: pageSize,
      groupId: groupId,
      searchStr: searchStr,
    ),
    (page) => PageState(
      data: page.list.map((e) => e.toEntity()).toList(),
      currentPage: pageNo,
      pageSize: pageSize,
      total: page.total,
    ),
  );

  @override
  TaskEither<AppException, ElectricMeterEntity> detail(int meterId) => _map(
    _dataSource.detail(electricMeterId: meterId),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, Unit> rename(int meterId, String name) =>
      _dataSource.rename(electricMeterId: meterId, name: name).map((_) => unit);

  @override
  TaskEither<AppException, Unit> recharge(
    int meterId, {
    required double amount,
    required double kwh,
  }) => _dataSource
      .recharge(
        electricMeterId: meterId,
        rechargeAmount: amount,
        rechargeKwh: kwh,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> controlOnOff(
    int meterId, {
    required bool on,
  }) => _dataSource
      .controlOnOff(electricMeterId: meterId, onOff: on ? 1 : 0)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> updatePrice(
    int meterId, {
    required double price,
  }) => _dataSource
      .updatePrice(electricMeterId: meterId, price: price)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> updateMaxPower(
    int meterId, {
    required int maxPower,
  }) => _dataSource
      .updateMaxPower(electricMeterId: meterId, maxPower: maxPower)
      .map((_) => unit);

  @override
  TaskEither<AppException, List<ElectricMeterUsageRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  }) => _map(
    _dataSource.listRecords(
      electricMeterId: meterId,
      dateType: dateType,
      dateStr: dateStr,
    ),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, Unit> syncState(int meterId) =>
      _dataSource.syncState(electricMeterId: meterId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> configCatOneInfo(
    int meterId, {
    required String catOneNodeId,
    required String catOneCardNumber,
    required String catOneOperator,
    required String catOneImsi,
    required int catOneRssi,
    String? catOneApn,
  }) => _dataSource
      .configCatOneInfo(
        electricMeterId: meterId,
        catOneNodeId: catOneNodeId,
        catOneCardNumber: catOneCardNumber,
        catOneOperator: catOneOperator,
        catOneImsi: catOneImsi,
        catOneRssi: catOneRssi,
        catOneApn: catOneApn,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, PaginatedOperationRecords> listOperationRecords({
    required int electricMeterId,
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
  }) => _map(
    _dataSource.listOperationRecords(
      electricMeterId: electricMeterId,
      pageNo: pageNo,
      pageSize: pageSize,
      recordType: recordType,
    ),
    (page) => PaginatedOperationRecords(
      list: page.list.map((e) => e.toEntity()).toList(),
      total: page.total,
      pageNo: pageNo,
      pageSize: pageSize,
    ),
  );

  @override
  TaskEither<AppException, MeterCatOneInfoEntity> catOneInfo({
    required int electricMeterId,
  }) => _map(
    _dataSource.catOneDetail(electricMeterId: electricMeterId),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo({
    required int electricMeterId,
  }) => _map(
    _dataSource.upgradeCheck(electricMeterId: electricMeterId),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, Unit> clear({required int electricMeterId}) =>
      _dataSource.clear(electricMeterId: electricMeterId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> updatePayMode({
    required int electricMeterId,
    required int payMode,
    double? price,
  }) => _dataSource
      .updatePayMode(
        electricMeterId: electricMeterId,
        payMode: payMode,
        price: price,
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
            message: '电表数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
