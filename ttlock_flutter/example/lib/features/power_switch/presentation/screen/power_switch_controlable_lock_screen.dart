import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/power_switch/presentation/provider/hotel_locks_for_power_switch.dart';
import 'package:ttlock_flutter_demo/features/power_switch/presentation/provider/power_switch_notifier.dart';
import 'package:ttlock_flutter_demo/features/power_switch/presentation/provider/power_switch_state.dart';

/// 取电关联门锁：从酒店锁列表（type=1）选一台，BLE 写入其 MAC。
class PowerSwitchControlableLockScreen extends ConsumerWidget {
  const PowerSwitchControlableLockScreen({
    super.key,
    required this.lockId,
    this.lock,
  });

  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(powerSwitchProvider);
    final hotels = ref.watch(hotelLocksForPowerSwitchProvider);

    ref.listen(powerSwitchProvider, (prev, next) {
      final err = next.error;
      if (err != null && err != prev?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(powerSwitchProvider.notifier).clearError();
      }
      final cfg = next.configOutcome;
      if (cfg == PowerSwitchConfigOutcome.controlableLockSaved &&
          cfg != prev?.configOutcome) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.powerSwitchControlableLockSuccess)),
        );
        ref.read(powerSwitchProvider.notifier).clearConfigOutcome();
        if (context.mounted) context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.powerSwitchControlableLock)),
      body: hotels.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.powerSwitchHotelLocksLoadFailed),
                const SizedBox(height: 12),
                FilledButton(
                  key: const Key('power_switch_hotel_locks_retry'),
                  onPressed: () =>
                      ref.invalidate(hotelLocksForPowerSwitchProvider),
                  child: Text(l10n.commonRetry),
                ),
              ],
            ),
          ),
        ),
        data: (list) {
          if (list.isEmpty) {
            return Center(child: Text(l10n.powerSwitchNoHotelLocks));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) {
              final hotel = list[i];
              final title = hotel.lockAlias.isNotEmpty
                  ? hotel.lockAlias
                  : hotel.lockName;
              return ListTile(
                key: Key('power_switch_hotel_$i'),
                enabled: !state.operating && hotel.lockMac.isNotEmpty,
                leading: const Icon(Icons.lock_outline),
                title: Text(title),
                subtitle: Text(hotel.lockMac),
                trailing: state.operating
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.chevron_right),
                onTap: state.operating || hotel.lockMac.isEmpty
                    ? null
                    : () => ref
                          .read(powerSwitchProvider.notifier)
                          .setControlableLock(
                            lockMac: hotel.lockMac,
                            lockData: lock?.lockData ?? '',
                          ),
              );
            },
          );
        },
      ),
    );
  }
}
