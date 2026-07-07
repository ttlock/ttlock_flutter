import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../core/storage/standalone_door_sensor_list_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/section_header.dart';
import '../../features/settings/model/saved_standalone_door_sensor.dart';
import 'standalone_door_sensor_provider.dart';

class StandaloneDoorSensorInfoPage extends HookConsumerWidget {
  final String mac;

  const StandaloneDoorSensorInfoPage({super.key, required this.mac});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final funcCtrl = useTextEditingController(text: '1');
    final deviceAsync = ref.watch(standaloneDoorSensorListNotifierProvider);
    final state = ref.watch(standaloneDoorSensorNotifierProvider);

    final device = deviceAsync.valueOrNull
        ?.where((d) => d.mac == mac)
        .firstOrNull;

    Future<void> rename(SavedStandaloneDoorSensor savedDevice) async {
      final ctrl = TextEditingController(text: savedDevice.name);
      final name = await showDialog<String>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Rename'),
          content: TextField(
            controller: ctrl,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, ctrl.text),
              child: const Text('Save'),
            ),
          ],
        ),
      );
      if (name == null || name.isEmpty) return;
      await ref
          .read(standaloneDoorSensorListNotifierProvider.notifier)
          .updateDevice(savedDevice.copyWith(name: name));
    }

    Future<void> delete(SavedStandaloneDoorSensor savedDevice) async {
      final ok = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Remove standalone door sensor?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Remove'),
            ),
          ],
        ),
      );
      if (ok != true || !context.mounted) return;
      await ref
          .read(standaloneDoorSensorListNotifierProvider.notifier)
          .removeDevice(savedDevice.mac);
      if (context.mounted) Navigator.pop(context);
    }

    if (device == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Standalone Door Sensor')),
        body: const ErrorDisplay(message: 'Device not found'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => rename(device),
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
                    leading: const Icon(Icons.sensors, color: AppColors.primary),
                    title: Text(device.name, style: AppTextStyles.titleMedium),
                    subtitle: Text(
                      [
                        'MAC: ${device.mac}',
                        if (device.modelNum != null) 'Model: ${device.modelNum}',
                        if (device.electricQuantity != null)
                          'Battery: ${device.electricQuantity}%',
                      ].join('\n'),
                      style: AppTextStyles.bodySmall,
                    ),
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
                      child: Text(state.result!, style: AppTextStyles.codeMedium),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                const SectionHeader(title: 'Operations', icon: Icons.play_arrow),
                _ActionButton(
                  icon: Icons.info_outline,
                  label: 'Read Feature Value',
                  onTap: () => ref
                      .read(standaloneDoorSensorNotifierProvider.notifier)
                      .readFeatureValue(device.mac),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: funcCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Function #',
                          isDense: true,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ActionButton(
                        icon: Icons.check_circle_outline,
                        label: 'Check Support',
                        onTap: () {
                          final index = int.tryParse(funcCtrl.text) ?? 1;
                          final function = index >= 0 &&
                                  index <
                                      TTStandaloneDoorSensorFeature.values.length
                              ? TTStandaloneDoorSensorFeature.values[index]
                              : TTStandaloneDoorSensorFeature.wifi5G;
                          ref
                              .read(standaloneDoorSensorNotifierProvider.notifier)
                              .checkSupport(
                                device.featureValue ?? '',
                                function,
                              );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => delete(device),
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

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(label, style: AppTextStyles.bodyMedium),
        trailing: const Icon(Icons.chevron_right, size: 18),
        onTap: onTap,
        dense: true,
      ),
    );
  }
}
