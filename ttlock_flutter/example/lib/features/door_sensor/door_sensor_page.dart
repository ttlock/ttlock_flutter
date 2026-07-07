import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import 'door_sensor_provider.dart';

/// 挂锁门磁详情页（需绑定 lockData 初始化）。
class DoorSensorPage extends HookConsumerWidget {
  final String mac;
  final String lockData;

  const DoorSensorPage({super.key, required this.mac, required this.lockData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(doorSensorNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Door Sensor $mac')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.sensors,
                        color: AppColors.primary),
                    title: Text('Door Sensor',
                        style: AppTextStyles.titleMedium),
                    subtitle: Text('MAC: $mac',
                        style: AppTextStyles.bodySmall),
                  ),
                ),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ErrorDisplay(message: state.error),
                  ),
                if (state.result != null) ...[
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(state.result!,
                          style: AppTextStyles.codeMedium),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                SectionHeader(title: 'Operations', icon: Icons.play_arrow),
                const SizedBox(height: 8),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: const Icon(Icons.link, color: AppColors.primary),
                    title: Text('Init Door Sensor (with lock)',
                        style: AppTextStyles.bodyMedium),
                    trailing: const Icon(Icons.chevron_right, size: 18),
                    onTap: () => ref
                        .read(doorSensorNotifierProvider.notifier)
                        .initDoorSensor(mac, lockData),
                    dense: true,
                  ),
                ),
              ],
            ),
    );
  }
}
