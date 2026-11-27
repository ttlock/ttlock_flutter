import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_notifier.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

/// 梯控工作模式：全部楼层 / 指定楼层（BLE 写，无读回）。
class LiftWorkModeScreen extends ConsumerStatefulWidget {
  const LiftWorkModeScreen({super.key, required this.lockId, this.lock});

  final int lockId;
  final LockEntity? lock;

  @override
  ConsumerState<LiftWorkModeScreen> createState() => _LiftWorkModeScreenState();
}

class _LiftWorkModeScreenState extends ConsumerState<LiftWorkModeScreen> {
  TTLiftWorkActivateType _type = TTLiftWorkActivateType.allFloors;

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(liftProvider);
    ref.listen(liftProvider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(liftProvider.notifier).clearError();
      }
      final cfg = next.configOutcome;
      if (cfg == LiftConfigOutcome.workModeSaved && cfg != prev?.configOutcome) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.liftWorkModeSuccess)),
        );
        ref.read(liftProvider.notifier).clearConfigOutcome();
        if (context.mounted) context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.liftWorkMode)),
      body: ListView(
        children: [
          RadioListTile<TTLiftWorkActivateType>(
            key: const Key('lift_work_mode_all'),
            title: Text(l10n.liftWorkModeAllFloors),
            subtitle: Text(l10n.liftWorkModeAllFloorsHint),
            value: TTLiftWorkActivateType.allFloors,
            groupValue: _type,
            onChanged: state.operating
                ? null
                : (v) {
                    if (v != null) setState(() => _type = v);
                  },
          ),
          RadioListTile<TTLiftWorkActivateType>(
            key: const Key('lift_work_mode_specific'),
            title: Text(l10n.liftWorkModeSpecificFloors),
            subtitle: Text(l10n.liftWorkModeSpecificFloorsHint),
            value: TTLiftWorkActivateType.specificFloors,
            groupValue: _type,
            onChanged: state.operating
                ? null
                : (v) {
                    if (v != null) setState(() => _type = v);
                  },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              key: const Key('lift_work_mode_save'),
              onPressed: state.operating
                  ? null
                  : () => ref
                        .read(liftProvider.notifier)
                        .setWorkMode(
                          type: _type,
                          lockData: widget.lock?.lockData ?? '',
                        ),
              child: state.operating
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.commonSave),
            ),
          ),
        ],
      ),
    );
  }
}
