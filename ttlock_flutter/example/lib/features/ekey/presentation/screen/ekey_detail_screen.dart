import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/ekey/domain/entity/key.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/ekey_args.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/ekey_period.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/provider/ekey_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/screen/ekey_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class EkeyDetailScreen extends ConsumerWidget {
  const EkeyDetailScreen({super.key, required this.args});
  final EkeyDetailArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = ekeyDetailProvider(args);
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
    final key = state.key;
    final title = key.username.isNotEmpty
        ? key.username
        : (key.keyName.isNotEmpty ? key.keyName : l10n.eKey);
    final frozen = key.keyStatus == KeyStatus.frozen;
    final operating = state.operating;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.receiverUsername),
            subtitle: Text(key.username.isEmpty ? '—' : key.username),
          ),
          ListTile(
            title: Text(l10n.keyName),
            subtitle: Text(key.keyName.isEmpty ? '—' : key.keyName),
          ),
          ListTile(
            title: Text(l10n.validityPeriod),
            subtitle: Text(formatEkeyPeriod(key, l10n)),
            trailing: const Icon(Icons.edit_outlined),
            onTap: operating ? null : () => _changePeriod(context, ref, key),
          ),
          if (frozen)
            ListTile(
              leading: const Icon(Icons.ac_unit),
              title: Text(l10n.freeze),
            ),
          if (key.keyRight)
            ListTile(
              leading: const Icon(Icons.admin_panel_settings_outlined),
              title: Text(l10n.authorizedAdmin),
            ),
          const Divider(),
          ListTile(
            leading: Icon(frozen ? Icons.lock_open : Icons.ac_unit),
            title: Text(frozen ? l10n.unfreeze : l10n.freeze),
            onTap: operating
                ? null
                : () => frozen
                      ? ref.read(provider.notifier).unfreeze()
                      : ref.read(provider.notifier).freeze(),
          ),
          if (!key.keyRight)
            ListTile(
              leading: const Icon(Icons.verified_user_outlined),
              title: Text(l10n.authorize),
              onTap: operating
                  ? null
                  : () => ref.read(provider.notifier).authorize(),
            )
          else
            ListTile(
              leading: const Icon(Icons.gpp_bad_outlined),
              title: Text(l10n.unauthorize),
              onTap: operating
                  ? null
                  : () => ref.read(provider.notifier).unauthorize(),
            ),
          ListTile(
            leading: const Icon(Icons.link),
            title: Text(l10n.unlockLink),
            onTap: operating
                ? null
                : () => ref.read(provider.notifier).loadUnlockLink(),
          ),
          if (state.unlockLink != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SelectableText(state.unlockLink!),
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: Text(l10n.copyLink),
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: state.unlockLink!));
                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(l10n.linkCopied)));
              },
            ),
          ],
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
    KeyEntity key,
  ) async {
    final result = await EkeyChangePeriodSheetRoute(
      $extra: key,
    ).push<EkeyChangePeriodResult>(context);
    if (result == null) return;
    await ref
        .read(ekeyDetailProvider(args).notifier)
        .changePeriod(result.start, result.end);
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await const EkeyDeleteConfirmSheetRoute().push<bool>(
      context,
    );
    if (confirmed != true) return;
    final ok = await ref.read(ekeyDetailProvider(args).notifier).delete();
    if (ok && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
