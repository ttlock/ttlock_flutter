// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';

part 'electric_meter_dto.freezed.dart';
part 'electric_meter_dto.g.dart';

@freezed
abstract class ElectricMeterDto with _$ElectricMeterDto {
  const ElectricMeterDto._();
  const factory ElectricMeterDto({
    @JsonKey(name: 'electricMeterId', fromJson: intFromDynamic)
    @Default(0)
    int electricMeterId,
    @JsonKey(name: 'online', fromJson: boolFromDynamic)
    @Default(false)
    bool online,
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,
    @JsonKey(name: 'onOff', fromJson: intFromDynamic) @Default(2) int onOff,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'number') @Default('') String number,
    @JsonKey(name: 'payMode', fromJson: intFromDynamic) @Default(0) int payMode,
    @JsonKey(name: 'totalKwh', fromJson: stringFromDynamic)
    @Default('')
    String totalKwh,
    @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic)
    @Default('')
    String remainderKwh,
    @JsonKey(name: 'price', fromJson: stringFromDynamic)
    @Default('')
    String price,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,
    @JsonKey(name: 'maxPower', fromJson: stringFromDynamic)
    @Default('')
    String maxPower,
    @JsonKey(name: 'mac') @Default('') String mac,
    @JsonKey(name: 'featureValue') @Default('') String featureValue,
    @JsonKey(name: 'modelNum') @Default('') String modelNum,
    @JsonKey(name: 'hardwareRevision') @Default('') String hardwareRevision,
    @JsonKey(name: 'firmwareRevision') @Default('') String firmwareRevision,
    @JsonKey(
      name: 'syncKwhDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? syncKwhDate,
    @JsonKey(name: 'groupName') @Default('') String groupName,
    @JsonKey(name: 'groupId', fromJson: intFromDynamic) @Default(0) int groupId,
  }) = _ElectricMeterDto;

  factory ElectricMeterDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterDtoFromJson(json);

  ElectricMeterEntity toEntity() => ElectricMeterEntity(
    electricMeterId: electricMeterId,
    online: online,
    rssi: rssi,
    onOff: MeterOnOff.fromValue(onOff),
    name: name,
    number: number,
    payMode: MeterPayMode.fromValue(payMode),
    totalKwh: totalKwh,
    remainderKwh: remainderKwh,
    price: price,
    electricQuantity: electricQuantity,
    maxPower: maxPower,
    featureValue: featureValue,
    mac: mac,
    modelNum: modelNum,
    hardwareRevision: hardwareRevision,
    firmwareRevision: firmwareRevision,
    syncKwhDate: syncKwhDate,
    groupName: groupName,
    groupId: groupId,
  );
}

@freezed
abstract class ElectricMeterUsageRecordDto with _$ElectricMeterUsageRecordDto {
  const ElectricMeterUsageRecordDto._();
  const factory ElectricMeterUsageRecordDto({
    @JsonKey(name: 'dateType', fromJson: intFromDynamic)
    @Default(0)
    int dateType,
    @JsonKey(name: 'usedKwh', fromJson: stringFromDynamic)
    @Default('')
    String usedKwh,
    @JsonKey(name: 'createDate', fromJson: stringFromDynamic)
    @Default('')
    String createDate,
  }) = _ElectricMeterUsageRecordDto;

  factory ElectricMeterUsageRecordDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterUsageRecordDtoFromJson(json);

  ElectricMeterUsageRecordEntity toEntity() => ElectricMeterUsageRecordEntity(
    dateType: dateType,
    usedKwh: usedKwh,
    createDate: createDate,
  );
}

@freezed
abstract class ElectricMeterOperationRecordDto
    with _$ElectricMeterOperationRecordDto {
  const ElectricMeterOperationRecordDto._();
  const factory ElectricMeterOperationRecordDto({
    @JsonKey(name: 'id', fromJson: intFromDynamic) @Default(0) int id,
    @JsonKey(name: 'recordType', fromJson: stringFromDynamic)
    @Default('')
    String recordType,
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'content') @Default('') String content,
    @JsonKey(name: 'date', fromJson: stringFromDynamic)
    @Default('')
    String date,
    @JsonKey(name: 'headUrl') @Default('') String headUrl,
  }) = _ElectricMeterOperationRecordDto;

  factory ElectricMeterOperationRecordDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterOperationRecordDtoFromJson(json);

  MeterOperationRecordEntity toEntity() => MeterOperationRecordEntity(
    id: id,
    recordType: recordType,
    title: title,
    content: content,
    date: date,
    headUrl: headUrl,
  );
}

@freezed
abstract class ElectricMeterGroupDto with _$ElectricMeterGroupDto {
  const factory ElectricMeterGroupDto({
    @JsonKey(name: 'groupId', fromJson: intFromDynamic) @Default(0) int groupId,
    @JsonKey(name: 'groupName') @Default('') String groupName,
    @JsonKey(name: 'electricMeterCount', fromJson: intFromDynamic)
    @Default(0)
    int electricMeterCount,
  }) = _ElectricMeterGroupDto;

