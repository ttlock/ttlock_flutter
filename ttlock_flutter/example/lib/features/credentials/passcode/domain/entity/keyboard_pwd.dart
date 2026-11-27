import 'package:freezed_annotation/freezed_annotation.dart';

part 'keyboard_pwd.freezed.dart';

enum KeyboardPwdType {
  once(1, '单次'),
  permanent(2, '永久'),
  limited(3, '限期'),
  delete(4, '删除'),
  cyclicWeekend(5, '周末循环'),
  cyclicDaily(6, '每日循环'),
  cyclicWorkday(7, '工作日循环'),
  cyclicMonday(8, '周一循环'),
  cyclicTuesday(9, '周二循环'),
  cyclicWednesday(10, '周三循环'),
  cyclicThursday(11, '周四循环'),
  cyclicFriday(12, '周五循环'),
  cyclicSaturday(13, '周六循环'),
  cyclicSunday(14, '周日循环');

  const KeyboardPwdType(this.value, this.label);

  final int value;
  final String label;

  static KeyboardPwdType fromValue(int? v) => values.firstWhere(
    (e) => e.value == v,
    orElse: () => KeyboardPwdType.limited,
  );
}

@freezed
abstract class KeyboardPwdEntity with _$KeyboardPwdEntity {
  const KeyboardPwdEntity._();
  const factory KeyboardPwdEntity({
    @Default(0) int keyboardPwdId,
    @Default(0) int lockId,
    @Default('') String keyboardPwd,
    @Default('') String keyboardPwdName,
    @Default(KeyboardPwdType.limited) KeyboardPwdType keyboardPwdType,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? sendDate,
    @Default(false) bool isCustom,
    @Default('') String senderUsername,
  }) = _KeyboardPwdEntity;
}
