import 'package:freezed_annotation/freezed_annotation.dart';

part 'wireless_keypad_upgrade.freezed.dart';

/// 键盘固件升级检查结果。
///
/// **只保留 UI 需要的两项**：`firmwarePackage`（base64 固件包）与 `firmwareInfo`
/// 只在刷机时有用，而 SDK 无键盘固件升级能力（见 spec §4.6），故不进 Entity。
@freezed
abstract class WirelessKeypadUpgradeCheck with _$WirelessKeypadUpgradeCheck {
  const factory WirelessKeypadUpgradeCheck({
    @Default(false) bool needUpgrade,

    /// 最新固件版本号；`needUpgrade` 为 false 时通常为空串。
    @Default('') String version,
  }) = _WirelessKeypadUpgradeCheck;
}
