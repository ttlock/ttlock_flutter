// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/core/domain/credential_enums.dart';
import 'package:ttlock_flutter_demo/features/meter/water_meter/domain/entity/water_meter.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_cat_one_info.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_firmware.dart';
import 'package:ttlock_flutter_demo/features/meter/shared/domain/entity/meter_operation_record.dart';

part 'water_meter_dto.freezed.dart';
part 'water_meter_dto.g.dart';

MeterPayMode _payModeFromJson(Object? v) =>
    MeterPayMode.fromValue(intFromDynamic(v));

MeterOnOff _onOffFromJson(Object? v) => MeterOnOff.fromValue(intFromDynamic(v));

@freezed
abstract class WaterMeterDto with _$WaterMeterDto {
  const WaterMeterDto._();
  const factory WaterMeterDto({
    @JsonKey(name: 'waterMeterId', fromJson: intFromDynamic)
    @Default(0)
    int waterMeterId,
    @JsonKey(name: 'online', fromJson: boolFromDynamic)
    @Default(false)
    bool online,
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,
    @JsonKey(name: 'onOff', fromJson: _onOffFromJson)
    @Default(MeterOnOff.unknown)
    MeterOnOff onOff,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'number') @Default('') String number,
    @JsonKey(name: 'payMode', fromJson: _payModeFromJson)
    @Default(MeterPayMode.energy)
    MeterPayMode payMode,
    @JsonKey(name: 'totalM3', fromJson: stringFromDynamic)
    @Default('')
    String totalM3,
    @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic)
    @Default('')
    String remainderM3,
    @JsonKey(name: 'price', fromJson: stringFromDynamic)
    @Default('')
    String price,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,
    @JsonKey(name: 'mac') @Default('') String mac,
    @JsonKey(name: 'featureValue') @Default('') String featureValue,
    @JsonKey(name: 'modelNum') @Default('') String modelNum,
    @JsonKey(name: 'hardwareRevision') @Default('') String hardwareRevision,
    @JsonKey(name: 'firmwareRevision') @Default('') String firmwareRevision,
    @JsonKey(name: 'syncM3Date', fromJson: stringFromDynamic)
    @Default('')
    String syncM3Date,
    @JsonKey(name: 'maxPower', fromJson: stringFromDynamic)
    @Default('')
    String maxPower,
    @JsonKey(name: 'groupName') @Default('') String groupName,
    @JsonKey(name: 'groupId', fromJson: intFromDynamic) @Default(0) int groupId,
  }) = _WaterMeterDto;

  factory WaterMeterDto.fromJson(Map<String, dynamic> json) =>
      _$WaterMeterDtoFromJson(json);

  WaterMeterEntity toEntity() => WaterMeterEntity(
    waterMeterId: waterMeterId,
    online: online,
    rssi: rssi,
    onOff: onOff,
    name: name,
    number: number,
    payMode: payMode,
    totalM3: totalM3,
    remainderM3: remainderM3,
    price: price,
    electricQuantity: electricQuantity,
    mac: mac,
    featureValue: featureValue,
    maxPower: maxPower,
    modelNum: modelNum,
    hardwareRevision: hardwareRevision,
    firmwareRevision: firmwareRevision,
    syncM3Date: syncM3Date,
    groupName: groupName,
    groupId: groupId,
  );
}

@freezed
abstract class WaterMeterRecordDto with _$WaterMeterRecordDto {
  const WaterMeterRecordDto._();
  const factory WaterMeterRecordDto({
    @JsonKey(name: 'dateType', fromJson: intFromDynamic)
    @Default(0)
    int dateType,
    @JsonKey(name: 'usedM3', fromJson: stringFromDynamic)
    @Default('')
    String usedM3,
    @JsonKey(name: 'createDate', fromJson: stringFromDynamic)
    @Default('')
    String createDate,
  }) = _WaterMeterRecordDto;

  factory WaterMeterRecordDto.fromJson(Map<String, dynamic> json) =>
      _$WaterMeterRecordDtoFromJson(json);

  WaterMeterRecordEntity toEntity() => WaterMeterRecordEntity(
    dateType: dateType,
    usedM3: usedM3,
    createDate: createDate,
  );
}

