import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/domain/entity/remote.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/provider/remote_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/remote_args.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/remote_period.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/screen/remote_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class RemoteDetailScreen extends ConsumerStatefulWidget {
  const RemoteDetailScreen({super.key, required this.args});
  final RemoteDetailArgs args;

  @override
  ConsumerState<RemoteDetailScreen> createState() => _RemoteDetailScreenState();
}

class _RemoteDetailScreenState extends ConsumerState<RemoteDetailScreen> {
  late final TextEditingController _name;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.args.item.name);
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = remoteDetailProvider(widget.args);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(provider.notifier).clearError();
      }
    });
    final item = state.item;
    final operating = state.operating;
    final permanent = isRemotePermanent(item);
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name.isNotEmpty ? item.name : l10n.remote),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.remoteMac),
            subtitle: Text(item.mac.isEmpty ? '—' : item.mac),
          ),
          ListTile(
            title: Text(l10n.remoteName),
            subtitle: TextField(
              controller: _name,
              enabled: !operating,
              decoration: InputDecoration(hintText: l10n.nameHint),
            ),
          ),
          ListTile(
            title: Text(l10n.rename),
            leading: const Icon(Icons.drive_file_rename_outline),
            onTap: operating
                ? null
                : () => ref.read(provider.notifier).rename(_name.text),
          ),
          ListTile(
            title: Text(l10n.validityPeriod),
            subtitle: Text(formatRemotePeriod(item, l10n)),
            trailing: permanent ? null : const Icon(Icons.edit_outlined),
            onTap: operating || permanent
                ? null
                : () => _changePeriod(context, ref, item),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(l10n.deleteConfirm),
            onTap: operating ? null : () => _confirmDelete(context, ref),
          ),
        ],
      ),
    );
  }

  Future<void> _changePeriod(
    BuildContext context,
    WidgetRef ref,
    RemoteEntity item,
  ) async {
    final result = await RemoteChangePeriodSheetRoute(
      $extra: item,
    ).push<RemoteChangePeriodResult>(context);
    if (result == null) return;
    await ref
        .read(remoteDetailProvider(widget.args).notifier)
        .changePeriod(result.start, result.end, schedule: result.schedule);
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await const RemoteDeleteConfirmSheetRoute().push<bool>(
      context,
    );
    if (confirmed != true) return;
    final ok = await ref
        .read(remoteDetailProvider(widget.args).notifier)
        .delete();
    if (ok && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
