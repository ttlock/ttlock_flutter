import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/error_display.dart';
import '../lock_provider.dart';
import '../model/credential_params.dart';
import '../widgets/credential_validity_sheet.dart';
import 'passcode_provider.dart';

class PasscodeListPage extends ConsumerStatefulWidget {
  const PasscodeListPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  ConsumerState<PasscodeListPage> createState() => _PasscodeListPageState();
}

class _PasscodeListPageState extends ConsumerState<PasscodeListPage> {
  String? _adminPasscode;

  Future<void> _loadAdmin() async {
    try {
      final code = await ref
          .read(passcodeListProvider(widget.lockMac).notifier)
          .getAdminPasscode(widget.lockMac);
      if (mounted) setState(() => _adminPasscode = code);
    } catch (_) {}
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadAdmin);
  }

  Future<void> _resetAll() async {
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
    if (ok != true || !mounted) return;
    try {
      context.loaderOverlay.show();
      final newData = await ref
          .read(passcodeListProvider(widget.lockMac).notifier)
          .resetAll(widget.lockMac);
      ref.read(lockNotifierProvider.notifier).setContext(
            newData,
            lockMac: widget.lockMac,
          );
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: const Text('Passcodes reset'),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: Text('$e'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  Future<void> _showActions(TTPasscodeModel model) async {
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
    if (!mounted || action == null) return;

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
      if (ok != true || !mounted) return;
      try {
        context.loaderOverlay.show();
        await ref.read(passcodeListProvider(widget.lockMac).notifier).delete(widget.lockMac, passcode);
        if (mounted) {
          context.loaderOverlay.hide();
          toastification.show(title: const Text('Deleted'), type: ToastificationType.success);
        }
      } catch (e) {
        if (mounted) {
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
      if (proceed != true || !mounted) return;
      final validity = await CredentialValiditySheet.show(context);
      if (validity == null || !mounted) return;
      try {
        context.loaderOverlay.show();
        await ref.read(passcodeListProvider(widget.lockMac).notifier).modify(
              widget.lockMac,
              passcode,
              newCtrl.text.isEmpty ? null : newCtrl.text,
              validity,
            );
        if (mounted) {
          context.loaderOverlay.hide();
          toastification.show(title: const Text('Updated'), type: ToastificationType.success);
        }
      } catch (e) {
        if (mounted) {
          context.loaderOverlay.hide();
          toastification.show(title: Text('$e'), type: ToastificationType.error);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lockAsync = ref.watch(lockByMacProvider(widget.lockMac));
    final listAsync = ref.watch(passcodeListProvider(widget.lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (l) => Text(l?.name ?? 'Passcodes'),
          loading: () => const Text('Passcodes'),
          error: (_, __) => const Text('Passcodes'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Sync from lock',
            onPressed: () => ref.read(passcodeListProvider(widget.lockMac).notifier).refreshFromLock(),
          ),
          TextButton(onPressed: _resetAll, child: const Text('Reset All')),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => PasscodeAddRoute(widget.lockMac).push(context),
          ),
        ],
      ),
      body: listAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorDisplay(message: e.toString()),
        data: (list) => RefreshIndicator(
          onRefresh: () =>
              ref.read(passcodeListProvider(widget.lockMac).notifier).refresh(),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (_adminPasscode != null)
                Card(
                  child: ListTile(
                    title: const Text('Admin passcode'),
                    subtitle: SelectableText(_adminPasscode!),
                    trailing: IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: _adminPasscode!));
                        toastification.show(title: const Text('Copied'));
                      },
                    ),
                  ),
                ),
              Card(
                child: ListTile(
                  title: const Text('Modify admin passcode'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
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
                    if (ok != true || !mounted) return;
                    try {
                      context.loaderOverlay.show();
                      await ref.read(passcodeListProvider(widget.lockMac).notifier).modifyAdmin(widget.lockMac, ctrl.text);
                      await _loadAdmin();
                      if (mounted) {
                        context.loaderOverlay.hide();
                        toastification.show(title: const Text('Admin passcode updated'));
                      }
                    } catch (e) {
                      if (mounted) {
                        context.loaderOverlay.hide();
                        toastification.show(title: Text('$e'), type: ToastificationType.error);
                      }
                    }
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Set erase passcode'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
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
                    if (ok != true || !mounted) return;
                    try {
                      context.loaderOverlay.show();
                      await ref.read(passcodeListProvider(widget.lockMac).notifier).setErasePasscode(widget.lockMac, ctrl.text);
                      if (mounted) {
                        context.loaderOverlay.hide();
                        toastification.show(title: const Text('Erase passcode set'));
                      }
                    } catch (e) {
                      if (mounted) {
                        context.loaderOverlay.hide();
                        toastification.show(title: Text('$e'), type: ToastificationType.error);
                      }
                    }
                  },
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
                      onTap: () => _showActions(p),
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
