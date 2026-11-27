import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 重命名 sheet 入参（`$extra` 需值相等性，故手写 ==/hashCode）。
class KeypadRenameArgs {
  const KeypadRenameArgs({
    required this.wirelessKeypadId,
    required this.initialName,
  });

  final int wirelessKeypadId;
  final String initialName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KeypadRenameArgs &&
          other.wirelessKeypadId == wirelessKeypadId &&
          other.initialName == initialName;

  @override
  int get hashCode => Object.hash(wirelessKeypadId, initialName);
}

/// 只回传新名称，**不做业务**——由详情页 Notifier 执行 rename 并持有进度态。
/// 范式同 `lock_rename_sheet.dart`。
class KeypadRenameSheet extends ConsumerStatefulWidget {
  const KeypadRenameSheet({super.key, required this.args});
  final KeypadRenameArgs args;

  @override
  ConsumerState<KeypadRenameSheet> createState() => _KeypadRenameSheetState();
}

class _KeypadRenameSheetState extends ConsumerState<KeypadRenameSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.args.initialName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    return BaseBottomSheet(
      title: l10n.rename,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const Key('keypad_rename_field'),
            controller: _controller,
            autofocus: true,
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('keypad_rename_confirm'),
            onPressed: () {
              final name = _controller.text.trim();
              Navigator.of(context).pop(name.isEmpty ? null : name);
            },
            child: Text(l10n.commonConfirm),
          ),
        ],
      ),
    );
  }
}
