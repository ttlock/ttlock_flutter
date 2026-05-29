import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttlock_flutter/ttlock.dart';

import '../../../core/router/routes.dart';
import '../../../core/storage/lock_list_provider.dart';
import '../../../providers/ttlock_providers.dart';
import 'settings_operation.dart';

class LockAdvancedSettingsPage extends ConsumerStatefulWidget {
  const LockAdvancedSettingsPage({super.key, required this.lockMac});

  final String lockMac;

  @override
  ConsumerState<LockAdvancedSettingsPage> createState() =>
      _LockAdvancedSettingsPageState();
}

class _LockAdvancedSettingsPageState extends ConsumerState<LockAdvancedSettingsPage> {
  final _floorsController = TextEditingController(text: '1-10');

  @override
  void dispose() {
    _floorsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lockMac = widget.lockMac;
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text('Sensitivity'),
          ),
          ...TTSensitivityValue.values.map(
            (v) => ListTile(
              title: Text(v.name),
              onTap: () async {
                final lock = await ref.read(lockByMacProvider(lockMac).future);
                if (lock == null) return;
                if (!context.mounted) return;
                await runSettingsOperation(
                  context,
                  action: () => ref.read(lockApiProvider).setSensitivity(v, lock.lockData),
                  successMessage: 'Sensitivity set to ${v.name}',
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _floorsController,
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
                final lock = await ref.read(lockByMacProvider(lockMac).future);
                if (lock == null || !context.mounted) return;
                await runSettingsOperation(
                  context,
                  action: () => ref.read(lockApiProvider).activateLift(
                        _floorsController.text.trim(),
                        lock.lockData,
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
      ),
    );
  }
}
