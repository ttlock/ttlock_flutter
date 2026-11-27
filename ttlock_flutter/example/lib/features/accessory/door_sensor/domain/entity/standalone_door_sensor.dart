import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/features/accessory/door_sensor/domain/entity/door_sensor.dart';

part 'standalone_door_sensor.freezed.dart';

@freezed
abstract class StandaloneDoorSensorEntity with _$StandaloneDoorSensorEntity {
  const StandaloneDoorSensorEntity._();
  const factory StandaloneDoorSensorEntity({
    @Default('') String mac,
    @Default('') String featureValue,
    @Default(0) int statusDelayFlag,
    @Default(0) int electricQuantity,
    @Default(DoorSensorState.unknown) DoorSensorState doorSensorState,
    @Default('') String wifiName,
    @Default('') String doorSensorNumber,
    @Default(0) int doorSensorId,
    @Default('') String name,
    DateTime? recordUpdateDate,
    @Default('') String wifiMac,
    @Default(StandaloneUserType.admin) StandaloneUserType userType,
    @Default('') String firmwareRevision,
  }) = _StandaloneDoorSensorEntity;
}

@freezed
abstract class StandaloneDoorSensorRecordEntity
    with _$StandaloneDoorSensorRecordEntity {
  const StandaloneDoorSensorRecordEntity._();
  const factory StandaloneDoorSensorRecordEntity({
    DateTime? date,
    @Default(0) int recordType,
  }) = _StandaloneDoorSensorRecordEntity;
}

@freezed
abstract class StandaloneDoorSensorAlertFlagEntity
    with _$StandaloneDoorSensorAlertFlagEntity {
  const StandaloneDoorSensorAlertFlagEntity._();
  const factory StandaloneDoorSensorAlertFlagEntity({
    @Default(0) int notCloseAlertFlag,
    @Default(0) int notCloseAlertSecondNum,
    @Default(0) int longTimeNotOpenAlertFlag,
    @Default(0) int longTimeNotOpenDayNum,
  }) = _StandaloneDoorSensorAlertFlagEntity;
}

@freezed
abstract class StandaloneDoorSensorUserEntity
    with _$StandaloneDoorSensorUserEntity {
  const StandaloneDoorSensorUserEntity._();
  const factory StandaloneDoorSensorUserEntity({
    @Default(0) int id,
    @Default('') String username,
  }) = _StandaloneDoorSensorUserEntity;
}
