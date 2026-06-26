import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/error_display.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gatewayNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Gateway ${widget.mac}')),
      body: state.isLoading
          ? const LoadingOverlay(message: 'Connecting...')
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
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
                    subtitle: Text('MAC: ${widget.mac}',
                        style: AppTextStyles.bodySmall),
                  ),
                ),
                if (state.isConnected) ...[
                  const SizedBox(height: 16),
                  if (widget.needsWifiConfig) ...[
                    SectionHeader(title: 'WiFi Configuration', icon: Icons.wifi),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _wifiCtrl,
                      decoration: const InputDecoration(
                          labelText: 'SSID', hintText: 'WiFi name'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _wifiPwdCtrl,
                      decoration: const InputDecoration(
                          labelText: 'Password', hintText: 'WiFi password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _initGateway,
                      child: const Text('Initialize Gateway'),
                    ),
                  ] else ...[
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _initGateway,
                      child: const Text('Initialize Gateway'),
                    ),
                  ],
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () =>
                        ref.read(gatewayNotifierProvider.notifier).disconnect(),
                    child: const Text('Disconnect'),
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
    ref.read(gatewayNotifierProvider.notifier).init(TTGatewayInitParams(
      type: widget.gatewayType,
      ttlockUid: config?.uid ?? 0,
      gatewayName: config?.gatewayName ?? 'Gateway',
      serverIp: config?.serverIp,
      serverPort: config?.serverPort,
      wifi: widget.needsWifiConfig ? _wifiCtrl.text : null,
      wifiPassword: widget.needsWifiConfig ? _wifiPwdCtrl.text : null,
    ));
  }
}
