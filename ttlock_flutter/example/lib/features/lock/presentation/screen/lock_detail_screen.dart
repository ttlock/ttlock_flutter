import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/core/locale/app_message_mapper.dart';
import 'package:ttlock_flutter_demo/core/locale/locale_provider.dart';
import 'package:ttlock_flutter_demo/features/lock/domain/entity/lock.dart';
import 'package:ttlock_flutter_demo/features/lock/presentation/provider/lock_detail_notifier.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';

class LockDetailScreen extends ConsumerWidget {
  const LockDetailScreen({
    super.key,
    required this.lockId,
    this.lock,
  });
  final int lockId;
  final LockEntity? lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extra = lock;
    final l10n = ref.watch(l10nProvider);
    final provider = lockDetailProvider(lockId, extra);
    final state = ref.watch(provider);
    ref.listen(provider, (prev, next) {
      final err = next.value?.error;
      final prevErr = prev?.value?.error;
      if (err != null && err != prevErr) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(getUserFriendlyMessage(err, l10n))),
        );
        ref.read(provider.notifier).clearError();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          state.value?.lock?.lockAlias.isNotEmpty == true
              ? state.value!.lock!.lockAlias
              : (state.value?.lock?.lockName ?? l10n.lockDetail),
        ),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (data) {
          final current = data.lock!;
          final canBle = current.lockData.isNotEmpty;
          // hasGateway 启用远程通道：无 lockData 时仍可远程开关锁，仅 BLE 操作禁用。
          final canOperate = canBle || current.hasGateway;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (!canBle) ...[
                Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: ListTile(
                    key: const Key('incomplete_lock_data'),
                    leading: const Icon(Icons.info_outline),
                    title: Text(l10n.incompleteLockData),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      key: const Key('detail_unlock'),
                      onPressed: data.operating || !canOperate
                          ? null
                          : () => ref.read(provider.notifier).unlock(),
                      icon: const Icon(Icons.lock_open),
                      label: Text(l10n.unlock),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      key: const Key('detail_lock'),
                      onPressed: data.operating || !canOperate
                          ? null
                          : () => ref.read(provider.notifier).lockLock(),
                      icon: const Icon(Icons.lock),
                      label: Text(l10n.lockBtn),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ListTile(
                key: const Key('entry_ekey'),
                leading: const Icon(Icons.vpn_key),
                title: Text(l10n.eKey),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => EkeyListRoute(
                  lockId: lockId,
                  $extra: current,
                ).push(context),
              ),
              if (data.showPasscode)
                ListTile(
                  key: const Key('entry_passcode'),
                  leading: const Icon(Icons.password),
                  title: Text(l10n.passcode),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => PasscodeListRoute(
                    lockId: lockId,
                    $extra: current,
                  ).push(context),
                ),
              if (data.showCard)
                ListTile(
                  key: const Key('entry_card'),
                  leading: const Icon(Icons.credit_card),
                  title: Text(l10n.icCard),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => CardListRoute(
                    lockId: lockId,
                    $extra: current,
                  ).push(context),
                ),
              if (data.showFingerprint)
                ListTile(
                  key: const Key('entry_fingerprint'),
                  leading: const Icon(Icons.fingerprint),
                  title: Text(l10n.fingerprint),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => FingerprintListRoute(
                    lockId: lockId,
                    $extra: current,
                  ).push(context),
                ),
              if (data.showFace)
                ListTile(
                  key: const Key('entry_face'),
                  leading: const Icon(Icons.face),
                  title: Text(l10n.face),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => FaceListRoute(
                    lockId: lockId,
                    $extra: current,
                  ).push(context),
                ),
              if (data.showPalmVein)
                ListTile(
                  key: const Key('entry_palm_vein'),
                  leading: const Icon(Icons.back_hand),
                  title: Text(l10n.palmVein),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => PalmVeinListRoute(
                    lockId: lockId,
                    $extra: current,
                  ).push(context),
                ),
              if (data.showQrCode)
                ListTile(
                  key: const Key('entry_qr'),
                  leading: const Icon(Icons.qr_code),
                  title: Text(l10n.qrCode),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => QrCodeListRoute(
                    lockId: lockId,
                    $extra: current,
                  ).push(context),
                ),
              const Divider(height: 32),
              ListTile(
                leading: const Icon(Icons.receipt_long),
                title: Text(l10n.records),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => LockRecordsRoute(
                  lockId: lockId,
                  $extra: current,
                ).push(context),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(l10n.settings),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final result = await LockSettingsRoute(
                    lockId: lockId,
                    $extra: current,
                  ).push<Object>(context);
                  if (!context.mounted) return;
                  if (result == true) {
                    Navigator.of(context).pop();
                    return;
                  }
                  if (result is LockEntity) {
                    ref.read(provider.notifier).applyLock(result);
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
