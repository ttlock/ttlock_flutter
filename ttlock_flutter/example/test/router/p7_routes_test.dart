import 'package:flutter_test/flutter_test.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/keypad_rename_sheet.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/screen/keypad_unbind_confirm_sheet.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

void main() {
  test('P7 RoutePaths', () {
    expect(RoutePaths.keypadRename, '/lock/keypad-rename');
    expect(RoutePaths.keypadUnbindConfirm, '/lock/keypad-unbind-confirm');
    expect(RoutePaths.cardAdd, '/lock/card-add');
    expect(RoutePaths.fingerprintAdd, '/lock/fingerprint-add');
  });

  test('keypadMac 是 query 参数而非 path 参数', () {
    // 用 Uri 解析断言，不写死编码形式（`AA:BB` 的转义形态由生成器决定）。
    final withMac = const CardAddRoute(
      $extra: LockEntity(lockId: 1),
      keypadMac: 'AA:BB',
    ).location;
    final withMacUri = Uri.parse(withMac);
    expect(withMacUri.path, '/lock/card-add');
    // 参数名同样由生成器 kebab-case 决定（`keypadMac` → `keypad-mac`），
    // 这里用已验证的线上名称；下面的 values.single 才是绑定「属性值往返」的断言。
    expect(withMacUri.queryParameters['keypad-mac'], 'AA:BB');
    expect(withMacUri.queryParameters.values.single, 'AA:BB');

    final withoutMac = const CardAddRoute(
      $extra: LockEntity(lockId: 1),
    ).location;
    final withoutMacUri = Uri.parse(withoutMac);
    expect(withoutMacUri.path, '/lock/card-add');
    expect(withoutMacUri.queryParameters, isEmpty);

    final fp = const FingerprintAddRoute(
      $extra: LockEntity(lockId: 1),
      keypadMac: 'AA:BB',
    ).location;
    final fpUri = Uri.parse(fp);
    expect(fpUri.path, '/lock/fingerprint-add');
    expect(fpUri.queryParameters['keypad-mac'], 'AA:BB');
    expect(fpUri.queryParameters.values.single, 'AA:BB');
  });

  test('两条 sheet 路由 location', () {
    expect(
      const KeypadRenameSheetRoute(
        $extra: KeypadRenameArgs(wirelessKeypadId: 1, initialName: 'a'),
      ).location,
      '/lock/keypad-rename',
    );
    expect(
      const KeypadUnbindConfirmRoute(
        $extra: KeypadUnbindArgs(
          wirelessKeypadId: 1,
          isMultifunctionalKeypad: true,
        ),
      ).location,
      '/lock/keypad-unbind-confirm',
    );
  });

  test('KeypadRenameArgs 值相等性', () {
    expect(
      const KeypadRenameArgs(wirelessKeypadId: 1, initialName: 'a'),
      const KeypadRenameArgs(wirelessKeypadId: 1, initialName: 'a'),
    );
    expect(
      const KeypadRenameArgs(wirelessKeypadId: 1, initialName: 'a'),
      isNot(const KeypadRenameArgs(wirelessKeypadId: 1, initialName: 'b')),
    );
  });

  test('KeypadUnbindArgs 值相等性', () {
    expect(
      const KeypadUnbindArgs(
        wirelessKeypadId: 1,
        isMultifunctionalKeypad: true,
      ),
      const KeypadUnbindArgs(
        wirelessKeypadId: 1,
        isMultifunctionalKeypad: true,
      ),
    );
    expect(
      const KeypadUnbindArgs(
        wirelessKeypadId: 1,
        isMultifunctionalKeypad: true,
      ),
      isNot(
        const KeypadUnbindArgs(
          wirelessKeypadId: 1,
          isMultifunctionalKeypad: false,
        ),
      ),
    );
  });
}
