import 'package:freezed_annotation/freezed_annotation.dart';

part 'meter_firmware.freezed.dart';

@freezed
abstract class MeterFirmwareEntity with _$MeterFirmwareEntity {
  const MeterFirmwareEntity._();
  const factory MeterFirmwareEntity({
    @Default(false) bool needUpgrade,
    @Default('') String modelNum,
    @Default('') String hardwareRevision,
    @Default('') String firmwareRevision,
    @Default('') String version,
  }) = _MeterFirmwareEntity;
}
