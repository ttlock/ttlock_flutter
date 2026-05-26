import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_gateway_device.freezed.dart';
part 'saved_gateway_device.g.dart';

@freezed
abstract class SavedGatewayDevice with _$SavedGatewayDevice {
  const factory SavedGatewayDevice({
    required String name,
    required String mac,
    @Default('') String gatewayModel,
    required DateTime initializedAt,
  }) = _SavedGatewayDevice;

  factory SavedGatewayDevice.fromJson(Map<String, dynamic> json) =>
      _$SavedGatewayDeviceFromJson(json);
}
