import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/cyclic_passcode_window.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';

void main() {
  test('周末循环取最近周六的当日时段', () {
    final w = cyclicPasscodeWindow(
      type: KeyboardPwdType.cyclicWeekend,
      startMinutes: 8 * 60,
      endMinutes: 17 * 60,
      now: DateTime(2026, 1, 1, 12),
    );
    expect(w.start, DateTime(2026, 1, 3, 8));
    expect(w.end, DateTime(2026, 1, 3, 17));
  });

  test('结束时刻不晚于开始则抛错', () {
    expect(
      () => cyclicPasscodeWindow(
        type: KeyboardPwdType.cyclicDaily,
        startMinutes: 18 * 60,
        endMinutes: 8 * 60,
        now: DateTime(2026, 1, 1),
      ),
      throwsArgumentError,
    );
  });
}
