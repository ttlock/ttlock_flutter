import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../core/config/server_endpoint_config.dart';
import '../../core/router/routes.dart';
import '../../core/storage/config_provider.dart';
import '../../core/storage/standalone_door_sensor_list_provider.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/wifi/wifi_source_plugin_platform.dart';
import '../../core/wifi/wifi_source_result.dart';
import '../../core/wifi/wifi_source_service.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/server_endpoint_fields.dart';
import '../../core/widgets/wifi_picker_sheet.dart';
import '../settings/model/saved_standalone_door_sensor.dart';
import 'standalone_door_sensor_provider.dart';

class StandaloneDoorSensorInitPage extends HookConsumerWidget {
  const StandaloneDoorSensorInitPage({
    super.key,
    required this.mac,
    required this.name,
  });

  final String mac;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wifiService = useMemoized(
      () => const WifiSourceService(platform: WifiSourcePluginPlatform()),
    );
    final wifiSsidCtrl = useTextEditingController();
    final wifiPwdCtrl = useTextEditingController();
    final serverIpCtrl = useTextEditingController();
    final serverPortCtrl = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final wifiSource = useState<WifiSourceResult?>(null);
    final isLoadingWifi = useState(false);

    final config = ref.watch(configNotifierProvider).valueOrNull;
    final state = ref.watch(standaloneDoorSensorNotifierProvider);

    useEffect(() {
      if (config == null) return null;
      final endpoint =
          config.defaultServerEndpoint(DeviceServerKind.standaloneDoorSensor);
      if (serverIpCtrl.text.isEmpty) {
        serverIpCtrl.text = endpoint.address;
      }
      if (serverPortCtrl.text.isEmpty) {
        serverPortCtrl.text = endpoint.port;
      }
      return null;
    }, [config?.uid, config?.serverRegion, config?.serverIp, config?.serverPort]);

    Future<WifiSourceResult> loadWifiSource() async {
      isLoadingWifi.value = true;
      try {
        final result = await wifiService.load();
        wifiSource.value = result;
        if (wifiSsidCtrl.text.trim().isEmpty && result.currentSsid != null) {
          wifiSsidCtrl.text = result.currentSsid!;
        }
        return result;
      } finally {
        if (context.mounted) {
          isLoadingWifi.value = false;
        }
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => loadWifiSource());
      return null;
    }, const []);

    Future<void> showWifiPicker() async {
      final result = await WifiPickerSheet.show(
        context,
        selectedSsid: wifiSsidCtrl.text.trim().isEmpty
            ? null
            : wifiSsidCtrl.text.trim(),
        initialWifiList: wifiSource.value?.availableSsids ?? const [],
        loadWifiList: () async {
          final refreshed = await loadWifiSource();
          return refreshed.availableSsids;
        },
        title: wifiSource.value?.canScan ?? false ? 'Select WiFi' : 'Current WiFi',
        loadingMessage: wifiSource.value?.canScan ?? false
            ? 'Scanning nearby WiFi...'
            : 'Getting current WiFi...',
        emptyMessage: wifiSource.value?.canScan ?? false
            ? 'No WiFi found'
            : 'Current WiFi unavailable',
      );
      if (result?.selectedSsid != null) {
        wifiSsidCtrl.text = result!.selectedSsid!;
      }
    }

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

      final port = int.tryParse(serverPortCtrl.text.trim());
      if (port == null) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid server port')),
        );
        return;
      }

      final result = await ref
          .read(standaloneDoorSensorNotifierProvider.notifier)
          .init(
            TTStandaloneDoorSensorInitParams(
              mac: mac,
              doorSensorName: name,
              wifiName: wifiSsidCtrl.text.trim(),
              wifiPassword: wifiPwdCtrl.text,
              serverAddress: serverIpCtrl.text.trim(),
              portNumber: port,
            ),
          );
      if (!context.mounted || result == null) return;

      await ref
          .read(standaloneDoorSensorListNotifierProvider.notifier)
          .addDevice(
            SavedStandaloneDoorSensor(
              name: name,
              mac: mac,
              doorSensorData: result.doorSensorData,
              featureValue: result.featureValue,
              modelNum: result.modelNum,
              electricQuantity: result.electricQuantity,
              initializedAt: DateTime.now(),
            ),
          );
      if (!context.mounted) return;
      StandaloneDoorSensorRoute(mac).go(context);
    }

    final isConfigValid = config?.isValid ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('Initialize Door Sensor')),
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
                  SectionHeader(title: 'Device', icon: Icons.sensors_outlined),
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
                  SectionHeader(title: 'WiFi', icon: Icons.wifi),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.wifi_tethering),
                          title: const Text('Detected WiFi'),
                          subtitle: Text(
                            wifiSource.value?.currentSsid ??
                                (isLoadingWifi.value
                                    ? 'Detecting current WiFi...'
                                    : 'No WiFi detected'),
                          ),
                          trailing: IconButton(
                            tooltip: 'Refresh WiFi',
                            onPressed: isLoadingWifi.value ? null : loadWifiSource,
                            icon: isLoadingWifi.value
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.refresh),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              if (wifiSource.value?.currentSsid != null)
                                OutlinedButton.icon(
                                  onPressed: () {
                                    wifiSsidCtrl.text =
                                        wifiSource.value!.currentSsid!;
                                  },
                                  icon: const Icon(Icons.my_location),
                                  label: const Text('Use Current WiFi'),
                                ),
                              OutlinedButton.icon(
                                onPressed: showWifiPicker,
                                icon: Icon(
                                  wifiSource.value?.canScan ?? false
                                      ? Icons.list_alt
                                      : Icons.wifi,
                                ),
                                label: Text(
                                  wifiSource.value?.canScan ?? false
                                      ? 'Choose from List'
                                      : 'View Current WiFi',
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (wifiSource.value?.errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Text(
                              wifiSource.value!.errorMessage!,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: wifiSsidCtrl,
                    decoration: const InputDecoration(
                      labelText: 'SSID',
                      hintText: 'WiFi network name',
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? 'SSID is required' : null,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: wifiPwdCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'WiFi password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  if (config != null) ...[
                    SectionHeader(title: 'Server', icon: Icons.dns),
                    const SizedBox(height: 8),
                    ServerEndpointFields(
                      config: config,
                      deviceKind: DeviceServerKind.standaloneDoorSensor,
                      ipController: serverIpCtrl,
                      portController: serverPortCtrl,
                    ),
                  ],
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: isConfigValid && !state.isLoading ? initDevice : null,
                    child: const Text('Initialize Door Sensor'),
                  ),
                ],
              ),
            ),
    );
  }
}
