import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../core/widgets/async_value_view.dart';
import 'settings_operation.dart';

class LockAdvancedSettingsPage extends HookConsumerWidget {
  const LockAdvancedSettingsPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockAsync = ref.watch(lockByMacProvider(lockMac));

    return Scaffold(
      appBar: AppBar(title: const Text('Advanced')),
      body: lockAsync.when(
        loading: () => AsyncValueView.loading(),
        error: (e, _) => AsyncValueView.error(message: '$e'),
        data: (lock) {
          if (lock == null) {
            return AsyncValueView.error(message: 'Lock not found');
          }
          return _LockAdvancedSettingsBody(lockMac: lockMac, lockData: lock.lockData);
        },
      ),
    );
  }
}

class _LockAdvancedSettingsBody extends HookConsumerWidget {
  const _LockAdvancedSettingsBody({required this.lockMac, required this.lockData});

  final String lockMac;
  final String lockData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floorsController = useTextEditingController(text: '1-10');

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text('Sensitivity'),
        ),
        ...TTSensitivityValue.values.map(
          (v) => ListTile(
            title: Text(v.name),
            onTap: () async {
              if (!context.mounted) return;
              await runSettingsOperation(
                context,
                action: () => TTLock.lock.setSensitivity(v, lockData),
                successMessage: 'Sensitivity set to ${v.name}',
              );
            },
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: floorsController,
            decoration: const InputDecoration(
              labelText: 'Elevator floors (e.g. 1-10)',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FilledButton(
            onPressed: () async {
              if (!context.mounted) return;
              await runSettingsOperation(
                context,
                action: () => TTLock.lock.activateLift(
                      floorsController.text.trim(),
                      lockData,
                    ),
                successMessage: 'Lift activated',
              );
            },
            child: const Text('Activate lift'),
          ),
        ),
        ListTile(
          title: const Text('Door sensors'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => DoorSensorListRoute(lockMac).push(context),
        ),
        ListTile(
          title: const Text('Keypads'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => KeypadListRoute(lockMac).push(context),
        ),
      ],
    );
  }
}
