import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/router/routes.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/device_card.dart';
import '../../core/widgets/error_display.dart';
import '../../features/scan/scan_config.dart';

class DoorSensorListPage extends ConsumerWidget {
  final String lockMac;

  const DoorSensorListPage({super.key, required this.lockMac});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));
    final sensorsAsync = ref.watch(doorSensorListNotifierProvider(lockMac));

    return Scaffold(
      appBar: AppBar(
        title: lockAsync.when(
          data: (lock) => Text(lock?.name ?? 'Door Sensors'),
          loading: () => const Text('Door Sensors'),
          error: (_, __) => const Text('Door Sensors'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final lock = await ref.read(lockByMacProvider(lockMac).future);
              if (lock == null || !context.mounted) return;
              ScanRoute(
                type: DeviceType.doorSensor.name,
                lockData: lock.lockData,
                lockMac: lockMac,
              ).push(context);
            },
          ),
        ],
      ),
      body: sensorsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorDisplay(message: e.toString()),
        data: (sensors) {
          if (sensors.isEmpty) {
            return Center(
              child: Text(
                'No door sensors yet.\nTap + to add one.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            itemCount: sensors.length,
            itemBuilder: (_, i) {
              final s = sensors[i];
              return DeviceCard(
                title: s.name,
                mac: s.mac,
                icon: Icons.sensors,
                isOnline: true,
                onTap: () => DoorSensorInfoRoute(s.mac).push(context),
              );
            },
          );
        },
      ),
    );
  }
}
