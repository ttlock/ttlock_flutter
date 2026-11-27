import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';

abstract class ElectricMeterRepositoryInterface {
  TaskEither<AppException, int> add({
    required String mac,
    required String name,
  });

  TaskEither<AppException, PageState<ElectricMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  });

  TaskEither<AppException, ElectricMeterEntity> detail(int meterId);

  TaskEither<AppException, Unit> rename(int meterId, String name);

  TaskEither<AppException, Unit> recharge(
    int meterId, {
    required double amount,
    required double kwh,
  });

  TaskEither<AppException, Unit> controlOnOff(int meterId, {required bool on});

  TaskEither<AppException, Unit> updatePrice(
    int meterId, {
    required double price,
  });

  TaskEither<AppException, Unit> updateMaxPower(
    int meterId, {
    required int maxPower,
  });

  TaskEither<AppException, List<ElectricMeterUsageRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  });

  TaskEither<AppException, Unit> syncState(int meterId);

  /// 上传 Cat.1（4G）模块网络信息：`/v3/electricMeter/configCatOneInfo`。
  ///
  /// [catOneApn] 仅海外非空。
  TaskEither<AppException, Unit> configCatOneInfo(
    int meterId, {
    required String catOneNodeId,
    required String catOneCardNumber,
    required String catOneOperator,
    required String catOneImsi,
    required int catOneRssi,
    String? catOneApn,
  });

  TaskEither<AppException, PaginatedOperationRecords> listOperationRecords({
    required int electricMeterId,
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
  });

  TaskEither<AppException, MeterCatOneInfoEntity> catOneInfo({
    required int electricMeterId,
  });

  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo({
    required int electricMeterId,
  });

  /// 清零（清除剩余电量）。**仅预付费模式应调用**，门控由调用方负责。
  TaskEither<AppException, Unit> clear({required int electricMeterId});

  TaskEither<AppException, Unit> updatePayMode({
    required int electricMeterId,
    required int payMode,
    double? price,
  });
}
