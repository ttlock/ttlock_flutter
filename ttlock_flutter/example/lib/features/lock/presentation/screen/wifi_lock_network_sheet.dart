import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/wifi_lock_config_notifier.dart';
import 'package:ttlock_flutter_demo/shared/presentation/widget/base_bottom_sheet.dart';

/// WiFi 选择 sheet（类型化路由 `LockWifiNetworkSheetRoute`）。
///
/// 选中即写入 notifier 的 `selectedSsid` 并关闭 sheet；密码由配置页收集。
/// 关闭 affordance 由 [BaseBottomSheet] 自带的返回按钮提供，故不设取消按钮。
class WifiLockNetworkSheet extends ConsumerWidget {
  const WifiLockNetworkSheet({
    super.key,
    required this.lockId,
    required this.lock,
  });

  final int lockId;
  final LockEntity lock;

  static IconData _signalIcon(int rssi) {
    if (rssi >= -50) return Icons.signal_cellular_alt_rounded;
    if (rssi >= -70) return Icons.signal_cellular_alt_2_bar_rounded;
    return Icons.signal_cellular_alt_1_bar_rounded;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final provider = wifiLockConfigProvider(lockId, lock);
    final stateAsync = ref.watch(provider);
    final notifier = ref.read(provider.notifier);
    final state = stateAsync.value;

    return BaseBottomSheet(
      title: l10n.selectWifiNetwork,
      child: state == null
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: CircularProgressIndicator()),
            )
          : MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                shrinkWrap: true,
                children: [
                  // 表头由 chassis 固定（返回键 + 标题），刷新入口只能落在内容区。
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      key: const Key('wifi_sheet_rescan'),
                      onPressed: state.isScanning
                          ? null
                          : () => notifier.scan(lock),
                      icon: state.isScanning
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.refresh),
                      label: Text(l10n.rescan),
                    ),
                  ),
                  if (state.networks.isEmpty && !state.isScanning)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 20,
                      ),
                      child: Text(
                        l10n.noAvailableWifi,
                        textAlign: TextAlign.center,
                      ),
                    )
                  else
                    for (final network in state.networks)
                      ListTile(
                        key: Key('wifi_sheet_${network.ssid}'),
                        leading: Icon(_signalIcon(network.rssi)),
                        title: Text(network.ssid),
                        trailing: network.ssid == state.selectedSsid
                            ? const Icon(Icons.check)
                            : null,
                        onTap: () {
                          notifier.select(network.ssid);
                          context.pop();
                        },
                      ),
                ],
              ),
            ),
    );
  }
}
