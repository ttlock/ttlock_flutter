import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../core/storage/gateway_list_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/device_info_section.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/section_header.dart';
import '../scan/scan_provider.dart';
import 'gateway_provider.dart';

class GatewayPage extends HookConsumerWidget {
  final String mac;

  const GatewayPage({
    super.key,
    required this.mac,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(gatewayNotifierProvider.notifier).setMac(mac);
      });
      return null;
    }, [mac]);

    void enterUpgradeMode() {
      ref.read(gatewayNotifierProvider.notifier).enterUpgradeMode();
    }

    void getNetworkMac() {
      ref.read(gatewayNotifierProvider.notifier).getNetworkMac();
    }

    final state = ref.watch(gatewayNotifierProvider);
    final savedGateway = ref.watch(gatewayByMacProvider(mac)).valueOrNull;
    final gatewayType = savedGateway != null
        ? TTGatewayType.values[savedGateway.gatewayType.clamp(
            0,
            TTGatewayType.values.length - 1,
          )]
        : TTGatewayType.g2;
    final needsWifi = gatewayNeedsWifi(gatewayType);
    final needsApn = gatewayNeedsApn(gatewayType);

    return Scaffold(
      appBar: AppBar(title: Text('Gateway $mac')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (state.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ErrorDisplay(message: state.errorMessage),
                  ),
                SectionHeader(title: 'Device Info', icon: Icons.info_outline),
                const SizedBox(height: 8),
                DeviceInfoSection(
                  mac: mac,
                  model: savedGateway?.gatewayModel,
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  icon: const Icon(Icons.wifi_find),
                  onPressed: getNetworkMac,
                  label: const Text('Get Network MAC'),
                ),
                if (needsWifi) ...[
                  const SizedBox(height: 16),
                  SectionHeader(title: 'WiFi', icon: Icons.wifi),
                  const SizedBox(height: 8),
                  _NetworkInfoCard(
                    rows: [
                      _InfoRow(
                        label: 'SSID',
                        value: savedGateway?.wifiSsid ?? '-',
                      ),
                    ],
                  ),
                ],
                if (needsWifi) ...[
                  const SizedBox(height: 16),
                  SectionHeader(
                    title: 'IP Settings',
                    icon: Icons.settings_ethernet,
                  ),
                  const SizedBox(height: 8),
                  _NetworkInfoCard(
                    rows: [
                      _InfoRow(
                        label: 'Mode',
                        value: savedGateway?.useStaticIp == true
                            ? 'Manual'
                            : 'Auto (DHCP)',
                      ),
                      if (savedGateway?.useStaticIp == true) ...[
                        _InfoRow(
                          label: 'IP Address',
                          value: savedGateway?.ipAddress ?? '-',
                        ),
                        _InfoRow(
                          label: 'Subnet Mask',
                          value: savedGateway?.subnetMask ?? '-',
                        ),
                        _InfoRow(
                          label: 'Router',
                          value: savedGateway?.router ?? '-',
                        ),
                        _InfoRow(
                          label: 'DNS',
                          value: savedGateway?.preferredDns ?? '-',
                        ),
                      ],
                    ],
                  ),
                ],
                if (needsApn) ...[
                  const SizedBox(height: 16),
                  SectionHeader(title: 'APN Settings', icon: Icons.cell_tower),
                  const SizedBox(height: 8),
                  _NetworkInfoCard(
                    rows: [
                      _InfoRow(
                        label: 'Status',
                        value: savedGateway?.apnEnabled == true
                            ? 'Enabled'
                            : 'Disabled',
                      ),
                      if (savedGateway?.apnEnabled == true)
                        _InfoRow(
                          label: 'APN',
                          value: savedGateway?.apn ?? '-',
                        ),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                SectionHeader(
                  title: 'Danger Zone',
                  icon: Icons.warning_amber,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: enterUpgradeMode,
                  child: const Text('Enter Upgrade Mode'),
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
            ),
    );
  }
}

class _NetworkInfoCard extends StatelessWidget {
  final List<_InfoRow> rows;

  const _NetworkInfoCard({required this.rows});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            for (var i = 0; i < rows.length; i++) ...[
              rows[i],
              if (i < rows.length - 1)
                const Divider(height: 1),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label, style: AppTextStyles.bodySmall),
          ),
          Expanded(
            child: Text(value, style: AppTextStyles.bodyMedium),
          ),
        ],
      ),
    );
  }
}
