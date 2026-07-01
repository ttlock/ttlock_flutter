import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../command/lock_commands.dart';
import '../../../command/operation_record.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/widgets/section_header.dart';
import '../../../providers/ttlock_providers.dart';

class QuickActionsSection extends ConsumerWidget {
  final String lockMac;
  final Set<TTLockFunction> caps;
  final void Function(OperationRecord) onLog;

  const QuickActionsSection({
    super.key,
    required this.lockMac,
    required this.caps,
    required this.onLog,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Quick Actions', icon: Icons.flash_on),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              // 同步时间（始终可用）
              _ActionChip(
                icon: Icons.schedule,
                label: 'Sync Time',
                onTap: () => _syncTime(context, ref),
              ),
              // 系统信息（始终可用）
              _ActionChip(
                icon: Icons.info_outline,
                label: 'System Info',
                onTap: () => _showSystemInfo(context, ref),
              ),
              // 扫描 WiFi（需要 wifiLock 能力）
              if (LockCommand.scanWifi.isVisibleFor(caps))
                _ActionChip(
                  icon: Icons.wifi_find,
                  label: 'Scan WiFi',
                  onTap: () => _scanWifi(context, ref),
                ),
              // 验证锁（始终可用）
              _ActionChip(
                icon: Icons.verified_outlined,
                label: 'Verify',
                onTap: () => _verifyLock(context, ref),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _syncTime(BuildContext context, WidgetRef ref) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final start = DateTime.now();
    try {
      final api = ref.read(lockApiProvider);
      await runLockApi(() => api.setLockTime(
        DateTime.now().millisecondsSinceEpoch ~/ 1000, lock.lockData));
      onLog(OperationRecord(
        methodName: 'setLockTime',
        duration: DateTime.now().difference(start),
        isSuccess: true,
        timestamp: DateTime.now(),
      ));
      if (context.mounted) {
        toastification.show(title: const Text('Time synced'),
            type: ToastificationType.success, autoCloseDuration: const Duration(seconds: 2));
      }
    } catch (e) {
      onLog(OperationRecord(
        methodName: 'setLockTime',
        duration: DateTime.now().difference(start),
        isSuccess: false, errorMessage: e.toString(),
        timestamp: DateTime.now(),
      ));
    }
  }

  Future<void> _showSystemInfo(BuildContext context, WidgetRef ref) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final start = DateTime.now();
    try {
      final api = ref.read(lockApiProvider);
      final info = await runLockApi(() => api.getLockSystemInfo(lock.lockData));
      onLog(OperationRecord(
        methodName: 'getLockSystemInfo',
        duration: DateTime.now().difference(start),
        isSuccess: true, data: info,
        timestamp: DateTime.now(),
      ));
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('System Info'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (info.modelNum != null) Text('Model: ${info.modelNum}'),
                if (info.firmwareRevision != null) Text('Firmware: ${info.firmwareRevision}'),
                if (info.hardwareRevision != null) Text('Hardware: ${info.hardwareRevision}'),
                if (info.electricQuantity != null) Text('Battery: ${info.electricQuantity}%'),
              ],
            ),
            actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
          ),
        );
      }
    } catch (e) {
      onLog(OperationRecord(
        methodName: 'getLockSystemInfo',
        duration: DateTime.now().difference(start),
        isSuccess: false, errorMessage: e.toString(),
        timestamp: DateTime.now(),
      ));
    }
  }

  Future<void> _scanWifi(BuildContext context, WidgetRef ref) async {
    final lock = await ref.read(lockByMacProvider(lockMac).future);
    if (lock == null) return;
    final start = DateTime.now();
    try {
      final api = ref.read(lockApiProvider);
      final wifiInfo = await api.getWifiInfo(lock.lockData);
      onLog(OperationRecord(
        methodName: 'getWifiInfo',
        duration: DateTime.now().difference(start),
        isSuccess: true, data: wifiInfo,
        timestamp: DateTime.now(),
      ));
      if (context.mounted) {
        toastification.show(
          title: Text('WiFi MAC: ${wifiInfo.wifiMac}, RSSI: ${wifiInfo.wifiRssi}'),
          type: ToastificationType.info,
          autoCloseDuration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      onLog(OperationRecord(
        methodName: 'getWifiInfo', duration: DateTime.now().difference(start),
        isSuccess: false, errorMessage: e.toString(),
        timestamp: DateTime.now(),
      ));
    }
  }

  Future<void> _verifyLock(BuildContext context, WidgetRef ref) async {
    final start = DateTime.now();
    try {
      final api = ref.read(lockApiProvider);
      await runLockApi(() => api.verifyLock(lockMac));
      onLog(OperationRecord(
        methodName: 'verifyLock', duration: DateTime.now().difference(start),
        isSuccess: true, timestamp: DateTime.now(),
      ));
      if (context.mounted) {
        toastification.show(title: const Text('Lock verified'),
            type: ToastificationType.success, autoCloseDuration: const Duration(seconds: 2));
      }
    } catch (e) {
      onLog(OperationRecord(
        methodName: 'verifyLock', duration: DateTime.now().difference(start),
        isSuccess: false, errorMessage: e.toString(),
        timestamp: DateTime.now(),
      ));
    }
  }
}

class _ActionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onTap,
    );
  }
}
