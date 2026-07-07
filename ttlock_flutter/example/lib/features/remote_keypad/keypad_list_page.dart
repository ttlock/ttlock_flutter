import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/routes.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/async_value_view.dart';
import '../../core/widgets/device_card.dart';
import '../../features/scan/scan_config.dart';

Future<void> openAddKeypadScan(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
) async {
  final lock = await ref.read(lockByMacProvider(lockMac).future);
  if (lock == null || !context.mounted) return;
  ScanRoute(
    type: DeviceType.keypad.name,
    lockData: lock.lockData,
    lockMac: lockMac,
  ).push(context);
}

class KeypadListPage extends HookConsumerWidget {
  const KeypadListPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final keypadsAsync = ref.watch(keypadListNotifierProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (lock) => Text(lock?.name ?? 'Keypads'),
          loading: () => const Text('Keypads'),
          error: (_, __) => const Text('Keypads'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => openAddKeypadScan(context, ref, lockMac),
          ),
        ],
      ),
      body: AsyncValueView.when(
        value: keypadsAsync,
        onRetry: (_, __) => ref.invalidate(keypadListNotifierProvider(lockMac)),
        data: (keypads) {
          if (keypads.isEmpty) {
            return Center(
              child: Text(
                'No keypads yet.\nTap + to add one.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            itemCount: keypads.length,
            itemBuilder: (_, i) {
              final k = keypads[i];
              return DeviceCard(
                title: k.name,
                mac: k.mac,
                icon: Icons.keyboard,
                isOnline: true,
                onTap: () => KeypadInfoRoute(k.mac).push(context),
              );
            },
          );
        },
      ),
    );
  }
}
