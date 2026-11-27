import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/meter/electric_meter/domain/entity/electric_meter.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// 删除电表二次确认。删除本身走**纯 BLE**（SDK 删除后自行通知服务器），
/// 电表云端本就没有 delete 端点。
class ElectricMeterDeleteConfirmSheet extends ConsumerWidget {
  const ElectricMeterDeleteConfirmSheet({super.key, required this.item});

  final ElectricMeterEntity item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final name = item.name.isEmpty ? item.number : item.name;
    return BaseBottomSheet(
      title: l10n.electricMeterDeleteConfirm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${name.isEmpty ? item.mac : name} — ${l10n.electricMeterDeleteConfirmMessage}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('electric_meter_delete_confirm'),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.electricMeterDeleteConfirm),
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
