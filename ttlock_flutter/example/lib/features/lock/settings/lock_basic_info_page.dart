import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/storage/lock_list_provider.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/async_value_view.dart';
import '../../settings/model/saved_lock_device.dart';
import '../capabilities/lock_capabilities_provider.dart';
import '../lock_status_provider.dart';
import 'settings_operation.dart';

class LockBasicInfoPage extends HookConsumerWidget {
  const LockBasicInfoPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));

    return Scaffold(
      appBar: AppBar(title: const Text('Basic Info')),
      body: lockAsync.when(
        loading: () => AsyncValueView.loading(message: 'Loading…'),
        error: (e, _) => AsyncValueView.error(message: '$e'),
        data: (lock) {
          if (lock == null) {
            return AsyncValueView.error(message: 'Lock not found');
          }
          return _LockBasicInfoBody(lockMac: lockMac, lock: lock);
        },
      ),
    );
  }
}

class _LockBasicInfoBody extends HookConsumerWidget {
  const _LockBasicInfoBody({required this.lockMac, required this.lock});

  final String lockMac;
  final SavedLockDevice lock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: lock.name);
    final statusAsync = ref.watch(lockStatusProvider(lockMac));
    final capsAsync = ref.watch(lockCapabilitiesProvider(lockMac));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Lock name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        FilledButton(
          onPressed: () async {
            await runSettingsOperation(
              context,
              action: () => ref.read(lockListNotifierProvider.notifier).updateDevice(
                    lock.copyWith(name: nameController.text.trim()),
                  ),
              successMessage: 'Name saved',
            );
          },
          child: const Text('Save name'),
        ),
        const Divider(height: 32),
        ListTile(
          title: const Text('MAC'),
          subtitle: Text(lock.mac, style: AppTextStyles.codeMedium),
        ),
        ListTile(
          title: const Text('Initialized'),
          subtitle: Text(lock.initializedAt.toLocal().toString()),
        ),
        statusAsync.when(
          loading: () => const ListTile(title: Text('Status'), subtitle: Text('Loading…')),
          error: (e, _) => ListTile(title: const Text('Status'), subtitle: Text('$e')),
          data: (s) => Column(
            children: [
              ListTile(
                title: const Text('Battery'),
                subtitle: Text(s.power != null ? '${s.power}%' : '—'),
              ),
              ListTile(
                title: const Text('Lock state'),
                subtitle: Text(s.switchState?.name ?? '—'),
              ),
              ListTile(
                title: const Text('Lock time'),
                subtitle: Text(
                  s.lockTimeSeconds != null
                      ? DateTime.fromMillisecondsSinceEpoch(
                          s.lockTimeSeconds! * 1000,
                        ).toString()
                      : '—',
                ),
              ),
            ],
          ),
        ),
        FilledButton.tonal(
          onPressed: () async {
            final lockData = lock.lockData;
            await runSettingsOperation(
              context,
              action: () => TTLock.lock.setLockTime(
                    DateTime.now().millisecondsSinceEpoch ~/ 1000,
                    lockData,
                  ),
              successMessage: 'Lock time synced',
            );
            ref.invalidate(lockStatusProvider(lockMac));
          },
          child: const Text('Sync lock time with phone'),
        ),
        const SizedBox(height: 16),
        capsAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (caps) {
            if (!caps.contains(TTLockFunction.getAdminPasscode)) {
              return const SizedBox.shrink();
            }
            return FilledButton(
              onPressed: () async {
                final code = await runSettingsOperation(
                  context,
                  action: () => TTLock.lock.getAdminPasscode(lock.lockData),
                );
                if (code != null && context.mounted) {
                  await Clipboard.setData(ClipboardData(text: code));
                  toastification.show(title: const Text('Admin passcode copied'));
                }
              },
              child: const Text('Copy admin passcode'),
            );
          },
        ),
        const SizedBox(height: 16),
        FutureBuilder(
          future: TTLock.lock.getLockSystemInfo(lock.lockData),
          builder: (context, snap) {
            if (!snap.hasData) {
              return const ListTile(title: Text('System info'), subtitle: Text('Loading…'));
            }
            final info = snap.data!;
            return ExpansionTile(
              title: const Text('System info'),
              children: [
                ListTile(title: const Text('Model'), subtitle: Text(info.modelNum ?? '—')),
                ListTile(title: const Text('Firmware'), subtitle: Text(info.firmwareRevision ?? '—')),
                ListTile(title: const Text('Hardware'), subtitle: Text(info.hardwareRevision ?? '—')),
              ],
            );
          },
        ),
      ],
    );
  }
}
