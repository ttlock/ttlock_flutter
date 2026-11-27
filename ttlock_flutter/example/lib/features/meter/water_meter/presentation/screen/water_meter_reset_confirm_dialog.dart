import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';

class WaterMeterResetConfirmDialog extends ConsumerWidget {
  const WaterMeterResetConfirmDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return AlertDialog(
      title: Text(l10n.meterResetConfirmTitle),
      content: Text(l10n.meterResetConfirmBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.commonCancel),
        ),
        FilledButton(
          key: const Key('water_meter_reset_confirm'),
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.meterReset),
        ),
      ],
    );
  }
}
