import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/domain/entity/keyboard_pwd.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/passcode_period.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_get_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/passcode/presentation/provider/passcode_get_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class PasscodeGetScreen extends ConsumerStatefulWidget {
  const PasscodeGetScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<PasscodeGetScreen> createState() => _PasscodeGetScreenState();
}

class _PasscodeGetScreenState extends ConsumerState<PasscodeGetScreen> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = passcodeGetProvider(widget.lock);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        final msg = err.message == 'invalid_cyclic_window'
            ? '${l10n.startTimeOfDay} / ${l10n.endTimeOfDay}'
            : err.message == 'invalid_period'
            ? l10n.validityPeriod
            : getUserFriendlyMessage(err, l10n);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(msg)));
        ref.read(provider.notifier).clearError();
      }
    });
    return Scaffold(
      appBar: AppBar(title: Text(l10n.getPasscode)),
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
              SelectableText(
                state.result!.keyboardPwd,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ListTile(
                leading: const Icon(Icons.copy),
                title: Text(l10n.copyPasscode),
                onTap: () async {
                  await Clipboard.setData(
                    ClipboardData(text: state.result!.keyboardPwd),
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(l10n.linkCopied)));
                },
              ),
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
              RadioGroup<PasscodeGetKind>(
                groupValue: state.kind,
                onChanged: (v) => ref.read(provider.notifier).setKind(v!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RadioListTile<PasscodeGetKind>(
                      title: Text(l10n.permanent),
                      value: PasscodeGetKind.permanent,
                      enabled: !state.submitting,
                    ),
                    RadioListTile<PasscodeGetKind>(
                      title: Text(l10n.limited),
                      value: PasscodeGetKind.limited,
                      enabled: !state.submitting,
                    ),
                    RadioListTile<PasscodeGetKind>(
                      title: Text(l10n.once),
                      value: PasscodeGetKind.once,
                      enabled: !state.submitting,
                    ),
                    if (state.showCyclic)
                      RadioListTile<PasscodeGetKind>(
                        title: Text(l10n.recurring),
                        value: PasscodeGetKind.cyclic,
                        enabled: !state.submitting,
                      ),
                  ],
                ),
              ),
              if (state.kind == PasscodeGetKind.limited ||
                  state.kind == PasscodeGetKind.once) ...[
                ListTile(
                  title: Text(l10n.startDate),
                  subtitle: Text(
                    state.startDate?.toLocal().toString().substring(0, 16) ??
                        '',
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
                                DateTime.now().add(const Duration(days: 1)),
                          );
                          if (picked != null) {
                            ref.read(provider.notifier).setEndDate(picked);
                          }
                        },
                ),
              ],
              if (state.kind == PasscodeGetKind.cyclic) ...[
                ListTile(
                  title: Text(l10n.startTimeOfDay),
                  subtitle: Text(formatMinutesOfDay(state.startMinutes)),
                  onTap: state.submitting
                      ? null
                      : () async {
                          final m = await pickHourMinutes(
                            context,
                            state.startMinutes,
                          );
                          if (m != null) {
                            ref.read(provider.notifier).setStartMinutes(m);
                          }
                        },
                ),
                ListTile(
                  title: Text(l10n.endTimeOfDay),
                  subtitle: Text(formatMinutesOfDay(state.endMinutes)),
                  onTap: state.submitting
                      ? null
                      : () async {
                          final m = await pickHourMinutes(
                            context,
                            state.endMinutes,
                          );
                          if (m != null) {
                            ref.read(provider.notifier).setEndMinutes(m);
                          }
                        },
                ),
                Text(l10n.recurringMode),
                RadioGroup<KeyboardPwdType>(
                  groupValue: state.cyclicType,
                  onChanged: (v) =>
                      ref.read(provider.notifier).setCyclicType(v!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final t in cyclicPasscodePickerOrder)
                        RadioListTile<KeyboardPwdType>(
                          title: Text(formatPasscodeType(t, l10n)),
                          value: t,
                          enabled: !state.submitting,
                        ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 8),
              FilledButton(
                onPressed: state.submitting
                    ? null
                    : () => ref
                          .read(provider.notifier)
                          .submit(keyboardPwdName: _name.text),
                child: state.submitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(l10n.getPasscode),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
