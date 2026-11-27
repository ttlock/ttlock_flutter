import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';

/// 清零二次确认（破坏性操作，spec §6.2）。走类型化 Dialog 路由。
///
/// 文案只看「清零」语义、不带表型差异，故不需要 `$extra`。
/// pop 出 `true`（确认）/ `false`（取消）。
class ElectricMeterClearConfirmDialog extends ConsumerWidget {
  const ElectricMeterClearConfirmDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return AlertDialog(
      title: Text(l10n.meterClearConfirmTitle),
      content: Text(l10n.meterClearConfirmBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.commonCancel),
        ),
        FilledButton(
          key: const Key('electric_meter_clear_confirm'),
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.meterClear),
        ),
      ],
    );
  }
}
