import 'package:freezed_annotation/freezed_annotation.dart';

part 'wireless_keypad.freezed.dart';

@freezed
abstract class WirelessKeypadEntity with _$WirelessKeypadEntity {
  const WirelessKeypadEntity._();
  const factory WirelessKeypadEntity({
    @Default(0) int wirelessKeypadId,
    @Default('') String wirelessKeypadNumber,
    @Default('') String wirelessKeypadName,
    @Default('') String wirelessKeypadMac,
    @Default(0) int electricQuantity,

    /// 多功能键盘（云端 `hasSlot == 1`）。
    @Default(false) bool isMultifunctionalKeypad,

    /// **本锁占用的槽位**（云端 `listByLock` 的 `slotNumber`）；普通键盘为 0。
    @Default(0) int slotNumber,

    /// 多功能键盘可绑定锁的数量上限（云端 `slotLimit`）。
    @Default(0) int slotLimit,

    /// 键盘特征值（云端 `featureValue`）。
    @Default('') String featureValue,
  }) = _WirelessKeypadEntity;

  /// **本锁是否占用着一个合法槽位**（多功能键盘且云端给了有效 slotNumber）。
  ///
  /// 命名刻意避开 `hasSlot`——DTO 的 `hasSlot` 是云端原始 int（键盘类型 1/2），
  /// 二者语义不同，同名会误读。
  bool get hasAssignedSlot => isMultifunctionalKeypad && slotNumber >= 1;
}
