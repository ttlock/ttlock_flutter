import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/palm_vein/presentation/provider/palm_vein_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_date_range_fields.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_validity_picker.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/recurring_schedule_field.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class PalmVeinAddScreen extends ConsumerStatefulWidget {
  const PalmVeinAddScreen({super.key, required this.lock});
  final LockEntity lock;

  @override
  ConsumerState<PalmVeinAddScreen> createState() => _PalmVeinAddScreenState();
}

class _PalmVeinAddScreenState extends ConsumerState<PalmVeinAddScreen> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = palmVeinAddProvider(widget.lock);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(provider.notifier).clearError();
      }
      if (next.succeeded && !(prev?.succeeded ?? false)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.palmVeinEnrollSuccess)));
        if (context.mounted) Navigator.of(context).pop(true);
      }
    });

    final inProgress = state.isRunning || state.isSubmitting;
    // BLE 已成功（palmVeinNumber 已存在）时锁定表单，重试只重提云端，
    // 避免改期后重复录掌。
    final formEnabled = !inProgress && state.palmVeinNumber == null;
    final showSpinner =
        state.isSubmitting ||
        (state.isRunning && state.phase != TTAddPalmVeinPhase.canStartAdd);

    return PopScope(
      canPop: !inProgress,
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.palmVein)),
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
                controller: _name,
                decoration: InputDecoration(labelText: l10n.palmVeinName),
                enabled: formEnabled,
              ),
              CredentialValidityPicker(
                value: state.kind,
                showCyclic: state.showCyclic,
                enabled: formEnabled,
                onChanged: (v) => ref.read(provider.notifier).setKind(v),
              ),
              CredentialDateRangeFields(
                kind: state.kind,
                start: state.startDate,
                end: state.endDate,
                enabled: formEnabled,
                onStart: (v) => ref.read(provider.notifier).setStartDate(v),
                onEnd: (v) => ref.read(provider.notifier).setEndDate(v),
              ),
              if (state.kind == CredentialValidityKind.cyclic)
                RecurringScheduleField(
                  value: state.schedule,
                  enabled: formEnabled,
                  onChanged: (v) => ref.read(provider.notifier).setSchedule(v),
                ),
              if (state.hint.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  state.hint,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: state.phase == TTAddPalmVeinPhase.error
                        ? Theme.of(context).colorScheme.error
                        : null,
                  ),
                ),
              ],
              if (showSpinner) ...[
                const SizedBox(height: 12),
                const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ],
              const SizedBox(height: 8),
              if (state.isRunning)
                OutlinedButton(
                  onPressed: () => ref.read(provider.notifier).cancel(),
                  child: Text(l10n.commonCancel),
                )
              else if (!state.isSubmitting)
                FilledButton(
                  onPressed: () =>
                      ref.read(provider.notifier).start(name: _name.text),
                  child: Text(
                    state.started && !state.succeeded
                        ? l10n.palmVeinLockRetryAdd
                        : l10n.startEnroll,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
