import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/qr_code/presentation/provider/qr_code_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_date_range_fields.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_validity_picker.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/recurring_schedule_field.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class QrCodeAddScreen extends ConsumerStatefulWidget {
  const QrCodeAddScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<QrCodeAddScreen> createState() => _QrCodeAddScreenState();
}

class _QrCodeAddScreenState extends ConsumerState<QrCodeAddScreen> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = qrCodeAddProvider(widget.lock);
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
    return Scaffold(
      appBar: AppBar(title: Text(l10n.addQrCode)),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          16 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.result != null) ...[
              if (state.result!.link.isNotEmpty) ...[
                SelectableText(state.result!.link),
                ListTile(
                  leading: const Icon(Icons.copy),
                  title: Text(l10n.copyLink),
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(text: state.result!.link),
                    );
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(l10n.linkCopied)));
                  },
                ),
              ],
              FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(l10n.commonConfirm),
              ),
            ] else ...[
              TextField(
                controller: _name,
                decoration: InputDecoration(labelText: l10n.nameHint),
                enabled: !state.submitting,
              ),
              CredentialValidityPicker(
                value: state.kind,
                showCyclic: state.showCyclic,
                enabled: !state.submitting,
                onChanged: (v) => ref.read(provider.notifier).setKind(v),
              ),
              CredentialDateRangeFields(
                kind: state.kind,
                start: state.startDate,
                end: state.endDate,
                enabled: !state.submitting,
                onStart: (v) => ref.read(provider.notifier).setStartDate(v),
                onEnd: (v) => ref.read(provider.notifier).setEndDate(v),
              ),
              if (state.kind == CredentialValidityKind.cyclic)
                RecurringScheduleField(
                  value: state.schedule,
                  enabled: !state.submitting,
                  onChanged: (v) => ref.read(provider.notifier).setSchedule(v),
                ),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: state.submitting
                    ? null
                    : () => ref
                          .read(provider.notifier)
                          .submit(name: _name.text.trim()),
                child: state.submitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l10n.commonConfirm),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
