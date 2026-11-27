import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_notifier.dart';
import 'package:ttlock_flutter_demo/features/lift/presentation/provider/lift_state.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';

/// 梯控楼层激活页：楼层多选（1–30）+「激活」按钮。
/// 激活走 [LiftDomain.activateFloors]，远程优先、失败 BLE 回退并保鲜。
class LiftScreen extends ConsumerWidget {
  const LiftScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  /// 可激活楼层上限（SDK 梯控楼层号 1–30）。
  static const maxFloor = 30;

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
      final outcome = next.outcome;
      if (outcome != null && outcome != prev?.outcome) {
        final msg = switch (outcome) {
          LiftActivateOutcome.bleFallback => l10n.liftRemoteFailedBleFallback,
          LiftActivateOutcome.bleActivatedSyncFailed =>
            l10n.liftBleActivatedSyncFailed,
          LiftActivateOutcome.succeeded => l10n.liftActivateSuccess,
        };
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(msg)));
        ref.read(liftProvider.notifier).clearOutcome();
      }
    });

    final sorted = state.selectedFloors.toList()..sort();
    return Scaffold(
      appBar: AppBar(title: Text(l10n.liftTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l10n.liftFloorsHint),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var f = 1; f <= maxFloor; f++)
                FilterChip(
                  key: Key('floor_$f'),
                  label: Text('$f'),
                  selected: state.selectedFloors.contains(f),
                  onSelected: (_) =>
                      ref.read(liftProvider.notifier).toggleFloor(f),
                ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            key: const Key('lift_activate'),
            onPressed: state.operating || sorted.isEmpty
                ? null
                : () => ref
                      .read(liftProvider.notifier)
                      .activate(
                        lockId: lockId,
                        floors: sorted,
                        lockData: lock?.lockData ?? '',
                      ),
            icon: state.operating
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.directions_subway),
            label: Text(l10n.liftActivate),
          ),
        ],
      ),
    );
  }
}
