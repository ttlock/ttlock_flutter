import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 解绑确认 sheet 入参（`$extra` 需值相等性，故手写 ==/hashCode）。
class KeypadUnbindArgs {
  const KeypadUnbindArgs({
    required this.wirelessKeypadId,
    required this.isMultifunctionalKeypad,
  });

  final int wirelessKeypadId;
  final bool isMultifunctionalKeypad;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeypadUnbindArgs &&
          other.wirelessKeypadId == wirelessKeypadId &&
          other.isMultifunctionalKeypad == isMultifunctionalKeypad;

  @override
  int get hashCode => Object.hash(wirelessKeypadId, isMultifunctionalKeypad);
}

/// 只回传 `true`/`false`，**不做业务**——由详情页 Notifier 执行解绑。
/// 范式同 `ekey_delete_confirm_sheet.dart`。
class KeypadUnbindConfirmSheet extends ConsumerWidget {
  const KeypadUnbindConfirmSheet({super.key, required this.args});
  final KeypadUnbindArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: args.isMultifunctionalKeypad
          ? l10n.keypadUnbindFromLock
          : l10n.deleteWirelessKeypad,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.keypadUnbindConfirm),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('keypad_unbind_confirm'),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.commonConfirm),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
        ],
      ),
    );
  }
}
