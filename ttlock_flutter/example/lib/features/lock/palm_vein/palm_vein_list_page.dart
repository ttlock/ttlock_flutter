import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/async_value_view.dart';
import '../model/credential_params.dart';
import 'palm_vein_provider.dart';
import 'palm_vein_add_page.dart';

Future<void> clearAllPalmVeins(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Clear all palm veins on lock?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: const Text('Clear'),
        ),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  try {
    context.loaderOverlay.show();
    await ref.read(palmVeinListProvider(lockMac).notifier).clearOnLock(lockMac);
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: const Text('Palm veins cleared'));
    }
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(
        title: Text('$e'),
        type: ToastificationType.error,
      );
    }
  }
}

Future<void> deletePalmVein(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
  String palmVeinNumber,
) async {
  try {
    context.loaderOverlay.show();
    await ref.read(palmVeinListProvider(lockMac).notifier).deleteOnLock(lockMac, palmVeinNumber);
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(
        title: const Text('Palm vein deleted'),
      );
    }
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(
        title: Text('$e'),
        type: ToastificationType.error,
      );
    }
  }
}

class PalmVeinListPage extends HookConsumerWidget {
  const PalmVeinListPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final listAsync = ref.watch(palmVeinListProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (l) => Text(l?.name ?? 'Palm Veins'),
          loading: () => const Text('Palm Veins'),
          error: (_, __) => const Text('Palm Veins'),
        ),
        actions: [
          TextButton(
            onPressed: () => clearAllPalmVeins(context, ref, lockMac),
            child: const Text('Clear All'),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => PalmVeinAddPage(lockMac: lockMac).push(context),
          ),
        ],
      ),
      body: AsyncValueView.when(
        value: listAsync,
        onRetry: (_, __) => ref.invalidate(palmVeinListProvider(lockMac)),
        data: (list) {
          if (list.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'No palm veins registered.',
                  style: AppTextStyles.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: list.length,
            itemBuilder: (_, i) {
              final pv = list[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: Text(
                    'Palm Vein #${pv.palmVeinNumber}',
                    style: AppTextStyles.codeMedium,
                  ),
                  subtitle: Text(
                    formatCardValidityLabel(pv.startDate, pv.endDate),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => deletePalmVein(context, ref, lockMac, pv.palmVeinNumber),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
