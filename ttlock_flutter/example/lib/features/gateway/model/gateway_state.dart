import 'package:freezed_annotation/freezed_annotation.dart';

part 'gateway_state.freezed.dart';

@freezed
abstract class GatewayState with _$GatewayState {
  const factory GatewayState({
    String? mac,
    @Default(false) bool isConnected,
    @Default(false) bool isLoading,
    String? wifiSsid,
    String? errorMessage,
    @Default('') String lastResult,
  }) = _GatewayState;
}
