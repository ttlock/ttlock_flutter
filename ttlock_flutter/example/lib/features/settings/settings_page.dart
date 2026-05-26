import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/env/app_mode.dart';
import '../../core/storage/config_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'model/config_model.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configAsync = ref.watch(configNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: configAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (config) => _SettingsForm(config: config),
      ),
    );
  }
}

class _SettingsForm extends ConsumerStatefulWidget {
  final ConfigModel config;
  const _SettingsForm({required this.config});

  @override
  ConsumerState<_SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends ConsumerState<_SettingsForm> {
  late final _uidCtrl = TextEditingController(text: widget.config.uid > 0 ? '${widget.config.uid}' : '');
  late final _ipCtrl = TextEditingController(text: widget.config.serverIp ?? '');
  late final _portCtrl = TextEditingController(text: widget.config.serverPort ?? '');
  late final _nameCtrl = TextEditingController(text: widget.config.gatewayName);
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _uidCtrl.dispose();
    _ipCtrl.dispose();
    _portCtrl.dispose();
    _nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final config = ConfigModel(
      uid: int.tryParse(_uidCtrl.text) ?? 0,
      serverIp: AppEnv.isOnPremise ? _ipCtrl.text : null,
      serverPort: AppEnv.isOnPremise ? _portCtrl.text : null,
      gatewayName: _nameCtrl.text,
    );
    await ref.read(configNotifierProvider.notifier).save(config);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Configuration saved')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppEnv.isOnPremise ? AppColors.warning.withValues(alpha: 0.1) : AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(AppEnv.isOnPremise ? Icons.dns : Icons.cloud, color: AppEnv.isOnPremise ? AppColors.warning : AppColors.primary),
                const SizedBox(width: 8),
                Text('Mode: ${AppEnv.isOnPremise ? "On-Premise" : "Online"}', style: AppTextStyles.labelLarge),
              ],
            ),
          ),
          const SizedBox(height: 24),
          if (AppEnv.isOnline) ...[
            TextFormField(
              controller: _uidCtrl,
              decoration: const InputDecoration(labelText: 'UID', hintText: 'Enter your TTLock user ID'),
              keyboardType: TextInputType.number,
              validator: (v) => (v == null || v.isEmpty) ? 'UID is required' : null,
            ),
          ] else ...[
            TextFormField(
              controller: _ipCtrl,
              decoration: const InputDecoration(labelText: 'Server IP', hintText: 'e.g. 192.168.1.100'),
              validator: (v) => (v == null || v.isEmpty) ? 'Server IP is required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _portCtrl,
              decoration: const InputDecoration(labelText: 'Server Port', hintText: 'e.g. 2229'),
              keyboardType: TextInputType.number,
              validator: (v) => (v == null || v.isEmpty) ? 'Server Port is required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _uidCtrl,
              decoration: const InputDecoration(labelText: 'UID (optional)', hintText: 'Enter your TTLock user ID'),
              keyboardType: TextInputType.number,
            ),
          ],
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameCtrl,
            decoration: const InputDecoration(labelText: 'Gateway Name', hintText: 'e.g. Gateway No 1'),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _save,
            child: const Text('Save Configuration'),
          ),
        ],
      ),
    );
  }
}
