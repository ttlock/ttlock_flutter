import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/wifi_network.dart';

part 'wifi_lock_config_state.freezed.dart';

@freezed
abstract class WifiLockConfigState with _$WifiLockConfigState {
  const WifiLockConfigState._();

  const factory WifiLockConfigState({
    @Default(<WifiNetwork>[]) List<WifiNetwork> networks,
    @Default(false) bool isScanning,
    @Default(false) bool submitting,
    String? selectedSsid,

    /// 是否支持 configIP（`TTLockFunction.wifiLockStaticIP`）；决定高级设置中静态 IP / DNS UI。
    @Default(false) bool supportsStaticIp,

    /// 云端记载的当前已配 SSID（`WifiLockEntity.networkName`）；空串表示从未配过。
    @Default('') String configuredSsid,

    /// 云端记载的 WiFi MAC（只读摘要行用）。
    @Default('') String configuredWifiMac,

    /// 云端记载的在线状态（只读摘要行用）。
    @Default(false) bool configuredOnline,

    /// 云端记载的省电模式：0=未知、1=开启、2=关闭
    /// （与 `setWifiPowerSaving(on: ...)` 的写入约定一致）。
    @Default(0) int configuredPowerSavingMode,

    /// 云端记载的静态 IP 配置（空串 = 未配置）。表单据此回显，
    /// 避免每次保存都把静态锁误写成 DHCP（`useStaticIp=false`）。
    @Default('') String configuredIp,
    @Default('') String configuredSubnetMask,
    @Default('') String configuredDefaultGateway,

    /// 云端记载的首选 / 备用 DNS（空串 = 未配置）。
    @Default('') String configuredPreferredDns,
    @Default('') String configuredAlternateDns,

    /// 云端信息载入失败（区别于提交/扫描失败，页面单独以常驻横幅展示）。
    AppException? loadError,
    AppException? error,
  }) = _WifiLockConfigState;

  /// 该锁是否已配过网（决定底部按钮文案与返回去向）。
  bool get hasExistingWifi => configuredSsid.isNotEmpty;

  /// 仅当所选网络与已配置网络不同名时才需要输入密码。
  bool get needsPassword =>
      selectedSsid != null && selectedSsid != configuredSsid;
}
