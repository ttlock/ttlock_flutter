import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/data/data_source/water_meter_data_source.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/repository/water_meter_repository_interface.dart';

part 'water_meter_repository.g.dart';

@Riverpod(keepAlive: true)
class WaterMeterRepository extends _$WaterMeterRepository
    implements WaterMeterRepositoryInterface {
  late final WaterMeterDataSource _dataSource;

  @override
  void build() {
    _dataSource = ref.watch(waterMeterDataSourceProvider.notifier);
  }

  @override
  TaskEither<AppException, int> add({
    required String mac,
    required String name,
  }) => _dataSource.add(mac: mac, name: name);

  @override
  TaskEither<AppException, Unit> delete({required int waterMeterId}) =>
      _dataSource.delete(waterMeterId: waterMeterId).map((_) => unit);

  @override
  TaskEither<AppException, PageState<WaterMeterEntity>> list({
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
  TaskEither<AppException, WaterMeterEntity> detail(int meterId) =>
      _map(_dataSource.detail(waterMeterId: meterId), (dto) => dto.toEntity());

  @override
  TaskEither<AppException, Unit> rename(int meterId, String name) =>
      _dataSource.rename(waterMeterId: meterId, name: name).map((_) => unit);

  @override
  TaskEither<AppException, Unit> recharge(
    int meterId, {
    required double amount,
    required double m3,
  }) => _dataSource
      .recharge(waterMeterId: meterId, rechargeAmount: amount, rechargeM3: m3)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> controlOnOff(
    int meterId, {
    required bool on,
  }) => _dataSource
      .controlOnOff(waterMeterId: meterId, onOff: on ? 1 : 0)
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> updatePrice(
    int meterId, {
    required double price,
  }) => _dataSource
      .updatePrice(waterMeterId: meterId, price: price)
      .map((_) => unit);

  @override
  TaskEither<AppException, List<WaterMeterRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  }) => _map(
    _dataSource.listRecords(
      waterMeterId: meterId,
      dateType: dateType,
      dateStr: dateStr,
    ),
    (list) => list.map((e) => e.toEntity()).toList(),
  );

  @override
  TaskEither<AppException, Unit> syncState(int meterId) =>
      _dataSource.syncState(waterMeterId: meterId).map((_) => unit);

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
        waterMeterId: meterId,
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
    required int waterMeterId,
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
  }) => _map(
    _dataSource.listOperationRecords(
      waterMeterId: waterMeterId,
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
    required int waterMeterId,
  }) => _map(
    _dataSource.catOneDetail(waterMeterId: waterMeterId),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo({
    required int waterMeterId,
  }) => _map(
    _dataSource.upgradeCheck(waterMeterId: waterMeterId),
    (dto) => dto.toEntity(),
  );

  @override
  TaskEither<AppException, Unit> clear({required int waterMeterId}) =>
      _dataSource.clear(waterMeterId: waterMeterId).map((_) => unit);

  @override
  TaskEither<AppException, Unit> updatePayMode({
    required int waterMeterId,
    required int payMode,
    double? price,
  }) => _dataSource
      .updatePayMode(
        waterMeterId: waterMeterId,
        payMode: payMode,
        price: price,
      )
      .map((_) => unit);

  @override
  TaskEither<AppException, Unit> updateTotal({
    required int waterMeterId,
    required double totalKwh,
  }) => _dataSource
      .updateTotal(waterMeterId: waterMeterId, totalM3: totalKwh)
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
            message: '水表数据转换失败: $error',
            error: error,
            stackTrace: stackTrace,
          ),
        );
      }
    });
  });
}
