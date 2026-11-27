// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttlock_flutter_demo/core/data/json_converters.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/wireless_keypad.dart';

part 'wireless_keypad_dto.freezed.dart';
part 'wireless_keypad_dto.g.dart';

@freezed
abstract class WirelessKeypadDto with _$WirelessKeypadDto {
  const WirelessKeypadDto._();
  const factory WirelessKeypadDto({
    @JsonKey(name: 'wirelessKeypadId', fromJson: intFromDynamic)
    @Default(0)
    int wirelessKeypadId,
    @JsonKey(name: 'wirelessKeypadNumber')
    @Default('')
    String wirelessKeypadNumber,
    @JsonKey(name: 'wirelessKeypadName') @Default('') String wirelessKeypadName,
    @JsonKey(name: 'wirelessKeypadMac') @Default('') String wirelessKeypadMac,
    @JsonKey(name: 'electricQuantity', fromJson: intFromDynamic)
    @Default(0)
    int electricQuantity,

    /// 键盘类型：1-多功能，2-普通（云端原始值）。
    ///
    /// **不写 `@Default(2)`**：`intFromDynamic(null)` 返回 `0`，`@Default` 只在
    /// 「键缺失且无 `fromJson`」时生效，写 2 会给出「键缺失 → 2」的错误暗示。
    /// 「默认普通」的语义改由 `toEntity()` 的 `hasSlot == 1` 表达 ——
    /// 缺失(0) 与显式 2 都归为普通键盘。
    @JsonKey(name: 'hasSlot', fromJson: intFromDynamic) @Default(0) int hasSlot,
    @JsonKey(name: 'slotNumber', fromJson: intFromDynamic)
    @Default(0)
    int slotNumber,
    @JsonKey(name: 'slotLimit', fromJson: intFromDynamic)
    @Default(0)
    int slotLimit,
    @JsonKey(name: 'featureValue') @Default('') String featureValue,
  }) = _WirelessKeypadDto;

  factory WirelessKeypadDto.fromJson(Map<String, dynamic> json) =>
      _$WirelessKeypadDtoFromJson(json);

  WirelessKeypadEntity toEntity() => WirelessKeypadEntity(
    wirelessKeypadId: wirelessKeypadId,
    wirelessKeypadNumber: wirelessKeypadNumber,
    wirelessKeypadName: wirelessKeypadName,
    wirelessKeypadMac: wirelessKeypadMac,
    electricQuantity: electricQuantity,
    isMultifunctionalKeypad: hasSlot == 1,
    slotNumber: slotNumber,
    slotLimit: slotLimit,
    featureValue: featureValue,
  );
}

@freezed
abstract class WirelessKeypadUpgradeCheckDto
    with _$WirelessKeypadUpgradeCheckDto {
  const WirelessKeypadUpgradeCheckDto._();
  const factory WirelessKeypadUpgradeCheckDto({
    @JsonKey(name: 'needUpgrade', fromJson: intFromDynamic)
    @Default(0)
    int needUpgrade,
    @JsonKey(name: 'firmwareInfo') Object? firmwareInfo,
    @JsonKey(name: 'firmwarePackage') @Default('') String firmwarePackage,
    @JsonKey(name: 'version') @Default('') String version,
  }) = _WirelessKeypadUpgradeCheckDto;

  factory WirelessKeypadUpgradeCheckDto.fromJson(Map<String, dynamic> json) =>
      _$WirelessKeypadUpgradeCheckDtoFromJson(json);

  bool get needsUpgrade => needUpgrade == 1;
}

@freezed
abstract class KeypadSlotDto with _$KeypadSlotDto {
  const KeypadSlotDto._();
  const factory KeypadSlotDto({
    @JsonKey(name: 'slotNumber', fromJson: intFromDynamic)
    @Default(0)
    int slotNumber,
    @JsonKey(name: 'lockAlias') @Default('') String lockAlias,
  }) = _KeypadSlotDto;

  factory KeypadSlotDto.fromJson(Map<String, dynamic> json) =>
      _$KeypadSlotDtoFromJson(json);

  /// 空 `lockAlias` 原样保留 —— `KeypadSlot.isBound` 依赖它判空槽。
  KeypadSlot toEntity() =>
      KeypadSlot(slotNumber: slotNumber, lockAlias: lockAlias);
}
