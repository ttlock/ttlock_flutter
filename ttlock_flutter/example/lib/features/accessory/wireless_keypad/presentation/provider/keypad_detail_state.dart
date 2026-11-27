import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/app_exception.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';

part 'keypad_detail_state.freezed.dart';

@freezed
abstract class KeypadDetailState with _$KeypadDetailState {
  const KeypadDetailState._();
  const factory KeypadDetailState({
    required WirelessKeypadEntity keypad,

    @Default(false) bool slotsLoading,
    @Default(<KeypadSlot>[]) List<KeypadSlot> slots,
    AppException? slotsError,

    /// 最近一次**页面级操作**的失败原因（解绑 / 重试同步 / 重命名 / 检查固件）。
    ///
    /// 统一一个字段而非每种操作一个：页面只需在 `ref.listen` 里弹一次 snackbar。
    /// snackbar 就报这次操作本身——**不按 [pendingCloudSync] 分流**：它是粘性的
    /// （云端推送失败后一直为 true），而本字段每次操作都会被覆盖，按前者分流会
    /// 让解绑失败之后的任何一次失败都被误报成「云端未同步」，真实原因被吞掉。
    /// 云端未同步由常驻横幅负责，见 [pendingCloudSync]。
    AppException? actionError,

    @Default(false) bool unbinding,

    /// **BLE 已完成、云端未同步**：键盘槽位已清空，重试只重发云端。
    @Default(false) bool pendingCloudSync,

    @Default(false) bool renaming,
    @Default(false) bool checkingUpgrade,
  }) = _KeypadDetailState;
}
