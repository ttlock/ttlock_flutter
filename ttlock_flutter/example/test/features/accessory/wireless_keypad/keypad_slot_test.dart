import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/entity/keypad_slot.dart';

void main() {
  test('lockAlias 非空 → isBound 为 true', () {
    const slot = KeypadSlot(slotNumber: 2, lockAlias: '房间锁');
    expect(slot.isBound, isTrue);
    expect(slot.slotNumber, 2);
  });

  test('lockAlias 为空串 → isBound 为 false（云端用空串表示未绑定）', () {
    const slot = KeypadSlot(slotNumber: 3);
    expect(slot.isBound, isFalse);
    expect(slot.lockAlias, '');
  });

  test('值相等性（family / \$extra 依赖）', () {
    const a = KeypadSlot(slotNumber: 1, lockAlias: 'A');
    // 非 const 调用在运行期分配新实例。若这里也写 `const`，Dart 会把两个常量
    // 规范化成同一个对象，`expect(a, b)` 就退化成恒真的同一性断言。
    final b = KeypadSlot(slotNumber: 1, lockAlias: 'A');
    final c = KeypadSlot(slotNumber: 2, lockAlias: 'A');

    // 守卫：操作数必须是不同实例，否则下面的断言不证明任何东西。
    expect(identical(a, b), isFalse);
    expect(identical(a, c), isFalse);

    // 字段值相等 → `==` 必须按值比较（identity 相等会在此失败）。
    expect(a, b);

    // 槽位不同 → 不相等。
    expect(a, isNot(c));
  });
}
