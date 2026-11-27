import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/provider/fingerprint_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/fingerprint/presentation/provider/fingerprint_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_date_range_fields.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_validity_picker.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/recurring_schedule_field.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class FingerprintAddScreen extends ConsumerStatefulWidget {
  const FingerprintAddScreen({super.key, required this.lock, this.keypadMac});
  final LockEntity lock;
  final String? keypadMac;

  @override
  ConsumerState<FingerprintAddScreen> createState() =>
      _FingerprintAddScreenState();
}

class _FingerprintAddScreenState extends ConsumerState<FingerprintAddScreen> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = fingerprintAddProvider(
      FingerprintAddArgs(lock: widget.lock, keypadMac: widget.keypadMac),
    );
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
    final showHint = state.waiting || state.collecting || state.showCancelHint;
    final current = state.currentCount;
    final total = state.totalCount;
    // 键盘：0/0 = 待激活；有真实 total 后才是正式录入进度。0/0 之前不展示提示。
    final keypadActivating = widget.keypadMac != null &&
        state.enrolling &&
        current == 0 &&
        total == 0;
    final showCollectingProgress =
        current != null && total != null && total > 0 && state.collecting;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.fingerprint)),
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
              decoration: InputDecoration(labelText: l10n.fingerprintName),
              enabled: !state.enrolling,
            ),
            CredentialValidityPicker(
              value: state.kind,
              showCyclic: state.showCyclic,
              enabled: !state.enrolling,
              onChanged: (v) => ref.read(provider.notifier).setKind(v),
            ),
            CredentialDateRangeFields(
              kind: state.kind,
              start: state.startDate,
              end: state.endDate,
              enabled: !state.enrolling,
              onStart: (v) => ref.read(provider.notifier).setStartDate(v),
              onEnd: (v) => ref.read(provider.notifier).setEndDate(v),
            ),
            if (state.kind == CredentialValidityKind.cyclic)
              RecurringScheduleField(
                value: state.schedule,
                enabled: !state.enrolling,
                onChanged: (v) => ref.read(provider.notifier).setSchedule(v),
              ),
            if (keypadActivating) ...[
              const SizedBox(height: 8),
              Text(
                l10n.keypadFingerprintEnrollHint,
                key: const Key('fingerprint_keypad_enroll_hint'),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ] else if (showCollectingProgress) ...[
              const SizedBox(height: 8),
              Text(
                l10n.collectingFingerprint(current, total),
              ),
            ],
            if (showHint) ...[
              const SizedBox(height: 8),
              Text(l10n.enrollCancelHint),
            ],
            const SizedBox(height: 8),
            if (state.pendingRegister) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.fingerprintPendingRegister,
                      key: const Key('fingerprint_pending_register'),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      key: const Key('fingerprint_pending_register_retry'),
                      // 重试成功 == 云端也登记上了，与下面主按钮的成功路径一样关页
                      // 回传 true：否则用户停在表单上，返回时列表收不到 true，这枚
                      // 已经登记的指纹要手动下拉才看得到。
                      onPressed: state.enrolling
                          ? null
                          : () async {
                              final ok = await ref
                                  .read(provider.notifier)
                                  .retryRegister();
                              if (ok && context.mounted) {
                                Navigator.of(context).pop(true);
                              }
                            },
                      child: Text(l10n.pendingRegisterRetry),
                    ),
                  ],
                ),
              ),
            ],
            if (state.enrolling)
              OutlinedButton(
                onPressed: () => ref.read(provider.notifier).cancel(),
                child: Text(l10n.commonCancel),
              )
            else
              FilledButton(
                // 待登记时禁用主按钮：锁里那枚指纹还没进云端，这里再录一枚会
                // 顶掉待登记编号。恢复入口是上面的重试按钮。
                onPressed: state.pendingRegister
                    ? null
                    : () async {
                        final ok = await ref
                            .read(provider.notifier)
                            .start(fingerprintName: _name.text);
                        if (ok && context.mounted) {
                          Navigator.of(context).pop(true);
                        }
                      },
                child: Text(l10n.startEnroll),
              ),
            if (state.enrolling)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