  factory ElectricMeterGroupDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterGroupDtoFromJson(json);
}

@freezed
abstract class ElectricMeterTaskDto with _$ElectricMeterTaskDto {
  const factory ElectricMeterTaskDto({
    @JsonKey(name: 'id', fromJson: intFromDynamic) @Default(0) int id,
    @JsonKey(name: 'taskType', fromJson: intFromDynamic)
    @Default(0)
    int taskType,
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,
    @JsonKey(name: 'rechargeAmount', fromJson: stringFromDynamic)
    @Default('')
    String rechargeAmount,
    @JsonKey(name: 'remainderKwh', fromJson: stringFromDynamic)
    @Default('')
    String remainderKwh,
    @JsonKey(name: 'rechargeKwh', fromJson: stringFromDynamic)
    @Default('')
    String rechargeKwh,
    @JsonKey(name: 'usedFlag', fromJson: intFromDynamic)
    @Default(0)
    int usedFlag,
    @JsonKey(name: 'price', fromJson: stringFromDynamic)
    @Default('')
    String price,
    @JsonKey(name: 'executeToken') @Default('') String executeToken,
  }) = _ElectricMeterTaskDto;

  factory ElectricMeterTaskDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterTaskDtoFromJson(json);
}

@freezed
abstract class ElectricMeterGatewayDto with _$ElectricMeterGatewayDto {
  const factory ElectricMeterGatewayDto({
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,
    @JsonKey(name: 'gatewayName') @Default('') String gatewayName,
    @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)
    @Default(0)
    int gatewayVersion,
  }) = _ElectricMeterGatewayDto;

  factory ElectricMeterGatewayDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterGatewayDtoFromJson(json);
}

@freezed
abstract class ElectricMeterUpgradeCheckDto
    with _$ElectricMeterUpgradeCheckDto {
  const ElectricMeterUpgradeCheckDto._();
  const factory ElectricMeterUpgradeCheckDto({
    @JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)
    @Default(0)
    int needUpgrade,
    @JsonKey(name: 'firmwareInfo') Map<String, dynamic>? firmwareInfo,
    @JsonKey(name: 'firmwarePackage') @Default('') String firmwarePackage,
    @JsonKey(name: 'version') @Default('') String version,
  }) = _ElectricMeterUpgradeCheckDto;

  factory ElectricMeterUpgradeCheckDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterUpgradeCheckDtoFromJson(json);

  MeterFirmwareEntity toEntity() {
    final info = firmwareInfo ?? const <String, dynamic>{};
    String s(String key) => stringFromDynamic(info[key]);
    return MeterFirmwareEntity(
      needUpgrade: needUpgrade == 1,
      modelNum: s('modelNum'),
      hardwareRevision: s('hardwareRevision'),
      firmwareRevision: s('firmwareRevision'),
      version: version,
    );
  }
}

@freezed
abstract class ElectricMeterCatOneDetailDto
    with _$ElectricMeterCatOneDetailDto {
  const ElectricMeterCatOneDetailDto._();
  const factory ElectricMeterCatOneDetailDto({
    @JsonKey(name: 'rssiGrade', fromJson: intFromDynamic)
    @Default(0)
    int rssiGrade,
    @JsonKey(name: 'catOneNodeId') @Default('') String catOneNodeId,
    @JsonKey(name: 'catOneCardNumber') @Default('') String catOneCardNumber,
    @JsonKey(name: 'catOneOperator') @Default('') String catOneOperator,
    @JsonKey(name: 'catOneImsi') @Default('') String catOneImsi,
    @JsonKey(name: 'catOneApn') @Default('') String catOneApn,
    @JsonKey(name: 'overseaCard', fromJson: intFromDynamic)
    @Default(0)
    int overseaCard,
  }) = _ElectricMeterCatOneDetailDto;

  factory ElectricMeterCatOneDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterCatOneDetailDtoFromJson(json);

  MeterCatOneInfoEntity toEntity() => MeterCatOneInfoEntity(
    rssiGrade: rssiGrade,
    catOneNodeId: catOneNodeId,
    catOneCardNumber: catOneCardNumber,
    catOneOperator: catOneOperator,
    catOneImsi: catOneImsi,
    catOneApn: catOneApn,
    overseaCard: overseaCard != 0,
  );
}

@freezed
abstract class ElectricMeterExecuteTokenDto
    with _$ElectricMeterExecuteTokenDto {
  const factory ElectricMeterExecuteTokenDto({
    @JsonKey(name: 'executeToken', fromJson: stringFromDynamic)
    @Default('')
    String executeToken,
  }) = _ElectricMeterExecuteTokenDto;

  factory ElectricMeterExecuteTokenDto.fromJson(Map<String, dynamic> json) =>
      _$ElectricMeterExecuteTokenDtoFromJson(json);
}
