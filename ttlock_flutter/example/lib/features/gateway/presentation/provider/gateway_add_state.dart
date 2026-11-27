import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';

part 'gateway_add_state.freezed.dart';

/// 网关附近 WiFi 条目（name + rssi，本地轻量记录）。
typedef GatewayWifi = ({String name, int? rssi});

/// 网关配网向导状态机：
/// - Wi-Fi 型（G2/G5/G6）：scan → connect → wifi → credential → init → confirm → done
/// - 蜂窝型（G3/G4）：scan → connect → credential → init → confirm → done
@freezed
sealed class GatewayAddStep with _$GatewayAddStep {
  const factory GatewayAddStep.scanning({
    @Default(<String, TTGatewayScanModel>{})
    Map<String, TTGatewayScanModel> devices,
  }) = GatewayAddStepScanning;

  const factory GatewayAddStep.connecting({required String mac}) =
      GatewayAddStepConnecting;

  const factory GatewayAddStep.wifi({required String mac}) = GatewayAddStepWifi;

  /// [wifi] 仅 Wi-Fi 型网关有值；蜂窝型（G3/G4）为 null。
  const factory GatewayAddStep.credential({
    required String mac,
    GatewayWifi? wifi,
  }) = GatewayAddStepCredential;

  const factory GatewayAddStep.initializing({
    required String mac,
    GatewayWifi? wifi,
  }) = GatewayAddStepInitializing;

  const factory GatewayAddStep.confirming({required String networkMac}) =
      GatewayAddStepConfirming;

  const factory GatewayAddStep.done({required int gatewayId}) =
      GatewayAddStepDone;

  const factory GatewayAddStep.failure({required AppException error}) =
      GatewayAddStepFailure;
}

@freezed
abstract class GatewayAddState with _$GatewayAddState {
  const factory GatewayAddState({
    @Default(GatewayAddStep.scanning()) GatewayAddStep step,

    /// 当前选中的网关类型（connect 成功后写入，供 UI 按类型显隐字段）。
    TTGatewayType? gatewayType,

    /// wifi 步骤：附近 WiFi 列表（经 gatewayGetNearbyWifi 累积）。
    @Default(<GatewayWifi>[]) List<GatewayWifi> wifiList,
    @Default(false) bool wifiScanning,
  }) = _GatewayAddState;
}
