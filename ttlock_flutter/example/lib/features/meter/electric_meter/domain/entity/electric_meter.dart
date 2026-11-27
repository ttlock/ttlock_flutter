import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';

part 'electric_meter.freezed.dart';

@freezed
abstract class ElectricMeterEntity with _$ElectricMeterEntity {
  const ElectricMeterEntity._();
  const factory ElectricMeterEntity({
    @Default(0) int electricMeterId,
    @Default(false) bool online,
    @Default(0) int rssi,
    @Default(MeterOnOff.unknown) MeterOnOff onOff,
    @Default('') String name,
    @Default('') String number,
    @Default(MeterPayMode.energy) MeterPayMode payMode,
    @Default('') String totalKwh,
    @Default('') String remainderKwh,
    @Default('') String price,
    @Default(0) int electricQuantity,
    @Default('') String maxPower,
    @Default('') String featureValue,
    @Default('') String mac,
    @Default('') String modelNum,
    @Default('') String hardwareRevision,
    @Default('') String firmwareRevision,
    DateTime? syncKwhDate,
    @Default('') String groupName,
    @Default(0) int groupId,
  }) = _ElectricMeterEntity;
}

@freezed
abstract class ElectricMeterUsageRecordEntity
    with _$ElectricMeterUsageRecordEntity {
  const factory ElectricMeterUsageRecordEntity({
    @Default(0) int dateType,
    @Default('') String usedKwh,
    @Default('') String createDate,
  }) = _ElectricMeterUsageRecordEntity;
}
