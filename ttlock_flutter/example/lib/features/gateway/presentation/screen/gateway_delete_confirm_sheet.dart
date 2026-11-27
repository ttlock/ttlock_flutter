import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/gateway/domain/entity/gateway.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class GatewayDeleteConfirmSheet extends ConsumerWidget {
  const GatewayDeleteConfirmSheet({super.key, required this.gateway});

  final GatewayEntity gateway;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final name = gateway.gatewayName.isEmpty
        ? gateway.gatewayMac
        : gateway.gatewayName;
    return BaseBottomSheet(
      title: l10n.gatewayDeleteConfirm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '$name — ${l10n.gatewayDeleteConfirmMessage}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('gateway_delete_confirm'),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.gatewayDeleteConfirm),
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
