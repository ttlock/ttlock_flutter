import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../core/env/app_mode.dart';
import '../../core/router/routes.dart';
import '../../core/storage/config_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/section_header.dart';
import '../scan/scan_provider.dart';
import 'gateway_init_provider.dart';
import 'widgets/gateway_wifi_scan_sheet.dart';

enum _IpMode { auto, manual }

enum _ApnMode { disabled, enabled }

class GatewayInitPage extends HookConsumerWidget {
  final String mac;
  final String name;
  final TTGatewayType gatewayType;
  final bool needsWifiConfig;

  const GatewayInitPage({
    super.key,
    required this.mac,
    required this.name,
    this.gatewayType = TTGatewayType.g2,
    this.needsWifiConfig = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wifiPwdCtrl = useTextEditingController();
    final ipCtrl = useTextEditingController();
    final subnetCtrl = useTextEditingController();
    final routerCtrl = useTextEditingController();
    final dnsCtrl = useTextEditingController();
    final apnCtrl = useTextEditingController();

    final isConnecting = useState(true);
    final connectFailed = useState<String?>(null);
    final wifiList = useState<List<String>>([]);
    final selectedSsid = useState<String?>(null);
    final ipMode = useState(_IpMode.auto);
    final apnMode = useState(_ApnMode.disabled);

    final needsApn = gatewayNeedsApn(gatewayType);

    useListenable(wifiPwdCtrl);
    useListenable(ipCtrl);
    useListenable(subnetCtrl);
    useListenable(routerCtrl);
    useListenable(dnsCtrl);
    useListenable(apnCtrl);

    Future<void> showWifiSheet() async {
      final result = await GatewayWifiScanSheet.show(
        context,
        gatewayMac: mac,
        selectedSsid: selectedSsid.value,
        initialWifiList: wifiList.value,
      );
      if (!context.mounted || result == null) return;
      wifiList.value = result.wifiList;
      if (result.selectedSsid != null) {
        selectedSsid.value = result.selectedSsid;
      }
    }

    useEffect(() {
      Future<void> connect() async {
        isConnecting.value = true;
        connectFailed.value = null;
        final ok =
            await ref.read(gatewayInitNotifierProvider.notifier).connect(mac);
        if (!context.mounted) return;
        isConnecting.value = false;
        if (!ok) {
          connectFailed.value =
              ref.read(gatewayInitNotifierProvider).errorMessage ??
                  'Gateway connect failed';
          return;
        }
        if (needsWifiConfig) {
          await showWifiSheet();
        }
      }

      WidgetsBinding.instance.addPostFrameCallback((_) => connect());
      return () {};
    }, [mac]);

    final canSubmitIp = ipMode.value == _IpMode.auto ||
        (ipCtrl.text.trim().isNotEmpty &&
            subnetCtrl.text.trim().isNotEmpty &&
            routerCtrl.text.trim().isNotEmpty &&
            dnsCtrl.text.trim().isNotEmpty);

    final canSubmitApn =
        apnMode.value == _ApnMode.disabled || apnCtrl.text.trim().isNotEmpty;

    final canInit = canSubmitIp &&
        canSubmitApn &&
        (!needsWifiConfig || selectedSsid.value != null);

    Future<void> initGateway() async {
      final config = ref.read(configNotifierProvider).valueOrNull;
      if (config == null || !config.isValid) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(config?.validationError ?? 'Configuration incomplete'),
          ),
        );
        return;
      }

      final notifier = ref.read(gatewayInitNotifierProvider.notifier);
      final useStaticIp = needsWifiConfig && ipMode.value == _IpMode.manual;
      final apnEnabled = needsApn && apnMode.value == _ApnMode.enabled;

      try {
        if (apnEnabled) {
          await notifier.configApn(mac, apnCtrl.text.trim());
        }
        if (useStaticIp) {
          await notifier.configIp(
            mac,
            TTIpSetting(
              type: TTIpSettingType.staticIp.index,
              ipAddress: ipCtrl.text.trim(),
              subnetMask: subnetCtrl.text.trim(),
              router: routerCtrl.text.trim(),
              preferredDns: dnsCtrl.text.trim(),
            ),
          );
        }
      } on TTGatewayException {
        return;
      }

