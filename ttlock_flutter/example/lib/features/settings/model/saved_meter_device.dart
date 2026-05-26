import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_meter_device.freezed.dart';
part 'saved_meter_device.g.dart';

@freezed
abstract class SavedMeterDevice with _$SavedMeterDevice {
  const factory SavedMeterDevice({
    required String name,
    required String mac,
    required String meterId,
    required String meterType,
    required DateTime initializedAt,
  }) = _SavedMeterDevice;

  const SavedMeterDevice._();

  factory SavedMeterDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedMeterDeviceFromJson(json);

  bool get isWater => meterType == 'water';
  bool get isElectric => meterType == 'electric';
}
