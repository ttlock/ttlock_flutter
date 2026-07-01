import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/device_info_section.dart';
import '../../core/storage/config_provider.dart';
import 'gateway_provider.dart';

class GatewayPage extends ConsumerStatefulWidget {
  final String mac;
  final TTGatewayType gatewayType;
  final bool needsWifiConfig;

  const GatewayPage({
    super.key,
    required this.mac,
    this.gatewayType = TTGatewayType.g2,
    this.needsWifiConfig = false,
  });

  @override
  ConsumerState<GatewayPage> createState() => _GatewayPageState();
}

class _GatewayPageState extends ConsumerState<GatewayPage> {
  final _wifiCtrl = TextEditingController();
  final _wifiPwdCtrl = TextEditingController();
  final _ipCtrl = TextEditingController();
  final _subnetCtrl = TextEditingController();
  final _routerCtrl = TextEditingController();
  final _dnsCtrl = TextEditingController();
  final _apnCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(gatewayNotifierProvider.notifier).connect(widget.mac));
  }

  @override
  void dispose() {
    _wifiCtrl.dispose();
    _wifiPwdCtrl.dispose();
    _ipCtrl.dispose();
    _subnetCtrl.dispose();
    _routerCtrl.dispose();
    _dnsCtrl.dispose();
    _apnCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gatewayNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Gateway ${widget.mac}')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Error display
                if (state.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ErrorDisplay(
                      message: state.errorMessage,
                      onRetry: () => ref
                          .read(gatewayNotifierProvider.notifier)
                          .connect(widget.mac),
                    ),
                  ),

                // Section: Device Info
                SectionHeader(title: 'Device Info', icon: Icons.info_outline),
                const SizedBox(height: 8),
                DeviceInfoSection(mac: widget.mac),
                const SizedBox(height: 8),
                // Connection status
                Card(
                  child: ListTile(
                    leading: Icon(
                      state.isConnected ? Icons.wifi : Icons.wifi_off,
                      color: state.isConnected
                          ? AppColors.success
                          : AppColors.error,
                    ),
                    title: Text(
                      state.isConnected ? 'Connected' : 'Disconnected',
                      style: AppTextStyles.titleMedium,
                    ),
                    subtitle: Text(
                      'Type: ${widget.gatewayType.name}',
                      style: AppTextStyles.bodySmall,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Section: Connection
                SectionHeader(title: 'Connection', icon: Icons.link),
                const SizedBox(height: 8),
                if (state.isConnected)
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                    ),
                    onPressed: () async {
                      await ref
                          .read(gatewayNotifierProvider.notifier)
                          .disconnect();
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    child: const Text('Disconnect'),
                  )
                else
                  ElevatedButton(
                    onPressed: () => ref
                        .read(gatewayNotifierProvider.notifier)
                        .connect(widget.mac),
                    child: const Text('Connect'),
                  ),
                const SizedBox(height: 16),

                // Section: WiFi Init
                if (state.isConnected) ...[
                  SectionHeader(title: 'WiFi Init', icon: Icons.wifi),
                  const SizedBox(height: 8),
                  if (widget.needsWifiConfig) ...[
                    TextField(
                      controller: _wifiCtrl,
                      decoration: const InputDecoration(
                          labelText: 'SSID', hintText: 'WiFi name'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _wifiPwdCtrl,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'WiFi password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                  ],
                  ElevatedButton(
                    onPressed: _initGateway,
                    child: const Text('Initialize Gateway'),
                  ),
                  const SizedBox(height: 16),

                  // Section: Network Config
                  SectionHeader(
                      title: 'Network Config',
                      icon: Icons.settings_ethernet),
                  const SizedBox(height: 8),
                  // Get Network MAC
                  OutlinedButton.icon(
                    icon: const Icon(Icons.wifi_find),
                    onPressed: _getNetworkMac,
                    label: const Text('Get Network MAC'),
                  ),
                  const SizedBox(height: 12),
                  // Config IP
                  TextField(
                    controller: _ipCtrl,
                    decoration: const InputDecoration(
                        labelText: 'IP Address',
                        hintText: '192.168.1.100'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _subnetCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Subnet Mask',
                        hintText: '255.255.255.0'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _routerCtrl,
                    decoration: const InputDecoration(
                        labelText: 'Router', hintText: '192.168.1.1'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _dnsCtrl,
                    decoration: const InputDecoration(
                        labelText: 'DNS', hintText: '8.8.8.8'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _configIp,
                    child: const Text('Set IP'),
                  ),
                  const SizedBox(height: 12),
                  // Config APN
                  TextField(
                    controller: _apnCtrl,
                    decoration: const InputDecoration(
                        labelText: 'APN', hintText: 'cmnet'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _configApn,
                    child: const Text('Set APN'),
                  ),
                  const SizedBox(height: 16),

                  // Section: Danger Zone
                  SectionHeader(
                      title: 'Danger Zone', icon: Icons.warning_amber),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _enterUpgradeMode,
                    child: const Text('Enter Upgrade Mode'),
                  ),

                  // Result display
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
                            Text(state.lastResult,
                                style: AppTextStyles.codeMedium),
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

  void _initGateway() {
    final config = ref.read(configNotifierProvider).valueOrNull;
    ref
        .read(gatewayNotifierProvider.notifier)
        .init(TTGatewayInitParams(
      type: widget.gatewayType,
      ttlockUid: config?.uid ?? 0,
      gatewayName: config?.gatewayName ?? 'Gateway',
      serverIp: config?.serverIp,
      serverPort: config?.serverPort,
      wifi: widget.needsWifiConfig ? _wifiCtrl.text : null,
      wifiPassword: widget.needsWifiConfig ? _wifiPwdCtrl.text : null,
    ));
  }

  void _getNetworkMac() {
    ref.read(gatewayNotifierProvider.notifier).getNetworkMac();
  }

  void _configIp() {
    final notifier = ref.read(gatewayNotifierProvider.notifier);
    notifier.configIp(TTIpSetting(
      type: TTIpSettingType.staticIp.index,
      ipAddress: _ipCtrl.text.isNotEmpty ? _ipCtrl.text : null,
      subnetMask: _subnetCtrl.text.isNotEmpty ? _subnetCtrl.text : null,
      router: _routerCtrl.text.isNotEmpty ? _routerCtrl.text : null,
      preferredDns: _dnsCtrl.text.isNotEmpty ? _dnsCtrl.text : null,
    ));
  }

  void _configApn() {
    if (_apnCtrl.text.isEmpty) return;
    ref.read(gatewayNotifierProvider.notifier).configApn(_apnCtrl.text);
  }

  void _enterUpgradeMode() {
    ref.read(gatewayNotifierProvider.notifier).enterUpgradeMode();
  }
}
