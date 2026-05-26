import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/router/routes.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/device_card.dart';
import '../../core/widgets/error_display.dart';
import '../../features/scan/scan_config.dart';

class KeypadListPage extends ConsumerWidget {
  final String lockMac;

  const KeypadListPage({super.key, required this.lockMac});

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
            onPressed: () async {
              final lock = await ref.read(lockByMacProvider(lockMac).future);
              if (lock == null || !context.mounted) return;
              ScanRoute(
                type: DeviceType.keypad.name,
                lockData: lock.lockData,
                lockMac: lockMac,
              ).push(context);
            },
          ),
        ],
      ),
      body: keypadsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorDisplay(message: e.toString()),
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
