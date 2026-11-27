import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

class LockDeleteConfirmSheet extends ConsumerWidget {
  const LockDeleteConfirmSheet({super.key, required this.lock});
  final LockEntity lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final name = lock.lockAlias.isEmpty ? lock.lockName : lock.lockAlias;
    return BaseBottomSheet(
      title: l10n.deleteLock,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(name),
          const SizedBox(height: 16),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.deleteLock),
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
