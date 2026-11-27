// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';

part 'door_sensor_dto.freezed.dart';
part 'door_sensor_dto.g.dart';

DoorSensorDto parseDoorSensorDto(Map<String, dynamic> json) {
  final normalized = Map<String, dynamic>.from(json);
  if (!normalized.containsKey('doorNotClosedWarningTime') &&
      normalized.containsKey('doorNotClosedWarngingTime')) {
    normalized['doorNotClosedWarningTime'] =
        normalized['doorNotClosedWarngingTime'];
  }
  return DoorSensorDto.fromJson(normalized);
}

@freezed
abstract class DoorSensorDto with _$DoorSensorDto {
  const DoorSensorDto._();
  const factory DoorSensorDto({
    @JsonKey(name: 'doorSensorId', fromJson: intFromDynamic)
    @Default(0)
    int doorSensorId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,
    @JsonKey(name: 'version') @Default('') String version,
    @JsonKey(name: 'mac') @Default('') String mac,
    @JsonKey(name: 'number') @Default('') String number,
    @JsonKey(name: 'doorNotClosedWarningTime', fromJson: intFromDynamic)
    @Default(0)
    int doorNotClosedWarningTime,
  }) = _DoorSensorDto;

  factory DoorSensorDto.fromJson(Map<String, dynamic> json) =>
      _$DoorSensorDtoFromJson(json);

  DoorSensorEntity toEntity() => DoorSensorEntity(
    doorSensorId: doorSensorId,
    name: name,
    electricQuantity: electricQuantity,
    version: version,
    mac: mac,
    number: number,
    doorNotClosedWarningTime: doorNotClosedWarningTime,
  );
}

@freezed
abstract class DoorSensorRecordDto with _$DoorSensorRecordDto {
  const DoorSensorRecordDto._();
  const factory DoorSensorRecordDto({
    @JsonKey(name: 'recordId', fromJson: intFromDynamic)
    @Default(0)
    int recordId,
    @JsonKey(name: 'recordTypeFromLock', fromJson: intFromDynamic)
    @Default(0)
    int recordTypeFromLock,
    @JsonKey(name: 'recordType', fromJson: intFromDynamic)
    @Default(0)
    int recordType,
    @JsonKey(name: 'success', fromJson: boolFromDynamic)
    @Default(false)
    bool success,
    @JsonKey(
      name: 'lockDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? lockDate,
    @JsonKey(
      name: 'serverDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? serverDate,
  }) = _DoorSensorRecordDto;

  factory DoorSensorRecordDto.fromJson(Map<String, dynamic> json) =>
      _$DoorSensorRecordDtoFromJson(json);

  DoorSensorRecordEntity toEntity() => DoorSensorRecordEntity(
    recordId: recordId,
    recordTypeFromLock: recordTypeFromLock,
    recordType: recordType,
    success: success,
    lockDate: lockDate,
    serverDate: serverDate,
  );
}

@freezed
abstract class DoorSensorUpgradeCheckDto with _$DoorSensorUpgradeCheckDto {
  const DoorSensorUpgradeCheckDto._();
  const factory DoorSensorUpgradeCheckDto({
    @JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)
    @Default(0)
    int needUpgrade,
    @JsonKey(name: 'firmwareInfo') Object? firmwareInfo,
    @JsonKey(name: 'firmwarePackage') @Default('') String firmwarePackage,
    @JsonKey(name: 'version') @Default('') String version,
  }) = _DoorSensorUpgradeCheckDto;

  factory DoorSensorUpgradeCheckDto.fromJson(Map<String, dynamic> json) =>
      _$DoorSensorUpgradeCheckDtoFromJson(json);
}
