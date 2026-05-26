import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/accessory_list_provider.dart';
import '../../core/storage/accessory_storage.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/section_header.dart';
import '../../features/settings/model/saved_door_sensor.dart';
import 'door_sensor_provider.dart';

class DoorSensorInfoPage extends ConsumerStatefulWidget {
  final String mac;

  const DoorSensorInfoPage({super.key, required this.mac});

  @override
  ConsumerState<DoorSensorInfoPage> createState() => _DoorSensorInfoPageState();
}

class _DoorSensorInfoPageState extends ConsumerState<DoorSensorInfoPage> {
  SavedDoorSensor? _device;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final all = await AccessoryStorage().loadDoorSensors();
    setState(() {
      _device = all.where((d) => d.mac == widget.mac).firstOrNull;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(doorSensorNotifierProvider);
    final device = _device;

    if (device == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Door Sensor')),
        body: const ErrorDisplay(message: 'Device not found'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _rename(device),
          ),
        ],
      ),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.sensors,
                        color: AppColors.primary),
                    title: Text(device.name, style: AppTextStyles.titleMedium),
                    subtitle: Text('MAC: ${device.mac}',
                        style: AppTextStyles.bodySmall),
                  ),
                ),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ErrorDisplay(message: state.error),
                  ),
                if (state.result != null) ...[
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(state.result!,
                          style: AppTextStyles.codeMedium),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                const SectionHeader(title: 'Settings', icon: Icons.settings),
                ListTile(
                  title: const Text('Read feature value'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => ref
                      .read(doorSensorNotifierProvider.notifier)
                      .readFeatureValue(device.mac),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => _delete(device),
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

  Future<void> _rename(SavedDoorSensor device) async {
    final ctrl = TextEditingController(text: device.name);
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
        .read(doorSensorListNotifierProvider(device.boundLockMac).notifier)
        .updateDevice(device.copyWith(name: name));
    await _load();
  }

  Future<void> _delete(SavedDoorSensor device) async {
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
    if (ok != true || !mounted) return;
    await ref
        .read(doorSensorListNotifierProvider(device.boundLockMac).notifier)
        .remove(device.mac);
    if (mounted) Navigator.pop(context);
  }
}
