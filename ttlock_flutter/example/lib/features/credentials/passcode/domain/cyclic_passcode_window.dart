import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

bool isCyclicKeyboardPwdType(KeyboardPwdType t) =>
    t.value >= 5 && t.value <= 14;

class CyclicPasscodeWindow {
  const CyclicPasscodeWindow({required this.start, required this.end});
  final DateTime start;
  final DateTime end;
}

/// [startMinutes]/[endMinutes] 为当天分钟数。结束必须大于开始（不跨日）。
CyclicPasscodeWindow cyclicPasscodeWindow({
  required KeyboardPwdType type,
  required int startMinutes,
  required int endMinutes,
  DateTime? now,
}) {
  if (!isCyclicKeyboardPwdType(type)) {
    throw ArgumentError.value(type);
  }
  if (endMinutes <= startMinutes) {
    throw ArgumentError('end must be after start');
  }
  final n = now ?? DateTime.now();
  final today = DateTime(n.year, n.month, n.day);
  DateTime? nearest;
  for (var i = 0; i < 7; i++) {
    final d = today.add(Duration(days: i));
    if (_matchesCyclicDay(type, d.weekday)) {
      nearest = d;
      break;
    }
  }
  final day = nearest!;
  DateTime at(int m) => DateTime(day.year, day.month, day.day, m ~/ 60, m % 60);
  return CyclicPasscodeWindow(start: at(startMinutes), end: at(endMinutes));
}

bool _matchesCyclicDay(KeyboardPwdType type, int weekday) => switch (type) {
  KeyboardPwdType.cyclicDaily => true,
  KeyboardPwdType.cyclicWorkday =>
    weekday >= DateTime.monday && weekday <= DateTime.friday,
  KeyboardPwdType.cyclicWeekend =>
    weekday == DateTime.saturday || weekday == DateTime.sunday,
  KeyboardPwdType.cyclicMonday => weekday == DateTime.monday,
  KeyboardPwdType.cyclicTuesday => weekday == DateTime.tuesday,
  KeyboardPwdType.cyclicWednesday => weekday == DateTime.wednesday,
  KeyboardPwdType.cyclicThursday => weekday == DateTime.thursday,
  KeyboardPwdType.cyclicFriday => weekday == DateTime.friday,
  KeyboardPwdType.cyclicSaturday => weekday == DateTime.saturday,
  KeyboardPwdType.cyclicSunday => weekday == DateTime.sunday,
  _ => false,
};
