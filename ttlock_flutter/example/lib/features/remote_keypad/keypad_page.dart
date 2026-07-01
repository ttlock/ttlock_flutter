import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import 'keypad_provider.dart';

class KeypadPage extends ConsumerStatefulWidget {
  final String mac;
  final String lockData;
  final String lockMac;
  final bool? isMultifunctional;

  const KeypadPage({
    super.key,
    required this.mac,
    required this.lockData,
    required this.lockMac,
    this.isMultifunctional,
  });

  @override
  ConsumerState<KeypadPage> createState() => _KeypadPageState();
}

class _KeypadPageState extends ConsumerState<KeypadPage> {
  final _slotCtrl = TextEditingController(text: '1');

  @override
  void dispose() {
    _slotCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(keypadNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Keypad ${widget.mac}')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // ── Device Info Card ──
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.keyboard,
                        color: AppColors.primary),
                    title: Row(
                      children: [
                        Text('Wireless Keypad',
                            style: AppTextStyles.titleMedium),
                        if (widget.isMultifunctional == true) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.warning.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text('Multifunctional',
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.warning,
                                )),
                          ),
                        ],
                      ],
                    ),
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
                _ActionButton(
                  icon: Icons.power_settings_new,
                  label: 'Init Keypad',
                  onTap: () => ref
                      .read(keypadNotifierProvider.notifier)
                      .initKeypad(widget.mac, widget.lockMac),
                ),
                _ActionButton(
                  icon: Icons.settings,
                  label: 'Init Multifunctional Keypad',
                  onTap: () => ref
                      .read(keypadNotifierProvider.notifier)
                      .initMultifunctional(widget.mac, widget.lockData),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: _slotCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Slot #', isDense: true),
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
                          ref
                              .read(keypadNotifierProvider.notifier)
                              .deleteStoredLock(widget.mac, slot);
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
        title: const Text('Remove keypad?'),
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
