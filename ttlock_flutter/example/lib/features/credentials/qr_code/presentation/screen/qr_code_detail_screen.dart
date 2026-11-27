import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/provider/qr_code_detail_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/qr_code_args.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/domain/entity/qr_code.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/qr_code_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/screen/qr_code_change_period_sheet.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class QrCodeDetailScreen extends ConsumerWidget {
  const QrCodeDetailScreen({super.key, required this.args});
  final QrCodeDetailArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = qrCodeDetailProvider(args);
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
    final qr = state.qrCode;
    final title = qr.name.isNotEmpty ? qr.name : l10n.qrCode;
    final operating = state.operating;
    final permanent = isQrCodePermanent(qr);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.validityPeriod),
            subtitle: Text(formatQrCodePeriod(qr, l10n)),
            trailing: permanent ? null : const Icon(Icons.edit_outlined),
            onTap: operating || permanent
                ? null
                : () => _changePeriod(context, ref, qr),
          ),
          if (qr.qrCodeNumber.isNotEmpty)
            ListTile(title: Text(l10n.qrCode), subtitle: Text(qr.qrCodeNumber)),
          if (qr.link.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SelectableText(qr.link),
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: Text(l10n.copyLink),
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: qr.link));
                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(l10n.linkCopied)));
              },
            ),
          ],
          if (qr.qrCodeContent.isNotEmpty)
            ListTile(
              title: Text(l10n.qrCodeContent),
              subtitle: SelectableText(qr.qrCodeContent),
            ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: Text(l10n.refreshQrCodeData),
            onTap: operating
                ? null
                : () => ref.read(provider.notifier).refreshData(),
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
    QrCodeEntity qr,
  ) async {
    final result = await QrCodeChangePeriodSheetRoute(
      $extra: qr,
    ).push<QrCodeChangePeriodResult>(context);
    if (result == null) return;
    await ref
        .read(qrCodeDetailProvider(args).notifier)
        .changePeriod(result.start, result.end, schedule: result.schedule);
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await const QrCodeDeleteConfirmSheetRoute().push<bool>(
      context,
    );
    if (confirmed != true) return;
    final ok = await ref.read(qrCodeDetailProvider(args).notifier).delete();
    if (ok && context.mounted) {
      Navigator.of(context).pop(true);
    }
  }
}
