import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_add_notifier.dart';
import 'package:ttlock_flutter_demo/features/credentials/card/presentation/provider/card_add_state.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/domain/credential_validity.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_date_range_fields.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/credential_validity_picker.dart';
import 'package:ttlock_flutter_demo/features/credentials/shared/presentation/recurring_schedule_field.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

class CardAddScreen extends ConsumerStatefulWidget {
  const CardAddScreen({super.key, required this.lock, this.keypadMac});
  final LockEntity lock;
  final String? keypadMac;

  @override
  ConsumerState<CardAddScreen> createState() => _CardAddScreenState();
}

class _CardAddScreenState extends ConsumerState<CardAddScreen> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final provider = cardAddProvider(
      CardAddArgs(lock: widget.lock, keypadMac: widget.keypadMac),
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
    final showHint = state.waiting || state.showCancelHint;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.icCard)),
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
            if (widget.keypadMac != null) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  l10n.keypadCardEnrollHint,
                  key: const Key('card_keypad_enroll_hint'),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
            TextField(
              controller: _name,
              decoration: InputDecoration(labelText: l10n.cardName),
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
            if (showHint) ...[
              const SizedBox(height: 8),
              if (state.waiting) Text(l10n.waitingTapCard),
              if (state.waiting) const SizedBox(height: 8),
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
                      l10n.cardPendingRegister,
                      key: const Key('card_pending_register'),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      key: const Key('card_pending_register_retry'),
                      // 重试成功 == 云端也登记上了，与下面主按钮的成功路径一样关页
                      // 回传 true：否则用户停在表单上，返回时列表收不到 true，这张
                      // 已经登记的卡要手动下拉才看得到。
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
                // 待登记时禁用主按钮：锁里那张卡还没进云端，这里再录一张会
                // 顶掉待登记编号。恢复入口是上面的重试按钮。
                onPressed: state.pendingRegister
                    ? null
                    : () async {
                        final ok = await ref
                            .read(provider.notifier)
                            .start(cardName: _name.text);
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
