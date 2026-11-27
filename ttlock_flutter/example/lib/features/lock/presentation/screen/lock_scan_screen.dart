import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock_flutter.dart';
import 'package:ttlock_flutter_demo/core/ble/ble_run.dart';
import 'package:ttlock_flutter_demo/core/loading/global_loading.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/provider/lock_domain.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_scan_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class LockScanScreen extends ConsumerWidget {
  const LockScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final state = ref.watch(lockScanProvider);
    ref.listen(lockScanProvider, (prev, next) async {
      if (next.error != null && prev?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(next.error!, l10n))),
        );
        ref.read(lockScanProvider.notifier).clearError();
      }
      // 加锁成功 → 命名（spec §3.2）→ rename 成功后再 pop 刷列表
      if (next.added != null && prev?.added != next.added) {
        final lock = next.added!;
        final alias = await LockRenameSheetRoute(
          $extra: lock,
        ).push<String>(context);
        if (!context.mounted) return;
        final trimmed = alias?.trim();
        if (trimmed == null || trimmed.isEmpty) {
          Navigator.of(context).pop(false);
          return;
        }
        final renameResult = await ref
            .read(lockDomainProvider.notifier)
            .renameLock(lock.lockId, trimmed)
            .runWithLoading(status: l10n.loading);
        if (!context.mounted) return;
        await renameResult.fold(
          (err) async => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
          ),
          (_) async {
            // WiFi 锁：加锁成功后直接进入配网。探测失败视为非 WiFi 锁，
            // 不阻断 pop（锁已添加成功）。
            var isWifiLock = false;
            try {
              isWifiLock = await runBle(
                () => TTLock.lock.supportFunction(
                  TTLockFunction.wifiLock,
                  lock.lockData,
                ),
              );
            } on Object catch (e, st) {
              log(
                'wifiLock probe failed; skip network page',
                error: e,
                stackTrace: st,
              );
            }
            if (!context.mounted) return;
            if (isWifiLock) {
              await LockWifiRoute(
                lockId: lock.lockId,
                $extra: lock,
              ).push(context);
              if (!context.mounted) return;
            }
            Navigator.of(context).pop(true);
          },
        );
      }
    });
    return Scaffold(
      appBar: AppBar(title: Text(l10n.addLock)),
      body: state.adding != null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 12),
                  Text('${l10n.addingLock} ${state.adding!.lockName}…'),
                ],
              ),
            )
          : state.locks.isEmpty
          ? Center(child: Text(state.scanning ? l10n.scanning : l10n.noLocks))
          : ListView.builder(
              itemCount: state.locks.length,
              itemBuilder: (context, i) {
                final s = state.locks[i];
                final domain = ref.read(lockDomainProvider.notifier);
                final isSupportedScene = domain.isLockScene(
                  s.lockVersion.scene,
                );
                final canAdd = !s.isInited && isSupportedScene;
                final isDisabled = !canAdd;
                return ListTile(
                  leading: Icon(
                    s.isInited ? Icons.lock : Icons.lock_open,
                    color: isDisabled ? Colors.grey : null,
                  ),
                  title: Text(
                    s.lockName,
                    style: isDisabled
                        ? const TextStyle(color: Colors.grey)
                        : null,
                  ),
                  subtitle: Text('${s.lockMac}  RSSI ${s.rssi}'),
                  trailing: Text('${s.electricQuantity}%'),
                  // 不支持 scene / 已初始化：仍响应点击以走 addLock → SnackBar 提示
                  onTap: state.adding != null
                      ? null
                      : () => ref.read(lockScanProvider.notifier).addLock(s),
                );
              },
            ),
    );
  }
}