      final ok = await notifier.init(
        TTGatewayInitParams(
          type: gatewayType,
          ttlockUid: config.uid,
          gatewayName: name,
          ttlockLoginPassword: AppEnv.isOnline ? config.password : null,
          serverIp: config.serverIp,
          serverPort: config.serverPort,
          wifi: needsWifiConfig ? selectedSsid.value : null,
          wifiPassword: needsWifiConfig ? wifiPwdCtrl.text : null,
        ),
        deviceMac: mac,
        deviceName: name,
        network: GatewayNetworkConfig(
          useStaticIp: useStaticIp,
          ipAddress: useStaticIp ? ipCtrl.text.trim() : null,
          subnetMask: useStaticIp ? subnetCtrl.text.trim() : null,
          router: useStaticIp ? routerCtrl.text.trim() : null,
          preferredDns: useStaticIp ? dnsCtrl.text.trim() : null,
          apnEnabled: apnEnabled,
          apn: apnEnabled ? apnCtrl.text.trim() : null,
        ),
      );
      if (!context.mounted || !ok) return;
      await notifier.disconnect();
      if (!context.mounted) return;
      GatewayRoute(mac).replace(context);
    }

    final state = ref.watch(gatewayInitNotifierProvider);
    final config = ref.watch(configNotifierProvider).valueOrNull;
    final isConfigValid = config?.isValid ?? false;
    final configError =
        config?.validationError ?? 'Configuration incomplete';
    final isBusy = isConnecting.value || state.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Initialize Gateway')),
      body: isBusy
          ? LoadingOverlay(
              message: isConnecting.value ? 'Connecting...' : 'Initializing...',
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (connectFailed.value != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ErrorDisplay(
                      message: connectFailed.value,
                      onRetry: () async {
                        isConnecting.value = true;
                        connectFailed.value = null;
                        final ok = await ref
                            .read(gatewayInitNotifierProvider.notifier)
                            .connect(mac);
                        if (!context.mounted) return;
                        isConnecting.value = false;
                        if (!ok) {
                          connectFailed.value = ref
                                  .read(gatewayInitNotifierProvider)
                                  .errorMessage ??
                              'Gateway connect failed';
                          return;
                        }
                        if (needsWifiConfig) {
                          await showWifiSheet();
                        }
                      },
                    ),
                  ),
                if (state.errorMessage != null && connectFailed.value == null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ErrorDisplay(message: state.errorMessage),
                  ),
                SectionHeader(title: 'Device', icon: Icons.router),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    title: Text(name, style: AppTextStyles.titleMedium),
                    subtitle: Text('MAC: $mac\nType: ${gatewayType.name}'),
                  ),
                ),
                const SizedBox(height: 16),
                if (connectFailed.value == null) ...[
                  if (!isConfigValid) ...[
                    Card(
                      color: AppColors.warning.withValues(alpha: 0.1),
                      child: ListTile(
                        leading: const Icon(
                          Icons.warning_amber,
                          color: AppColors.warning,
                        ),
                        title: const Text('Configuration incomplete'),
                        subtitle: Text(
                          '$configError. Configure in Settings before initializing.',
                        ),
                        trailing: TextButton(
                          onPressed: () => const SettingsRoute().go(context),
                          child: const Text('Settings'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (needsWifiConfig) ...[
                    SectionHeader(title: 'WiFi', icon: Icons.wifi),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: showWifiSheet,
                      borderRadius: BorderRadius.circular(4),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'SSID',
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        child: Text(
                          selectedSsid.value ?? 'Tap to select WiFi',
                          style: selectedSsid.value == null
                              ? TextStyle(color: Colors.grey.shade600)
                              : null,
                        ),
                      ),
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
                  ],
                  if (needsWifiConfig) ...[
                    SectionHeader(
                      title: 'IP Settings',
                      icon: Icons.settings_ethernet,
                    ),
                    const SizedBox(height: 8),
                    SegmentedButton<_IpMode>(
                      segments: const [
                        ButtonSegment(
                          value: _IpMode.auto,
                          label: Text('Auto'),
                          icon: Icon(Icons.autorenew),
                        ),
                        ButtonSegment(
                          value: _IpMode.manual,
                          label: Text('Manual'),
                          icon: Icon(Icons.edit),
                        ),
                      ],
                      selected: {ipMode.value},
                      onSelectionChanged: (selection) {
                        ipMode.value = selection.first;
                      },
                    ),
                    if (ipMode.value == _IpMode.manual) ...[
                      const SizedBox(height: 12),
                      TextField(
                        controller: ipCtrl,
                        decoration: const InputDecoration(
                          labelText: 'IP Address',
                          hintText: '192.168.1.100',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: subnetCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Subnet Mask',
                          hintText: '255.255.255.0',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: routerCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Router',
                          hintText: '192.168.1.1',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: dnsCtrl,
                        decoration: const InputDecoration(
                          labelText: 'DNS',
                          hintText: '8.8.8.8',
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                  ],
                  if (needsApn) ...[
                    SectionHeader(title: 'APN Settings', icon: Icons.cell_tower),
                    const SizedBox(height: 8),
                    SegmentedButton<_ApnMode>(
                      segments: const [
                        ButtonSegment(
                          value: _ApnMode.disabled,
                          label: Text('Disabled'),
                        ),
                        ButtonSegment(
                          value: _ApnMode.enabled,
                          label: Text('Enabled'),
                        ),
                      ],
                      selected: {apnMode.value},
                      onSelectionChanged: (selection) {
                        apnMode.value = selection.first;
                      },
                    ),
                    if (apnMode.value == _ApnMode.enabled) ...[
                      const SizedBox(height: 12),
                      TextField(
                        controller: apnCtrl,
                        decoration: const InputDecoration(
                          labelText: 'APN',
                          hintText: 'cmnet',
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                  ],
                  SectionHeader(title: 'Initialize', icon: Icons.play_arrow),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: isConfigValid && canInit ? initGateway : null,
                    child: const Text('Initialize Gateway'),
                  ),
                  if (state.lastResult.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Result', style: AppTextStyles.labelLarge),
                            const SizedBox(height: 4),
                            Text(
                              state.lastResult,
                              style: AppTextStyles.codeMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ],
            ),
    );
  }
}
