import 'package:fpdart/fpdart.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/core/data/page_state.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';

abstract class WaterMeterRepositoryInterface {
  TaskEither<AppException, int> add({
    required String mac,
    required String name,
  });

  TaskEither<AppException, Unit> delete({required int waterMeterId});

  TaskEither<AppException, PageState<WaterMeterEntity>> list({
    int pageNo = 1,
    int pageSize = 20,
    int? groupId,
    String? searchStr,
  });

  TaskEither<AppException, WaterMeterEntity> detail(int meterId);

  TaskEither<AppException, Unit> rename(int meterId, String name);

  TaskEither<AppException, Unit> recharge(
    int meterId, {
    required double amount,
    required double m3,
  });

  TaskEither<AppException, Unit> controlOnOff(int meterId, {required bool on});

  TaskEither<AppException, Unit> updatePrice(
    int meterId, {
    required double price,
  });

  TaskEither<AppException, List<WaterMeterRecordEntity>> listRecords(
    int meterId, {
    required int dateType,
    required String dateStr,
  });

  TaskEither<AppException, Unit> syncState(int meterId);

  /// 上传 Cat.1（4G）模块网络信息：`/v3/waterMeter/configCatOneInfo`。
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
    required int waterMeterId,
    int pageNo = 1,
    int pageSize = 20,
    String? recordType,
  });

  TaskEither<AppException, MeterCatOneInfoEntity> catOneInfo({
    required int waterMeterId,
  });

  TaskEither<AppException, MeterFirmwareEntity> firmwareInfo({
    required int waterMeterId,
  });

  /// 清零（清除剩余水量）。**仅预付费模式应调用**，门控由调用方负责。
  TaskEither<AppException, Unit> clear({required int waterMeterId});

  TaskEither<AppException, Unit> updatePayMode({
    required int waterMeterId,
    required int payMode,
    double? price,
  });

  /// 设置总用量（水表独有的调整项，对应电表的「最大功率」位置）。
  TaskEither<AppException, Unit> updateTotal({
    required int waterMeterId,
    required double totalKwh,
  });
}
