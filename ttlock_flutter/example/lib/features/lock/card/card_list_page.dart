import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/async_value_view.dart';
import '../model/credential_params.dart';
import '../widgets/credential_validity_sheet.dart';
import 'card_provider.dart';

Future<void> clearAllCards(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Clear all cards?'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Clear')),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  try {
    context.loaderOverlay.show();
    await ref.read(cardListProvider(lockMac).notifier).clearAll(lockMac);
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: const Text('All cards cleared'));
    }
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: Text('$e'), type: ToastificationType.error);
    }
  }
}

Future<void> showCardActions(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
  String cardNumber,
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
      await ref.read(cardListProvider(lockMac).notifier).delete(lockMac, cardNumber);
      if (context.mounted) {
        context.loaderOverlay.hide();
        toastification.show(title: const Text('Card deleted'));
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
      await ref.read(cardListProvider(lockMac).notifier).modifyValidity(lockMac, cardNumber, validity);
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

class CardListPage extends HookConsumerWidget {
  const CardListPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final listAsync = ref.watch(cardListProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (l) => Text(l?.name ?? 'Cards'),
          loading: () => const Text('Cards'),
          error: (_, __) => const Text('Cards'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Sync from lock',
            onPressed: () => ref.read(cardListProvider(lockMac).notifier).refreshFromLock(),
          ),
          TextButton(
            onPressed: () => clearAllCards(context, ref, lockMac),
            child: const Text('Clear All'),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => CardAddRoute(lockMac).push(context),
          ),
        ],
      ),
      body: AsyncValueView.when(
        value: listAsync,
        onRetry: (_, __) => ref.invalidate(cardListProvider(lockMac)),
        data: (list) => RefreshIndicator(
          onRefresh: () => ref.read(cardListProvider(lockMac).notifier).refresh(),
          child: list.isEmpty
              ? ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        'No cards on lock.\nTap + to add.',
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
                    final c = list[i];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title: Text(c.cardNumber, style: AppTextStyles.codeMedium),
                        subtitle: Text(formatCardValidityLabel(c.startDate, c.endDate)),
                        onTap: () => showCardActions(context, ref, lockMac, c.cardNumber),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
