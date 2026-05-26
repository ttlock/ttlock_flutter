import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import 'water_meter_provider.dart';

class WaterMeterPage extends ConsumerStatefulWidget {
  final String mac;
  final String? meterId;

  const WaterMeterPage({super.key, required this.mac, this.meterId});

  @override
  ConsumerState<WaterMeterPage> createState() => _WaterMeterPageState();
}

class _WaterMeterPageState extends ConsumerState<WaterMeterPage> {
  final _idCtrl = TextEditingController();
  final _amountCtrl = TextEditingController(text: '10.0');

  @override
  void initState() {
    super.initState();
    if (widget.meterId != null) {
      _idCtrl.text = widget.meterId!;
    }
  }

  @override
  void dispose() {
    _idCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(waterMeterNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Water Meter')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.water_drop, color: AppColors.primary),
                    title: Text('Water Meter', style: AppTextStyles.titleMedium),
                    subtitle: Text('MAC: ${widget.mac}', style: AppTextStyles.bodySmall),
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
                      child: Text(state.result!, style: AppTextStyles.codeMedium),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                TextField(
                  controller: _idCtrl,
                  decoration: const InputDecoration(labelText: 'Meter ID', hintText: 'Water meter ID'),
                ),
                const SizedBox(height: 24),
                SectionHeader(title: 'Lifecycle', icon: Icons.repeat),
                const SizedBox(height: 8),
                _ActionButton(icon: Icons.settings_ethernet, label: 'Config Server', onTap: () => ref.read(waterMeterNotifierProvider.notifier).configServer('https://example.com', 'client', 'token')),
                _ActionButton(icon: Icons.bluetooth_connected, label: 'Connect', onTap: () => ref.read(waterMeterNotifierProvider.notifier).connect(widget.mac)),
                _ActionButton(icon: Icons.start, label: 'Init', onTap: () => ref.read(waterMeterNotifierProvider.notifier).init({'mac': widget.mac})),
                _ActionButton(icon: Icons.bluetooth_disabled, label: 'Disconnect', onTap: () => ref.read(waterMeterNotifierProvider.notifier).disconnect(widget.mac)),
                const SizedBox(height: 24),
                SectionHeader(title: 'Operations', icon: Icons.tune),
                const SizedBox(height: 8),
                _ActionButton(icon: Icons.visibility, label: 'Read Data', onTap: () => ref.read(waterMeterNotifierProvider.notifier).readData(_idCtrl.text)),
                _ActionButton(icon: Icons.power_settings_new, label: 'Power ON', onTap: () => ref.read(waterMeterNotifierProvider.notifier).setPowerOnOff(_idCtrl.text, true)),
                _ActionButton(icon: Icons.power_off, label: 'Power OFF', onTap: () => ref.read(waterMeterNotifierProvider.notifier).setPowerOnOff(_idCtrl.text, false)),
                _ActionButton(icon: Icons.payment, label: 'Set Pay Mode (0)', onTap: () => ref.read(waterMeterNotifierProvider.notifier).setPayMode(_idCtrl.text, 0)),
                _ActionButton(icon: Icons.monetization_on, label: 'Charge 10.0', onTap: () => ref.read(waterMeterNotifierProvider.notifier).charge(_idCtrl.text, 10.0)),
                _ActionButton(icon: Icons.info_outline, label: 'Get Feature Value', onTap: () => ref.read(waterMeterNotifierProvider.notifier).getFeatureValue(_idCtrl.text)),
                _ActionButton(icon: Icons.devices, label: 'Get Device Info', onTap: () => ref.read(waterMeterNotifierProvider.notifier).getDeviceInfo(_idCtrl.text)),
                const SizedBox(height: 24),
                SectionHeader(title: 'Danger Zone', icon: Icons.warning, trailing: null),
                const SizedBox(height: 8),
                _ActionButton(icon: Icons.restart_alt, label: 'Reset', onTap: () => ref.read(waterMeterNotifierProvider.notifier).reset(_idCtrl.text)),
                _ActionButton(icon: Icons.delete_forever, label: 'Delete', onTap: () => ref.read(waterMeterNotifierProvider.notifier).delete(_idCtrl.text)),
              ],
            ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({required this.icon, required this.label, required this.onTap});

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
