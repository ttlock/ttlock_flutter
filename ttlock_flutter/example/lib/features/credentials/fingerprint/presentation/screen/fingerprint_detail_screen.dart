import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/domain/entity/fingerprint.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/fingerprint_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/fingerprint_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/provider/fingerprint_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/screen/fingerprint_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class FingerprintDetailScreen extends ConsumerStatefulWidget {
  const FingerprintDetailScreen({super.key, required this.args});
  final FingerprintDetailArgs args;

  @override
  ConsumerState<FingerprintDetailScreen> createState() =>
      _FingerprintDetailScreenState();
}

class _FingerprintDetailScreenState
    extends ConsumerState<FingerprintDetailScreen> {
  late final TextEditingController _name;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.args.item.fingerprintName);
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = fingerprintDetailProvider(widget.args);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.fingerprintName.isNotEmpty
              ? item.fingerprintName
              : l10n.fingerprint,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.fingerprint),
            subtitle: Text(
              item.fingerprintNumber.isEmpty ? '—' : item.fingerprintNumber,
            ),
          ),
          ListTile(
            title: Text(l10n.fingerprintName),
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
            subtitle: Text(formatFingerprintPeriod(item, l10n)),
            trailing: isFingerprintPermanent(item)
                ? null
                : const Icon(Icons.edit_outlined),
            onTap: operating || isFingerprintPermanent(item)
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
    FingerprintEntity item,
  ) async {
    final result = await FingerprintChangePeriodSheetRoute(
      $extra: item,
    ).push<FingerprintChangePeriodResult>(context);
    if (result == null) return;
    await ref
        .read(fingerprintDetailProvider(widget.args).notifier)
        .changePeriod(result.start, result.end, schedule: result.schedule);
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await const FingerprintDeleteConfirmSheetRoute()
        .push<bool>(context);
    if (confirmed != true) return;
    final ok = await ref
        .read(fingerprintDetailProvider(widget.args).notifier)
        .delete();
    if (ok && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
