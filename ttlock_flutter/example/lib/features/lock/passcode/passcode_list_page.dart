import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/async_value_view.dart';
import '../lock_provider.dart';
import '../model/credential_params.dart';
import '../widgets/credential_validity_sheet.dart';
import 'passcode_provider.dart';

Future<void> resetAllPasscodes(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Reset all passcodes?'),
      content: const Text('This clears all keyboard passcodes on the lock.'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Reset')),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  try {
    context.loaderOverlay.show();
    final newData = await ref.read(passcodeListProvider(lockMac).notifier).resetAll(lockMac);
    ref.read(lockNotifierProvider.notifier).setContext(
          newData,
          lockMac: lockMac,
        );
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(
        title: const Text('Passcodes reset'),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 2),
      );
    }
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(
        title: Text('$e'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 3),
      );
    }
  }
}

Future<void> showPasscodeActions(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
  TTPasscodeModel model,
) async {
  final action = await showModalBottomSheet<String>(
    context: context,
    builder: (ctx) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Modify'),
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

  final passcode = model.keyboardPwd;
  if (action == 'delete') {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete passcode?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete')),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    try {
      context.loaderOverlay.show();
      await ref.read(passcodeListProvider(lockMac).notifier).delete(lockMac, passcode);
      if (context.mounted) {
        context.loaderOverlay.hide();
        toastification.show(title: const Text('Deleted'), type: ToastificationType.success);
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
    final newCtrl = TextEditingController();
    final proceed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Modify passcode'),
        content: TextField(
          controller: newCtrl,
          decoration: const InputDecoration(
            labelText: 'New passcode (empty = keep)',
          ),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Next')),
        ],
      ),
    );
    if (proceed != true || !context.mounted) return;
    final validity = await CredentialValiditySheet.show(context);
    if (validity == null || !context.mounted) return;
    try {
      context.loaderOverlay.show();
      await ref.read(passcodeListProvider(lockMac).notifier).modify(
            lockMac,
            passcode,
            newCtrl.text.isEmpty ? null : newCtrl.text,
            validity,
          );
      if (context.mounted) {
        context.loaderOverlay.hide();
        toastification.show(title: const Text('Updated'), type: ToastificationType.success);
      }
    } catch (e) {
      if (context.mounted) {
        context.loaderOverlay.hide();
        toastification.show(title: Text('$e'), type: ToastificationType.error);
      }
    }
  }
}

Future<void> modifyAdminPasscodeDialog(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
) async {
  final ctrl = TextEditingController();
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('New admin passcode'),
      content: TextField(
        controller: ctrl,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Passcode'),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Save')),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  try {
    context.loaderOverlay.show();
    await ref.read(passcodeListProvider(lockMac).notifier).modifyAdmin(lockMac, ctrl.text);
    ref.invalidate(adminPasscodeProvider(lockMac));
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: const Text('Admin passcode updated'));
    }
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: Text('$e'), type: ToastificationType.error);
    }
  }
}

Future<void> setErasePasscodeDialog(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
) async {
  final ctrl = TextEditingController(text: '999999');
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Erase passcode'),
      content: TextField(
        controller: ctrl,
        keyboardType: TextInputType.number,
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Set')),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  try {
    context.loaderOverlay.show();
    await ref.read(passcodeListProvider(lockMac).notifier).setErasePasscode(lockMac, ctrl.text);
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: const Text('Erase passcode set'));
    }
  } catch (e) {
    if (context.mounted) {
      context.loaderOverlay.hide();
      toastification.show(title: Text('$e'), type: ToastificationType.error);
    }
  }
}

class PasscodeListPage extends HookConsumerWidget {
  const PasscodeListPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final listAsync = ref.watch(passcodeListProvider(lockMac));
    final adminAsync = ref.watch(adminPasscodeProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (l) => Text(l?.name ?? 'Passcodes'),
          loading: () => const Text('Passcodes'),
          error: (_, __) => const Text('Passcodes'),
        ),
        actions: [
          TextButton(
            onPressed: () => resetAllPasscodes(context, ref, lockMac),
            child: const Text('Reset All'),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => PasscodeAddRoute(lockMac).push(context),
          ),
        ],
      ),
      body: AsyncValueView.when(
        value: listAsync,
        onRetry: (_, __) => ref.invalidate(passcodeListProvider(lockMac)),
        data: (list) => RefreshIndicator(
          onRefresh: () => ref.read(passcodeListProvider(lockMac).notifier).refresh(),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              adminAsync.when(
                data: (code) {
                  if (code == null) return const SizedBox.shrink();
                  return Card(
                    child: ListTile(
                      title: const Text('Admin passcode'),
                      subtitle: SelectableText(code),
                      trailing: IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: code));
                          toastification.show(title: const Text('Copied'));
                        },
                      ),
                    ),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
              Card(
                child: ListTile(
                  title: const Text('Modify admin passcode'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => modifyAdminPasscodeDialog(context, ref, lockMac),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Set erase passcode'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => setErasePasscodeDialog(context, ref, lockMac),
                ),
              ),
              const SizedBox(height: 8),
              if (list.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    'No passcodes on lock.\nTap + to add a custom passcode.',
                    style: AppTextStyles.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                )
              else
                ...list.map(
                  (p) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(p.keyboardPwd, style: AppTextStyles.codeMedium),
                      subtitle: Text(formatPasscodeValidityLabel(p)),
                      trailing: const Icon(Icons.more_vert),
                      onTap: () => showPasscodeActions(context, ref, lockMac, p),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
