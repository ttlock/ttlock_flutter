import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/data/exception_utils.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/domain/provider/wireless_keypad_domain.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/provider/wireless_keypad_list_notifier.dart';
import 'package:ttlock_flutter_demo/features/accessory/wireless_keypad/presentation/wireless_keypad_args.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';

class WirelessKeypadListScreen extends ConsumerWidget {
  const WirelessKeypadListScreen({super.key, required this.lockId, this.lock});
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = wirelessKeypadListProvider(lockId);
    final state = ref.watch(provider);
    final currentLock = lock ?? LockEntity(lockId: lockId);
    return Scaffold(
      key: const Key('wireless_keypad_list'),
      appBar: AppBar(title: Text(l10n.wirelessKeypad)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.addWirelessKeypad,
        onPressed: () async {
          final added = await _openAdd(context, ref, currentLock);
          if (added == true) {
            await ref.read(provider.notifier).refresh();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Text(
            getUserFriendlyMessage(
              ExceptionUtils.extractAppException(e, st),
              l10n,
            ),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return Center(child: Text(l10n.noWirelessKeypads));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(provider.notifier).refresh(),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) {
                final item = items[i];
                return ListTile(
                  key: Key('wireless_keypad_${item.wirelessKeypadId}'),
                  leading: const Icon(Icons.keyboard_alt_outlined),
                  title: Text(
                    item.wirelessKeypadName.isEmpty
                        ? item.wirelessKeypadNumber
                        : item.wirelessKeypadName,
                  ),
                  subtitle: Text(item.wirelessKeypadMac),
                  trailing: Text('${item.electricQuantity}%'),
                  onTap: () async {
                    await WirelessKeypadDetailRoute(
                      $extra: WirelessKeypadDetailArgs(
                        lock: currentLock,
                        item: item,
                      ),
                    ).push(context);
                    await ref.read(provider.notifier).refresh();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<bool?> _openAdd(
    BuildContext context,
    WidgetRef ref,
    LockEntity currentLock,
  ) async {
    final normal = currentLock.lockData.isEmpty
        ? false
        : await runBle(
            () => TTLock.lock.supportFunction(
              TTLockFunction.wirelessKeypad,
              currentLock.lockData,
            ),
          );
    final multi = currentLock.lockData.isEmpty
        ? false
        : await runBle(
            () => TTLock.lock.supportFunction(
              TTLockFunction.multiFunctionKeypad,
              currentLock.lockData,
            ),
          );
    if (!context.mounted) return null;
    if (normal && multi) {
      return WirelessKeypadAddTypeRoute(
        $extra: currentLock,
      ).push<bool>(context);
    }
    if (multi) {
      return WirelessKeypadAddRoute(
        $extra: WirelessKeypadAddArgs(
          lock: currentLock,
          type: WirelessKeypadType.multifunctional,
        ),
      ).push<bool>(context);
    }
    return WirelessKeypadAddRoute(
      $extra: WirelessKeypadAddArgs(
        lock: currentLock,
        type: WirelessKeypadType.normal,
      ),
    ).push<bool>(context);
  }
}
