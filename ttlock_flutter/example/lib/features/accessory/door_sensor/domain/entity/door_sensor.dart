import 'package:freezed_annotation/freezed_annotation.dart';

part 'door_sensor.freezed.dart';

enum DoorSensorState {
  closed(0, '闭合'),
  open(1, '打开'),
  unknown(2, '未知');

  const DoorSensorState(this.value, this.label);

  final int value;
  final String label;

  static DoorSensorState fromValue(int? v) => values.firstWhere(
    (e) => e.value == v,
    orElse: () => DoorSensorState.unknown,
  );
}

enum StandaloneUserType {
  admin('ADMIN', '管理员'),
  user('USER', '被分享用户');

  const StandaloneUserType(this.value, this.label);

  final String value;
  final String label;

  static StandaloneUserType fromValue(String? v) => values.firstWhere(
    (e) => e.value == v,
    orElse: () => StandaloneUserType.admin,
  );
}

@freezed
abstract class DoorSensorEntity with _$DoorSensorEntity {
  const DoorSensorEntity._();
  const factory DoorSensorEntity({
    @Default(0) int doorSensorId,
    @Default('') String name,
    @Default(0) int electricQuantity,
    @Default('') String version,
    @Default('') String mac,
    @Default('') String number,
    @Default(0) int doorNotClosedWarningTime,
  }) = _DoorSensorEntity;
}

@freezed
abstract class DoorSensorRecordEntity with _$DoorSensorRecordEntity {
  const DoorSensorRecordEntity._();
  const factory DoorSensorRecordEntity({
    @Default(0) int recordId,
    @Default(0) int recordTypeFromLock,
    @Default(0) int recordType,
    @Default(false) bool success,
    DateTime? lockDate,
    DateTime? serverDate,
  }) = _DoorSensorRecordEntity;
}
