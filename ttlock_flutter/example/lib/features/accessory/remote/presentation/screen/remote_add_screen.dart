import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/remote/presentation/provider/remote_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_date_range_fields.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_validity_picker.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/recurring_schedule_field.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class RemoteAddScreen extends ConsumerStatefulWidget {
  const RemoteAddScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<RemoteAddScreen> createState() => _RemoteAddScreenState();
}

class _RemoteAddScreenState extends ConsumerState<RemoteAddScreen> {
  final _name = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(remoteAddProvider(widget.lock).notifier).startScan();
      }
    });
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = remoteAddProvider(widget.lock);
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
      appBar: AppBar(title: Text(l10n.addRemote)),
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
            Row(
              children: [
                Expanded(
                  child: Text(
                    state.scanning ? l10n.scanningRemotes : l10n.remote,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                TextButton(
                  key: const Key('remote_scan_toggle'),
                  onPressed: state.submitting
                      ? null
                      : () {
                          final n = ref.read(provider.notifier);
                          if (state.scanning) {
                            n.stopScan();
                          } else {
                            n.startScan();
                          }
                        },
                  child: Text(
                    state.scanning ? l10n.commonCancel : l10n.startScan,
                  ),
                ),
              ],
            ),
            if (state.scanned.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  key: const Key('remote_scan_empty'),
                  l10n.noRemotesScanned,
                ),
              )
            else
              ...state.scanned.map(
                (s) => ListTile(
                  key: Key('remote_scan_${s.mac}'),
                  leading: const Icon(Icons.settings_remote_outlined),
                  title: Text(s.name.isEmpty ? s.mac : s.name),
                  subtitle: Text('${s.mac}  RSSI ${s.rssi}'),
                  selected: state.selectedMac == s.mac,
                  onTap: state.submitting
                      ? null
                      : () => ref.read(provider.notifier).selectScanned(s),
                ),
              ),
            TextField(
              controller: _name,
              decoration: InputDecoration(labelText: l10n.remoteName),
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
              key: const Key('remote_add_submit'),
              onPressed: state.submitting
                  ? null
                  : () async {
                      final ok = await ref
                          .read(provider.notifier)
                          .submit(
                            mac: state.selectedMac ?? '',
                            name: _name.text.trim(),
                          );
                      if (ok && context.mounted) {
                        Navigator.of(context).pop(true);
                      }
                    },
              child: state.submitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.commonConfirm),
            ),
          ],
        ),
      ),
    );
  }
}