@freezed
abstract class WaterMeterGroupDto with _$WaterMeterGroupDto {
  const WaterMeterGroupDto._();
  const factory WaterMeterGroupDto({
    @JsonKey(name: 'groupId', fromJson: intFromDynamic) @Default(0) int groupId,
    @JsonKey(name: 'groupName') @Default('') String groupName,
    @JsonKey(name: 'waterMeterCount', fromJson: intFromDynamic)
    @Default(0)
    int waterMeterCount,
  }) = _WaterMeterGroupDto;

  factory WaterMeterGroupDto.fromJson(Map<String, dynamic> json) =>
      _$WaterMeterGroupDtoFromJson(json);
}

@freezed
abstract class WaterMeterOperationRecordDto
    with _$WaterMeterOperationRecordDto {
  const WaterMeterOperationRecordDto._();
  const factory WaterMeterOperationRecordDto({
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
  }) = _WaterMeterOperationRecordDto;

  factory WaterMeterOperationRecordDto.fromJson(Map<String, dynamic> json) =>
      _$WaterMeterOperationRecordDtoFromJson(json);

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
abstract class WaterMeterTaskDto with _$WaterMeterTaskDto {
  const WaterMeterTaskDto._();
  const factory WaterMeterTaskDto({
    @JsonKey(name: 'id', fromJson: intFromDynamic) @Default(0) int id,
    @JsonKey(name: 'taskType', fromJson: intFromDynamic)
    @Default(0)
    int taskType,
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,

    @Default(0) double rechargeAmount,
    @JsonKey(name: 'remainderM3', fromJson: stringFromDynamic)
    @Default('')
    String remainderM3,
    @Default(0) double rechargeM3,
    @JsonKey(name: 'usedFlag', fromJson: intFromDynamic)
    @Default(0)
    int usedFlag,
    @JsonKey(name: 'price', fromJson: stringFromDynamic)
    @Default('')
    String price,
    @JsonKey(name: 'executeToken') @Default('') String executeToken,
  }) = _WaterMeterTaskDto;

  factory WaterMeterTaskDto.fromJson(Map<String, dynamic> json) =>
      _$WaterMeterTaskDtoFromJson(json);
}

@freezed
abstract class WaterMeterGatewayDto with _$WaterMeterGatewayDto {
  const WaterMeterGatewayDto._();
  const factory WaterMeterGatewayDto({
    @JsonKey(name: 'rssi', fromJson: intFromDynamic) @Default(0) int rssi,
    @JsonKey(name: 'gatewayName') @Default('') String gatewayName,
    @JsonKey(name: 'gatewayVersion', fromJson: intFromDynamic)
    @Default(0)
    int gatewayVersion,
  }) = _WaterMeterGatewayDto;

  factory WaterMeterGatewayDto.fromJson(Map<String, dynamic> json) =>
      _$WaterMeterGatewayDtoFromJson(json);
}

@freezed
abstract class WaterMeterCatOneDetailDto with _$WaterMeterCatOneDetailDto {
  const WaterMeterCatOneDetailDto._();
  const factory WaterMeterCatOneDetailDto({
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
  }) = _WaterMeterCatOneDetailDto;

  factory WaterMeterCatOneDetailDto.fromJson(Map<String, dynamic> json) =>
      _$WaterMeterCatOneDetailDtoFromJson(json);

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
abstract class WaterMeterUpgradeCheckDto with _$WaterMeterUpgradeCheckDto {
  const WaterMeterUpgradeCheckDto._();
  const factory WaterMeterUpgradeCheckDto({
    @JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)
    @Default(0)
    int needUpgrade,
    @JsonKey(name: 'firmwareInfo') Map<String, dynamic>? firmwareInfo,
    @JsonKey(name: 'firmwarePackage') @Default('') String firmwarePackage,
    @JsonKey(name: 'version') @Default('') String version,
  }) = _WaterMeterUpgradeCheckDto;

  factory WaterMeterUpgradeCheckDto.fromJson(Map<String, dynamic> json) =>
      _$WaterMeterUpgradeCheckDtoFromJson(json);

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
