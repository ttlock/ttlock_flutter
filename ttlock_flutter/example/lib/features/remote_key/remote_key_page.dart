import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import 'remote_key_provider.dart';

class RemoteKeyPage extends ConsumerStatefulWidget {
  final String mac;
  final String lockData;

  const RemoteKeyPage({super.key, required this.mac, required this.lockData});

  @override
  ConsumerState<RemoteKeyPage> createState() => _RemoteKeyPageState();
}

class _RemoteKeyPageState extends ConsumerState<RemoteKeyPage> {
  final _slotCtrl = TextEditingController(text: '1');

  @override
  void dispose() {
    _slotCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(remoteKeyNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Remote Key ${widget.mac}')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.key, color: AppColors.primary),
                    title: Text('Remote Key', style: AppTextStyles.titleMedium),
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
                const SizedBox(height: 24),
                SectionHeader(title: 'Actions', icon: Icons.play_arrow),
                const SizedBox(height: 8),
                _ActionButton(
                  icon: Icons.power_settings_new,
                  label: 'Init Remote Key',
                  onTap: () => ref.read(remoteKeyNotifierProvider.notifier).initRemoteKey(widget.mac, widget.lockData),
                ),
                _ActionButton(
                  icon: Icons.list,
                  label: 'Get Stored Locks',
                  onTap: () => ref.read(remoteKeyNotifierProvider.notifier).getStoredLocks(widget.mac),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: _slotCtrl,
                        decoration: const InputDecoration(labelText: 'Slot #', isDense: true),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ActionButton(
                        icon: Icons.delete,
                        label: 'Delete Stored Lock',
                        onTap: () {
                          final slot = int.tryParse(_slotCtrl.text) ?? 1;
                          ref.read(remoteKeyNotifierProvider.notifier).deleteStoredLock(widget.mac, slot);
                        },
                      ),
                    ),
                  ],
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
