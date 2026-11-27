// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/standalone_door_sensor.dart';

part 'standalone_door_sensor_dto.freezed.dart';
part 'standalone_door_sensor_dto.g.dart';

@freezed
abstract class StandaloneDoorSensorDto with _$StandaloneDoorSensorDto {
  const StandaloneDoorSensorDto._();
  const factory StandaloneDoorSensorDto({
    @JsonKey(name: 'mac') @Default('') String mac,
    @JsonKey(name: 'featureValue') @Default('') String featureValue,
    @JsonKey(name: 'statusDelayFlag', fromJson: intFromDynamic)
    @Default(0)
    int statusDelayFlag,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,
    @JsonKey(name: 'doorSensorState', fromJson: intFromDynamic)
    @Default(2)
    int doorSensorStateValue,
    @JsonKey(name: 'wifiName') @Default('') String wifiName,
    @JsonKey(name: 'doorSensorNumber') @Default('') String doorSensorNumber,
    @JsonKey(name: 'doorSensorId', fromJson: intFromDynamic)
    @Default(0)
    int doorSensorId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(
      name: 'recordUpdateDate',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? recordUpdateDate,
    @JsonKey(name: 'wifiMac') @Default('') String wifiMac,
    @JsonKey(name: 'userType') @Default('ADMIN') String userTypeValue,
    @JsonKey(name: 'firmwareRevision') @Default('') String firmwareRevision,
  }) = _StandaloneDoorSensorDto;

  factory StandaloneDoorSensorDto.fromJson(Map<String, dynamic> json) =>
      _$StandaloneDoorSensorDtoFromJson(json);

  StandaloneDoorSensorEntity toEntity() => StandaloneDoorSensorEntity(
    mac: mac,
    featureValue: featureValue,
    statusDelayFlag: statusDelayFlag,
    electricQuantity: electricQuantity,
    doorSensorState: DoorSensorState.fromValue(doorSensorStateValue),
    wifiName: wifiName,
    doorSensorNumber: doorSensorNumber,
    doorSensorId: doorSensorId,
    name: name,
    recordUpdateDate: recordUpdateDate,
    wifiMac: wifiMac,
    userType: StandaloneUserType.fromValue(userTypeValue),
    firmwareRevision: firmwareRevision,
  );
}

@freezed
abstract class StandaloneDoorSensorRecordDto
    with _$StandaloneDoorSensorRecordDto {
  const StandaloneDoorSensorRecordDto._();
  const factory StandaloneDoorSensorRecordDto({
    @JsonKey(
      name: 'date',
      fromJson: nullableDateTimeMsFromJson,
      toJson: nullableDateTimeMsToJson,
    )
    DateTime? date,
    @JsonKey(name: 'recordType', fromJson: intFromDynamic)
    @Default(0)
    int recordType,
  }) = _StandaloneDoorSensorRecordDto;

  factory StandaloneDoorSensorRecordDto.fromJson(Map<String, dynamic> json) =>
      _$StandaloneDoorSensorRecordDtoFromJson(json);

  StandaloneDoorSensorRecordEntity toEntity() =>
      StandaloneDoorSensorRecordEntity(date: date, recordType: recordType);
}

@freezed
abstract class StandaloneDoorSensorAlertFlagDto
    with _$StandaloneDoorSensorAlertFlagDto {
  const StandaloneDoorSensorAlertFlagDto._();
  const factory StandaloneDoorSensorAlertFlagDto({
    @JsonKey(name: 'notCloseAlertFlag', fromJson: intFromDynamic)
    @Default(0)
    int notCloseAlertFlag,
    @JsonKey(name: 'notCloseAlertSecondNum', fromJson: intFromDynamic)
    @Default(0)
    int notCloseAlertSecondNum,
    @JsonKey(name: 'longTimeNotOpenAlertFlag', fromJson: intFromDynamic)
    @Default(0)
    int longTimeNotOpenAlertFlag,
    @JsonKey(name: 'longTimeNotOpenDayNum', fromJson: intFromDynamic)
    @Default(0)
    int longTimeNotOpenDayNum,
  }) = _StandaloneDoorSensorAlertFlagDto;

  factory StandaloneDoorSensorAlertFlagDto.fromJson(
    Map<String, dynamic> json,
  ) => _$StandaloneDoorSensorAlertFlagDtoFromJson(json);

  StandaloneDoorSensorAlertFlagEntity toEntity() =>
      StandaloneDoorSensorAlertFlagEntity(
        notCloseAlertFlag: notCloseAlertFlag,
        notCloseAlertSecondNum: notCloseAlertSecondNum,
        longTimeNotOpenAlertFlag: longTimeNotOpenAlertFlag,
        longTimeNotOpenDayNum: longTimeNotOpenDayNum,
      );
}

@freezed
abstract class StandaloneDoorSensorUserDto with _$StandaloneDoorSensorUserDto {
  const StandaloneDoorSensorUserDto._();
  const factory StandaloneDoorSensorUserDto({
    @JsonKey(name: 'id', fromJson: intFromDynamic) @Default(0) int id,
    @JsonKey(name: 'username') @Default('') String username,
  }) = _StandaloneDoorSensorUserDto;

  factory StandaloneDoorSensorUserDto.fromJson(Map<String, dynamic> json) =>
      _$StandaloneDoorSensorUserDtoFromJson(json);

  StandaloneDoorSensorUserEntity toEntity() =>
      StandaloneDoorSensorUserEntity(id: id, username: username);
}
