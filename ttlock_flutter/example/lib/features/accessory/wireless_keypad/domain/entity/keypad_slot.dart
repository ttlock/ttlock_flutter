import 'package:freezed_annotation/freezed_annotation.dart';

part 'keypad_slot.freezed.dart';

/// 多功能键盘的一个槽位（云端 `/v3/wirelessKeypad/listSlot`）。
///
/// 云端按 `slotNumber` 升序返回**全部槽位**（含未绑定的），
/// 未绑定槽位以**空字符串** `lockAlias` 表示——不需要靠 MAC 格式猜测空槽。
@freezed
abstract class KeypadSlot with _$KeypadSlot {
  const KeypadSlot._();
  const factory KeypadSlot({
    required int slotNumber,
    @Default('') String lockAlias,
  }) = _KeypadSlot;

  /// 该槽位已绑定某把锁。
  bool get isBound => lockAlias.isNotEmpty;
}
