import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/error_display.dart';
import '../model/credential_params.dart';
import '../widgets/credential_validity_sheet.dart';
import 'fingerprint_provider.dart';

class FingerprintListPage extends ConsumerWidget {
  const FingerprintListPage({super.key, required this.lockMac});

  final String lockMac;

  Future<void> _clearAll(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear all fingerprints?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Clear')),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    try {
      context.loaderOverlay.show();
      await ref.read(fingerprintListProvider(lockMac).notifier).clearAll(lockMac);
      if (context.mounted) {
        context.loaderOverlay.hide();
        toastification.show(title: const Text('Cleared'));
      }
    } catch (e) {
      if (context.mounted) {
        context.loaderOverlay.hide();
        toastification.show(title: Text('$e'), type: ToastificationType.error);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final listAsync = ref.watch(fingerprintListProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (l) => Text(l?.name ?? 'Fingerprints'),
          loading: () => const Text('Fingerprints'),
          error: (_, __) => const Text('Fingerprints'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Sync from lock',
            onPressed: () =>
                ref.read(fingerprintListProvider(lockMac).notifier).refreshFromLock(),
          ),
          TextButton(
            onPressed: () => _clearAll(context, ref),
            child: const Text('Clear All'),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => FingerprintAddRoute(lockMac).push(context),
          ),
        ],
      ),
      body: listAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorDisplay(message: e.toString()),
        data: (list) => RefreshIndicator(
          onRefresh: () => ref.read(fingerprintListProvider(lockMac).notifier).refresh(),
          child: list.isEmpty
              ? ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        'No fingerprints.\nTap + to enroll.',
                        style: AppTextStyles.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final fp = list[i];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title: Text(fp.fingerprintNumber, style: AppTextStyles.codeMedium),
                        subtitle: Text(formatCardValidityLabel(fp.startDate, fp.endDate)),
                        onTap: () => _actions(context, ref, fp.fingerprintNumber),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future<void> _actions(
    BuildContext context,
    WidgetRef ref,
    String number,
  ) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Modify validity'),
              onTap: () => Navigator.pop(ctx, 'modify'),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () => Navigator.pop(ctx, 'delete'),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || action == null) return;
    if (action == 'delete') {
      try {
        context.loaderOverlay.show();
        await ref.read(fingerprintListProvider(lockMac).notifier).delete(lockMac, number);
        if (context.mounted) {
          context.loaderOverlay.hide();
          toastification.show(title: const Text('Deleted'));
        }
      } catch (e) {
        if (context.mounted) {
          context.loaderOverlay.hide();
          toastification.show(title: Text('$e'), type: ToastificationType.error);
        }
      }
      return;
    }
    if (action == 'modify') {
      final validity = await CredentialValiditySheet.show(context);
      if (validity == null || !context.mounted) return;
      try {
        context.loaderOverlay.show();
        await ref.read(fingerprintListProvider(lockMac).notifier).modifyValidity(lockMac, number, validity);
        if (context.mounted) {
          context.loaderOverlay.hide();
          toastification.show(title: const Text('Updated'));
        }
      } catch (e) {
        if (context.mounted) {
          context.loaderOverlay.hide();
          toastification.show(title: Text('$e'), type: ToastificationType.error);
        }
      }
    }
  }
}
