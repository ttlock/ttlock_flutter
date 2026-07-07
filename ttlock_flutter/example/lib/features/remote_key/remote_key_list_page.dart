import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/routes.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/async_value_view.dart';
import '../../core/widgets/device_card.dart';
import '../../features/scan/scan_config.dart';

Future<void> openAddRemoteKeyScan(
  BuildContext context,
  WidgetRef ref,
  String lockMac,
) async {
  final lock = await ref.read(lockByMacProvider(lockMac).future);
  if (lock == null || !context.mounted) return;
  ScanRoute(
    type: DeviceType.remoteKey.name,
    lockData: lock.lockData,
    lockMac: lockMac,
  ).push(context);
}

class RemoteKeyListPage extends HookConsumerWidget {
  const RemoteKeyListPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final keysAsync = ref.watch(remoteKeyListNotifierProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (lock) => Text(lock?.name ?? 'Remote Keys'),
          loading: () => const Text('Remote Keys'),
          error: (_, __) => const Text('Remote Keys'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => openAddRemoteKeyScan(context, ref, lockMac),
          ),
        ],
      ),
      body: AsyncValueView.when(
        value: keysAsync,
        onRetry: (_, __) => ref.invalidate(remoteKeyListNotifierProvider(lockMac)),
        data: (keys) {
          if (keys.isEmpty) {
            return Center(
              child: Text(
                'No remote keys yet.\nTap + to add one.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            itemCount: keys.length,
            itemBuilder: (_, i) {
              final k = keys[i];
              return DeviceCard(
                title: k.name,
                mac: k.mac,
                icon: Icons.key,
                isOnline: true,
                onTap: () => RemoteKeyInfoRoute(k.mac).push(context),
              );
            },
          );
        },
      ),
    );
  }
}
