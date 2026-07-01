import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../command/lock_commands.dart';
import '../../command/operation_record.dart';
import '../../core/router/routes.dart';
import '../../core/storage/lock_list_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/device_info_section.dart';
import '../../core/widgets/error_display.dart';
import '../../core/widgets/loading_overlay.dart';
import '../../core/widgets/operation_log_panel.dart';
import 'capabilities/lock_capabilities_provider.dart';
import 'lock_provider.dart';
import 'lock_status_provider.dart';
import 'widgets/credential_entry_section.dart';
import 'widgets/accessory_entry_section.dart';
import 'widgets/quick_actions_section.dart';

class LockPage extends ConsumerStatefulWidget {
  final String mac;
  const LockPage({super.key, required this.mac});

  @override
  ConsumerState<LockPage> createState() => _LockPageState();
}

class _LockPageState extends ConsumerState<LockPage> {
  final List<OperationRecord> _operationLog = [];

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
    final start = DateTime.now();
    try {
      context.loaderOverlay.show();
      await ref
          .read(lockNotifierProvider.notifier)
          .controlLock(lockState.lockData!, action);
      if (mounted) context.loaderOverlay.hide();
      _addLog(OperationRecord(
        methodName: 'controlLock(${action.name})',
        duration: DateTime.now().difference(start),
        isSuccess: true,
        data: {'action': action.name},
        timestamp: DateTime.now(),
      ));
      if (mounted) {
        toastification.show(
          title: Text(action == TTControlAction.unlock ? 'Unlocked' : 'Locked'),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 2),
        );
        ref.invalidate(lockStatusProvider(widget.mac));
      }
    } catch (e) {
      if (mounted) context.loaderOverlay.hide();
      _addLog(OperationRecord(
        methodName: 'controlLock(${action.name})',
        duration: DateTime.now().difference(start),
        isSuccess: false,
        errorMessage: e.toString(),
        timestamp: DateTime.now(),
      ));
      if (mounted) {
        toastification.show(
          title: Text('$e'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  void _addLog(OperationRecord record) {
    setState(() => _operationLog.add(record));
  }

  @override
  Widget build(BuildContext context) {
    final lockState = ref.watch(lockNotifierProvider);
    final lockAsync = ref.watch(lockByMacProvider(widget.mac));
    final statusAsync = ref.watch(lockStatusProvider(widget.mac));
    final caps = ref.watch(lockCapabilitiesProvider(widget.mac)).valueOrNull ?? {};

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

    final status = statusAsync.valueOrNull;

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
                  // Section 1: 设备信息
                  DeviceInfoSection(
                    mac: device.mac,
                    batteryLevel: status?.power,
                    switchState: status?.switchState?.name,
                  ),

                  // Section 2: 开关锁控制
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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

                  // Section 3: 快捷操作（能力门控）
                  QuickActionsSection(
                    lockMac: widget.mac,
                    caps: caps,
                    onLog: _addLog,
                  ),

                  // Section 4: 凭据管理（能力门控）
                  if (LockCommand.createPasscode.isVisibleFor(caps) ||
                      LockCommand.addCard.isVisibleFor(caps) ||
                      LockCommand.addFingerprint.isVisibleFor(caps) ||
                      LockCommand.addFace.isVisibleFor(caps) ||
                      LockCommand.addPalmVein.isVisibleFor(caps))
                    CredentialEntrySection(lockMac: widget.mac),

                  // Section 5: 配件入口（能力门控）
                  if (LockCommand.addDoorSensor.isVisibleFor(caps) ||
                      LockCommand.addRemoteKey.isVisibleFor(caps))
                    AccessoryEntrySection(lockMac: widget.mac),

                  // Section 6: 设置入口
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Settings'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => LockSettingsRoute(widget.mac).push(context),
                      ),
                    ),
                  ),

                  // Section 7: 操作记录面板（Developer Mode only）
                  OperationLogPanel(
                    records: _operationLog,
                    onClear: () => setState(() => _operationLog.clear()),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
    );
  }
}
