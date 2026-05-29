import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../core/router/routes.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import 'lock_provider.dart';
import 'lock_status_provider.dart';
import 'widgets/accessory_entry_section.dart';
import 'widgets/credential_entry_section.dart';

class LockPage extends ConsumerStatefulWidget {
  final String mac;

  const LockPage({super.key, required this.mac});

  @override
  ConsumerState<LockPage> createState() => _LockPageState();
}

class _LockPageState extends ConsumerState<LockPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final device = await ref.read(lockByMacProvider(widget.mac).future);
      if (device != null) {
        ref.read(lockNotifierProvider.notifier).setContext(
              device.lockData,
              lockMac: device.mac,
              lockName: device.name,
            );
      }
    });
  }

  Future<void> _quickControl(TTControlAction action) async {
    final lockState = ref.read(lockNotifierProvider);
    if (lockState.lockData == null) return;
    try {
      context.loaderOverlay.show();
      await ref
          .read(lockNotifierProvider.notifier)
          .controlLock(lockState.lockData!, action);
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: Text(action == TTControlAction.unlock ? 'Unlocked' : 'Locked'),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 2),
        );
        ref.invalidate(lockStatusProvider(widget.mac));
      }
    } catch (e) {
      if (mounted) {
        context.loaderOverlay.hide();
        toastification.show(
          title: Text('$e'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lockState = ref.watch(lockNotifierProvider);
    final lockAsync = ref.watch(lockByMacProvider(widget.mac));
    final statusAsync = ref.watch(lockStatusProvider(widget.mac));

    if (lockAsync.isLoading) {
      return const Scaffold(body: LoadingOverlay(message: 'Loading lock…'));
    }

    final device = lockAsync.valueOrNull;
    if (device == null || lockState.lockData == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Lock')),
        body: const ErrorDisplay(message: 'Lock not found or missing lock data'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(lockState.lockName ?? device.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => LockSettingsRoute(widget.mac).push(context),
          ),
        ],
      ),
      body: lockState.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(lockStatusProvider(widget.mac).notifier).refreshFromLock(),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _quickControl(TTControlAction.unlock),
                            icon: const Icon(Icons.lock_open),
                            label: const Text('Unlock'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _quickControl(TTControlAction.lock),
                            icon: const Icon(Icons.lock),
                            label: const Text('Lock'),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.onSurfaceSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: statusAsync.when(
                        loading: () => const Text('Loading status…'),
                        error: (e, _) => Text('Status error: $e'),
                        data: (s) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              device.mac,
                              style: AppTextStyles.codeMedium,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.battery_std,
                                  size: 18,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  s.power != null ? 'Battery ${s.power}%' : 'Battery —',
                                  style: AppTextStyles.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'State: ${s.switchState?.name ?? '—'}',
                              style: AppTextStyles.bodySmall,
                            ),
                            if (s.lockTimeSeconds != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                'Lock time: ${DateTime.fromMillisecondsSinceEpoch(s.lockTimeSeconds! * 1000).toLocal()}',
                                style: AppTextStyles.bodySmall,
                              ),
                            ],
                            if (lockState.lastResult.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                'Last: ${lockState.lastResult}',
                                style: AppTextStyles.bodySmall,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (lockState.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ErrorDisplay(message: lockState.errorMessage),
                    ),
                  CredentialEntrySection(lockMac: widget.mac),
                  AccessoryEntrySection(lockMac: widget.mac),
                ],
              ),
            ),
    );
  }
}
