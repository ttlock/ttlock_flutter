import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_notifier.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_state.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/screen/lift_screen.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

/// 梯控关联楼层：告知设备可控制哪些楼层（BLE 写，无读回）。
class LiftControlableFloorsScreen extends ConsumerWidget {
  const LiftControlableFloorsScreen({
    super.key,
    required this.lockId,
    this.lock,
  });

  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      if (cfg == LiftConfigOutcome.controlableFloorsSaved &&
          cfg != prev?.configOutcome) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.liftControlableFloorsSuccess)),
        );
        ref.read(liftProvider.notifier).clearConfigOutcome();
        if (context.mounted) context.pop();
      }
    });

    final sorted = state.selectedFloors.toList()..sort();
    return Scaffold(
      appBar: AppBar(title: Text(l10n.liftControlableFloors)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l10n.liftControlableFloorsHint),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var f = 1; f <= LiftScreen.maxFloor; f++)
                FilterChip(
                  key: Key('controlable_floor_$f'),
                  label: Text('$f'),
                  selected: state.selectedFloors.contains(f),
                  onSelected: state.operating
                      ? null
                      : (_) => ref.read(liftProvider.notifier).toggleFloor(f),
                ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            key: const Key('lift_controlable_save'),
            onPressed: state.operating || sorted.isEmpty
                ? null
                : () => ref
                      .read(liftProvider.notifier)
                      .setControlableFloors(
                        floors: sorted,
                        lockData: lock?.lockData ?? '',
                      ),
            icon: state.operating
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save_outlined),
            label: Text(l10n.commonSave),
          ),
        ],
      ),
    );
  }
}
