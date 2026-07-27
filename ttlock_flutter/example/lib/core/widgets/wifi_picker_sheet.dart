import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'error_display.dart';

class WifiPickerSheet extends HookWidget {
  const WifiPickerSheet({
    super.key,
    required this.loadWifiList,
    this.selectedSsid,
    this.initialWifiList = const [],
    this.title = 'Select WiFi',
    this.loadingMessage = 'Scanning nearby WiFi...',
    this.emptyMessage = 'No WiFi found',
  });

  final Future<List<String>> Function() loadWifiList;
  final String? selectedSsid;
  final List<String> initialWifiList;
  final String title;
  final String loadingMessage;
  final String emptyMessage;

  static Future<WifiPickerResult?> show(
    BuildContext context, {
    required Future<List<String>> Function() loadWifiList,
    String? selectedSsid,
    List<String> initialWifiList = const [],
    String title = 'Select WiFi',
    String loadingMessage = 'Scanning nearby WiFi...',
    String emptyMessage = 'No WiFi found',
  }) {
    return showModalBottomSheet<WifiPickerResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => WifiPickerSheet(
        loadWifiList: loadWifiList,
        selectedSsid: selectedSsid,
        initialWifiList: initialWifiList,
        title: title,
        loadingMessage: loadingMessage,
        emptyMessage: emptyMessage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final wifiList = useState<List<String>>(List.from(initialWifiList));
    final isLoading = useState(false);
    final loadError = useState<String?>(null);

    Future<void> refresh() async {
      isLoading.value = true;
      loadError.value = null;
      try {
        wifiList.value = await loadWifiList();
      } catch (error) {
        loadError.value = error.toString();
      } finally {
        isLoading.value = false;
      }
    }

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => refresh());
      return null;
    }, const []);

    void selectSsid(String ssid) {
      Navigator.pop(
        context,
        WifiPickerResult(selectedSsid: ssid, wifiList: wifiList.value),
      );
    }

    void dismiss() {
      Navigator.pop(
        context,
        WifiPickerResult(
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
                      child: Text(title, style: AppTextStyles.titleMedium),
                    ),
                    IconButton(
                      tooltip: 'Refresh',
                      onPressed: isLoading.value ? null : refresh,
                      icon: isLoading.value
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
              if (loadError.value != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ErrorDisplay(
                    message: loadError.value,
                    onRetry: refresh,
                  ),
                ),
              Expanded(
                child: _WifiListView(
                  scrollController: scrollController,
                  wifiList: wifiList.value,
                  isLoading: isLoading.value,
                  loadError: loadError.value,
                  selectedSsid: selectedSsid,
                  loadingMessage: loadingMessage,
                  emptyMessage: emptyMessage,
                  onRefresh: refresh,
                  onSelectSsid: selectSsid,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WifiListView extends StatelessWidget {
  const _WifiListView({
    required this.scrollController,
    required this.wifiList,
    required this.isLoading,
    required this.loadError,
    required this.selectedSsid,
    required this.loadingMessage,
    required this.emptyMessage,
    required this.onRefresh,
    required this.onSelectSsid,
  });

  final ScrollController scrollController;
  final List<String> wifiList;
  final bool isLoading;
  final String? loadError;
  final String? selectedSsid;
  final String loadingMessage;
  final String emptyMessage;
  final Future<void> Function() onRefresh;
  final void Function(String ssid) onSelectSsid;

  @override
  Widget build(BuildContext context) {
    if (isLoading && wifiList.isEmpty && loadError == null) {
      return Center(child: Text(loadingMessage));
    }
    if (wifiList.isEmpty && loadError == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wifi_off, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 8),
            Text(emptyMessage),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: isLoading ? null : onRefresh,
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
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

class WifiPickerResult {
  const WifiPickerResult({
    this.selectedSsid,
    required this.wifiList,
  });

  final String? selectedSsid;
  final List<String> wifiList;
}
