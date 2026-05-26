import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_device.freezed.dart';
part 'saved_device.g.dart';

@freezed
abstract class SavedDevice with _$SavedDevice {
  const factory SavedDevice({
    required String name,
    required String mac,
    required String lockData,
    required DateTime initializedAt,
  }) = _SavedDevice;

  factory SavedDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedDeviceFromJson(json);
}
