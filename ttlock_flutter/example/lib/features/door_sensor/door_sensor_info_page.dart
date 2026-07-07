import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/accessory_storage.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/error_display.dart';
import '../../features/settings/model/saved_door_sensor.dart';

class DoorSensorInfoPage extends HookConsumerWidget {
  final String mac;

  const DoorSensorInfoPage({super.key, required this.mac});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = useState<SavedDoorSensor?>(null);

    Future<void> reload() async {
      final all = await AccessoryStorage().loadDoorSensors();
      device.value = all.where((d) => d.mac == mac).firstOrNull;
    }

    useEffect(() {
      reload();
      return null;
    }, [mac]);

    Future<void> rename(SavedDoorSensor savedDevice) async {
      final ctrl = TextEditingController(text: savedDevice.name);
      final name = await showDialog<String>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Rename'),
          content: TextField(
              controller: ctrl,
              decoration: const InputDecoration(labelText: 'Name')),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx, ctrl.text),
                child: const Text('Save')),
          ],
        ),
      );
      if (name == null || name.isEmpty) return;
      await ref
          .read(doorSensorListNotifierProvider(savedDevice.boundLockMac).notifier)
          .updateDevice(savedDevice.copyWith(name: name));
      await reload();
    }

    Future<void> delete(SavedDoorSensor savedDevice) async {
      final ok = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Remove door sensor?'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Remove')),
          ],
        ),
      );
      if (ok != true || !context.mounted) return;
      await ref
          .read(doorSensorListNotifierProvider(savedDevice.boundLockMac).notifier)
          .remove(savedDevice.mac);
      if (context.mounted) Navigator.pop(context);
    }

    final savedDevice = device.value;
    if (savedDevice == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Door Sensor')),
        body: const ErrorDisplay(message: 'Device not found'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(savedDevice.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => rename(savedDevice),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading:
                  const Icon(Icons.sensors, color: AppColors.primary),
              title: Text(savedDevice.name, style: AppTextStyles.titleMedium),
              subtitle: Text(
                'MAC: ${savedDevice.mac}\nBound lock: ${savedDevice.boundLockMac}',
                style: AppTextStyles.bodySmall,
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => delete(savedDevice),
            icon: const Icon(Icons.delete_outline),
            label: const Text('Remove'),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
