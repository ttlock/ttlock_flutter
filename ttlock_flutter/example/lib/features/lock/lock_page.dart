import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../command/lock_commands.dart';
import '../../command/operation_record.dart';
import '../../core/router/routes.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/async_value_view.dart';
import '../../core/widgets/device_info_section.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/operation_log_panel.dart';
import '../../features/settings/model/saved_lock_device.dart';
import 'capabilities/lock_capabilities_provider.dart';
import 'lock_provider.dart';
import 'lock_status_provider.dart';
import 'widgets/accessory_entry_section.dart';
import 'widgets/credential_entry_section.dart';
import 'widgets/quick_actions_section.dart';

Future<void> quickControlLock(
  BuildContext context,
  WidgetRef ref,
  String mac,
  TTControlAction action,
  ValueNotifier<List<OperationRecord>> operationLog,
) async {
  final lockState = ref.read(lockNotifierProvider);
  if (lockState.lockData == null) return;
  final start = DateTime.now();
  try {
    context.loaderOverlay.show();
    await ref
        .read(lockNotifierProvider.notifier)
        .controlLock(lockState.lockData!, action);
    if (context.mounted) context.loaderOverlay.hide();
    operationLog.value = [
      ...operationLog.value,
      OperationRecord(
        methodName: 'controlLock(${action.name})',
        duration: DateTime.now().difference(start),
        isSuccess: true,
        data: {'action': action.name},
        timestamp: DateTime.now(),
      ),
    ];
    if (context.mounted) {
      toastification.show(
        title: Text(action == TTControlAction.unlock ? 'Unlocked' : 'Locked'),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 2),
      );
      ref.invalidate(lockStatusProvider(mac));
    }
  } catch (e) {
    if (context.mounted) context.loaderOverlay.hide();
    operationLog.value = [
      ...operationLog.value,
      OperationRecord(
        methodName: 'controlLock(${action.name})',
        duration: DateTime.now().difference(start),
        isSuccess: false,
        errorMessage: e.toString(),
        timestamp: DateTime.now(),
      ),
    ];
    if (context.mounted) {
      toastification.show(
        title: Text('$e'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 3),
      );
    }
  }
}

class LockPage extends HookConsumerWidget {
  const LockPage({super.key, required this.mac});

  final String mac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(mac));
    final operationLog = useState<List<OperationRecord>>([]);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final device = lockAsync.valueOrNull;
        if (device != null) {
          ref.read(lockNotifierProvider.notifier).setContext(
                device.lockData,
                lockMac: device.mac,
                lockName: device.name,
              );
        }
      });
      return null;
    }, [lockAsync.valueOrNull?.mac]);

    return lockAsync.when(
      loading: () => const Scaffold(body: LoadingOverlay(message: 'Loading lock…')),
      error: (e, _) => Scaffold(
        appBar: AppBar(title: const Text('Lock')),
        body: AsyncValueView.error(message: '$e'),
      ),
      data: (device) {
        if (device == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Lock')),
            body: const ErrorDisplay(message: 'Lock not found or missing lock data'),
          );
        }
        return _LockPageBody(
          mac: mac,
          device: device,
          operationLog: operationLog,
        );
      },
    );
  }
}

class _LockPageBody extends HookConsumerWidget {
  const _LockPageBody({
    required this.mac,
    required this.device,
    required this.operationLog,
  });

  final String mac;
  final SavedLockDevice device;
  final ValueNotifier<List<OperationRecord>> operationLog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockState = ref.watch(lockNotifierProvider);
    final statusAsync = ref.watch(lockStatusProvider(mac));
    final caps = ref.watch(lockCapabilitiesProvider(mac)).valueOrNull ?? {};

    if (lockState.lockData == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Lock')),
        body: const ErrorDisplay(message: 'Lock not found or missing lock data'),
      );
    }

    final status = statusAsync.valueOrNull;

    void addLog(OperationRecord record) {
      operationLog.value = [...operationLog.value, record];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(lockState.lockName ?? device.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => LockSettingsRoute(mac).push(context),
          ),
        ],
      ),
      body: lockState.isLoading
          ? const LoadingOverlay(message: 'Processing...')
          : RefreshIndicator(
              onRefresh: () =>
                  ref.read(lockStatusProvider(mac).notifier).refreshFromLock(),
              child: ListView(
                children: [
                  DeviceInfoSection(
                    mac: device.mac,
                    batteryLevel: status?.power,
                    switchState: status?.switchState?.name,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => quickControlLock(
                              context,
                              ref,
                              mac,
                              TTControlAction.unlock,
                              operationLog,
                            ),
                            icon: const Icon(Icons.lock_open),
                            label: const Text('Unlock'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => quickControlLock(
                              context,
                              ref,
                              mac,
                              TTControlAction.lock,
                              operationLog,
                            ),
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
                  if (lockState.lastResult.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Last: ${lockState.lastResult}',
                        style: AppTextStyles.bodySmall,
                      ),
                    ),
                  if (lockState.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ErrorDisplay(message: lockState.errorMessage),
                    ),
                  QuickActionsSection(
                    lockMac: mac,
                    caps: caps,
                    onLog: addLog,
                  ),
                  if (LockCommand.createPasscode.isVisibleFor(caps) ||
                      LockCommand.addCard.isVisibleFor(caps) ||
                      LockCommand.addFingerprint.isVisibleFor(caps) ||
                      LockCommand.addFace.isVisibleFor(caps) ||
                      LockCommand.addPalmVein.isVisibleFor(caps))
                    CredentialEntrySection(lockMac: mac),
                  if (LockCommand.addDoorSensor.isVisibleFor(caps) ||
                      LockCommand.addRemoteKey.isVisibleFor(caps))
                    AccessoryEntrySection(lockMac: mac),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Settings'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => LockSettingsRoute(mac).push(context),
                      ),
                    ),
                  ),
                  OperationLogPanel(
                    records: operationLog.value,
                    onClear: () => operationLog.value = [],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
    );
  }
}
