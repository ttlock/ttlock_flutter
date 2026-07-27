import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/env/app_mode.dart';
import '../../core/storage/config_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/async_value_view.dart';
import 'model/config_model.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configAsync = ref.watch(configNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: configAsync.when(
        loading: () => AsyncValueView.loading(),
        error: (e, _) => AsyncValueView.error(
          message: '$e',
          onRetry: () => ref.invalidate(configNotifierProvider),
        ),
        data: (config) => _SettingsBody(config: config),
      ),
    );
  }
}

class _SettingsBody extends HookConsumerWidget {
  final ConfigModel config;
  const _SettingsBody({required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uidCtrl = useTextEditingController(
      text: config.uid > 0 ? '${config.uid}' : '',
    );
    final passwordCtrl = useTextEditingController(text: config.password ?? '');
    final ipCtrl = useTextEditingController(text: config.serverIp ?? '');
    final portCtrl = useTextEditingController(text: config.serverPort ?? '');
    final region = useState(config.serverRegion);
    final formKey = useMemoized(GlobalKey<FormState>.new);

    Future<void> save() async {
      if (!formKey.currentState!.validate()) return;
      final newConfig = config.copyWith(
        uid: int.tryParse(uidCtrl.text) ?? 0,
        password: AppEnv.isOnline ? passwordCtrl.text : null,
        serverRegion: AppEnv.isOnline ? region.value : config.serverRegion,
        serverIp: AppEnv.isOnPremise ? ipCtrl.text.trim() : null,
        serverPort: AppEnv.isOnPremise && portCtrl.text.isNotEmpty
            ? portCtrl.text.trim()
            : null,
      );
      await ref.read(configNotifierProvider.notifier).save(newConfig);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Configuration saved')),
        );
      }
    }

    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppEnv.isOnPremise
                  ? AppColors.warning.withValues(alpha: 0.1)
                  : AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  AppEnv.isOnPremise ? Icons.dns : Icons.cloud,
                  color: AppEnv.isOnPremise
                      ? AppColors.warning
                      : AppColors.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Mode: ${AppEnv.isOnPremise ? "On-Premise" : "Online"}',
                  style: AppTextStyles.labelLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: uidCtrl,
            decoration: const InputDecoration(
              labelText: 'UID',
              hintText: 'Enter your TTLock user ID',
            ),
            keyboardType: TextInputType.number,
            validator: (v) =>
                (v == null || v.isEmpty) ? 'UID is required' : null,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),
          if (AppEnv.isOnline) ...[
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordCtrl,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your TTLock login password',
              ),
              obscureText: true,
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Password is required' : null,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 16),
            Text(
              'Server Region',
              style: AppTextStyles.labelLarge,
            ),
            const SizedBox(height: 8),
            SegmentedButton<ServerRegion>(
              segments: const [
                ButtonSegment(
                  value: ServerRegion.china,
                  label: Text('China'),
                  icon: Icon(Icons.flag),
                ),
                ButtonSegment(
                  value: ServerRegion.global,
                  label: Text('Global'),
                  icon: Icon(Icons.public),
                ),
              ],
              selected: {region.value},
              onSelectionChanged: (selection) {
                region.value = selection.first;
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Device-specific server addresses are applied automatically during provisioning.',
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ] else ...[
            const SizedBox(height: 16),
            TextFormField(
              controller: ipCtrl,
              decoration: const InputDecoration(
                labelText: 'Server Address',
                hintText: 'e.g. 192.168.1.100',
              ),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Server address is required' : null,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: portCtrl,
              decoration: const InputDecoration(
                labelText: 'Server Port',
                hintText: 'e.g. 2229',
              ),
              keyboardType: TextInputType.number,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
            ),
          ],
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: save,
            child: const Text('Save Configuration'),
          ),
        ],
      ),
    );
  }
}
