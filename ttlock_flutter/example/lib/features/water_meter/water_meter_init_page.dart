import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/config/server_endpoint_config.dart';
import '../../core/router/routes.dart';
import '../../core/storage/config_provider.dart';
import '../../core/storage/meter_list_provider.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/server_endpoint_fields.dart';
import '../settings/model/saved_meter_device.dart';
import 'water_meter_provider.dart';

class WaterMeterInitPage extends HookConsumerWidget {
  const WaterMeterInitPage({
    super.key,
    required this.mac,
    required this.name,
  });

  final String mac;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverIpCtrl = useTextEditingController();
    final serverPortCtrl = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final config = ref.watch(configNotifierProvider).valueOrNull;
    final state = ref.watch(waterMeterNotifierProvider);

    useEffect(() {
      if (config == null) return null;
      final endpoint = config.defaultServerEndpoint(DeviceServerKind.waterMeter);
      if (serverIpCtrl.text.isEmpty) {
        serverIpCtrl.text = endpoint.address;
      }
      if (serverPortCtrl.text.isEmpty) {
        serverPortCtrl.text = endpoint.port;
      }
      return null;
    }, [config?.uid, config?.serverRegion, config?.serverIp, config?.serverPort]);

    Future<void> initDevice() async {
      if (!(formKey.currentState?.validate() ?? false)) return;
      if (config == null || !config.isValid) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(config?.validationError ?? 'Configuration incomplete'),
          ),
        );
        return;
      }

      final notifier = ref.read(waterMeterNotifierProvider.notifier);
      await notifier.connect(mac);
      if (!context.mounted) return;
      if (ref.read(waterMeterNotifierProvider).error != null) return;

      await notifier.configMeterServer(
        mac,
        serverIpCtrl.text.trim(),
        serverPortCtrl.text.trim(),
      );
      if (!context.mounted) return;
      if (ref.read(waterMeterNotifierProvider).error != null) return;

      await notifier.init(mac: mac, name: name);
      if (!context.mounted) return;
      if (ref.read(waterMeterNotifierProvider).error != null) return;

      final resultText = ref.read(waterMeterNotifierProvider).result ?? '';
      final idMatch = RegExp(r'id=(\d+)').firstMatch(resultText);
      final meterId = idMatch?.group(1) ?? mac;

      await ref.read(meterListNotifierProvider.notifier).addDevice(
            SavedMeterDevice(
              name: name,
              mac: mac,
              meterId: meterId,
              meterType: 'water',
              initializedAt: DateTime.now(),
            ),
          );
      await notifier.disconnect(mac);
      if (!context.mounted) return;
      WaterMeterRoute(meterId).go(context);
    }

    final isConfigValid = config?.isValid ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('Initialize Water Meter')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Initializing...')
          : Form(
              key: formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (state.error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ErrorDisplay(message: state.error),
                    ),
                  SectionHeader(title: 'Device', icon: Icons.water_drop),
                  const SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      title: Text(name, style: AppTextStyles.titleMedium),
                      subtitle: Text('MAC: $mac'),
                    ),
                  ),
                  if (!isConfigValid) ...[
                    const SizedBox(height: 16),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.warning_amber),
                        title: const Text('Configuration incomplete'),
                        subtitle: Text(
                          '${config?.validationError ?? 'Configuration incomplete'}. Configure in Settings first.',
                        ),
                        trailing: TextButton(
                          onPressed: () => const SettingsRoute().go(context),
                          child: const Text('Settings'),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  if (config != null) ...[
                    SectionHeader(title: 'Server', icon: Icons.dns),
                    const SizedBox(height: 8),
                    ServerEndpointFields(
                      config: config,
                      deviceKind: DeviceServerKind.waterMeter,
                      ipController: serverIpCtrl,
                      portController: serverPortCtrl,
                    ),
                  ],
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: isConfigValid && !state.isLoading ? initDevice : null,
                    child: const Text('Initialize Water Meter'),
                  ),
                ],
              ),
            ),
    );
  }
}
