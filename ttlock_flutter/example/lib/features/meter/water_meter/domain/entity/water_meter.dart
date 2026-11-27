import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';

part 'water_meter.freezed.dart';

@freezed
abstract class WaterMeterEntity with _$WaterMeterEntity {
  const WaterMeterEntity._();
  const factory WaterMeterEntity({
    @Default(0) int waterMeterId,
    @Default(false) bool online,
    @Default(0) int rssi,
    @Default(MeterOnOff.unknown) MeterOnOff onOff,
    @Default('') String name,
    @Default('') String number,
    @Default(MeterPayMode.energy) MeterPayMode payMode,
    @Default('') String totalM3,
    @Default('') String remainderM3,
    @Default('') String price,
    @Default(0) int electricQuantity,
    @Default('') String mac,
    @Default('') String featureValue,
    @Default('') String maxPower,
    @Default('') String modelNum,
    @Default('') String hardwareRevision,
    @Default('') String firmwareRevision,
    @Default('') String syncM3Date,
    @Default('') String groupName,
    @Default(0) int groupId,
  }) = _WaterMeterEntity;
}

@freezed
abstract class WaterMeterRecordEntity with _$WaterMeterRecordEntity {
  const WaterMeterRecordEntity._();
  const factory WaterMeterRecordEntity({
    @Default(0) int dateType,
    @Default('') String usedM3,
    @Default('') String createDate,
  }) = _WaterMeterRecordEntity;
}
