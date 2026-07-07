import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/error_display.dart';

class GatewayWifiScanSheet extends HookConsumerWidget {
  final String gatewayMac;
  final String? selectedSsid;
  final List<String> initialWifiList;

  const GatewayWifiScanSheet({
    super.key,
    required this.gatewayMac,
    this.selectedSsid,
    this.initialWifiList = const [],
  });

  static String entrySsid(TTWifiScanEntry entry) =>
      entry.ssid ?? entry.wifiName ?? entry.name ?? '';

  static Future<GatewayWifiScanResult?> show(
    BuildContext context, {
    required String gatewayMac,
    String? selectedSsid,
    List<String> initialWifiList = const [],
  }) {
    return showModalBottomSheet<GatewayWifiScanResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => GatewayWifiScanSheet(
        gatewayMac: gatewayMac,
        selectedSsid: selectedSsid,
        initialWifiList: initialWifiList,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wifiList = useState<List<String>>(List.from(initialWifiList));
    final isScanning = useState(false);
    final scanError = useState<String?>(null);

    Future<void> scanWifi() async {
      isScanning.value = true;
      scanError.value = null;
      wifiList.value = [];
      try {
        final seen = <String>{};
        final ssids = <String>[];
        await for (final result
            in TTLock.gateway.gatewayGetNearbyWifi(gatewayMac: gatewayMac)) {
          for (final entry in result.wifiList) {
            final ssid = GatewayWifiScanSheet.entrySsid(entry);
            if (ssid.isNotEmpty && seen.add(ssid)) {
              ssids.add(ssid);
            }
          }
          if (context.mounted) {
            wifiList.value = List.from(ssids);
          }
        }
        if (context.mounted) {
          wifiList.value = ssids;
        }
      } on TTGatewayException catch (e) {
        if (context.mounted) scanError.value = e.toString();
      } catch (e) {
        if (context.mounted) scanError.value = e.toString();
      } finally {
        if (context.mounted) isScanning.value = false;
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => scanWifi());
      return null;
    }, const []);

    void selectSsid(String ssid) {
      Navigator.pop(
        context,
        GatewayWifiScanResult(selectedSsid: ssid, wifiList: wifiList.value),
      );
    }

    void dismiss() {
      Navigator.pop(
        context,
        GatewayWifiScanResult(
          selectedSsid: selectedSsid,
          wifiList: wifiList.value,
        ),
      );
    }

    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.55,
        minChildSize: 0.35,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Column(
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Select WiFi',
                        style: AppTextStyles.titleMedium,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Rescan',
                      onPressed: isScanning.value ? null : scanWifi,
                      icon: isScanning.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.refresh),
                    ),
                    IconButton(
                      tooltip: 'Close',
                      onPressed: dismiss,
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              if (scanError.value != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ErrorDisplay(
                    message: scanError.value,
                    onRetry: scanWifi,
                  ),
                ),
              Expanded(
                child: _buildList(
                  scrollController: scrollController,
                  wifiList: wifiList.value,
                  isScanning: isScanning.value,
                  scanError: scanError.value,
                  selectedSsid: selectedSsid,
                  onScanWifi: scanWifi,
                  onSelectSsid: selectSsid,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildList({
    required ScrollController scrollController,
    required List<String> wifiList,
    required bool isScanning,
    required String? scanError,
    required String? selectedSsid,
    required Future<void> Function() onScanWifi,
    required void Function(String ssid) onSelectSsid,
  }) {
    if (isScanning && wifiList.isEmpty && scanError == null) {
      return const Center(child: Text('Scanning nearby WiFi...'));
    }
    if (wifiList.isEmpty && scanError == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wifi_off, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 8),
            const Text('No WiFi found'),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: isScanning ? null : onScanWifi,
              icon: const Icon(Icons.refresh),
              label: const Text('Scan again'),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      controller: scrollController,
      itemCount: wifiList.length,
      itemBuilder: (context, index) {
        final ssid = wifiList[index];
        final isSelected = selectedSsid == ssid;
        return ListTile(
          leading: const Icon(Icons.wifi),
          title: Text(ssid),
          trailing: isSelected
              ? const Icon(Icons.check_circle, color: AppColors.primary)
              : null,
          selected: isSelected,
          onTap: () => onSelectSsid(ssid),
        );
      },
    );
  }
}

class GatewayWifiScanResult {
  final String? selectedSsid;
  final List<String> wifiList;

  const GatewayWifiScanResult({
    this.selectedSsid,
    required this.wifiList,
  });
}
