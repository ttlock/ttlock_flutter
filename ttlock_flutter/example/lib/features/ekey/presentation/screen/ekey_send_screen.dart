import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/ekey_period.dart';
import 'package:ttlock_flutter_demo/features/ekey/presentation/provider/ekey_send_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class EkeySendScreen extends ConsumerStatefulWidget {
  const EkeySendScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<EkeySendScreen> createState() => _EkeySendScreenState();
}

class _EkeySendScreenState extends ConsumerState<EkeySendScreen> {
  final _username = TextEditingController();
  final _keyName = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _keyName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = ekeySendProvider(widget.lock.lockId);
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
      appBar: AppBar(title: Text(l10n.sendEkey)),
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
            TextField(
              controller: _username,
              decoration: InputDecoration(labelText: l10n.receiverUsername),
              keyboardType: TextInputType.emailAddress,
              enabled: !state.submitting,
            ),
            TextField(
              controller: _keyName,
              decoration: InputDecoration(labelText: l10n.keyName),
              enabled: !state.submitting,
            ),
            const SizedBox(height: 8),
            Text(l10n.validityPeriod),
            RadioGroup<bool>(
              groupValue: state.permanent,
              onChanged: (v) =>
                  ref.read(provider.notifier).setPermanent(v ?? true),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RadioListTile<bool>(
                    title: Text(l10n.permanent),
                    value: true,
                    enabled: !state.submitting,
                  ),
                  RadioListTile<bool>(
                    title: Text(l10n.limited),
                    value: false,
                    enabled: !state.submitting,
                  ),
                ],
              ),
            ),
            if (!state.permanent) ...[
              ListTile(
                title: Text(l10n.startDate),
                subtitle: Text(
                  state.startDate?.toLocal().toString().substring(0, 16) ?? '',
                ),
                onTap: state.submitting
                    ? null
                    : () async {
                        final picked = await pickEkeyDateTime(
                          context,
                          state.startDate ?? DateTime.now(),
                        );
                        if (picked != null) {
                          ref.read(provider.notifier).setStartDate(picked);
                        }
                      },
              ),
              ListTile(
                title: Text(l10n.endDate),
                subtitle: Text(
                  state.endDate?.toLocal().toString().substring(0, 16) ?? '',
                ),
                onTap: state.submitting
                    ? null
                    : () async {
                        final picked = await pickEkeyDateTime(
                          context,
                          state.endDate ??
                              DateTime.now().add(const Duration(days: 7)),
                        );
                        if (picked != null) {
                          ref.read(provider.notifier).setEndDate(picked);
                        }
                      },
              ),
            ],
            SwitchListTile(
              title: Text(l10n.authorizedAdmin),
              value: state.authorized,
              onChanged: state.submitting
                  ? null
                  : (v) => ref.read(provider.notifier).setAuthorized(v),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: state.submitting
                  ? null
                  : () async {
                      final ok = await ref
                          .read(provider.notifier)
                          .submit(
                            username: _username.text,
                            keyName: _keyName.text,
                          );
                      if (ok && context.mounted) {
                        Navigator.of(context).pop(true);
                      }
                    },
              child: state.submitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.sendEkey),
            ),
          ],
        ),
      ),
    );
  }
}
