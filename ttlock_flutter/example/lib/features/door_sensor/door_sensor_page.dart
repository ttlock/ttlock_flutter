import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import 'door_sensor_provider.dart';

class DoorSensorPage extends ConsumerStatefulWidget {
  final String mac;
  final String? lockData;

  const DoorSensorPage({super.key, required this.mac, this.lockData});

  @override
  ConsumerState<DoorSensorPage> createState() => _DoorSensorPageState();
}

class _DoorSensorPageState extends ConsumerState<DoorSensorPage> {
  final _funcCtrl = TextEditingController(text: '1');

  @override
  void dispose() {
    _funcCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(doorSensorNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Door Sensor ${widget.mac}')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // ── Device Info Card ──
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.sensors,
                        color: AppColors.primary),
                    title: Text('Door Sensor',
                        style: AppTextStyles.titleMedium),
                    subtitle: Text('MAC: ${widget.mac}',
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

                // ── Operation Area ──
                const SizedBox(height: 24),
                SectionHeader(title: 'Operations', icon: Icons.play_arrow),
                const SizedBox(height: 8),
                if (widget.lockData != null)
                  _ActionButton(
                    icon: Icons.link,
                    label: 'Init Door Sensor (with lock)',
                    onTap: () => ref
                        .read(doorSensorNotifierProvider.notifier)
                        .initDoorSensor(widget.mac, widget.lockData!),
                  ),
                _ActionButton(
                  icon: Icons.power_settings_new,
                  label: 'Init Standalone',
                  onTap: () => ref
                      .read(doorSensorNotifierProvider.notifier)
                      .initStandalone(widget.mac, {'type': 0}),
                ),
                _ActionButton(
                  icon: Icons.info_outline,
                  label: 'Read Feature Value',
                  onTap: () => ref
                      .read(doorSensorNotifierProvider.notifier)
                      .readFeatureValue(widget.mac),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: _funcCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Function #', isDense: true),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ActionButton(
                        icon: Icons.check_circle_outline,
                        label: 'Check Support',
                        onTap: () {
                          ref
                              .read(doorSensorNotifierProvider.notifier)
                              .checkSupport(
                                widget.mac,
                                '',
                                int.tryParse(_funcCtrl.text) ?? 1,
                              );
                        },
                      ),
                    ),
                  ],
                ),

                // ── Danger Zone ──
                const SizedBox(height: 24),
                const SectionHeader(
                  title: 'Danger Zone',
                  icon: Icons.warning_amber_rounded,
                ),
                const SizedBox(height: 8),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: const Icon(Icons.delete_forever,
                        color: AppColors.error),
                    title: Text('Delete device',
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: AppColors.error)),
                    trailing: const Icon(Icons.chevron_right,
                        size: 18, color: AppColors.error),
                    onTap: () => _deleteDevice(),
                    dense: true,
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> _deleteDevice() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove door sensor?'),
        content: const Text('This cannot be undone.'),
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
    if (ok == true && mounted) {
      Navigator.pop(context);
    }
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton(
      {required this.icon, required this.label, required this.onTap});

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
