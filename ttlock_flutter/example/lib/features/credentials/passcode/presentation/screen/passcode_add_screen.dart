import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class PasscodeAddScreen extends ConsumerStatefulWidget {
  const PasscodeAddScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<PasscodeAddScreen> createState() => _PasscodeAddScreenState();
}

class _PasscodeAddScreenState extends ConsumerState<PasscodeAddScreen> {
  final _pwd = TextEditingController();
  final _name = TextEditingController();

  @override
  void dispose() {
    _pwd.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = passcodeAddProvider(widget.lock);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        final msg = err.message == 'invalid_passcode'
            ? l10n.passcodeHint
            : getUserFriendlyMessage(err, l10n);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(msg)));
        ref.read(provider.notifier).clearError();
      }
    });
    return Scaffold(
      appBar: AppBar(title: Text(l10n.customPasscode)),
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
              controller: _pwd,
              decoration: InputDecoration(labelText: l10n.passcodeHint),
              keyboardType: TextInputType.number,
              enabled: !state.submitting,
            ),
            TextField(
              controller: _name,
              decoration: InputDecoration(labelText: l10n.nameHint),
              enabled: !state.submitting,
            ),
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
                        final picked = await pickPasscodeDateTime(
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
                        final picked = await pickPasscodeDateTime(
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
            const SizedBox(height: 8),
            FilledButton(
              onPressed: state.submitting
                  ? null
                  : () async {
                      final ok = await ref
                          .read(provider.notifier)
                          .submit(
                            keyboardPwd: _pwd.text,
                            keyboardPwdName: _name.text,
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
                  : Text(l10n.customPasscode),
            ),
          ],
        ),
      ),
    );
  }
}
